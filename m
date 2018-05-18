Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704DA6EE87
 for <igt-dev@lists.freedesktop.org>; Fri, 18 May 2018 17:10:43 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 18 May 2018 18:10:43 +0100
Message-Id: <20180518171043.4438-4-lionel.g.landwerlin@intel.com>
In-Reply-To: <20180518171043.4438-1-lionel.g.landwerlin@intel.com>
References: <20180518171043.4438-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t 3/3] test/gem_ctx_isolation: verify INSTPM
 isolation on Gen7+
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

VGhpcyByZWdpc3RlciBzaG91bGQgbGVhayBiZXR3ZWVuIGNvbnRleHRzLiBEb2N1bWVudGF0aW9u
IHNheXMgaXQncwpjb250ZXh0IHNhdmVkL3Jlc3RvcmVkLgoKU2lnbmVkLW9mZi1ieTogTGlvbmVs
IExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgotLS0KIHRlc3RzL2dl
bV9jdHhfaXNvbGF0aW9uLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoK
ZGlmZiAtLWdpdCBhL3Rlc3RzL2dlbV9jdHhfaXNvbGF0aW9uLmMgYi90ZXN0cy9nZW1fY3R4X2lz
b2xhdGlvbi5jCmluZGV4IDQ5NjhlMzY3Li40ODI5MTU0NyAxMDA2NDQKLS0tIGEvdGVzdHMvZ2Vt
X2N0eF9pc29sYXRpb24uYworKysgYi90ZXN0cy9nZW1fY3R4X2lzb2xhdGlvbi5jCkBAIC0xMjIs
NiArMTIyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBuYW1lZF9yZWdpc3RlciB7CiAJeyAiT0Ff
Q09OVFJPTCIsIE5PQ1RYLCBSQ1MwLCAweDJiMDAgfSwKIAl7ICJQRVJGX0NOVF8xIiwgTk9DVFgs
IFJDUzAsIDB4OTFiOCwgMiB9LAogCXsgIlBFUkZfQ05UXzIiLCBOT0NUWCwgUkNTMCwgMHg5MWMw
LCAyIH0sCisJeyAiSU5TVFBNIiwgR0VONywgUkNTMCwgMHgyMGMwIH0sCiAKIAkvKiBQcml2aWxl
Z2VkIChlbmFibGVkIGJ5IHcvYSArIEZPUkNFX1RPX05PTlBSSVYpICovCiAJeyAiQ1RYX1BSRUVN
UFQiLCBOT0NUWCAvKiBHRU5fUkFOR0UoOSwgMTApICovLCBSQ1MwLCAweDIyNDggfSwKLS0gCjIu
MTcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
