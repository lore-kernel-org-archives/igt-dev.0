Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555FD6E5C8
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Aug 2018 08:56:45 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Fri, 17 Aug 2018 10:56:42 +0200
Message-Id: <20180817085642.19501-4-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20180817085642.19501-1-maarten.lankhorst@linux.intel.com>
References: <20180817085642.19501-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t v5 4/4] tests/kms_frontbuffer_tracking:
 Don't unset mode after reading CRC
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
List-ID: <igt-dev@lists.freedesktop.org>

VW50aWwgdGhlIHByZXZpb3VzIGNvbW1pdCB3ZSBoYWQgdG8gZGlzYWJsZSB0aGUgbW9kZSBhZnRl
ciByZWFkaW5nIENSQwpiZWNhdXNlIG90aGVyd2lzZSB3ZSBtaWdodCBub3QgaGF2ZSBiZWVuIGVu
YWJsZSBmZWF0dXJlcyBjb3JyZWN0bHkuCgpOb3cgd2UgY2FuIGp1c3Qgc3RhZ2UgdGhlIGRpc2Fi
bGUgd2l0aG91dCBhcHBseWluZyBpdCwgc28gZWFjaCBzdWJ0ZXN0CmNhbiBzZXQgaXRzIGRlc2ly
ZWQgbW9kZSBhbmQgaWd0X2Rpc3BsYXkgd2lsbCB1cGRhdGUgdGhlIHN0YXRlIGFzCnJlcXVpcmVk
LgoKU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxp
bnV4LmludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyB8IDQg
KystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyBiL3Rlc3RzL2ttc19m
cm9udGJ1ZmZlcl90cmFja2luZy5jCmluZGV4IGE1NzBmOTNhMzNhOC4uOTIxYWFmZmNiNTJjIDEw
MDY0NAotLS0gYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYworKysgYi90ZXN0cy9r
bXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwpAQCAtMTIyMCw3ICsxMjIwLDcgQEAgc3RhdGljIHZv
aWQgaW5pdF9ibHVlX2NyYyhlbnVtIHBpeGVsX2Zvcm1hdCBmb3JtYXQpCiAKIAlwcmludF9jcmMo
IkJsdWUgQ1JDOiAgIiwgJmJsdWVfY3Jjc1tmb3JtYXRdLmNyYyk7CiAKLQl1bnNldF9hbGxfY3J0
Y3MoKTsKKwlpZ3RfZGlzcGxheV9yZXNldCgmZHJtLmRpc3BsYXkpOwogCiAJaWd0X3JlbW92ZV9m
Yihkcm0uZmQsICZibHVlKTsKIApAQCAtMTI3Miw3ICsxMjcyLDcgQEAgc3RhdGljIHZvaWQgaW5p
dF9jcmNzKGVudW0gcGl4ZWxfZm9ybWF0IGZvcm1hdCwKIAkJcHJpbnRfY3JjKCIiLCAmcGF0dGVy
bi0+Y3Jjc1tmb3JtYXRdW3JdKTsKIAl9CiAKLQl1bnNldF9hbGxfY3J0Y3MoKTsKKwlpZ3RfZGlz
cGxheV9yZXNldCgmZHJtLmRpc3BsYXkpOwogCiAJZm9yIChyID0gMDsgciA8IHBhdHRlcm4tPm5f
cmVjdHM7IHIrKykKIAkJaWd0X3JlbW92ZV9mYihkcm0uZmQsICZ0bXBfZmJzW3JdKTsKLS0gCjIu
MTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
