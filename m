Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82E3894E3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 08:15:55 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Mon, 13 May 2019 11:15:45 +0300
Message-Id: <20190513081548.31837-6-simon.ser@intel.com>
In-Reply-To: <20190513081548.31837-1-simon.ser@intel.com>
References: <20190513081548.31837-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/8] test/kms_chamelium: disable >48KHz
 audio tests
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

VGhlc2Ugd2VyZW4ndCB0ZXN0ZWQgb24gRGlzcGxheVBvcnQgKGJlY2F1c2UgdGhlIENoYW1lbGl1
bSdzIGRlZmF1bHQgRURJRApkb2Vzbid0IGFkdmVydGlzZSB0aGVtKSBzbyB0aGlzIGRvZXNuJ3Qg
cmVtb3ZlIHNvbWUgdGVzdCBjYXNlcy4KCk9uIEhETUkgdGhleSBkb24ndCB3b3JrIHJlbGlhYmx5
OiBzb21ldGltZXMgbm8gYXVkaW8gZGF0YSBpcyBjYXB0dXJlZCBieSB0aGUKQ2hhbWVsaXVtLiBU
aGlzIG5lZWRzIHRvIGJlIGludmVzdGlnYXRlZCwgYnV0IGZvciBub3cgbGV0J3MganVzdCBkaXNh
YmxlIHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+
Ci0tLQogdGVzdHMva21zX2NoYW1lbGl1bS5jIHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21z
X2NoYW1lbGl1bS5jIGIvdGVzdHMva21zX2NoYW1lbGl1bS5jCmluZGV4IDUzMjhjOTk3ZTgzYS4u
NTY1MWIyMDBlM2EyIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKKysrIGIvdGVz
dHMva21zX2NoYW1lbGl1bS5jCkBAIC03NzIsMTQgKzc3MiwxNSBAQCB0ZXN0X2Rpc3BsYXlfZnJh
bWVfZHVtcChkYXRhX3QgKmRhdGEsIHN0cnVjdCBjaGFtZWxpdW1fcG9ydCAqcG9ydCkKIC8qIEEg
c3RyZWFrIG9mIDMgZ2l2ZXMgY29uZmlkZW5jZSB0aGF0IHRoZSBzaWduYWwgaXMgZ29vZC4gKi8K
ICNkZWZpbmUgTUlOX1NUUkVBSyAzCiAKKy8qIFRPRE86IGVuYWJsZSA+NDhLSHogcmF0ZXMsIHRo
ZXNlIGFyZSBub3QgcmVsaWFibGUgKi8KIHN0YXRpYyBpbnQgdGVzdF9zYW1wbGluZ19yYXRlc1td
ID0gewogCTMyMDAwLAogCTQ0MTAwLAogCTQ4MDAwLAotCTg4MjAwLAotCTk2MDAwLAotCTE3NjQw
MCwKLQkxOTIwMDAsCisJLyogODgyMDAsICovCisJLyogOTYwMDAsICovCisJLyogMTc2NDAwLCAq
LworCS8qIDE5MjAwMCwgKi8KIH07CiAKIHN0YXRpYyBpbnQgdGVzdF9zYW1wbGluZ19yYXRlc19j
b3VudCA9IHNpemVvZih0ZXN0X3NhbXBsaW5nX3JhdGVzKSAvIHNpemVvZihpbnQpOwotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
