Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8B06E435
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2019 13:49:43 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 16 Aug 2019 16:50:36 +0300
Message-Id: <20190816135036.6083-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: check whether EDID
 blob is non-NULL before trying to read it
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

dGVzdF9lZGlkX3JlYWQgc2V0cyBhbiBFRElEIG9uIGEgcG9ydCwgcGx1Z3MgaXQgYW5kIHJlYWRz
IGl0IGJhY2suIFNvbWV0aW1lcwpyZXRyaWV2aW5nIHRoZSBibG9iIGZhaWxzLiBDaGVjayB3aGV0
aGVyIHRoZSBibG9iIGlzIHNldCBhdCBhbGwgYmVmb3JlIHRyeWluZwp0byBnZXQgaXQuIFRoaXMg
bWFrZXMgaXQgb2J2aW91cyBpdCdzIG5vdCBkcm1Nb2RlR2V0UHJvcGVydHlCbG9iIGZhaWxpbmcg
Zm9yCmFub3RoZXIgcmVhc29uLgoKU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJA
aW50ZWwuY29tPgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9MTA2NzY2Ci0tLQoKTm90ZSB0byBzZWxmOiBuZWVkIHRvIHVwZGF0ZSBmaWx0ZXJz
IGJlZm9yZSBtZXJnaW5nCgogdGVzdHMva21zX2NoYW1lbGl1bS5jIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY2hhbWVsaXVtLmMg
Yi90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKaW5kZXggMGNmMWJmYmRlYWVlLi43NTZlNTliYWY2M2Ig
MTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19jaGFtZWxpdW0uYworKysgYi90ZXN0cy9rbXNfY2hhbWVs
aXVtLmMKQEAgLTMwOSw2ICszMDksNyBAQCB0ZXN0X2VkaWRfcmVhZChkYXRhX3QgKmRhdGEsIHN0
cnVjdCBjaGFtZWxpdW1fcG9ydCAqcG9ydCwgZW51bSB0ZXN0X2VkaWQgZWRpZCkKIAlpZ3RfYXNz
ZXJ0KGttc3Rlc3RfZ2V0X3Byb3BlcnR5KGRhdGEtPmRybV9mZCwgY29ubmVjdG9yLT5jb25uZWN0
b3JfaWQsCiAJCQkJCURSTV9NT0RFX09CSkVDVF9DT05ORUNUT1IsICJFRElEIiwgTlVMTCwKIAkJ
CQkJJmVkaWRfYmxvYl9pZCwgTlVMTCkpOworCWlndF9hc3NlcnQoZWRpZF9ibG9iX2lkICE9IDAp
OwogCWlndF9hc3NlcnQoZWRpZF9ibG9iID0gZHJtTW9kZUdldFByb3BlcnR5QmxvYihkYXRhLT5k
cm1fZmQsCiAJCQkJCQkgICAgICBlZGlkX2Jsb2JfaWQpKTsKCi0tCjIuMjIuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
