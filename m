Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343046E0B1
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 12:32:50 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190313120641.7350-1-petri.latvala@intel.com>
References: <20190313120641.7350-1-petri.latvala@intel.com>
Message-ID: <155248035314.30003.9055942291657479173@skylake-alporthouse-com>
Date: Wed, 13 Mar 2019 12:32:38 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] gem_exec_gttfill: Plug memory leak
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTAzLTEzIDEyOjA2OjM4KQo+IGJ5IGZyZWVpbmcg
YmF0Y2hlcyBpbiBmaWxsZ3R0KCkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxw
ZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvaTkxNS9nZW1fZXhlY19ndHRm
aWxsLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAt
LWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfZ3R0ZmlsbC5jIGIvdGVzdHMvaTkxNS9nZW1fZXhl
Y19ndHRmaWxsLmMKPiBpbmRleCBlZmQ2MTJiYi4uYzU2MjdjODAgMTAwNjQ0Cj4gLS0tIGEvdGVz
dHMvaTkxNS9nZW1fZXhlY19ndHRmaWxsLmMKPiArKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2d0
dGZpbGwuYwo+IEBAIC0xOTYsNiArMTk2LDcgQEAgc3RhdGljIHZvaWQgZmlsbGd0dChpbnQgZmQs
IHVuc2lnbmVkIHJpbmcsIGludCB0aW1lb3V0KQo+ICAgICAgICAgICAgICAgICBtdW5tYXAoYmF0
Y2hlc1tpXS5wdHIsIEJBVENIX1NJWkUpOwo+ICAgICAgICAgICAgICAgICBnZW1fY2xvc2UoZmQs
IGJhdGNoZXNbaV0uaGFuZGxlKTsKPiAgICAgICAgIH0KPiArICAgICAgIGZyZWUoYmF0Y2hlcyk7
CgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1D
aHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
