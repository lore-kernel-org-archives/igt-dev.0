Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 27 Jun 2019 13:55:21 +0100
Message-Id: <20190627125521.10782-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Silence Valgrind warning in
 synce_fence_status
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkxldCBWYWxn
cmluZCBrbm93IHRoZSBpb2N0bCBpbml0aWFsaXplcyB0aGUgcGFzc2VkIGluIGluZm8gYmxvY2sg
dG8gcmVkdWNlCnRoZSBub2lzZSB3aGlsZSBkZWJ1Z2dpbmcuCgpTaWduZWQtb2ZmLWJ5OiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIGxpYi9zd19zeW5jLmMg
fCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9saWIvc3dfc3luYy5jIGIvbGliL3N3X3N5bmMuYwppbmRleCBmMjA4NjAzMzEyYzIu
LjczZjNmNzAxNWQ5ZCAxMDA2NDQKLS0tIGEvbGliL3N3X3N5bmMuYworKysgYi9saWIvc3dfc3lu
Yy5jCkBAIC00MSw2ICs0MSwxNSBAQAogI2luY2x1ZGUgImRybXRlc3QuaCIKICNpbmNsdWRlICJp
b2N0bF93cmFwcGVycy5oIgogCisjaWZkZWYgSEFWRV9WQUxHUklORAorI2luY2x1ZGUgPHZhbGdy
aW5kL3ZhbGdyaW5kLmg+CisjaW5jbHVkZSA8dmFsZ3JpbmQvbWVtY2hlY2suaD4KKworI2RlZmlu
ZSBWRyh4KSB4CisjZWxzZQorI2RlZmluZSBWRyh4KSBkbyB7fSB3aGlsZSAoMCkKKyNlbmRpZgor
CiAvKioKICAqIFNFQ1RJT046c3dfc3luYwogICogQHNob3J0X2Rlc2NyaXB0aW9uOiBTb2Z0d2Fy
ZSBzeW5jIChmZW5jaW5nKSBzdXBwb3J0IGxpYnJhcnkKQEAgLTIxOCw2ICsyMjcsOCBAQCBpbnQg
c3luY19mZW5jZV9zdGF0dXMoaW50IGZlbmNlKQogCWlmIChmaWxlX2luZm8ubnVtX2ZlbmNlcyAh
PSAxKQogCQlyZXR1cm4gLUVJTlZBTDsKIAorCVZHKFZBTEdSSU5EX01BS0VfTUVNX0RFRklORUQo
JmZlbmNlX2luZm8sIHNpemVvZihmZW5jZV9pbmZvKSkpOworCiAJcmV0dXJuIGZlbmNlX2luZm8u
c3RhdHVzOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
