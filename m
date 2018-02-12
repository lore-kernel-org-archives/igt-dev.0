Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F0889805
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Feb 2018 11:40:06 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180212113607.5365-1-tvrtko.ursulin@linux.intel.com>
References: <151842975332.18923.2075860843448614172@mail.alporthouse.com>
 <20180212113607.5365-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <151843559874.18923.1767563293173769268@mail.alporthouse.com>
Date: Mon, 12 Feb 2018 11:39:58 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/3] tests/perf_pmu: Give sampling
 more time
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
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMi0xMiAxMTozNjowNykKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFdlIGdldCBvY2Nhc2lv
bmFsIGVycm9ycyBsaWtlOgo+IAo+ICAocGVyZl9wbXU6MjEzMTUpIENSSVRJQ0FMOiBUZXN0IGFz
c2VydGlvbiBmYWlsdXJlIGZ1bmN0aW9uIHNlbWFfd2FpdCwgZmlsZSBwZXJmX3BtdS5jOjYzMToK
PiAgKHBlcmZfcG11OjIxMzE1KSBDUklUSUNBTDogRmFpbGVkIGFzc2VydGlvbjogKGRvdWJsZSko
dmFsWzFdIC0gdmFsWzBdKSA8PSAoMS4wICsgKHRvbGVyYW5jZSkpICogKGRvdWJsZSkoc2xlcHQp
ICYmIChkb3VibGUpKHZhbFsxXSAtIHZhbFswXSkgPj0gKDEuMCAtICh0b2xlcmFuY2UpKSAqIChk
b3VibGUpKHNsZXB0KQo+ICAocGVyZl9wbXU6MjEzMTUpIENSSVRJQ0FMOiAndmFsWzFdIC0gdmFs
WzBdJyAhPSAnc2xlcHQnICg0NTAwMDAwMDAuMDAwMDAwIG5vdCB3aXRoaW4gNS4wMDAwMDAlIHRv
bGVyYW5jZSBvZiA1MDAxMjk2MTguMDAwMDAwKQo+IAo+IFN1Z2dlc3RpbmcgYSB0aW1lIGRpc2Fn
cmVlbWVudCBiZXR3ZWVuIHVzZXJzcGFjZSBhbmQgdGhlIFBNVS4KPiAKPiBBdCB0aGUgbW9tZW50
IEkgZ290IG5vIGJldHRlciBpZGVhcyB0aGFuIGZpZGRsaW5nIHdpdGggZGVsYXlzIHRvIHNlZSBp
ZiBpdAo+IGltcHJvdmVzIHRoaW5ncy4KPiAKPiB2MjogV2FpdCBmb3Igc2FtcGxpbmcgdG8gc3Rh
cnQgaW5zdGVhZCBvZiBoYXJkY29kZWQgc2xlZXAuIChDaHJpcyBXaWxzb24pCj4gCj4gU2lnbmVk
LW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KUmV2aWV3
ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgoKU2FkbHkgYSBj
b25zZXF1ZW5jZSBpcyBnb2luZyB0byBiZSB0aGF0IDFtcyBtaW5pbXVtIGRlbGF5LCBidXQgc2h1
Y2tzLgpJJ20gbG9va2luZyBhdCB0aGUgb3Blbi1jb2RlZCB3YWl0IGZvciBiYXRjaCB0byBzdGFy
dCBuZXh0IDopCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
