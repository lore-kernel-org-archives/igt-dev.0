Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DEA89F71
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2019 09:34:36 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 16 Aug 2019 12:34:19 +0300
Message-Id: <20190816093426.10644-4-petri.latvala@intel.com>
In-Reply-To: <20190816093426.10644-1-petri.latvala@intel.com>
References: <20190816093426.10644-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 03/10] lib/tests: Test that igt_describe
 works with dynamic subtests
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0t
LQogbGliL3Rlc3RzL2lndF9kZXNjcmliZS5jIHwgMTIgKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi90
ZXN0cy9pZ3RfZGVzY3JpYmUuYyBiL2xpYi90ZXN0cy9pZ3RfZGVzY3JpYmUuYwppbmRleCAyZWE0
N2U5ZC4uNzBlYzA1NWUgMTAwNjQ0Ci0tLSBhL2xpYi90ZXN0cy9pZ3RfZGVzY3JpYmUuYworKysg
Yi9saWIvdGVzdHMvaWd0X2Rlc2NyaWJlLmMKQEAgLTg3LDYgKzg3LDEzIEBAIHN0YXRpYyB2b2lk
IGZha2VfbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpIHsKIAlpZ3Rfc3VidGVzdCgiRiIpCiAJ
CTsKIAorCWlndF9kZXNjcmliZSgiRHluYW1pYyBjb250YWluZXIiKTsKKwlpZ3RfZHluYW1pY19z
dWJ0ZXN0X2NvbnRhaW5lcigiRyIpIHsKKwkJcHJpbnRmKCJzaG91bGQgbm90IGJlIGV4ZWN1dGVk
IVxuIik7CisJCWlndF9keW5hbWljX3N1YnRlc3QoInNob3VsZC1ub3QtbGlzdCIpCisJCQlwcmlu
dGYoInNob3VsZCBub3QgYmUgZXhlY3V0ZWQhXG4iKTsKKwl9CisKIAlpZ3RfZXhpdCgpOwogfQog
CkBAIC0xMjksNyArMTM2LDEwIEBAIHN0YXRpYyBjb25zdCBjaGFyIERFU0NSSUJFX0FMTF9PVVRQ
VVRbXSA9IFwKIAkiXG4iCiAJIlNVQiBGIC4uL2xpYi90ZXN0cy9pZ3RfZGVzY3JpYmUuYzo4Nzpc
biIKIAkiICB2ZXJ5bG9uZ3dvcmR0aGF0c2hvdWRsYmVwcmludGVkZXZlbnRob3VnaGl0c3Bhc3R0
aGV3cnBwaW5nbGltaXR2ZXJ5bG9uZ3dvcmR0aGF0c2hvdWRsYmVwcmludGVkZXZlbnRob3VnaGl0
c3Bhc3R0aGV3cmFwcGluZ2xpbWl0XG4iCi0JIiAgdmVyeWxvbmd3b3JkdGhhdHNob3VkbGJlcHJp
bnRlZGV2ZW50aG91Z2hpdHNwYXN0dGhld3JhcHBpbmdsaW1pdHZlcnlsb25nd29yZHRoYXRzaG91
ZGxiZXByaW50ZWRldmVudGhvdWdoaXRzcGFzdHRoZXdyYXBwaW5nbGltaXRcblxuIjsKKwkiICB2
ZXJ5bG9uZ3dvcmR0aGF0c2hvdWRsYmVwcmludGVkZXZlbnRob3VnaGl0c3Bhc3R0aGV3cmFwcGlu
Z2xpbWl0dmVyeWxvbmd3b3JkdGhhdHNob3VkbGJlcHJpbnRlZGV2ZW50aG91Z2hpdHNwYXN0dGhl
d3JhcHBpbmdsaW1pdFxuIgorCSJcbiIKKwkiU1VCIEcgLi4vbGliL3Rlc3RzL2lndF9kZXNjcmli
ZS5jOjkxOlxuIgorCSIgIER5bmFtaWMgY29udGFpbmVyXG5cbiI7CiAKIHN0YXRpYyBjb25zdCBj
aGFyIEpVU1RfQ19PVVRQVVRbXSA9IFwKIAkidGhlIHRvcCBsZXZlbCBkZXNjcmlwdGlvblxuIgot
LSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
