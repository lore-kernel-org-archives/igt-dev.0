Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E193B6E82E
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2019 20:36:13 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 25 Jul 2019 13:33:50 -0700
Message-Id: <20190725203354.6757-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/5] i915/gem_mocs_settings: log the engine and
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
CgpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNv
bT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9tb2NzX3NldHRpbmdzLmMgfCA2ICsrKystLQogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
ZXN0cy9pOTE1L2dlbV9tb2NzX3NldHRpbmdzLmMgYi90ZXN0cy9pOTE1L2dlbV9tb2NzX3NldHRp
bmdzLmMKaW5kZXggMWEzMTFiOGMuLjdiMTcxOGY0IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dl
bV9tb2NzX3NldHRpbmdzLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jCkBA
IC0zMjIsOCArMzIyLDEwIEBAIHN0YXRpYyB2b2lkIGNoZWNrX2NvbnRyb2xfcmVnaXN0ZXJzKGlu
dCBmZCwKIAlmb3IgKGludCBpbmRleCA9IDA7IGluZGV4IDwgdGFibGUuc2l6ZTsgaW5kZXgrKykg
ewogCQlpZiAoIXRhYmxlLnRhYmxlW2luZGV4XS51c2VkKQogCQkJY29udGludWU7Ci0JCWlndF9h
c3NlcnRfZXFfdTMyKHJlYWRfcmVnc1tpbmRleF0sCi0JCQkJICB0YWJsZS50YWJsZVtpbmRleF0u
Y29udHJvbF92YWx1ZSk7CisKKwkJaWd0X2Fzc2VydF9mKAorCQkJcmVhZF9yZWdzW2luZGV4XSA9
PSB0YWJsZS50YWJsZVtpbmRleF0uY29udHJvbF92YWx1ZSwKKwkJCSJlbmdpbmU9JXUgaW5kZXg9
JXUiLCBlbmdpbmUsIGluZGV4KTsKIAl9CiAKIAltdW5tYXAocmVhZF9yZWdzLCA0MDk2KTsKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
