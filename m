Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843396ECF8
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2018 21:07:57 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <151743196553.13929.1941192402202071748@mail.alporthouse.com>
References: <20180131193901.5150-1-antonio.argenziano@intel.com>
 <151743196553.13929.1941192402202071748@mail.alporthouse.com>
Message-ID: <151743285379.13929.10650919310387095806@mail.alporthouse.com>
Date: Wed, 31 Jan 2018 21:07:33 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] igt/gem_exec_params: Drop drm master
 privileges only on drm master fds
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMDEtMzEgMjA6NTI6NDUpCj4gUXVvdGluZyBBbnRv
bmlvIEFyZ2Vuemlhbm8gKDIwMTgtMDEtMzEgMTk6Mzk6MDEpCj4gPiBTdWJ0ZXN0ICdzZWN1cmUt
bm9uLW1hc3RlcicgdHJpZXMgdG8gZHJvcCBkcm0tbWFzdGVyIHByaXZpbGVnZXMgb24gYQo+ID4g
bm9uIGRybS1tYXN0ZXIgZmQuIEluc3RlYWQgZHJvcCBtYXN0ZXIgcHJpdmlsZWdlcyBhZnRlciB0
aGUgc3VidGVzdAo+ID4gYWNxdWlyZXMgaXQgc28gdGhhdCBvdGhlciBzdWJ0ZXN0cyBhcmUgbm90
IGFmZmVjdGVkIGJ5IGl0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlh
bm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4gPiBDYzogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KPiA+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBs
aW51eC5pbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICB0ZXN0cy9nZW1fZXhlY19wYXJhbXMuYyB8IDIg
Ky0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2dlbV9leGVjX3BhcmFtcy5jIGIvdGVzdHMvZ2VtX2V4
ZWNfcGFyYW1zLmMKPiA+IGluZGV4IGUxYzQ4YjQwLi5kYmQ4OWU3YyAxMDA2NDQKPiA+IC0tLSBh
L3Rlc3RzL2dlbV9leGVjX3BhcmFtcy5jCj4gPiArKysgYi90ZXN0cy9nZW1fZXhlY19wYXJhbXMu
Ywo+ID4gQEAgLTM0MywxMyArMzQzLDEzIEBAIGlndF9tYWluCj4gPiAgICAgICAgIH0KPiA+ICAK
PiA+ICAgICAgICAgaWd0X3N1YnRlc3QoInNlY3VyZS1ub24tbWFzdGVyIikgewo+IAo+IGlndF9y
ZXF1aXJlKGlhbXJvb3QoKSk7Cj4gCj4gPiAtICAgICAgICAgICAgICAgaWd0X2RldmljZV9kcm9w
X21hc3RlcihmZCk7CgpPciBtYXliZToKCWlndF9yZXF1aXJlKF9faWd0X2RldmljZV9zZXRfbWFz
dGVyKGZkKSk7IC8qIHJlcXVpcmVzIHJvb3QgcHJpdmlsZWdlICovCglpZ3RfZGV2aWNlX2Ryb3Bf
bWFzdGVyKGZkKTsKPwoKVG8gdmVyaWZ5IHdlIGNhbiBvYnRhaW4gRFJNX01BU1RFUiBpZiB3ZSB3
YW50ZWQgaXQsIGFuZCBhc3NlcnQgdGhhdCB3ZQpkb24ndCBoYXZlIGl0IGZvciB0aGUgYWN0dWFs
IHRlc3QuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
