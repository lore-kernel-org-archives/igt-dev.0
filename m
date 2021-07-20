Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9316E3FE
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jul 2021 14:12:41 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Tue, 20 Jul 2021 16:12:28 +0200
Message-Id: <20210720141232.12812-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/4] Implement the BST allocator
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
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgaW1wbGVtZW50cyBhbiBhbGxvY2F0b3IKd2l0aCBiZXN0LWZpdCBz
dHJhdGVneS4gVGhpcyBpbXBsZW1lbnRhdGlvbgppcyBiYXNlZCBvbiBhIGJhbGFuY2VkIHNlYXJj
aCB0cmVlIHdoaWNoCmFsbG93cyBmb3IgZmFzdCBsb29rdXAgb2YgZnJlZSBibG9ja3MuCgpDYzog
WmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CgoK
QW5kcnplaiBUdXJrbyAoNCk6CiAgbGliL2ludGVsX2FsbG9jYXRvcjogRml4IGFyZ3VtZW50IG5h
bWVzIGluIGRlY2xhcmF0aW9ucwogIGxpYi9pZ3RfYnN0OiBBZGQgYSBCU1QgaW50ZXJmYWNlIGFu
ZCBhbiBBVkwgaW1wbGVtZW50YXRpb24KICBsaWIvaW50ZWxfYWxsb2NhdG9yX2JzdDogSW1wbGVt
ZW50IHRoZSBhbGxvY2F0b3Igd2l0aCBhIEJTVAogIHRlc3RzL2k5MTVfYXBpX2ludGVsX2FsbG9j
YXRvcjogQWRkIHRoZSBCU1QgYWxsb2NhdG9yCgogbGliL2lndF9ic3QuYyAgICAgICAgICAgICAg
ICAgICAgfCAxNTcgKysrKysrKysKIGxpYi9pZ3RfYnN0LmggICAgICAgICAgICAgICAgICAgIHwg
IDY5ICsrKysKIGxpYi9pZ3RfYnN0X2F2bC5jICAgICAgICAgICAgICAgIHwgNjUxICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogbGliL2ludGVsX2FsbG9jYXRvci5jICAgICAgICAgICAg
fCAgIDcgKwogbGliL2ludGVsX2FsbG9jYXRvci5oICAgICAgICAgICAgfCAgIDkgKy0KIGxpYi9p
bnRlbF9hbGxvY2F0b3JfYnN0LmMgICAgICAgIHwgNjcyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIGxpYi9tZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgIHwgICAzICsKIHRlc3Rz
L2k5MTUvYXBpX2ludGVsX2FsbG9jYXRvci5jIHwgIDU1ICsrLQogOCBmaWxlcyBjaGFuZ2VkLCAx
NTk5IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGxp
Yi9pZ3RfYnN0LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvaWd0X2JzdC5oCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgbGliL2lndF9ic3RfYXZsLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvaW50ZWxf
YWxsb2NhdG9yX2JzdC5jCgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
