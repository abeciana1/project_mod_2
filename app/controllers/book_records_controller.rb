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
        @book_record = BookRecord.create(book_record_params)
        lookup = BookRecord.populate(@book_record.isbn13)
        if lookup
            @book_record.update(lookup)
        else 
            @book_record.isbn="flt"+Time.now.to_i.to_s
            @book_record.isbn13="flt"+Time.now.to_i.to_s
            @book_record.save
        end
        if @book_record.valid?
            flash[:book]=[@book_record,"Please add #{@book_record.title} to a Pergola"]
            redirect_to new_book_path
        else
            flash[:my_errors] = @book_record.errors.full_messages
            redirect_to new_book_record_path
        end
    end

    def edit
    end

    def update
        @book_record.update(book_record_params)
        # byebug
        if @book_record.valid?
            # byebug
            # @book_record.save
            redirect_to @book_record
        else
            flash[:my_errors] = @book_record.errors.full_messages
            redirect_to edit_book_record_path
        end
    end

    def destroy
        @book_record.destroy
        # @book_record
        # byebug
        # @book_record.delete
        redirect_to book_records_path
    end
    
    private
        
    def find_book_record
        @book_record = BookRecord.find(params[:id])
    end
    
    def book_record_params
        params.require(:book_record).permit(:title,:author,:synopsis,:img_url,:featured,:isbn13,:isbn)
    end

end
