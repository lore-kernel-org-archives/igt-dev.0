Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641CB6E22D
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Nov 2019 14:23:08 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id d29so7858313plj.8
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Nov 2019 06:23:08 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 11 Nov 2019 16:23:01 +0200
Message-Id: <1573482181-19497-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_persistence: fix gcc
 warning
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

Y2FzdGluZyB1bnNpZ25lZCBjaGFyIHBvaW50ZXIgdG8gaW50IHBvaW50ZXIgY2F1c2VzIGdjYyB0
byBiZSB1bmhhcHB5IHdpdGgKY29tbWVudDogIndhcm5pbmc6IGRlcmVmZXJlbmNpbmcgdHlwZS1w
dW5uZWQgcG9pbnRlciB3aWxsIGJyZWFrCnN0cmljdC1hbGlhc2luZyBydWxlcyIKClNpZ25lZC1v
ZmYtYnk6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+
Ci0tLQogdGVzdHMvaTkxNS9nZW1fY3R4X3BlcnNpc3RlbmNlLmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9p
OTE1L2dlbV9jdHhfcGVyc2lzdGVuY2UuYyBiL3Rlc3RzL2k5MTUvZ2VtX2N0eF9wZXJzaXN0ZW5j
ZS5jCmluZGV4IGE1ODJlNjQuLjI1MjVhODUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2N0
eF9wZXJzaXN0ZW5jZS5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2N0eF9wZXJzaXN0ZW5jZS5jCkBA
IC00MjAsNyArNDIwLDcgQEAgc3RhdGljIHZvaWQgc2VuZGZkKGludCBzb2NrZXQsIGludCBmZCkK
IAljbXNnLT5jbXNnX2xldmVsID0gU09MX1NPQ0tFVDsKIAljbXNnLT5jbXNnX3R5cGUgPSBTQ01f
UklHSFRTOwogCWNtc2ctPmNtc2dfbGVuID0gbXNnLm1zZ19jb250cm9sbGVuOwotCSooaW50ICop
Q01TR19EQVRBKGNtc2cpID0gZmQ7CisJbWVtY3B5KENNU0dfREFUQShjbXNnKSwgJmZkLCBzaXpl
b2YoZmQpKTsKIAogCWlndF9hc3NlcnQoc2VuZG1zZyhzb2NrZXQsICZtc2csIDApICE9IC0xKTsK
IH0KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
