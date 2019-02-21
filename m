Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <c904bd88-a4d1-f474-6bb9-e88c1e1587eb@intel.com>
References: <20190221101944.19711-1-chris@chris-wilson.co.uk>
 <c904bd88-a4d1-f474-6bb9-e88c1e1587eb@intel.com>
Message-ID: <155076549435.25312.16357292185690203854@skylake-alporthouse-com>
Date: Thu, 21 Feb 2019 16:11:34 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/2] lib: Only require we
 have i915.reset module parameter for allow-hang
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMjEgMTY6MDg6MDQpCj4gCj4gCj4g
T24gMjEvMDIvMTkgMDI6MTksIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFRvIGNvbnRyb2wgaGFu
ZyBkZXRlY3Rpb24sIHdlIG1hbmlwdWxhdGUgdGhlIGk5MTUucmVzZXQgbW9kdWxlCj4gPiBwYXJh
bWV0ZXIuIEhvd2V2ZXIsIHRvIGJlIG5pY2Ugd2Ugc2hvdWxkIFNLSVAgaWYgd2UgY2Fubm90IG1v
ZGlmeSB0aGUKPiA+IHBhcmFtZXRlciBhcyBvcHBvc2VkIHRvIG91dHJpZ2h0IEZBSUxpbmcuCj4g
PiAKPiA+IFJlZmVyZW5jZXM6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcu
Y2dpP2lkPTEwODg5MQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Cj4gPiAtLS0KPiA+ICAgbGliL2lndF9ndC5jIHwgNCArKy0tCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS9saWIvaWd0X2d0LmMgYi9saWIvaWd0X2d0LmMKPiA+IGluZGV4IDY0NjY5
NjcyNy4uYzk4YTc1NTNiIDEwMDY0NAo+ID4gLS0tIGEvbGliL2lndF9ndC5jCj4gPiArKysgYi9s
aWIvaWd0X2d0LmMKPiA+IEBAIC0xNzYsOCArMTc2LDggQEAgaWd0X2hhbmdfdCBpZ3RfYWxsb3df
aGFuZyhpbnQgZmQsIHVuc2lnbmVkIGN0eCwgdW5zaWduZWQgZmxhZ3MpCj4gPiAgICAgICBpZiAo
IWlndF9jaGVja19ib29sZWFuX2Vudl92YXIoIklHVF9IQU5HX1dJVEhPVVRfUkVTRVQiLCBmYWxz
ZSkpCj4gPiAgICAgICAgICAgICAgIGlndF9yZXF1aXJlKGhhc19ncHVfcmVzZXQoZmQpKTsKPiA+
ICAgCj4gPiAtICAgICBpZ3RfYXNzZXJ0KGlndF9zeXNmc19zZXRfcGFyYW1ldGVyCj4gPiAtICAg
ICAgICAgICAgICAgIChmZCwgInJlc2V0IiwgIiVkIiwgSU5UX01BWCAvKiBhbnkgcmVzZXQgbWV0
aG9kICovKSk7Cj4gPiArICAgICBpZ3RfcmVxdWlyZShpZ3Rfc3lzZnNfc2V0X3BhcmFtZXRlcgo+
ID4gKyAgICAgICAgICAgICAgICAgKGZkLCAicmVzZXQiLCAiJWQiLCBJTlRfTUFYIC8qIGFueSBy
ZXNldCBtZXRob2QgKi8pKTsKPiAKPiBIb3cgY29tZSB3ZSB3ZXJlIG5vdCBhYmxlIHRvIHdyaXRl
IHRoYXQgcGFyYW1ldGVyPyBJc24ndCB0aGF0IHN5c2ZzIAo+IGFsd2F5cyB0aGVyZT8KCk5vLiBJ
dCBjYW4gYmUgY29tcGlsZWQgb3V0LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
