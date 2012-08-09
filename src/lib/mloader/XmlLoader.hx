/**
Copyright (c) 2012 Massive Interactive

Permission is hereby granted, free of charge, to any person obtaining a copy of 
this software and associated documentation files (the "Software"), to deal in 
the Software without restriction, including without limitation the rights to 
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
of the Software, and to permit persons to whom the Software is furnished to do 
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
SOFTWARE.
*/

package mloader;

import mloader.Loader;
import msignal.EventSignal;

/**
The XmlLoader is an extension of the HttpLoader. It's responsible for loading 
Xml resources. If the format of the Xml file is incorrect the a failed event is 
dispatched indicting the nature of the fault.
*/
class XmlLoader extends HttpLoader<Xml>
{
	/**
	@param url  the url to load the resource from
	@param http optional Http instance to use for the load request
	*/
	public function new(?url:String, ?http:haxe.Http)
	{
		super(url, http);
	}

	override function httpData(data:String)
	{
		try
		{
			content = Xml.parse(data);
		}
		catch (e:Dynamic)
		{
			loaderFail(Format(Std.string(e)));
			return;
		}
		
		loaderComplete();
	}
}
