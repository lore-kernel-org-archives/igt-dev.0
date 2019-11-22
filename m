Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80A86E2B2
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2019 08:28:02 +0000 (UTC)
Date: Fri, 22 Nov 2019 09:27:55 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20191122082755.GA24643@zkempczy-mobl2>
References: <20191122074846.19728-1-zbigniew.kempczynski@intel.com>
 <20191122074846.19728-5-zbigniew.kempczynski@intel.com>
 <157441003589.8118.16547079663342843513@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157441003589.8118.16547079663342843513@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 4/4] tests/i915/gem_mmap_offset: Add
 new API test for gem_mmap_offset
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

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDg6MDc6MTVBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgWmJpZ25pZXcgS2VtcGN6ecWEc2tpICgyMDE5LTExLTIyIDA3OjQ4OjQ2
KQogPiArfQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkCj4gPiArbW1hcF9vZmZzZXRfYmFkX29iamVj
dChpbnQgZmQsIHN0cnVjdCBsb2NhbF9pOTE1X3F1ZXJ5X21lbW9yeV9yZWdpb25faW5mbyAqcmVn
aW9ucykKPiA+ICt7Cj4gPiArICAgICAgIGNvbnN0IGNoYXIgKnJlZ2lvbl9uYW1lOwo+ID4gKyAg
ICAgICBzdHJ1Y3QgbG9jYWxfaTkxNV9tZW1vcnlfcmVnaW9uX2luZm8gKm1lbV9yZWdpb247Cj4g
PiArICAgICAgIHVpbnQzMl90IHJlZ2lvbiwgb2JqX3NpemUsIGJhdGNoX3NpemUsIHJlYWxfaGFu
ZGxlOwo+ID4gKyAgICAgICB1aW50MzJfdCBoYW5kbGVzWzIwXTsKPiA+ICsKPiA+ICsgICAgICAg
Zm9yX2VhY2hfbWVtb3J5X3JlZ2lvbihyZWdpb25zLCBtZW1fcmVnaW9uKSB7Cj4gPiArICAgICAg
ICAgICAgICAgaW50IGkgPSAwOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIHJlZ2lvbiA9IG1l
bV9yZWdpb24tPmlkOwo+ID4gKyAgICAgICAgICAgICAgIHJlZ2lvbl9uYW1lID0gbWVtb3J5X3Jl
Z2lvbl9uYW1lKHJlZ2lvbik7Cj4gPiArICAgICAgICAgICAgICAgaWYgKElTX1NUT0xFTl9NRU1P
UllfUkVHSU9OKHJlZ2lvbikpIHsKPiAKPiBXZSBoYXZlIGEgcXVlcnkgaW50ZXJmYWNlLCB3aHkg
ZG8gd2UgbmVlZCB0byBoYXJkY29kZSBjYXBzPwo+IFRoYXQgZG9lcyBub3QgYm9kZSB3ZWxsIGZv
ciB0aGUgZGVzaWduLgo+IAo+IFRoZSB0ZXN0IGlzIHN1cHBvc2VkIHRvIGJlIGFnbm9zdGljOiBm
b3IgYSBzZXQgb2Ygc3VwcG9ydGVkIG1lbW9yeQo+IHJlZ2lvbnMgYXMgcmVwb3J0ZWQgYnkgdGhl
IGtlcm5lbCwgdmVyaWZ5IHRoZSBzdXBwb3J0ZWQgYXBpLgo+IC1DaHJpcwoKTWVtb3J5IHJlZ2lv
biBxdWVyeSByZXR1cm5zIHN0b2xlbiBtZW1vcnkgYXMgcmVnaW9uIGF2YWlsYWJsZQpidXQgZ2Vt
X2NyZWF0ZSgpIG9uIHRoYXQgcmVnaW9uIGhhbmdzIHRoZSBtYWNoaW5lLiBJJ20gbm90IGhhcHB5
CmFkZGluZyB0aGlzIGNvbmRpdGlvbmFsIGhlcmUgYnV0IGl0IHdhcyBkaWNhdGVkIHRvIGVtcGly
aWNhbApleHBlcmllbmNlLgoKWmJpZ25pZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
