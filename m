Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B755789CA2
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2019 14:09:32 +0000 (UTC)
From: Caz Yokoyama <caz.yokoyama@intel.com>
Date: Tue, 16 Apr 2019 06:57:31 -0700
Message-Id: <515754349d83a31b5ba581aad7ce72ec8a05a366.1555422905.git.caz.yokoyama@intel.com>
Subject: [igt-dev] [PATCH 1/1] lib/vfs_file_max(): initialize static variable
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

SSBiZWxpZXZlIHVuLWluaXRpYWxpemVkIHN0YXRpYyB2YXJpYWJsZSBpcyBtb3N0IHByb2JhYmx5
IG5vdCB6ZXJvLgpDb3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcuCgpTaWduZWQtb2ZmLWJ5OiBDYXog
WW9rb3lhbWEgPGNhei55b2tveWFtYUBpbnRlbC5jb20+Ci0tLQogbGliL2ludGVsX29zLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9saWIvaW50ZWxfb3MuYyBiL2xpYi9pbnRlbF9vcy5jCmluZGV4IGRkOTNiZWExLi5h
NGZlNmIzNCAxMDA2NDQKLS0tIGEvbGliL2ludGVsX29zLmMKKysrIGIvbGliL2ludGVsX29zLmMK
QEAgLTI4MSw3ICsyODEsNyBAQCB2b2lkICppbnRlbF9nZXRfdG90YWxfcGlubmFibGVfbWVtKHNp
emVfdCAqdG90YWwpCiAKIHN0YXRpYyB1aW50NjRfdCB2ZnNfZmlsZV9tYXgodm9pZCkKIHsKLQlz
dGF0aWMgbG9uZyBsb25nIHVuc2lnbmVkIG1heDsKKwlzdGF0aWMgbG9uZyBsb25nIHVuc2lnbmVk
IG1heCA9IDA7CiAJaWYgKG1heCA9PSAwKSB7CiAJCUZJTEUgKmZpbGUgPSBmb3BlbigiL3Byb2Mv
c3lzL2ZzL2ZpbGUtbWF4IiwgInIiKTsKIAkJbWF4ID0gODAwMDA7Ci0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
