Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412976E566
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Feb 2019 18:02:22 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x7so788656eds.8
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Feb 2019 10:02:22 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 11 Feb 2019 19:02:03 +0100
Message-Id: <20190211180208.29406-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20190211180208.29406-1-daniel.vetter@ffwll.ch>
References: <20190211180208.29406-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/9] tests/gem_exec_reuse: Don't leak the
 hang detector
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

TXkgbmV3ICJhcmUgdGhlcmUgYW55IGNoaWxkIHByb2Nlc3NlcyBsZWZ0PyIgY2hlY2sgaW4gaWd0
X2V4aXQgY2F0Y2hlZAp0aGlzIG9uZS4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIHRlc3RzL2k5MTUvZ2VtX2V4ZWNfcmV1c2UuYyB8
IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVz
dHMvaTkxNS9nZW1fZXhlY19yZXVzZS5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19yZXVzZS5jCmlu
ZGV4IGRmMjIwYmU3YmFiOC4uNTU5MDQ3MTg4ZmJkIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dl
bV9leGVjX3JldXNlLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19yZXVzZS5jCkBAIC0yMTMs
NCArMjEzLDcgQEAgaWd0X21haW4KIAkJZm9yIChuID0gMDsgbiA8IG5jb250ZXh0czsgbisrKQog
CQkJZ2VtX2NvbnRleHRfZGVzdHJveShuby5mZCwgY29udGV4dHNbbl0pOwogCX0KKworCWlndF9m
aXh0dXJlCisJCWlndF9zdG9wX2hhbmdfZGV0ZWN0b3IoKTsKIH0KLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
