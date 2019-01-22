Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 21DEC89C82
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jan 2019 13:43:10 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue, 22 Jan 2019 14:42:45 +0100
Message-Id: <20190122134257.14038-3-maxime.ripard@bootlin.com>
In-Reply-To: <20190122134257.14038-1-maxime.ripard@bootlin.com>
References: <20190122134257.14038-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 02/14] igt: fb: Reduce tile size
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
cGxhdGZvcm1zLCBtYWtlCnN1cmUgdG8gYWRkIGEgY2hlY2sgYWdhaW5zdCB0aGlzLgoKUmV2aWV3
ZWQtYnk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4K
U2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4K
LS0tCiBsaWIvaWd0X2ZiLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3Rf
ZmIuYwppbmRleCBlMjM5MDhlMjhjMDcuLjFhNWMzMzhlYTUzMiAxMDA2NDQKLS0tIGEvbGliL2ln
dF9mYi5jCisrKyBiL2xpYi9pZ3RfZmIuYwpAQCAtMjA0LDcgKzIwNCwxMSBAQCB2b2lkIGlndF9n
ZXRfZmJfdGlsZV9zaXplKGludCBmZCwgdWludDY0X3QgdGlsaW5nLCBpbnQgZmJfYnBwLAogewog
CXN3aXRjaCAodGlsaW5nKSB7CiAJY2FzZSBMT0NBTF9EUk1fRk9STUFUX01PRF9OT05FOgotCQkq
d2lkdGhfcmV0ID0gNjQ7CisJCWlmIChpc19pOTE1X2RldmljZShmZCkpCisJCQkqd2lkdGhfcmV0
ID0gNjQ7CisJCWVsc2UKKwkJCSp3aWR0aF9yZXQgPSAxOworCiAJCSpoZWlnaHRfcmV0ID0gMTsK
IAkJYnJlYWs7CiAJY2FzZSBMT0NBTF9JOTE1X0ZPUk1BVF9NT0RfWF9USUxFRDoKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
