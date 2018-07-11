Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 11 Jul 2018 10:58:03 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20180711085803.gw4nooa4za77b65l@mwiniars-main.ger.corp.intel.com>
References: <20180711084619.27634-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180711084619.27634-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/2] lib/kmod: Fail if the
 module is already loaded
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTEsIDIwMTggYXQgMDk6NDY6MThBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IElmIHdlIHdhbnQgdG8gc2V0IG5ldyBtb2R1bGUgb3B0aW9ucywgd2UgbXVzdCBsb2Fk
IHRoZSBtb2R1bGUgb3IgZGllCj4gdHJ5aW5nLiBXZSBtYXkgd2FudCB0byBhbHdheXMgZmFpbCBp
ZiB0aGUgbW9kdWxlIGlmIGFscmVhZHkgbG9hZGVkLCBidXQKPiBmb3Igbm93LCB0YWtlIHRoZSBz
bWFsbCBpbmNyZW1lbnRhbCBzdGVwIGFuZCBpbnNpc3QgdGhhdCB0aGUgb3B0aW9ucyBhcmUKPiBz
ZXQgaWYgcmVxdWVzdGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgoKUmV2aWV3ZWQtYnk6IE1pY2hhxYIgV2luaWFyc2tpIDxtaWNo
YWwud2luaWFyc2tpQGludGVsLmNvbT4KCi1NaWNoYcWCCgo+IC0tLQo+ICBsaWIvaWd0X2ttb2Qu
YyB8IDggKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ttb2QuYyBiL2xpYi9pZ3Rfa21vZC5j
Cj4gaW5kZXggNGY3MGUzMGQ5Li5mM2YzNGE2MmQgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9rbW9k
LmMKPiArKysgYi9saWIvaWd0X2ttb2QuYwo+IEBAIC0xNDEsNyArMTQxLDEzIEBAIG91dDoKPiAg
Cj4gIHN0YXRpYyBpbnQgbW9kcHJvYmUoc3RydWN0IGttb2RfbW9kdWxlICprbW9kLCBjb25zdCBj
aGFyICpvcHRpb25zKQo+ICB7Cj4gLQlyZXR1cm4ga21vZF9tb2R1bGVfcHJvYmVfaW5zZXJ0X21v
ZHVsZShrbW9kLCAwLCBvcHRpb25zLAo+ICsJdW5zaWduZWQgaW50IGZsYWdzOwo+ICsKPiArCWZs
YWdzID0gMDsKPiArCWlmIChvcHRpb25zKSAvKiBmb3JjZSBhIGZyZXNoIGxvYWQgdG8gc2V0IHRo
ZSBuZXcgb3B0aW9ucyAqLwo+ICsJCWZsYWdzIHw9IEtNT0RfUFJPQkVfRkFJTF9PTl9MT0FERUQ7
Cj4gKwo+ICsJcmV0dXJuIGttb2RfbW9kdWxlX3Byb2JlX2luc2VydF9tb2R1bGUoa21vZCwgZmxh
Z3MsIG9wdGlvbnMsCj4gIAkJCQkJICAgICAgIE5VTEwsIE5VTEwsIE5VTEwpOwo+ICB9Cj4gIAo+
IC0tIAo+IDIuMTguMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdAo+IEludGVsLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
