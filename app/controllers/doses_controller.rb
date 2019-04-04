class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.find(params[:id])
  end

  def update
    @dose = Dose.find(params[:id])
    @dose.update(dose_params)
    if @dose.save
      redirect_to cocktail_path
    else
      render :edit
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
