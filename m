Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from 1.mo2.mail-out.ovh.net (1.mo2.mail-out.ovh.net [46.105.63.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6B88935A
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 01:03:26 +0000 (UTC)
Received: from player793.ha.ovh.net (unknown [10.109.159.35])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 43594195911
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 02:46:50 +0200 (CEST)
From: Andi Shyti <andi@etezian.org>
Date: Mon, 13 May 2019 03:45:05 +0300
Message-Id: <20190513004508.8042-12-andi@etezian.org>
In-Reply-To: <20190513004508.8042-1-andi@etezian.org>
References: <20190513004508.8042-1-andi@etezian.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v23 11/14] test/i915: gem_exec_parallel: use the
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
dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+Ci0tLQogdGVzdHMvaTkxNS9nZW1fZXhlY19wYXJhbGxlbC5jIHwgNyArKysr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYWxsZWwuYyBiL3Rlc3RzL2k5MTUvZ2Vt
X2V4ZWNfcGFyYWxsZWwuYwppbmRleCA3NTk3YmVmYjBiMzkuLjE5NTAwYTEzNGIxZSAxMDA2NDQK
LS0tIGEvdGVzdHMvaTkxNS9nZW1fZXhlY19wYXJhbGxlbC5jCisrKyBiL3Rlc3RzL2k5MTUvZ2Vt
X2V4ZWNfcGFyYWxsZWwuYwpAQCAtMjI5LDYgKzIyOSw4IEBAIHN0YXRpYyB2b2lkIGFsbChpbnQg
ZmQsIHVuc2lnbmVkIGVuZ2luZSwgdW5zaWduZWQgZmxhZ3MpCiAKIGlndF9tYWluCiB7CisJY29u
c3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplOworCiAJY29uc3Qgc3RydWN0IG1v
ZGUgewogCQljb25zdCBjaGFyICpuYW1lOwogCQl1bnNpZ25lZCBmbGFnczsKQEAgLTI1MSwxNCAr
MjUzLDEzIEBAIGlndF9tYWluCiAJCWlndF9zdWJ0ZXN0X2YoIiVzIiwgKm0tPm5hbWUgPyBtLT5u
YW1lIDogImJhc2ljIikKIAkJCWFsbChmZCwgQUxMX0VOR0lORVMsIG0tPmZsYWdzKTsKIAotCWZv
ciAoY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUgKmUgPSBpbnRlbF9leGVjdXRp
b25fZW5naW5lczsKLQkgICAgIGUtPm5hbWU7IGUrKykgeworCV9fZm9yX2VhY2hfcGh5c2ljYWxf
ZW5naW5lKGZkLCBlKSB7CiAJCWZvciAoY29uc3Qgc3RydWN0IG1vZGUgKm0gPSBtb2RlczsgbS0+
bmFtZTsgbSsrKQogCQkJaWd0X3N1YnRlc3RfZigiJXMlcyVzIiwKIAkJCQkgICAgICBlLT5uYW1l
LAogCQkJCSAgICAgICptLT5uYW1lID8gIi0iIDogIiIsCiAJCQkJICAgICAgbS0+bmFtZSkKLQkJ
CQlhbGwoZmQsIGUtPmV4ZWNfaWQgfCBlLT5mbGFncywgbS0+ZmxhZ3MpOworCQkJCWFsbChmZCwg
ZS0+ZmxhZ3MsIG0tPmZsYWdzKTsKIAl9CiAKIAlpZ3RfZml4dHVyZSB7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
