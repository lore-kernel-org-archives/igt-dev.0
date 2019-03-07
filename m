Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24DB6E227
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 21:48:20 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190307213926.18051-2-ville.syrjala@linux.intel.com>
References: <20190307213926.18051-1-ville.syrjala@linux.intel.com>
 <20190307213926.18051-2-ville.syrjala@linux.intel.com>
Message-ID: <155199529401.27405.5855883981529801961@skylake-alporthouse-com>
Date: Thu, 07 Mar 2019 21:48:14 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] tests/kms_setmode: Request the
 initial vbl count with RELATIVE instead of ABSOLUTE
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE5LTAzLTA3IDIxOjM5OjIzKQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gQXNraW5nIGZv
ciB0aGUgaW5pdGlhbCB2YmxhbmsgY291bnQgYnkgc3BlY2lmeWluZyBhbmQgYWJzb2x1dGUgdmJs
YW5rIGNvdW50IG9mIDAKPiBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZS4gU3dpdGNoIHRvIGEgcmVs
YXRpdmUgcXVlcnkgaW5zdGVhZC4KPiAKPiBJdCBkb2Vzbid0IGxvb2sgbGlrZSB3ZSBjYXJlIGFi
b3V0IGxpbmluZyB1cCBvbiB0aGUgZmlyc3QgdmJsYW5rIGJvdW5kYXJ5IHNvCj4gd2UgY2FuIGp1
c3QgZHJvcCB0aGUgTkVYVE9OTUlTUyBmbGFnLiBPbmx5IHRoZSByZWxhdGl2ZSB0aW1lc3RhbXBz
IG9mIHRoZQo+IGV2ZW50cyB3aWxsIG1hdHRlci4KPiAKPiB2MjogRHJvcCB0aGUgTkVYVE9OTUlT
UyAoRGFuaWVsKQoKTm8sIHRoaXMgaXNuJ3QgYWJvdXQgZ2V0dGluZyB0aGUgY3VycmVudCB2Ymxh
bmssIGl0J3MgYWJvdXQgYWxpZ25pbmcgdGhlCnRlc3QgdG8gdGhlIHN0YXJ0IG9mIHRoZSBuZXh0
IHZibGFuayBwZXJpb2QsIHNvIHRoYXQgaXMgbXVjaCBsZXNzIG9mIGEKY2hhbmNlIG9mIHRoYXQg
dmJsYW5rIGhhcHBlbmluZyBkdXJpbmcgdGhlIHNldHVwLiBGb3Igd2hpY2ggTkVYVE9OTUlTUwpp
cyBlc3NlbnRpYWwuIFlvdSBjb3VsZCBsb29rIGF0IHRoZSB0aW1lc3RhbXAgYW5kIHNheSBpZiB3
aXRoaW4gMW1zIG9mCnRoZSBuZXh0IHZibGFuaywgZGVmZXI/IFdhc3RpbmcgOG1zIGlzIGEgbnVp
c2FuY2UgYnV0IGEgcGl0dGFuY2UKY29tcGFyZWQgdG8gdGhlIH4ycyBydW50aW1lLgotQ2hyaXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
