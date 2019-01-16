Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4A06EFD0
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:04 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:40 +0200
Message-Id: <20190116112050.27647-12-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 11/21] lib/igt_kms: Assert that active crtcs
 have at least one plane
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
Cc: Robert Foss <robert.foss@collabora.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CkNj
OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPgpDYzogUm9iZXJ0IEZvc3MgPHJv
YmVydC5mb3NzQGNvbGxhYm9yYS5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdp
bHNvbi5jby51az4KLS0tCiBsaWIvaWd0X2ttcy5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMuYwpp
bmRleCBiMDZhY2IyYi4uMWE5MTc5MWMgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3Rfa21zLmMKKysrIGIv
bGliL2lndF9rbXMuYwpAQCAtMTU5Myw2ICsxNTkzLDcgQEAgc3RhdGljIHZvaWQga21zdGVzdF9n
ZXRfY3J0YyhpbnQgZGV2aWNlLCBlbnVtIHBpcGUgcGlwZSwgc3RydWN0IGttc3Rlc3RfY3J0YyAq
Y3IKIAogCQkJCW4gPSBmdGVsbChmaWxlKTsKIAkJCQljcnRjLT5uX3BsYW5lcyA9IHBhcnNlX3Bs
YW5lcyhmaWxlLCBOVUxMKTsKKwkJCQlpZ3RfYXNzZXJ0X2x0KDAsIGNydGMtPm5fcGxhbmVzKTsK
IAkJCQljcnRjLT5wbGFuZXMgPSBjYWxsb2MoY3J0Yy0+bl9wbGFuZXMsIHNpemVvZigqY3J0Yy0+
cGxhbmVzKSk7CiAJCQkJaWd0X2Fzc2VydF9mKGNydGMtPnBsYW5lcywgIkZhaWxlZCB0byBhbGxv
Y2F0ZSBtZW1vcnkgZm9yICVkIHBsYW5lc1xuIiwgY3J0Yy0+bl9wbGFuZXMpOwogCi0tIAoyLjE5
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
