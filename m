Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id C93426EF8A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jan 2019 15:20:03 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue,  8 Jan 2019 16:19:48 +0100
Message-Id: <20190108152001.5367-2-maxime.ripard@bootlin.com>
In-Reply-To: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
References: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 02/13] igt: fb: Reduce tile size
 alignment for non intel platforms
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

QWxpZ25pbmcgdGhlIHdpZHRoIG9uIDY0IHBpeGVscyBvbmx5IG1ha2Ugc2Vuc2Ugb24gaW50ZWwg
cGxhdGZvcm1zLCBtYWtlCnN1cmUgdG8gYWRkIGEgY2hlY2sgYWdhaW5zdCB0aGlzLgoKU2lnbmVk
LW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0tCiBs
aWIvaWd0X2ZiLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwpp
bmRleCAwMGRiMmVlNTdjYWQuLjZhYjRlMzAzOTE2NiAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5j
CisrKyBiL2xpYi9pZ3RfZmIuYwpAQCAtMjA0LDcgKzIwNCwxMSBAQCB2b2lkIGlndF9nZXRfZmJf
dGlsZV9zaXplKGludCBmZCwgdWludDY0X3QgdGlsaW5nLCBpbnQgZmJfYnBwLAogewogCXN3aXRj
aCAodGlsaW5nKSB7CiAJY2FzZSBMT0NBTF9EUk1fRk9STUFUX01PRF9OT05FOgotCQkqd2lkdGhf
cmV0ID0gNjQ7CisJCWlmIChpc19pOTE1X2RldmljZShmZCkpCisJCQkqd2lkdGhfcmV0ID0gNjQ7
CisJCWVsc2UKKwkJCSp3aWR0aF9yZXQgPSAxOworCiAJCSpoZWlnaHRfcmV0ID0gMTsKIAkJYnJl
YWs7CiAJY2FzZSBMT0NBTF9JOTE1X0ZPUk1BVF9NT0RfWF9USUxFRDoKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
