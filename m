Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A7C6E567
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Feb 2019 18:02:23 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id o59so7871632edb.3
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Feb 2019 10:02:23 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 11 Feb 2019 19:02:04 +0100
Message-Id: <20190211180208.29406-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20190211180208.29406-1-daniel.vetter@ffwll.ch>
References: <20190211180208.29406-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/9] tests/i915_missed_irq: Don't leave the
 hang detector hanging
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U3BvdHRlZCBieSBteSBuZXcgImFyZSB0aGVyZSBhbnkgY2hpbGQgcHJvY2Vzc2VzIGxlZnQ/IiBj
aGVjayBpbgppZ3RfZXhpdCAtIHdlIG5lZWQgdG8gcHV0IGFsbCB0aGUgaWd0X3JlcXVpcmUgYmVm
b3JlIHdlIHN0YXJ0IGFueSByZWFsCnRlc3QgbG9naWMuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L21pc3NlZF9p
cnEuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L21pc3NlZF9pcnEuYyBiL3Rlc3RzL2k5MTUv
bWlzc2VkX2lycS5jCmluZGV4IGNhZGUzZjM3MTQwMS4uMzAyZGEwZThkMDcxIDEwMDY0NAotLS0g
YS90ZXN0cy9pOTE1L21pc3NlZF9pcnEuYworKysgYi90ZXN0cy9pOTE1L21pc3NlZF9pcnEuYwpA
QCAtMTA4LDEzICsxMDgsMTMgQEAgaWd0X3NpbXBsZV9tYWluCiAJaWd0X3JlcXVpcmVfZ2VtKGRl
dmljZSk7CiAJaWd0X3NraXBfb24oZ2VtX2hhc19ndWNfc3VibWlzc2lvbihkZXZpY2UpKTsgLyog
aXJxIGZvcmNlZCBmb3IgZ3VjICovCiAJZ2VtX3JlcXVpcmVfbW1hcF93YyhkZXZpY2UpOwotCWln
dF9mb3JrX2hhbmdfZGV0ZWN0b3IoZGV2aWNlKTsKLQogCWRlYnVnZnMgPSBpZ3RfZGVidWdmc19k
aXIoZGV2aWNlKTsKIAogCWV4cGVjdF9yaW5ncyA9IGVuZ2luZV9tYXNrKGRlYnVnZnMpOwogCWln
dF9yZXF1aXJlKGV4cGVjdF9yaW5ncyk7CiAKKwlpZ3RfZm9ya19oYW5nX2RldGVjdG9yKGRldmlj
ZSk7CisKIAlpZ3RfZGVidWcoIkNsZWFyaW5nIHJpbmdzICV4XG4iLCBleHBlY3RfcmluZ3MpOwog
CWludGVsX2RldGVjdF9hbmRfY2xlYXJfbWlzc2VkX2ludGVycnVwdHMoZGV2aWNlKTsKIAlmb3Ig
KGUgPSBpbnRlbF9leGVjdXRpb25fZW5naW5lczsgZS0+bmFtZTsgZSsrKSB7Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
