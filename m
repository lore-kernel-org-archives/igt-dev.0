Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from 6.mo2.mail-out.ovh.net (6.mo2.mail-out.ovh.net [87.98.165.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F3C8935B
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 01:03:36 +0000 (UTC)
Received: from player789.ha.ovh.net (unknown [10.108.35.13])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 83F1A195984
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 02:47:37 +0200 (CEST)
From: Andi Shyti <andi@etezian.org>
Date: Mon, 13 May 2019 03:45:08 +0300
Message-Id: <20190513004508.8042-15-andi@etezian.org>
In-Reply-To: <20190513004508.8042-1-andi@etezian.org>
References: <20190513004508.8042-1-andi@etezian.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v23 14/14] test/i915: i915_hangman: use the
 gem_engine_topology library
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
To: IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+CgpSZXBsYWNlIHRoZSBsZWdh
Y3kgZm9yX2VhY2hfZW5naW5lKiBkZWZpbmVzIHdpdGggdGhlIG9uZXMKaW1wbGVtZW50ZWQgaW4g
dGhlIGdlbV9lbmdpbmVfdG9wb2xvZ3kgbGlicmFyeS4KClNpZ25lZC1vZmYtYnk6IEFuZGkgU2h5
dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgpDYzogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFs
YUBsaW51eC5pbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KLS0tCiB0ZXN0cy9pOTE1L2k5MTVfaGFuZ21hbi5jIHwgMTUgKysrKy0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS90ZXN0cy9pOTE1L2k5MTVfaGFuZ21hbi5jIGIvdGVzdHMvaTkxNS9pOTE1X2hhbmdt
YW4uYwppbmRleCA5YTFkNTg4OTdjYTEuLmJiNTUyMWUwM2RkMyAxMDA2NDQKLS0tIGEvdGVzdHMv
aTkxNS9pOTE1X2hhbmdtYW4uYworKysgYi90ZXN0cy9pOTE1L2k5MTVfaGFuZ21hbi5jCkBAIC0y
NTYsNyArMjU2LDcgQEAgc3RhdGljIHZvaWQgaGFuZ2NoZWNrX3VudGVybWluYXRlZCh2b2lkKQog
CiBpZ3RfbWFpbgogewotCWNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lICplOwor
CWNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZTsKIAlpZ3RfaGFuZ190IGhh
bmcgPSB7fTsKIAogCWlndF9za2lwX29uX3NpbXVsYXRpb24oKTsKQEAgLTI3NiwxNiArMjc2LDkg
QEAgaWd0X21haW4KIAlpZ3Rfc3VidGVzdCgiZXJyb3Itc3RhdGUtYmFzaWMiKQogCQl0ZXN0X2Vy
cm9yX3N0YXRlX2Jhc2ljKCk7CiAKLQlmb3IgKGUgPSBpbnRlbF9leGVjdXRpb25fZW5naW5lczsg
ZS0+bmFtZTsgZSsrKSB7Ci0JCWlmIChlLT5leGVjX2lkID09IDApCi0JCQljb250aW51ZTsKLQot
CQlpZ3Rfc3VidGVzdF9mKCJlcnJvci1zdGF0ZS1jYXB0dXJlLSVzIiwgZS0+bmFtZSkgewotCQkJ
aWd0X3JlcXVpcmUoZ2VtX3JpbmdfaGFzX3BoeXNpY2FsX2VuZ2luZShkZXZpY2UsIGUtPmV4ZWNf
aWQgfCBlLT5mbGFncykpOwotCQkJdGVzdF9lcnJvcl9zdGF0ZV9jYXB0dXJlKGUtPmV4ZWNfaWQg
fCBlLT5mbGFncywKLQkJCQkJCSBlLT5mdWxsX25hbWUpOwotCQl9Ci0JfQorCV9fZm9yX2VhY2hf
cGh5c2ljYWxfZW5naW5lKGRldmljZSwgZSkKKwkJaWd0X3N1YnRlc3RfZigiZXJyb3Itc3RhdGUt
Y2FwdHVyZS0lcyIsIGUtPm5hbWUpCisJCQl0ZXN0X2Vycm9yX3N0YXRlX2NhcHR1cmUoZS0+Zmxh
Z3MsIGUtPm5hbWUpOwogCiAJaWd0X3N1YnRlc3QoImhhbmdjaGVjay11bnRlcm1pbmF0ZWQiKQog
CQloYW5nY2hlY2tfdW50ZXJtaW5hdGVkKCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
