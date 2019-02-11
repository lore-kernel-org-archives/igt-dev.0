Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190211175242.722-1-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <1dd54914-9137-4a07-db36-4700a587dc01@intel.com>
Date: Mon, 11 Feb 2019 10:34:32 -0800
MIME-Version: 1.0
In-Reply-To: <20190211175242.722-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_reuse: stop the hang
 detector afterwards
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAxMS8wMi8xOSAwOTo1MiwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFRha2UgcmVzcG9uc2li
aWxpdHkgZm9yIHRoZSBzdGF0ZSB3ZSBjcmVhdGUsIGFuZCBpbiBwYXJ0aWN1bGFyIHJlbWVtYmVy
Cj4gdG8ga2lsbCBvdXIgY2hpbGQgcHJvY2VzcyAodGhlIGhhbmcgZGV0ZWN0b3IpIGJlZm9yZSBl
eGl0aW5nLgo+IAo+IFJlcG9ydGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IC0t
LQo+ICAgdGVzdHMvaTkxNS9nZW1fZXhlY19yZXVzZS5jIHwgNSArKysrLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90
ZXN0cy9pOTE1L2dlbV9leGVjX3JldXNlLmMgYi90ZXN0cy9pOTE1L2dlbV9leGVjX3JldXNlLmMK
PiBpbmRleCBkZjIyMGJlN2IuLjQ0OTQ2NTI4ZiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2dl
bV9leGVjX3JldXNlLmMKPiArKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX3JldXNlLmMKPiBAQCAt
MTE2LDcgKzExNiw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbWF4X25mZCh2b2lkKQo+ICAgCj4g
ICBpZ3RfbWFpbgo+ICAgewo+IC0Jc3RydWN0IG5vb3Agbm87Cj4gKwlzdHJ1Y3Qgbm9vcCBubyA9
IHsgLmZkID0gLTEgfTsKPiAgIAl1bnNpZ25lZCBlbmdpbmVzWzE2XTsKPiAgIAl1bnNpZ25lZCBu
ZW5naW5lOwo+ICAgCXVuc2lnbmVkIG47Cj4gQEAgLTIxMyw0ICsyMTMsNyBAQCBpZ3RfbWFpbgo+
ICAgCQlmb3IgKG4gPSAwOyBuIDwgbmNvbnRleHRzOyBuKyspCj4gICAJCQlnZW1fY29udGV4dF9k
ZXN0cm95KG5vLmZkLCBjb250ZXh0c1tuXSk7Cj4gICAJfQo+ICsKPiArCWlndF9maXh0dXJlCj4g
KwkJaWd0X3N0b3BfaGFuZ19kZXRlY3Rvcihuby5mZCk7CgpUaGlzIGRvZXNuJ3QgdGFrZSBhbiBm
ZC4uLiBpbmNvbWluZyBjaGFuZ2VzIHRvIHRoZSBsaWI/CgpTdGlsbCBtYWtlcyBzZW5zZSwgd2l0
aCBmaXgsCgpSZXZpZXdlZC1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vuemlh
bm9AaW50ZWwuY29tPgoKPiAgIH0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
