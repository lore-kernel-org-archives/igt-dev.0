Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106456F111
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2018 20:57:17 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180202183754.30042-9-tvrtko.ursulin@linux.intel.com>
References: <20180202183754.30042-1-tvrtko.ursulin@linux.intel.com>
 <20180202183754.30042-9-tvrtko.ursulin@linux.intel.com>
Message-ID: <151760502786.15322.10017126443410528565@mail.alporthouse.com>
Date: Fri, 02 Feb 2018 20:57:07 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 8/9] tests/perf_pmu: Explicitly test for
 engine availability in init tests
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

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMi0wMiAxODozNzo1MykKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFRlc3Qgd2lsbCBzdWNj
ZWVkIGlmIHByZXNlbnQgZW5naW5lIGNhbiBiZSBvcGVuZWQsIG9yIGlmIHRoZSBtaXNzaW5nCj4g
ZW5naW5lIHJlcG9ydHMgdGhlIGNvcnJlY3QgZXJyb3IgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0
cy9wZXJmX3BtdS5jIHwgNyArKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvcGVyZl9wbXUuYyBiL3Rl
c3RzL3BlcmZfcG11LmMKPiBpbmRleCBkNjU0ZWNlNjNiYjcuLjIwMWFhMGI0MDA2OCAxMDA2NDQK
PiAtLS0gYS90ZXN0cy9wZXJmX3BtdS5jCj4gKysrIGIvdGVzdHMvcGVyZl9wbXUuYwo+IEBAIC03
NCw3ICs3NCwxMiBAQCBpbml0KGludCBnZW1fZmQsIGNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRp
b25fZW5naW5lMiAqZSwgdWludDhfdCBzYW1wbGUpCj4gIHsKPiAgICAgICAgIGludCBmZDsKPiAg
Cj4gLSAgICAgICBmZCA9IG9wZW5fcG11KF9fSTkxNV9QTVVfRU5HSU5FKGUtPmNsYXNzLCBlLT5p
bnN0YW5jZSwgc2FtcGxlKSk7Cj4gKyAgICAgICBmZCA9IHBlcmZfaTkxNV9vcGVuKF9fSTkxNV9Q
TVVfRU5HSU5FKGUtPmNsYXNzLCBlLT5pbnN0YW5jZSwgc2FtcGxlKSk7Cj4gKwo+ICsgICAgICAg
aWYgKGdlbV9oYXNfZW5naW5lKGdlbV9mZCwgZS0+Y2xhc3MsIGUtPmluc3RhbmNlKSkKPiArICAg
ICAgICAgICAgICAgaWd0X2Fzc2VydChmZCA+PSAwKTsKPiArICAgICAgIGVsc2UKPiArICAgICAg
ICAgICAgICAgaWd0X2Fzc2VydChmZCA8IDAgJiYgZXJybm8gPT0gRU5PREVWKTsKPiAgCj4gICAg
ICAgICBjbG9zZShmZCk7CgpCZSB2YWxncmluZCBmcmllbmRseSBhbmQgb25seSBjbG9zZSgpIGFm
dGVyIHN1Y2Nlc3MuCgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+CgooRG8gSSBoYXZlIHRvIGdvIGxvb2tpbmcgZm9yIG90aGVyIGNhc2VzIHdoZXJl
IHdlIGNvdWxkIGJlIGNoZWNraW5nIGZvcgptaXNzZWQgaW52YWxpZCB0ZXN0cz8gSSBob3BlIG5v
dCEpCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
