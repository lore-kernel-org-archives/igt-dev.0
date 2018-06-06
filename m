Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26ED6E6AD
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jun 2018 22:29:10 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Wed,  6 Jun 2018 15:27:38 -0700
Message-Id: <20180606222741.24096-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/sw_sync: fix pthread
 start_routine declaration
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

cHRocmVhZF9jcmVhdGUoKSBleHBlY3RzIGEgdm9pZCAqKCpzdGFydF9yb3V0aW5lKSAodm9pZCAq
KS4gRml4IHdhcm5pbmcKdGhlIGZvbGxvd2luZyB3YXJuaW5nIG9uIGdjYyA4OgoKLi4vdGVzdHMv
c3dfc3luYy5jOjc3MzozNzogd2FybmluZzogY2FzdCBiZXR3ZWVuIGluY29tcGF0aWJsZSBmdW5j
dGlvbiB0eXBlcyBmcm9tIOKAmGludCAoKikodm9pZCAqKeKAmSB0byDigJh2b2lkICogKCopKHZv
aWQgKinigJkgWy1XY2FzdC1mdW5jdGlvbi10eXBlXQogICBwdGhyZWFkX2NyZWF0ZSgmdGhyZWFk
c1tpXSwgTlVMTCwgKHZvaWQgKiAoKikodm9pZCAqKSkKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF4KU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1h
cmNoaUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvc3dfc3luYy5jIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3Rz
L3N3X3N5bmMuYyBiL3Rlc3RzL3N3X3N5bmMuYwppbmRleCAyMGRmYmJiOS4uYWZlNThiMGMgMTAw
NjQ0Ci0tLSBhL3Rlc3RzL3N3X3N5bmMuYworKysgYi90ZXN0cy9zd19zeW5jLmMKQEAgLTY2OSw3
ICs2NjksNyBAQCBzdGF0aWMgc3RydWN0IHsKIAlwdGhyZWFkX211dGV4X3QgbG9jazsKIH0gdGVz
dF9tcHNjX2RhdGE7CiAKLXN0YXRpYyBpbnQgbXBzY19wcm9kdWNlcl90aHJlYWQodm9pZCAqZCkK
K3N0YXRpYyB2b2lkICptcHNjX3Byb2R1Y2VyX3RocmVhZCh2b2lkICpkKQogewogCWludCBpZCA9
IChsb25nKWQ7CiAJaW50IGZlbmNlLCBpOwpAQCAtNzAyLDcgKzcwMiw3IEBAIHN0YXRpYyBpbnQg
bXBzY19wcm9kdWNlcl90aHJlYWQodm9pZCAqZCkKIAkJY2xvc2UoZmVuY2UpOwogCX0KIAotCXJl
dHVybiAwOworCXJldHVybiBOVUxMOwogfQogCiBzdGF0aWMgaW50IG1wc2NfY29uc3VtZXJfdGhy
ZWFkKHZvaWQpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
