Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3A06E22A
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 01:57:31 +0000 (UTC)
From: Nischala Yelchuri <nischala.yelchuri@intel.com>
Date: Wed,  6 Mar 2019 18:44:44 -0800
Message-Id: <20190307024444.42432-1-nischala.yelchuri@intel.com>
Subject: [igt-dev] [PATCH] tests/kms_cursor_legacy: Fix assertion failure
 due to vblank mismatch
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
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Rm9yIHRoZSBtb2Rlc2V0IGNhc2UsIHRoZSB2YmxhbmsgY291bnRlciBjYW4gaW5jcmVtZW50IGJ5
IG1vcmUgdGhhbiAxLgoKQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBp
bnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IE5pc2NoYWxhIFllbGNodXJpIDxuaXNjaGFsYS55ZWxj
aHVyaUBpbnRlbC5jb20+CkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3No
b3dfYnVnLmNnaT9pZD0xMDU0NTQKLS0tCiB0ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeS5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvdGVzdHMva21zX2N1cnNvcl9sZWdhY3kuYyBiL3Rlc3RzL2ttc19jdXJzb3JfbGVnYWN5
LmMKaW5kZXggZDY5ODdlZWEuLjg2NTIwNDdmIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfY3Vyc29y
X2xlZ2FjeS5jCisrKyBiL3Rlc3RzL2ttc19jdXJzb3JfbGVnYWN5LmMKQEAgLTk3OCw3ICs5Nzgs
NyBAQCBzdGF0aWMgdm9pZCB0d29fc2NyZWVuc19mbGlwX3ZzX2N1cnNvcihpZ3RfZGlzcGxheV90
ICpkaXNwbGF5LCBpbnQgbmxvb3BzLCBib29sCiAJCWlmICghbW9kZXNldCkKIAkJCWlndF9hc3Nl
cnRfZXEodmJsLnNlcXVlbmNlLCB2Ymxhbmtfc3RhcnQgKyAxKTsKIAotCQlpZiAodmJsYW5rX3N0
YXJ0ICYmIHZibC5zZXF1ZW5jZSA9PSB2Ymxhbmtfc3RhcnQgKyAxKQorCQlpZiAodmJsYW5rX3N0
YXJ0ICYmIHZibC5zZXF1ZW5jZSA+PSB2Ymxhbmtfc3RhcnQgKyAxKQogCQkJdmJsYW5rX21hdGNo
ZXMgPSB0cnVlOwogCiAJCS8qIERvIG5vdCByZXF1ZXVlIG9uIHRoZSBsYXN0IDIgZXZlbnRzLiAq
LwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
