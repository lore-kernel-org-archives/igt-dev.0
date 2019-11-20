Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8171F6E9CE
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2019 18:10:22 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 20 Nov 2019 19:10:14 +0100
Message-Id: <20191120181014.23733-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/intel_aux_pgtable: Removing duplicate
 max macro definition
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

UmVtb3ZlIGNvZGUgZHVwbGljYXRpb24gd2hpY2ggY291bGQgbGVhZCB0byB3YXJuaW5nIHdoZW4g
aGVhZGVyCmluIHRoZSBpbmNsdWRlIGhpZXJhcmNoeSB3aWxsIGluY2x1ZGUgaWd0X2F1eC5oLgoK
U2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNr
aUBpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
LS0tCiBsaWIvaW50ZWxfYXV4X3BndGFibGUuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2ludGVsX2F1eF9w
Z3RhYmxlLmMgYi9saWIvaW50ZWxfYXV4X3BndGFibGUuYwppbmRleCBlYTkwOWVjMC4uNzVjZmRk
MjAgMTAwNjQ0Ci0tLSBhL2xpYi9pbnRlbF9hdXhfcGd0YWJsZS5jCisrKyBiL2xpYi9pbnRlbF9h
dXhfcGd0YWJsZS5jCkBAIC0yLDYgKzIsNyBAQAogI2luY2x1ZGUgPHN0ZGludC5oPgogCiAjaW5j
bHVkZSAiZHJtdGVzdC5oIgorI2luY2x1ZGUgImlndF9hdXguaCIKICNpbmNsdWRlICJpbnRlbF9h
dXhfcGd0YWJsZS5oIgogI2luY2x1ZGUgImludGVsX2JhdGNoYnVmZmVyLmgiCiAjaW5jbHVkZSAi
aW50ZWxfYnVmbWdyLmgiCkBAIC0zMSw4ICszMiw2IEBACiAKICNkZWZpbmUgR0ZYX0FERFJFU1Nf
QklUUwk0OAogCi0jZGVmaW5lIG1heChhLCBiKQkJKChhKSA+IChiKSA/IChhKSA6IChiKSkKLQog
c3RydWN0IHBndGFibGVfbGV2ZWxfZGVzYyB7CiAJaW50IGlkeF9zaGlmdDsKIAlpbnQgaWR4X2Jp
dHM7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
