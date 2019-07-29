Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B10C8989E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2019 21:28:38 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Mon, 29 Jul 2019 14:28:26 -0700
Message-Id: <20190729212826.20852-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2] i915/gem_mocs_settings: log the engine and
 MOCS index
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

VGhpcyBoZWxwcyB0byBpZGVudGlmeSB3aGljaCBlbnRyeSBpcyB3cm9uZyBpbiB0aGUgdGFibGUu
Cgp2MjogQWRkIGJhY2sgdGhlIHZhbHVlcyBhbmQgbWlzc2luZyBcbiAoZnJvbSBEYW5pZWxlKQoK
U2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+
Ci0tLQogdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jIHwgMTAgKysrKysrKystLQogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS90ZXN0cy9pOTE1L2dlbV9tb2NzX3NldHRpbmdzLmMgYi90ZXN0cy9pOTE1L2dlbV9tb2NzX3Nl
dHRpbmdzLmMKaW5kZXggMjIwY2RkZGMuLjNhZDk0MTQ5IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1
L2dlbV9tb2NzX3NldHRpbmdzLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5j
CkBAIC0zNjYsMTAgKzM2NiwxNiBAQCBzdGF0aWMgdm9pZCBjaGVja19jb250cm9sX3JlZ2lzdGVy
cyhpbnQgZmQsCiAKIAlnZW1fc2V0X2RvbWFpbihmZCwgZHN0X2hhbmRsZSwgSTkxNV9HRU1fRE9N
QUlOX0NQVSwgMCk7CiAJZm9yIChpbnQgaW5kZXggPSAwOyBpbmRleCA8IHRhYmxlLnNpemU7IGlu
ZGV4KyspIHsKKwkJdWludDMyX3QgdmFsLCByZWFkX3ZhbDsKKwogCQlpZiAoIXRhYmxlLnRhYmxl
W2luZGV4XS51c2VkKQogCQkJY29udGludWU7Ci0JCWlndF9hc3NlcnRfZXFfdTMyKHJlYWRfcmVn
c1tpbmRleF0sCi0JCQkJICB0YWJsZS50YWJsZVtpbmRleF0uY29udHJvbF92YWx1ZSk7CisKKwkJ
cmVhZF92YWwgPSByZWFkX3JlZ3NbaW5kZXhdOworCQl2YWwgPSB0YWJsZS50YWJsZVtpbmRleF0u
Y29udHJvbF92YWx1ZTsKKwkJaWd0X2Fzc2VydF9mKHJlYWRfdmFsID09IHZhbCwKKwkJCSAgICAg
ImVuZ2luZT0ldSBpbmRleD0ldSByZWFkX3ZhbHVlPTB4JTA4eCB2YWx1ZT0weCUwOHhcbiIsCisJ
CQkgICAgIGVuZ2luZSwgaW5kZXgsIHJlYWRfdmFsLCB2YWwpOwogCX0KIAogCW11bm1hcChyZWFk
X3JlZ3MsIDQwOTYpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
