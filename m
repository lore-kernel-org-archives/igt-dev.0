Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302F589F6F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:37:43 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id i34so9080990pgl.9
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:37:43 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:36:35 -0500
Message-Id: <20210614163704.365989-21-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 20/77] tests/i915/gem_ctx_exec: Stop cloning
 contexts in close_race
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

Tm90aGluZyBpbiB0aGlzIHN1YnRlc3Qgc2V0cyB0aGUgc2V0IG9mIGVuZ2luZXMgb24gY3R4MCBz
byB0aGVyZSdzIG5vCnBvaW50IGluIGNsb25pbmcgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEphc29u
IEVrc3RyYW5kIDxqYXNvbkBqbGVrc3RyYW5kLm5ldD4KUmV2aWV3ZWQtYnk6IFpiaWduaWV3IEtl
bXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgotLS0KIHRlc3RzL2k5
MTUvZ2VtX2N0eF9leGVjLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2N0eF9leGVj
LmMgYi90ZXN0cy9pOTE1L2dlbV9jdHhfZXhlYy5jCmluZGV4IGE4NjE2Zjk1Yy4uNmRiMmQ1OTgz
IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9jdHhfZXhlYy5jCisrKyBiL3Rlc3RzL2k5MTUv
Z2VtX2N0eF9leGVjLmMKQEAgLTM1MSw3ICszNTEsNyBAQCBzdGF0aWMgdm9pZCBjbG9zZV9yYWNl
KGludCBpOTE1KQogCWlndF9hc3NlcnQoY29udGV4dHMgIT0gTUFQX0ZBSUxFRCk7CiAKIAlmb3Ig
KGludCBjaGlsZCA9IDA7IGNoaWxkIDwgbmNwdXM7IGNoaWxkKyspCi0JCWNvbnRleHRzW2NoaWxk
XSA9IGdlbV9jb250ZXh0X2Nsb25lX3dpdGhfZW5naW5lcyhpOTE1LCAwKTsKKwkJY29udGV4dHNb
Y2hpbGRdID0gZ2VtX2NvbnRleHRfY3JlYXRlKGk5MTUpOwogCiAJaWd0X2ZvcmsoY2hpbGQsIG5j
cHVzKSB7CiAJCXNwaW4gPSBfX2lndF9zcGluX25ldyhpOTE1LCAuZmxhZ3MgPSBJR1RfU1BJTl9Q
T0xMX1JVTik7CkBAIC00MDUsOCArNDA1LDcgQEAgc3RhdGljIHZvaWQgY2xvc2VfcmFjZShpbnQg
aTkxNSkKIAkJICovCiAJCWZvciAoaW50IGNoaWxkID0gMDsgY2hpbGQgPCBuY3B1czsgY2hpbGQr
KykgewogCQkJZ2VtX2NvbnRleHRfZGVzdHJveShpOTE1LCBjb250ZXh0c1tjaGlsZF0pOwotCQkJ
Y29udGV4dHNbY2hpbGRdID0KLQkJCQlnZW1fY29udGV4dF9jbG9uZV93aXRoX2VuZ2luZXMoaTkx
NSwgMCk7CisJCQljb250ZXh0c1tjaGlsZF0gPSBnZW1fY29udGV4dF9jcmVhdGUoaTkxNSk7CiAJ
CX0KIAkJdXNsZWVwKDEwMDAgKyBoYXJzX3BldHJ1c2thX2Y1NF8xX3JhbmRvbV91bnNhZmUoKSAl
IDIwMDApOwogCX0KLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
