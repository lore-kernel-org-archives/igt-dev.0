Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20180129142828.5762-1-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <c8e8e1d3-453f-8fd5-c240-1925b7395938@intel.com>
Date: Mon, 29 Jan 2018 16:48:59 -0800
MIME-Version: 1.0
In-Reply-To: <20180129142828.5762-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [igt-dev] [PATCH igt] igt/prime_mmap_coherency:
 Close dmabuf after use
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyOS8wMS8xOCAwNjoyOCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IEFzIHdlIGxvb3Agb3Zl
ciB0aGUgY29oZXJlbmN5IHRlc3RzIG1hbnkgdGltZXMsIHdlIG5lZWQgdG8gY2xvc2UgdGhlCj4g
ZG1hYnVmcyBvcGVuZWQgb24gZXZlcnkgcGFzcyB0byBwcmV2ZW50IGEgZmQgbGVhayBhbmQgdGhl
IHRlc3QKPiBleHBsb2Rpbmcgd2hlbiBpdCBoaXRzIHRoZSBwcm9jZXNzIGxpbWl0Lgo+IAo+IEJ1
Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDM2
NDkKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51
az4KCkxHVE0uClJldmlld2VkLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56
aWFub0BpbnRlbC5jb20+Cgo+IC0tLQo+ICAgdGVzdHMvcHJpbWVfbW1hcF9jb2hlcmVuY3kuYyB8
IDUgKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvcHJpbWVfbW1hcF9jb2hlcmVuY3kuYyBiL3Rlc3RzL3ByaW1lX21tYXBfY29o
ZXJlbmN5LmMKPiBpbmRleCAxOTJiNDM0ODkuLjA0YjE1ZGRkYiAxMDA2NDQKPiAtLS0gYS90ZXN0
cy9wcmltZV9tbWFwX2NvaGVyZW5jeS5jCj4gKysrIGIvdGVzdHMvcHJpbWVfbW1hcF9jb2hlcmVu
Y3kuYwo+IEBAIC0xMDEsNiArMTAxLDggQEAgc3RhdGljIGludCB0ZXN0X3JlYWRfZmx1c2godm9p
ZCkKPiAgIAlkcm1faW50ZWxfYm9fdW5yZWZlcmVuY2UoYm9fMSk7Cj4gICAJbXVubWFwKHB0cl9j
cHUsIHdpZHRoICogaGVpZ2h0KTsKPiAgIAo+ICsJY2xvc2UoZG1hX2J1Zl9mZCk7Cj4gKwo+ICAg
CXJldHVybiBzdGFsZTsKPiAgIH0KPiAgIAo+IEBAIC0xNjksNiArMTcxLDkgQEAgc3RhdGljIGlu
dCB0ZXN0X3dyaXRlX2ZsdXNoKHZvaWQpCj4gICAJZHJtX2ludGVsX2JvX3VucmVmZXJlbmNlKGJv
XzIpOwo+ICAgCW11bm1hcChwdHJfY3B1LCB3aWR0aCAqIGhlaWdodCk7Cj4gICAKPiArCWNsb3Nl
KGRtYV9idWYyX2ZkKTsKPiArCWNsb3NlKGRtYV9idWZfZmQpOwo+ICsKPiAgIAlyZXR1cm4gc3Rh
bGU7Cj4gICB9Cj4gICAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ2Z4Cg==
