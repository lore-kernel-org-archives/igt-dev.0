Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB80089B20
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jul 2021 14:12:00 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Mon,  5 Jul 2021 16:11:30 +0200
Message-Id: <20210705141133.10329-3-andrzej.turko@linux.intel.com>
In-Reply-To: <20210705141133.10329-1-andrzej.turko@linux.intel.com>
References: <20210705141133.10329-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/5] tests/i915/gem_exec_gttfill: Require
 relocation support
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

U2luY2UgdGhpcyB0ZXN0IHVzZXMgcmVsb2NhdGlvbnMsIHdoaWNoIGFyZSBub3cgZGlzYWJsZWQg
b24gbmV3ZXIKZ2VuZXJhdGlvbnMsIHdlIG5lZWQgdG8gc2tpcCB0aGUgdGVzdCBpZiB0aGV5IGFy
ZSBub3Qgc3VwcG9ydGVkLgpJbiBvcmRlciB0byBtYWludGFpbiBjb3ZlcmFnZSBhIHNsaWdodGx5
IG1vZGlmaWVkIHZlcnNpb24gb2YgdGhpcwp0ZXN0IHVzaW5nIHNvZnRwaW5uaW5nIGluc3RlYWQg
b2YgcmVsb2NhdGlvbnMgaXMgYWRkZWQgdG8gZ2VtX3NvZnRwaW4uCgpTaWduZWQtb2ZmLWJ5OiBB
bmRyemVqIFR1cmtvIDxhbmRyemVqLnR1cmtvQGxpbnV4LmludGVsLmNvbT4KQ2M6IFpiaWduaWV3
IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgotLS0KIHRlc3Rz
L2k5MTUvZ2VtX2V4ZWNfZ3R0ZmlsbC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9leGVjX2d0dGZpbGwuYyBiL3Rlc3Rz
L2k5MTUvZ2VtX2V4ZWNfZ3R0ZmlsbC5jCmluZGV4IGU3MTE1NzZmNS4uNGIyMDZjMWJkIDEwMDY0
NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX2d0dGZpbGwuYworKysgYi90ZXN0cy9pOTE1L2dl
bV9leGVjX2d0dGZpbGwuYwpAQCAtMjE0LDYgKzIxNCw3IEBAIGlndF9tYWluCiAJaWd0X2ZpeHR1
cmUgewogCQlpOTE1ID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7CiAJCWlndF9yZXF1
aXJlX2dlbShpOTE1KTsKKwkJaWd0X3JlcXVpcmUoZ2VtX2hhc19yZWxvY2F0aW9ucyhpOTE1KSk7
CiAJCWlndF9mb3JrX2hhbmdfZGV0ZWN0b3IoaTkxNSk7CiAJfQogCi0tIAoyLjI1LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
