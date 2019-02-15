Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855A66E0B2
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 20:17:49 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190215154202.26053-1-antonio.argenziano@intel.com>
References: <20190215154202.26053-1-antonio.argenziano@intel.com>
Message-ID: <155026185352.18261.8067419542114316140@skylake-alporthouse-com>
Date: Fri, 15 Feb 2019 20:17:38 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v5] tests/i915/gem_exec_schedule.c:
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

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMTUgMTU6NDI6MDIpCj4gdXNlIElP
Q1RMcyBnZW1fcmVhZCBmb3IgcmVhZGluZyBhbmQsIGdlbV9zeW5jIHRvIHdhaXQgb24gYSBiYXRj
aCwgdGhpcwo+IHdpbGwgaGVscCB0ZXN0aW5nIHBsYXRmb3JtcyB0aGF0IG1pZ2h0IG5vdCBleHBv
c2UgZ3R0IG1hcHBpbmcuCj4gCj4gdjI6Cj4gICAgICAgICAtIHVzZSBhIGxvY2FsIGhlbHBlciBm
b3IgcmVhZGluZyBmcm9tIEJPcy4gKENocmlzKQo+ICAgICAgICAgLSBBbHdheXMgc3luYyBiZWZv
cmUgcmVhZGluZy4gKENocmlzKQo+IAo+IHYzOgo+ICAgICAgICAgLSBCZXR0ZXIgaGVscGVyIG5h
bWluZy4gKENocmlzKQo+ICAgICAgICAgLSBTdGFydCByZWFkIGZyb20gYWN0dWFsIG9mZnNldC4g
KENocmlzKQo+IAo+IHY0Ogo+ICAgICAgICAgLSBBbHdheXMgdXNlIGJ5dGUgc2l6ZSBpbiBoZWxw
ZXIuIChDaHJpcykKPiAKPiB2NToKPiAgICAgICAgIC0gRml4IGJ5dGU8LT5jb3VudCBjb252ZXJz
aW9uLiAoQ2hyaXMpCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRv
bmlvLmFyZ2Vuemlhbm9AaW50ZWwuY29tPgo+IAo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4KClNlZW1zIHNhZmUgbm93IQpSZXZpZXdlZC1ieTogQ2hyaXMgV2ls
c29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXY=
