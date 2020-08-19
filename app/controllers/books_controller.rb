class BooksController < ApplicationController

    def new
        @book = Book.new
        @book_records=BookRecord.all
        @pergolas=Pergola.all
    end

    def create
        @book = Book.create(book_params)
        if @book.valid?
        redirect_to pergola_path(@book.pergola)
        else
        flash[:errors] = @book.errors.full_messages
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
