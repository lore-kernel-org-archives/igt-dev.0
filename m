Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9356E2A9
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jul 2018 13:20:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u7-v6so10969606wrn.12
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Jul 2018 06:20:15 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Mon,  9 Jul 2018 14:19:58 +0100
Message-Id: <20180709132004.14468-6-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180709132004.14468-1-tvrtko.ursulin@linux.intel.com>
References: <20180709132004.14468-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 05/11] trace.pl: Fix HTML timestamp
 generation
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
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCk5vdyB0aGF0
IHdlIHNjYWxlIHRpbWVzdGFtcHMgdG8gZ2V0IGJldHRlciB0aW1lbGluZSBncmFudWxhcml0eSwg
dGhlIGhhY2t5CmhhbmQgcm9sbGVkIG1pY3JvLXNlY29uZCB0aW1lIHRvIEhUTUwgZGF0ZSBjb252
ZXJzaW9uIGRvZXMgbm8gbG9uZ2VyIGN1dAppdC4KClVzZSBwZXJsIGJ1aWx0LWluIGdtdGltZSB0
byBoYW5kbGUgdGhpbmdzIHByb3Blcmx5LgoKU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KQ2M6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJy
aXNvbkBJbnRlbC5jb20+Ci0tLQogc2NyaXB0cy90cmFjZS5wbCB8IDE1ICsrKystLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvc2NyaXB0cy90cmFjZS5wbCBiL3NjcmlwdHMvdHJhY2UucGwKaW5kZXggZTI5Nzhl
NTM4MmMyLi5hZWFmMjM5MjE2MmUgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvdHJhY2UucGwKKysrIGIv
c2NyaXB0cy90cmFjZS5wbApAQCAtMzQ2LDI0ICszNDYsMTcgQEAgc3ViIHNhbml0aXplX2N0eAog
c3ViIHRzCiB7CiAJbXkgKCR1cykgPSBAXzsKLQlteSAoJGQsICRoLCAkbSwgJHMpOworCW15ICgk
eSwgJG1vLCAkZCwgJGgsICRtLCAkcyk7CiAKIAkkdXMgKj0gMTAwMCB1bmxlc3MgJG5vX3RpbWVs
aW5lX3NjYWxpbmc7CiAKIAkkcyA9IGludCgkdXMgLyAxMDAwMDAwKTsKIAkkdXMgPSAkdXMgJSAx
MDAwMDAwOwogCi0JJG0gPSBpbnQoJHMgLyA2MCk7Ci0JJHMgPSAkcyAlIDYwOworCSgkcywgJG0s
ICRoLCAkZCwgJG1vLCAkeSkgPSBnbXRpbWUoJHMpOwogCi0JJGggPSBpbnQoJG0gLyA2MCk7Ci0J
JG0gPSAkbSAlIDYwOwotCi0JJGQgPSAxICsgaW50KCRoIC8gMjQpOwotCSRoID0gJGggJSAyNDsK
LQotCXJldHVybiBzcHJpbnRmKCcyMDE3LTAxLSUwMnUgJTAydTolMDJ1OiUwMnUuJTA2dScsCi0J
CSAgICAgICBpbnQoJGQpLCBpbnQoJGgpLCBpbnQoJG0pLCBpbnQoJHMpLCBpbnQoJHVzKSk7CisJ
cmV0dXJuIHNwcmludGYoJyUwNHUtJTAydS0lMDJ1ICUwMnU6JTAydTolMDJ1LiUwNnUnLAorCQkg
ICAgICAgIDE5NzAgKyAkeSwgMSArICRtbywgJGQsICRoLCAkbSwgJHMsIGludCgkdXMpKTsKIH0K
IAogIyBNYWluIGlucHV0IGxvb3AgLSBwYXJzZSBsaW5lcyBhbmQgYnVpbGQgdGhlIGludGVybmFs
IHJlcHJlc2VudGF0aW9uIG9mIHRoZQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
