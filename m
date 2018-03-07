Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7236E085
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Mar 2018 15:28:28 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed,  7 Mar 2018 17:28:16 +0200
Message-Id: <20180307152817.11257-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20180307152817.11257-1-arkadiusz.hiler@intel.com>
References: <20180307152817.11257-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] [CI 2/3] lib/igt_kms: Fix igt_plane_reset to handle
 cursor planes correctly too
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

RnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5o
aWxlckBpbnRlbC5jb20+Ci0tLQogbGliL2lndF9rbXMuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuYyBiL2xpYi9pZ3Rfa21z
LmMKaW5kZXggMDIyYWJmZTcuLjZiYWM0ZDFmIDEwMDY0NAotLS0gYS9saWIvaWd0X2ttcy5jCisr
KyBiL2xpYi9pZ3Rfa21zLmMKQEAgLTE3MjMsNiArMTcyMyw3IEBAIHN0YXRpYyB2b2lkIGlndF9w
bGFuZV9yZXNldChpZ3RfcGxhbmVfdCAqcGxhbmUpCiAKIAlpZ3RfcGxhbmVfY2xlYXJfcHJvcF9j
aGFuZ2VkKHBsYW5lLCBJR1RfUExBTkVfSU5fRkVOQ0VfRkQpOwogCXBsYW5lLT52YWx1ZXNbSUdU
X1BMQU5FX0lOX0ZFTkNFX0ZEXSA9IH4wVUxMOworCXBsYW5lLT5nZW1faGFuZGxlID0gMDsKIH0K
IAogc3RhdGljIHZvaWQgaWd0X3BpcGVfcmVzZXQoaWd0X3BpcGVfdCAqcGlwZSkKLS0gCjIuMTQu
MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
