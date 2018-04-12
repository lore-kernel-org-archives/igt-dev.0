Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0060.outbound.protection.outlook.com [104.47.37.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125006E254
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Apr 2018 21:38:15 +0000 (UTC)
From: <sunpeng.li@amd.com>
Date: Thu, 12 Apr 2018 17:37:25 -0400
Message-ID: <1523569046-612-3-git-send-email-sunpeng.li@amd.com>
In-Reply-To: <1523569046-612-1-git-send-email-sunpeng.li@amd.com>
References: <1523569046-612-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_color: Do not mask LUT for
 non i915 drivers.
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

RnJvbTogIkxlbyAoU3VucGVuZykgTGkiIDxzdW5wZW5nLmxpQGFtZC5jb20+CgotLS0KIHRlc3Rz
L2ttc19jb2xvci5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2NvbG9yLmMgYi90ZXN0cy9r
bXNfY29sb3IuYwppbmRleCBjMzEyNjk3Li4xZTUxOTE3IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNf
Y29sb3IuYworKysgYi90ZXN0cy9rbXNfY29sb3IuYwpAQCAtMTY1LDcgKzE2NSwxMiBAQCBzdGF0
aWMgc3RydWN0IF9kcm1fY29sb3JfbHV0ICpjb2VmZnNfdG9fbHV0KGRhdGFfdCAqZGF0YSwKIAlz
dHJ1Y3QgX2RybV9jb2xvcl9sdXQgKmx1dDsKIAl1aW50MzJfdCBpOwogCXVpbnQzMl90IG1heF92
YWx1ZSA9ICgxIDw8IDE2KSAtIDE7Ci0JdWludDMyX3QgbWFzayA9ICgoMSA8PCBjb2xvcl9kZXB0
aCkgLSAxKSA8PCA4OworCXVpbnQzMl90IG1hc2s7CisKKwlpZiAoaXNfaTkxNV9kZXZpY2UoZGF0
YS0+ZHJtX2ZkKSkKKwkJbWFzayA9ICgoMSA8PCBjb2xvcl9kZXB0aCkgLSAxKSA8PCA4OworCWVs
c2UKKwkJbWFzayA9IG1heF92YWx1ZTsKIAogCWx1dCA9IG1hbGxvYyhzaXplb2Yoc3RydWN0IF9k
cm1fY29sb3JfbHV0KSAqIGx1dF9zaXplKTsKIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
