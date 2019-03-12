Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF7A89FF7
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 22:18:08 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <a4440b2c-cb6a-579f-16a4-a465785e9440@intel.com>
References: <20190312215738.5598-1-antonio.argenziano@intel.com>
 <20190312215738.5598-2-antonio.argenziano@intel.com>
 <155242824288.30003.5849541866714853245@skylake-alporthouse-com>
 <a4440b2c-cb6a-579f-16a4-a465785e9440@intel.com>
Message-ID: <155242908022.7740.12733971717353258944@skylake-alporthouse-com>
Date: Tue, 12 Mar 2019 22:18:00 +0000
Subject: Re: [igt-dev] [RFC 1/4] tests/i915/gem_mmap_gtt: Add invalid
 parameters test
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
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDMtMTIgMjI6MTE6MDYpCj4gCj4gCj4g
T24gMTIvMDMvMTkgMTU6MDQsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAzLTEyIDIxOjU3OjM1KQo+ID4+IEFkZCBhIHRlc3QgZm9yIGFu
IGludmFsaWQgaGFuZGxlIGJlaW5nIHBhc3NlZCB0byB0aGUgSU9DVEwuCj4gPj4KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5j
b20+Cj4gPj4gLS0tCj4gPj4gICB0ZXN0cy9pOTE1L2dlbV9tbWFwX2d0dC5jIHwgMTIgKysrKysr
KysrKysrCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMgYi90ZXN0cy9pOTE1L2dlbV9t
bWFwX2d0dC5jCj4gPj4gaW5kZXggZjZmYmJlMTkuLjU4Zjc0MDNjIDEwMDY0NAo+ID4+IC0tLSBh
L3Rlc3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMKPiA+PiArKysgYi90ZXN0cy9pOTE1L2dlbV9tbWFw
X2d0dC5jCj4gPj4gQEAgLTgzMSw2ICs4MzEsMTggQEAgaWd0X21haW4KPiA+PiAgICAgICAgICBp
Z3RfZml4dHVyZQo+ID4+ICAgICAgICAgICAgICAgICAgZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJ
VkVSX0lOVEVMKTsKPiA+PiAgIAo+ID4+ICsgICAgICAgaWd0X3N1YnRlc3QoImJhZC1vYmplY3Qi
KSB7Cj4gPj4gKyAgICAgICAgICAgICAgIHN0cnVjdCBkcm1faTkxNV9nZW1fbW1hcCBhcmc7Cj4g
Pj4gKyAgICAgICAgICAgICAgIGludCByZXQ7Cj4gPj4gKwo+ID4+ICsgICAgICAgICAgICAgICBt
ZW1zZXQoJmFyZywgMCwgc2l6ZW9mKGFyZykpOwo+ID4+ICsgICAgICAgICAgICAgICBhcmcuaGFu
ZGxlID0gMHgxMDEwMTAxMDsKPiA+IAo+ID4gRm9yIGJhZCBoYW5kbGVzLCBhbHNvIHRyeSBjcmVh
dGluZyBhIHZhbGlkIGhhbmRsZSBhbmQgY2hlY2tpbmcKPiA+IGZvciAoaSA9IDE2OyBpIDwgQklU
U19QRVJfVFlQRShhcmcuaGFuZGxlKTsgaSsrKQo+ID4gICAgICAgYXJnLmhhbmRsZSA9IHJlYWxf
aGFuZGxlIHwgQklUKGkpOwo+ID4gCj4gPiBFc3BlY2lhbGx5IHdpdGggKDE8PDMxKSBzZXQgYXMg
aGlzdG9yaWNhbGx5IHRoZSBpZHIgd2FzIG9ubHkgYSAzMS1iaXQKPiA+IGN5Y2xpYyBhbGxvY2F0
b3IsIHNvIG1pZ2h0IGJlIHN1c2NlcHRpYmxlIHRvIHdyYXBhcm91bmQuCj4gCj4gV291bGQ6Cj4g
cmVhbF9oYW5kbGUgPSBnZW1fY3JlYXRlKC4uLik7Cj4gYXJnLmhhbmRsZSA9IHJlYWxfaGFuZGxl
ICsgMTsKPiAKPiBndWFyYW50ZWUgYW4gaW52YWxpZCBoYW5kbGU/CgpJZiB0aGVyZSdzIG9ubHkg
YmVlbiBvbmUgaGFuZGxlIGFsbG9jYXRlZCwgeWVzLgotQ2hyaXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2
