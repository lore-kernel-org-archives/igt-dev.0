Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4909C6F98F
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 13:47:20 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 26 Jul 2021 15:45:53 +0200
Message-Id: <20210726134616.49873-30-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210726134616.49873-1-zbigniew.kempczynski@intel.com>
References: <20210726134616.49873-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 29/52] tests/gem_mmap_wc: Adopt to use
 allocator
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

Rm9yIG5ld2VyIGdlbnMgd2UncmUgbm90IGFibGUgdG8gcmVseSBvbiByZWxvY2F0aW9ucy4gQWRv
cHQgdG8gdXNlCm9mZnNldHMgYWNxdWlyZWQgZnJvbSB0aGUgYWxsb2NhdG9yLgoKU2lnbmVkLW9m
Zi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5j
b20+CkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IEFzaHV0
b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1f
bW1hcF93Yy5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fbW1hcF93Yy5jIGIvdGVzdHMv
aTkxNS9nZW1fbW1hcF93Yy5jCmluZGV4IGFiYjg5YjhlYi4uNmRjN2JhZTQ5IDEwMDY0NAotLS0g
YS90ZXN0cy9pOTE1L2dlbV9tbWFwX3djLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fbW1hcF93Yy5j
CkBAIC00NTksOCArNDU5LDkgQEAgdGVzdF9wZl9ub25ibG9jayhpbnQgaTkxNSkKIHsKIAlpZ3Rf
c3Bpbl90ICpzcGluOwogCXVpbnQzMl90ICpwdHI7CisJdWludDY0X3QgYWhuZCA9IGdldF9yZWxv
Y19haG5kKGk5MTUsIDApOwogCi0Jc3BpbiA9IGlndF9zcGluX25ldyhpOTE1KTsKKwlzcGluID0g
aWd0X3NwaW5fbmV3KGk5MTUsIC5haG5kID0gYWhuZCk7CiAKIAlpZ3Rfc2V0X3RpbWVvdXQoMSwg
ImluaXRpYWwgcGFnZWZhdWx0aW5nIGRpZCBub3QgY29tcGxldGUgd2l0aGluIDFzIik7CiAKQEAg
LTQ3MSw2ICs0NzIsNyBAQCB0ZXN0X3BmX25vbmJsb2NrKGludCBpOTE1KQogCWlndF9yZXNldF90
aW1lb3V0KCk7CiAKIAlpZ3Rfc3Bpbl9mcmVlKGk5MTUsIHNwaW4pOworCXB1dF9haG5kKGFobmQp
OwogfQogCiBzdGF0aWMgaW50IG1tYXBfaW9jdGwoaW50IGk5MTUsIHN0cnVjdCBkcm1faTkxNV9n
ZW1fbW1hcCAqYXJnKQotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
