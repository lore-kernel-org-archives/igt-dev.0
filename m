Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E76E6E260
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2019 07:19:07 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190321230613.8639-1-prathap.kumar.valsan@intel.com>
In-Reply-To: <20190321230613.8639-1-prathap.kumar.valsan@intel.com>
Message-ID: <155323914179.26447.9281931190004143408@skylake-alporthouse-com>
Date: Fri, 22 Mar 2019 07:19:01 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_gttfill: Run basic test
 on simulation
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
To: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQcmF0aGFwIEt1bWFyIFZhbHNhbiAoMjAxOS0wMy0yMSAyMzowNjoxMykKPiBCYXNp
YyB0ZXN0IGRvbid0IHRha2UgbG9uZyB0byBjb21wbGV0ZSwgc28gYWxsb3cgYmFzaWMgdGVzdCB0
bwo+IHJ1biBvbiBzaW11bGF0aW9uLgo+IC0tLQo+ICB0ZXN0cy9pOTE1L2dlbV9leGVjX2d0dGZp
bGwuYyB8IDEzICsrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fZXhlY19n
dHRmaWxsLmMgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2d0dGZpbGwuYwo+IGluZGV4IGVmZDYxMmJi
Li45MmMzY2Y2MiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX2d0dGZpbGwuYwo+
ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfZ3R0ZmlsbC5jCj4gQEAgLTE0NCw3ICsxNDQsOCBA
QCBzdGF0aWMgdm9pZCBmaWxsZ3R0KGludCBmZCwgdW5zaWduZWQgcmluZywgaW50IHRpbWVvdXQp
Cj4gICAgICAgICBjb3VudCA9IHNpemUgLyBCQVRDSF9TSVpFICsgMTsKPiAgICAgICAgIGlndF9k
ZWJ1ZygiVXNpbmcgJSdkIGJhdGNoZXMgdG8gZmlsbCAlJ2xsdSBhcGVydHVyZSBvbiAlZCBlbmdp
bmVzXG4iLAo+ICAgICAgICAgICAgICAgICAgIGNvdW50LCAobG9uZyBsb25nKXNpemUsIG5lbmdp
bmUpOwo+IC0gICAgICAgaW50ZWxfcmVxdWlyZV9tZW1vcnkoY291bnQsIEJBVENIX1NJWkUsIENI
RUNLX1JBTSk7Cj4gKyAgICAgICBpZiAoIWlndF9ydW5faW5fc2ltdWxhdGlvbigpKQo+ICsgICAg
ICAgICAgICAgICBpbnRlbF9yZXF1aXJlX21lbW9yeShjb3VudCwgQkFUQ0hfU0laRSwgQ0hFQ0tf
UkFNKTsKCk5vLiBUaGF0IGlzIHRvbyB1Z2x5LiBZb3UgYXJlIGJhc2ljYWxseSBzYXlpbmcgdGhh
dCBtZW1vcnkgbGltaXRzIGRvbid0Cm1hdHRlciBmb3Igc2ltdWxhdGlvbiAtLSB1bmxlc3MgdGhl
IHJlYWRlciBpcyBhd2FyZSBvZiB0aGUgY29udm9sdXRlZApzdG9yeSBpbiB0aGUgc2V0dXAgYW5k
IHRoYXQgd2UndmUgcHJldmlvdXNseSBtYXJrZWQgYXMgYW55dGhpbmcgdGhhdApyZXF1aXJlcyB0
byBjaGVjayBtZW1vcnkgaXMgbm90IHN1aXRhYmxlIGZvciB0aGUgc2xvdyBzaW11bGF0b3IuCgpX
aHkgZG8geW91IHdhbnQgdG8gcnVuIHRoaXMgb24gdGhlIHNpbXVsYXRvcj8gV3JpdGUgdGhhdCB0
ZXN0LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
