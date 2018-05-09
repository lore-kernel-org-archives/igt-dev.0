Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501256E90E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 17:38:08 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Wed,  9 May 2018 10:37:35 -0700
Message-Id: <20180509173746.23405-4-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
References: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 03/14] tests/psr: Rename psr_active() to
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
cmFuLnBhbmRpeWFuQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEthdGFyenluYSBEZWMgPGthdGFy
enluYS5kZWNAaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19wc3Jfc2lua19jcmMuYyB8IDQgKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMgYi90ZXN0cy9rbXNfcHNyX3NpbmtfY3Jj
LmMKaW5kZXggZTU1ZDI1NzYuLjE2NTdlZThhIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfcHNyX3Np
bmtfY3JjLmMKKysrIGIvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jCkBAIC0yMDMsNyArMjAzLDcg
QEAgc3RhdGljIGJvb2wgc2lua19zdXBwb3J0KGRhdGFfdCAqZGF0YSkKIAkJc3Ryc3RyKGJ1Ziwg
IlNpbmtfU3VwcG9ydDogeWVzXG4iKTsKIH0KIAotc3RhdGljIGJvb2wgcHNyX2FjdGl2ZShkYXRh
X3QgKmRhdGEpCitzdGF0aWMgYm9vbCBwc3JfZW5hYmxlZChkYXRhX3QgKmRhdGEpCiB7CiAJY2hh
ciBidWZbNTEyXTsKIApAQCAtMjE3LDcgKzIxNyw3IEBAIHN0YXRpYyBib29sIHdhaXRfcHNyX2Vu
dHJ5KGRhdGFfdCAqZGF0YSkKIHsKIAlpbnQgdGltZW91dCA9IDU7CiAJd2hpbGUgKHRpbWVvdXQt
LSkgewotCQlpZiAocHNyX2FjdGl2ZShkYXRhKSkKKwkJaWYgKHBzcl9lbmFibGVkKGRhdGEpKQog
CQkJcmV0dXJuIHRydWU7CiAJCXNsZWVwKDEpOwogCX0KLS0gCjIuMTQuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
