Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1565889D7D
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2019 10:33:24 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191118101731.22772-1-petri.latvala@intel.com>
In-Reply-To: <20191118101731.22772-1-petri.latvala@intel.com>
Message-ID: <157407320026.24372.5679256947699482048@skylake-alporthouse-com>
Date: Mon, 18 Nov 2019 10:33:20 +0000
Subject: Re: [igt-dev] [CI PATCH i-g-t 1/1] i915/gem_exec_basic: Use dynamic
 subtests
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTExLTE4IDEwOjE3OjMxKQo+IEluc3RlYWQgb2Yg
Z2VuZXJhdGluZyBhIHN1YnRlc3QgZm9yIGVhY2ggZW5naW5lIGluIGEgc3RhdGljIGxpc3QsCj4g
Y29udmVydCB0byBkeW5hbWljIHN1YnRlc3RzLCB3aXRoIG9uZSBkeW5hbWljIHN1YnRlc3QgcGVy
IGFjdHVhbGx5Cj4gcHJlc2VudCBwaHlzaWNhbCBlbmdpbmUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
UGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEth
dGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9pOTE1
L2dlbV9leGVjX2Jhc2ljLmMgfCAyNiArKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaTkxNS9nZW1fZXhlY19iYXNpYy5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19i
YXNpYy5jCj4gaW5kZXggMTI4Nzg2MGIuLmIyZDZkZGMyIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5
MTUvZ2VtX2V4ZWNfYmFzaWMuYwo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYwo+
IEBAIC0xNTksMTMgKzE1OSwyNSBAQCBpZ3RfbWFpbgo+ICAgICAgICAgaWd0X3N1YnRlc3QoImd0
dC1hbGwiKQo+ICAgICAgICAgICAgICAgICBndHRfYWxsKGZkKTsKPiAgCj4gLSAgICAgICBfX2Zv
cl9lYWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZSkgewo+IC0gICAgICAgICAgICAgICBpZ3Rfc3Vi
dGVzdF9mKCJiYXNpYy0lcyIsIGUtPm5hbWUpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgbm9v
cChmZCwgZS0+ZmxhZ3MpOwo+IC0gICAgICAgICAgICAgICBpZ3Rfc3VidGVzdF9mKCJyZWFkb25s
eS0lcyIsIGUtPm5hbWUpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmVhZG9ubHkoZmQsIGUt
PmZsYWdzKTsKPiAtICAgICAgICAgICAgICAgaWd0X3N1YnRlc3RfZigiZ3R0LSVzIiwgZS0+bmFt
ZSkKPiAtICAgICAgICAgICAgICAgICAgICAgICBndHQoZmQsIGUtPmZsYWdzKTsKPiArICAgICAg
IGlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pY19zdWJzdWJ0ZXN0cygiYmFzaWMiKSB7CgppZ3Rfc3Vi
dGVzdF93aXRoX2R5bmFtaWMoImJhc2ljIikKCj4gKyAgICAgICAgICAgICAgIF9fZm9yX2VhY2hf
cGh5c2ljYWxfZW5naW5lKGZkLCBlKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWd0X2R5
bmFtaWNfc3Vic3VidGVzdF9mKCIlcyIsIGUtPm5hbWUpCgppZ3RfZHluYW1pY19mKCkKClNpbXBs
eSByZWdhcmQgaWd0X2R5bmFtaWMgYXMgYmVpbmcgYSBwYXJ0aWN1bGFyIGNhc2Ugd2l0aGluIHRo
ZSBncm91cD8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
