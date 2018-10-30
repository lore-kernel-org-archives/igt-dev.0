Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB31D6E168
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Oct 2018 03:36:27 +0000 (UTC)
From: Jyoti Yadav <jyoti.r.yadav@intel.com>
Date: Mon, 29 Oct 2018 23:36:03 -0400
Message-Id: <1540870563-32554-6-git-send-email-jyoti.r.yadav@intel.com>
In-Reply-To: <1540870563-32554-1-git-send-email-jyoti.r.yadav@intel.com>
References: <1540870563-32554-1-git-send-email-jyoti.r.yadav@intel.com>
Subject: [igt-dev] [PATCH i-g-t v3 5/5] [intel-gfx] tests/pm_dc: Added test
 for
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

QWRkZWQgbmV3IHN1YnRlc3QgZm9yIERDNiBlbnRyeSBkdXJpbmcgRFBNUyBvbi9vZmYgY3ljbGUu
CkR1cmluZyBEUE1TIG9uL29mZiBjeWNsZSBEQzYgY291bnRlciBpcyBpbmNyZW1lbnRlZC4KCnYy
OiBSZW5hbWVkIHRoZSBzdWJ0ZXN0IG5hbWUuCnYzOiBSZWJhc2VkLgoKU2lnbmVkLW9mZi1ieTog
SnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29tPgotLS0KIHRlc3RzL3BtX2RjLmMg
fCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3Rlc3RzL3BtX2RjLmMgYi90ZXN0cy9wbV9kYy5jCmluZGV4IDYzMjBjYTcuLmJkNTIxYTAg
MTAwNjQ0Ci0tLSBhL3Rlc3RzL3BtX2RjLmMKKysrIGIvdGVzdHMvcG1fZGMuYwpAQCAtMjQ2LDYg
KzI0NiwxNSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCQljbGVhbnVwKCZk
YXRhKTsKIAl9CiAKKwlpZ3Rfc3VidGVzdCgiZGM2LWRwbXMiKSB7CisJCS8qIENoZWNrIERDNiBj
b3VudGVyIGlzIGF2YWlsYWJsZSBmb3IgdGhlIHBsYXRmb3JtLgorCQkgKiBTa2lwIHRoZSB0ZXN0
IGlmIGNvdW50ZXIgaXMgbm90IGF2YWlsYWJsZS4KKwkJICovCisJCXJlYWRfZGNfY291bnRlcihk
YXRhLmRybV9mZCwgQ0hFQ0tfREM2KTsKKwkJdGVzdF9kY19zdGF0ZV9kcG1zKCZkYXRhLCBDSEVD
S19EQzYpOworCQljbGVhbnVwKCZkYXRhKTsKKwl9CisKIAlpZ3RfZml4dHVyZSB7CiAJCWNsb3Nl
KGRhdGEuZGVidWdmc19mZCk7CiAJCWRpc3BsYXlfZmluaSgmZGF0YSk7Ci0tIAoxLjkuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
