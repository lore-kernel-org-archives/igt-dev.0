Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 160C96E6D4
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Nov 2018 08:07:17 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Fri, 16 Nov 2018 09:05:53 +0100
Message-Id: <20181116080554.1615-2-paul.kocialkowski@bootlin.com>
In-Reply-To: <20181116080554.1615-1-paul.kocialkowski@bootlin.com>
References: <20181116080554.1615-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/2] chamelium: Fix inverted xr24 pattern
 paint dimensions
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIHhyMjQgcGF0dGVybiBmb3IgY2hhbWVsaXVtIHRlc3RpbmcgYXBwZWFycyBtYW5nbGVkIHdo
ZW4gY2hlY2tpbmcgaXQKb24gYW4gYWN0dWFsIGRpc3BsYXkuIFRoaXMgaXMgYmVjYXVzZSB0aGUg
aG9yaXpvbnRhbCBhbmQgdmVydGljYWwKZGlzcGxheSBzaXplcyBhcmUgaW52ZXJ0ZWQgd2hlbiB1
c2VkIGFzIHdpZHRoIGFuZCBoZWlnaHQuCgpQdXQgdGhlbSBiYWNrIGluIG9yZGVyLgoKU2lnbmVk
LW9mZi1ieTogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29t
PgpSZXZpZXdlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4K
LS0tCiB0ZXN0cy9rbXNfY2hhbWVsaXVtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY2hhbWVsaXVt
LmMgYi90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKaW5kZXggZTBlM2UzZjEuLjRmMTk3N2MzIDEwMDY0
NAotLS0gYS90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKKysrIGIvdGVzdHMva21zX2NoYW1lbGl1bS5j
CkBAIC01MTYsNyArNTE2LDcgQEAgc3RhdGljIGludCBjaGFtZWxpdW1fZ2V0X3BhdHRlcm5fZmIo
ZGF0YV90ICpkYXRhLCBkcm1Nb2RlTW9kZUluZm8gKm1vZGUsCiAJcHRyID0gaWd0X2ZiX21hcF9i
dWZmZXIoZmItPmZkLCBmYik7CiAJaWd0X2Fzc2VydChwdHIpOwogCi0JY2hhbWVsaXVtX3BhaW50
X3hyMjRfcGF0dGVybihwdHIsIG1vZGUtPnZkaXNwbGF5LCBtb2RlLT5oZGlzcGxheSk7CisJY2hh
bWVsaXVtX3BhaW50X3hyMjRfcGF0dGVybihwdHIsIG1vZGUtPmhkaXNwbGF5LCBtb2RlLT52ZGlz
cGxheSk7CiAJaWd0X2ZiX3VubWFwX2J1ZmZlcihmYiwgcHRyKTsKIAogCXJldHVybiBmYl9pZDsK
LS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
