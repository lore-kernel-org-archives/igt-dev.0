Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1FE6E8B1
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Apr 2018 21:16:06 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180405104954.6880-1-maarten.lankhorst@linux.intel.com>
 <2bfeee9e0882e9370a325e6e2b125cc8d1972149.camel@intel.com>
In-Reply-To: <2bfeee9e0882e9370a325e6e2b125cc8d1972149.camel@intel.com>
Message-ID: <152296295828.23264.8747800026923056263@mail.alporthouse.com>
Date: Thu, 05 Apr 2018 22:15:58 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_debugfs: Add timeouts to
 opening pipe CRC fd.
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
To: "Souza, Jose" <jose.souza@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBTb3V6YSwgSm9zZSAoMjAxOC0wNC0wNSAyMjowMzo0NikKPiBPbiBUaHUsIDIwMTgt
MDQtMDUgYXQgMTI6NDkgKzAyMDAsIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOgo+ID4gVGhpcyB3
aWxsIGZpeCB0aGUgUFNSIHRlc3RzIHRvIGZhaWwgc2xpZ2h0bHkgZmFzdGVyLCBzaW5jZSB0aGV5
IHdhaXQKPiA+IGluZGVmaW5pdGVseSBmb3IgYSBDUkMgdGhhdCBuZXZlciBjb21lcyBkdXJpbmcg
b3Blbi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+IC0tLQo+ID4gIGxpYi9pZ3RfZGVidWdmcy5j
IHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRp
ZmYgLS1naXQgYS9saWIvaWd0X2RlYnVnZnMuYyBiL2xpYi9pZ3RfZGVidWdmcy5jCj4gPiBpbmRl
eCA4YWRjMDJlOWNjNDcuLjA5NGRmNTY0YjZmNCAxMDA2NDQKPiA+IC0tLSBhL2xpYi9pZ3RfZGVi
dWdmcy5jCj4gPiArKysgYi9saWIvaWd0X2RlYnVnZnMuYwo+ID4gQEAgLTc1Nyw3ICs3NTcsMTAg
QEAgdm9pZCBpZ3RfcGlwZV9jcmNfc3RhcnQoaWd0X3BpcGVfY3JjX3QKPiA+ICpwaXBlX2NyYykK
PiA+ICAKPiA+ICAgICAgIHNwcmludGYoYnVmLCAiY3J0Yy0lZC9jcmMvZGF0YSIsIHBpcGVfY3Jj
LT5waXBlKTsKPiA+ICAKPiA+ICsgICAgIGlndF9zZXRfdGltZW91dCg1LCAiT3BlbmluZyBjcmMg
ZmQsIHdoaWNoIHdhaXRzIGZvciBmaXJzdAo+ID4gQ1JDLiIpOwo+ID4gICAgICAgcGlwZV9jcmMt
PmNyY19mZCA9IG9wZW5hdChwaXBlX2NyYy0+ZGlyLCBidWYsIHBpcGVfY3JjLQo+ID4gPmZsYWdz
KTsKPiA+ICsgICAgIGlndF9yZXNldF90aW1lb3V0KCk7Cj4gCj4gSHVtIEkgd2FzIGFibGUgdG8g
cmVwcm9kdWNlIHRoaXMgb25lIHRvbyBpbiBhIEtCTCwgSSB3YXMgdGhpbmtpbmcgaW4KPiBhZGQg
YSB0aW1lb3V0IGluIHRoZSBrZXJuZWwgc2lkZSwgaWYgaXQgZG9uJ3QgZ2V0IHRoZSBDUkMgYnVm
ZmVyIGZpbGxlZAo+IGl0IHdvdWxkIHJldHVybiBhIGVycm9yLgoKVGhhdCB3b3VsZCBiZSB1bmV4
cGVjdGVkIGJlaGF2aW91ciBmb3IgYSByZWFkKCkgaW50ZXJmYWNlLiBJZiB5b3Ugd2FudCBhCnRp
bWVvdXQsIGltcGxlbWVudCBwb2xsKCkuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
