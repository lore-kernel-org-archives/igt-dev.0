Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295366E36C
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 16:45:11 +0000 (UTC)
Date: Fri, 8 Mar 2019 18:45:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190308164507.GU3888@intel.com>
References: <20190307213926.18051-1-ville.syrjala@linux.intel.com>
 <20190307213926.18051-2-ville.syrjala@linux.intel.com>
 <155199529401.27405.5855883981529801961@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155199529401.27405.5855883981529801961@skylake-alporthouse-com>
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMDk6NDg6MTRQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgVmlsbGUgU3lyamFsYSAoMjAxOS0wMy0wNyAyMTozOToyMykKPiA+IEZy
b206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiAK
PiA+IEFza2luZyBmb3IgdGhlIGluaXRpYWwgdmJsYW5rIGNvdW50IGJ5IHNwZWNpZnlpbmcgYW5k
IGFic29sdXRlIHZibGFuayBjb3VudCBvZiAwCj4gPiBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZS4g
U3dpdGNoIHRvIGEgcmVsYXRpdmUgcXVlcnkgaW5zdGVhZC4KPiA+IAo+ID4gSXQgZG9lc24ndCBs
b29rIGxpa2Ugd2UgY2FyZSBhYm91dCBsaW5pbmcgdXAgb24gdGhlIGZpcnN0IHZibGFuayBib3Vu
ZGFyeSBzbwo+ID4gd2UgY2FuIGp1c3QgZHJvcCB0aGUgTkVYVE9OTUlTUyBmbGFnLiBPbmx5IHRo
ZSByZWxhdGl2ZSB0aW1lc3RhbXBzIG9mIHRoZQo+ID4gZXZlbnRzIHdpbGwgbWF0dGVyLgo+ID4g
Cj4gPiB2MjogRHJvcCB0aGUgTkVYVE9OTUlTUyAoRGFuaWVsKQo+IAo+IE5vLCB0aGlzIGlzbid0
IGFib3V0IGdldHRpbmcgdGhlIGN1cnJlbnQgdmJsYW5rLCBpdCdzIGFib3V0IGFsaWduaW5nIHRo
ZQo+IHRlc3QgdG8gdGhlIHN0YXJ0IG9mIHRoZSBuZXh0IHZibGFuayBwZXJpb2QsIHNvIHRoYXQg
aXMgbXVjaCBsZXNzIG9mIGEKPiBjaGFuY2Ugb2YgdGhhdCB2YmxhbmsgaGFwcGVuaW5nIGR1cmlu
ZyB0aGUgc2V0dXAuIEZvciB3aGljaCBORVhUT05NSVNTCj4gaXMgZXNzZW50aWFsLgoKVGhhdCB3
YXMgbXkgb3JpZ2luYWwgYXNzZXNtZW50LCBidXQgdGhlbiBJIGRlY2lkZWQgaXQgd2Fzbid0IG5l
ZWRlZAphZnRlciBhbGwuIENhbid0IHJlY2FsbCBob3cgSSByZWFjaGVkIHRvIHRoYXQgY29uY2x1
c2lvbi4gSSdsbCBwdXQKaXQgYmFjay4KCkhtbS4gSWYgdGhlIHRlc3QgZGlkICcobm93IC0gbGFz
dCkgLyBudW1fZnJhbWVzJyBpdCB3b3VsZG4ndCBtYXR0ZXIKc28gbXVjaCBpZiBtaXNzZWQgYSB2
Ymxhbmsgb3IgdHdvLiBCdXQgSSBzdXBwb3NlIHRoYXQgbWlnaHQgaGlkZQpzb21lIG9mIHRoZSBq
aXR0ZXIuCgo+IFlvdSBjb3VsZCBsb29rIGF0IHRoZSB0aW1lc3RhbXAgYW5kIHNheSBpZiB3aXRo
aW4gMW1zIG9mCj4gdGhlIG5leHQgdmJsYW5rLCBkZWZlcj8gV2FzdGluZyA4bXMgaXMgYSBudWlz
YW5jZSBidXQgYSBwaXR0YW5jZQo+IGNvbXBhcmVkIHRvIHRoZSB+MnMgcnVudGltZS4KPiAtQ2hy
aXMKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
