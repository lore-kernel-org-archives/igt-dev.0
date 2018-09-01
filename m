Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191D86E0B8
 for <igt-dev@lists.freedesktop.org>; Sat,  1 Sep 2018 18:09:34 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat,  1 Sep 2018 19:09:11 +0100
Message-Id: <20180901180911.22636-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Use a bsearch to find the module name
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

RXZlbiB3aXRoIGEgc21hbGwgbnVtYmVyIG9mIGtub3duIGRyaXZlcnMgKDYpLCBhIGJzZWFyY2gg
d2lsbCB0YWtlIGF0Cm1vc3QgMyBzdGVwcywgd2hlcmVhcyB0aGUgbGluZWFyIHNlYXJjaCB3aWxs
IHRha2UgMyBzdGVwcyBvbiBhdmVyYWdlLiBJbgp0aGUgZnV0dXJlIHdpdGggbW9yZSBrbm93biBk
cml2ZXJzLCB0aGUgbG9nTiBic2VhcmNoIHdpbGwgYmUgZXZlbiBtb3JlCmFkdmFudGFnZW91cy4K
ClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpD
YzogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+Ci0tLQogbGliL2RybXRl
c3QuYyB8IDEyICsrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvZHJtdGVzdC5jIGIvbGliL2RybXRlc3Qu
YwppbmRleCA5MzIyOGY5MDAuLmJmYjM4ZjFlOSAxMDA2NDQKLS0tIGEvbGliL2RybXRlc3QuYwor
KysgYi9saWIvZHJtdGVzdC5jCkBAIC0yMjIsOSArMjIyLDE1IEBAIHN0YXRpYyBpbnQgb3Blbl9k
ZXZpY2UoY29uc3QgY2hhciAqbmFtZSwgdW5zaWduZWQgaW50IGNoaXBzZXQpCiAJaWYgKF9fZ2V0
X2RybV9kZXZpY2VfbmFtZShmZCwgZGV2X25hbWUsIHNpemVvZihkZXZfbmFtZSkgLSAxKSA9PSAt
MSkKIAkJZ290byBlcnI7CiAKLQlmb3IgKGNvbnN0IHN0cnVjdCBtb2R1bGUgKm0gPSBtb2R1bGVz
OyBtLT5tb2R1bGU7IG0rKykgewotCQlpZiAoc3RyY21wKG0tPm1vZHVsZSwgZGV2X25hbWUpID09
IDApIHsKLQkJCWNoaXAgPSBtLT5iaXQ7CisJZm9yIChpbnQgc3RhcnQgPSAwLCBlbmQgPSBBUlJB
WV9TSVpFKG1vZHVsZXMpIC0gMTsgc3RhcnQgPCBlbmQ7ICl7CisJCWludCBtaWQgPSBzdGFydCAr
IChlbmQgLSBzdGFydCkgLyAyOworCQlpbnQgcmV0ID0gc3RyY21wKG1vZHVsZXNbbWlkXS5tb2R1
bGUsIGRldl9uYW1lKTsKKwkJaWYgKHJldCA8IDApIHsKKwkJCWVuZCA9IG1pZDsKKwkJfSBlbHNl
IGlmIChyZXQgPiAwKSB7CisJCQlzdGFydCA9IG1pZCArIDE7CisJCX0gZWxzZSB7CisJCQljaGlw
ID0gbW9kdWxlc1ttaWRdLmJpdDsKIAkJCWJyZWFrOwogCQl9CiAJfQotLSAKMi4xOS4wLnJjMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
