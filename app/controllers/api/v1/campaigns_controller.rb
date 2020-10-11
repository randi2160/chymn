module Api
    module V1
        class CampaignsController < SecuredController
            skip_before_action :authorize_request, only: [:index, :show]
            def index
                campaigns = Campaign.order('created_at DESC');
                render json: {status: 'SUCCESS', message: 'Loaded campaigns', data:campaigns},status: :ok
            end
            
            def show
                campaign = Campaign.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded campaign', data:campaign},status: :ok
            rescue ActiveRecord::RecordNotFound
               head :not_found
            end
            
            def create
                campaign = Campaign.new(campaign_params)
                if campaign.save
                    render json: {status: 'SUCCESS', message: 'Saved Campaign', data:campaign},status: :ok
                else 
                    render json: {status: 'ERROR', message: 'Campaign Not saved', 
                    data:campaign.error},status: :unprocessable_entity
                end
            end
            
            def destroy
                campaign = Campaign.find(params[:id])
                campaign.destroy
                render json: {status: 'SUCCESS', message: 'Deleted campaign', data:campaign},status: :ok
                head :no_content
            end
        
            def update
                campaign = Campaign.find(params[:id])
                if campaign.update_attributes(campaign_params)
                    render json: {status: 'SUCCESS', message: 'updated Campaign', data:campaign},status: :ok
                else 
                    render json: {status: 'ERROR', message: 'Campaign Not Updated', 
                    data:campaign.error},status: :unprocessable_entity
                end
                          
            end
            
            private
            
            def campaign_params
                params.permit(:title, :description, :published)
            end
            
        end
    end
end
