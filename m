Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760F96E0EF
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2019 10:57:58 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Tue, 13 Aug 2019 09:29:06 +0530
Message-Id: <20190813035906.22064-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: disable hdcp
 if uevent test fails
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
To: igt-dev <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

VGhvdWdoIHVldmVudCB0ZXN0IGZhaWxlZCB3ZSBjYW4ndCBhc3NlcnQgdGhlcmUgaXRzZWxmLiB3
ZSBuZWVkIHRvCmRpc2FibGUgdGhlIGhkY3AgYmVmb3JlIGV4aXQuCgpIZW5jZSB1ZXZlbnQgZmFp
bHVyZSBpcyB0cmVhdGVkIGFzIGhkY3AgZW5hYmxlIGZhaWx1cmUgYW5kIHBhc3NlZAp0byB0aGUg
Y2FsbGVyIHRvIHNldCB0aGUgVU5ERVNJUkVEIHRvIHRoZSBwcm9wZXJ0eSBiZWZvcmUgZXhpdC4u
CgpTaWduZWQtb2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+CkJ1
Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTEz
OTAKLS0tCiB0ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMgfCA3ICsrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jIGIvdGVzdHMva21zX2NvbnRlbnRfcHJvdGVj
dGlvbi5jCmluZGV4IGU2NzZiNjBiZjcxOS4uNDY0NzNkODg5M2E4IDEwMDY0NAotLS0gYS90ZXN0
cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMKKysrIGIvdGVzdHMva21zX2NvbnRlbnRfcHJvdGVj
dGlvbi5jCkBAIC0yNTEsOSArMjUxLDEyIEBAIHdhaXRfZm9yX3Byb3BfdmFsdWUoaWd0X291dHB1
dF90ICpvdXRwdXQsIHVpbnQ2NF90IGV4cGVjdGVkLAogCWludCBpOwogCiAJaWYgKGRhdGEuY3Bf
dGVzdHMgJiBDUF9VRVZFTlQgJiYgZXhwZWN0ZWQgIT0gQ1BfVU5ERVNJUkVEKSB7Ci0JCWlndF9h
c3NlcnRfZih3YWl0X2Zvcl9oZGNwX2V2ZW50KG91dHB1dC0+aWQsCisJCWlmICghd2FpdF9mb3Jf
aGRjcF9ldmVudChvdXRwdXQtPmlkLAogCQkJICAgICBvdXRwdXQtPnByb3BzW0lHVF9DT05ORUNU
T1JfQ09OVEVOVF9QUk9URUNUSU9OXSwKLQkJCSAgICAgdGltZW91dF9tU2VjKSwgInVldmVudCBp
cyBub3QgcmVjZWl2ZWQiKTsKKwkJCSAgICAgdGltZW91dF9tU2VjKSkgeworCQkJaWd0X2luZm8o
InVldmVudCBpcyBub3QgcmVjZWl2ZWRcbiIpOworCQkJcmV0dXJuIGZhbHNlOworCQl9CiAKIAkJ
dmFsID0gaWd0X291dHB1dF9nZXRfcHJvcChvdXRwdXQsCiAJCQkJCSAgSUdUX0NPTk5FQ1RPUl9D
T05URU5UX1BST1RFQ1RJT04pOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
