Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326796E4D1
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2019 17:57:34 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 28 Mar 2019 19:57:25 +0200
Message-Id: <20190328175727.3086-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20190328175727.3086-1-ville.syrjala@linux.intel.com>
References: <20190328175727.3086-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/kms_plane: Reduce the plane size
 64x64
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
ZHVjZSB0aGUgcGxhbmUgc2l6ZSBmdXJ0aGVyIHRvIHNwZWVkIHVwIHRoZSB0ZXN0LiA2NHg2NCBp
cyB0aGUKdW5pdmVyc2FsIGk5MTUgbWluaW11bSBjdXJzb3Igc2l6ZSBzbyB3ZSdsbCB1c2UgdGhh
dC4gQW5kIHNpbmNlCndlIGNob2NlIHdpc2VseSB3ZSdsbCBtYWtlIGN1cnNvcnMgdXNlIHRoZSBy
ZWR1Y2VkIHNpemUgYXMgd2VsbC4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX3BsYW5lLmMgfCA2ICsr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90ZXN0cy9rbXNfcGxhbmUuYyBiL3Rlc3RzL2ttc19wbGFuZS5jCmluZGV4IDE0
M2JjNWU2ZjNiOC4uNDAwN2M4OTRmODdhIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfcGxhbmUuYwor
KysgYi90ZXN0cy9rbXNfcGxhbmUuYwpAQCAtNDk5LDEyICs0OTksMTIgQEAgc3RhdGljIGJvb2wg
dGVzdF9mb3JtYXRfcGxhbmUoZGF0YV90ICpkYXRhLCBlbnVtIHBpcGUgcGlwZSwKIAkJIElHVF9G
T1JNQVRfQVJHUyhmb3JtYXQpLAogCQkga21zdGVzdF9waXBlX25hbWUocGlwZSksIHBsYW5lLT5p
bmRleCk7CiAKLQlpZiAocGxhbmUtPnR5cGUgIT0gRFJNX1BMQU5FX1RZUEVfQ1VSU09SICYmIGRh
dGEtPmRpc3BsYXkuaXNfYXRvbWljKSB7CisJaWYgKGRhdGEtPmRpc3BsYXkuaXNfYXRvbWljKSB7
CiAJCXN0cnVjdCBpZ3RfZmIgdGVzdF9mYjsKIAkJaW50IHJldDsKIAotCQlpZ3RfY3JlYXRlX2Zi
KGRhdGEtPmRybV9mZCwgMjU2LCAyNTYsIGZvcm1hdCwKLQkJCQkgICAgTE9DQUxfRFJNX0ZPUk1B
VF9NT0RfTk9ORSwgJnRlc3RfZmIpOworCQlpZ3RfY3JlYXRlX2ZiKGRhdGEtPmRybV9mZCwgNjQs
IDY0LCBmb3JtYXQsCisJCQkgICAgICBMT0NBTF9EUk1fRk9STUFUX01PRF9OT05FLCAmdGVzdF9m
Yik7CiAKIAkJaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgJnRlc3RfZmIpOwogCi0tIAoyLjE5LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
