Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E776E274
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Mar 2018 10:20:10 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 12 Mar 2018 11:20:06 +0100
Message-Id: <20180312102006.62249-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/gem_fd_exhaustion: Fix build failure
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
To: igt-dev@lists.freedesktop.org
Cc: Karol Krol <karol.krol@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBicmVha3MgaWd0IGJ1aWxkIHJlYWxseSBiYWRseS4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBLYXJv
bCBLcm9sIDxrYXJvbC5rcm9sQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9nZW1fZmRfZXhoYXVzdGlv
bi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvdGVzdHMvZ2VtX2ZkX2V4aGF1c3Rpb24uYyBiL3Rlc3RzL2dlbV9mZF9l
eGhhdXN0aW9uLmMKaW5kZXggZDA0Y2RkMDlkZmQ5Li41NTk1OTBiMTRkOTAgMTAwNjQ0Ci0tLSBh
L3Rlc3RzL2dlbV9mZF9leGhhdXN0aW9uLmMKKysrIGIvdGVzdHMvZ2VtX2ZkX2V4aGF1c3Rpb24u
YwpAQCAtODAsNyArODAsNyBAQCBzdGF0aWMgYm9vbCBhbGxvd191bmxpbWl0ZWRfZmlsZXModm9p
ZCkKIAlyZXR1cm4gc2V0cmxpbWl0KFJMSU1JVF9OT0ZJTEUsICZybGltKSA9PSAwOwogfQogCi1z
dGF0aWMgdm9pZCByZXN0b3JlX29yaWdpbmFsX3N5c2N0bCh2b2lkKQorc3RhdGljIHZvaWQgcmVz
dG9yZV9vcmlnaW5hbF9zeXNjdGwoaW50IHNpZykKIHsKIAlpZiAob3JpZ2luYWxfbnJfb3BlbiA+
IDApCiAJCXdyaXRlX3N5c2N0bCgiL3Byb2Mvc3lzL2ZzL25yX29wZW4iLCBvcmlnaW5hbF9ucl9v
cGVuKTsKLS0gCjIuMTYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
