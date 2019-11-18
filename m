Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B268889755
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2019 11:04:09 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191118101731.22772-1-petri.latvala@intel.com>
In-Reply-To: <20191118101731.22772-1-petri.latvala@intel.com>
Message-ID: <157407504471.24372.7799827044211688275@skylake-alporthouse-com>
Date: Mon, 18 Nov 2019 11:04:04 +0000
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
IGlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pY19zdWJzdWJ0ZXN0cygiYmFzaWMiKSB7CgpQZXRyaSBu
b3RlZCB0aGF0IHdpdGggZHluYW1pYywgdGhlICotYWxsIHZhcmlhbnRzIGFyZSBzdXBlcmZsdW91
cywgc28KaGF2ZSBhIHByZS1lbXB0aXZlClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KZm9yIHRoZWlyIHJlbW92YWwuCi1DaHJpcwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
