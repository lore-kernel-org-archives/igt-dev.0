Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Wed, 22 May 2019 16:04:13 +0100
Message-Id: <20190522150413.27697-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/i915: Fix pointer cast build issue
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClVzZSBmcm9t
X3VzZXJfcG9pbnRlciB3aGVuIGNhc3RpbmcgX191NjQgdG8gYSBwb2ludGVyLgoKU2lnbmVkLW9m
Zi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KQ2M6IEFuZGkg
U2h5dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgotLS0KIGxpYi9pOTE1L2dlbV9lbmdpbmVfdG9w
b2xvZ3kuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pOTE1L2dlbV9lbmdpbmVfdG9wb2xvZ3kuYyBiL2xpYi9p
OTE1L2dlbV9lbmdpbmVfdG9wb2xvZ3kuYwppbmRleCBkZDI2ZmFlMDA4NTMuLjdjYTM2MTY2ODdi
OSAxMDA2NDQKLS0tIGEvbGliL2k5MTUvZ2VtX2VuZ2luZV90b3BvbG9neS5jCisrKyBiL2xpYi9p
OTE1L2dlbV9lbmdpbmVfdG9wb2xvZ3kuYwpAQCAtODEsNyArODEsNyBAQCBzdGF0aWMgdm9pZCBj
dHhfbWFwX2VuZ2luZXMoaW50IGZkLCBzdHJ1Y3QgaW50ZWxfZW5naW5lX2RhdGEgKmVkLAogCQkJ
ICAgIHN0cnVjdCBkcm1faTkxNV9nZW1fY29udGV4dF9wYXJhbSAqcGFyYW0pCiB7CiAJc3RydWN0
IGk5MTVfY29udGV4dF9wYXJhbV9lbmdpbmVzICplbmdpbmVzID0KLQkJCShzdHJ1Y3QgaTkxNV9j
b250ZXh0X3BhcmFtX2VuZ2luZXMgKikgcGFyYW0tPnZhbHVlOworCQkJZnJvbV91c2VyX3BvaW50
ZXIocGFyYW0tPnZhbHVlKTsKIAlpbnQgaSA9IDA7CiAKIAlmb3IgKHR5cGVvZihlbmdpbmVzLT5l
bmdpbmVzWzBdKSAqcCA9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldg==
