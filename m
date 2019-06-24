Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710064.outbound.protection.outlook.com [40.107.71.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F56D89C14
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2019 14:45:09 +0000 (UTC)
From: Dingchen Zhang <dingchen.zhang@amd.com>
Date: Mon, 24 Jun 2019 10:31:42 -0400
Message-ID: <20190624143144.3403-2-dingchen.zhang@amd.com>
In-Reply-To: <20190624143144.3403-1-dingchen.zhang@amd.com>
References: <20190624143144.3403-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/igt_debugfs: add AMDGPU pipe crc
 sources
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

TmVlZCBkaWZmZXJlbnQgcGlwZSBDUkMgc291cmNlcyB0byB2YWxpZGF0ZSBBTURHUFUKZGlnaXRh
bCBieXBhc3MgbW9kZS4KCkFkZGVkIGF2YWlsYWJsZSBBTURHUFUgcGlwZSBjcmMgc291cmNlcyBp
biBpZ3RfZGVidWdmcy5oCgpDYzogSGFycnkgV2VudGxhbmQgPEhhcnJ5LldlbnRsYW5kQGFtZC5j
b20+CkNjOiBOaWNrIEthemxhdXNrYXMgPE5pY2hvbGFzLkthemxhdXNrYXNAYW1kLmNvbT4KQ2hh
bmdlLUlkOiBJYTZjOWNjYjdhOTA0ZWM4YTQ5MGU1MTk0MjVjMDA2YWUyZWE5NWE5YgpTaWduZWQt
b2ZmLWJ5OiBEaW5nY2hlbiBaaGFuZyA8ZGluZ2NoZW4uemhhbmdAYW1kLmNvbT4KLS0tCiBsaWIv
aWd0X2RlYnVnZnMuaCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvbGliL2lndF9kZWJ1Z2ZzLmggYi9saWIvaWd0X2RlYnVnZnMuaAppbmRleCA1
MjUyMGIzYy4uYjQ5ZGQyYjYgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZGVidWdmcy5oCisrKyBiL2xp
Yi9pZ3RfZGVidWdmcy5oCkBAIC04Myw2ICs4Myw5IEBAIHR5cGVkZWYgc3RydWN0IHsKIH0gaWd0
X2NyY190OwogCiAjZGVmaW5lIElOVEVMX1BJUEVfQ1JDX1NPVVJDRV9BVVRPICJhdXRvIgorI2Rl
ZmluZSBBTURHUFVfUElQRV9DUkNfU09VUkNFX0FVVE8gImF1dG8iCisjZGVmaW5lIEFNREdQVV9Q
SVBFX0NSQ19TT1VSQ0VfQ1JUQyAiY3J0YyIKKyNkZWZpbmUgQU1ER1BVX1BJUEVfQ1JDX1NPVVJD
RV9EUFJYICJkcHJ4IgogCiB2b2lkIGlndF9hc3NlcnRfY3JjX2VxdWFsKGNvbnN0IGlndF9jcmNf
dCAqYSwgY29uc3QgaWd0X2NyY190ICpiKTsKIGJvb2wgaWd0X2NoZWNrX2NyY19lcXVhbChjb25z
dCBpZ3RfY3JjX3QgKmEsIGNvbnN0IGlndF9jcmNfdCAqYik7Ci0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
