Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B5289471
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2019 11:21:53 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Thu, 11 Apr 2019 16:53:50 +0530
Message-Id: <20190411112350.21109-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] kms_content_protection: Disable
 authentication when failed
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
To: igt-dev@lists.freedesktop.org, daniel.vetter@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

V2hlbiBjb250ZW50IHByb3RlY3Rpb24gYXV0aGVudGljYXRpb24gaXMgZmFpbGVkIGluIGtlcm5l
bCBhZnRlciBhbGwKcmVxdXJpZWQgcmV0cmllcywgYmVmb3JlIGRlY2xhcmluZyB0aGUgdGVzdCBm
YWlsdXJlLCBzZXQgdGhlIGNvbnRlbnQKcHJvdGVjdGlvbiB0byBVTkRFU0lSRUQgc3RhdGUuCgpU
aGlzIHdpbGwgYXZvaWQgdGhlIEhEQ1AgYXV0aGVudGljYXRpb24gYXR0ZW1wdHMgaW4gc3Vic2Vx
dWVudCBtb2Rlc2V0cwpmcm9tIG90aGVyIHRlc3RzLgoKU2lnbmVkLW9mZi1ieTogUmFtYWxpbmdh
bSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19jb250ZW50X3Byb3Rl
Y3Rpb24uYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3Rlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYyBiL3Rlc3RzL2ttc19jb250ZW50
X3Byb3RlY3Rpb24uYwppbmRleCA3ZmM4NTQyZTc2OWEuLmFlNmFiNDk3ZWEyMSAxMDA2NDQKLS0t
IGEvdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jCisrKyBiL3Rlc3RzL2ttc19jb250ZW50
X3Byb3RlY3Rpb24uYwpAQCAtMjEyLDYgKzIxMiwxMCBAQCBzdGF0aWMgdm9pZCB0ZXN0X2NwX2Vu
YWJsZV93aXRoX3JldHJ5KGlndF9vdXRwdXRfdCAqb3V0cHV0LAogCQlpZiAoIXJldCAmJiAtLXJl
dHJ5KQogCQkJaWd0X2RlYnVnKCJSZXRyeSAoJWQvMikgLi4uXG4iLCAzIC0gcmV0cnkpOwogCX0g
d2hpbGUgKHJldHJ5ICYmICFyZXQpOworCisJaWYgKCFyZXQpCisJCXRlc3RfY3BfZGlzYWJsZShv
dXRwdXQsIHMpOworCiAJaWd0X2Fzc2VydF9mKHJldCwgIkNvbnRlbnQgUHJvdGVjdGlvbiBub3Qg
ZW5hYmxlZFxuIik7CiB9CiAKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
