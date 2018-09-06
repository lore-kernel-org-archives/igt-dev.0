Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Deepak Rawat <drawat@vmware.com>
Date: Wed, 5 Sep 2018 17:03:49 -0700
Message-ID: <20180906000350.2478-5-drawat@vmware.com>
In-Reply-To: <20180906000350.2478-1-drawat@vmware.com>
References: <20180906000350.2478-1-drawat@vmware.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/5] lib/igt_fb: Check for stride before
 creating cairo surface
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
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, syeh@vmware.com
Cc: Deepak Rawat <drawat@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

Q2Fpcm8gc3VyZmFjZSBjcmVhdGlvbiB3aWxsIGZhaWwgaWYgc3RyaWRlIG9mIHByb3ZpZGVkIGJ1
ZmZlciBpcyBub3QKc2FtZSBhcyBleHBlY3RlZCBieSBjYWlyby4gVGhpcyBmYWlscyBmb3Igdm13
Z2Z4IG9kZCBsZW5ndGggZnJhbWVidWZmZXIKYXMgaW4gdm13Z2Z4IHN0cmlkZSBpcyBhbHdheXMg
d2lkdGggKiBicHAuCgpTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgUmF3YXQgPGRyYXdhdEB2bXdhcmUu
Y29tPgotLS0KIGxpYi9pZ3RfZmIuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5jCmluZGV4IGJh
OTk1YTFhLi4yNzI0ZTMyMyAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisrKyBiL2xpYi9pZ3Rf
ZmIuYwpAQCAtMTM0OSw2ICsxMzQ5LDkgQEAgc3RhdGljIHZvaWQgY3JlYXRlX2NhaXJvX3N1cmZh
Y2VfX2d0dChpbnQgZmQsIHN0cnVjdCBpZ3RfZmIgKmZiKQogCQlwdHIgPSBnZW1fbW1hcF9fZ3R0
KGZkLCBmYi0+Z2VtX2hhbmRsZSwgZmItPnNpemUsCiAJCQkJICAgIFBST1RfUkVBRCB8IFBST1Rf
V1JJVEUpOwogCisJaWd0X3JlcXVpcmUoZmItPnN0cmlkZSA9PSBjYWlyb19mb3JtYXRfc3RyaWRl
X2Zvcl93aWR0aCgKKwkJZHJtX2Zvcm1hdF90b19jYWlybyhmYi0+ZHJtX2Zvcm1hdCksIGZiLT53
aWR0aCkpOworCiAJZmItPmNhaXJvX3N1cmZhY2UgPQogCQljYWlyb19pbWFnZV9zdXJmYWNlX2Ny
ZWF0ZV9mb3JfZGF0YShwdHIsCiAJCQkJCQkgICAgZHJtX2Zvcm1hdF90b19jYWlybyhmYi0+ZHJt
X2Zvcm1hdCksCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
