Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A476E12A
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2019 11:05:43 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 25 Nov 2019 12:05:34 +0100
Message-Id: <20191125110537.29284-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Add GEM_MMAP_OFFSET support in IGT.
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
aW5nIHRvIHJldmlldwoKQ2M6IEx1a2FzeiBLYWxhbWFyeiA8bHVrYXN6LmthbGFtYXJ6QGludGVs
LmNvbT4KQ2M6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50
ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBW
YW5zaGlkaGFyIEtvbmRhIDx2YW5zaGlkaGFyLnIua29uZGFAaW50ZWwuY29tPgoKTHVrYXN6IEth
bGFtYXJ6ICgyKToKICBsaWIvaTkxNS9nZW1fbW1hbjogYWRkIG1tYXBfb2Zmc2V0IHN1cHBvcnQK
ICB0ZXN0cy9pOTE1L2dlbV9tbWFwX29mZnNldDogQWRkIG5ldyBBUEkgdGVzdCBmb3IgZ2VtX21t
YXBfb2Zmc2V0CgpaYmlnbmlldyBLZW1wY3p5xYRza2kgKDEpOgogIGluY2x1ZGUvZHJtLXVhcGkv
aTkxNV9kcm06IEFkZCBsb2NhbCBkZWZzIGZvciBtbWFwX29mZnNldAoKIGluY2x1ZGUvZHJtLXVh
cGkvaTkxNV9kcm0uaCAgfCAgMzMgKysrKysrCiBsaWIvaTkxNS9nZW1fbW1hbi5jICAgICAgICAg
IHwgMjIzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiBsaWIvaTkxNS9nZW1f
bW1hbi5oICAgICAgICAgIHwgIDE2ICsrLQogdGVzdHMvTWFrZWZpbGUuc291cmNlcyAgICAgICB8
ICAgMyArCiB0ZXN0cy9pOTE1L2dlbV9tbWFwX29mZnNldC5jIHwgMTI2ICsrKysrKysrKysrKysr
KysrKysrCiB0ZXN0cy9tZXNvbi5idWlsZCAgICAgICAgICAgIHwgICAxICsKIDYgZmlsZXMgY2hh
bmdlZCwgMzYyIGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHRlc3RzL2k5MTUvZ2VtX21tYXBfb2Zmc2V0LmMKCi0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
