Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190221101944.19711-1-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <c904bd88-a4d1-f474-6bb9-e88c1e1587eb@intel.com>
Date: Thu, 21 Feb 2019 08:08:04 -0800
MIME-Version: 1.0
In-Reply-To: <20190221101944.19711-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/2] lib: Only require we
 have i915.reset module parameter for allow-hang
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMS8wMi8xOSAwMjoxOSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFRvIGNvbnRyb2wgaGFu
ZyBkZXRlY3Rpb24sIHdlIG1hbmlwdWxhdGUgdGhlIGk5MTUucmVzZXQgbW9kdWxlCj4gcGFyYW1l
dGVyLiBIb3dldmVyLCB0byBiZSBuaWNlIHdlIHNob3VsZCBTS0lQIGlmIHdlIGNhbm5vdCBtb2Rp
ZnkgdGhlCj4gcGFyYW1ldGVyIGFzIG9wcG9zZWQgdG8gb3V0cmlnaHQgRkFJTGluZy4KPiAKPiBS
ZWZlcmVuY2VzOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0x
MDg4OTEKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KPiAtLS0KPiAgIGxpYi9pZ3RfZ3QuYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2ln
dF9ndC5jIGIvbGliL2lndF9ndC5jCj4gaW5kZXggNjQ2Njk2NzI3Li5jOThhNzU1M2IgMTAwNjQ0
Cj4gLS0tIGEvbGliL2lndF9ndC5jCj4gKysrIGIvbGliL2lndF9ndC5jCj4gQEAgLTE3Niw4ICsx
NzYsOCBAQCBpZ3RfaGFuZ190IGlndF9hbGxvd19oYW5nKGludCBmZCwgdW5zaWduZWQgY3R4LCB1
bnNpZ25lZCBmbGFncykKPiAgIAlpZiAoIWlndF9jaGVja19ib29sZWFuX2Vudl92YXIoIklHVF9I
QU5HX1dJVEhPVVRfUkVTRVQiLCBmYWxzZSkpCj4gICAJCWlndF9yZXF1aXJlKGhhc19ncHVfcmVz
ZXQoZmQpKTsKPiAgIAo+IC0JaWd0X2Fzc2VydChpZ3Rfc3lzZnNfc2V0X3BhcmFtZXRlcgo+IC0J
CSAgIChmZCwgInJlc2V0IiwgIiVkIiwgSU5UX01BWCAvKiBhbnkgcmVzZXQgbWV0aG9kICovKSk7
Cj4gKwlpZ3RfcmVxdWlyZShpZ3Rfc3lzZnNfc2V0X3BhcmFtZXRlcgo+ICsJCSAgICAoZmQsICJy
ZXNldCIsICIlZCIsIElOVF9NQVggLyogYW55IHJlc2V0IG1ldGhvZCAqLykpOwoKSG93IGNvbWUg
d2Ugd2VyZSBub3QgYWJsZSB0byB3cml0ZSB0aGF0IHBhcmFtZXRlcj8gSXNuJ3QgdGhhdCBzeXNm
cyAKYWx3YXlzIHRoZXJlPwoKQW50b25pbwoKPiAgIAo+ICAgCWlmICgoZmxhZ3MgJiBIQU5HX0FM
TE9XX0NBUFRVUkUpID09IDApIHsKPiAgIAkJcGFyYW0ucGFyYW0gPSBJOTE1X0NPTlRFWFRfUEFS
QU1fTk9fRVJST1JfQ0FQVFVSRTsKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2
