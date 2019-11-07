Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885596E42F
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2019 11:28:11 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu,  7 Nov 2019 13:28:03 +0200
Message-Id: <20191107112803.9384-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] gem_blits: Build the same way with
 autotools as with meson
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

U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CkZp
eGVzOiA5OWYwNGIxNGUyMjQgKCJpZ3Q6IEFub3RoZXIgY29tYmluYXRvcmlhbCBleGVyY2lzZSBm
b3IgYmxpdHMiKQpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0t
LQogdGVzdHMvTWFrZWZpbGUuc291cmNlcyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2VmaWxlLnNv
dXJjZXMgYi90ZXN0cy9NYWtlZmlsZS5zb3VyY2VzCmluZGV4IGY2MzYwMmVmLi5hYmYxZTJmYyAx
MDA2NDQKLS0tIGEvdGVzdHMvTWFrZWZpbGUuc291cmNlcworKysgYi90ZXN0cy9NYWtlZmlsZS5z
b3VyY2VzCkBAIC0yNCw3ICsyNCw2IEBAIFRFU1RTX3Byb2dzID0gXAogCWRybV9pbXBvcnRfZXhw
b3J0IFwKIAlkcm1fbW0gXAogCWRybV9yZWFkIFwKLQlpOTE1L2dlbV9ibGl0cyBcCiAJa21zXzNk
IFwKIAlrbXNfYWRkZmJfYmFzaWMgXAogCWttc19hdG9taWMgXApAQCAtMTA3LDYgKzEwNiw5IEBA
IGdlbV9iYWRfcmVsb2NfU09VUkNFUyA9IGk5MTUvZ2VtX2JhZF9yZWxvYy5jCiBURVNUU19wcm9n
cyArPSBnZW1fYmFzaWMKIGdlbV9iYXNpY19TT1VSQ0VTID0gaTkxNS9nZW1fYmFzaWMuYwogCitU
RVNUU19wcm9ncyArPSBnZW1fYmxpdHMKK2dlbV9ibGl0c19TT1VSQ0VTID0gaTkxNS9nZW1fYmxp
dHMuYworCiBURVNUU19wcm9ncyArPSBnZW1fYnVzeQogZ2VtX2J1c3lfU09VUkNFUyA9IGk5MTUv
Z2VtX2J1c3kuYwogCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
