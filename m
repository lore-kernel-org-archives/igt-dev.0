Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1C96E187
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2020 16:44:50 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200820063030.10741-31-zbigniew.kempczynski@intel.com>
References: <20200820063030.10741-1-zbigniew.kempczynski@intel.com>
 <20200820063030.10741-31-zbigniew.kempczynski@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 26 Aug 2020 17:44:46 +0100
Message-ID: <159846028644.19114.3222802749398813317@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v31 30/32] lib/intel_batchbuffer: fix
 intel_bb cache
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
To: zbigniew.kempczynski@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMDgtMjAgMDc6MzA6MjgpCj4gIC8q
Kgo+ICAgKiBpbnRlbF9iYl9hZGRfb2JqZWN0Ogo+ICAgKiBAaWJiOiBwb2ludGVyIHRvIGludGVs
X2JiCj4gQEAgLTE1NDMsMjcgKzE1OTQsMTQgQEAgaW50ZWxfYmJfYWRkX29iamVjdChzdHJ1Y3Qg
aW50ZWxfYmIgKmliYiwgdWludDMyX3QgaGFuZGxlLAo+ICAgICAgICAgICAgICAgICAgICAgdWlu
dDY0X3Qgb2Zmc2V0LCBib29sIHdyaXRlKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2k5MTVf
Z2VtX2V4ZWNfb2JqZWN0MiAqb2JqZWN0Owo+IC0gICAgICAgc3RydWN0IGRybV9pOTE1X2dlbV9l
eGVjX29iamVjdDIgKipmb3VuZDsKPiAtICAgICAgIHVpbnQzMl90IGk7Cj4gIAo+IC0gICAgICAg
X19yZWFsbG9jYXRlX29iamVjdHMoaWJiKTsKPiAtCj4gLSAgICAgICBpID0gaWJiLT5udW1fb2Jq
ZWN0czsKPiAtICAgICAgIG9iamVjdCA9ICZpYmItPm9iamVjdHNbaV07CgpUaGlzLiBUaGlzIGlz
IHRoZSBpbnZhbGlkIHBvaW50ZXIgYWNyb3NzIGEgcmVsb2Mgb2Ygb2JqZWN0cy4KCk9rLCBnb3Rj
aGEuCgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
