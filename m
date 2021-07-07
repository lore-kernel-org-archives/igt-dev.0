Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6925D6E17E
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:46:58 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id a127so2336954pfa.10
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:46:58 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:16 -0500
Message-Id: <20210707144643.181001-5-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 54/81] tests/i915/gem_exec_endless: Stop
 munging ctx0 engines
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

U2lnbmVkLW9mZi1ieTogSmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQubmV0PgpSZXZp
ZXdlZC1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fZXhlY19lbmRsZXNzLmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0
cy9pOTE1L2dlbV9leGVjX2VuZGxlc3MuYyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfZW5kbGVzcy5j
CmluZGV4IGMzYzgwNjU0My4uYjgzZDVhMmMxIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9l
eGVjX2VuZGxlc3MuYworKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2VuZGxlc3MuYwpAQCAtMzA5
LDcgKzMwOSw3IEBAIHN0YXRpYyB2b2lkIGVuZGxlc3NfZGlzcGF0Y2goaW50IGk5MTUsIGNvbnN0
IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZSkKIH0KIAogI2RlZmluZSB0ZXN0X2Vh
Y2hfZW5naW5lKFQsIGk5MTUsIGUpIFwKLQlpZ3Rfc3VidGVzdF93aXRoX2R5bmFtaWMoVCkgX19m
b3JfZWFjaF9waHlzaWNhbF9lbmdpbmUoaTkxNSwgZSkgXAorCWlndF9zdWJ0ZXN0X3dpdGhfZHlu
YW1pYyhUKSBmb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUoaTkxNSwgZSkgXAogCQlmb3JfZWFjaF9p
ZihnZW1fY2xhc3NfY2FuX3N0b3JlX2R3b3JkKGk5MTUsIChlKS0+Y2xhc3MpKSBcCiAJCQlpZ3Rf
ZHluYW1pY19mKCIlcyIsIChlKS0+bmFtZSkKIAotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
