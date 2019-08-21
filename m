Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8530F8907C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2019 13:09:32 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
Date: Wed, 21 Aug 2019 16:09:28 +0300
Message-Id: <20190821130928.29640-1-jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tools/intel_reg: fix use-after-free bug in
 register spec read
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
Cc: jani.nikula@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

ZSBwb2ludHMgaW50byB0aGUgYnVmZmVyIHBvaW50ZXIgdG8gYnkgcC4KCkZpeGVzOiBkZmRhMGI2
YWVjY2UgKCJpbnRlbF9yZWc6IGludHJvZHVjZSBvbmUgaW50ZWxfcmVnIHRvb2wgdG8gcnVsZSB0
aGVtIGFsbCIpClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5j
b20+Ci0tLQogdG9vbHMvaW50ZWxfcmVnX3NwZWMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2ludGVsX3Jl
Z19zcGVjLmMgYi90b29scy9pbnRlbF9yZWdfc3BlYy5jCmluZGV4IDBkZjY5YjY4ODRkZS4uNWFi
NTZlYzFhMzFmIDEwMDY0NAotLS0gYS90b29scy9pbnRlbF9yZWdfc3BlYy5jCisrKyBiL3Rvb2xz
L2ludGVsX3JlZ19zcGVjLmMKQEAgLTIzMyw5ICsyMzMsOSBAQCBzdGF0aWMgaW50IHBhcnNlX2xp
bmUoc3RydWN0IHJlZyAqcmVnLCBjb25zdCBjaGFyICpsaW5lKQogCQkJcmVnLT5uYW1lID0gcDsK
IAkJfSBlbHNlIGlmIChpID09IDIpIHsKIAkJCXJlZy0+YWRkciA9IHN0cnRvdWwocCwgJmUsIDE2
KTsKLQkJCWZyZWUocCk7CiAJCQlpZiAoKmUpCiAJCQkJcmV0ID0gLTE7CisJCQlmcmVlKHApOwog
CQl9IGVsc2UgaWYgKGkgPT0gMykgewogCQkJcmV0ID0gcGFyc2VfcG9ydF9kZXNjKHJlZywgcCk7
CiAJCQlmcmVlKHApOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
