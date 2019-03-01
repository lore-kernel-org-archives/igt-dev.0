Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Fri,  1 Mar 2019 10:32:01 +0000
Message-Id: <20190301103202.11778-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] autoconf: Silence void pointer
 arithmetic warnings
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCk1lc29uIGJ1
aWxkIGRvZXMgaXQgc28gbWFrZSB0aGUgdHdvIHN5bW1ldHJpY2FsIGluIHRoaXMgcmVzcGVjdC4K
CnYyOgogKiBEbyBpdCBwcm9wZXJseS4gKENocmlzIFdpbHNvbikKClNpZ25lZC1vZmYtYnk6IFR2
cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0tLQogY29uZmlndXJlLmFj
IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9j
b25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKaW5kZXggNGY1NWVhNWQwZjg5Li5lMjI3MDNkMDMx
OTggMTAwNjQ0Ci0tLSBhL2NvbmZpZ3VyZS5hYworKysgYi9jb25maWd1cmUuYWMKQEAgLTI1Niw2
ICsyNTYsOSBAQCBBQ19BUkdfRU5BQkxFKHdlcnJvciwKIAkJCSAgICAgW0ZhaWwgb24gd2Fybmlu
Z3NdKSwKIAkgICAgICBbXSwgW2VuYWJsZV93ZXJyb3I9bm9dKQogCisjIGRpc2FibGUgIndhcm5p
bmc6IHBvaW50ZXIgb2YgdHlwZSDigJh2b2lkICrigJkgdXNlZCBpbiBhcml0aG1ldGljIgorQVNf
Q09NUElMRVJfRkxBRyhbLVduby1wb2ludGVyLWFyaXRoXSwgW0NXQVJORkxBR1MrPSIgLVduby1w
b2ludGVyLWFyaXRoIl0sIFtdKQorCiBpZiB0ZXN0ICJ4JGVuYWJsZV9kZWJ1ZyIgPSB4eWVzOyB0
aGVuCiAJQVNfQ09NUElMRVJfRkxBRyhbLWczXSwgW0RFQlVHX0NGTEFHUz0iLWczIl0sIFtERUJV
R19DRkxBR1M9Ii1nIl0pCiAJQVNfQ09NUElMRVJfRkxBRyhbLU9nXSwgW0RFQlVHX0NGTEFHUys9
IiAtT2cgLVduby1tYXliZS11bmluaXRpYWxpemVkIl0sICMgZGlzYWJsZSBtYXliZS11bmluaXRp
YWxpemVkIGR1ZSB0byBmYWxzZSBwb3NpdGl2ZXMKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
