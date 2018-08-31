Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3AFFA6E8DD
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Aug 2018 13:12:45 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Fri, 31 Aug 2018 15:12:14 +0200
Message-Id: <646c39734b6dde4b74f215b64f094cddc9e00ebe.1535721136.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <cover.2608afc0c4c8efaee37268ea6e9dee558c619b13.1535721136.git-series.maxime.ripard@bootlin.com>
References: <cover.2608afc0c4c8efaee37268ea6e9dee558c619b13.1535721136.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <cover.2608afc0c4c8efaee37268ea6e9dee558c619b13.1535721136.git-series.maxime.ripard@bootlin.com>
References: <cover.2608afc0c4c8efaee37268ea6e9dee558c619b13.1535721136.git-series.maxime.ripard@bootlin.com>
Subject: [igt-dev] [PATCH v6 05/13] fb: Fix ARGB8888 color depth
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
Cc: eben@raspberrypi.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIEFSR0I4ODg4IGhhcyBiZWVuIGxpc3RlZCBhcyBoYXZpbmcgYSAzMiBiaXRzIGRlcHRoLCB3
aGlsZSBpdCBhY3R1YWxseQppcyBhIDI0IGJpdHMgZm9ybWF0LiBGaXggdGhpcy4KClNpZ25lZC1v
ZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQogbGli
L2lndF9mYi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5jCmluZGV4IDlh
ZWUwMmMzNWMxNi4uN2Q0NmNmZGI0NWQ4IDEwMDY0NAotLS0gYS9saWIvaWd0X2ZiLmMKKysrIGIv
bGliL2lndF9mYi5jCkBAIC04MCw3ICs4MCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZm9ybWF0X2Rlc2Nf
c3RydWN0IHsKIAkgIC5jYWlyb19pZCA9IENBSVJPX0ZPUk1BVF9SR0IzMCwKIAkgIC5udW1fcGxh
bmVzID0gMSwgLnBsYW5lX2JwcCA9IHsgMzIsIH0sCiAJfSwKLQl7IC5uYW1lID0gIkFSR0I4ODg4
IiwgLmRlcHRoID0gMzIsIC5kcm1faWQgPSBEUk1fRk9STUFUX0FSR0I4ODg4LAorCXsgLm5hbWUg
PSAiQVJHQjg4ODgiLCAuZGVwdGggPSAyNCwgLmRybV9pZCA9IERSTV9GT1JNQVRfQVJHQjg4ODgs
CiAJICAuY2Fpcm9faWQgPSBDQUlST19GT1JNQVRfQVJHQjMyLAogCSAgLm51bV9wbGFuZXMgPSAx
LCAucGxhbmVfYnBwID0geyAzMiwgfSwKIAl9LAotLSAKZ2l0LXNlcmllcyAwLjkuMQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
