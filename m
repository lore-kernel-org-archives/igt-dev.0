Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A536E67C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 09:21:08 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190213011956.GD4740@intel.intel>
References: <20190212235437.1218-1-andi.shyti@intel.com>
 <20190212235437.1218-4-andi.shyti@intel.com>
 <155001699227.13414.2484948947032679048@skylake-alporthouse-com>
 <20190213011956.GD4740@intel.intel>
Message-ID: <155004960810.11832.6151477497817552511@skylake-alporthouse-com>
Date: Wed, 13 Feb 2019 09:20:08 +0000
Subject: Re: [igt-dev] [RFC PATCH v8 3/5] lib/igt_gt: use for_each_engine2
 to loop through engines
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
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTAyLTEzIDAxOjE5OjU2KQo+IEhpIENocmlzLAo+IAo+
ID4gPiArI2RlZmluZSBmb3JfZWFjaF9lbmdpbmUyKGZkLCBjdHgsIGUpIFwKPiA+ID4gKyAgICAg
ICAgICAgICAgIGZvciAoX19zZXRfY3R4X2VuZ2luZV9tYXAoZmQsIGN0eF9pZCksIFwKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgZSA9IGludGVsX2FjdGl2ZV9lbmdpbmVzMjsgZS0+bmFtZTsg
ZSsrKSBcCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGZvcl9pZiAoZ2VtX2hhc19nZXRf
c2V0X3BhcmFtKCkgfHwgXAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdl
bV9oYXNfZW5naW5lKGZkLCBlLT5jbGFzcywgZS0+aW5zdGFuY2UpKQo+ID4gCj4gPiBpbnRlbF9h
Y3RpdmVfZW5naW5lczIgY2FuIGRlZmluZSBlLT5mbGFncywgYW5kIHRoZW4geW91IGNhbiBqdXN0
IHVzZQo+ID4gZ2VtX2hhc19yaW5nKGZkLCBlLT5mbGFncykgZm9yIGJvdGggY3R4LT5lbmdpbmVz
W10gYW5kIGxlZ2FjeS4KPiAKPiBTb3JyeSwgSSBoYXZlbid0IHVuZGVyc3Rvb2Q6ICdlJyBpcyAn
aW50ZWxfZXhlY3V0aW9uX2VuZ2luZTInIGFuZAo+IGRvZXNuJ3QgaGF2ZSBmbGFncy4gSW5kZWVk
IEkgY2FsbCBpdCBhczoKClRoZW4gZml4IGl0LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
