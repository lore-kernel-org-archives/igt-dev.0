Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190127124902.10139-1-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <2359fa40-e835-44af-8205-bb7c5cd1f6fa@intel.com>
Date: Tue, 29 Jan 2019 15:36:38 -0800
MIME-Version: 1.0
In-Reply-To: <20190127124902.10139-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_eio: Check for allow-hang
 prior to issuing a reset
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

CgpPbiAyNy8wMS8xOSAwNDo0OSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IENoZWNrIHRoYXQgd2Ug
YXJlIGFsbG93ZWQgdG8gaGFuZy9yZXNldCB0aGUgR1BVIGJlZm9yZSB3ZSBhY3R1YWxseSBkbyBz
bwo+IGZvciB0aGUgZmlyc3QgdGltZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAtLS0KPiAgIHRlc3RzL2k5MTUvZ2VtX2Vpby5j
IHwgOCArKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fZWlvLmMgYi90ZXN0cy9p
OTE1L2dlbV9laW8uYwo+IGluZGV4IDUyNTBhNDE0Yy4uMDkwNTljMzExIDEwMDY0NAo+IC0tLSBh
L3Rlc3RzL2k5MTUvZ2VtX2Vpby5jCj4gKysrIGIvdGVzdHMvaTkxNS9nZW1fZWlvLmMKPiBAQCAt
NzQ1LDE0ICs3NDUsMTQgQEAgaWd0X21haW4KPiAgIAkJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJ
VkVSX0lOVEVMKTsKPiAgIAkJaWd0X2RldmljZV9kcm9wX21hc3RlcihmZCk7Cj4gICAKPiAtCQlp
Z3RfcmVxdWlyZShpOTE1X3Jlc2V0X2NvbnRyb2wodHJ1ZSkpOwo+IC0JCWlndF9mb3JjZV9ncHVf
cmVzZXQoZmQpOwo+IC0JCWlndF9pbnN0YWxsX2V4aXRfaGFuZGxlcihleGl0X2hhbmRsZXIpOwo+
IC0KPiAgIAkJZ2VtX3N1Ym1pc3Npb25fcHJpbnRfbWV0aG9kKGZkKTsKPiAgIAkJaWd0X3JlcXVp
cmVfZ2VtKGZkKTsKPiAgIAo+ICAgCQlpZ3RfYWxsb3dfaGFuZyhmZCwgMCwgMCk7Cj4gKwo+ICsJ
CWlndF9yZXF1aXJlKGk5MTVfcmVzZXRfY29udHJvbCh0cnVlKSk7CgpEb24ndCB3ZSBkbyB0aGlz
IGFscmVhZHkgaW4gYWxsb3dfaGFuZz8KCkFudG5vaW8KCj4gKwkJaWd0X2ZvcmNlX2dwdV9yZXNl
dChmZCk7Cj4gKwkJaWd0X2luc3RhbGxfZXhpdF9oYW5kbGVyKGV4aXRfaGFuZGxlcik7Cj4gICAJ
fQo+ICAgCj4gICAJaWd0X3N1YnRlc3QoInRocm90dGxlIikKPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
