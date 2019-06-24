Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987738941D
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2019 08:28:13 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Mon, 24 Jun 2019 11:28:22 +0300
Message-Id: <20190624082822.7125-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3] tests/kms_flip: improve logging when
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
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgpCdWd6aWxsYTog
aHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1MzYzCi0tLQoK
Q2hhbmdlcyBmcm9tIHYyIHRvIHYzOiBhbHdheXMgbG9nIHRoZSB2YmxhbmsgZHVyYXRpb24gKEFy
ZWspCgogdGVzdHMva21zX2ZsaXAuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mbGlwLmMg
Yi90ZXN0cy9rbXNfZmxpcC5jCmluZGV4IDJhMTU4ZDk3YmJlYy4uMGE4ZDFjNTVhN2FhIDEwMDc1
NQotLS0gYS90ZXN0cy9rbXNfZmxpcC5jCisrKyBiL3Rlc3RzL2ttc19mbGlwLmMKQEAgLTY4Niwx
NCArNjg2LDE2IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgcnVuX3Rlc3Rfc3RlcChzdHJ1Y3QgdGVz
dF9vdXRwdXQgKm8pCiAJICAgICEoby0+cGVuZGluZ19ldmVudHMgJiBFVkVOVF9WQkxBTkspICYm
IG8tPmZsaXBfc3RhdGUuY291bnQgPiAwKSB7CiAJCXN0cnVjdCB2YmxhbmtfcmVwbHkgcmVwbHk7
CiAJCXVuc2lnbmVkIGludCBleHBfc2VxOwotCQl1bnNpZ25lZCBsb25nIHN0YXJ0OworCQl1bnNp
Z25lZCBsb25nIHN0YXJ0LCBlbmQ7CgogCQlleHBfc2VxID0gby0+ZmxpcF9zdGF0ZS5jdXJyZW50
X3NlcTsKIAkJc3RhcnQgPSBnZXR0aW1lX3VzKCk7CiAJCWRvX29yX2RpZShfX3dhaXRfZm9yX3Zi
bGFuayhURVNUX1ZCTEFOS19BQlNPTFVURSB8CiAJCQkJCSAgICBURVNUX1ZCTEFOS19CTE9DSywg
by0+cGlwZSwgZXhwX3NlcSwKIAkJCQkJICAgIDAsICZyZXBseSkpOwotCQlpZ3RfYXNzZXJ0KGdl
dHRpbWVfdXMoKSAtIHN0YXJ0IDwgNTAwKTsKKwkJZW5kID0gZ2V0dGltZV91cygpOworCQlpZ3Rf
ZGVidWcoIlZibGFuayB0b29rICVsdXVzXG4iLCBlbmQgLSBzdGFydCk7CisJCWlndF9hc3NlcnQo
ZW5kIC0gc3RhcnQgPCA1MDApOwogCQlpZ3RfYXNzZXJ0X2VxKHJlcGx5LnNlcXVlbmNlLCBleHBf
c2VxKTsKIAkJaWd0X2Fzc2VydCh0aW1lcmNtcCgmcmVwbHkudHMsICZvLT5mbGlwX3N0YXRlLmxh
c3RfdHMsID09KSk7CiAJfQotLQoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldg==
