require "rails_helper"

RSpec.describe OrdersController, type: :controller do
  describe "GET #print_receipt" do
    before do
      request.headers.merge!({"Accept" => "application/json",  "Content-Type" => "application/json"})
      get :print_receipt, params: {id: order_id}
    end

    context "First case of input" do
      let(:order_id){orders(:first_order).id}

      it "should response receipt detail" do
        json_response = JSON.parse(response.body)
        chocolate_bar = json_response["line_items"].find{|h| h["product_name"] == "chocolate bar"}
        book = json_response["line_items"].find{|h| h["product_name"] == "book"}
        music_cd = json_response["line_items"].find{|h| h["product_name"] == "music cd"}

        expect(book["quantity"]).to eq 1
        expect(book["total_price"]).to eq 12.49
        expect(music_cd["quantity"]).to eq 1
        expect(music_cd["total_price"]).to eq 16.49
        expect(chocolate_bar["quantity"]).to eq 1
        expect(chocolate_bar["total_price"]).to eq 0.85
      end
    end

    context "Second case of input" do
      let(:order_id){orders(:second_order).id}

      it "should response receipt detail" do
        json_response = JSON.parse(response.body)
        imported_box_of_chocolates = json_response["line_items"].find{|h| h["product_name"] == "imported box of chocolates"}
        imported_bottle_of_perfume = json_response["line_items"].find{|h| h["product_name"] == "imported bottle of perfume"}

        expect(imported_box_of_chocolates["quantity"]).to eq 1
        expect(imported_box_of_chocolates["total_price"]).to eq 10.50
        expect(imported_bottle_of_perfume["quantity"]).to eq 1
        expect(imported_bottle_of_perfume["total_price"]).to eq 54.65
      end
    end

    context "Third case of input" do
      let(:order_id){orders(:third_order).id}

      it "should response receipt detail" do
        json_response = JSON.parse(response.body)
        imported_bottle_of_perfume = json_response["line_items"].find{|h| h["product_name"] == "imported bottle of perfume"}
        bottle_of_perfume = json_response["line_items"].find{|h| h["product_name"] == "bottle of perfume"}
        packet_of_headache_pills = json_response["line_items"].find{|h| h["product_name"] == "packet of headache pills"}
        imported_box_of_chocolates = json_response["line_items"].find{|h| h["product_name"] == "imported box of chocolates"}

        expect(imported_bottle_of_perfume["quantity"]).to eq 1
        expect(imported_bottle_of_perfume["total_price"]).to eq 32.19
        expect(bottle_of_perfume["quantity"]).to eq 1
        expect(bottle_of_perfume["total_price"]).to eq 20.89
        expect(packet_of_headache_pills["quantity"]).to eq 1
        expect(packet_of_headache_pills["total_price"]).to eq 9.75
        expect(imported_box_of_chocolates["quantity"]).to eq 1
        expect(imported_box_of_chocolates["total_price"]).to eq 11.85
      end
    end
  end
end
