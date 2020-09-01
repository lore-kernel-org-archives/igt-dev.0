Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D966E48D
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2020 17:31:33 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Tue,  1 Sep 2020 10:34:14 -0700
Message-Id: <20200901173414.15012-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/psr: Check for DRRS enabled in
 no_drrs test
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

Q29tbWl0IGNhYWIyNWRjOWUzNiAoImRybS9pOTE1L2Rpc3BsYXk6IEZpeCBEUlJTIGRlYnVnZnMi
KSBhZGRlZAoiRFJSUyBFbmFibGVkIiB0aGF0IGlzIHNldCB3aGVuIERSUlMgaXMgZW5hYmxlZCBh
bmQgbGVmdAoiRFJSUyBTdXBwb3J0ZWQiIHRvIHJldHVybiBpZiB0aGUgcGFuZWwgc3VwcG9ydHMg
RFJSUy4KClRoZSBsYWNrIG9mIHRoaXMgY2hhbmdlIHdhcyBjYXVzaW5nIG5vX2RycnMgdGVzdHMg
dG8gYWx3YXlzIGZhaWxzIGlmCnBhbmVsIHN1cHBvcnRzIHRoaXMgZmVhdHVyZS4KCkNjOiBHd2Fu
LWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpv
c8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2tt
c19wc3IuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wc3IuYyBiL3Rlc3RzL2ttc19wc3IuYwppbmRl
eCA0OWVhNDQ2YWYuLmFiMTkwNzNlNyAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3Bzci5jCisrKyBi
L3Rlc3RzL2ttc19wc3IuYwpAQCAtMjM0LDcgKzIzNCw3IEBAIHN0YXRpYyBib29sIGRycnNfZGlz
YWJsZWQoZGF0YV90ICpkYXRhKQogCWlndF9kZWJ1Z2ZzX3NpbXBsZV9yZWFkKGRhdGEtPmRlYnVn
ZnNfZmQsICJpOTE1X2RycnNfc3RhdHVzIiwKIAkJCSBidWYsIHNpemVvZihidWYpKTsKIAotCXJl
dHVybiAhc3Ryc3RyKGJ1ZiwgIkRSUlMgU3VwcG9ydGVkOiBZZXNcbiIpOworCXJldHVybiAhc3Ry
c3RyKGJ1ZiwgIkRSUlMgRW5hYmxlZCA6IFllc1xuIik7CiB9CiAKIHN0YXRpYyB2b2lkIHJ1bl90
ZXN0KGRhdGFfdCAqZGF0YSkKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==
