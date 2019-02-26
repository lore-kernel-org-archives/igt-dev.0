Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4C789C53
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 10:01:32 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id D80233A3078
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 09:31:22 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Tue, 26 Feb 2019 10:30:44 +0100
Message-Id: <20190226093044.32478-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] autotools: Always build VC4 helpers with
 the library
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2l0aCByZWNlbnQgY2hhbmdlcyB0byB0aGUgaWd0X2ZiIGNvZGUsIFZDNCBzdXBwb3J0IGlzIG5v
dyBpbnRlZ3JhdGVkCmluIGNvbW1vbiBoZWxwZXJzLiBBcyBhIHJlc3VsdCwgVkM0IGhlbHBlcnMg
aGF2ZSB0byBiZSBidWlsdCBhcyBwYXJ0Cm9mIHRoZSBsaWJyYXJ5LgoKVGhpcyBpcyBhbHJlYWR5
IHRoZSBjYXNlIHdpdGggbWVzb24sIGJ1dCBWQzQgc3VwcG9ydCB3YXMgcmVtb3ZlZCBmcm9tCmF1
dG90b29scy4gQnJpbmcgaXQgYmFjayB1bmNvbmRpdGlvbmFsbHkgdG8gbWF0Y2ggbWVzb24gYmVo
YXZpb3VyLgoKVGhpcyBmaXhlcyBhIGJ1aWxkIGVycm9yIHdpdGggYXV0b3Rvb2xzLgoKU2lnbmVk
LW9mZi1ieTogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29t
PgotLS0KIGxpYi9NYWtlZmlsZS5zb3VyY2VzIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9NYWtlZmlsZS5zb3VyY2VzIGIvbGliL01ha2Vm
aWxlLnNvdXJjZXMKaW5kZXggODA4Yjk2MTdlY2EyLi45NzExZmVmMzQ0NjkgMTAwNjQ0Ci0tLSBh
L2xpYi9NYWtlZmlsZS5zb3VyY2VzCisrKyBiL2xpYi9NYWtlZmlsZS5zb3VyY2VzCkBAIC0xMDks
NiArMTA5LDggQEAgbGliX3NvdXJjZV9saXN0ID0JIAlcCiAJaWd0X3Bzci5oCQlcCiAJaWd0X3Yz
ZC5jCQlcCiAJaWd0X3YzZC5oCQlcCisJaWd0X3ZjNC5jCQlcCisJaWd0X3ZjNC5oCQlcCiAJJChO
VUxMKQogCiAuUEhPTlk6IHZlcnNpb24uaC50bXAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
