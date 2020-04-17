Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBBC6EB87
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 10:19:10 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c138so880836pfc.0
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 03:19:10 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Fri, 17 Apr 2020 13:18:54 +0300
Message-Id: <20200417101855.7759-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: survive cdclk caused
 modeset
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

SW4gbWlkIHRlc3Qgc3RhcnRpbmcgdG8gdXNlIGhpZ2hlciBicHAgcGl4ZWwgZm9ybWF0IChzYXkg
NjRicHApCmNhbiBjYXVzZSBtb2Rlc2V0LiBBbGxvdyB0aGF0IG1vZGVzZXQgdG8gaGFwcGVuLgoK
djIgVmlsbGUgU3lyasOkbMOkOiB1c2UgRFJNX01PREVfQVRPTUlDX0FMTE9XX01PREVTRVQgaW5z
dGVhZApvZiBibG9ja2luZy4KCkZpeGVzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL2ludGVsL2lzc3Vlcy8xMjE0CgpTaWduZWQtb2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxh
IDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPgotLS0KIHRlc3RzL2ttc19wbGFuZS5jIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9r
bXNfcGxhbmUuYyBiL3Rlc3RzL2ttc19wbGFuZS5jCmluZGV4IDgwNTc5NWNkLi5jNmVhZDgxMyAx
MDA2NDQKLS0tIGEvdGVzdHMva21zX3BsYW5lLmMKKysrIGIvdGVzdHMva21zX3BsYW5lLmMKQEAg
LTU3NCw2ICs1NzQsNyBAQCBzdGF0aWMgdm9pZCBjYXB0dXJlX2Zvcm1hdF9jcmNzKGRhdGFfdCAq
ZGF0YSwgZW51bSBwaXBlIHBpcGUsCiAJCQkgKiBhd2FpdHMgdG8gYmUgbGF0Y2hlZC4KIAkJCSAq
LwogCQkJaWd0X2Rpc3BsYXlfY29tbWl0X2F0b21pYygmZGF0YS0+ZGlzcGxheSwKKwkJCQkJCSAg
RFJNX01PREVfQVRPTUlDX0FMTE9XX01PREVTRVQgfAogCQkJCQkJICBEUk1fTU9ERV9BVE9NSUNf
Tk9OQkxPQ0sgfAogCQkJCQkJICBEUk1fTU9ERV9QQUdFX0ZMSVBfRVZFTlQsIE5VTEwpOwogCQl9
IGVsc2UgewotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
