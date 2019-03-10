Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85FA890AD
 for <igt-dev@lists.freedesktop.org>; Sun, 10 Mar 2019 08:28:58 +0000 (UTC)
From: Marius Vlad <marius.vlad@collabora.com>
Date: Sun, 10 Mar 2019 10:28:52 +0200
Message-Id: <20190310082853.1618-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2 v2] lib/igt_kms: Add zpos plane property.
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
Cc: daniel@ffwll.ch, petri.latvala@intel.com, p.zabel@pengutronix.de, Marius Vlad <marius.vlad0@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogTWFyaXVzIFZsYWQgPG1hcml1cy52bGFkMEBnbWFpbC5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBNYXJpdXMgVmxhZCA8bWFyaXVzLnZsYWRAY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IFBo
aWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Ci0tLQogbGliL2lndF9rbXMuYyB8
IDEgKwogbGliL2lndF9rbXMuaCB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMuYwppbmRleCA3ZWJh
YjRjYS4uMTBhNjNjNzEgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3Rfa21zLmMKKysrIGIvbGliL2lndF9r
bXMuYwpAQCAtMTc3LDYgKzE3Nyw3IEBAIGNvbnN0IGNoYXIgKiBjb25zdCBpZ3RfcGxhbmVfcHJv
cF9uYW1lc1tJR1RfTlVNX1BMQU5FX1BST1BTXSA9IHsKIAlbSUdUX1BMQU5FX0NPTE9SX1JBTkdF
XSA9ICJDT0xPUl9SQU5HRSIsCiAJW0lHVF9QTEFORV9QSVhFTF9CTEVORF9NT0RFXSA9ICJwaXhl
bCBibGVuZCBtb2RlIiwKIAlbSUdUX1BMQU5FX0FMUEhBXSA9ICJhbHBoYSIsCisJW0lHVF9QTEFO
RV9aUE9TXSA9ICJ6cG9zIiwKIH07CiAKIGNvbnN0IGNoYXIgKiBjb25zdCBpZ3RfY3J0Y19wcm9w
X25hbWVzW0lHVF9OVU1fQ1JUQ19QUk9QU10gPSB7CmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5o
IGIvbGliL2lndF9rbXMuaAppbmRleCBhMjlhZDc4My4uZmM4MzQ5N2UgMTAwNjQ0Ci0tLSBhL2xp
Yi9pZ3Rfa21zLmgKKysrIGIvbGliL2lndF9rbXMuaApAQCAtMjcyLDYgKzI3Miw3IEBAIGVudW0g
aWd0X2F0b21pY19wbGFuZV9wcm9wZXJ0aWVzIHsKICAgICAgICBJR1RfUExBTkVfQ09MT1JfUkFO
R0UsCiAgICAgICAgSUdUX1BMQU5FX1BJWEVMX0JMRU5EX01PREUsCiAgICAgICAgSUdUX1BMQU5F
X0FMUEhBLAorICAgICAgIElHVF9QTEFORV9aUE9TLAogICAgICAgIElHVF9OVU1fUExBTkVfUFJP
UFMKIH07CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2
