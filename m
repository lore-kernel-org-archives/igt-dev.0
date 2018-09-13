Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361076E1FB
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Sep 2018 23:40:35 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Thu, 13 Sep 2018 16:40:17 -0700
Message-Id: <20180913234018.31478-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 1/2] lib: Require drmModeResources()
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

RnJvbTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpJZiBtb2Rlc2V0
dGluZyBpcyBub3Qgc3VwcG9ydGVkLCB0aGUgZHJtTW9kZUdldFJlc291cmNlcygpIGNhbGwgd2ls
bApmYWlsIHdpdGggLUVJTlZBTCAob3IgLUVOT1RTVVBQKS4gQXMgbm8gZGlzcGxheXMgYXJlIGNv
bm5lY3RlZCwgc2tpcC4KClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3Nl
LnNvdXphQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Ci0tLQogbGliL2lndF9rbXMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21z
LmMgYi9saWIvaWd0X2ttcy5jCmluZGV4IDQ1NjNiZmQ5Li5jMjBjZjFlYiAxMDA2NDQKLS0tIGEv
bGliL2lndF9rbXMuYworKysgYi9saWIvaWd0X2ttcy5jCkBAIC0xODU3LDcgKzE4NTcsNyBAQCB2
b2lkIGlndF9kaXNwbGF5X2luaXQoaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSwgaW50IGRybV9mZCkK
IAlkaXNwbGF5LT5kcm1fZmQgPSBkcm1fZmQ7CiAKIAlyZXNvdXJjZXMgPSBkcm1Nb2RlR2V0UmVz
b3VyY2VzKGRpc3BsYXktPmRybV9mZCk7Ci0JaWd0X2Fzc2VydChyZXNvdXJjZXMpOworCWlndF9y
ZXF1aXJlKHJlc291cmNlcyk7CiAKIAkvKgogCSAqIFdlIGNhY2hlIHRoZSBudW1iZXIgb2YgcGlw
ZXMsIHRoYXQgbnVtYmVyIGlzIGEgcGh5c2ljYWwgbGltaXQgb2YgdGhlCi0tIAoyLjE5LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
