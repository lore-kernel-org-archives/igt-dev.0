Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF0B6E177
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2019 09:44:15 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k15so5947336lja.3
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2019 01:44:15 -0800 (PST)
From: Mika Kahola <mika.kahola@gmail.com>
Date: Thu, 14 Nov 2019 11:44:00 +0200
Message-Id: <20191114094403.19908-1-mika.kahola@kolumbus.fi>
Subject: [igt-dev] [PATCH v6 0/3] GEN12 render decompression
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@kolumbus.fi>
List-ID: <igt-dev@lists.freedesktop.org>

R2VuLTEyIHJlbmRlciBkZWNvbXByZXNzaW9uIGlzIHN1cHBvcnRlZCB3aXRoIFktdGlsZWQgbWFp
biBzdXJmYWNlLgpUaGUgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgQ0NTIHN1cHBvcnQgZm9yIElH
VCB0ZXN0cy4KClRoaXMgcGF0Y2ggc2VyaWVzIHJlcXVpcmVzIEltcmUncyBzZXJpZXMKCmh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjg4OTAvCgp2MjogQWRkZWQgbmV3
IHN1YnRlc3RzIGZvciBlYWNoIGZvcm1hdCBtb2RpZmllci4KdjM6IEFkZCBJR1QgZGVzY3JpcHRp
b24gZm9yIGVhY2ggc3VidGVzdCAoR2l0TGFiKQp2NDogRml4IGttc19jY3MgZXJyb3Jub3VzZSBz
dWJ0ZXN0IGV4ZWN1dGlvbiBhbmQgbGlzdGluZwp2NTogUmVhbGlnbiBtYWluIGFuZCBhdXggc3Vy
ZmFjZXMgKEltcmUpCnY2OiBGaXggb24gc3R5bGluZyBhbmQgZ2l0IHNxdWFzaCBidWcKCk1pa2Eg
S2Fob2xhICgzKToKICBGb3JtYXQgbW9kaWZpZXIgZm9yIEludGVsIEdlbi0xMiByZW5kZXIgY29t
cHJlc3Npb24KICBsaWIvaWd0X2ZiLmM6IFVwZGF0ZSB0aWxlIHNpemVzIGZvciBHRU4xMiBDQ1MK
ICB0ZXN0cy9rbXNfY2NzOiBBZGQgR0VOMTIgQ0NTIHJlbmRlciBjb21wcmVzc2lvbiBmb3JtYXQg
bW9kaWZpZXJzCgogaW5jbHVkZS9kcm0tdWFwaS9kcm1fZm91cmNjLmggfCAgIDEgKwogbGliL2ln
dF9mYi5jICAgICAgICAgICAgICAgICAgfCAgNTAgKysrKysrKysrKysrKy0tCiBsaWIvaW9jdGxf
d3JhcHBlcnMuaCAgICAgICAgICB8ICAgMSArCiB0ZXN0cy9rbXNfY2NzLmMgICAgICAgICAgICAg
ICB8IDExNyArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5n
ZWQsIDExNiBpbnNlcnRpb25zKCspLCA1MyBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
