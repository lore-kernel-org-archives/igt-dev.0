Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DC66E174
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jul 2018 13:20:14 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c13-v6so10929366wrt.1
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Jul 2018 06:20:13 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Mon,  9 Jul 2018 14:19:56 +0100
Message-Id: <20180709132004.14468-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180709132004.14468-1-tvrtko.ursulin@linux.intel.com>
References: <20180709132004.14468-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 03/11] trace.pl: Scale timeline for better
 precision
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
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCnZpcyBsaWJy
YXJ5IGhhcyBhIGxpbWl0ZWQgcHJlY2lzaW9uIGNvbXBhcmVkIHRvIG91ciB0cmFjZSBkYXRhIHdo
aWNoCnByZXZlbnRzIHpvb21pbmcgaW50byB0aGUgdGltZWxpbmUgYW5kIHNlZWluZyB0aGUgZmlu
ZSBkZXRhaWwuCgpTY2FsZSB0aGUgSFRNTCB2aWV3IGJ5IGEgdGhvdXNhbmQgdG8gd29yayBhcm91
bmQgaXQuCgpTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50
ZWwuY29tPgpTdWdnZXN0ZWQtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRl
bC5jb20+CkNjOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPgotLS0K
IHNjcmlwdHMvdHJhY2UucGwgfCAxNiArKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvdHJhY2UucGwgYi9zY3JpcHRz
L3RyYWNlLnBsCmluZGV4IDFlYzhiMjk3ZDE1ZS4uNGQzZTA2NDM0ZjA1IDEwMDc1NQotLS0gYS9z
Y3JpcHRzL3RyYWNlLnBsCisrKyBiL3NjcmlwdHMvdHJhY2UucGwKQEAgLTQwLDYgKzQwLDcgQEAg
bXkgJHRyYWNlID0gMDsKIG15ICRhdmdfZGVsYXlfc3RhdHMgPSAwOwogbXkgJGdwdV90aW1lbGlu
ZSA9IDA7CiBteSAkY29sb3VyX2NvbnRleHRzID0gMDsKK215ICRub190aW1lbGluZV9zY2FsaW5n
ID0gMDsKIAogbXkgQGFyZ3M7CiAKQEAgLTI4MSw2ICsyODIsMTggQEAgc3ViIGFyZ19jb2xvdXJf
Y29udGV4dHMKIAlyZXR1cm4gQF87CiB9CiAKK3N1YiBhcmdfbm9fdGltZWxpbmVfc2NhbGluZwor
eworCXJldHVybiB1bmxlc3Mgc2NhbGFyKEBfKTsKKworCWlmICgkX1swXSBlcSAnLS1uby10aW1l
bGluZS1zY2FsaW5nJykgeworCQlzaGlmdCBAXzsKKwkJJG5vX3RpbWVsaW5lX3NjYWxpbmcgPSAx
OworCX0KKworCXJldHVybiBAXzsKK30KKwogQGFyZ3MgPSBAQVJHVjsKIHdoaWxlIChAYXJncykg
ewogCW15ICRsZWZ0ID0gc2NhbGFyKEBhcmdzKTsKQEAgLTI5Niw2ICszMDksNyBAQCB3aGlsZSAo
QGFyZ3MpIHsKIAlAYXJncyA9IGFyZ19pZ25vcmVfcmluZyhAYXJncyk7CiAJQGFyZ3MgPSBhcmdf
c2tpcF9ib3goQGFyZ3MpOwogCUBhcmdzID0gYXJnX2NvbG91cl9jb250ZXh0cyhAYXJncyk7CisJ
QGFyZ3MgPSBhcmdfbm9fdGltZWxpbmVfc2NhbGluZyhAYXJncyk7CiAKIAlsYXN0IGlmICRsZWZ0
ID09IHNjYWxhcihAYXJncyk7CiB9CkBAIC0zMzQsNiArMzQ4LDggQEAgc3ViIHRzCiAJbXkgKCR1
cykgPSBAXzsKIAlteSAoJGQsICRoLCAkbSwgJHMpOwogCisJJHVzICo9IDEwMDAgdW5sZXNzICRu
b190aW1lbGluZV9zY2FsaW5nOworCiAJJHMgPSBpbnQoJHVzIC8gMTAwMDAwMCk7CiAJJHVzID0g
JHVzICUgMTAwMDAwMDsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
