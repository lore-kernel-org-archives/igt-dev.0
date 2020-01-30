Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D94B6F8E5
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 04:36:43 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Wed, 29 Jan 2020 20:36:41 -0800
Message-Id: <7ca4c47dcf1e463fab2d54a7fec7b04bb4cfdea4.1580358863.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] benchmarks/gem_latency: change gtt to
 device coherent mapping
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

RnJvbTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5j
b20+CgpPbiBuZXdlciBnZW5zIHdpdGggbm8gbWFwcGFibGUgYXBlcnR1cmUgd2UgaGF2ZSB0byBz
d2l0Y2ggdG8KR0VNX01NQVBfT0ZGU0VUIHdoZW4gcmVhc29uYWJsZS4gQXMgZ2VtX21tYXBfX2Rl
dmljZV9jb2hlcmVudCgpCndyYXBwZXIgd2FzIHdyaXR0ZW4gdG8gY2hvb3NlIGJlc3QgbWFwaW5n
IG1ldGhvZCB3ZSBjYW4gY2hhbmdlIGd0dAptYXBwaW5nIHRvIGl0LgoKU2lnbmVkLW9mZi1ieTog
WmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Ci0t
LQogYmVuY2htYXJrcy9nZW1fbGF0ZW5jeS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYmVuY2htYXJrcy9nZW1fbGF0
ZW5jeS5jIGIvYmVuY2htYXJrcy9nZW1fbGF0ZW5jeS5jCmluZGV4IDBmYzRiMDVlYS4uNzI2OWUy
MmQyIDEwMDY0NAotLS0gYS9iZW5jaG1hcmtzL2dlbV9sYXRlbmN5LmMKKysrIGIvYmVuY2htYXJr
cy9nZW1fbGF0ZW5jeS5jCkBAIC0yNDIsNyArMjQyLDcgQEAgc3RhdGljIHZvaWQgc2V0dXBfbGF0
ZW5jeShzdHJ1Y3QgcHJvZHVjZXIgKnAsIGludCBnZW4sIHVuc2lnbmVkIGZsYWdzKQogCWlmIChn
ZW1faGFzX2xsYyhmZCkpCiAJCW1hcCA9IGdlbV9tbWFwX19jcHUoZmQsIGhhbmRsZSwgMCwgNDA5
NiwgUFJPVF9XUklURSk7CiAJZWxzZQotCQltYXAgPSBnZW1fbW1hcF9fZ3R0KGZkLCBoYW5kbGUs
IDQwOTYsIFBST1RfV1JJVEUpOworCQltYXAgPSBnZW1fbW1hcF9fZGV2aWNlX2NvaGVyZW50KGZk
LCBoYW5kbGUsIDAsIDQwOTYsIFBST1RfV1JJVEUpOwogCiAJcC0+bGF0ZW5jeV9kaXNwYXRjaC5l
eGVjWzBdLnJlbG9jYXRpb25fY291bnQgPSAxOwogCXAtPmxhdGVuY3lfZGlzcGF0Y2guZXhlY1sw
XS5yZWxvY3NfcHRyID0KLS0gCjIuMjUuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
