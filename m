Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CED6E57A
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2018 10:26:59 +0000 (UTC)
From: Marta Lofstedt <marta.lofstedt@intel.com>
Date: Wed,  7 Feb 2018 12:28:14 +0200
Message-Id: <20180207102814.12710-1-marta.lofstedt@intel.com>
Subject: [igt-dev] [PATCH i-g-t] test/kms_ccs: Ease requirements on
 DRM_PLANE_TYPE_CURSOR
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

RFJNX1BMQU5FX1RZUEVfQ1VSU09SIGRvZXNuJ3QgaGF2ZSB0aGUgc2FtZSBmb3JtYXQgYW5kL29y
CkNDUyBtb2RpZmllciBzdXBwb3J0IGZvciBhIGxvdCBvZiBtYWNoaW5lcy4gVGhpcyBoYXMgY2F1
c2VkIHRoZQpwaXBlLUEtY3JjLXNwcml0ZS1wbGFuZXMtYmFzaWMgYW5kIHBpcGUtQi1jcmMtc3By
aXRlLXBsYW5lcy1iYXNpYwpzdWJ0ZXN0IHRvIGJlIHNraXBwZWQgb24gYWxsIG1hY2hpbmVzLiBI
b3dldmVyLCBpZgpEUk1fUExBTkVfVFlQRV9DVVJTT1IgaXMgcmVtb3ZlZCBmcm9tIHRlc3Rpbmcg
YXQgbGVhc3Qgd2UgY2FuIGdldApzb21lIHJlc3VsdHMgZnJvbSB0aGlzIHRlc3QuCgpCdWd6aWxs
YTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA0NzI0ClNp
Z25lZC1vZmYtYnk6IE1hcnRhIExvZnN0ZWR0IDxtYXJ0YS5sb2ZzdGVkdEBpbnRlbC5jb20+Ci0t
LQogdGVzdHMva21zX2Njcy5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY2NzLmMgYi90ZXN0cy9r
bXNfY2NzLmMKaW5kZXggZWJmNDIxMmUuLjFkYzc2M2VhIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNf
Y2NzLmMKKysrIGIvdGVzdHMva21zX2Njcy5jCkBAIC01NTIsNyArNTUyLDggQEAgaWd0X21haW4K
IAkJCWlndF9kaXNwbGF5X3JlcXVpcmVfb3V0cHV0X29uX3BpcGUoJmRhdGEuZGlzcGxheSwgZGF0
YS5waXBlKTsKIAogCQkJZm9yX2VhY2hfcGxhbmVfb25fcGlwZSgmZGF0YS5kaXNwbGF5LCBkYXRh
LnBpcGUsIGRhdGEucGxhbmUpIHsKLQkJCQlpZiAoZGF0YS5wbGFuZS0+dHlwZSA9PSBEUk1fUExB
TkVfVFlQRV9QUklNQVJZKQorCQkJCWlmIChkYXRhLnBsYW5lLT50eXBlID09IERSTV9QTEFORV9U
WVBFX1BSSU1BUlkgfHwKKwkJCQkgICAgZGF0YS5wbGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQ
RV9DVVJTT1IpCiAJCQkJCWNvbnRpbnVlOwogCQkJCXNwcml0ZV9pZHgrKzsKIAkJCQkJdGVzdF9v
dXRwdXQoJmRhdGEpOwotLSAKMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
