Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9607B6E135
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2018 14:14:49 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180205113741.14959-1-tvrtko.ursulin@linux.intel.com>
References: <151760502786.15322.10017126443410528565@mail.alporthouse.com>
 <20180205113741.14959-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <151784008225.15322.7253457290210571678@mail.alporthouse.com>
Date: Mon, 05 Feb 2018 14:14:42 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2 8/9] tests/perf_pmu: Explicitly test
 for engine availability in init tests
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

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMi0wNSAxMTozNzo0MSkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFRlc3Qgd2lsbCBzdWNj
ZWVkIGlmIHByZXNlbnQgZW5naW5lIGNhbiBiZSBvcGVuZWQsIG9yIGlmIHRoZSBtaXNzaW5nCj4g
ZW5naW5lIHJlcG9ydHMgdGhlIGNvcnJlY3QgZXJyb3IgY29kZS4KPiAKPiB2MjoKPiAgKiBVc2Ug
dGhlIHJpZ2h0IGVycm5vLgo+ICAqIENsb3NlIGZkIG9ubHkgb24gc3VjY2Vzcy4gKENocmlzIFdp
bHNvbikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5A
aW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4gIyB2MQo+IC0tLQo+ICB0ZXN0cy9wZXJmX3BtdS5jIHwgMTUgKysrKysrKysrKysr
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9wZXJmX3BtdS5jIGIvdGVzdHMvcGVyZl9wbXUuYwo+IGlu
ZGV4IGQwMDgzOGM0MTMzMy4uMjYwYjA0YjA5Yzg2IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL3BlcmZf
cG11LmMKPiArKysgYi90ZXN0cy9wZXJmX3BtdS5jCj4gQEAgLTcyLDExICs3MiwyMCBAQCBzdGF0
aWMgaW50IG9wZW5fZ3JvdXAodWludDY0X3QgY29uZmlnLCBpbnQgZ3JvdXApCj4gIHN0YXRpYyB2
b2lkCj4gIGluaXQoaW50IGdlbV9mZCwgY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdp
bmUyICplLCB1aW50OF90IHNhbXBsZSkKPiAgewo+IC0gICAgICAgaW50IGZkOwo+ICsgICAgICAg
aW50IGZkLCBlcnIgPSAwOwo+ICAKPiAtICAgICAgIGZkID0gb3Blbl9wbXUoX19JOTE1X1BNVV9F
TkdJTkUoZS0+Y2xhc3MsIGUtPmluc3RhbmNlLCBzYW1wbGUpKTsKPiArICAgICAgIGVycm5vID0g
MDsKPiArICAgICAgIGZkID0gcGVyZl9pOTE1X29wZW4oX19JOTE1X1BNVV9FTkdJTkUoZS0+Y2xh
c3MsIGUtPmluc3RhbmNlLCBzYW1wbGUpKTsKPiArICAgICAgIGVyciA9IGVycm5vOwoKVG8gYmUg
cmVhbGx5IHBlZGFudGljLCBlcnJubyBpcyBvbmx5IHZhbGlkIG9uIHN1Y2Nlc3MuCgplcnIgPSAw
OwppZiAoZmQgPCAwKQoJZXJyID0gZXJybm87CgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
