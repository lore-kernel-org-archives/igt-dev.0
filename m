Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7722C6E829
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Mar 2018 11:06:48 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180315110008.72082-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20180315110008.72082-1-maarten.lankhorst@linux.intel.com>
Message-ID: <152111200317.16598.17651820152247919665@mail.alporthouse.com>
Date: Thu, 15 Mar 2018 11:06:43 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Reduce
 fbc status spam.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNYWFydGVuIExhbmtob3JzdCAoMjAxOC0wMy0xNSAxMTowMDowOCkKPiBXaGVuIEZC
QyBjYW5ub3QgYmUgZW5hYmxlZCBpbiBvbmUgb2YgdGhlIHRlc3RzLCB3ZSBnZXQgYSBsb3Qgb2Yg
cmVwZWF0ZWQKPiBzcGFtIGF0IERFQlVHIGxldmVsLCB3aGljaCBvdmVyd3JpdGVzIGFueSBnb29k
IGRlYnVnIGxldmVsIGRhdGEgdGhhdCB5b3UKPiBjYW4gaG9wZSB0byBnZXQgb3V0IG9mIHRoZSB0
ZXN0Lgo+IAo+IFdoZW4gcnVubmluZyBhdCB0aGUgZGVidWcgbGV2ZWwsIG91dHB1dCBGQkMgaW5m
byBvbmx5IGlmIGNoYW5nZWQgZnJvbSBsYXN0Cj4gdGltZSwgc28gd2UgZG9uJ3QgZ2V0IHRoZSBy
ZXBlYXRlZCBzcGFtLgo+IAo+IFRoaXMgbWFrZXMgdGhlIGRlYnVnIGluZm8gZnJvbSBDSSBzbGln
aHRseSBtb3JlIHVzZWZ1bC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9rbXNfZnJv
bnRidWZmZXJfdHJhY2tpbmcuYyB8IDEzICsrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgYi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tp
bmcuYwo+IGluZGV4IDA2YjM0ZGRiOTBiNC4uYWExMzhkNWVhMTNmIDEwMDY0NAo+IC0tLSBhL3Rl
c3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCj4gKysrIGIvdGVzdHMva21zX2Zyb250YnVm
ZmVyX3RyYWNraW5nLmMKPiBAQCAtNzU4LDkgKzc1OCwyMCBAQCBzdGF0aWMgaW50IF9fZGVidWdm
c193cml0ZShjb25zdCBjaGFyICpwYXJhbSwgY2hhciAqYnVmLCBpbnQgbGVuKQo+ICBzdGF0aWMg
Ym9vbCBmYmNfaXNfZW5hYmxlZChpbnQgbHZsKQo+ICB7Cj4gICAgICAgICBjaGFyIGJ1ZlsxMjhd
Owo+ICsgICAgICAgc3RhdGljIGNoYXIgbGFzdF9idWZbMTI4XTsKPiArICAgICAgIGJvb2wgcHJp
bnQgPSB0cnVlOwo+ICAKPiAgICAgICAgIGRlYnVnZnNfcmVhZCgiaTkxNV9mYmNfc3RhdHVzIiwg
YnVmKTsKPiAtICAgICAgIGlndF9sb2coSUdUX0xPR19ET01BSU4sIGx2bCwgImZiY19pc19lbmFi
bGVkKCk/XG4lcyIsIGJ1Zik7Cj4gKyAgICAgICBpZiAobHZsICE9IElHVF9MT0dfREVCVUcpCj4g
KyAgICAgICAgICAgICAgIGxhc3RfYnVmWzBdID0gJ1wwJzsKCkkgdGhpbmsgeW91IGFsc28gd2Fu
dCB0byByZXNldCBiZXR3ZWVuIHBhc3Nlcywgc28gdGhhdCB5b3UgaGF2ZSBhCmNvbXBsZXRlIGxv
ZyBmb3Igb25lIHdhaXQuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
