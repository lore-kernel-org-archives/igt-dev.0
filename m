Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D586E52A
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2019 08:26:54 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <138aab85-ea9c-e305-fa7d-e13e235a1c9a@linux.intel.com>
References: <20190619221911.2684-1-andi.shyti@intel.com>
 <f841495e-b5cd-9249-2d18-282885fb5945@linux.intel.com>
 <20190620075232.GA10328@jack.zhora.eu>
 <138aab85-ea9c-e305-fa7d-e13e235a1c9a@linux.intel.com>
Message-ID: <156101921051.664.1886677011237204755@skylake-alporthouse-com>
Date: Thu, 20 Jun 2019 09:26:50 +0100
Subject: Re: [igt-dev] [PATCH] lib/i915: gem_engine_topology: get eb flags
 from engine's coordiantes
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
To: Andi Shyti <andi@etezian.org>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: IGT dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNi0yMCAwOToxMjo1NSkKPiAKPiBPbiAyMC8w
Ni8yMDE5IDA4OjUyLCBBbmRpIFNoeXRpIHdyb3RlOgo+ID4gSGkgVHZydGtvLAo+ID4gCj4gPj4+
ICsgICBzdHJ1Y3QgaW50ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmU7Cj4gPj4+ICsKPiA+Pj4gKyAg
IGZvcl9lYWNoX2NvbnRleHRfZW5naW5lKGZkLCBjdHhfaWQsIGUpCj4gPj4+ICsgICAgICAgICAg
IGlmIChjbGFzcyA9PSBlLT5jbGFzcyAmJiBpbnN0YW5jZSA9PSBlLT5pbnN0YW5jZSkKPiA+Pj4g
KyAgICAgICAgICAgICAgICAgICByZXR1cm4gZS0+ZmxhZ3M7Cj4gPj4KPiA+PiBBbmQgbW9zdCBp
bXBvcnRhbnQgZGlmZmVyZW5jZSwgSSB3b3VsZG4ndCBjb25maWd1cmUgdGhlIGNvbnRleHQgZnJv
bSB0aGlzIGhlbHBlci4gSW5zdGVhZCBJIHRoaW5rIGFsbCB3ZSBuZWVkIGlzOgo+ID4+Cj4gPj4g
aW50IGdlbV9jb250ZXh0X2dldF9lYl9mbGFncyhpbnQgZmQsIHVpbnQzMl90IGN0eCwgc3RydWN0
IGk5MTVfZW5naW5lX2NsYXNzX2luc3RhbmNlIGNpKQo+ID4+IHsKCltzbmlwXQoKPiBJIHRoaW5r
IGl0IHdvdWxkIGJlIHdyb25nIHRvIGNvbmZpZ3VyZSB0aGUgY29udGV4dCBmcm9tIHRoaXMgaGVs
cGVyLiBUaGUgCj4gbmFtZSBvZiB0aGUgZnVuY3Rpb24gdHJhbnNsYXRlcyB0byAiZ2l2ZSBtZSBj
b3JyZWN0IGViLmZsYWdzIGZvciB0aGlzIAo+IGNvbnRleHQgdG8gc3VibWl0IHRvIHRoaXMgY2xh
c3M6aW5zdGFuY2UiLiBBbGwgZnVuY3Rpb24gbmVlZHMgdG8gZG8gaXMgCj4gdG8gYW5zd2VyIHRo
aXMgcXVlc3Rpb24gYm90aCBvbiBsZWdhY3kgYW5kIG5ldyBrZXJuZWxzLgoKWWVzLiBJIHRoaW5r
IGl0IHdvdWxkIGJlIG1vc3Qgc3VycHJpc2luZyBpZiBhIGdldHRlciByZWNvbmZpZ3VyZWQgdGhl
CmNvbnRleHQuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
