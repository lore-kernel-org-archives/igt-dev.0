Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFE26E1F7
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Sep 2018 00:03:10 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 18 Sep 2018 17:03:03 -0700
Message-Id: <20180919000303.27440-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/psr: Add
 kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu to FF
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
Cc: Martin Peres <martin.peres@linux.intel.com>, Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2Ugc3RpbGwgZG8gbm90IGhhdmUgdGhlIGNhcGFiaWxpdHkgdG8gcnVuIFBTUiB0ZXN0cyBwcmUt
bWVyZ2UuIEFkZCBhCm1tYXAtY3B1IHN1YnRlc3QgZnJvbSBrbXNfZnJvbnRidWZmZXJfdHJhY2tp
bmcgdG8gdGhlIGZhc3QtZmVlZGJhY2sgbGlzdApzbyB0aGF0IHdlIGNhbiBjYXRjaCBzb21lIHJl
Z3Jlc3Npb25zIGVhcmx5LgoKQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNv
bT4KQ2M6IE1hcnRpbiBQZXJlcyA8bWFydGluLnBlcmVzQGxpbnV4LmludGVsLmNvbT4KU2lnbmVk
LW9mZi1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5j
b20+Ci0tLQogdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCB8IDEgKwogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kv
ZmFzdC1mZWVkYmFjay50ZXN0bGlzdCBiL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVz
dGxpc3QKaW5kZXggYzYyNTkwNGQuLjQ5MWFjZTgzIDEwMDY0NAotLS0gYS90ZXN0cy9pbnRlbC1j
aS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0CisrKyBiL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJh
Y2sudGVzdGxpc3QKQEAgLTIwNSw2ICsyMDUsNyBAQCBpZ3RAa21zX2ZvcmNlX2Nvbm5lY3Rvcl9i
YXNpY0Bmb3JjZS1lZGlkCiBpZ3RAa21zX2ZvcmNlX2Nvbm5lY3Rvcl9iYXNpY0Bmb3JjZS1sb2Fk
LWRldGVjdAogaWd0QGttc19mb3JjZV9jb25uZWN0b3JfYmFzaWNAcHJ1bmUtc3RhbGUtbW9kZXMK
IGlndEBrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmdAYmFzaWMKK2lndEBrbXNfZnJvbnRidWZmZXJf
dHJhY2tpbmdAcHNyLXJnYjEwMTAxMC1kcmF3LW1tYXAtY3B1CiBpZ3RAa21zX3BpcGVfY3JjX2Jh
c2ljQGJhZC1zb3VyY2UKIGlndEBrbXNfcGlwZV9jcmNfYmFzaWNAaGFuZy1yZWFkLWNyYy1waXBl
LWEKIGlndEBrbXNfcGlwZV9jcmNfYmFzaWNAaGFuZy1yZWFkLWNyYy1waXBlLWIKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
