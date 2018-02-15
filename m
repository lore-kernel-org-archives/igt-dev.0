Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9436E485
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2018 12:34:04 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu, 15 Feb 2018 13:33:59 +0100
Message-Id: <20180215123400.52281-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_debugfs: Fix igt_pipe_get_crcs.
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
List-ID: <igt-dev@lists.freedesktop.org>

cmVhZF9jcmMgcmV0dXJucyBhbiBlcnJvciBpbnN0ZWFkIG9mIDAgb24gdGltZW91dCBub3csIHNv
IGhhbmRsZQp0aGlzIGNvcnJlY3RseS4gVGhpcyBpcyBhIHNtYWxsIGVycm9yIGludHJvZHVjZWQg
aW4KCmNvbW1pdCA3ZDQ4YzAyNTJjMzg0ZDE4MzE4ZGU4OWM1NDgxN2JkZmU5YzgzMmZjCkF1dGhv
cjogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
RGF0ZTogICBGcmkgRmViIDIgMTM6MzQ6MjUgMjAxOCArMDEwMAoKICAgIGxpYi9pZ3RfZGVidWdm
czogQWRkIGlndF9waXBlX2NyY19nZXRfc2luZ2xlIGFuZCBpZ3RfcGlwZV9jcmNfZHJhaW4sIHY0
LgoKSXQgY2F1c2VzIHRoZSBrbXNfY2h2X2N1cnNvcl9mYWlsIHRvIHRha2UgMjcgbWludXRlcywg
c28gZml4IHRoaXMuLgoKU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2RlYnVnZnMuYyB8IDUgKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbGliL2lndF9kZWJ1Z2ZzLmMgYi9saWIvaWd0X2RlYnVnZnMuYwppbmRleCBlMmIx
NWY5YmRhMGIuLjRhMTE5OTg1ZjEwMiAxMDA2NDQKLS0tIGEvbGliL2lndF9kZWJ1Z2ZzLmMKKysr
IGIvbGliL2lndF9kZWJ1Z2ZzLmMKQEAgLTc5NCwxMCArNzk0LDExIEBAIGlndF9waXBlX2NyY19n
ZXRfY3JjcyhpZ3RfcGlwZV9jcmNfdCAqcGlwZV9jcmMsIGludCBuX2NyY3MsCiAJCWludCByZXQ7
CiAKIAkJcmV0ID0gcmVhZF9jcmMocGlwZV9jcmMsIGNyYyk7CisJCWlmIChyZXQgPT0gLUVBR0FJ
TikKKwkJCWJyZWFrOworCiAJCWlmIChyZXQgPCAwKQogCQkJY29udGludWU7Ci0JCWlmIChyZXQg
PT0gMCkKLQkJCWJyZWFrOwogCiAJCW4rKzsKIAl9IHdoaWxlIChuIDwgbl9jcmNzKTsKLS0gCjIu
MTYuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
