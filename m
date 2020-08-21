Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id C652A6E2ED
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2020 16:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 3D6072A6046
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2020 18:39:30 +0200 (CEST)
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id eyB6dskA_OZv for <igt-dev@lists.freedesktop.org>;
 Fri, 21 Aug 2020 18:39:29 +0200 (CEST)
Received: from kaveri (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 131132A6045
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2020 18:39:29 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.94)
 (envelope-from <michel@daenzer.net>) id 1k9A4e-004UzG-Cd
 for igt-dev@lists.freedesktop.org; Fri, 21 Aug 2020 18:39:28 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
Date: Fri, 21 Aug 2020 18:39:27 +0200
Message-Id: <20200821163928.1072379-2-michel@daenzer.net>
In-Reply-To: <20200821163928.1072379-1-michel@daenzer.net>
References: <20200821163928.1072379-1-michel@daenzer.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/2] tests/kms_plane_multiple: Turn off pipe as
 well if all planes are off
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

RnJvbTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+CgpBbmQgb25seSBjb2xs
ZWN0IENSQyBkYXRhIHdoaWxlIHRoZSBwaXBlIGlzIG9uLgoKVGhpcyBtYWtlcyB0aGUgdGVzdCBj
b21wYXRpYmxlIHdpdGggc2V0dXBzIHdoaWNoIGRvbid0IHN1cHBvcnQgYW4KZW5hYmxlZCBwaXBl
IHdpdGhvdXQgYW55IGVuYWJsZWQgcGxhbmVzLgoKU2lnbmVkLW9mZi1ieTogTWljaGVsIETDpG56
ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+Ci0tLQogdGVzdHMva21zX3BsYW5lX211bHRpcGxlLmMg
fCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFuZV9tdWx0aXBsZS5jIGIvdGVzdHMva21z
X3BsYW5lX211bHRpcGxlLmMKaW5kZXggODMxMDk4MWMuLjJhMTM0MWQwIDEwMDY0NAotLS0gYS90
ZXN0cy9rbXNfcGxhbmVfbXVsdGlwbGUuYworKysgYi90ZXN0cy9rbXNfcGxhbmVfbXVsdGlwbGUu
YwpAQCAtNzgsOCArNzgsNiBAQCBzdGF0aWMgdm9pZCB0ZXN0X2luaXQoZGF0YV90ICpkYXRhLCBl
bnVtIHBpcGUgcGlwZSwgaW50IG5fcGxhbmVzKQogCiBzdGF0aWMgdm9pZCB0ZXN0X2ZpbmkoZGF0
YV90ICpkYXRhLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgaW50IG5fcGxhbmVzKQogewotCWlndF9w
aXBlX2NyY19zdG9wKGRhdGEtPnBpcGVfY3JjKTsKLQogCS8qIHJlc2V0IHRoZSBjb25zdHJhaW50
IG9uIHRoZSBwaXBlICovCiAJaWd0X291dHB1dF9zZXRfcGlwZShvdXRwdXQsIFBJUEVfQU5ZKTsK
IApAQCAtMzE2LDYgKzMxNCw3IEBAIHRlc3RfcGxhbmVfcG9zaXRpb25fd2l0aF9vdXRwdXQoZGF0
YV90ICpkYXRhLCBlbnVtIHBpcGUgcGlwZSwKIAkJZm9yX2VhY2hfcGxhbmVfb25fcGlwZSgmZGF0
YS0+ZGlzcGxheSwgcGlwZSwgcGxhbmUpCiAJCQlpZ3RfcGxhbmVfc2V0X2ZiKHBsYW5lLCBOVUxM
KTsKIAorCQlpZ3Rfb3V0cHV0X3NldF9waXBlKG91dHB1dCwgUElQRV9OT05FKTsKIAkJaWd0X2Rp
c3BsYXlfY29tbWl0MigmZGF0YS0+ZGlzcGxheSwgQ09NTUlUX0FUT01JQyk7CiAKIAkJZm9yIChp
bnQgeCA9IDA7IHggPCBjOyB4KyspCkBAIC0zMjksOCArMzI4LDYgQEAgdGVzdF9wbGFuZV9wb3Np
dGlvbl93aXRoX291dHB1dChkYXRhX3QgKmRhdGEsIGVudW0gcGlwZSBwaXBlLAogCQkgaWd0X291
dHB1dF9uYW1lKG91dHB1dCksIGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUpLCBjLAogCQkgaW5mbywg
b3B0LnNlZWQpOwogCi0JaWd0X3BpcGVfY3JjX3N0YXJ0KGRhdGEtPnBpcGVfY3JjKTsKLQogCWkg
PSAwOwogCXdoaWxlIChpIDwgaXRlcmF0aW9ucyB8fCBsb29wX2ZvcmV2ZXIpIHsKIAkJLyogcmFu
ZG9taXplIHBsYW5lcyBhbmQgc2V0IHVwIHRoZSBob2xlcyAqLwpAQCAtMzM4LDExICszMzUsMTQg
QEAgdGVzdF9wbGFuZV9wb3NpdGlvbl93aXRoX291dHB1dChkYXRhX3QgKmRhdGEsIGVudW0gcGlw
ZSBwaXBlLAogCiAJCWlndF9kaXNwbGF5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXksIENPTU1JVF9B
VE9NSUMpOwogCisJCWlndF9waXBlX2NyY19zdGFydChkYXRhLT5waXBlX2NyYyk7CiAJCWlndF9w
aXBlX2NyY19nZXRfY3VycmVudChkYXRhLT5kaXNwbGF5LmRybV9mZCwgZGF0YS0+cGlwZV9jcmMs
ICZjcmMpOworCQlpZ3RfcGlwZV9jcmNfc3RvcChkYXRhLT5waXBlX2NyYyk7CiAKIAkJZm9yX2Vh
Y2hfcGxhbmVfb25fcGlwZSgmZGF0YS0+ZGlzcGxheSwgcGlwZSwgcGxhbmUpCiAJCQlpZ3RfcGxh
bmVfc2V0X2ZiKHBsYW5lLCBOVUxMKTsKIAorCQlpZ3Rfb3V0cHV0X3NldF9waXBlKG91dHB1dCwg
UElQRV9OT05FKTsKIAkJaWd0X2Rpc3BsYXlfY29tbWl0MigmZGF0YS0+ZGlzcGxheSwgQ09NTUlU
X0FUT01JQyk7CiAKIAkJZm9yIChpbnQgeCA9IDA7IHggPCBjOyB4KyspCi0tIAoyLjI4LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
