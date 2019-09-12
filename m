Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803C46EC4F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2019 08:18:05 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Thu, 12 Sep 2019 13:46:35 +0530
Message-Id: <1568276198-6363-6-git-send-email-jeevan.b@intel.com>
In-Reply-To: <1568276198-6363-1-git-send-email-jeevan.b@intel.com>
References: <1568276198-6363-1-git-send-email-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t 5/8] tests/i915/i915_pm_dc: Added test for
 DC6 during DPMS
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
Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogSnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29tPgoKQWRkZWQgbmV3IHN1
YnRlc3QgZm9yIERDNiBlbnRyeSBkdXJpbmcgRFBNUyBvbi9vZmYgY3ljbGUuCkR1cmluZyBEUE1T
IG9uL29mZiBjeWNsZSBEQzYgY291bnRlciBpcyBpbmNyZW1lbnRlZC4KCnYyOiBSZW5hbWVkIHRo
ZSBzdWJ0ZXN0IG5hbWUuCnYzOiBSZWJhc2VkLgp2NDogQWRkcmVzc2VkIHJldmlldyBjb21tZW50
IGJ5IHJlcGxhY2luZyBpZ3RfZGlzcGxheV9pbml0KCkgdG8KICAgIGlndF9kaXNwbGF5X3JlcXVp
cmUoKSwgY2hhbmdlcyBnb3QgZG9uZSBpbiBwYXRjaCBzZXQgMi4KdjU6IEFkZHJlc3NlZCB0aGUg
cmV2aWV3IGNvbW1lbnQgYnkgcmVtb3ZpbmcgcmVkdW5kYW50IHJlYWRfZGNfY291bnRlcigpCiAg
ICBzdWdnZXN0ZWQgYnkgSW1yZS4KICAgIExpc3RpbmcgYWN0dWFsIGNoYW5nZSBpbiBwYXRjaCBz
ZXQgY2hhbmdlbG9nIHRvIG1ha2UgcmV2aWV3IGVhc2llci4KdjY6IFJlYmFzZWQgZHVlIHRvIHRl
c3QgbmFtZSBwbV9kYyBjaGFuZ2VkIHRvIGk5MTVfcG1fZGMsIGFsaWduaW5nIHRvCiAgICBvdGhl
ciBQTSB0ZXN0cy4Kdjc6IEludHJvZHVjZWQgc2V0dXBfZGNfZHBtcygpIGlub3JkZXIgdG8gZGlz
YWJsZSBpOTE1IHJ1bnRpbWUgUE0gZm9yCiAgICB0aGUgcGxhdGZvcm0gc3VwcG9ydHMgREM5LgoK
U2lnbmVkLW9mZi1ieTogSnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbnNodW1hbiBHdXB0YSA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPgotLS0K
IHRlc3RzL2k5MTUvaTkxNV9wbV9kYy5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvaTkxNV9wbV9kYy5jIGIvdGVzdHMv
aTkxNS9pOTE1X3BtX2RjLmMKaW5kZXggY2Q5NzY4Yy4uYjkzNDY2YSAxMDA2NDQKLS0tIGEvdGVz
dHMvaTkxNS9pOTE1X3BtX2RjLmMKKysrIGIvdGVzdHMvaTkxNS9pOTE1X3BtX2RjLmMKQEAgLTI3
OCw2ICsyNzgsMTEgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAkJdGVzdF9k
Y19zdGF0ZV9kcG1zKCZkYXRhLCBDSEVDS19EQzUpOwogCX0KIAorCWlndF9kZXNjcmliZSgiREM2
IGlndCB0ZXN0IHdpdGggYWxsIGNvbm5lY3RvcnMgRFBNUyBPRkYvT04iKTsKKwlpZ3Rfc3VidGVz
dCgiZGM2LWRwbXMiKSB7CisJCXRlc3RfZGNfc3RhdGVfZHBtcygmZGF0YSwgQ0hFQ0tfREM2KTsK
Kwl9CisKIAlpZ3RfZml4dHVyZSB7CiAJCWNsb3NlKGRhdGEuZGVidWdmc19mZCk7CiAJCWRpc3Bs
YXlfZmluaSgmZGF0YSk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
