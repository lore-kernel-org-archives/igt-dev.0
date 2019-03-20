Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190320192629.GW3888@intel.com>
References: <20190320160151.32659-1-chris@chris-wilson.co.uk>
 <20190320192629.GW3888@intel.com>
Message-ID: <155311430330.15790.18050365277609091643@skylake-alporthouse-com>
Date: Wed, 20 Mar 2019 20:38:23 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_shrink: Open the device before
 using it!
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqw6Rsw6QgKDIwMTktMDMtMjAgMTk6MjY6MjkpCj4gT24gV2VkLCBN
YXIgMjAsIDIwMTkgYXQgMDQ6MDE6NTFQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
QnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEx
MDIxMgo+ID4gRml4ZXM6IDhhZTg2NjIxZDZmZiAoImxpYi9pZ3RfZGV2aWNlOiBNb3ZlIGludGVs
X2dldF9wY2lfZGV2aWNlIHVuZGVyIGlndF9kZXZpY2UiKQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiBDYzogTWljaGHFgiBXaW5p
YXJza2kgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgdGVzdHMvaTkx
NS9nZW1fc2hyaW5rLmMgfCAxMCArKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5
MTUvZ2VtX3Nocmluay5jIGIvdGVzdHMvaTkxNS9nZW1fc2hyaW5rLmMKPiA+IGluZGV4IDczYjZi
ZTcyNS4uNTFkMTM0M2JhIDEwMDY0NAo+ID4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fc2hyaW5rLmMK
PiA+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX3Nocmluay5jCj4gPiBAQCAtNDAzLDcgKzQwMywxMiBA
QCBpZ3RfbWFpbgo+ID4gICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZW5naW5lOwo+ID4gICAg
ICAgICAgICAgICBpbnQgZmQ7Cj4gPiAgCj4gPiAtICAgICAgICAgICAgIC8qIFNwYXduIGVub3Vn
aCBwcm9jZXNzZXMgdG8gdXNlIGFsbCBtZW1vcnksIGJ1dCBlYWNoIG9ubHkKPiA+ICsgICAgICAg
ICAgICAgZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0lOVEVMKTsKPiA+ICsgICAgICAgICAg
ICAgaWd0X3JlcXVpcmVfZ2VtKGZkKTsKPiA+ICsKPiA+ICsKPiAKPiBCb251cyBuZXdsaW5lPwoK
SXQncyBhIDItZm9yLW9uZSwgdGltZS1saW1pdGVkIG9mZmVyLgotQ2hyaXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
