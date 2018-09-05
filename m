Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C396E11D
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Sep 2018 21:16:19 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Wed,  5 Sep 2018 14:15:58 -0700
Message-Id: <20180905211559.30713-4-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180905211559.30713-1-dhinakaran.pandiyan@intel.com>
References: <20180905211559.30713-1-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [CI 4/5] tests/psr: Test PSR1 in kms_psr
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

VGhlIHRlc3RzIHdlIGhhdmUgd29yayBvbmx5IHdpdGggUFNSMSwgYnV0IHNldHRpbmcgdGhlIG1v
ZHVsZSBwYXJhbWV0ZXIKZW5hYmxlX3BzciBlbmFibGVzIFBTUjIgaWYgdGhlIHBhbmVsIHN1cHBv
cnRzIGl0LiBNYWtlIHVzZSBvZiB0aGUgbmV3bHkKYWRkZWQgZGVidWdmcyB0b2dnbGUgdG8gZW5h
YmxlIG9ubHkgUFNSMSB3aGVuIHRlc3RpbmcuCgpTaWduZWQtb2ZmLWJ5OiBEaGluYWthcmFuIFBh
bmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEpvc8Op
IFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19w
c3IuYyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Bzci5jIGIvdGVzdHMva21zX3Bzci5j
CmluZGV4IDNlNjRjZjA0Li5mY2MwNDc3MCAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3Bzci5jCisr
KyBiL3Rlc3RzL2ttc19wc3IuYwpAQCAtNDE0LDggKzQxNCw5IEBAIGludCBtYWluKGludCBhcmdj
LCBjaGFyICphcmd2W10pCiAJCWttc3Rlc3Rfc2V0X3Z0X2dyYXBoaWNzX21vZGUoKTsKIAkJZGF0
YS5kZXZpZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZGF0YS5kcm1fZmQpOwogCi0JCWlndF9zZXRf
bW9kdWxlX3BhcmFtX2ludCgiZW5hYmxlX3BzciIsIGRhdGEud2l0aF9wc3JfZGlzYWJsZWQgPwot
CQkJCQkgMCA6IDEpOworCQlpZiAoIWRhdGEud2l0aF9wc3JfZGlzYWJsZWQpCisJCQlwc3JfZW5h
YmxlKGRhdGEuZGVidWdmc19mZCk7CisKIAkJaWd0X3JlcXVpcmVfZihzaW5rX3N1cHBvcnQoJmRh
dGEpLAogCQkJICAgICAgIlNpbmsgZG9lcyBub3Qgc3VwcG9ydCBQU1JcbiIpOwogCkBAIC00OTAs
NiArNDkxLDkgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAl9CiAKIAlpZ3Rf
Zml4dHVyZSB7CisJCWlmICghZGF0YS53aXRoX3Bzcl9kaXNhYmxlZCkKKwkJCXBzcl9kaXNhYmxl
KGRhdGEuZGVidWdmc19mZCk7CisKIAkJY2xvc2UoZGF0YS5kZWJ1Z2ZzX2ZkKTsKIAkJZHJtX2lu
dGVsX2J1Zm1ncl9kZXN0cm95KGRhdGEuYnVmbWdyKTsKIAkJZGlzcGxheV9maW5pKCZkYXRhKTsK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
