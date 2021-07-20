Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772DB6E2BC
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jul 2021 13:27:50 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Tue, 20 Jul 2021 15:27:36 +0200
Message-Id: <20210720132740.10501-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/4] Implement the BST allocator
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
WmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CgpB
bmRyemVqIFR1cmtvICg0KToKICBsaWIvaW50ZWxfYWxsb2NhdG9yOiBGaXggYXJndW1lbnQgbmFt
ZXMgaW4gZGVjbGFyYXRpb25zCiAgbGliL2lndF9ic3Q6IEFkZCBhIEJTVCBpbnRlcmZhY2UgYW5k
IGFuIEFWTCBpbXBsZW1lbnRhdGlvbgogIGxpYi9pbnRlbF9hbGxvY2F0b3JfYnN0OiBJbXBsZW1l
bnQgdGhlIGFsbG9jYXRvciB3aXRoIGEgQlNUCiAgdGVzdHMvaTkxNV9hcGlfaW50ZWxfYWxsb2Nh
dG9yOiBBZGQgdGhlIEJTVCBhbGxvY2F0b3IKCiBsaWIvaWd0X2JzdC5jICAgICAgICAgICAgICAg
ICAgICB8IDE1NyArKysrKysrKwogbGliL2lndF9ic3QuaCAgICAgICAgICAgICAgICAgICAgfCAg
NjkgKysrKwogbGliL2lndF9ic3RfYXZsLmMgICAgICAgICAgICAgICAgfCA2NTEgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiBsaWIvaW50ZWxfYWxsb2NhdG9yLmMgICAgICAgICAgICB8
ICAgNyArCiBsaWIvaW50ZWxfYWxsb2NhdG9yLmggICAgICAgICAgICB8ICAgOSArLQogbGliL2lu
dGVsX2FsbG9jYXRvcl9ic3QuYyAgICAgICAgfCA2NzIgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogbGliL21lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgfCAgIDMgKwogdGVzdHMv
aTkxNS9hcGlfaW50ZWxfYWxsb2NhdG9yLmMgfCAgNTUgKystCiA4IGZpbGVzIGNoYW5nZWQsIDE1
OTkgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbGli
L2lndF9ic3QuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9pZ3RfYnN0LmgKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBsaWIvaWd0X2JzdF9hdmwuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9pbnRlbF9h
bGxvY2F0b3JfYnN0LmMKCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
