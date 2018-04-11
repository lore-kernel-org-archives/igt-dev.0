Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BDF6E355
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Apr 2018 02:37:59 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 10 Apr 2018 19:37:22 -0700
Message-Id: <20180411023732.32362-10-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 10/20] tests/psr: Remove delay between dpms
 toggle.
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Tm8gcmVhc29uIGZvciB0aGUgZGVsYXkgYmV0d2VlbiBkcG1zIG9mZiBhbmQgb24uCgpTaWduZWQt
b2ZmLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNv
bT4KLS0tCiB0ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jIGIvdGVz
dHMva21zX3Bzcl9zaW5rX2NyYy5jCmluZGV4IGQ5NDBlYzg5Li4xNzQ5MDcyNiAxMDA2NDQKLS0t
IGEvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jCisrKyBiL3Rlc3RzL2ttc19wc3Jfc2lua19jcmMu
YwpAQCAtNDI4LDcgKzQyOCw2IEBAIHN0YXRpYyB2b2lkIGRwbXNfb2ZmX29uKGRhdGFfdCBkYXRh
KQogewogCWttc3Rlc3Rfc2V0X2Nvbm5lY3Rvcl9kcG1zKGRhdGEuZHJtX2ZkLCBkYXRhLm91dHB1
dC0+Y29uZmlnLmNvbm5lY3RvciwKIAkJCQkgICBEUk1fTU9ERV9EUE1TX09GRik7Ci0Jc2xlZXAo
MSk7CiAJa21zdGVzdF9zZXRfY29ubmVjdG9yX2RwbXMoZGF0YS5kcm1fZmQsIGRhdGEub3V0cHV0
LT5jb25maWcuY29ubmVjdG9yLAogCQkJCSAgIERSTV9NT0RFX0RQTVNfT04pOwogfQotLSAKMi4x
NC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
