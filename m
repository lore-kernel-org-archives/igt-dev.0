Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729D86E10E
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2019 11:51:32 +0000 (UTC)
Date: Thu, 18 Apr 2019 14:51:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190418115129.GI1747@intel.com>
References: <20190417203544.22298-1-ville.syrjala@linux.intel.com>
 <155553353889.25904.14271529533299776329@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155553353889.25904.14271529533299776329@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] lib/igt_fb: Unref the renderecopy
 scratch bos
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMDk6Mzg6NThQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgVmlsbGUgU3lyamFsYSAoMjAxOS0wNC0xNyAyMTozNTo0MCkKPiA+IEZy
b206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiAK
PiA+IFdlJ3JlIGN1cnJlbnRseSBsZWFraW5nIGFsbCB0aGUgdGVtcG9yYXJ5IGJvcyB3ZSBjb25z
dHJ1Y3QKPiA+IGZvciByZW5kZXJjb3B5LiBUaGF0IGRvZXNuJ3QgZ28gc28gd2VsbCB3aGVuIHRy
eWluZyB0byB0ZXN0Cj4gPiB3aXRoIDFHaUIgZnJhbWVidWZmZXJzLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+
ID4gLS0tCj4gPiAgbGliL2lndF9mYi5jIHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0
X2ZiLmMKPiA+IGluZGV4IDZhNDNmY2M0NzM1Zi4uYzNlY2Q3MTg2NDQ0IDEwMDY0NAo+ID4gLS0t
IGEvbGliL2lndF9mYi5jCj4gPiArKysgYi9saWIvaWd0X2ZiLmMKPiA+IEBAIC0xNjQ3LDYgKzE2
NDcsOSBAQCBzdGF0aWMgdm9pZCByZW5kZXJjb3B5KHN0cnVjdCBmYl9ibGl0X3VwbG9hZCAqYmxp
dCwKPiA+ICAgICAgICAgcmVuZGVyX2NvcHkoYmxpdC0+YmF0Y2gsIE5VTEwsCj4gPiAgICAgICAg
ICAgICAgICAgICAgICZzcmMsIDAsIDAsIGRzdF9mYi0+cGxhbmVfd2lkdGhbMF0sIGRzdF9mYi0+
cGxhbmVfaGVpZ2h0WzBdLAo+ID4gICAgICAgICAgICAgICAgICAgICAmZHN0LCAwLCAwKTsKPiA+
ICsKPiA+ICsgICAgICAgZHJtX2ludGVsX2JvX3VucmVmZXJlbmNlKGRzdC5ibyk7Cj4gPiArICAg
ICAgIGRybV9pbnRlbF9ib191bnJlZmVyZW5jZShzcmMuYm8pOwo+IAo+IEZvciBzeW1tZXRyeSBJ
IHdvdWxkIHN1Z2dlc3QgYSBmaW5pX2J1ZigpLgoKSSBoYWQgdGhhdCwgYnV0IHRoZW4gZGVjaWRl
ZCBpdCB3YXMgcG9pbnRsZXNzIDovCkJ1dCBJIGNhbiBhZGQgaXQgYmFjay4KCj4gUmV2aWV3ZWQt
Ynk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IC1DaHJpcwoKLS0g
ClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXY=
