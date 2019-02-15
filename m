Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454A46E058
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 00:57:58 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190215004901.29158-1-antonio.argenziano@intel.com>
References: <20190215004901.29158-1-antonio.argenziano@intel.com>
Message-ID: <155019226623.25941.3231371849733536107@skylake-alporthouse-com>
Date: Fri, 15 Feb 2019 00:57:46 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/i915/gem_exec_schedule.c:
 Switch to gem_sync and gem_read
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
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMTUgMDA6NDk6MDEpCj4gdXNlIElP
Q1RMcyBnZW1fcmVhZCBmb3IgcmVhZGluZyBhbmQsIGdlbV9zeW5jIHRvIHdhaXQgb24gYSBiYXRj
aCwgdGhpcwo+IHdpbGwgaGVscCB0ZXN0aW5nIHBsYXRmb3JtcyB0aGF0IG1pZ2h0IG5vdCBleHBv
c2UgZ3R0IG1hcHBpbmcuCj4gCj4gdjI6Cj4gICAgICAgICAtIHVzZSBhIGxvY2FsIGhlbHBlciBm
b3IgcmVhZGluZyBmcm9tIEJPcy4gKENocmlzKQo+ICAgICAgICAgLSBBbHdheXMgc3luYyBiZWZv
cmUgcmVhZGluZy4gKENocmlzKQo+IAo+IHYzOgo+ICAgICAgICAgLSBCZXR0ZXIgaGVscGVyIG5h
bWluZy4gKENocmlzKQo+ICAgICAgICAgLSBTdGFydCByZWFkIGZyb20gYWN0dWFsIG9mZnNldC4g
KENocmlzKQo+IAo+IHY0Ogo+ICAgICAgICAgLSBBbHdheXMgdXNlIGJ5dGUgc2l6ZSBpbiBoZWxw
ZXIuIChDaHJpcykKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9u
aW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4gCj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgo+IEBAIC03NTUsOCArNzU5LDggQEAgc3RhdGljIHZvaWQgZGVlcChp
bnQgZmQsIHVuc2lnbmVkIHJpbmcpCj4gICAgICAgICB1bnNpZ25lZCBpbnQgbnJlcTsKPiAgICAg
ICAgIHVpbnQzMl90IHBsdWc7Cj4gICAgICAgICB1aW50MzJfdCByZXN1bHQsIGRlcFtYU107Cj4g
KyAgICAgICB1aW50MzJfdCByZXN1bHRfcmVhZFtzaXplIC8gc2l6ZW9mKHVpbnQzMl90KV0sIGRl
cF9yZWFkW3NpemUgLyBzaXplb2YodWludDMyX3QpXTsKCldlIG9ubHkgdXNlIG9uZSBhcnJheSBh
dCBhIHRpbWUsIGtlZXBpbmcgYm90aCBvbiBzdGFjayBpcyBvdmVya2lsbC4gWW91Cm1pZ2h0IGFz
ayB3aHkgbm90IGRlcF9yZWFkW1hTXVsyMDQ4XT8KCj4gICAgICAgICB1aW50MzJfdCBleHBlY3Rl
ZCA9IDA7Cj4gLSAgICAgICB1aW50MzJfdCAqcHRyOwo+ICAgICAgICAgdWludDMyX3QgKmN0eDsK
PiAgICAgICAgIGludCBkZXBfbnJlcTsKPiAgICAgICAgIGludCBuOwoKT3RoZXIgdGhhbiB0aGF0
LApSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1D
aHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
