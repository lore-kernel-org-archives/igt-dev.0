Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 28 Feb 2019 14:18:24 +0000
Message-Id: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/5] lib/i915: Assert mmap size alignment
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCm1tYXAoMikg
bWFuZGF0ZXMgc2l6ZSBpcyBwYWdlIGFsaWduZWQgc28gY2hlY2sgdGhpcyBpbiBvdXIgd3JhcHBl
cnMuCgpTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwu
Y29tPgotLS0KIGxpYi9pOTE1L2dlbV9tbWFuLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaTkxNS9nZW1fbW1hbi5jIGIvbGliL2k5
MTUvZ2VtX21tYW4uYwppbmRleCAzY2Y5YTZiYmRiMzEuLjA4NGRiYjNiMzY3OCAxMDA2NDQKLS0t
IGEvbGliL2k5MTUvZ2VtX21tYW4uYworKysgYi9saWIvaTkxNS9nZW1fbW1hbi5jCkBAIC01Nyw2
ICs1Nyw4IEBAIHZvaWQgKl9fZ2VtX21tYXBfX2d0dChpbnQgZmQsIHVpbnQzMl90IGhhbmRsZSwg
dWludDY0X3Qgc2l6ZSwgdW5zaWduZWQgcHJvdCkKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX21tYXBf
Z3R0IG1tYXBfYXJnOwogCXZvaWQgKnB0cjsKIAorCWlndF9hc3NlcnQoIShzaXplICYgNDA5NSkp
OworCiAJbWVtc2V0KCZtbWFwX2FyZywgMCwgc2l6ZW9mKG1tYXBfYXJnKSk7CiAJbW1hcF9hcmcu
aGFuZGxlID0gaGFuZGxlOwogCWlmIChpZ3RfaW9jdGwoZmQsIERSTV9JT0NUTF9JOTE1X0dFTV9N
TUFQX0dUVCwgJm1tYXBfYXJnKSkKQEAgLTE2Miw2ICsxNjQsOCBAQCBzdGF0aWMgdm9pZAogewog
CXN0cnVjdCBkcm1faTkxNV9nZW1fbW1hcCBhcmc7CiAKKwlpZ3RfYXNzZXJ0KCEoc2l6ZSAmIDQw
OTUpKTsKKwogCW1lbXNldCgmYXJnLCAwLCBzaXplb2YoYXJnKSk7CiAJYXJnLmhhbmRsZSA9IGhh
bmRsZTsKIAlhcmcub2Zmc2V0ID0gb2Zmc2V0OwotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
