Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B0B6F560
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2020 09:59:38 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 22 Oct 2020 11:58:57 +0200
Message-Id: <20201022095907.34225-15-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201022095907.34225-1-zbigniew.kempczynski@intel.com>
References: <20201022095907.34225-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 14/24] lib/igt_fb: Initialize intel_buf with
 same size as fb
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

V2UgbmVlZCB0byBoYXZlIHNhbWUgc2l6ZSB3aGVuIGludGVsX2J1ZiBpcyBpbml0aWFsaXplZCBv
dmVyIGZiCih3aXRoIGNvbXByZXNzaW9uKSBiZWNhdXNlIGFsbG9jYXRvciBjb3VsZCBiZSBjYWxs
ZWQgd2l0aCBzbWFsbGVyCnNpemUgd2hhdCBjb3VsZCBsZWFkIHRvIHJlbG9jYXRpb24uCgpVc2Ug
bmV3IGludGVsX2J1ZiBmdW5jdGlvbiB3aGljaCBhbGxvd3MgaW5pdGFsaXplIHdpdGggaGFuZGxl
IGFuZCBzaXplLgoKU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmll
dy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CkNjOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsu
Z3J6ZWdvcnpla0BpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KLS0tCiBsaWIvaWd0X2ZiLmMgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
ZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCA0M2Y4YzQ3NS4uMjA3YTgzOTMgMTAwNjQ0Ci0tLSBh
L2xpYi9pZ3RfZmIuYworKysgYi9saWIvaWd0X2ZiLmMKQEAgLTIxNzIsMTEgKzIxNzIsMTEgQEAg
c3RhdGljIHN0cnVjdCBpbnRlbF9idWYgKmNyZWF0ZV9idWYoc3RydWN0IGZiX2JsaXRfdXBsb2Fk
ICpibGl0LAogCWJvX25hbWUgPSBnZW1fZmxpbmsoYmxpdC0+ZmQsIGZiLT5nZW1faGFuZGxlKTsK
IAloYW5kbGUgPSBnZW1fb3BlbihibGl0LT5mZCwgYm9fbmFtZSk7CiAKLQlidWYgPSBpbnRlbF9i
dWZfY3JlYXRlX3VzaW5nX2hhbmRsZShibGl0LT5ib3BzLCBoYW5kbGUsCi0JCQkJCSAgICBmYi0+
d2lkdGgsIGZiLT5oZWlnaHQsCi0JCQkJCSAgICBmYi0+cGxhbmVfYnBwWzBdLCAwLAotCQkJCQkg
ICAgaWd0X2ZiX21vZF90b190aWxpbmcoZmItPm1vZGlmaWVyKSwKLQkJCQkJICAgIGNvbXByZXNz
aW9uKTsKKwlidWYgPSBpbnRlbF9idWZfY3JlYXRlX3VzaW5nX2hhbmRsZV9hbmRfc2l6ZShibGl0
LT5ib3BzLCBoYW5kbGUsCisJCQkJCQkgICAgIGZiLT53aWR0aCwgZmItPmhlaWdodCwKKwkJCQkJ
CSAgICAgZmItPnBsYW5lX2JwcFswXSwgMCwKKwkJCQkJCSAgICAgaWd0X2ZiX21vZF90b190aWxp
bmcoZmItPm1vZGlmaWVyKSwKKwkJCQkJCSAgICAgY29tcHJlc3Npb24sIGZiLT5zaXplKTsKIAlp
bnRlbF9idWZfc2V0X25hbWUoYnVmLCBuYW1lKTsKIAogCS8qIE1ha2Ugc3VyZSB3ZSBjbG9zZSBo
YW5kbGUgb24gZGVzdHJveSBwYXRoICovCi0tIAoyLjI2LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
