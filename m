Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A15B89BB0
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Oct 2018 10:20:21 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20181012212827.30163-1-jose.souza@intel.com>
References: <20181012212827.30163-1-jose.souza@intel.com>
Message-ID: <153942600423.3258.7310242941063295670@skylake-alporthouse-com>
Date: Sat, 13 Oct 2018 11:20:09 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib: Skip tests that require fb
 modifiers when KMS is disabled
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKb3PDqSBSb2JlcnRvIGRlIFNvdXphICgyMDE4LTEwLTEyIDIyOjI4OjI2KQo+IFdo
ZW4gS01TIGlzIGRpc2FibGVkLCBkcm1HZXRDYXAoKSBmb3IgRFJNX0NBUF9BRERGQjJfTU9ESUZJ
RVJTKCkgd2lsbAo+IHJldHVybiAtMSBhbmQgc2V0IGVycm5vIGFzIEVPUE5PVFNVUFAsIHRoZSBj
dXJyZW50IGFzc2VydCB3YXMgb25seQo+IGNoZWNraW5nIGZvciBhIHN1Y2VzcyByZXN1bHQgb3Ig
aW52YWxpZCBhcmd1bWVudCBjYXVzaW5nCj4gcHJpbWVfdmdlbUBiYXNpYy1mZW5jZS1mbGlwIHRl
c3QgdG8gZmFpbCB3aGVuIEtNUyBpcyBkaXNhYmxlZC4KPiAKPiBDYzogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBk
ZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Cj4gLS0tCj4gIGxpYi9pb2N0bF93cmFwcGVy
cy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lvY3RsX3dyYXBwZXJzLmMgYi9saWIvaW9jdGxfd3Jh
cHBlcnMuYwo+IGluZGV4IDA5MjljNDNmLi5iZGE5YTc2NCAxMDA2NDQKPiAtLS0gYS9saWIvaW9j
dGxfd3JhcHBlcnMuYwo+ICsrKyBiL2xpYi9pb2N0bF93cmFwcGVycy5jCj4gQEAgLTE2NjEsNyAr
MTY2MSw3IEBAIHZvaWQgaWd0X3JlcXVpcmVfZmJfbW9kaWZpZXJzKGludCBmZCkKPiAgICAgICAg
ICAgICAgICAgaW50IHJldDsKPiAgCj4gICAgICAgICAgICAgICAgIHJldCA9IGRybUdldENhcChm
ZCwgRFJNX0NBUF9BRERGQjJfTU9ESUZJRVJTLCAmY2FwX21vZGlmaWVycyk7Cj4gLSAgICAgICAg
ICAgICAgIGlndF9hc3NlcnQocmV0ID09IDAgfHwgZXJybm8gPT0gRUlOVkFMKTsKPiArICAgICAg
ICAgICAgICAgaWd0X2Fzc2VydChyZXQgPT0gMCB8fCBlcnJubyA9PSBFSU5WQUwgfHwgZXJybm8g
PT0gRU9QTk9UU1VQUCk7CgpJIGp1c3QgdGhpbmsgdGhpcyBpcyBhIGR1bWIgYXNzZXJ0LCBidXQg
dGhhdCdzIGp1c3QgbWUuIEkgc3VnZ2VzdGVkIHdlCnJlbW92ZSBpdCBzaW5jZSBpdCBpcyBub3Qg
ZXNzZW50aWFsIGZvciBhbnN3ZXJpbmcgdGhlIHF1ZXN0aW9uIG9mCndoZXRoZXIgd2UgaGF2ZSB0
aGUgKmNhcCogYW5kIHRoYXQgaXMgKmFsbCogdGhhdCBpcyBiZWluZyBhc2tlZCBoZXJlLApidXQg
c29tZXRoaW5nIGhhcyB0byBiZSBkb25lLgoKUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==
