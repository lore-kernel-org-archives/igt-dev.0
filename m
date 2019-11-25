Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37796E10F
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2019 10:10:14 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 25 Nov 2019 11:09:54 +0100
Message-Id: <20191125100957.27294-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/3] Add GEM_MMAP_OFFSET support in IGT.
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

RW5hYmxlIEdFTV9NTUFQX09GRlNFVCB1QVBJLgoKU2VyaWVzIGNvbWVzIGZyb20gc3BsaXQgJ0xN
RU0gZW5hYmxpbmcgaW4gSUdUJy4KTW1hcF9vZmZzZXQgd2lsbCBsYW5kIGJlZm9yZSBtZW1vcnkg
cmVnaW9uIHNvIGFkZCBzdXBwb3J0IGZvciBpdC4KCkNjOiBMdWthc3ogS2FsYW1hcnogPGx1a2Fz
ei5rYWxhbWFyekBpbnRlbC5jb20+CkNjOiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3
LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgpDYzogVmFuc2hpZGhhciBLb25kYSA8dmFuc2hpZGhhci5yLmtvbmRhQGludGVs
LmNvbT4KCkx1a2FzeiBLYWxhbWFyeiAoMik6CiAgbGliL2k5MTUvZ2VtX21tYW46IGFkZCBtbWFw
X29mZnNldCBzdXBwb3J0CiAgdGVzdHMvaTkxNS9nZW1fbW1hcF9vZmZzZXQ6IEFkZCBuZXcgQVBJ
IHRlc3QgZm9yIGdlbV9tbWFwX29mZnNldAoKWmJpZ25pZXcgS2VtcGN6ecWEc2tpICgxKToKICBp
bmNsdWRlL2RybS11YXBpL2k5MTVfZHJtOiBBZGQgbG9jYWwgZGVmcyBmb3IgbW1hcF9vZmZzZXQK
CiBpbmNsdWRlL2RybS11YXBpL2k5MTVfZHJtLmggIHwgIDMzICsrKysrKwogbGliL2k5MTUvZ2Vt
X21tYW4uYyAgICAgICAgICB8IDIyMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LQogbGliL2k5MTUvZ2VtX21tYW4uaCAgICAgICAgICB8ICAxNiArKy0KIHRlc3RzL01ha2VmaWxl
LnNvdXJjZXMgICAgICAgfCAgIDMgKwogdGVzdHMvaTkxNS9nZW1fbW1hcF9vZmZzZXQuYyB8IDEy
NyArKysrKysrKysrKysrKysrKysrKwogdGVzdHMvbWVzb24uYnVpbGQgICAgICAgICAgICB8ICAg
MSArCiA2IGZpbGVzIGNoYW5nZWQsIDM2MyBpbnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9pOTE1L2dlbV9tbWFwX29mZnNldC5jCgotLSAKMi4y
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
