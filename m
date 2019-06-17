Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A26589089
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2019 12:56:59 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Mon, 17 Jun 2019 15:57:15 +0300
Message-Id: <20190617125715.3687-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_flip: improve logging when
 timing out
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

U2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgpCdWd6aWxsYTog
aHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1MzYzCi0tLQoK
djI6IGNsYXJpZnkgbG9nIG1lc3NhZ2UKCiB0ZXN0cy9rbXNfZmxpcC5jIHwgNyArKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3Rlc3RzL2ttc19mbGlwLmMgYi90ZXN0cy9rbXNfZmxpcC5jCmluZGV4IDJhMTU4ZDk3YmJl
Yy4uNmVhZGI3MWIzZWQ5IDEwMDc1NQotLS0gYS90ZXN0cy9rbXNfZmxpcC5jCisrKyBiL3Rlc3Rz
L2ttc19mbGlwLmMKQEAgLTY4NiwxNCArNjg2LDE3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgcnVu
X3Rlc3Rfc3RlcChzdHJ1Y3QgdGVzdF9vdXRwdXQgKm8pCiAJICAgICEoby0+cGVuZGluZ19ldmVu
dHMgJiBFVkVOVF9WQkxBTkspICYmIG8tPmZsaXBfc3RhdGUuY291bnQgPiAwKSB7CiAJCXN0cnVj
dCB2YmxhbmtfcmVwbHkgcmVwbHk7CiAJCXVuc2lnbmVkIGludCBleHBfc2VxOwotCQl1bnNpZ25l
ZCBsb25nIHN0YXJ0OworCQl1bnNpZ25lZCBsb25nIHN0YXJ0LCBlbmQ7CgogCQlleHBfc2VxID0g
by0+ZmxpcF9zdGF0ZS5jdXJyZW50X3NlcTsKIAkJc3RhcnQgPSBnZXR0aW1lX3VzKCk7CiAJCWRv
X29yX2RpZShfX3dhaXRfZm9yX3ZibGFuayhURVNUX1ZCTEFOS19BQlNPTFVURSB8CiAJCQkJCSAg
ICBURVNUX1ZCTEFOS19CTE9DSywgby0+cGlwZSwgZXhwX3NlcSwKIAkJCQkJICAgIDAsICZyZXBs
eSkpOwotCQlpZ3RfYXNzZXJ0KGdldHRpbWVfdXMoKSAtIHN0YXJ0IDwgNTAwKTsKKwkJZW5kID0g
Z2V0dGltZV91cygpOworCQlpZ3RfYXNzZXJ0X2YoZW5kIC0gc3RhcnQgPCA1MDAsICJWYmxhbmsg
d2FpdCB0b29rIGxvbmdlciB0aGFuICIKKwkJCSAgICAgImV4cGVjdGVkOiAlbHV1cyA+PSAlZHVz
IiwKKwkJCSAgICAgZW5kIC0gc3RhcnQsIDUwMCk7CiAJCWlndF9hc3NlcnRfZXEocmVwbHkuc2Vx
dWVuY2UsIGV4cF9zZXEpOwogCQlpZ3RfYXNzZXJ0KHRpbWVyY21wKCZyZXBseS50cywgJm8tPmZs
aXBfc3RhdGUubGFzdF90cywgPT0pKTsKIAl9Ci0tCjIuMjIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2
