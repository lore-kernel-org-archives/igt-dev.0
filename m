Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20190130095500.23596-2-chris@chris-wilson.co.uk>
References: <20190130095500.23596-1-chris@chris-wilson.co.uk>
 <20190130095500.23596-2-chris@chris-wilson.co.uk>
Date: Wed, 30 Jan 2019 13:08:33 +0200
Message-ID: <87lg32e72m.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 2/8] i915/gem_eio: Check for
 allow-hang prior to issuing a reset
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+IHdyaXRlczoKCj4gQ2hlY2sg
dGhhdCB3ZSBhcmUgYWxsb3dlZCB0byBoYW5nL3Jlc2V0IHRoZSBHUFUgYmVmb3JlIHdlIGFjdHVh
bGx5IGRvIHNvCj4gZm9yIHRoZSBmaXJzdCB0aW1lLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpSZXZpZXdlZC1ieTogTWlrYSBLdW9w
cGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+Cgo+IC0tLQo+ICB0ZXN0cy9pOTE1
L2dlbV9laW8uYyB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9laW8uYyBi
L3Rlc3RzL2k5MTUvZ2VtX2Vpby5jCj4gaW5kZXggNTI1MGE0MTRjLi4wOTA1OWMzMTEgMTAwNjQ0
Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fZWlvLmMKPiArKysgYi90ZXN0cy9pOTE1L2dlbV9laW8u
Ywo+IEBAIC03NDUsMTQgKzc0NSwxNCBAQCBpZ3RfbWFpbgo+ICAJCWZkID0gZHJtX29wZW5fZHJp
dmVyKERSSVZFUl9JTlRFTCk7Cj4gIAkJaWd0X2RldmljZV9kcm9wX21hc3RlcihmZCk7Cj4gIAo+
IC0JCWlndF9yZXF1aXJlKGk5MTVfcmVzZXRfY29udHJvbCh0cnVlKSk7Cj4gLQkJaWd0X2ZvcmNl
X2dwdV9yZXNldChmZCk7Cj4gLQkJaWd0X2luc3RhbGxfZXhpdF9oYW5kbGVyKGV4aXRfaGFuZGxl
cik7Cj4gLQo+ICAJCWdlbV9zdWJtaXNzaW9uX3ByaW50X21ldGhvZChmZCk7Cj4gIAkJaWd0X3Jl
cXVpcmVfZ2VtKGZkKTsKPiAgCj4gIAkJaWd0X2FsbG93X2hhbmcoZmQsIDAsIDApOwo+ICsKPiAr
CQlpZ3RfcmVxdWlyZShpOTE1X3Jlc2V0X2NvbnRyb2wodHJ1ZSkpOwo+ICsJCWlndF9mb3JjZV9n
cHVfcmVzZXQoZmQpOwo+ICsJCWlndF9pbnN0YWxsX2V4aXRfaGFuZGxlcihleGl0X2hhbmRsZXIp
Owo+ICAJfQo+ICAKPiAgCWlndF9zdWJ0ZXN0KCJ0aHJvdHRsZSIpCj4gLS0gCj4gMi4yMC4xCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEludGVs
LWdmeCBtYWlsaW5nIGxpc3QKPiBJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
