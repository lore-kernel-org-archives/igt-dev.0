Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEBE6EFD1
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:03 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:38 +0200
Message-Id: <20190116112050.27647-10-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 09/21] lib/igt_kms: Make igt_display_init
 require at least one plane
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
Cc: Robert Foss <robert.foss@collabora.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Tm90IG9ubHkgd2lsbCB0aGUgZm9sbG93aW5nIGNhbGxvYyBjYWxsIGVuZCB1cCBhbGxvY2F0aW5n
IDAgYnl0ZXMKKHVuZGVmaW5lZCBiZWhhdmlvdXIpLCBidXQgbGFzdF9wbGFuZSBiZWNvbWVzICh1
aW50OF90KS0xLgoKU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBp
bnRlbC5jb20+CkNjOiBSb2JlcnQgRm9zcyA8cm9iZXJ0LmZvc3NAY29sbGFib3JhLmNvbT4KQ2M6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Ci0t
LQogbGliL2lndF9rbXMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9saWIvaWd0X2ttcy5j
CmluZGV4IGY5MjZlYWZiLi5iMDZhY2IyYiAxMDA2NDQKLS0tIGEvbGliL2lndF9rbXMuYworKysg
Yi9saWIvaWd0X2ttcy5jCkBAIC0xOTMyLDcgKzE5MzIsNyBAQCB2b2lkIGlndF9kaXNwbGF5X3Jl
cXVpcmUoaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSwgaW50IGRybV9mZCkKIAkJCWRybU1vZGVGcmVl
UGxhbmUoZHJtX3BsYW5lKTsKIAkJfQogCi0JCWlndF9hc3NlcnRfbHRlKDAsIG5fcGxhbmVzKTsK
KwkJaWd0X2Fzc2VydF9sdCgwLCBuX3BsYW5lcyk7CiAJCXBpcGUtPnBsYW5lcyA9IGNhbGxvYyhz
aXplb2YoaWd0X3BsYW5lX3QpLCBuX3BsYW5lcyk7CiAJCWlndF9hc3NlcnRfZihwaXBlLT5wbGFu
ZXMsICJGYWlsZWQgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciAlZCBwbGFuZXNcbiIsIG5fcGxhbmVz
KTsKIAkJbGFzdF9wbGFuZSA9IG5fcGxhbmVzIC0gMTsKLS0gCjIuMTkuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
