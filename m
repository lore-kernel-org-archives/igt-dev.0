Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0986B6E9F2
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2019 10:50:59 +0000 (UTC)
Date: Thu, 4 Apr 2019 13:50:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190404105055.GC3888@intel.com>
References: <20190403154104.20708-1-ville.syrjala@linux.intel.com>
 <155436381344.7532.1708058939274624952@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155436381344.7532.1708058939274624952@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/rendercopy: Assert that buffer
 dimensions/stride are acceptable
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

T24gVGh1LCBBcHIgMDQsIDIwMTkgYXQgMDg6NDM6MzhBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgVmlsbGUgU3lyamFsYSAoMjAxOS0wNC0wMyAxNjo0MTowNCkKPiA+IEZy
b206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiAK
PiA+IFNwcmlua2xlIHNvbWUgYXNzZXJ0cyBpbnRvIHJlbmRlcmNvcHkgdG8gbWFrZSBzdXJlIHdl
IGRvbid0IHRyeQo+ID4gdG8gZXhjZWVkIHRoZSByZW5kZXIgZW5naW5lIHN1cmZhY2Ugc2l6ZS9z
dHJpZGUgbGltaXRhdGlvbnMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiAtLS0KPiA+IGRpZmYgLS1naXQg
YS9saWIvcmVuZGVyY29weV9nZW42LmMgYi9saWIvcmVuZGVyY29weV9nZW42LmMKPiA+IGluZGV4
IGY0YzAxMDVhODBkYi4uYTYxNTdjZmM3MGY2IDEwMDY0NAo+ID4gLS0tIGEvbGliL3JlbmRlcmNv
cHlfZ2VuNi5jCj4gPiArKysgYi9saWIvcmVuZGVyY29weV9nZW42LmMKPiA+IEBAIC03OSw2ICs3
OSwxMCBAQCBnZW42X2JpbmRfYnVmKHN0cnVjdCBpbnRlbF9iYXRjaGJ1ZmZlciAqYmF0Y2gsIGNv
bnN0IHN0cnVjdCBpZ3RfYnVmICpidWYsCj4gPiAgICAgICAgIHVpbnQzMl90IHdyaXRlX2RvbWFp
biwgcmVhZF9kb21haW47Cj4gPiAgICAgICAgIGludCByZXQ7Cj4gPiAgCj4gPiArICAgICAgIGln
dF9hc3NlcnRfbHRlKGJ1Zi0+c3RyaWRlLCAxMjgqMTAyNCk7Cj4gPiArICAgICAgIGlndF9hc3Nl
cnRfbHRlKGlndF9idWZfd2lkdGgoYnVmKSwgODE5Mik7Cj4gPiArICAgICAgIGlndF9hc3NlcnRf
bHRlKGlndF9idWZfaGVpZ2h0KGJ1ZiksIDgxOTIpOwo+IAo+IEluZGVlZC4gSSBoYWQgaXQgZG93
biBhcyAyNTZrLCBidXQgdGhlIGZpZWxkIHNlZW1zIHRvIGJlIG9ubHkgMTdiIGFuZAo+IG5vdCAx
OGIgYXMgaXZiKy4KClllYWgsIEkgaGFkIHRoZSBzYW1lIG1pc2NvbmNlcHRpb24gd2hlbiB3b3Jr
aW5nIG9uIHRoZSBndHQgcmVtYXBwaW5nCnN0dWZmLiBBbHNvIHNvbWUgdmVyc2lvbiBvZiB0aGUg
c3BlYyBldmVuIG1pc3Rha2VubHkgZG9jdW1lbnRlZCBpdAphcyA1MTJrIElJUkMKCj4gUmV2aWV3
ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgoKVGEuIFB1c2hl
ZC4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
