Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDFC6E133
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 16:09:09 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190321160528.4131-3-andi.shyti@intel.com>
References: <20190321160528.4131-1-andi.shyti@intel.com>
 <20190321160528.4131-3-andi.shyti@intel.com>
Message-ID: <155318452866.26447.14732955258454215205@skylake-alporthouse-com>
Date: Thu, 21 Mar 2019 16:08:49 +0000
Subject: Re: [igt-dev] [PATCH v15 2/5] lib: ioctl_wrappers: reach engines by
 index as well
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
To: Andi Shyti <andi.shyti@intel.com>, IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTAzLTIxIDE2OjA1OjI1KQo+ICtib29sIGdlbV9jb250
ZXh0X2hhc19lbmdpbmUoaW50IGZkLCB1aW50MzJfdCBjdHgsIHVpbnQzMl90IGVuZ2luZSkKPiAr
ewo+ICsgICAgICAgc3RydWN0IGRybV9pOTE1X2dlbV9leGVjYnVmZmVyMiBleGVjYnVmOwo+ICsg
ICAgICAgc3RydWN0IGRybV9pOTE1X2dlbV9leGVjX29iamVjdDIgZXhlYzsKPiArCj4gKyAgICAg
ICAvKiBzaWxseSBBQkksIHRoZSBrZXJuZWwgdGhpbmtzIGV2ZXJ5b25lIHdobyBoYXMgQlNEIGFs
c28gaGFzIEJTRDIgKi8KPiArICAgICAgIGlmICgoZW5naW5lICYgfigzPDwxMykpID09IEk5MTVf
RVhFQ19CU0QpIHsKPiArICAgICAgICAgICAgICAgaWYgKGVuZ2luZSAmICgzIDw8IDEzKSAmJiAh
Z2VtX2hhc19ic2QyKGZkKSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7
Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgbWVtc2V0KCZleGVjLCAwLCBzaXplb2YoZXhlYykp
Owo+ICsgICAgICAgbWVtc2V0KCZleGVjYnVmLCAwLCBzaXplb2YoZXhlY2J1ZikpOwo+ICsgICAg
ICAgZXhlY2J1Zi5idWZmZXJzX3B0ciA9IHRvX3VzZXJfcG9pbnRlcigmZXhlYyk7Cj4gKyAgICAg
ICBleGVjYnVmLmJ1ZmZlcl9jb3VudCA9IDE7Cj4gKyAgICAgICBleGVjYnVmLmZsYWdzID0gZW5n
aW5lOwo+ICsgICAgICAgZXhlY2J1Zi5yc3ZkMSA9IGN0eDsKPiArCj4gKyAgICAgICByZXR1cm4g
X19nZW1fZXhlY2J1ZihmZCwgJmV4ZWNidWYpID09IC1FTk9FTlQ7Cj4gK30KPiBkaWZmIC0tZ2l0
IGEvbGliL2k5MTUvZ2VtX2NvbnRleHQuaCBiL2xpYi9pOTE1L2dlbV9jb250ZXh0LmgKPiBpbmRl
eCBhZWY2OGRkYTZiMjYuLmRkNjRlYmYxN2ZiZCAxMDA2NDQKPiAtLS0gYS9saWIvaTkxNS9nZW1f
Y29udGV4dC5oCj4gKysrIGIvbGliL2k5MTUvZ2VtX2NvbnRleHQuaAo+IEBAIC00NSw0ICs0NSw2
IEBAIGludCBfX2dlbV9jb250ZXh0X2dldF9wYXJhbShpbnQgZmQsIHN0cnVjdCBkcm1faTkxNV9n
ZW1fY29udGV4dF9wYXJhbSAqcCk7Cj4gIGludCBfX2dlbV9jb250ZXh0X3NldF9wcmlvcml0eShp
bnQgZmQsIHVpbnQzMl90IGN0eCwgaW50IHByaW8pOwo+ICB2b2lkIGdlbV9jb250ZXh0X3NldF9w
cmlvcml0eShpbnQgZmQsIHVpbnQzMl90IGN0eCwgaW50IHByaW8pOwo+ICAKPiArYm9vbCBnZW1f
Y29udGV4dF9oYXNfZW5naW5lKGludCBmZCwgdW5zaWduZWQgZW5naW5lLCB1bnNpZ25lZCBjdHgp
OwoKSG1tLiBEbyB3ZSBoYXZlIElMUDY0IG9yIExQNjQ/IEkgdGhpbmsgd2UncmUgTFA2NC4gTGV0
J3Mgc2VlIHdoYXQgQ0kKdGhpbmtzLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
