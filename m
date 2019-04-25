Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2560891C3
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 15:43:48 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g3so59560wrx.9
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 08:43:48 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 25 Apr 2019 16:43:15 +0100
Message-Id: <20190425154315.31644-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/core_unauth_vs_render: temporary
 disable the test
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

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClRoZSBrZXJu
ZWwgcGF0Y2ggY2F1c2VkIGEgcmVncmVzc2lvbiwgaGlnaGxpZ2h0aW5nIGJ1ZyBpbiB0aGUgUkFE
VgppbXBsZW1lbnRhdGlvbiwgYW5kIHdhcyByZXZlcnRlZC4gVGhlIHBhdGNoIHdpbGwgYmUgcmVp
bnN0YXRlZCwgbGlrZWx5CmluIGRpZmZlcmVudCBmb3JtLCBhbHRob3VnaCB1bnRpbCB0aGVuIGRp
c2FibGUgdGhlIHRlc3QuCgpTZWUgdGhlIHRocmVhZCBmb3IgZGV0YWlscy4KCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUFwcmlsLzIxNTAxOC5o
dG1sCkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogTWFydGlu
IFBlcmVzIDxtYXJ0aW4ucGVyZXNAbGludXguaW50ZWwuY29tPgpSZXBvcnRlZC1ieTogTWFydGlu
IFBlcmVzIDxtYXJ0aW4ucGVyZXNAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBFbWls
IFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgotLS0KUGxlYXNlIGFkZCB0aGUg
YnVnemlsbGEvb3RoZXIgdGFncyBhbmQgcHVzaCB0aGlzIGZvciBtZS4gSSBoYXZlIGNvbW1pdAph
Y2Nlc3MsIHlldCBhbSByZWFsbHkgc2hvcnQgb24gdGltZSBhdCB0aGUgbW9tZW50IDotKAotLS0K
IHRlc3RzL2NvcmVfYXV0aC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvY29yZV9hdXRoLmMgYi90ZXN0cy9jb3JlX2F1dGguYwpp
bmRleCAxYmRjMjI2MS4uYTQyNzUzMTcgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2NvcmVfYXV0aC5jCisr
KyBiL3Rlc3RzL2NvcmVfYXV0aC5jCkBAIC0xOTQsNiArMTk0LDcgQEAgc3RhdGljIHZvaWQgdGVz
dF9iYXNpY19hdXRoKGludCBtYXN0ZXIpCiAJY2xvc2Uoc2xhdmUpOwogfQogCisjaWYgMAogc3Rh
dGljIGJvb2wgaGFzX3ByaW1lX2ltcG9ydChpbnQgZmQpCiB7CiAJdWludDY0X3QgdmFsdWU7CkBA
IC0yOTIsNiArMjkzLDcgQEAgc3RhdGljIHZvaWQgdGVzdF91bmF1dGhfdnNfcmVuZGVyKGludCBt
YXN0ZXIpCiAKIAljbG9zZShzbGF2ZSk7CiB9CisjZW5kaWYKIAogaWd0X21haW4KIHsKQEAgLTMz
Miw2ICszMzQsNyBAQCBpZ3RfbWFpbgogCQkJdGVzdF9tYW55X21hZ2ljcyhtYXN0ZXIpOwogCX0K
IAorI2lmIDAKIAlpZ3Rfc3VidGVzdF9ncm91cCB7CiAJCWlndF9maXh0dXJlCiAJCQltYXN0ZXIg
PSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0FOWSk7CkBAIC0zNDQsNCArMzQ3LDUgQEAgaWd0X21h
aW4KIAkJCWlndF93YWl0Y2hpbGRyZW4oKTsKIAkJfQogCX0KKyNlbmRpZgogfQotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
