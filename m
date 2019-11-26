Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2116E2C7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2019 10:06:03 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 26 Nov 2019 11:05:53 +0100
Message-Id: <20191126100556.25230-1-zbigniew.kempczynski@intel.com>
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
cmVnaW9uIHNvIGFkZCBzdXBwb3J0IGZvciBpdC4KCnYyOiBDaGFuZ2UgV0MgLT4gV0IgYWNjb3Jk
aW5nIHRvIHJldmlldwp2MzogUmVtb3ZlICJsb2NhbCIgZnJvbSBpOTE1X2RybS5oIGFuZCBwdXNo
IGR1bW15IGNvbW1pdCB0byBpdC4KICAgIChzdWdnZXN0ZWQgYnkgUGV0cmkpLgogICAgQWRkIG1t
YXAtb2Zmc2V0LWNsb3NlLXJhY2UgdGVzdCAoc3VnZ2VzdGVkIGJ5IENocmlzKS4KCkNjOiBMdWth
c3ogS2FsYW1hcnogPGx1a2Fzei5rYWxhbWFyekBpbnRlbC5jb20+CkNjOiBaYmlnbmlldyBLZW1w
Y3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogVmFuc2hpZGhhciBLb25kYSA8dmFuc2hp
ZGhhci5yLmtvbmRhQGludGVsLmNvbT4KCkx1a2FzeiBLYWxhbWFyeiAoMik6CiAgbGliL2k5MTUv
Z2VtX21tYW46IGFkZCBtbWFwX29mZnNldCBzdXBwb3J0CiAgdGVzdHMvaTkxNS9nZW1fbW1hcF9v
ZmZzZXQ6IEFkZCBuZXcgQVBJIHRlc3QgZm9yIGdlbV9tbWFwX29mZnNldAoKWmJpZ25pZXcgS2Vt
cGN6ecWEc2tpICgxKToKICBpbmNsdWRlL2RybS11YXBpL2k5MTVfZHJtOiBBZGQgZGVmcyBmb3Ig
bW1hcF9vZmZzZXQKCiBpbmNsdWRlL2RybS11YXBpL2k5MTVfZHJtLmggIHwgIDI3ICsrKysrCiBs
aWIvaTkxNS9nZW1fbW1hbi5jICAgICAgICAgIHwgMjIzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tCiBsaWIvaTkxNS9nZW1fbW1hbi5oICAgICAgICAgIHwgIDE2ICsrLQogdGVz
dHMvTWFrZWZpbGUuc291cmNlcyAgICAgICB8ICAgMyArCiB0ZXN0cy9pOTE1L2dlbV9tbWFwX29m
ZnNldC5jIHwgMTc1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogdGVzdHMvbWVzb24uYnVp
bGQgICAgICAgICAgICB8ICAgMSArCiA2IGZpbGVzIGNoYW5nZWQsIDQwNSBpbnNlcnRpb25zKCsp
LCA0MCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9pOTE1L2dlbV9tbWFw
X29mZnNldC5jCgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXY=
