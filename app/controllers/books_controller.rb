class BooksController < ApplicationController
    before_action :authorized_admin

    def new
        @book = Book.new
        @book_records=BookRecord.all
        @pergolas=Pergola.all
    end

    def index
        @books=Book.all
    end

    def create
        @book = Book.find_or_create_by(book_params)
        if @book.valid?
        redirect_to pergola_path(@book.pergola)
        else
        flash[:errors] = @book.errors.full_messages
        flash[:old_book]=Book.all.find_by(book_record_id:@book.book_record_id,pergola_id:@book.pergola_id)
        redirect_to new_book_path
        end
    end

    def edit
        @book=Book.find(params[:id])
        @book_records=[@book.book_record]
        @pergolas=[@book.pergola]
    end

    def update
        @book=Book.find(params[:id])
        if @book.update(book_params)
            redirect_to @book.pergola
        else
            flash[:errors] = @book.errors.full_messages
            redirect_to edit_book_path
        end
    end

    private
    
    def book_params
        params.require(:book).permit(:count,:pergola_id,:book_record_id,:user_id)
    end
end
