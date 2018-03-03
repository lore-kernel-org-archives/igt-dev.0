Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271A56E2A0
 for <igt-dev@lists.freedesktop.org>; Sat,  3 Mar 2018 10:51:06 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat,  3 Mar 2018 10:50:58 +0000
Message-Id: <20180303105058.21366-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH igt] igt/drv_hangman: Check that the error state
 does hold the expected state
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
To: intel-gfx@lists.freedesktopo.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

QWN0dWFsbHkgY2hlY2sgdGhlIGVycm9yIHN0YXRlIGV4aXN0cyAoISJObyBlcnJvciBzdGF0ZSBj
YXB0dXJlZCIpIGFuZAp0aGF0IGl0IGNvbnRhaW5zIHRoZSBleHBlY3RlZCBlbmdpbmUgZHVtcC4K
ClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgot
LS0KIHRlc3RzL2Rydl9oYW5nbWFuLmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvZHJ2X2hhbmdtYW4uYyBiL3Rlc3RzL2Ry
dl9oYW5nbWFuLmMKaW5kZXggMzhjYjIwYzMuLjY1ZjNlYTFmIDEwMDY0NAotLS0gYS90ZXN0cy9k
cnZfaGFuZ21hbi5jCisrKyBiL3Rlc3RzL2Rydl9oYW5nbWFuLmMKQEAgLTEyOSw2ICsxMjksMTAg
QEAgc3RhdGljIHZvaWQgY2hlY2tfZXJyb3Jfc3RhdGUoY29uc3QgY2hhciAqZXhwZWN0ZWRfcmlu
Z19uYW1lLAogCUZJTEUgKmZpbGUgPSBvcGVuX2Vycm9yKCk7CiAJY2hhciAqbGluZSA9IE5VTEw7
CiAJc2l6ZV90IGxpbmVfc2l6ZSA9IDA7CisJYm9vbCBmb3VuZCA9IGZhbHNlOworCisJZ2V0bGlu
ZSgmbGluZSwgJmxpbmVfc2l6ZSwgZmlsZSk7CisJaWd0X2Fzc2VydChzdHJjYXNlY21wKGxpbmUs
ICJObyBlcnJvciBzdGF0ZSBjYXB0dXJlZCIpKTsKIAogCXdoaWxlIChnZXRsaW5lKCZsaW5lLCAm
bGluZV9zaXplLCBmaWxlKSA+IDApIHsKIAkJY2hhciAqZGFzaGVzOwpAQCAtMTY4LDEyICsxNzIs
MTYgQEAgc3RhdGljIHZvaWQgY2hlY2tfZXJyb3Jfc3RhdGUoY29uc3QgY2hhciAqZXhwZWN0ZWRf
cmluZ19uYW1lLAogCQkJCQkgNCppLCBiYXRjaFtpXSk7CiAJCQkJaWd0X2Fzc2VydChzdHJzdHIo
bGluZSwgZXhwZWN0ZWRfbGluZSkpOwogCQkJfQorCisJCQlmb3VuZCA9IHRydWU7CiAJCQlicmVh
azsKIAkJfQogCX0KIAogCWZyZWUobGluZSk7CiAJZmNsb3NlKGZpbGUpOworCisJaWd0X2Fzc2Vy
dChmb3VuZCk7CiB9CiAKIHN0YXRpYyB2b2lkIHRlc3RfZXJyb3Jfc3RhdGVfY2FwdHVyZSh1bnNp
Z25lZCByaW5nX2lkLAotLSAKMi4xNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
