class CandidatesController < ApplicationController
    def index
      @candidates = Candidate.all
    end

    def new
        @candidate = Candidate.new
    end

    def edit
        @candidate = Candidate.find_by(id: params[:id])
    end

    def create
        @candidate = Candidate.new(candidate_params)
    
        if @candidate.save
          # 成功
          redirect_to candidates_path, notice: "新增候選人成功!"
        else
          # 失敗
          render :new
        end
    end

    def update
      @candidate = Candidate.find_by(id: params[:id])
  
      if @candidate.update(candidate_params)
        # 成功
        redirect_to candidates_path, notice: "資料更新成功!"
      else
        # 失敗
        render :edit
      end
    end

    def vote
      @candidate = Candidate.find_by(id: params[:id])
      @candidate.vote_logs.create(ip_address: request.remote_ip) if @candidate
      redirect_to candidates_path, notice: "完成投票!"
    end
    
    # destroy and show 有問題待修復
    def destroy
      @candidate = Candidate.find_by(id: params[:id])
      @candidate.destroy if @candidate
      redirect_to candidates_path, notice: "候選人資料已刪除!"
    end

    def show
      @candidate = Candidate.find_by(id: params[:id])
      @candidate.destroy if @candidate
      redirect_to candidates_path, notice: "候選人資料已刪除!"
    end

    private
    def candidate_params
      params.require(:candidate).permit(:name, :age, :party, :politics)
    end
end