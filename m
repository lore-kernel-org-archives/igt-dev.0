Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9625C6EAB2
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Apr 2018 20:01:30 +0000 (UTC)
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
Date: Fri, 27 Apr 2018 13:01:23 -0700
Message-Id: <20180427200123.22903-3-paulo.r.zanoni@intel.com>
In-Reply-To: <20180427200123.22903-1-paulo.r.zanoni@intel.com>
References: <20180427200123.22903-1-paulo.r.zanoni@intel.com>
Subject: [igt-dev] [PATCH igt 3/3] lib/instdone.c: Add Gen11 Support
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
Cc: Javier Villavicencio <javier.villavicencio@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogSmF2aWVyIFZpbGxhdmljZW5jaW8gPGphdmllci52aWxsYXZpY2VuY2lvQGludGVsLmNv
bT4KCkJzcGVjOiAxMTQzMQoKU2lnbmVkLW9mZi1ieTogSmF2aWVyIFZpbGxhdmljZW5jaW8gPGph
dmllci52aWxsYXZpY2VuY2lvQGludGVsLmNvbT4KLS0tCiBsaWIvaW5zdGRvbmUuYyB8IDEyICsr
KysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9saWIvaW5zdGRvbmUuYyBiL2xpYi9pbnN0ZG9uZS5jCmluZGV4IDUx
MGZjZTY0Li5hODNmODgzNiAxMDA2NDQKLS0tIGEvbGliL2luc3Rkb25lLmMKKysrIGIvbGliL2lu
c3Rkb25lLmMKQEAgLTQxNywxMCArNDE3LDIwIEBAIGluaXRfZ2VuOF9pbnN0ZG9uZSh2b2lkKQog
CWluaXRfZ2VuNzVfaW5zdGRvbmUoKTsKIH0KIAorc3RhdGljIHZvaWQKK2luaXRfZ2VuMTFfaW5z
dGRvbmUodm9pZCkKK3sKKwlnZW42X2luc3Rkb25lMV9iaXQoMSA8PCAyNCwgIlRTRzEiKTsKKwln
ZW42X2luc3Rkb25lMV9iaXQoMSA8PCAxMSwgIlRERzEiKTsKKwlpbml0X2dlbjhfaW5zdGRvbmUo
KTsKK30KKwogYm9vbAogaW5pdF9pbnN0ZG9uZV9kZWZpbml0aW9ucyh1aW50MzJfdCBkZXZpZCkK
IHsKLQlpZiAoSVNfR0VOOChkZXZpZCkgfHwgSVNfR0VOOShkZXZpZCkgfHwgSVNfR0VOMTAoZGV2
aWQpKSB7CisJaWYgKElTX0dFTjExKGRldmlkKSkgeworCQlpbml0X2dlbjExX2luc3Rkb25lKCk7
CisJfSBlbHNlIGlmIChJU19HRU44KGRldmlkKSB8fCBJU19HRU45KGRldmlkKSB8fCBJU19HRU4x
MChkZXZpZCkpIHsKIAkJaW5pdF9nZW44X2luc3Rkb25lKCk7CiAJfSBlbHNlIGlmIChJU19HRU43
KGRldmlkKSkgewogCQlpbml0X2dlbjdfaW5zdGRvbmUoKTsKLS0gCjIuMTQuMwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
