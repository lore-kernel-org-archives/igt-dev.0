Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053A889A0E
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Sep 2018 09:39:38 +0000 (UTC)
Date: Mon, 3 Sep 2018 12:39:31 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20180903093931.nuynru5ap5rnd6sz@platvala-desk.ger.corp.intel.com>
References: <20180901180911.22636-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180901180911.22636-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Use a bsearch to find the module
 name
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gU2F0LCBTZXAgMDEsIDIwMTggYXQgMDc6MDk6MTFQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IEV2ZW4gd2l0aCBhIHNtYWxsIG51bWJlciBvZiBrbm93biBkcml2ZXJzICg2KSwgYSBi
c2VhcmNoIHdpbGwgdGFrZSBhdAo+IG1vc3QgMyBzdGVwcywgd2hlcmVhcyB0aGUgbGluZWFyIHNl
YXJjaCB3aWxsIHRha2UgMyBzdGVwcyBvbiBhdmVyYWdlLiBJbgo+IHRoZSBmdXR1cmUgd2l0aCBt
b3JlIGtub3duIGRyaXZlcnMsIHRoZSBsb2dOIGJzZWFyY2ggd2lsbCBiZSBldmVuIG1vcmUKPiBh
ZHZhbnRhZ2VvdXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Cj4gQ2M6IEthdGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwu
Y29tPgo+IC0tLQo+ICBsaWIvZHJtdGVzdC5jIHwgMTIgKysrKysrKysrLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2xpYi9kcm10ZXN0LmMgYi9saWIvZHJtdGVzdC5jCj4gaW5kZXggOTMyMjhmOTAwLi5iZmIzOGYx
ZTkgMTAwNjQ0Cj4gLS0tIGEvbGliL2RybXRlc3QuYwo+ICsrKyBiL2xpYi9kcm10ZXN0LmMKPiBA
QCAtMjIyLDkgKzIyMiwxNSBAQCBzdGF0aWMgaW50IG9wZW5fZGV2aWNlKGNvbnN0IGNoYXIgKm5h
bWUsIHVuc2lnbmVkIGludCBjaGlwc2V0KQo+ICAJaWYgKF9fZ2V0X2RybV9kZXZpY2VfbmFtZShm
ZCwgZGV2X25hbWUsIHNpemVvZihkZXZfbmFtZSkgLSAxKSA9PSAtMSkKPiAgCQlnb3RvIGVycjsK
PiAgCj4gLQlmb3IgKGNvbnN0IHN0cnVjdCBtb2R1bGUgKm0gPSBtb2R1bGVzOyBtLT5tb2R1bGU7
IG0rKykgewo+IC0JCWlmIChzdHJjbXAobS0+bW9kdWxlLCBkZXZfbmFtZSkgPT0gMCkgewo+IC0J
CQljaGlwID0gbS0+Yml0Owo+ICsJZm9yIChpbnQgc3RhcnQgPSAwLCBlbmQgPSBBUlJBWV9TSVpF
KG1vZHVsZXMpIC0gMTsgc3RhcnQgPCBlbmQ7ICl7Cj4gKwkJaW50IG1pZCA9IHN0YXJ0ICsgKGVu
ZCAtIHN0YXJ0KSAvIDI7Cj4gKwkJaW50IHJldCA9IHN0cmNtcChtb2R1bGVzW21pZF0ubW9kdWxl
LCBkZXZfbmFtZSk7Cj4gKwkJaWYgKHJldCA8IDApIHsKPiArCQkJZW5kID0gbWlkOwo+ICsJCX0g
ZWxzZSBpZiAocmV0ID4gMCkgewo+ICsJCQlzdGFydCA9IG1pZCArIDE7CgoKSXNuJ3QgdGhpcyB0
aGUgd3Jvbmcgd2F5IGFyb3VuZD8KCgotLSAKUGV0cmkgTGF0dmFsYQoKCgoKPiArCQl9IGVsc2Ug
ewo+ICsJCQljaGlwID0gbW9kdWxlc1ttaWRdLmJpdDsKPiAgCQkJYnJlYWs7Cj4gIAkJfQo+ICAJ
fQo+IC0tIAo+IDIuMTkuMC5yYzEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
