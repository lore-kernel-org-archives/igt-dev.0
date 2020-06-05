Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id E832B6E913
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2020 14:37:23 +0000 (UTC)
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
Date: Fri,  5 Jun 2020 16:37:20 +0200
Message-Id: <20200605143720.710220-1-michel@daenzer.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] kms_cursor_legacy: Keep primary plane enabled for
 XRGB overlay fallback
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+CgpUaGlzIGFsbG93cyB0
aGUgdGVzdCB0byB3b3JrIG9uIHNldHVwcyB3aGVyZSB0aGUgcHJpbWFyeSBwbGFuZSBjYW5ub3QK
YmUgZGlzYWJsZWQgd2hpbGUgdGhlIENSVEMgaXMgZW5hYmxlZC4KCkl0IHNob3VsZCBtYWtlIG5v
IGRpZmZlcmVuY2UgZm9yIHRoZSBvdXRwdXQuCgpTaWduZWQtb2ZmLWJ5OiBNaWNoZWwgRMOkbnpl
ciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4KLS0tCiB0ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeS5jIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9r
bXNfY3Vyc29yX2xlZ2FjeS5jIGIvdGVzdHMva21zX2N1cnNvcl9sZWdhY3kuYwppbmRleCA5MzA2
ZTU0Yi4uMzQ0NDQyZTggMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19jdXJzb3JfbGVnYWN5LmMKKysr
IGIvdGVzdHMva21zX2N1cnNvcl9sZWdhY3kuYwpAQCAtMzI2LDYgKzMyNiw3IEBAIHN0YXRpYyB2
b2lkIHRyYW5zaXRpb25fbm9uYmxvY2tpbmcoaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSwgZW51bSBw
aXBlIHBpcGVfaWQsCiAKIAkJaWd0X2Fzc2VydChyZXQgPT0gLUVJTlZBTCk7CiAKKwkJaWd0X3Bs
YW5lX3NldF9mYihwcmltYXJ5LCBwcmltX2ZiKTsKIAkJaWd0X3BsYW5lX3NldF9mYihzcHJpdGUs
IHByaW1fZmIpOwogCX0KIAlpZ3RfZGlzcGxheV9jb21taXRfYXRvbWljKGRpc3BsYXksIERSTV9N
T0RFX0FUT01JQ19OT05CTE9DSyB8IERSTV9NT0RFX1BBR0VfRkxJUF9FVkVOVCwgZGlzcGxheSk7
Ci0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
