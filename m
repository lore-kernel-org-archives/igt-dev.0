Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E016E21F
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 17:53:48 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190228171723.31331-4-daniel.vetter@ffwll.ch>
References: <20190228171723.31331-1-daniel.vetter@ffwll.ch>
 <20190228171723.31331-4-daniel.vetter@ffwll.ch>
Message-ID: <155137641692.5847.3262521320199157636@skylake-alporthouse-com>
Date: Thu, 28 Feb 2019 17:53:42 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests: Use
 igt_device_set/drop_master
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTAyLTI4IDE3OjE3OjIzKQo+IFN1Z2dlc3RlZCBi
eSBDaHJpcy4KPiAKPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
PiAtLS0KPiAgdGVzdHMvY29yZV9zZXRtYXN0ZXJfdnNfYXV0aC5jIHwgIDYgKysrKy0tCj4gIHRl
c3RzL2ttc19mbGlwX2V2ZW50X2xlYWsuYyAgICB8IDEwICsrKystLS0tLS0KPiAgdGVzdHMva21z
X2xlYXNlLmMgICAgICAgICAgICAgIHwgMTEgKysrKysrLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvY29yZV9zZXRtYXN0ZXJfdnNfYXV0aC5jIGIvdGVzdHMvY29yZV9zZXRtYXN0ZXJfdnNfYXV0
aC5jCj4gaW5kZXggYzMzNWRkZmYzYTJkLi5mOWU5N2M3YTU3ZWYgMTAwNjQ0Cj4gLS0tIGEvdGVz
dHMvY29yZV9zZXRtYXN0ZXJfdnNfYXV0aC5jCj4gKysrIGIvdGVzdHMvY29yZV9zZXRtYXN0ZXJf
dnNfYXV0aC5jCj4gQEAgLTM5LDYgKzM5LDggQEAKPiAgI2luY2x1ZGUgPHN0ZGlvLmg+Cj4gICNp
bmNsdWRlIDxzdHJpbmcuaD4KPiAgCj4gKyNpbmNsdWRlIDxpZ3RfZGV2aWNlLmg+CgoiaWd0X2Rl
dmljZS5oIiBmb3IgYSBsb2NhbCBoZWFkZXI/CgpDb252ZXJzaW9ucyBsb29rIGZpbmUgb3RoZXJ3
aXNlLgoKV2l0aCAiIiwKUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
