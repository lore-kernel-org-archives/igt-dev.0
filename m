Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA526E3D5
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2018 08:01:43 +0000 (UTC)
Received: by mail-wm0-x244.google.com with SMTP id j21-v6so26098503wmh.1
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Feb 2018 00:01:42 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Thu,  8 Feb 2018 08:01:31 +0000
Message-Id: <20180208080131.3004-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180208080131.3004-1-tvrtko.ursulin@linux.intel.com>
References: <20180208080131.3004-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/perf_pmu: Give sampling more time
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCldlIGdldCBv
Y2Nhc2lvbmFsIGVycm9ycyBsaWtlOgoKIChwZXJmX3BtdToyMTMxNSkgQ1JJVElDQUw6IFRlc3Qg
YXNzZXJ0aW9uIGZhaWx1cmUgZnVuY3Rpb24gc2VtYV93YWl0LCBmaWxlIHBlcmZfcG11LmM6NjMx
OgogKHBlcmZfcG11OjIxMzE1KSBDUklUSUNBTDogRmFpbGVkIGFzc2VydGlvbjogKGRvdWJsZSko
dmFsWzFdIC0gdmFsWzBdKSA8PSAoMS4wICsgKHRvbGVyYW5jZSkpICogKGRvdWJsZSkoc2xlcHQp
ICYmIChkb3VibGUpKHZhbFsxXSAtIHZhbFswXSkgPj0gKDEuMCAtICh0b2xlcmFuY2UpKSAqIChk
b3VibGUpKHNsZXB0KQogKHBlcmZfcG11OjIxMzE1KSBDUklUSUNBTDogJ3ZhbFsxXSAtIHZhbFsw
XScgIT0gJ3NsZXB0JyAoNDUwMDAwMDAwLjAwMDAwMCBub3Qgd2l0aGluIDUuMDAwMDAwJSB0b2xl
cmFuY2Ugb2YgNTAwMTI5NjE4LjAwMDAwMCkKClN1Z2dlc3RpbmcgYSB0aW1lIGRpc2FncmVlbWVu
dCBiZXR3ZWVuIHVzZXJzcGFjZSBhbmQgdGhlIFBNVS4KCkF0IHRoZSBtb21lbnQgSSBnb3Qgbm8g
YmV0dGVyIGlkZWFzIHRoYW4gZmlkZGxpbmcgd2l0aCBkZWxheXMgdG8gc2VlIGlmIGl0CmltcHJv
dmVzIHRoaW5ncy4KClNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxp
bkBpbnRlbC5jb20+Ci0tLQogdGVzdHMvcGVyZl9wbXUuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3Bl
cmZfcG11LmMgYi90ZXN0cy9wZXJmX3BtdS5jCmluZGV4IDA3YjI1NzY1ZjFmNi4uMzRhYWI2ZmQ1
MzdmIDEwMDY0NAotLS0gYS90ZXN0cy9wZXJmX3BtdS5jCisrKyBiL3Rlc3RzL3BlcmZfcG11LmMK
QEAgLTYwOCw3ICs2MDgsOSBAQCBzZW1hX3dhaXQoaW50IGdlbV9mZCwgY29uc3Qgc3RydWN0IGlu
dGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplLAogCWRvIHsgLyogd2FpdCBmb3IgdGhlIGJhdGNoIHRv
IHN0YXJ0IGV4ZWN1dGluZyAqLwogCQl1c2xlZXAoNWUzKTsKIAl9IHdoaWxlICghb2JqX3B0clsx
XSk7Ci0JdXNsZWVwKDVlMyk7IC8qIHdhaXQgZm9yIHRoZSByZWdpc3RlciBzYW1wbGluZyAqLwor
CisJcG11X3JlYWRfc2luZ2xlKGZkKTsgLyogZHVtbXkgcmVhZCB0byBwcmltZSBwbXU/ICovCisJ
dXNsZWVwKDUwZTMpOyAvKiB3YWl0IGZvciB0aGUgcmVnaXN0ZXIgc2FtcGxpbmcgKi8KIAogCXZh
bFswXSA9IHBtdV9yZWFkX3NpbmdsZShmZCk7CiAJc2xlcHQgPSBtZWFzdXJlZF91c2xlZXAoYmF0
Y2hfZHVyYXRpb25fbnMgLyAxMDAwKTsKLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
