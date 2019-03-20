Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3940C89D5E
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 21:16:42 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Wed, 20 Mar 2019 14:15:58 -0700
Message-Id: <20190320211600.4792-1-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [CI 1/3] lib/igt_fb: Switch to using is_ccs_modifier()
 wrapper
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

QSBsaW5lYXIgbWFwcGluZyBzZXR1cCBmb3IgWSwgWWYgdGlsZWQgYW5kIENDUyBtb2RpZmllcnMu
IEluc3RlYWQgb2YKY2hlY2tpbmcgYWdhaW5zdCBlYWNoIENDUyBtb2RpZmllciwgbGV0J3MgbWFr
ZSB1c2Ugb2YgdGhpcyB3cmFwcGVyLgoKQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRo
aW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2ZiLmMgfCAzICst
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCA2YTlhOTM0MS4uYmFkMWQx
ZmIgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZmIuYworKysgYi9saWIvaWd0X2ZiLmMKQEAgLTI1MTks
OCArMjUxOSw3IEBAIHN0YXRpYyB2b2lkIGNyZWF0ZV9jYWlyb19zdXJmYWNlX19jb252ZXJ0KGlu
dCBmZCwgc3RydWN0IGlndF9mYiAqZmIpCiAKIAlpZiAoZmItPm1vZGlmaWVyID09IExPQ0FMX0k5
MTVfRk9STUFUX01PRF9ZX1RJTEVEIHx8CiAJICAgIGZiLT5tb2RpZmllciA9PSBMT0NBTF9JOTE1
X0ZPUk1BVF9NT0RfWWZfVElMRUQgfHwKLQkgICAgZmItPm1vZGlmaWVyID09IExPQ0FMX0k5MTVf
Rk9STUFUX01PRF9ZX1RJTEVEX0NDUyB8fAotCSAgICBmYi0+bW9kaWZpZXIgPT0gTE9DQUxfSTkx
NV9GT1JNQVRfTU9EX1lmX1RJTEVEX0NDUykgeworCSAgICBpc19jY3NfbW9kaWZpZXIoZmItPm1v
ZGlmaWVyKSkgewogCQlzZXR1cF9saW5lYXJfbWFwcGluZygmYmxpdC0+YmFzZSk7CiAJfSBlbHNl
IHsKIAkJYmxpdC0+YmFzZS5saW5lYXIuZmIgPSAqZmI7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
