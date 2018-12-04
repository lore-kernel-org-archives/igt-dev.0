Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E3006E157
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Dec 2018 10:25:46 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue,  4 Dec 2018 11:25:09 +0100
Message-Id: <20181204102509.18401-9-maxime.ripard@bootlin.com>
In-Reply-To: <20181204102509.18401-1-maxime.ripard@bootlin.com>
References: <20181204102509.18401-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH RESEND i-g-t 8/8] igt: tests: chamelium: Add NV12
 format
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
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIE5WMTIgaXMgYSBZVVYgZm9ybWF0IHRoYXQgYXJlIGN1cnJlbnRseSBzdXBwb3J0ZWQgaW4g
SUdULgoKV2UnbGwgd2FudCB0byB0ZXN0IHRob3NlIGZvcm1hdHMgaW4gYWRkaXRpb24gdG8gdGhl
IFJHQiBmb3JtYXRzLCBzbwpsZXQncyBhZGQgc29tZSBzdWJ0ZXN0cy4gT25lIHRoaW5nIHdvcnRo
IG5vdGluZyBpcyBzb21lIGhhcmR3YXJlIGlzbid0CmFibGUgdG8gb3V0cHV0IGEgcGl4ZWwtcGVy
ZmVjdCBpbWFnZSwgc28gd2UgZG8gdGhlIHNhbWUga2luZCBvZgpjb21wYXJpc29uIHRoYW4gZm9y
IFZHQS4KClNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxp
bi5jb20+Ci0tLQogdGVzdHMva21zX2NoYW1lbGl1bS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2NoYW1lbGl1bS5jIGIv
dGVzdHMva21zX2NoYW1lbGl1bS5jCmluZGV4IDgwYjI3OWM0ZjFjMi4uOGE5ZjZiZmU5MjM1IDEw
MDY0NAotLS0gYS90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKKysrIGIvdGVzdHMva21zX2NoYW1lbGl1
bS5jCkBAIC05NzYsNiArOTc2LDEwIEBAIGlndF9tYWluCiAJCQl0ZXN0X2Rpc3BsYXlfb25lX21v
ZGUoJmRhdGEsIHBvcnQsIERSTV9GT1JNQVRfWFJHQjE1NTUsCiAJCQkJCSAgICAgIENIQU1FTElV
TV9DSEVDS19DUkMsIDEpOwogCisJCWNvbm5lY3Rvcl9zdWJ0ZXN0KCJoZG1pLWNyYy1udjEyIiwg
SERNSUEpCisJCQl0ZXN0X2Rpc3BsYXlfb25lX21vZGUoJmRhdGEsIHBvcnQsIERSTV9GT1JNQVRf
TlYxMiwKKwkJCQkJICAgICAgQ0hBTUVMSVVNX0NIRUNLX0FOQUxPRywgMSk7CisKIAkJY29ubmVj
dG9yX3N1YnRlc3QoImhkbWktZnJhbWUtZHVtcCIsIEhETUlBKQogCQkJdGVzdF9kaXNwbGF5X2Zy
YW1lX2R1bXAoJmRhdGEsIHBvcnQpOwogCX0KLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
