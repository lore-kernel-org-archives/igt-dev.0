Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A506EAB8
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2018 23:20:39 +0000 (UTC)
From: Jordan Justen <jordan.l.justen@intel.com>
Date: Wed, 21 Feb 2018 15:19:03 -0800
Message-Id: <20180221231905.15580-4-jordan.l.justen@intel.com>
In-Reply-To: <20180221231905.15580-1-jordan.l.justen@intel.com>
References: <20180221231905.15580-1-jordan.l.justen@intel.com>
Subject: [igt-dev] [PATCH i-g-t 4/6] aubdump: Support alignment of BO in
 execbuffer2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogSm9yZGFuIEp1c3RlbiA8am9yZGFuLmwuanVzdGVuQGludGVsLmNvbT4K
LS0tCiB0b29scy9hdWJkdW1wLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvYXViZHVtcC5jIGIvdG9vbHMvYXViZHVtcC5jCmluZGV4
IDU2MGFhNTBmLi5hZWExMDk3MCAxMDA2NDQKLS0tIGEvdG9vbHMvYXViZHVtcC5jCisrKyBiL3Rv
b2xzL2F1YmR1bXAuYwpAQCAtOTQyLDYgKzk0Miw4IEBAIGR1bXBfZXhlY2J1ZmZlcjIoaW50IGZk
LCBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNidWZmZXIyICpleGVjYnVmZmVyMikKIAkJaWYgKG9i
ai0+ZmxhZ3MgJiBFWEVDX09CSkVDVF9QSU5ORUQpIHsKIAkJCWJvLT5vZmZzZXQgPSBvYmotPm9m
ZnNldDsKIAkJfSBlbHNlIHsKKwkJCWlmIChvYmotPmFsaWdubWVudCAhPSAwKQorCQkJCW9mZnNl
dCA9IGFsaWduX3UzMihvZmZzZXQsIG9iai0+YWxpZ25tZW50KTsKIAkJCWJvLT5vZmZzZXQgPSBv
ZmZzZXQ7CiAJCQlvZmZzZXQgPSBhbGlnbl91MzIob2Zmc2V0ICsgYm8tPnNpemUgKyA0MDk1LCA0
MDk2KTsKIAkJfQotLSAKMi4xNi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
