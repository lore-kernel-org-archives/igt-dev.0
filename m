Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821CD6E9F6
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2019 11:33:09 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id q14so1866159edr.5
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Apr 2019 04:33:09 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu,  4 Apr 2019 13:33:00 +0200
Message-Id: <20190404113300.10527-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: Improve asserts for expired
 vblank tests
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
Cc: "Peres, Martin" <martin.peres@intel.com>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U3RlcCAxIGluIGRlYnVnZ2luZzogQWN0dWFsbHkgdW5kZXJzdGFuZCB3aGF0J3MgZ29pbmcgd3Jv
bmcuCgpSZWZlcmVuY2VzOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNn
aT9pZD0xMDI4ODcKQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNv
bT4KQ2M6ICJQZXJlcywgTWFydGluIiA8bWFydGluLnBlcmVzQGludGVsLmNvbT4KU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogdGVzdHMv
a21zX2ZsaXAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mbGlwLmMgYi90ZXN0cy9rbXNfZmxpcC5j
CmluZGV4IGRmYTVhNjllOGYyOC4uN2MyYWEwYzAyYTBlIDEwMDc1NQotLS0gYS90ZXN0cy9rbXNf
ZmxpcC5jCisrKyBiL3Rlc3RzL2ttc19mbGlwLmMKQEAgLTY4MSw3ICs2ODEsNyBAQCBzdGF0aWMg
dW5zaWduZWQgaW50IHJ1bl90ZXN0X3N0ZXAoc3RydWN0IHRlc3Rfb3V0cHV0ICpvKQogCQkJCQkg
ICAgVEVTVF9WQkxBTktfQkxPQ0ssIG8tPnBpcGUsIGV4cF9zZXEsCiAJCQkJCSAgICAwLCAmcmVw
bHkpKTsKIAkJaWd0X2Fzc2VydChnZXR0aW1lX3VzKCkgLSBzdGFydCA8IDUwMCk7Ci0JCWlndF9h
c3NlcnQocmVwbHkuc2VxdWVuY2UgPT0gZXhwX3NlcSk7CisJCWlndF9hc3NlcnRfZXEocmVwbHku
c2VxdWVuY2UsIGV4cF9zZXEpOwogCQlpZ3RfYXNzZXJ0KHRpbWVyY21wKCZyZXBseS50cywgJm8t
PmZsaXBfc3RhdGUubGFzdF90cywgPT0pKTsKIAl9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
