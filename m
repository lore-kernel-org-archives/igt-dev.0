Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA03B6E9D6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2019 15:36:01 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue,  3 Dec 2019 17:35:53 +0200
Message-Id: <20191203153555.12948-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20191203153555.12948-1-ville.syrjala@linux.intel.com>
References: <20191203153555.12948-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/igt_kms: Don't leak fds when
 forcing connector multiple times
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkNs
b3NlIHRoZSBuZXcgc3lzZnMgZGlyZWN0b3J5IGZkIHdoZW4gd2UndmUgYWxyZWFkeSBmb3JjZWQK
dGhlIHNhbWUgY29ubmVjdG9yIHByZXZpb3VzbHkuIEN1cnJlbnRseSB3ZSdyZSBsZWFraW5nIHRo
ZSBmZC4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+Ci0tLQogbGliL2lndF9rbXMuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMu
YwppbmRleCA3NGFlOThkNzc0ZjEuLmJhMTY1N2QwNmQ0NSAxMDA2NDQKLS0tIGEvbGliL2lndF9r
bXMuYworKysgYi9saWIvaWd0X2ttcy5jCkBAIC0xMDc1LDYgKzEwNzUsOCBAQCBib29sIGttc3Rl
c3RfZm9yY2VfY29ubmVjdG9yKGludCBkcm1fZmQsIGRybU1vZGVDb25uZWN0b3IgKmNvbm5lY3Rv
ciwKIAlpZiAobGVuICE9IC0xICYmIGxlbiA8IE1BWF9DT05ORUNUT1JTKSB7CiAJCWZvcmNlZF9j
b25uZWN0b3JzW2xlbl0gPSBwYXRoOwogCQlmb3JjZWRfY29ubmVjdG9yc19kZXZpY2VbbGVuXSA9
IGRpcjsKKwl9IGVsc2UgeworCQljbG9zZShkaXIpOwogCX0KIAogCWlmIChsZW4gPj0gTUFYX0NP
Tk5FQ1RPUlMpCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
