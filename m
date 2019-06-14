Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23769894D7
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2019 10:57:33 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 14 Jun 2019 13:57:45 +0300
Message-Id: <20190614105745.29648-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: improve logging when timing
 out
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
aHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1MzYzCi0tLQog
dGVzdHMva21zX2ZsaXAuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mbGlwLmMgYi90ZXN0
cy9rbXNfZmxpcC5jCmluZGV4IDJhMTU4ZDk3YmJlYy4uMzAxNTgzNmMwMTg2IDEwMDc1NQotLS0g
YS90ZXN0cy9rbXNfZmxpcC5jCisrKyBiL3Rlc3RzL2ttc19mbGlwLmMKQEAgLTY4NiwxNCArNjg2
LDE2IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgcnVuX3Rlc3Rfc3RlcChzdHJ1Y3QgdGVzdF9vdXRw
dXQgKm8pCiAJICAgICEoby0+cGVuZGluZ19ldmVudHMgJiBFVkVOVF9WQkxBTkspICYmIG8tPmZs
aXBfc3RhdGUuY291bnQgPiAwKSB7CiAJCXN0cnVjdCB2YmxhbmtfcmVwbHkgcmVwbHk7CiAJCXVu
c2lnbmVkIGludCBleHBfc2VxOwotCQl1bnNpZ25lZCBsb25nIHN0YXJ0OworCQl1bnNpZ25lZCBs
b25nIHN0YXJ0LCBlbmQ7CgogCQlleHBfc2VxID0gby0+ZmxpcF9zdGF0ZS5jdXJyZW50X3NlcTsK
IAkJc3RhcnQgPSBnZXR0aW1lX3VzKCk7CiAJCWRvX29yX2RpZShfX3dhaXRfZm9yX3ZibGFuayhU
RVNUX1ZCTEFOS19BQlNPTFVURSB8CiAJCQkJCSAgICBURVNUX1ZCTEFOS19CTE9DSywgby0+cGlw
ZSwgZXhwX3NlcSwKIAkJCQkJICAgIDAsICZyZXBseSkpOwotCQlpZ3RfYXNzZXJ0KGdldHRpbWVf
dXMoKSAtIHN0YXJ0IDwgNTAwKTsKKwkJZW5kID0gZ2V0dGltZV91cygpOworCQlpZ3RfYXNzZXJ0
X2YoZW5kIC0gc3RhcnQgPCA1MDAsICJXYWl0IHZibGFuayB0aW1lZCBvdXQ6ICVsdXVzIiwKKwkJ
CSAgICAgZW5kIC0gc3RhcnQpOwogCQlpZ3RfYXNzZXJ0X2VxKHJlcGx5LnNlcXVlbmNlLCBleHBf
c2VxKTsKIAkJaWd0X2Fzc2VydCh0aW1lcmNtcCgmcmVwbHkudHMsICZvLT5mbGlwX3N0YXRlLmxh
c3RfdHMsID09KSk7CiAJfQotLQoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldg==
