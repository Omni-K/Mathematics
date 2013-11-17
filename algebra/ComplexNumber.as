package algebra
{
	
	/**
	 * ...
	 * @author Nikolay Putko
	 */
	
	public class ComplexNumber
	{
		public var r:Number = 0;
		public var i:Number = 0;
		
		function ComplexNumber(real:Number, imaginary:Number)
		{
			r = real;
			i = imaginary;
		}
		
		public function add(im:ComplexNumber):ComplexNumber
		{
			return new ComplexNumber(this.r + im.r, this.i + im.i);
		}
		
		public function subtract(im:ComplexNumber):ComplexNumber
		{
			return new ComplexNumber(this.r - im.r, this.i - im.i);
		}
		
		public function equals(im:ComplexNumber):Boolean
		{
			return ((this.r == im.r) && (this.i == im.i));
		}
		
		public function multiply(im:ComplexNumber):ComplexNumber
		{
			return new ComplexNumber(this.r * im.r - this.i * im.i, this.i * im.r + this.r * im.i);
		}
		
		public function divide(im:ComplexNumber):ComplexNumber
		{
			var c:ComplexNumber = this.multiply(im.conjugate());
			var d:Number = im.r * im.r + im - i * im.i;
			return new ComplexNumber(c.r / d, c.i / d);
		}
		
		public function conjugate():ComplexNumber
		{
			return new ComplexNumber(this.r, -this.i);
		}
		
		public function argument():Number
		{
			return Math.atan2(this.i, this.r);
		}
		
		public function abs():Number
		{
			return Math.sqrt(this.i * this.i + this.r * this.r);
		}
		
		public function sqrt():ComplexNumber
		{
			if (this.i == 0)
			{
				var err:Error = new Error("This function works only with complex numbers. If imaginary part = 0 use Math.sqrt instead.", 0);
				err.getStackTrace();
			}
			var result_r:Number = Math.sqrt((this.r + this.abs()) / 2);
			
			var result_i:Number = this.i / Math.abs(this.i) * (Math.sqrt((this.abs() - this.r) / 2));
			
			return new ComplexNumber(result_r, result_i);
		}
		
		public override function toString():String
		{
			if (this.r == 0 && this.i == 0)
				return "0";
			var s = "";
			if (this.r != 0)
				s += this.r;
			if (this.i > 0 && this.r != 0)
				s += "+";
			if (this.i == 1)
			{
				s += "i";
				return s;
			}
			if (this.i == -1)
			{
				s += "-i";
				return s;
			}
			if (this.i != 0)
				s += this.i + "i";
			return s;
		}
	}
}