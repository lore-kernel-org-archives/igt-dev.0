Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190604162912.28359-1-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <cc7dacb7-a364-7003-1161-e4424e9adde0@intel.com>
Date: Tue, 4 Jun 2019 11:43:35 -0700
MIME-Version: 1.0
In-Reply-To: <20190604162912.28359-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ctx_shared: Fixup vec0 mmio
 base for icl
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

CgpPbiAwNC8wNi8xOSAwOToyOSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IEkgdG9sZCB2ZWNzMCB0
byB1c2UgdmVjczEgcmVnaXN0ZXJzLi4uCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gLS0tCj4gICB0ZXN0cy9pOTE1L2dlbV9jdHhf
c2hhcmVkLmMgfCA0ICsrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fY3R4X3NoYXJlZC5j
IGIvdGVzdHMvaTkxNS9nZW1fY3R4X3NoYXJlZC5jCj4gaW5kZXggNjdlY2QwOTUzLi4wNjk5NjQ1
NDYgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fY3R4X3NoYXJlZC5jCj4gKysrIGIvdGVz
dHMvaTkxNS9nZW1fY3R4X3NoYXJlZC5jCj4gQEAgLTU0NCw5ICs1NDQsMTEgQEAgc3RhdGljIHZv
aWQgaW5kZXBlbmRlbnQoaW50IGk5MTUsIHVuc2lnbmVkIHJpbmcsIHVuc2lnbmVkIGZsYWdzKQo+
ICAgCQltbWlvX2Jhc2UgPSAweDIyMDAwOwo+ICAgCQlicmVhazsKPiAgIAo+ICsjZGVmaW5lIEdF
TjExX1ZFQ1MwX0JBU0UgMHgxYzgwMDAKPiArI2RlZmluZSBHRU4xMV9WRUNTMV9CQVNFIDB4MWQ4
MDAwCgpWRUNTMSBjb21pbmcgbmV4dD8KCj4gICAJY2FzZSBJOTE1X0VYRUNfVkVCT1g6CgpUaGVy
ZSBpcyBhIGNvbW1lbnRlZC1vdXQgY2FzZSBmb3IgQlNELCB3aHkgaXMgdGhhdD8KCj4gICAJCWlm
IChpbnRlbF9nZW4oaW50ZWxfZ2V0X2RybV9kZXZpZChpOTE1KSkgPj0gMTEpCj4gLQkJCW1taW9f
YmFzZSA9IDB4MWQ4MDAwOwo+ICsJCQltbWlvX2Jhc2UgPSBHRU4xMV9WRUNTMF9CQVNFOwoKTWln
aHQgYXMgd2VsbCBkZWZpbmUgYWxsIGJhc2VzLgoKU3RpbGwsIGZpeGVzIHRoZSB0ZXN0IHNvOgoK
UmV2aWV3ZWQtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVs
LmNvbT4KCkFudG9uaW8KCj4gICAJCWVsc2UKPiAgIAkJCW1taW9fYmFzZSA9IDB4MWEwMDA7Cj4g
ICAJCWJyZWFrOwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
