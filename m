Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F73B898F0
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2019 08:31:53 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Wed,  4 Sep 2019 11:32:45 +0300
Message-Id: <20190904083245.10273-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: fix missing
 reprobe_connector
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

QSByZXByb2JlX2Nvbm5lY3RvciBoYXMgYmVlbiBtdW5nbGVkIGJ5IG1pc3Rha2UgaW4gYSBwcmV2
aW91cyBwYXRjaC4gVGhlIG9sZApjb25uZWN0b3Igc3RhdHVzIHdhcyB1c2VkLCB3aGljaCBhbHdh
eXMgZmFpbGVkIGJlY2F1c2UgaXQncyBhc3NlcnRlZCB0byBiZQpEUk1fTU9ERV9DT05ORUNURUQg
YmVmb3JlIHRoZSB1bnBsdWcuCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBp
bnRlbC5jb20+CkZpeGVzOiA4NzIwOWQ4NDIxZWEgKCJ0ZXN0cy9rbXNfY2hhbWVsaXVtOiBjaGF0
dHkgY29ubmVjdG9yIHN0YXR1cyBhc3NlcnRpb25zIikKQnVnemlsbGE6IGh0dHBzOi8vYnVncy5m
cmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMTQwNwotLS0KIHRlc3RzL2ttc19jaGFt
ZWxpdW0uYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEvdGVzdHMva21zX2NoYW1lbGl1bS5jIGIvdGVzdHMva21zX2NoYW1lbGl1bS5jCmluZGV4IGQ2
YWVjOGI5N2ViMi4uNmI2MjkyNDk3Y2Q3IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfY2hhbWVsaXVt
LmMKKysrIGIvdGVzdHMva21zX2NoYW1lbGl1bS5jCkBAIC0yNzEsNiArMjcxLDcgQEAgdGVzdF9i
YXNpY19ob3RwbHVnKGRhdGFfdCAqZGF0YSwgc3RydWN0IGNoYW1lbGl1bV9wb3J0ICpwb3J0LCBp
bnQgdG9nZ2xlX2NvdW50KQogCQljaGFtZWxpdW1fdW5wbHVnKGRhdGEtPmNoYW1lbGl1bSwgcG9y
dCk7CiAJCWlndF9hc3NlcnRfZihpZ3RfaG90cGx1Z19kZXRlY3RlZChtb24sIEhPVFBMVUdfVElN
RU9VVCksCiAJCQkgICAgICJUaW1lZCBvdXQgd2FpdGluZyBmb3IgdW5wbHVnIHVldmVudFxuIik7
CisJCXN0YXR1cyA9IHJlcHJvYmVfY29ubmVjdG9yKGRhdGEsIHBvcnQpOwogCQlpZ3RfYXNzZXJ0
X2Yoc3RhdHVzID09IERSTV9NT0RFX0RJU0NPTk5FQ1RFRCwKIAkJCSAgICAgIkludmFsaWQgY29u
bmVjdG9yIHN0YXR1cyBhZnRlciBob3RwbHVnOiAiCiAJCQkgICAgICJnb3QgJXMsIGV4cGVjdGVk
IGRpc2Nvbm5lY3RlZFxuIiwKLS0KMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
