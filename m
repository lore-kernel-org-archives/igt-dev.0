Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777EA89FF7
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 22:04:20 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190312215738.5598-2-antonio.argenziano@intel.com>
References: <20190312215738.5598-1-antonio.argenziano@intel.com>
 <20190312215738.5598-2-antonio.argenziano@intel.com>
Message-ID: <155242824288.30003.5849541866714853245@skylake-alporthouse-com>
Date: Tue, 12 Mar 2019 22:04:08 +0000
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

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDMtMTIgMjE6NTc6MzUpCj4gQWRkIGEg
dGVzdCBmb3IgYW4gaW52YWxpZCBoYW5kbGUgYmVpbmcgcGFzc2VkIHRvIHRoZSBJT0NUTC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0Bp
bnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMgfCAxMiArKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvdGVzdHMvaTkxNS9nZW1fbW1hcF9ndHQuYyBiL3Rlc3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMK
PiBpbmRleCBmNmZiYmUxOS4uNThmNzQwM2MgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1f
bW1hcF9ndHQuYwo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMKPiBAQCAtODMxLDYg
KzgzMSwxOCBAQCBpZ3RfbWFpbgo+ICAgICAgICAgaWd0X2ZpeHR1cmUKPiAgICAgICAgICAgICAg
ICAgZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0lOVEVMKTsKPiAgCj4gKyAgICAgICBpZ3Rf
c3VidGVzdCgiYmFkLW9iamVjdCIpIHsKPiArICAgICAgICAgICAgICAgc3RydWN0IGRybV9pOTE1
X2dlbV9tbWFwIGFyZzsKPiArICAgICAgICAgICAgICAgaW50IHJldDsKPiArCj4gKyAgICAgICAg
ICAgICAgIG1lbXNldCgmYXJnLCAwLCBzaXplb2YoYXJnKSk7Cj4gKyAgICAgICAgICAgICAgIGFy
Zy5oYW5kbGUgPSAweDEwMTAxMDEwOwoKRm9yIGJhZCBoYW5kbGVzLCBhbHNvIHRyeSBjcmVhdGlu
ZyBhIHZhbGlkIGhhbmRsZSBhbmQgY2hlY2tpbmcKZm9yIChpID0gMTY7IGkgPCBCSVRTX1BFUl9U
WVBFKGFyZy5oYW5kbGUpOyBpKyspCglhcmcuaGFuZGxlID0gcmVhbF9oYW5kbGUgfCBCSVQoaSk7
CgpFc3BlY2lhbGx5IHdpdGggKDE8PDMxKSBzZXQgYXMgaGlzdG9yaWNhbGx5IHRoZSBpZHIgd2Fz
IG9ubHkgYSAzMS1iaXQKY3ljbGljIGFsbG9jYXRvciwgc28gbWlnaHQgYmUgc3VzY2VwdGlibGUg
dG8gd3JhcGFyb3VuZC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
