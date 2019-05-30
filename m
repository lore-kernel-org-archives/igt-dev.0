Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EF46E15F
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2019 15:50:52 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190530154222.16804-1-ramalingam.c@intel.com>
 <20190530154222.16804-6-ramalingam.c@intel.com>
In-Reply-To: <20190530154222.16804-6-ramalingam.c@intel.com>
Message-ID: <155923144765.27302.9057723698511741237@skylake-alporthouse-com>
Date: Thu, 30 May 2019 16:50:47 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v2 5/5] test/prime_vgem: use the
 gem_engine_topology library
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
To: Ramalingam C <ramalingam.c@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBSYW1hbGluZ2FtIEMgKDIwMTktMDUtMzAgMTY6NDI6MjIpCj4gUmVwbGFjZSB0aGUg
bGVnYWN5IGZvcl9lYWNoX2VuZ2luZSogZGVmaW5lcyB3aXRoIHRoZSBvbmVzCj4gaW1wbGVtZW50
ZWQgaW4gdGhlIGdlbV9lbmdpbmVfdG9wb2xvZ3kgbGlicmFyeS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL3By
aW1lX3ZnZW0uYyB8IDcwICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9wcmltZV92Z2VtLmMgYi90ZXN0cy9wcmltZV92Z2Vt
LmMKPiBpbmRleCA2OWFlOGM5YjA3MTAuLjc2ODlmNmIzZDZjOCAxMDA2NDQKPiAtLS0gYS90ZXN0
cy9wcmltZV92Z2VtLmMKPiArKysgYi90ZXN0cy9wcmltZV92Z2VtLmMKPiBAQCAtMzI1LDcgKzMy
NSw3IEBAIHN0YXRpYyBib29sIHByaW1lX2J1c3koaW50IGZkLCBib29sIGV4Y2wpCj4gICAgICAg
ICByZXR1cm4gcG9sbCgmcGZkLCAxLCAwKSA9PSAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCB3
b3JrKGludCBpOTE1LCBpbnQgZG1hYnVmLCB1bnNpZ25lZCByaW5nLCB1aW50MzJfdCBmbGFncykK
PiArc3RhdGljIHZvaWQgd29yayhpbnQgaTkxNSwgaW50IGRtYWJ1ZiwgY29uc3Qgc3RydWN0IGlu
dGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplKQo+ICB7Cj4gICAgICAgICBjb25zdCBpbnQgU0NSQVRD
SCA9IDA7Cj4gICAgICAgICBjb25zdCBpbnQgQkFUQ0ggPSAxOwo+IEBAIC0zNDEsNyArMzQxLDcg
QEAgc3RhdGljIHZvaWQgd29yayhpbnQgaTkxNSwgaW50IGRtYWJ1ZiwgdW5zaWduZWQgcmluZywg
dWludDMyX3QgZmxhZ3MpCj4gICAgICAgICBtZW1zZXQoJmV4ZWNidWYsIDAsIHNpemVvZihleGVj
YnVmKSk7Cj4gICAgICAgICBleGVjYnVmLmJ1ZmZlcnNfcHRyID0gKHVpbnRwdHJfdClvYmo7Cj4g
ICAgICAgICBleGVjYnVmLmJ1ZmZlcl9jb3VudCA9IDI7Cj4gLSAgICAgICBleGVjYnVmLmZsYWdz
ID0gcmluZyB8IGZsYWdzOwo+ICsgICAgICAgZXhlY2J1Zi5mbGFncyA9IGUgPyBlLT5mbGFncyA6
IEk5MTVfRVhFQ19ERUZBVUxUOwoKQWdhaW4sIHRoaXMgaXMgcmFuZG9tIHNlbGVjdGlvbi4gSTkx
NV9FWEVDX0RFRkFVTFQgaXMgZGFuZ2Vyb3VzIG9uY2UgYQpyYW5kb20gZW5naW5lIG1hcCBoYXMg
YmVlbiBpbnN0YWxsZWQuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXY=
