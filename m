Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2CC6E001
 for <igt-dev@lists.freedesktop.org>; Mon, 21 May 2018 11:23:48 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 21 May 2018 12:23:39 +0100
Message-Id: <20180521112339.16650-5-lionel.g.landwerlin@intel.com>
In-Reply-To: <20180521112339.16650-1-lionel.g.landwerlin@intel.com>
References: <20180521112339.16650-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 4/4] tests/gem_ctx_isolation: verify
 INSTPM isolation on Gen7+
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
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyByZWdpc3RlciBzaG91bGRuJ3QgbGVhayBiZXR3ZWVuIGNvbnRleHRzLiBEb2N1bWVudGF0
aW9uIHNheXMgaXQncwpjb250ZXh0IHNhdmVkL3Jlc3RvcmVkLgoKdjI6IERvbid0IGR1cGxpY2F0
ZSBJTlNUUE0gaW4gdGhlIGxpc3QgKENocmlzKQoKU2lnbmVkLW9mZi1ieTogTGlvbmVsIExhbmR3
ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgotLS0KIHRlc3RzL2dlbV9jdHhf
aXNvbGF0aW9uLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9nZW1fY3R4X2lzb2xhdGlvbi5jIGIvdGVzdHMv
Z2VtX2N0eF9pc29sYXRpb24uYwppbmRleCAwNTMwY2FhNS4uMTBjYzM0Y2UgMTAwNjQ0Ci0tLSBh
L3Rlc3RzL2dlbV9jdHhfaXNvbGF0aW9uLmMKKysrIGIvdGVzdHMvZ2VtX2N0eF9pc29sYXRpb24u
YwpAQCAtNjcsNyArNjcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG5hbWVkX3JlZ2lzdGVyIHsK
IH0gbm9ucHJpdl9yZWdpc3RlcnNbXSA9IHsKIAl7ICJOT1BJRCIsIE5PQ1RYLCBSQ1MwLCAweDIw
OTQsIDEsIDcgfSwKIAl7ICJNSV9QUkVESUNBVEVfUkVTVUxUXzIiLCBOT0NUWCwgUkNTMCwgMHgy
M2JjLCAxLCA3IH0sCi0JeyAiSU5TVFBNIiwgR0VOOSwgUkNTMCwgMHgyMGMwLCAxLCA3IH0sCisJ
eyAiSU5TVFBNIiwgR0VONywgUkNTMCwgMHgyMGMwLCAxLCAxMCB9LAogCXsgIklBX1ZFUlRJQ0VT
X0NPVU5UIiwgR0VONCwgUkNTMCwgMHgyMzEwLCAyLCA3IH0sCiAJeyAiSUFfUFJJTUlUSVZFU19D
T1VOVCIsIEdFTjQsIFJDUzAsIDB4MjMxOCwgMiwgNyB9LAogCXsgIlZTX0lOVk9DQVRJT05fQ09V
TlQiLCBHRU40LCBSQ1MwLCAweDIzMjAsIDIsIDcgfSwKLS0gCjIuMTcuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
