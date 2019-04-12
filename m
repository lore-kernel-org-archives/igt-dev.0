Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EB3899F0
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2019 16:32:03 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190412153252.GB3111@intel.intel>
References: <20190412003210.18762-1-andi@etezian.org>
 <20190412003210.18762-3-andi@etezian.org>
 <155505699774.24519.13584751792529013522@skylake-alporthouse-com>
 <20190412153252.GB3111@intel.intel>
Message-ID: <155508671698.28089.14848687035493714706@skylake-alporthouse-com>
Date: Fri, 12 Apr 2019 17:31:57 +0100
Subject: Re: [igt-dev] [PATCH v20 2/6] lib/i915: add gem_engine_topology
 library and for_each loop definition
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
To: Andi Shyti <andi.shyti@intel.com>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTA0LTEyIDE2OjMyOjUyKQo+ID4gPiAraW50NjRfdCBn
ZW1fbWFwX2FsbF9lbmdpbmVzKGludCBmZCkKPiA+IAo+ID4gaW50NjRfdD8KPiAKPiB5ZWFoLi4u
IHNob3VsZCBiZSB1aW50MzJfdCwgSSBmb3Jnb3QgZ2VtX2NvbnRleHRfY3JlYXRlIGhhZCBzb21l
Cj4gaWd0X3JlcXVpcmVzLCBJIHRob3VnaHQgMzIgYml0IGZvciBjdHhfaWQgYW5kIHRoZSByZXN0
IGZvcgo+IC1lcnJuby4KPiAKPiBJIGRvbid0IGV2ZW4gbmVlZCAnZ2VtX3JlcXVpcmVfY29udGV4
dHMoKScsIGJlY2F1c2UgaXQKPiBiYXNpY2FsbHkgZG9lcyB0aGUgc2FtZSB0aGluZyBvZiAnZ2Vt
X2NvbnRleHRfY3JlYXRlKCknCj4gCj4gPiBUaGVyZSdzIG5vIGluZGljYXRpb24gdGhpcyBjcmVh
dGVzIGEgY29udGV4dC4KPiA+IAo+ID4gaW50IGdlbV9jb250ZXh0X21hcF9hbGxfZW5naW5lcyhp
bnQgaTkxNSwgdWludDMyX3QgY3R4KQo+IAo+IEkgd2FudGVkIHRoZSBjYWxsZXIgbm90IHRvIGNh
cmUgYWJvdXQgdGhlIGNvbnRleHQuCgpJIGhhdmUgcmVzZXJ2YXRpb25zIHRoYXQgaGlkaW5nIHRo
ZSBjb250ZXh0IGlzIG5vdCB0aGUgYmVzdCBwbGFuLiBBZnRlcgphbGwsIHRoZSBjYWxsZXIgZG9l
cyBoYXZlIHRvIHVzZSB0aGUgY29udGV4dCBsYXRlciBvbi4KCk15IGd1dCBmZWVsaW5nIGlzIHRo
YXQgaXQgd291bGQgYmUgYmV0dGVyIHRvIHBhc3MgdGhlIGNvbnRleHQgaW4sIGJ1dAp0aGUgYmVu
ZWZpdCBvZiBkb3VidCBzYXlzIHlvdSBtdXN0IGhhdmUgZm91bmQgdGhpcyB1c2VmdWwgOikKCj4g
SSBjYW4gcHJvYmFibHkKPiBjYWxsIGl0ICdnZW1fY3JlYXRlX3BvcHVsYXRlZF9jb250ZXh0KCkn
PwoKU3VjaCBpcyB0aGUgZGViYXRlIG9mIHRoZSBhZ2VzLgotQ2hyaXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
