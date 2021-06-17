Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35976E981
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 19:15:29 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id m2so5736524pgk.7
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 12:15:29 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 17 Jun 2021 14:14:51 -0500
Message-Id: <20210617191516.577394-5-jason@jlekstrand.net>
In-Reply-To: <20210617191256.577244-1-jason@jlekstrand.net>
References: <20210617191256.577244-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 54/79] tests/i915/gem_exec_endless: Stop
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
