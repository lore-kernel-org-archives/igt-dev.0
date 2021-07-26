Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BE56FD0B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 13:47:28 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 26 Jul 2021 15:46:01 +0200
Message-Id: <20210726134616.49873-38-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210726134616.49873-1-zbigniew.kempczynski@intel.com>
References: <20210726134616.49873-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 37/52] tests/gem_wait: Adopt to use
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
d2FpdC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS90ZXN0cy9pOTE1L2dlbV93YWl0LmMgYi90ZXN0cy9pOTE1L2dlbV93YWl0LmMKaW5kZXgg
ZDU2NzA3ZWRhLi4wZDFmZWE5OTYgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX3dhaXQuYwor
KysgYi90ZXN0cy9pOTE1L2dlbV93YWl0LmMKQEAgLTc4LDExICs3OCwxMyBAQCBzdGF0aWMgdm9p
ZCBpbnZhbGlkX2J1ZihpbnQgZmQpCiBzdGF0aWMgdm9pZCBiYXNpYyhpbnQgZmQsIGNvbnN0IGlu
dGVsX2N0eF90ICpjdHgsIHVuc2lnbmVkIGVuZ2luZSwKIAkJICB1bnNpZ25lZCBmbGFncykKIHsK
Kwl1aW50NjRfdCBhaG5kID0gZ2V0X3JlbG9jX2FobmQoZmQsIGN0eC0+aWQpOwogCUlHVF9DT1JL
X0hBTkRMRShjb3JrKTsKIAl1aW50MzJfdCBwbHVnID0KIAkJZmxhZ3MgJiAoV1JJVEUgfCBBV0FJ
VCkgPyBpZ3RfY29ya19wbHVnKCZjb3JrLCBmZCkgOiAwOwogCWlndF9zcGluX3QgKnNwaW4gPQog
CQlpZ3Rfc3Bpbl9uZXcoZmQsCisJCQkgICAgIC5haG5kID0gYWhuZCwKIAkJCSAgICAgLmN0eCA9
IGN0eCwKIAkJCSAgICAgLmVuZ2luZSA9IGVuZ2luZSwKIAkJCSAgICAgLmRlcGVuZGVuY3kgPSBw
bHVnLApAQCAtMTQ3LDYgKzE0OSw3IEBAIHN0YXRpYyB2b2lkIGJhc2ljKGludCBmZCwgY29uc3Qg
aW50ZWxfY3R4X3QgKmN0eCwgdW5zaWduZWQgZW5naW5lLAogCWlmIChwbHVnKQogCQlnZW1fY2xv
c2UoZmQsIHBsdWcpOwogCWlndF9zcGluX2ZyZWUoZmQsIHNwaW4pOworCXB1dF9haG5kKGFobmQp
OwogfQogCiBzdGF0aWMgdm9pZCB0ZXN0X2FsbF9lbmdpbmVzKGNvbnN0IGNoYXIgKm5hbWUsIGlu
dCBpOTE1LCBjb25zdCBpbnRlbF9jdHhfdCAqY3R4LAotLSAKMi4yNi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
