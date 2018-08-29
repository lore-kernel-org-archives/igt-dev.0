Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DD16E554
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Aug 2018 13:12:51 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id k19-v6so2272170pfi.1
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Aug 2018 06:12:51 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed, 29 Aug 2018 16:12:12 +0300
Message-Id: <1535548332-8413-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1535372854-3031-2-git-send-email-juhapekka.heikkila@gmail.com>
References: <1535372854-3031-2-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: Fix
 bad-pixel-format not to be run on gen11 and later
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

Z2VuMTEgZW5hYmxlcyA5MC8yNzAgcm90YXRpb24gZm9yIFJHQjU2NSBtb2RlLiBJR1Qgd291bGQg
bmVlZCBzdXBwb3J0IGZvcgpDOCBtb2RlIHRvIGVuYWJsZSBydW5uaW5nIHRoaXMgc3VidGVzdCBv
biBnZW4xMSBhbmQgbGF0ZXIuCgp2MiAoTWlrYSBLYWhvbGEpOiBDb21iaW5lIGdlbiBjaGVja3Mg
aW50byBvbmUgY29tcGFyaXNvbi4gVXBkYXRlCmNvbW1lbnQgb24gd2h5IGJhZC1waXhlbC1mb3Jt
YXQgaXMgZGlzYWJsZWQgYmV5b25kIGdlbjExLgoKU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBI
ZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcm90
YXRpb25fY3JjLmMgfCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcm90YXRpb25fY3JjLmMgYi90
ZXN0cy9rbXNfcm90YXRpb25fY3JjLmMKaW5kZXggYjk5NGNjNS4uNWVkMGMwYiAxMDA2NDQKLS0t
IGEvdGVzdHMva21zX3JvdGF0aW9uX2NyYy5jCisrKyBiL3Rlc3RzL2ttc19yb3RhdGlvbl9jcmMu
YwpAQCAtNTU3LDcgKzU1NywxMiBAQCBpZ3RfbWFpbgogCWRhdGEucG9zX3kgPSAwOwogCiAJaWd0
X3N1YnRlc3RfZigiYmFkLXBpeGVsLWZvcm1hdCIpIHsKLQkJaWd0X3JlcXVpcmUoZ2VuID49IDkp
OworCQkvKgorCQkgKiBnZW4xMSBlbmFibGVzIFJHQjU2NSByb3RhdGlvbiBmb3IgOTAvMjcwIGRl
Z3JlZXMuCisJCSAqIERSTV9GT1JNQVRfQzggZm10IG5lZWQgdG8gYmUgZW5hYmxlZCBmb3IgSUdU
IGlmIHdhbnQgdG8gcnVuCisJCSAqIHRoaXMgdGVzdCBvbiBnZW4xMSBhbmQgbGF0ZXIuCisJCSAq
LworCQlpZ3RfcmVxdWlyZShnZW4gPj0gOSAmJiBnZW4gPCAxMSk7CiAJCWRhdGEucm90YXRpb24g
PSBJR1RfUk9UQVRJT05fOTA7CiAJCWRhdGEub3ZlcnJpZGVfZm10ID0gRFJNX0ZPUk1BVF9SR0I1
NjU7CiAJCXRlc3RfcGxhbmVfcm90YXRpb24oJmRhdGEsIERSTV9QTEFORV9UWVBFX1BSSU1BUlks
IHRydWUpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
