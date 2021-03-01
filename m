Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8756E072
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Mar 2021 20:32:20 +0000 (UTC)
From: Manasi Navare <manasi.d.navare@intel.com>
Date: Mon,  1 Mar 2021 12:37:34 -0800
Message-Id: <20210301203747.7177-2-manasi.d.navare@intel.com>
In-Reply-To: <20210301203747.7177-1-manasi.d.navare@intel.com>
References: <20210301203747.7177-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 01/14] tools/intel_display_poller: Fix
 TILEOFF vs. LINOFF for skl+
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCnNr
bCsgKGxpa2UgaHN3L2JkdykgYWx3YXlzIHVzZSB0aGUgVElMRU9GRiByZWdpc3RlciwgYW5kIG5l
dmVyCnRoZSBMSU5PRkYgcmVnaXN0ZXIuIExldCdzIHJlc3BlY3QgdGhhdC4KClNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQog
dG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXIuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9pbnRlbF9k
aXNwbGF5X3BvbGxlci5jIGIvdG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXIuYwppbmRleCBmNDc5
N2EyMC4uMTVkYThlNzYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2ludGVsX2Rpc3BsYXlfcG9sbGVyLmMK
KysrIGIvdG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXIuYwpAQCAtMTI4LDkgKzEyOCw5IEBAIHN0
YXRpYyB1aW50MzJfdCBkc3BvZmZzZXRfcmVnKHVpbnQzMl90IGRldmlkLCBpbnQgcGlwZSkKIAli
b29sIHVzZV90aWxlb2ZmOwogCWludCBwbGFuZSA9IHBpcGVfdG9fcGxhbmUoZGV2aWQsIHBpcGUp
OwogCi0JaWYgKElTX0dFTjIoZGV2aWQpIHx8IElTX0dFTjMoZGV2aWQpKQorCWlmIChpbnRlbF9n
ZW4oZGV2aWQpIDwgNCkKIAkJdXNlX3RpbGVvZmYgPSBmYWxzZTsKLQllbHNlIGlmIChJU19IQVNX
RUxMKGRldmlkKSB8fCBJU19CUk9BRFdFTEwoZGV2aWQpKQorCWVsc2UgaWYgKElTX0hBU1dFTEwo
ZGV2aWQpIHx8IElTX0JST0FEV0VMTChkZXZpZCkgfHwgaW50ZWxfZ2VuKGRldmlkKSA+PSA5KQog
CQl1c2VfdGlsZW9mZiA9IHRydWU7CiAJZWxzZQogCQl1c2VfdGlsZW9mZiA9IHJlYWRfcmVnKFBJ
UEVfUkVHKHBsYW5lLCBEU1BBQ05UUikpICYgRElTUExBWV9QTEFORV9USUxFRDsKLS0gCjIuMTku
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
