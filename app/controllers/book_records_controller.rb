class BookRecordsController < ApplicationController
    before_action :find_book_record, only: [:show, :edit, :update, :destroy]
    
    def index
        @book_records = BookRecord.search(params[:query])
    end
    
    def new
        @book_record = BookRecord.new
    end
    
    def show; end
    
    def create
        # session[:params]=book_record_params[:isbn13]
        # isbn13 = BookRecord.populate(book_record_params[:isbn13])
        # lookup = BookRecord.populate(@book_record.isbn13)
        byebug
        # if isbn13 !=false
        #     book_record_params=isbn13
        # end
        @book_record = BookRecord.create(book_record_params)
        lookup = BookRecord.populate(@book_record.isbn13)
        @book_record.update(lookup)
        if @book_record.valid?
            redirect_to edit_book_record_path(@book_record)
        else
            flash[:my_errors] = @book_record.errors.full_messages
            redirect_to new_book_record_path
        end
    end

    def edit;end

    def update
        if @book_record.update(book_record_params)
            redirect_to @book_record
        else
            flash[:my_errors] = @book_record.errors.full_messages
            redirect_to edit_book_record_path
        end
    end

    def destroy
        @book_record.destroy
        redirect_to book_records_path
    end
    
    private
        
    def find_book_record
        @book_record = BookRecord.find(params[:id])
    end
    
    def book_record_params
        params.require(:book_record).permit(:title,:author,:synopsis,:img_url,:isbn13,:isbn)
    end

end
