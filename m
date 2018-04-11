Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E156E119
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Apr 2018 02:37:58 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 10 Apr 2018 19:37:15 -0700
Message-Id: <20180411023732.32362-3-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 03/20] tests/psr: Rename psr_active() to
 psr_enabled()
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

cHNyX2FjdGl2ZSgpIGNoZWNrcyB0aGUgZGVidWdmcyBmbGFnICJIVyBFbmFibGVkICYgQWN0aXZl
IGJpdCIsIHdoaWNoIG9ubHkKdGVsbHMgdXMgaWYgUFNSIHdhcyBlbmFibGVkIGJ5IHRoZSBkcml2
ZXIuIFRoZSBzdGF0ZSBvZiBQU1IgLSBhY3RpdmUKb3IgaW5hY3RpdmUgaXMgZGlmZmVyZW50IGZy
b20gdGhpcyBmbGFnIGZvciBEREkgcGxhdGZvcm1zLCBzbyByZW5hbWUgdGhlCmZ1bmN0aW9uIGFw
cHJvcHJpYXRlbHkuCgpTaWduZWQtb2ZmLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWth
cmFuLnBhbmRpeWFuQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jIGIvdGVzdHMva21zX3Bzcl9zaW5r
X2NyYy5jCmluZGV4IGU1NWQyNTc2Li4xNjU3ZWU4YSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3Bz
cl9zaW5rX2NyYy5jCisrKyBiL3Rlc3RzL2ttc19wc3Jfc2lua19jcmMuYwpAQCAtMjAzLDcgKzIw
Myw3IEBAIHN0YXRpYyBib29sIHNpbmtfc3VwcG9ydChkYXRhX3QgKmRhdGEpCiAJCXN0cnN0cihi
dWYsICJTaW5rX1N1cHBvcnQ6IHllc1xuIik7CiB9CiAKLXN0YXRpYyBib29sIHBzcl9hY3RpdmUo
ZGF0YV90ICpkYXRhKQorc3RhdGljIGJvb2wgcHNyX2VuYWJsZWQoZGF0YV90ICpkYXRhKQogewog
CWNoYXIgYnVmWzUxMl07CiAKQEAgLTIxNyw3ICsyMTcsNyBAQCBzdGF0aWMgYm9vbCB3YWl0X3Bz
cl9lbnRyeShkYXRhX3QgKmRhdGEpCiB7CiAJaW50IHRpbWVvdXQgPSA1OwogCXdoaWxlICh0aW1l
b3V0LS0pIHsKLQkJaWYgKHBzcl9hY3RpdmUoZGF0YSkpCisJCWlmIChwc3JfZW5hYmxlZChkYXRh
KSkKIAkJCXJldHVybiB0cnVlOwogCQlzbGVlcCgxKTsKIAl9Ci0tIAoyLjE0LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
