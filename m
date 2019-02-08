Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B024E6EDDD
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 13:35:52 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id E63653A8B88
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 14:19:42 +0100 (CET)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Fri,  8 Feb 2019 14:18:56 +0100
Message-Id: <20190208131901.1400-6-maxime.ripard@bootlin.com>
In-Reply-To: <20190208131901.1400-1-maxime.ripard@bootlin.com>
References: <20190208131901.1400-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 05/10] igt: fb: Clear YUV dumb buffers
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
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

WVVWIGR1bWIgYnVmZmVycywganVzdCBsaWtlIGk5MTUgR0VNIGJ1ZmZlcnMgYWxzbyBuZWVkIHRv
IGJlIGNsZWFyZWQgb25jZQphbGxvY2F0ZWQuIE1ha2Ugc3VyZSBpdCBoYXBwZW5zLgoKUmV2aWV3
ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBQYXVsIEtv
Y2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYtYnk6
IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQogbGliL2lndF9m
Yi5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0X2ZiLmMKaW5kZXggZGVhMzkwYjA2MmRlLi42ZmUwZDA4
NDdhZWYgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZmIuYworKysgYi9saWIvaWd0X2ZiLmMKQEAgLTU5
Niw2ICs1OTYsOSBAQCBzdGF0aWMgaW50IGNyZWF0ZV9ib19mb3JfZmIoc3RydWN0IGlndF9mYiAq
ZmIpCiAJZmItPmdlbV9oYW5kbGUgPSBrbXN0ZXN0X2R1bWJfY3JlYXRlKGZkLCBmYi0+d2lkdGgs
IGZiLT5oZWlnaHQsCiAJCQkJCSAgICAgYnBwLCBzdHJpZGVzLCAmZmItPnNpemUpOwogCisJaWYg
KGlndF9mb3JtYXRfaXNfeXV2KGZiLT5kcm1fZm9ybWF0KSkKKwkJY2xlYXJfeXV2X2J1ZmZlcihm
Yik7CisKIAlyZXR1cm4gZmItPmdlbV9oYW5kbGU7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
