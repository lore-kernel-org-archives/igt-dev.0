Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BE26EF13
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2019 10:58:16 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Fri, 13 Sep 2019 10:58:13 +0000
Message-ID: <0eacd61ec9d36f7c53ac798e7fa58c6aec1fd0cb.camel@intel.com>
References: <20190913102340.4784-1-simon.ser@intel.com>
 <20190913104219.GR4019@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20190913104219.GR4019@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-ID: <A49B8BE4B5B446429BB27048D93DFE67@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_eld: fix eld_is_supported
 failing if not supported
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA5LTEzIGF0IDEzOjQyICswMzAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOg0K
PiBPbiBGcmksIFNlcCAxMywgMjAxOSBhdCAwMToyMzo0MFBNICswMzAwLCBTaW1vbiBTZXIgd3Jv
dGU6DQo+ID4gV2hlbiBnbG9iKDMpIGRvZXNuJ3QgZmluZCBhbnkgcmVzdWx0cywgaXQgcmV0dXJu
cyBHTE9CX05PTUFUQ0guDQo+ID4gSSd2ZSBiZWVuDQo+ID4gY29uZnVzZWQgYnkgR0xPQl9OT0NI
RUNLJ3MgZGVzY3JpcHRpb24gYW5kIHRob3VnaHQgaXQgd291bGQgcmV0dXJuDQo+ID4gMC4NCj4g
PiANCj4gPiBJbnN0ZWFkIG9mIGZhaWxpbmcgb24gdGhlIGFzc2VydCwgcmV0dXJuIHRoYXQgRUxE
cyBhcmVuJ3Qgc3VwcG9ydGVkDQo+ID4gaW4gY2FzZQ0KPiA+IHRoZXJlJ3Mgbm8gbWF0Y2guDQo+
ID4gDQo+ID4gV2hpbGUgYXQgaXQsIGFsc28gaW5jbHVkZSBnbG9iJ3MgcmV0dXJuIHZhbHVlIGlu
IHRoZSBhc3NlcnQNCj4gPiBtZXNzYWdlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFNpbW9u
IFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4NCj4gPiBGaXhlczogMzM3NGNkMGIwNDhmICgibGli
L2lndF9lbGQ6IGludHJvZHVjZSBlbGRfaXNfc3VwcG9ydGVkIikNCj4gPiBDYzogUGV0cmkgTGF0
dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gDQo+ID4gU29ycnkg
YWJvdXQgdGhlIGZ1c3MuDQo+ID4gDQo+ID4gIGxpYi9pZ3RfZWxkLmMgfCA5ICsrKysrKy0tLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9saWIvaWd0X2VsZC5jIGIvbGliL2lndF9lbGQuYw0KPiA+IGlu
ZGV4IDVkMWQ4ZTAxY2QzMy4uMjNlYmY2MzA1YWUwIDEwMDY0NA0KPiA+IC0tLSBhL2xpYi9pZ3Rf
ZWxkLmMNCj4gPiArKysgYi9saWIvaWd0X2VsZC5jDQo+ID4gQEAgLTI3MCwxMSArMjcwLDE0IEBA
IGJvb2wgZWxkX2hhc19pZ3Qodm9pZCkNCj4gPiAgYm9vbCBlbGRfaXNfc3VwcG9ydGVkKHZvaWQp
DQo+ID4gIHsNCj4gPiAgCWdsb2JfdCBnbG9iX2J1ZiA9IHswfTsNCj4gPiArCWludCByZXQ7DQo+
ID4gIAlib29sIGhhc19lbGRzOw0KPiA+IA0KPiA+IC0JaWd0X2Fzc2VydF9mKGdsb2IoIi9wcm9j
L2Fzb3VuZC9jYXJkKi8iIEVMRF9QUkVGSVggIioiLA0KPiA+IC0JCQkgIEdMT0JfTk9TT1JULCBO
VUxMLCAmZ2xvYl9idWYpID09IDAsDQo+ID4gLQkJICAgICAiZ2xvYiBmYWlsZWRcbiIpOw0KPiA+
ICsJcmV0ID0gZ2xvYigiL3Byb2MvYXNvdW5kL2NhcmQqLyIgRUxEX1BSRUZJWCAiKiIsDQo+ID4g
KwkJICAgR0xPQl9OT1NPUlQsIE5VTEwsICZnbG9iX2J1Zik7DQo+ID4gKwlpZiAocmV0ID09IEdM
T0JfTk9NQVRDSCkNCj4gPiArCQlyZXR1cm4gZmFsc2U7DQo+ID4gKwlpZ3RfYXNzZXJ0X2YocmV0
ID09IDAsICJnbG9iIGZhaWxlZDogJWRcbiIsIHJldCk7DQo+IA0KPiBSZXZpZXdlZC1ieTogUGV0
cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+DQoNClRoYW5rcyBmb3IgdGhlIHJl
dmlldy4gUGxlYXNlIG1lcmdlIHlvdXJzZWxmIHdoZW4gQ0kgc2F5cyBpdCdzIGZpbmUsIEkNCndv
bid0IGJlIHRoZXJlIHRvIGRvIGl0Lg0KDQo+IA0KPiA+ICAJaGFzX2VsZHMgPSBnbG9iX2J1Zi5n
bF9wYXRoYyA+IDA7DQo+ID4gIAlnbG9iZnJlZSgmZ2xvYl9idWYpOw0KPiA+IA0KPiA+IC0tDQo+
ID4gMi4yMy4wDQo+ID4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
