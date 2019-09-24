Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2163D89113
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2019 09:19:59 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 24 Sep 2019 10:19:43 +0100
Message-Id: <20190924091943.27967-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Chomp away trailing spaces from
 cmdline
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QSBtaW5vciByZWZpbmVtZW50IHRvIHJlbW92ZSB0aGUgdHJhaWxpbmcgc3BhY2VzIGFmdGVyIGNv
bnZlcnRpbmcgdGhlCk5VTC10ZXJtaW5hdG9ycyB0byBzcGFjZXMuCgpTaWduZWQtb2ZmLWJ5OiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IFBldHJpIExhdHZhbGEg
PHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgotLS0KIHJ1bm5lci9leGVjdXRvci5jIHwgNCArKysr
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcnVubmVyL2V4
ZWN1dG9yLmMgYi9ydW5uZXIvZXhlY3V0b3IuYwppbmRleCAzZTAxMjE0MjEuLjEzMGJhMzhkMiAx
MDA2NDQKLS0tIGEvcnVubmVyL2V4ZWN1dG9yLmMKKysrIGIvcnVubmVyL2V4ZWN1dG9yLmMKQEAg
LTYzMCw2ICs2MzAsMTAgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmdldF9jbWRsaW5lKHBpZF90IHBp
ZCwgY2hhciAqYnVmLCBzc2l6ZV90IGxlbikKIAkJaWYgKGJ1ZltpXSA9PSAnXDAnKQogCQkJYnVm
W2ldID0gJyAnOwogCisJLyogY2hvbXAgYXdheSB0aGUgdHJhaWxpbmcgc3BhY2VzICovCisJd2hp
bGUgKGJ1ZltsZW4gLSAxXSA9PSAnICcpCisJCS0tbGVuOworCiAJYnVmW2xlbl0gPSAnXDAnOyAv
KiBidXQgbWFrZSBzdXJlIHRoYXQgd2UgcmV0dXJuIGEgdmFsaWQgc3RyaW5nISAqLwogCXJldHVy
biBidWY7CiB9Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
