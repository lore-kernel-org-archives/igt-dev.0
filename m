Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EF6891A6
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 14:24:58 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w2so11576080wrt.11
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 06:24:58 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 20 Feb 2019 15:24:48 +0100
Message-Id: <20190220142449.4986-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20190220142449.4986-1-daniel.vetter@ffwll.ch>
References: <20190220142449.4986-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_mmap_write_crc: Fix
 igt_fixture handling
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

aWd0X2ZpeHR1cmUgd2l0aGluIGFuIGlndF9zaW1wbGVfdGVzdCBkb24ndCByZWFsbHkgd29yayBh
cyBhZHZlcnRpc2VkLgoKTWluaW1hbCBmaXgsIHRoZSB0ZXN0Y2FzZSBzZWVtcyBmYWlybHkgcXVl
c3Rpb25hYmxlIGFscmVhZHkgLi4uCgpSZWZlcmVuY2VzOiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL2RybXRpcF8yMjIvZmktaWNsLXkvaWd0QGttc19tbWFwX3dyaXRl
X2NyYy5odG1sClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50
ZWwuY29tPgotLS0KIHRlc3RzL2ttc19tbWFwX3dyaXRlX2NyYy5jIHwgMTEgKysrKysrKy0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvdGVzdHMva21zX21tYXBfd3JpdGVfY3JjLmMgYi90ZXN0cy9rbXNfbW1hcF93cml0ZV9j
cmMuYwppbmRleCA5M2M5NmVmNGRlMDguLmJmMmIwYzI5OTFiMyAxMDA2NDQKLS0tIGEvdGVzdHMv
a21zX21tYXBfd3JpdGVfY3JjLmMKKysrIGIvdGVzdHMva21zX21tYXBfd3JpdGVfY3JjLmMKQEAg
LTI2OCw3ICsyNjgsOCBAQCBzdGF0aWMgZGF0YV90IGRhdGE7CiBpbnQgbWFpbihpbnQgYXJnYywg
Y2hhciAqKmFyZ3YpCiB7CiAJaW50IGk7Ci0JaWd0X3NpbXBsZV9pbml0X3BhcnNlX29wdHMoJmFy
Z2MsIGFyZ3YsICJuIiwgTlVMTCwgTlVMTCwgb3B0X2hhbmRsZXIsIE5VTEwpOworCWlndF9zdWJ0
ZXN0X2luaXRfcGFyc2Vfb3B0cygmYXJnYywgYXJndiwgIm4iLCBOVUxMLCBOVUxMLAorCQkJCSAg
ICBvcHRfaGFuZGxlciwgTlVMTCk7CiAKIAlpZ3Rfc2tpcF9vbl9zaW11bGF0aW9uKCk7CiAKQEAg
LTI4NiwxMCArMjg3LDEyIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIAkJZm9y
a19jcHVob2dfaGVscGVyKCk7CiAJfQogCi0JaWd0X2luZm8oIlVzaW5nICVkIHJvdW5kcyBmb3Ig
dGhlIHRlc3RcbiIsIFJPVU5EUyk7CisJaWd0X3N1YnRlc3QoIm1haW4iKSB7CisJCWlndF9pbmZv
KCJVc2luZyAlZCByb3VuZHMgZm9yIHRoZSB0ZXN0XG4iLCBST1VORFMpOwogCi0JZm9yIChpID0g
MDsgaSA8IFJPVU5EUzsgaSsrKQotCQlydW5fdGVzdCgmZGF0YSk7CisJCWZvciAoaSA9IDA7IGkg
PCBST1VORFM7IGkrKykKKwkJCXJ1bl90ZXN0KCZkYXRhKTsKKwl9CiAKIAlpZ3RfZml4dHVyZSB7
CiAJCWlndF9kaXNwbGF5X2ZpbmkoJmRhdGEuZGlzcGxheSk7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
