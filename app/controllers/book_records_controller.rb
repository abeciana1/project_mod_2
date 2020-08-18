class BookRecordsController < ApplicationController
    before_action :find_book_record, only: [:show, :edit, :update, :delete]
    
    def index
        @book_records = BookRecord.search(params[:query])
    end
    
    def new
        @book_record = BookRecord.new
    end
    
    def show; end
    
    def create
        @book_record = BookRecords.new(book_record_params)
        if @book_record.valid?
        @book_record.save
        redirect_to book_record_path(@book_record)
        else
        flash[:my_errors] = @book_record.errors.full_messages
        redirect_to new_book_record_path
        end
    end
    
    private
        
    def find_book_record
        @book_record = book_record.find(params[:id])
    end
    
    def book_records_params
        params.require(:book_records).permit(:title,:author,:synopsis,:img_url,:isbn13)
    end

end
