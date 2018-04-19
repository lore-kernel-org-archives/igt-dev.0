Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459E3897AC
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Apr 2018 15:27:07 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 19 Apr 2018 18:27:04 +0300
Message-Id: <20180419152704.10851-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_force_connector_basic: Don't skip
 when VGA is connected
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IGNhbiBvdmVycmlkZSB0aGUgY29ubmVjdG9yIHN0YXR1cy9FRElEIGp1c3QgZmluZSBldmVuIGlm
IHRoZQp0aGluZyBpcyBhbHJlYWR5IGNvbm5lY3RlZC4gU28gbGV0J3Mgbm90IHNraXAgaW4gdGhh
dCBjYXNlLgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfZm9yY2VfY29ubmVjdG9yX2Jhc2ljLmMgfCAx
IC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21z
X2ZvcmNlX2Nvbm5lY3Rvcl9iYXNpYy5jIGIvdGVzdHMva21zX2ZvcmNlX2Nvbm5lY3Rvcl9iYXNp
Yy5jCmluZGV4IGQxMWE3NzVhMDg5ZC4uNmU5NmM2YmU3ZGFiIDEwMDY0NAotLS0gYS90ZXN0cy9r
bXNfZm9yY2VfY29ubmVjdG9yX2Jhc2ljLmMKKysrIGIvdGVzdHMva21zX2ZvcmNlX2Nvbm5lY3Rv
cl9iYXNpYy5jCkBAIC0xMTUsNyArMTE1LDYgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiph
cmd2KQogCiAJCS8qIFJlYWNxdWlyZSBzdGF0dXMgYWZ0ZXIgY2xlYXJpbmcgYW55IHByZXZpb3Vz
IG92ZXJyaWRlcyAqLwogCQl2Z2FfY29ubmVjdG9yID0gZHJtTW9kZUdldENvbm5lY3Rvcihkcm1f
ZmQsIHZnYV9jb25uZWN0b3JfaWQpOwotCQlpZ3Rfc2tpcF9vbih2Z2FfY29ubmVjdG9yLT5jb25u
ZWN0aW9uID09IERSTV9NT0RFX0NPTk5FQ1RFRCk7CiAKIAkJc3RhcnRfbl9tb2RlcyA9IHZnYV9j
b25uZWN0b3ItPmNvdW50X21vZGVzOwogCQlzdGFydF9jb25uZWN0aW9uID0gdmdhX2Nvbm5lY3Rv
ci0+Y29ubmVjdGlvbjsKLS0gCjIuMTYuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
