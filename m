Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3620D892C2
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2019 16:21:13 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 26 Apr 2019 19:21:03 +0300
Message-Id: <20190426162110.1768-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/7] tests/kms_chamelium: add hdmi-audio test
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
To: igt-dev@lists.freedesktop.org
Cc: Martin Peres <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBhIG5ldyBoZG1pLWF1ZGlvIHRlc3QgdG8gdGhlIENoYW1l
bGl1bSBzdWl0ZS4KCkdlbmVyYXRpbmcgb3VyIG93biBFRElEIGlzIG5lY2Vzc2FyeSB0byBnZXQg
SERNSSBhdWRpbyB0byB3b3JrLiBQYXRjaGVzIDEgYW5kIDIKYWRkIHRoZSBuZWNlc3NhcnkgZmVh
dHVyZXMgdG8gbGliL2lndF9lZGlkLiBQYXRjaCAzIHVzZXMgdGhpcyBsaWJyYXJ5IHRvCmdlbmVy
YXRlIHRoZSBhcHByb3ByaWF0ZSBFRElELiBPdGhlciBwYXRjaGVzIGFyZSBtaW5vciBmaXhlcyBh
bmQgaW1wcm92ZW1lbnRzLgoKU2ltb24gU2VyICg3KToKICBsaWIvaWd0X2VkaWQ6IGFkZCBzdXBw
b3J0IGZvciBTaG9ydCBBdWRpbyBEZXNjcmlwdG9ycwogIGxpYi9pZ3RfZWRpZDogYWRkIHN1cHBv
cnQgZm9yIFZlbmRvciBTcGVjaWZpYyBEYXRhIGJsb2NrcwogIHRlc3RzL2ttc19jaGFtZWxpdW06
IGdlbmVyYXRlIGFuIEVESUQgd2l0aCBhdWRpbyBzdXBwb3J0CiAgdGVzdC9rbXNfY2hhbWVsaXVt
OiBkaXNhYmxlID40OEtIeiBhdWRpbyB0ZXN0cwogIHRlc3RzL2ttc19jaGFtZWxpdW06IGVuYWJs
ZSBhdWRpbyB0ZXN0IG9uIEhETUkgcG9ydHMKICB0ZXN0cy9rbXNfY2hhbWVsaXVtOiBkb24ndCBh
Ym9ydCBhdWRpbyB0ZXN0IG9uIGZpcnN0IGZhaWwKICBIQVg6IGFkZCBkcC1hdWRpbyB0ZXN0IHRv
IGZhc3QtZmVlZGJhY2sKCiBsaWIvaWd0X2NoYW1lbGl1bS5jICAgICAgICAgICAgICAgICAgIHwg
ICA5ICstCiBsaWIvaWd0X2VkaWQuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMTEzICsrKysr
KysrKysrKysrKy0tCiBsaWIvaWd0X2VkaWQuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgMTAz
ICsrKysrKysrKysrKysrKy0KIHRlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3Qg
fCAgIDEgKwogdGVzdHMva21zX2NoYW1lbGl1bS5jICAgICAgICAgICAgICAgICB8IDE3MSArKysr
KysrKysrKysrKysrKystLS0tLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCAzMzIgaW5zZXJ0aW9ucygr
KSwgNjUgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
