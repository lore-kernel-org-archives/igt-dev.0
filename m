Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9656B6E5BF
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Nov 2018 18:31:52 +0000 (UTC)
Date: Fri, 2 Nov 2018 20:31:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20181102183148.GB9144@intel.com>
References: <20181026120305.18672-1-stanislav.lisovskiy@intel.com>
 <1554118f-088c-4a2b-d258-765a15b15c58@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1554118f-088c-4a2b-d258-765a15b15c58@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/igt_fb: Fix unused variable buf.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, igt-dev@lists.freedesktop.org, ville.syrjala@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjYsIDIwMTggYXQgMDU6NTc6MTZQTSArMDIwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gT3AgMjYtMTAtMTggb20gMTQ6MDMgc2NocmVlZiBTdGFuaXNsYXYgTGlzb3Zz
a2l5Ogo+ID4gRGVzcGl0ZSB0aGUgY29tbWVudCB0ZW1wb3JhcnkgYnVmIGlzIG5vdAo+ID4gdXNl
ZCBhbnl3aGVyZSBpbiBjb252ZXJ0X252MTJfdG9fcmdiMjQsCj4gPiBzbyBpdCBoYXMgdG8gYmUg
ZWl0aGVyIHJlbW92ZWQgb3IgdXNlZCBpbnN0ZWFkCj4gPiBvZiBjdnQtPnNyYy5wdHIuCj4gPgo+
ID4gdjI6IFB1dCBpdCBpbiB1c2UgaW5zdGVhZCBvZiByZW1vdmluZyBhcyBvdGhlcgo+ID4gZnVu
Y3Rpb25zIHNlZW0gdG8gdXNlIGl0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFN0YW5pc2xhdiBM
aXNvdnNraXkgPHN0YW5pc2xhdi5saXNvdnNraXlAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgbGli
L2lndF9mYi5jIHwgNCArKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2ln
dF9mYi5jCj4gPiBpbmRleCA0NzAwYjE1Mi4uNWU3NzVjNDQgMTAwNjQ0Cj4gPiAtLS0gYS9saWIv
aWd0X2ZiLmMKPiA+ICsrKyBiL2xpYi9pZ3RfZmIuYwo+ID4gQEAgLTE1MzgsOCArMTUzOCw4IEBA
IHN0YXRpYyB2b2lkIGNvbnZlcnRfbnYxMl90b19yZ2IyNChzdHJ1Y3QgZmJfY29udmVydCAqY3Z0
KQo+ID4gIAkgKiBmcm9tIHRoZXJlLgo+ID4gIAkgKi8KPiA+ICAJaWd0X21lbWNweV9mcm9tX3dj
KGJ1ZiwgY3Z0LT5zcmMucHRyLCBjdnQtPnNyYy5mYi0+c2l6ZSk7Cj4gPiAtCXkgPSBjdnQtPnNy
Yy5wdHIgKyBjdnQtPnNyYy5mYi0+b2Zmc2V0c1swXTsKPiA+IC0JdXYgPSBjdnQtPnNyYy5wdHIg
KyBjdnQtPnNyYy5mYi0+b2Zmc2V0c1sxXTsKPiA+ICsJeSA9IGJ1ZiArIGN2dC0+c3JjLmZiLT5v
ZmZzZXRzWzBdOwo+ID4gKwl1diA9IGJ1ZiArIGN2dC0+c3JjLmZiLT5vZmZzZXRzWzFdOwo+ID4g
IAo+ID4gIAlmb3IgKGkgPSAwOyBpIDwgY3Z0LT5kc3QuZmItPmhlaWdodCAvIDI7IGkrKykgewo+
ID4gIAkJZm9yIChqID0gMDsgaiA8IGN2dC0+ZHN0LmZiLT53aWR0aCAvIDI7IGorKykgewo+IAo+
IE11Y2ggYmV0dGVyIQo+IAo+IFJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgoKUHVzaGVkLiBUaGFua3MgZm9yIHRoZSBwYXRj
aCBhbmQgcmV2aWV3LgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
