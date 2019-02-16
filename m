Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B75E6E09E
 for <igt-dev@lists.freedesktop.org>; Sat, 16 Feb 2019 18:30:04 +0000 (UTC)
Date: Sat, 16 Feb 2019 20:29:58 +0200
Message-Id: <20190216182959.8760-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kms: Add zpos plane property.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: Marius Vlad via igt-dev <igt-dev@lists.freedesktop.org>
Reply-To: Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Marius Vlad <marius.vlad0@gmail.com>, daniel@ffwll.ch, p.zabel@pengutronix.de
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogTWFyaXVzIFZsYWQgPG1hcml1cy52bGFkMEBnbWFpbC5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBNYXJpdXMgVmxhZCA8bWFyaXVzLnZsYWRAY29sbGFib3JhLmNvbT4KLS0tCiBsaWIvaWd0X2tt
cy5jIHwgMSArCiBsaWIvaWd0X2ttcy5oIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9saWIvaWd0X2ttcy5jCmluZGV4
IDg1YTkxMWUxLi44N2ZhNWJmZiAxMDA2NDQKLS0tIGEvbGliL2lndF9rbXMuYworKysgYi9saWIv
aWd0X2ttcy5jCkBAIC0xNzcsNiArMTc3LDcgQEAgY29uc3QgY2hhciAqIGNvbnN0IGlndF9wbGFu
ZV9wcm9wX25hbWVzW0lHVF9OVU1fUExBTkVfUFJPUFNdID0gewogCVtJR1RfUExBTkVfQ09MT1Jf
UkFOR0VdID0gIkNPTE9SX1JBTkdFIiwKIAlbSUdUX1BMQU5FX1BJWEVMX0JMRU5EX01PREVdID0g
InBpeGVsIGJsZW5kIG1vZGUiLAogCVtJR1RfUExBTkVfQUxQSEFdID0gImFscGhhIiwKKwlbSUdU
X1BMQU5FX1pQT1NdID0gInpwb3MiLAogfTsKIAogY29uc3QgY2hhciAqIGNvbnN0IGlndF9jcnRj
X3Byb3BfbmFtZXNbSUdUX05VTV9DUlRDX1BST1BTXSA9IHsKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
a21zLmggYi9saWIvaWd0X2ttcy5oCmluZGV4IDY3OWQ0ZTg0Li4yMjdmYTAyMCAxMDA2NDQKLS0t
IGEvbGliL2lndF9rbXMuaAorKysgYi9saWIvaWd0X2ttcy5oCkBAIC0yNzIsNiArMjcyLDcgQEAg
ZW51bSBpZ3RfYXRvbWljX3BsYW5lX3Byb3BlcnRpZXMgewogICAgICAgIElHVF9QTEFORV9DT0xP
Ul9SQU5HRSwKICAgICAgICBJR1RfUExBTkVfUElYRUxfQkxFTkRfTU9ERSwKICAgICAgICBJR1Rf
UExBTkVfQUxQSEEsCisgICAgICAgSUdUX1BMQU5FX1pQT1MsCiAgICAgICAgSUdUX05VTV9QTEFO
RV9QUk9QUwogfTsKIAotLSAKMi4xOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
