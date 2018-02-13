Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 13 Feb 2018 16:05:04 +0000
Message-Id: <20180213160504.10929-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH igt] igt/perf_pmu: Skip hotplugging cpu0
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SXQgaXMgYSBrbm93biBpc3N1ZSB0aGF0IHNvbWUgImNvbW1vZGl0eSIgbWFjaGluZXMgZmFpbCB3
aGVuIGFza2VkIHRvCmhvdHBsdWcgQ1BVMCwgc28gZG9uJ3QuCgpTaWduZWQtb2ZmLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IFR2cnRrbyBVcnN1bGluIDx0
dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0tClR2cnRrbywgaXMgaXQganVzdCB0aGlzIHNpbXBs
ZT8gT3IgZG8gd2UgbmVlZCB0byBhdm9pZCB0aGUgcGh5c2ljYWwKcGFja2FnZT8KLUNocmlzCi0t
LQogdGVzdHMvcGVyZl9wbXUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3BlcmZfcG11LmMgYi90ZXN0cy9w
ZXJmX3BtdS5jCmluZGV4IGE3NTAxY2E1Li5lOWNlMjg4MSAxMDA2NDQKLS0tIGEvdGVzdHMvcGVy
Zl9wbXUuYworKysgYi90ZXN0cy9wZXJmX3BtdS5jCkBAIC05ODIsNyArOTgyLDcgQEAgc3RhdGlj
IHZvaWQgY3B1X2hvdHBsdWcoaW50IGdlbV9mZCkKIAkgKiB0aGlzIGhhcyBub3QgYWZmZWN0ZWQg
YnVzeW5lc3Mgc3RhdHMgaW4gdGhlIHBhcmVudC4KIAkgKi8KIAlpZ3RfZm9yayhjaGlsZCwgMSkg
ewotCQlpbnQgY3B1ID0gMDsKKwkJaW50IGNwdSA9IDE7CiAKIAkJY2xvc2UobGlua1swXSk7CiAK
LS0gCjIuMTYuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
