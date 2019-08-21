Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E671F6E2E8
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2019 11:58:12 +0000 (UTC)
Date: Wed, 21 Aug 2019 13:58:09 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20190821115809.GA7219@kdec5-desk.ger.corp.intel.com>
References: <20190812084718.9999-1-zbigniew.kempczynski@intel.com>
 <20190812084718.9999-2-zbigniew.kempczynski@intel.com>
 <20190821110430.GB21194@kdec5-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821110430.GB21194@kdec5-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/2] Introduce multi-device selection
 API
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
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDE6MDQ6MzBQTSArMDIwMCwgS2F0YXJ6eW5hIERlYyB3
cm90ZToKPiA+ICsgKiBpZ3RfZGV2aWNlX2NhcmRfbWF0Y2gKPiA+ICsgKiBAZmlsdGVyOiBmaWx0
ZXIgc3RyaW5nCj4gPiArICogQGNhcmQ6IHBvaW50ZXIgdG8gaWd0X2RldmljZV9jYXJkIHN0cnVj
dAo+ID4gKyAqCj4gPiArICogRnVuY3Rpb24gYXBwbGllcyBmaWx0ZXIgdG8gbWF0Y2ggZGV2aWNl
IGZyb20gZGV2aWNlIGFycmF5Lgo+ID4gKyAqCj4gPiArICogUmV0dXJuczoKPiA+ICsgKiBmYWxz
ZSAtIG5vIGNhcmQgcG9pbnRlciB3YXMgcGFzc2VkIG9yIGNhcmQgd2Fzbid0IG1hdGNoZWQsCj4g
PiArICogdHJ1ZSAtIGNhcmQgbWF0Y2hlZCBhbmQgcmV0dXJuZWQuCj4gPiArICovCj4gPiArYm9v
bCBpZ3RfZGV2aWNlX2NhcmRfbWF0Y2goY29uc3QgY2hhciAqZmlsdGVyLCBzdHJ1Y3QgaWd0X2Rl
dmljZV9jYXJkICpjYXJkKQo+ID4gK3sKPiA+ICsJc3RydWN0IGlndF9kZXZpY2UgKmRldiA9IE5V
TEw7Cj4gPiArCj4gPiArCWlmICghY2FyZCkKPiA+ICsJCXJldHVybiBmYWxzZTsKPiA+ICsJbWVt
c2V0KGNhcmQsIDAsIHNpemVvZigqY2FyZCkpOwo+ID4gKwo+ID4gKwlpZ3RfZGV2aWNlc19zY2Fu
KGZhbHNlKTsKPiA+ICsKPiA+ICsJaWYgKGlndF9kZXZpY2VfZmlsdGVyX2FwcGx5KGZpbHRlcikg
PT0gZmFsc2UpCj4gPiArCQlyZXR1cm4gZmFsc2U7Cj4gPiArCj4gPiArCWlmICghaWd0X2RldnMu
dmlldy0+bGVuKQo+ID4gKwkJcmV0dXJuIGZhbHNlOwo+ID4gKwo+ID4gKwkvKiBXZSB0YWtlIGZp
cnN0IG9uZSBpZiBtb3JlIHRoYW4gb25lIGNhcmQgbWF0Y2hlcyBmaWx0ZXIgKi8KPiA+ICsJZGV2
ID0gZ19wdHJfYXJyYXlfaW5kZXgoaWd0X2RldnMudmlldywgMCk7Cj4gPiArCWNhcmQtPmNoaXBz
ZXQgPSBEUklWRVJfQU5ZOwo+ID4gKwlpZiAoZGV2LT52cykKPiA+ICsJCWNhcmQtPmNoaXBzZXQg
PSBkZXYtPnZzLT5jaGlwc2V0Owo+ID4gKwo+ID4gKwlzYWZlX3N0cm5jcHkoY2FyZC0+c3Vic3lz
dGVtLCBkZXYtPnN1YnN5c3RlbSwgTkFNRV9NQVgpOwo+ID4gKwlzYWZlX3N0cm5jcHkoY2FyZC0+
Y2FyZCwgZGV2LT5kcm1fY2FyZCwgTkFNRV9NQVgpOwo+ID4gKwlzYWZlX3N0cm5jcHkoY2FyZC0+
cmVuZGVyLCBkZXYtPmRybV9yZW5kZXIsIE5BTUVfTUFYKTsKPiBUaGlzIG1hY3JvIGlzIHJldHVy
aW5nIHRydWUvZmFsc2UsIGRvIHdlIGNoZWNrIHRoZSByZXN1bHRzPyBJdCBsb29rcyBsaWtlIG1h
Z2ljCj4gdG8gbWUgOikKTm93IGl0IGlzIG5vdCBtYWdpYyA6KSBBZnRlciBhIGdvb2QgbHVuY2gg
SSByZWFsaXplZCB3aGF0IGlzIGdvaW5nIG9uIGhlcmUgOikKS2FzaWEgOikKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
