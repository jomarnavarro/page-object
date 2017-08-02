require 'spec_helper'
require 'page-object/elements'

describe PageObject::Elements::OrderedList do
  let(:ol) { PageObject::Elements::OrderedList }

  describe "interface" do
    let(:ol_element) { double('ol_element') }

    it "should register as tag_name :ol" do
      expect(::PageObject::Elements.element_class_for(:ol)).to eql ::PageObject::Elements::OrderedList
    end

    context "for watir" do
      it "should return a list item when indexed" do
        ol = PageObject::Elements::OrderedList.new(ol_element)
        expect(ol_element).to receive(:ols).
                               and_return([ol_element, ol_element])
        ol[1]
      end

      it "should know how many list items it contains" do
        ol = PageObject::Elements::OrderedList.new(ol_element)
        expect(ol_element).to receive(:ols).and_return([ol_element])
        expect(ol.items).to eql 1
      end

      it "should iterate over the list items" do
        ol = PageObject::Elements::OrderedList.new(ol_element)
        expect(ol).to receive(:items).and_return(5)
        allow(ol).to receive(:[])
        count = 0
        ol.each { |item| count += 1 }
        expect(count).to eql 5
      end
    end
  end
end
