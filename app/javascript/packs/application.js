import "bootstrap";
import "../plugins/flatpickr";
import { hideFlashAfter5sec } from '../components/flashes';
import { displayPrice } from '../components/total_price';
import '../components/tabs';
hideFlashAfter5sec();
displayPrice();
