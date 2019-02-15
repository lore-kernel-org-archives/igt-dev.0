Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810046E058
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 00:40:44 +0000 (UTC)
Date: Thu, 14 Feb 2019 16:40:42 -0800
Message-Id: <20190215004043.21500-2-stuart.summers@intel.com>
In-Reply-To: <20190215004043.21500-1-stuart.summers@intel.com>
References: <20190215004043.21500-1-stuart.summers@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/kms_chamelium: Require gen < 9 for
 VGA testing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: Stuart Summers via igt-dev <igt-dev@lists.freedesktop.org>
Reply-To: Stuart Summers <stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogU3R1YXJ0IFN1bW1lcnMgPGpzc3VtbWVyQGpzc3VtbWVyLWRlc2sxLmFtci5jb3JwLmlu
dGVsLmNvbT4KClZHQSBub3Qgc3VwcG9ydGVkIG9uIGdlbiA5IGFuZCBhYm92ZS4gQWRkIGFuIGV4
cGxpY2l0IHJlcXVpcmVtZW50CnRvIHNraXAgVkdBIHRlc3RzIHRvIGEgQ2hhbWVsaXVtIG9uIGxh
dGVyIGdlbnMuCgpTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNA
aW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19jaGFtZWxpdW0uYyB8IDIgKysKIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY2hhbWVsaXVtLmMg
Yi90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKaW5kZXggNjRmODdkM2FlLi5hYjg5YzVkNDcgMTAwNjQ0
Ci0tLSBhL3Rlc3RzL2ttc19jaGFtZWxpdW0uYworKysgYi90ZXN0cy9rbXNfY2hhbWVsaXVtLmMK
QEAgLTEwMTUsNiArMTAxNSw4IEBAIGlndF9tYWluCiAKIAlpZ3Rfc3VidGVzdF9ncm91cCB7CiAJ
CWlndF9maXh0dXJlIHsKKwkJCWludCBnZW4gPSBpbnRlbF9nZW4oaW50ZWxfZ2V0X2RybV9kZXZp
ZChkYXRhLmRybV9mZCkpOworCQkJaWd0X3JlcXVpcmVfZihnZW4gPCA5LCAiVkdBIG5vdCBzdXBw
b3J0ZWRcbiIpOwogCQkJcmVxdWlyZV9jb25uZWN0b3JfcHJlc2VudCgKIAkJCSAgICAmZGF0YSwg
RFJNX01PREVfQ09OTkVDVE9SX1ZHQSk7CiAJCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
