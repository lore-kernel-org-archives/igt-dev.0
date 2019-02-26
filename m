Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEB989FC0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 18:47:50 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <f2c631c6-b393-bfea-c95f-14f99c18a6fe@intel.com>
References: <20190226182353.2125-1-antonio.argenziano@intel.com>
 <155120579777.17933.14831240638485565131@skylake-alporthouse-com>
 <f2c631c6-b393-bfea-c95f-14f99c18a6fe@intel.com>
Message-ID: <155120684682.17933.10687997382247620268@skylake-alporthouse-com>
Date: Tue, 26 Feb 2019 18:47:32 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/i915: Add mmap_offset support
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
Cc: Janulgue Abdiel <abdiel.janulgue@intel.com>, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMjYgMTg6NDQ6MTcpCj4gCj4gCj4g
T24gMjYvMDIvMTkgMTA6MjksIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAyLTI2IDE4OjIzOjUzKQo+ID4+ICtib29sIGhhc19tbWFwX29m
ZnNldChpbnQgZmQpCj4gPiAKPiA+IFByZWZpeCBwbGVhc2UuCj4gPiAKPiA+PiArewo+ID4+ICsg
ICAgICAgc3RhdGljIGludCBoYXNfbW1hcF9vZmZzZXQgPSAtMTsKPiA+IAo+ID4gV2hhdCdzIG91
ciBwbGFuIHRvIGF2b2lkaW5nIHRoZSBzdGF0aWM/Cj4gCj4gSG93IGFib3V0OiBtYWtlIHRoZSB2
YXJpYWJsZSBub3Qgc3RhdGljIGFuZCByZW1vdmUgdGhlIGlmPwo+IAo+ID4gCj4gPiBJIGRvbid0
IHRoaW5rIHdlIG5lZWQgdGhlIHN0YXRpY3MgZm9yIHRoZXNlLCBhcyB0aGVpciB1c2Ugc2hvdWxk
IGJlCj4gPiBsaW1pdGVkIHRvIGZpeHR1cmVzLiBPbmNlIHBsYW4gaGFzIGJlZW4gZGVjaWRlZCB1
cG9uLCBlbmFjdCBpdCBmb3IgYWxsCj4gPiBpbiBnZW1fbW1hbi5jIDopCj4gCj4gT0ssIHRoZXJl
IGlzbid0IHJlYWxseSBtdWNoIGluIGdlbV9tbWFuLCBJJ2xsIGFkZCBhIHBhdGNoIGJlZm9yZSB0
aGlzIAo+IG9uZSB0byByZW1vdmUgd2hhdCBpcyB0aGVyZSBhbmQgbm90IGFkZCB0aGlzIGhlcmUu
Cj4gCj4gQW50b25pbwo+IAo+ID4gCj4gPj4gKwo+ID4+ICsgICAgICAgaWYgKGhhc19tbWFwX29m
ZnNldCA9PSAtMSkgewo+ID4+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2k5MTVfZ2V0cGFy
YW0gZ3A7Cj4gPj4gKwo+ID4+ICsgICAgICAgICAgICAgICBoYXNfbW1hcF9vZmZzZXQgPSAwOwo+
ID4+ICsKPiA+PiArICAgICAgICAgICAgICAgbWVtc2V0KCZncCwgMCwgc2l6ZW9mKGdwKSk7Cj4g
Pj4gKyAgICAgICAgICAgICAgIGdwLnBhcmFtID0gMHg1NTsgLyogSTkxNV9QQVJBTV9NTUFQX09G
RlNFVF9WRVJTSU9OICovCgpXYWl0YXNlYy4uLiBJIHRob3VnaHQgd2Ugd291bGQgYmUgb3Zlcmxv
YWRpbmcgdGhlIE1NQVBfR1RUX1ZFUlNJT04gc2luY2UKd2UgYXJlIG92ZXJsb2FkaW5nIHRoZSBN
TUFQX0dUVD8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
