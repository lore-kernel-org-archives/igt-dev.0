Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12C3897FD
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Mar 2018 10:05:51 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Wed, 28 Mar 2018 12:05:49 +0200
Message-Id: <20180328100549.36538-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kms: Reset FIFO underruns on first
 commit after init()/reset().
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

V2hlbiB3ZSBzZXQgdGhlIHRlc3QgdG8gaXRzIGZpcnN0IHN0YXRlLCB3ZSB3aWxsIGNsZWFyIEZJ
Rk8gdW5kZXJydW4Kc3RhdHVzIHRocm91Z2ggdGhlIGRlYnVnZnMsIHNvIHRoYXQgYW55IHVuZGVy
cnVucyBjYXVzZWQgYnkgdGhlIHRlc3RzCndpbGwgbm90IGFmZmVjdCBvdGhlciB0ZXN0cy4gSW4g
cGFydGljdWxhciB0aGlzIGFsc28gcmVzZXRzIHRoZSBGQkMKRklGTyB1bmRlcnJ1biBzdGF0dXMs
IHNvIHByZXZpb3VzIGZhaWx1cmVzIHdvbid0IGFmZmVjdCBvdGhlciB0ZXN0cwp0aGF0IGRlcGVu
ZCBvbiBGQkMuCgpTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9w
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1NjgxCi0tLQogbGliL2lndF9rbXMuYyB8IDcgKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
a21zLmMgYi9saWIvaWd0X2ttcy5jCmluZGV4IDE5ZDY1MGE4ZGNmOC4uYzk0MzQxMWU1MmQ3IDEw
MDY0NAotLS0gYS9saWIvaWd0X2ttcy5jCisrKyBiL2xpYi9pZ3Rfa21zLmMKQEAgLTMxMTIsNiAr
MzExMiwxMyBAQCBkaXNwbGF5X2NvbW1pdF9jaGFuZ2VkKGlndF9kaXNwbGF5X3QgKmRpc3BsYXks
IGVudW0gaWd0X2NvbW1pdF9zdHlsZSBzKQogCX0KIAogCWlmIChkaXNwbGF5LT5maXJzdF9jb21t
aXQpIHsKKwkJaW50IGZkID0gaWd0X2RlYnVnZnNfb3BlbihkaXNwbGF5LT5kcm1fZmQsICJpOTE1
X2ZpZm9fdW5kZXJydW5fcmVzZXQiLCBPX1dST05MWSk7CisJCWlmIChmZCA+PSAwKSB7CisJCQlp
Z3RfYXNzZXJ0X2VxKHdyaXRlKGZkLCAieSIsIDEpLCAxKTsKKworCQkJY2xvc2UoZmQpOworCQl9
CisKIAkJaWd0X2Rpc3BsYXlfZHJvcF9ldmVudHMoZGlzcGxheSk7CiAJCWRpc3BsYXktPmZpcnN0
X2NvbW1pdCA9IGZhbHNlOwogCX0KLS0gCjIuMTYuMwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
