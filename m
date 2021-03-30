Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7865B6E935
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Mar 2021 16:18:51 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 30 Mar 2021 19:18:48 +0300
Message-Id: <20210330161848.18186-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic_transition: Fix the
 is_atomic check
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IHdhbnQgdG8gY2hlY2sgdGhlIHZhbHVlIG9mIGlzX2F0b21pYywgbm90IGl0cyBhZGRyZXNzLiBT
aG91bGQKbWFrZSB0aGUgdGVzdCBza2lwIGNvcnJlY3RseSBhZ2FpbiB3aGVuIHRoZSBkcml2ZXIg
ZG9lc24ndCBhZHZlcnRpc2UKYXRvbWljIHN1cHBvcnQuCgpDYzogTmlkaGkgR3VwdGEgPG5pZGhp
MS5ndXB0YUBpbnRlbC5jb20+CkZpeGVzOiBlNzk2Y2E3Y2U2ZmUgKCJ0ZXN0cy9rbXNfYXRvbWlj
X3RyYW5zaXRpb246cmVkdWNlIGV4ZWN1dGlvbiB0aW1lIikKU2lnbmVkLW9mZi1ieTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNf
YXRvbWljX3RyYW5zaXRpb24uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19hdG9taWNfdHJhbnNpdGlv
bi5jIGIvdGVzdHMva21zX2F0b21pY190cmFuc2l0aW9uLmMKaW5kZXggNDMxODI0ZDBjZGI0Li5i
ZTYwOTQwZDcxYmYgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19hdG9taWNfdHJhbnNpdGlvbi5jCisr
KyBiL3Rlc3RzL2ttc19hdG9taWNfdHJhbnNpdGlvbi5jCkBAIC05OTMsNyArOTkzLDcgQEAgaWd0
X21haW5fYXJncygiIiwgbG9uZ19vcHRzLCBoZWxwX3N0ciwgb3B0X2hhbmRsZXIsICZkYXRhKQog
CQlrbXN0ZXN0X3NldF92dF9ncmFwaGljc19tb2RlKCk7CiAKIAkJaWd0X2Rpc3BsYXlfcmVxdWly
ZSgmZGF0YS5kaXNwbGF5LCBkYXRhLmRybV9mZCk7Ci0JCWlndF9yZXF1aXJlKCZkYXRhLmRpc3Bs
YXkuaXNfYXRvbWljKTsKKwkJaWd0X3JlcXVpcmUoZGF0YS5kaXNwbGF5LmlzX2F0b21pYyk7CiAK
IAkJaWd0X2Rpc3BsYXlfcmVxdWlyZV9vdXRwdXQoJmRhdGEuZGlzcGxheSk7CiAKLS0gCjIuMjYu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
