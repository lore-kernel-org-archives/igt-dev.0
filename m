Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18816E182
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:45:11 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id b5so1195933plg.2
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:45:11 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:43:29 -0500
Message-Id: <20210707144337.180693-42-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 41/81] tests/i915/gem_ctx_persistence: Drop
 the clone subtest
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

VGhlIGVudGlyZSBDT05URVhUX0NMT05FXyogQVBJIGlzIGJlaW5nIHJlbW92ZWQgZnJvbSB1cHN0
cmVhbSBpOTE1LgoKU2lnbmVkLW9mZi1ieTogSmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJh
bmQubmV0PgpSZXZpZXdlZC1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1w
Y3p5bnNraUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fY3R4X3BlcnNpc3RlbmNlLmMg
fCAzMCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9jdHhfcGVyc2lzdGVuY2Uu
YyBiL3Rlc3RzL2k5MTUvZ2VtX2N0eF9wZXJzaXN0ZW5jZS5jCmluZGV4IDEwZDA1N2YxYi4uOTFj
MzAxNzY5IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9jdHhfcGVyc2lzdGVuY2UuYworKysg
Yi90ZXN0cy9pOTE1L2dlbV9jdHhfcGVyc2lzdGVuY2UuYwpAQCAtMTQ3LDMzICsxNDcsNiBAQCBz
dGF0aWMgdm9pZCB0ZXN0X2lkZW1wb3RlbnQoaW50IGk5MTUpCiAJaWd0X2Fzc2VydF9lcShwLnZh
bHVlLCBleHBlY3RlZCk7CiB9CiAKLXN0YXRpYyB2b2lkIHRlc3RfY2xvbmUoaW50IGk5MTUpCi17
Ci0Jc3RydWN0IGRybV9pOTE1X2dlbV9jb250ZXh0X3BhcmFtIHAgPSB7Ci0JCS5wYXJhbSA9IEk5
MTVfQ09OVEVYVF9QQVJBTV9QRVJTSVNURU5DRSwKLQl9OwotCXVpbnQzMl90IGN0eCwgY2xvbmU7
Ci0KLQkvKgotCSAqIENoZWNrIHRoYXQgcGVyc2lzdGVuY2UgaXMgaW5oZXJpdGVkIGFjcm9zcyBh
IGNsb25lLgotCSAqLwotCWlndF9yZXF1aXJlKCBfX2dlbV9jb250ZXh0X2NyZWF0ZShpOTE1LCAm
Y3R4KSA9PSAwKTsKLQotCXAuY3R4X2lkID0gY3R4OwotCXAudmFsdWUgPSAwOwotCWdlbV9jb250
ZXh0X3NldF9wYXJhbShpOTE1LCAmcCk7Ci0KLQljbG9uZSA9IGdlbV9jb250ZXh0X2Nsb25lKGk5
MTUsIGN0eCwgSTkxNV9DT05URVhUX0NMT05FX0ZMQUdTLCAwKTsKLQlnZW1fY29udGV4dF9kZXN0
cm95KGk5MTUsIGN0eCk7Ci0KLQlwLmN0eF9pZCA9IGNsb25lOwotCXAudmFsdWUgPSAtMTsKLQln
ZW1fY29udGV4dF9nZXRfcGFyYW0oaTkxNSwgJnApOwotCWlndF9hc3NlcnRfZXEocC52YWx1ZSwg
MCk7Ci0KLQlnZW1fY29udGV4dF9kZXN0cm95KGk5MTUsIGNsb25lKTsKLX0KLQogc3RhdGljIHZv
aWQgdGVzdF9wZXJzaXN0ZW5jZShpbnQgaTkxNSwgdW5zaWduZWQgaW50IGVuZ2luZSkKIHsKIAlp
Z3Rfc3Bpbl90ICpzcGluOwpAQCAtMTM2Niw5ICsxMzM5LDYgQEAgaWd0X21haW4KIAlpZ3Rfc3Vi
dGVzdCgiaWRlbXBvdGVudCIpCiAJCXRlc3RfaWRlbXBvdGVudChpOTE1KTsKIAotCWlndF9zdWJ0
ZXN0KCJjbG9uZSIpCi0JCXRlc3RfY2xvbmUoaTkxNSk7Ci0KIAlpZ3Rfc3VidGVzdCgiZmlsZSIp
CiAJCXRlc3Rfbm9ucGVyc2lzdGVudF9maWxlKGk5MTUpOwogCi0tIAoyLjMxLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
