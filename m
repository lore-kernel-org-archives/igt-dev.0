Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EA26F954
 for <igt-dev@lists.freedesktop.org>; Sat, 12 Jan 2019 01:46:37 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Fri, 11 Jan 2019 17:46:01 -0800
Message-Id: <20190112014607.13446-4-jose.souza@intel.com>
In-Reply-To: <20190112014607.13446-1-jose.souza@intel.com>
References: <20190112014607.13446-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 04/10] lib/psr: Only care about DEEP_SLEEP
 state for PSR2
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VG8gY2hlY2sgaWYgUFNSIGlzIGFjdGl2ZSBpdCBzZWFyY2ggZm9yIFNSREVOVCBmb3IgUFNSMSBh
bmQgaXQgd2FzCnNlYXJjaGluZyBmb3IgU0xFRVAgZm9yIFBTUjIgYnV0IGl0IHNob3VsZCByZWFs
bHkgc2VhY2ggZm9yCkRFRVBfU0xFRVAgYXMgaW4gdGhpcyBzdGF0ZSBkaXNwbGF5IGJsb2NrIGlz
IGFjdHVhbHkgc2F2aW5nIGEKc3Vic3RhbmNpYWwgYW1vdW50IG9mIHBvd2VyLgoKQ2M6IERoaW5h
a2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgpTaWduZWQtb2Zm
LWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiBs
aWIvaWd0X3Bzci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMKaW5k
ZXggYTU5ZmY5NGUuLjgzYzViOTg2IDEwMDY0NAotLS0gYS9saWIvaWd0X3Bzci5jCisrKyBiL2xp
Yi9pZ3RfcHNyLmMKQEAgLTMzLDcgKzMzLDcgQEAgc3RhdGljIGJvb2wgcHNyX2FjdGl2ZShpbnQg
ZGVidWdmc19mZCwgYm9vbCBjaGVja19hY3RpdmUpCiAJaWd0X2RlYnVnZnNfc2ltcGxlX3JlYWQo
ZGVidWdmc19mZCwgImk5MTVfZWRwX3Bzcl9zdGF0dXMiLCBidWYsCiAJCQkJc2l6ZW9mKGJ1Zikp
OwogCi0JYWN0aXZlID0gc3Ryc3RyKGJ1ZiwgIlNSREVOVCIpIHx8IHN0cnN0cihidWYsICJTTEVF
UCIpOworCWFjdGl2ZSA9IHN0cnN0cihidWYsICJTUkRFTlQiKSB8fCBzdHJzdHIoYnVmLCAiREVF
UF9TTEVFUCIpOwogCXJldHVybiBjaGVja19hY3RpdmUgPyBhY3RpdmUgOiAhYWN0aXZlOwogfQog
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
