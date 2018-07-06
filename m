Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AE66F0A7
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jul 2018 16:39:44 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  6 Jul 2018 19:39:40 +0300
Message-Id: <20180706163940.7699-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_draw: Zero initalize the igt_bufs
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkkg
bWlzc2VkIHRoZXNlIHdoZW4gc3ByaW5rbGluZyB0aGUgbWVtc2V0cy4gVXNpbmcgc3RhY2sgZ2Fy
YmFnZSBhcyB0aGUKYXV4IHN1cmZhY2Ugc3RhdGUgaXNuJ3QgYSBnb29kIGlkZWEuIENhdXNlcyBr
bXNfZnJvbnRfYnVmZmVyX3RyYWNraW5nCnRvIGZhaWwgb24gc2tsKy4KCkZpeGVzOiBhNDM5M2Mz
OTUxZWMgKCJsaWI6IEFkZCBhdXggc3VyZmFjZSBzdGF0ZSB0byBpZ3RfYnVmIikKU2lnbmVkLW9m
Zi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0t
CiBsaWIvaWd0X2RyYXcuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZHJhdy5jIGIvbGliL2lndF9kcmF3
LmMKaW5kZXggZWJhZTkxNTExM2RhLi5jN2Q1NzcwZGNhMjggMTAwNjQ0Ci0tLSBhL2xpYi9pZ3Rf
ZHJhdy5jCisrKyBiL2xpYi9pZ3RfZHJhdy5jCkBAIC01NjgsNyArNTY4LDcgQEAgc3RhdGljIHZv
aWQgZHJhd19yZWN0X3JlbmRlcihpbnQgZmQsIHN0cnVjdCBjbWRfZGF0YSAqY21kX2RhdGEsCiAJ
ZHJtX2ludGVsX2JvICpzcmMsICpkc3Q7CiAJdWludDMyX3QgZGV2aWQgPSBpbnRlbF9nZXRfZHJt
X2RldmlkKGZkKTsKIAlpZ3RfcmVuZGVyX2NvcHlmdW5jX3QgcmVuZGVyY29weSA9IGlndF9nZXRf
cmVuZGVyX2NvcHlmdW5jKGRldmlkKTsKLQlzdHJ1Y3QgaWd0X2J1ZiBzcmNfYnVmLCBkc3RfYnVm
OworCXN0cnVjdCBpZ3RfYnVmIHNyY19idWYgPSB7fSwgZHN0X2J1ZiA9IHt9OwogCXN0cnVjdCBp
bnRlbF9iYXRjaGJ1ZmZlciAqYmF0Y2g7CiAJdWludDMyX3QgdGlsaW5nLCBzd2l6emxlOwogCXN0
cnVjdCBidWZfZGF0YSB0bXA7Ci0tIAoyLjE2LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
