Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BC16E525
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Oct 2018 19:56:05 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  3 Oct 2018 20:56:00 +0100
Message-Id: <20181003195600.19023-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Remove incomplete assert from
 igt_require_fb_modifiers()
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

U2luY2UgdGhlIGlndF9hc3NlcnQgaXMgZmFyIGZyb20gY29tcGxldGUgYW5kIGRvZXMgbm90IGVu
dW1lcmF0ZSBhbGwgdGhlCnBvc3NpYmxlIHZhbGlkIHZhbHVlcywgcmVzdHJpY3QgdGhlIGZ1bmN0
aW9uIHRvIGRvIG9ubHkgd2hhdCBpdCBzYXlzIGl0CndpbGwgZG8sIGNoZWNrIGZvciB0aGUgcmVx
dWlyZWQgZmIgbW9kaWZpZXJzLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0Bj
aHJpcy13aWxzb24uY28udWs+Ci0tLQogbGliL2lvY3RsX3dyYXBwZXJzLmMgfCAxIC0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lvY3RsX3dyYXBwZXJz
LmMgYi9saWIvaW9jdGxfd3JhcHBlcnMuYwppbmRleCA1YWQ2ODJmNS4uNTI5ZWFlMzYgMTAwNjQ0
Ci0tLSBhL2xpYi9pb2N0bF93cmFwcGVycy5jCisrKyBiL2xpYi9pb2N0bF93cmFwcGVycy5jCkBA
IC0xNjY3LDcgKzE2NjcsNiBAQCB2b2lkIGlndF9yZXF1aXJlX2ZiX21vZGlmaWVycyhpbnQgZmQp
CiAJCWludCByZXQ7CiAKIAkJcmV0ID0gZHJtR2V0Q2FwKGZkLCBEUk1fQ0FQX0FEREZCMl9NT0RJ
RklFUlMsICZjYXBfbW9kaWZpZXJzKTsKLQkJaWd0X2Fzc2VydChyZXQgPT0gMCB8fCBlcnJubyA9
PSBFSU5WQUwpOwogCQloYXNfbW9kaWZpZXJzID0gcmV0ID09IDAgJiYgY2FwX21vZGlmaWVycyA9
PSAxOwogCQljYXBfbW9kaWZpZXJzX3Rlc3RlZCA9IHRydWU7CiAJfQotLSAKMi4xOS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
