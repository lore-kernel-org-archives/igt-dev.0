Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8666EDC7
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 13:10:56 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Fri,  8 Feb 2019 14:10:37 +0100
Message-Id: <20190208131037.22811-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_parallel: Add
 skip_on_simulation to whole binary
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
List-ID: <igt-dev@lists.freedesktop.org>

T24gc2ltdWxhdGlvbiBlbnZpcm9ubWVudCB0aGVzZSB0ZXN0cyB3ZXJlIGZhaWxpbmcuIER1cmlu
ZyBkZWJ1Zwp3ZSBkZWNpZGVkIHRoYXQgd2hvbGUgYmluYXJ5IHNob3VsZCBiZSBza2lwcGVkLCBi
ZWNhdXNlIHRoZXJlIGlzCm5vIGFkZGl0aW9uYWwgY292ZXJhZ2UgaW4gc2ltdWxhdGlvbi4KClNp
Z25lZC1vZmYtYnk6IEthdGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwuY29tPgpDYzog
UmFkb3NsYXcgU3p3aWNodGVuYmVyZyA8cmFkb3NsYXcuc3p3aWNodGVuYmVyZ0BpbnRlbC5jb20+
CkNjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tPgotLS0K
IHRlc3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYWxsZWwuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9leGVjX3BhcmFsbGVs
LmMgYi90ZXN0cy9pOTE1L2dlbV9leGVjX3BhcmFsbGVsLmMKaW5kZXggYTZmYTY5OGUuLmM2YTIw
YzRmIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX3BhcmFsbGVsLmMKKysrIGIvdGVz
dHMvaTkxNS9nZW1fZXhlY19wYXJhbGxlbC5jCkBAIC0yMzgsNiArMjM4LDggQEAgaWd0X21haW4K
IAl9OwogCWludCBmZDsKIAorCWlndF9za2lwX29uX3NpbXVsYXRpb24oKTsKKwogCWlndF9maXh0
dXJlIHsKIAkJZmQgPSBkcm1fb3Blbl9kcml2ZXJfbWFzdGVyKERSSVZFUl9JTlRFTCk7CiAJCWln
dF9yZXF1aXJlX2dlbShmZCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
