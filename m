Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB836F6E3
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Dec 2018 14:05:46 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id 101so2565894pld.6
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Dec 2018 06:05:46 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Fri, 21 Dec 2018 16:05:33 +0200
Message-Id: <1545401134-25041-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_rotation: align rendered
 image correctly for rotation
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

cmVuZGVyZWQgdGVzdCBpbWFnZSBoYWQgb2ZmLWJ5LW9uZSBlcnJvciBpbiBzaXplIGNhbGN1bGF0
aW9uCndoaWNoIHdhcyBmYWlsaW5nIHNvbWUgdGVzdHMgb24gY2VydGFpbiByZXNvbHV0aW9ucyBh
bmQgcGxhbmUKc2l6ZXMuCgpTaWduZWQtb2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhh
cGVra2EuaGVpa2tpbGFAZ21haWwuY29tPgotLS0KIHRlc3RzL2ttc19yb3RhdGlvbl9jcmMuYyB8
IDExICsrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19yb3RhdGlvbl9jcmMuYyBiL3Rlc3RzL2tt
c19yb3RhdGlvbl9jcmMuYwppbmRleCBjNjdmNjA4Li43OTYxMTVhIDEwMDY0NAotLS0gYS90ZXN0
cy9rbXNfcm90YXRpb25fY3JjLmMKKysrIGIvdGVzdHMva21zX3JvdGF0aW9uX2NyYy5jCkBAIC0x
MjYsNiArMTI2LDkgQEAgcGFpbnRfc3F1YXJlcyhkYXRhX3QgKmRhdGEsIGlndF9yb3RhdGlvbl90
IHJvdGF0aW9uLAogCXVuc2lnbmVkIGludCBoID0gZmItPmhlaWdodDsKIAlyZ2JfY29sb3JfdCB0
bCwgdHIsIGJsLCBicjsKIAorCWlndF9hc3NlcnRfZighKHcmMSksICJyb3RhdGlvbiBpbWFnZSBt
dXN0IGJlIGV2ZW4gd2lkdGgsIG5vdyBhdHRlbXB0ZWQgJWRcbiIsIHcpOworCWlndF9hc3NlcnRf
ZighKGgmMSksICJyb3RhdGlvbiBpbWFnZSBtdXN0IGJlIGV2ZW4gaGVpZ2h0LCBub3cgYXR0ZW1w
dGVkICVkXG4iLCBoKTsKKwogCWNyID0gaWd0X2dldF9jYWlyb19jdHgoZGF0YS0+Z2Z4X2ZkLCBm
Yik7CiAKIAlzZXRfY29sb3IoJnRsLCBvLCAwLjBmLCAwLjBmKTsKQEAgLTQzOSw4ICs0NDIsMTIg
QEAgc3RhdGljIHZvaWQgZ2V0X211bHRpcGxhbmVfY3JjKGRhdGFfdCAqZGF0YSwgaWd0X291dHB1
dF90ICpvdXRwdXQsCiAJCXBsYW5lc1tjXS5wbGFuZSA9IGlndF9vdXRwdXRfZ2V0X3BsYW5lX3R5
cGUob3V0cHV0LAogCQkJCQkJCSAgICBwbGFuZWluZm9bY10ucGxhbmV0eXBlKTsKIAotCQl3ID0g
cGxhbmVpbmZvW2NdLndpZHRoOwotCQloID0gcGxhbmVpbmZvW2NdLmhlaWdodDsKKwkJLyoKKwkJ
ICogbWFrZSBwbGFuZSBhbmQgZmIgd2lkdGggYW5kIGhlaWdodCBhbHdheXMgZXZlbiBkdWUgdG8K
KwkJICogdGVzdCBpbWFnZSByZW5kZXJpbmcKKwkJICovCisJCXcgPSBwbGFuZWluZm9bY10ud2lk
dGggJiB+MTsKKwkJaCA9IHBsYW5laW5mb1tjXS5oZWlnaHQgJiB+MTsKIAogCQlpZiAocGxhbmVp
bmZvW2NdLnJvdGF0aW9uX3N3ICYgKElHVF9ST1RBVElPTl85MCB8IElHVF9ST1RBVElPTl8yNzAp
KQogCQkJaWd0X3N3YXAodywgaCk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
