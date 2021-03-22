Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155CB6E5A0
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 19:36:15 +0000 (UTC)
Received: from [10.9.9.73] (helo=submission02.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <arkadiusz@hiler.pl>) id 1lOPYy-0008TK-E4
 for igt-dev@lists.freedesktop.org; Mon, 22 Mar 2021 19:46:04 +0100
Received: by submission02.runbox with esmtpsa [Authenticated alias (933559)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lOPYg-0002dW-Av
 for igt-dev@lists.freedesktop.org; Mon, 22 Mar 2021 19:45:46 +0100
From: Arkadiusz Hiler <arek@hiler.eu>
Date: Mon, 22 Mar 2021 20:45:39 +0200
Message-Id: <20210322184539.123128-1-arek@hiler.eu>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/drm_read: Don't use deprecated siginterrupt
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

U2luY2Ugd2UgYXJlIHVzaW5nIHNpZ2FjdGlvbigpIHdlIGNhbiBhbHNvIHJlZ2lzdGVyIHRoZSBz
aWduYWwgaGFuZGxlcgppbiBvbmUgZ28uCgpGaXhlczogIndhcm5pbmc6IOKAmHNpZ2ludGVycnVw
dOKAmSBpcyBkZXByZWNhdGVkOiBVc2Ugc2lnYWN0aW9uIHdpdGggU0FfUkVTVEFSVCBpbnN0ZWFk
IgpTaWduZWQtb2ZmLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFyZWtAaGlsZXIuZXU+Ci0tLQogdGVz
dHMvZHJtX3JlYWQuYyB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2RybV9yZWFkLmMgYi90
ZXN0cy9kcm1fcmVhZC5jCmluZGV4IGNmYjFjMDRkLi5jY2Y5ZDgyMiAxMDA2NDQKLS0tIGEvdGVz
dHMvZHJtX3JlYWQuYworKysgYi90ZXN0cy9kcm1fcmVhZC5jCkBAIC00OCw3ICs0OCw3IEBACiAK
IElHVF9URVNUX0RFU0NSSVBUSU9OKCJDYWxsIHJlYWQoZHJtKSBhbmQgc2VlIGlmIGl0IGJlaGF2
ZXMuIik7CiAKLXN0YXRpYyB2b2lkIHNpZ2hhbmRsZXIoaW50IHNpZykKK3N0YXRpYyB2b2lkIHNp
Z2hhbmRsZXIoaW50IHNpZywgc2lnaW5mb190ICogaW5mbywgdm9pZCAqY29udGV4dCkKIHsKIH0K
IApAQCAtMjU3LDEyICsyNTcsMTUgQEAgaWd0X21haW4KIAlzdHJ1Y3QgaWd0X2ZiIGZiOwogCWVu
dW0gcGlwZSBwaXBlOwogCi0Jc2lnbmFsKFNJR0FMUk0sIHNpZ2hhbmRsZXIpOwotCXNpZ2ludGVy
cnVwdChTSUdBTFJNLCAxKTsKLQogCWlndF9maXh0dXJlIHsKKwkJc3RydWN0IHNpZ2FjdGlvbiBh
bGFybV9hY3Rpb24gPSB7fTsKIAkJaWd0X291dHB1dF90ICpvdXRwdXQ7CiAKKwkJaWd0X2Fzc2Vy
dF9uZXEoc2lnYWN0aW9uKFNJR0FMUk0sIE5VTEwsICZhbGFybV9hY3Rpb24pLCAtMSk7CisJCWFs
YXJtX2FjdGlvbi5zYV9mbGFncyAmPSB+U0FfUkVTVEFSVDsKKwkJYWxhcm1fYWN0aW9uLnNhX3Np
Z2FjdGlvbiA9IHNpZ2hhbmRsZXI7CisJCWlndF9hc3NlcnRfbmVxKHNpZ2FjdGlvbihTSUdBTFJN
LCAmYWxhcm1fYWN0aW9uLCBOVUxMKSwgLTEpOworCiAJCWZkID0gZHJtX29wZW5fZHJpdmVyX21h
c3RlcihEUklWRVJfQU5ZKTsKIAkJa21zdGVzdF9zZXRfdnRfZ3JhcGhpY3NfbW9kZSgpOwogCi0t
IAoyLjMxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
