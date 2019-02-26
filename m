Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B685089C93
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 19:29:50 +0000 (UTC)
References: <20190226182353.2125-1-antonio.argenziano@intel.com>
 <155120579777.17933.14831240638485565131@skylake-alporthouse-com>
 <f2c631c6-b393-bfea-c95f-14f99c18a6fe@intel.com>
 <155120684682.17933.10687997382247620268@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <c6efbe89-c789-b120-576f-1f89350c2566@intel.com>
Date: Tue, 26 Feb 2019 11:29:50 -0800
MIME-Version: 1.0
In-Reply-To: <155120684682.17933.10687997382247620268@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/i915: Add mmap_offset support
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Janulgue Abdiel <abdiel.janulgue@intel.com>, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyNi8wMi8xOSAxMDo0NywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAyLTI2IDE4OjQ0OjE3KQo+Pgo+Pgo+PiBPbiAyNi8wMi8xOSAx
MDoyOSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+Pj4gUXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8g
KDIwMTktMDItMjYgMTg6MjM6NTMpCj4+Pj4gK2Jvb2wgaGFzX21tYXBfb2Zmc2V0KGludCBmZCkK
Pj4+Cj4+PiBQcmVmaXggcGxlYXNlLgo+Pj4KPj4+PiArewo+Pj4+ICsgICAgICAgc3RhdGljIGlu
dCBoYXNfbW1hcF9vZmZzZXQgPSAtMTsKPj4+Cj4+PiBXaGF0J3Mgb3VyIHBsYW4gdG8gYXZvaWRp
bmcgdGhlIHN0YXRpYz8KPj4KPj4gSG93IGFib3V0OiBtYWtlIHRoZSB2YXJpYWJsZSBub3Qgc3Rh
dGljIGFuZCByZW1vdmUgdGhlIGlmPwo+Pgo+Pj4KPj4+IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0
aGUgc3RhdGljcyBmb3IgdGhlc2UsIGFzIHRoZWlyIHVzZSBzaG91bGQgYmUKPj4+IGxpbWl0ZWQg
dG8gZml4dHVyZXMuIE9uY2UgcGxhbiBoYXMgYmVlbiBkZWNpZGVkIHVwb24sIGVuYWN0IGl0IGZv
ciBhbGwKPj4+IGluIGdlbV9tbWFuLmMgOikKPj4KPj4gT0ssIHRoZXJlIGlzbid0IHJlYWxseSBt
dWNoIGluIGdlbV9tbWFuLCBJJ2xsIGFkZCBhIHBhdGNoIGJlZm9yZSB0aGlzCj4+IG9uZSB0byBy
ZW1vdmUgd2hhdCBpcyB0aGVyZSBhbmQgbm90IGFkZCB0aGlzIGhlcmUuCj4+Cj4+IEFudG9uaW8K
Pj4KPj4+Cj4+Pj4gKwo+Pj4+ICsgICAgICAgaWYgKGhhc19tbWFwX29mZnNldCA9PSAtMSkgewo+
Pj4+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2k5MTVfZ2V0cGFyYW0gZ3A7Cj4+Pj4gKwo+
Pj4+ICsgICAgICAgICAgICAgICBoYXNfbW1hcF9vZmZzZXQgPSAwOwo+Pj4+ICsKPj4+PiArICAg
ICAgICAgICAgICAgbWVtc2V0KCZncCwgMCwgc2l6ZW9mKGdwKSk7Cj4+Pj4gKyAgICAgICAgICAg
ICAgIGdwLnBhcmFtID0gMHg1NTsgLyogSTkxNV9QQVJBTV9NTUFQX09GRlNFVF9WRVJTSU9OICov
Cj4gCj4gV2FpdGFzZWMuLi4gSSB0aG91Z2h0IHdlIHdvdWxkIGJlIG92ZXJsb2FkaW5nIHRoZSBN
TUFQX0dUVF9WRVJTSU9OIHNpbmNlCj4gd2UgYXJlIG92ZXJsb2FkaW5nIHRoZSBNTUFQX0dUVD8K
CkkgdGhpbmsgdGhlIGlkZWEgd2FzIHRvIGhhdmUgdGhlbSBzZXBhcmF0ZSwgaWYgd2Ugd2VyZSB0
byBtZXJnZSB0aGVtIAp3aGF0IHdvdWxkIHlvdSBoYXZlIHJldHVybiBNTUFQX0dUVF9WRVJTSU9O
LCBhIG5ldyB2YWx1ZSBvciBsaWtlIGEgZmxhZz8KCkFudG9uaW8KCj4gLUNocmlzCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
