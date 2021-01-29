Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F746EB50
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jan 2021 14:45:31 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 29 Jan 2021 15:44:37 +0100
Message-Id: <20210129144454.121178-15-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210129144454.121178-1-zbigniew.kempczynski@intel.com>
References: <20210129144454.121178-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v18 14/31] lib/igt_fb: Initialize intel_buf
 with same size as fb
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

V2UgbmVlZCB0byBoYXZlIHNhbWUgc2l6ZSB3aGVuIGludGVsX2J1ZiBpcyBpbml0aWFsaXplZCBv
dmVyIGZiCih3aXRoIGNvbXByZXNzaW9uKSBiZWNhdXNlIGFsbG9jYXRvciBjb3VsZCBiZSBjYWxs
ZWQgd2l0aCBzbWFsbGVyCnNpemUgd2hhdCBjb3VsZCBsZWFkIHRvIHJlbG9jYXRpb24uCgpVc2Ug
bmV3IGludGVsX2J1ZiBmdW5jdGlvbiB3aGljaCBhbGxvd3MgaW5pdGFsaXplIHdpdGggaGFuZGxl
IGFuZCBzaXplLgoKU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmll
dy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CkNjOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsu
Z3J6ZWdvcnpla0BpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KLS0tCiBsaWIvaWd0X2ZiLmMgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
ZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCA0YjliZTQ3ZWIuLjM3NWQzYTM1ZiAxMDA2NDQKLS0t
IGEvbGliL2lndF9mYi5jCisrKyBiL2xpYi9pZ3RfZmIuYwpAQCAtMjE3NCwxMSArMjE3NCwxMSBA
QCBpZ3RfZmJfY3JlYXRlX2ludGVsX2J1ZihpbnQgZmQsIHN0cnVjdCBidWZfb3BzICpib3BzLAog
CWJvX25hbWUgPSBnZW1fZmxpbmsoZmQsIGZiLT5nZW1faGFuZGxlKTsKIAloYW5kbGUgPSBnZW1f
b3BlbihmZCwgYm9fbmFtZSk7CiAKLQlidWYgPSBpbnRlbF9idWZfY3JlYXRlX3VzaW5nX2hhbmRs
ZShib3BzLCBoYW5kbGUsCi0JCQkJCSAgICBmYi0+d2lkdGgsIGZiLT5oZWlnaHQsCi0JCQkJCSAg
ICBmYi0+cGxhbmVfYnBwWzBdLCAwLAotCQkJCQkgICAgaWd0X2ZiX21vZF90b190aWxpbmcoZmIt
Pm1vZGlmaWVyKSwKLQkJCQkJICAgIGNvbXByZXNzaW9uKTsKKwlidWYgPSBpbnRlbF9idWZfY3Jl
YXRlX3VzaW5nX2hhbmRsZV9hbmRfc2l6ZShib3BzLCBoYW5kbGUsCisJCQkJCQkgICAgIGZiLT53
aWR0aCwgZmItPmhlaWdodCwKKwkJCQkJCSAgICAgZmItPnBsYW5lX2JwcFswXSwgMCwKKwkJCQkJ
CSAgICAgaWd0X2ZiX21vZF90b190aWxpbmcoZmItPm1vZGlmaWVyKSwKKwkJCQkJCSAgICAgY29t
cHJlc3Npb24sIGZiLT5zaXplKTsKIAlpbnRlbF9idWZfc2V0X25hbWUoYnVmLCBuYW1lKTsKIAog
CS8qIE1ha2Ugc3VyZSB3ZSBjbG9zZSBoYW5kbGUgb24gZGVzdHJveSBwYXRoICovCi0tIAoyLjI2
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
