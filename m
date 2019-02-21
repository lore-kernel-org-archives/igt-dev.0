Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Thu, 21 Feb 2019 22:37:58 +0530
Message-Id: <1550768878-20598-3-git-send-email-anshuman.gupta@intel.com>
In-Reply-To: <1550768878-20598-1-git-send-email-anshuman.gupta@intel.com>
References: <1550768878-20598-1-git-send-email-anshuman.gupta@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/pm_rpm: Enable
 modeset-pc8-residency-stress for ICL and GEN9.
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
To: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

RG8gbm90IGFzc2VydCBmYWlsdXJlIGlmIFBDOCBzdGF0ZSBhY2hpZXZlZCB3aXRoIGRpc3BsYXkg
ZW5hYmxlZC4KClNpZ25lZC1vZmYtYnk6IEFuc2h1bWFuIEd1cHRhIDxhbnNodW1hbi5ndXB0YUBp
bnRlbC5jb20+Ci0tLQogdGVzdHMvcG1fcnBtLmMgfCA5ICsrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9w
bV9ycG0uYyBiL3Rlc3RzL3BtX3JwbS5jCmluZGV4IGM4NGYxOTkuLjg3OGI2M2IgMTAwNjQ0Ci0t
LSBhL3Rlc3RzL3BtX3JwbS5jCisrKyBiL3Rlc3RzL3BtX3JwbS5jCkBAIC04NDYsOCArODQ2LDEz
IEBAIHN0YXRpYyB2b2lkIG1vZGVzZXRfc3VidGVzdChlbnVtIHNjcmVlbl90eXBlIHR5cGUsIGlu
dCByb3VuZHMsIGludCB3YWl0X2ZsYWdzKQogCQlpZ3RfcmVxdWlyZShlbmFibGVfb25lX3NjcmVl
bl93aXRoX3R5cGUoJm1zX2RhdGEsIHR5cGUpKTsKIAkJaWYgKHdhaXRfZmxhZ3MgJiBXQUlUX1NU
QVRVUykKIAkJCWlndF9hc3NlcnQod2FpdF9mb3JfYWN0aXZlKCkpOwotCQlpZiAod2FpdF9mbGFn
cyAmIFdBSVRfUEM4X1JFUykKLQkJCWlndF9hc3NlcnQoIXBjOF9wbHVzX3Jlc2lkZW5jeV9jaGFu
Z2VkKDUpKTsKKwkJaWYgKHdhaXRfZmxhZ3MgJiBXQUlUX1BDOF9SRVMpIHsKKwkJCWlmIChJU19I
QVNXRUxMKG1zX2RhdGEuZGV2aWQpICYmCisJCQkJSVNfQlJPQURXRUxMKG1zX2RhdGEuZGV2aWQp
KQorCQkJCWlndF9hc3NlcnQoIXBjOF9wbHVzX3Jlc2lkZW5jeV9jaGFuZ2VkKDUpKTsKKwkJCWVs
c2UKKwkJCQlpZ3RfYXNzZXJ0KHBjOF9wbHVzX3Jlc2lkZW5jeV9jaGFuZ2VkKDUpKTsKKwkJfQog
CQlpZiAod2FpdF9mbGFncyAmIFdBSVRfRVhUUkEpCiAJCQlzbGVlcCg1KTsKIAl9Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
