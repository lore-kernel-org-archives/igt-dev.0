Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1466E283
 for <igt-dev@lists.freedesktop.org>; Tue, 22 May 2018 10:58:44 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 22 May 2018 11:58:36 +0100
Message-Id: <20180522105836.4506-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t] lib: Match any Intel /dev/cardN recognised
 by the kernel
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
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0t
LQogbGliL2RybXRlc3QuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2RybXRlc3QuYyBiL2xpYi9kcm10ZXN0
LmMKaW5kZXggZmFlNmY4NmYyLi41ZThhODBjODQgMTAwNjQ0Ci0tLSBhL2xpYi9kcm10ZXN0LmMK
KysrIGIvbGliL2RybXRlc3QuYwpAQCAtMjI5LDggKzIyOSw3IEBAIHN0YXRpYyBpbnQgX19vcGVu
X2RldmljZShjb25zdCBjaGFyICpiYXNlLCBpbnQgb2Zmc2V0LCB1bnNpZ25lZCBpbnQgY2hpcHNl
dCkKIAkJaWYgKGZkID09IC0xKQogCQkJY29udGludWU7CiAKLQkJaWYgKGNoaXBzZXQgJiBEUklW
RVJfSU5URUwgJiYgaXNfaTkxNV9kZXZpY2UoZmQpICYmCi0JCSAgICBoYXNfa25vd25faW50ZWxf
Y2hpcHNldChmZCkpCisJCWlmIChjaGlwc2V0ICYgRFJJVkVSX0lOVEVMICYmIGlzX2k5MTVfZGV2
aWNlKGZkKSkKIAkJCXJldHVybiBmZDsKIAogCQlpZiAoY2hpcHNldCAmIERSSVZFUl9WQzQgJiYg
aXNfdmM0X2RldmljZShmZCkpCi0tIAoyLjE3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
