Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829196E02C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 22:11:07 +0000 (UTC)
References: <20190312215738.5598-1-antonio.argenziano@intel.com>
 <20190312215738.5598-2-antonio.argenziano@intel.com>
 <155242824288.30003.5849541866714853245@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <a4440b2c-cb6a-579f-16a4-a465785e9440@intel.com>
Date: Tue, 12 Mar 2019 15:11:06 -0700
MIME-Version: 1.0
In-Reply-To: <155242824288.30003.5849541866714853245@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [RFC 1/4] tests/i915/gem_mmap_gtt: Add invalid
 parameters test
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
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAxMi8wMy8xOSAxNTowNCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAzLTEyIDIxOjU3OjM1KQo+PiBBZGQgYSB0ZXN0IGZvciBhbiBp
bnZhbGlkIGhhbmRsZSBiZWluZyBwYXNzZWQgdG8gdGhlIElPQ1RMLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4+
IC0tLQo+PiAgIHRlc3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMgfCAxMiArKysrKysrKysrKysKPj4g
ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvdGVz
dHMvaTkxNS9nZW1fbW1hcF9ndHQuYyBiL3Rlc3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMKPj4gaW5k
ZXggZjZmYmJlMTkuLjU4Zjc0MDNjIDEwMDY0NAo+PiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9tbWFw
X2d0dC5jCj4+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMKPj4gQEAgLTgzMSw2ICs4
MzEsMTggQEAgaWd0X21haW4KPj4gICAgICAgICAgaWd0X2ZpeHR1cmUKPj4gICAgICAgICAgICAg
ICAgICBmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfSU5URUwpOwo+PiAgIAo+PiArICAgICAg
IGlndF9zdWJ0ZXN0KCJiYWQtb2JqZWN0Iikgewo+PiArICAgICAgICAgICAgICAgc3RydWN0IGRy
bV9pOTE1X2dlbV9tbWFwIGFyZzsKPj4gKyAgICAgICAgICAgICAgIGludCByZXQ7Cj4+ICsKPj4g
KyAgICAgICAgICAgICAgIG1lbXNldCgmYXJnLCAwLCBzaXplb2YoYXJnKSk7Cj4+ICsgICAgICAg
ICAgICAgICBhcmcuaGFuZGxlID0gMHgxMDEwMTAxMDsKPiAKPiBGb3IgYmFkIGhhbmRsZXMsIGFs
c28gdHJ5IGNyZWF0aW5nIGEgdmFsaWQgaGFuZGxlIGFuZCBjaGVja2luZwo+IGZvciAoaSA9IDE2
OyBpIDwgQklUU19QRVJfVFlQRShhcmcuaGFuZGxlKTsgaSsrKQo+IAlhcmcuaGFuZGxlID0gcmVh
bF9oYW5kbGUgfCBCSVQoaSk7Cj4gCj4gRXNwZWNpYWxseSB3aXRoICgxPDwzMSkgc2V0IGFzIGhp
c3RvcmljYWxseSB0aGUgaWRyIHdhcyBvbmx5IGEgMzEtYml0Cj4gY3ljbGljIGFsbG9jYXRvciwg
c28gbWlnaHQgYmUgc3VzY2VwdGlibGUgdG8gd3JhcGFyb3VuZC4KCldvdWxkOgpyZWFsX2hhbmRs
ZSA9IGdlbV9jcmVhdGUoLi4uKTsKYXJnLmhhbmRsZSA9IHJlYWxfaGFuZGxlICsgMTsKCmd1YXJh
bnRlZSBhbiBpbnZhbGlkIGhhbmRsZT8KCkFudG9uaW8KCj4gLUNocmlzCj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
