Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE1689F3B
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 11:07:21 +0000 (UTC)
Date: Wed, 13 Feb 2019 13:07:16 +0200
Message-ID: <20190213110716.GB2104@intel.intel>
References: <20190212235437.1218-1-andi.shyti@intel.com>
 <20190212235437.1218-4-andi.shyti@intel.com>
 <155001699227.13414.2484948947032679048@skylake-alporthouse-com>
 <20190213011956.GD4740@intel.intel>
 <155004960810.11832.6151477497817552511@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155004960810.11832.6151477497817552511@skylake-alporthouse-com>
Subject: Re: [igt-dev] [RFC PATCH v8 3/5] lib/igt_gt: use for_each_engine2
 to loop through engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: Andi Shyti via igt-dev <igt-dev@lists.freedesktop.org>
Reply-To: Andi Shyti <andi.shyti@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgQ2hyaXMsCgo+ID4gPiA+ICsjZGVmaW5lIGZvcl9lYWNoX2VuZ2luZTIoZmQsIGN0eCwgZSkg
XAo+ID4gPiA+ICsgICAgICAgICAgICAgICBmb3IgKF9fc2V0X2N0eF9lbmdpbmVfbWFwKGZkLCBj
dHhfaWQpLCBcCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgZSA9IGludGVsX2FjdGl2ZV9l
bmdpbmVzMjsgZS0+bmFtZTsgZSsrKSBcCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
Zm9yX2lmIChnZW1faGFzX2dldF9zZXRfcGFyYW0oKSB8fCBcCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBnZW1faGFzX2VuZ2luZShmZCwgZS0+Y2xhc3MsIGUtPmluc3Rh
bmNlKSkKPiA+ID4gCj4gPiA+IGludGVsX2FjdGl2ZV9lbmdpbmVzMiBjYW4gZGVmaW5lIGUtPmZs
YWdzLCBhbmQgdGhlbiB5b3UgY2FuIGp1c3QgdXNlCj4gPiA+IGdlbV9oYXNfcmluZyhmZCwgZS0+
ZmxhZ3MpIGZvciBib3RoIGN0eC0+ZW5naW5lc1tdIGFuZCBsZWdhY3kuCj4gPiAKPiA+IFNvcnJ5
LCBJIGhhdmVuJ3QgdW5kZXJzdG9vZDogJ2UnIGlzICdpbnRlbF9leGVjdXRpb25fZW5naW5lMicg
YW5kCj4gPiBkb2Vzbid0IGhhdmUgZmxhZ3MuIEluZGVlZCBJIGNhbGwgaXQgYXM6Cj4gCj4gVGhl
biBmaXggaXQuCgpJZiB3ZSB3YW50IHRvIGFkZCBmbGFncyBpbiAnaW50ZWxfZXhlY3V0aW9uX2Vu
Z2luZTInIChJIHRyaWVkIHRvCm1pbmltaXplIHRoZSBhbW91bnQgb2YgY2hhbmdlcyBvdXRzaWRl
IG9mIG15IHBhcnQpLCB0aGVuIHRoZQp3aG9sZSB0aGluZyBjYW4gY29tZSBvdXQgbmljZXIgYW5k
IEkgZ3Vlc3MgY291bGQgZ2V0IHJpZCBvZiB0aGUKJ2dlbV9jbGFzc19pbnN0YW5jZV90b19lYl9m
bGFncygpJyBmdW5jdGlvbi4KCkJ1dCBJIHRoaW5rIHRoaXMgaXMgYSBiaXQgb2ZmLXRvcGljIGZy
b20gdGhpcyBwYXRjaCBzZXJpZXMgYW5kIEkKY2FuIGFkZCBpdCBpbiBteSB0by1kbyBsaXN0ICh3
aGljaCB3b3VsZCB0aGlzIHdheSBoYXZlIGFscmVhZHkKdHdvIGl0ZW1zKSBmb3IgdGhlIG5leHQg
ZGF5cy4KCkFuZGkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
