Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 251B56E67D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Nov 2018 18:57:41 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
Date: Thu, 15 Nov 2018 10:57:32 -0800
Message-Id: <20181115185737.19311-1-eric@anholt.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/6] kms_content_protection: Fix log bug
 on 32-bit platforms.
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

bG9uZyBpcyBkaWZmZXJlbnQgYmV0d2VlbiAzMiBhbmQgNjQgYW5kIHNob3VsZCBiYXNpY2FsbHkg
bmV2ZXIgYmUKdXNlZC4gIEZpeGVzIGNvbXBpbGVyIHdhcm5pbmcgYWJvdXQgcGFzc2luZyB0aGUg
d3JvbmcgdHlwZS4KCnYyOiBVc2UgdGhlIFBSSWQ2NCBtYWNyb3MgaW5zdGVhZCBvZiBsb25nIGxv
bmcuCgpTaWduZWQtb2ZmLWJ5OiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgotLS0KIHRl
c3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2NvbnRl
bnRfcHJvdGVjdGlvbi5jIGIvdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jCmluZGV4IDgw
MWVmZjY2YzI3Mi4uZWY5MGVkNGMxNzkyIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfY29udGVudF9w
cm90ZWN0aW9uLmMKKysrIGIvdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jCkBAIC04OSw3
ICs4OSw4IEBAIHdhaXRfZm9yX3Byb3BfdmFsdWUoaWd0X291dHB1dF90ICpvdXRwdXQsIHVpbnQ2
NF90IGV4cGVjdGVkLAogCQkJcmV0dXJuIHRydWU7CiAJCXVzbGVlcCgxMDAwKTsKIAl9Ci0JaWd0
X2luZm8oInByb3BfdmFsdWUgbWlzbWF0Y2ggJWxkICE9ICVsZFxuIiwgdmFsLCBleHBlY3RlZCk7
CisJaWd0X2luZm8oInByb3BfdmFsdWUgbWlzbWF0Y2ggJSIgUFJJZDY0ICIgIT0gJSIgUFJJZDY0
ICJcbiIsCisJCSB2YWwsIGV4cGVjdGVkKTsKIAogCXJldHVybiBmYWxzZTsKIH0KLS0gCjIuMTku
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
