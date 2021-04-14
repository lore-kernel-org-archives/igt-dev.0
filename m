Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE3589755
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Apr 2021 02:28:12 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 14 Apr 2021 05:27:51 +0300
Message-Id: <20210414022754.31710-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
References: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/8] tools/intel_watermark: TGL+ can have 4
 pipes
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkRl
Y29kZSBwaXBlIEQgd2F0ZXJtYXJrIHN0dWZmIHRvby4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdG9vbHMvaW50ZWxf
d2F0ZXJtYXJrLmMgfCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9pbnRlbF93YXRlcm1hcmsuYyBiL3Rv
b2xzL2ludGVsX3dhdGVybWFyay5jCmluZGV4IGZmMzczZmRiMGM2ZC4uNjU3ZmZmMjBlYzdhIDEw
MDY0NAotLS0gYS90b29scy9pbnRlbF93YXRlcm1hcmsuYworKysgYi90b29scy9pbnRlbF93YXRl
cm1hcmsuYwpAQCAtMTMxLDYgKzEzMSwxMSBAQCBzdGF0aWMgY2hhciBlbmRpc19hc3QoYm9vbCBl
bmFibGVkKQogCXJldHVybiBlbmFibGVkID8gJyonIDogJyAnOwogfQogCitzdGF0aWMgaW50IHNr
bF9udW1fcGlwZXModWludDMyX3QgZCkKK3sKKwlyZXR1cm4gaW50ZWxfZ2VuKGQpID49IDEyID8g
NCA6IDM7Cit9CisKIHN0YXRpYyBpbnQgc2tsX251bV9wbGFuZXModWludDMyX3QgZCwgaW50IHBp
cGUpCiB7CiAJaW50IGdlbiA9IGludGVsX2dlbihkKTsKQEAgLTI2OSw3ICsyNzQsNyBAQCBzdGF0
aWMgdm9pZCBza2xfd21fZHVtcCh2b2lkKQogewogCXN0cnVjdCBpbnRlbF9tbWlvX2RhdGEgbW1p
b19kYXRhOwogCWludCBwaXBlLCBwbGFuZSwgbGV2ZWw7Ci0JaW50IG51bV9waXBlcyA9IDM7CisJ
aW50IG51bV9waXBlcyA9IHNrbF9udW1fcGlwZXMoZGV2aWQpOwogCWludCBtYXhfcGxhbmVzID0g
c2tsX21heF9wbGFuZXMoZGV2aWQpOwogCWludCBudW1fbGV2ZWxzID0gODsKIAl1aW50MzJfdCBi
YXNlX2FkZHIgPSAweDcwMDAwLCBhZGRyLCB3bV9vZmZzZXQ7Ci0tIAoyLjI2LjMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
