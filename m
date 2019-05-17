Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7884589938
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2019 16:02:56 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 17 May 2019 19:02:42 +0300
Message-Id: <20190517160242.28247-5-simon.ser@intel.com>
In-Reply-To: <20190517160242.28247-1-simon.ser@intel.com>
References: <20190517160242.28247-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/5] tests/kms_chamelium: skip audio tests
 Chamelium doesn't support
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
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

SW4gdGhlc2UgY29uZmlndXJhdGlvbnMgdGhlIENoYW1lbGl1bSBkZXZpY2Ugc2VuZHMgbWFsZm9y
bWVkIGRhdGE6CgotIE1vcmUgdGhhbiAyIGNoYW5uZWxzCi0gMiBjaGFubmVscywgbW9yZSB0aGFu
IDE2LWJpdCBzYW1wbGVzIGFuZCBtb3JlIHRoYW4gMzJLSHogc2FtcGxpbmcgcmF0ZQoKSW4gdGhp
cyBjYXNlcywgc2tpcCB0aGUgdGVzdC4KClNlZSBjcmJ1Zy5jb20vOTUwOTE3LgoKU2lnbmVkLW9m
Zi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19jaGFt
ZWxpdW0uYyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jaGFtZWxpdW0uYyBiL3Rlc3RzL2ttc19jaGFtZWxp
dW0uYwppbmRleCA4ODM1NmRkMjMyYjYuLmU4ODhhNjQyYzI0YSAxMDA2NDQKLS0tIGEvdGVzdHMv
a21zX2NoYW1lbGl1bS5jCisrKyBiL3Rlc3RzL2ttc19jaGFtZWxpdW0uYwpAQCAtMTA2Miw2ICsx
MDYyLDE3IEBAIHN0YXRpYyBib29sIHRlc3RfYXVkaW9fY29uZmlndXJhdGlvbihzdHJ1Y3QgYWxz
YSAqYWxzYSwgc25kX3BjbV9mb3JtYXRfdCBmb3JtYXQsCiAJCQkgIHNhbXBsaW5nX3JhdGUsIGNo
YW5uZWxzKTsKIAkJcmV0dXJuIGZhbHNlOwogCX0KKwkvKiBUT0RPOiB0aGUgQ2hhbWVsaXVtIGRl
dmljZSBzZW5kcyBhIG1hbGZvcm1lZCBzaWduYWwgZm9yIHNvbWUgYXVkaW8KKwkgKiBjb25maWd1
cmF0aW9ucy4gU2VlIGNyYnVnLmNvbS85NTA5MTcgKi8KKwlpZiAoKGZvcm1hdCAhPSBTTkRfUENN
X0ZPUk1BVF9TMTZfTEUgJiYgc2FtcGxpbmdfcmF0ZSA+PSA0NDEwMCkgfHwKKwkJCWNoYW5uZWxz
ID4gMikgeworCQlpZ3RfZGVidWcoIlNraXBwaW5nIHRlc3Qgd2l0aCBmb3JtYXQgJXMsIHNhbXBs
aW5nIHJhdGUgJWQgSHogIgorCQkJICAiYW5kICVkIGNoYW5uZWxzIGJlY2F1c2UgdGhlIENoYW1l
bGl1bSBkZXZpY2UgIgorCQkJICAiZG9lc24ndCBzdXBwb3J0IHRoaXMgY29uZmlndXJhdGlvblxu
IiwKKwkJCSAgc25kX3BjbV9mb3JtYXRfbmFtZShmb3JtYXQpLAorCQkJICBzYW1wbGluZ19yYXRl
LCBjaGFubmVscyk7CisJCXJldHVybiBmYWxzZTsKKwl9CiAJcmV0dXJuIHRydWU7CiB9CiAKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
