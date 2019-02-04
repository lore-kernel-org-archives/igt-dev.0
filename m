Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C23E6E15A
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Feb 2019 09:48:10 +0000 (UTC)
Date: Mon, 4 Feb 2019 10:48:07 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20190204094807.GA10822@kdec5-desk.ger.corp.intel.com>
References: <20190202223630.15471-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190202223630.15471-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/perf_pmu: Add trailing
 '\n' to an igt_assert_f
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

T24gU2F0LCBGZWIgMDIsIDIwMTkgYXQgMTA6MzY6MzBQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IEEgbWlzc2luZyBuZXdsaW5lIGF0IHRoZSBlbmQgb2YgYW4gYXNzZXJ0LCBzbyBhZGQg
aXQgZm9yIGNsYXJpdHkgaW4gdGhlCj4gZXJyb3IgbWVzc2FnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KUmV2aWV3ZWQtYnk6IEth
dGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwuY29tPgpIYXZlIGEgbmljZSBkYXkhCkth
c2lhIDopCj4gLS0tCj4gIHRlc3RzL2k5MTUvcGVyZl9wbXUuYyB8IDIgKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2k5MTUvcGVyZl9wbXUuYyBiL3Rlc3RzL2k5MTUvcGVyZl9wbXUuYwo+IGluZGV4IDM5MTM3
ODEzOS4uYzM5OTNjNDE3IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvcGVyZl9wbXUuYwo+ICsr
KyBiL3Rlc3RzL2k5MTUvcGVyZl9wbXUuYwo+IEBAIC03MDcsNyArNzA3LDcgQEAgc2VtYV93YWl0
KGludCBnZW1fZmQsIGNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZSwKPiAg
CX0gd2hpbGUgKCFvYmpfcHRyWzFdKTsKPiAgCj4gIAlpZ3RfYXNzZXJ0X2YoaWd0X3dhaXQocG11
X3JlYWRfc2luZ2xlKGZkKSAhPSB2YWxbMF0sIDEwLCAxKSwKPiAtCQkgICAgICJzYW1wbGluZyBm
YWlsZWQgdG8gc3RhcnQgd2l0aGluZyAxMG1zIik7Cj4gKwkJICAgICAic2FtcGxpbmcgZmFpbGVk
IHRvIHN0YXJ0IHdpdGhpbmcgMTBtc1xuIik7Cj4gIAo+ICAJdmFsWzBdID0gX19wbXVfcmVhZF9z
aW5nbGUoZmQsICZ0c1swXSk7Cj4gIAlzbGVwdCA9IG1lYXN1cmVkX3VzbGVlcChiYXRjaF9kdXJh
dGlvbl9ucyAvIDEwMDApOwo+IC0tIAo+IDIuMjAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdAo+IElu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
