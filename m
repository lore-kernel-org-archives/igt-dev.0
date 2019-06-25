Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750083.outbound.protection.outlook.com [40.107.75.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E1F6E0AB
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2019 19:45:59 +0000 (UTC)
From: Dingchen Zhang <dingchen.zhang@amd.com>
Date: Tue, 25 Jun 2019 15:42:17 -0400
Message-ID: <20190625194218.18106-2-dingchen.zhang@amd.com>
In-Reply-To: <20190625194218.18106-1-dingchen.zhang@amd.com>
References: <20190625194218.18106-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/3] lib/igt_debugfs: add DPRX pipe crc
 source for AMDGPU
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

TmVlZCBEUFJYIENSQyBzb3VyY2UgdG8gdmFsaWRhdGUgQU1ER1BVIDhicGMgYnlwYXNzIG1vZGUu
CgpBZGRlZCBBTURHUFUgRFBSWCBwaXBlIGNyYyBzb3VyY2UgaW4gaWd0X2RlYnVnZnMuaAoKdjI6
IGRyb3BwZWQgdGhlIENSVEMgYW5kIEFVVE8gY3JjIHNvdXJjZXMgZm9yIEFNREdQVSAoTmljaG9s
YXMpCgpDYzogSGFycnkgV2VudGxhbmQgPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+CkNjOiBOaWNr
IEthemxhdXNrYXMgPE5pY2hvbGFzLkthemxhdXNrYXNAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
RGluZ2NoZW4gWmhhbmcgPGRpbmdjaGVuLnpoYW5nQGFtZC5jb20+Ci0tLQogbGliL2lndF9kZWJ1
Z2ZzLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L2xpYi9pZ3RfZGVidWdmcy5oIGIvbGliL2lndF9kZWJ1Z2ZzLmgKaW5kZXggNTI1MjBiM2MuLjM2
YjYzODE3IDEwMDY0NAotLS0gYS9saWIvaWd0X2RlYnVnZnMuaAorKysgYi9saWIvaWd0X2RlYnVn
ZnMuaApAQCAtODMsNiArODMsNyBAQCB0eXBlZGVmIHN0cnVjdCB7CiB9IGlndF9jcmNfdDsKIAog
I2RlZmluZSBJTlRFTF9QSVBFX0NSQ19TT1VSQ0VfQVVUTyAiYXV0byIKKyNkZWZpbmUgQU1ER1BV
X1BJUEVfQ1JDX1NPVVJDRV9EUFJYICJkcHJ4IgogCiB2b2lkIGlndF9hc3NlcnRfY3JjX2VxdWFs
KGNvbnN0IGlndF9jcmNfdCAqYSwgY29uc3QgaWd0X2NyY190ICpiKTsKIGJvb2wgaWd0X2NoZWNr
X2NyY19lcXVhbChjb25zdCBpZ3RfY3JjX3QgKmEsIGNvbnN0IGlndF9jcmNfdCAqYik7Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
