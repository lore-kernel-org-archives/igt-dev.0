Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA0289590
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 22:07:19 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 10 Apr 2019 15:07:16 -0700
Message-Id: <20190410220716.19449-6-jose.souza@intel.com>
In-Reply-To: <20190410220716.19449-1-jose.souza@intel.com>
References: <20190410220716.19449-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 6/6] tests/fbcon_fbt: Do not keep opening
 debugfs_fd at every setup_drm() call
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

QXMgZGVidWdmc19mZCBpcyB1c2VkIGV2ZW4gYWZ0ZXIgdGhlIHRlYXJkb3duX2RybSgpLCBpdCBp
cyBub3QgY2xvc2VkCmluIHRoaXMgZnVuY3Rpb24gb3IgaW4gYW55IG90aGVyIHBsYWNlLiBBbmQg
dGhlbiBpdCBnZXRzIHdvcnNlIGFzCmV2ZXJ5IGNhbGwgdG8gc2V0dXBfZHJtKCkgd2lsbCBvcGVu
IGFub3RoZXIgZmlsZSBkZXNjcmlwdG9yIHRvCmRlYnVnZnMgZGlyLgoKU28gbGV0cyBtb3ZlIHRo
ZSBvcGVuaW5nIG9mIGRlYnVnZnNfZmQgdG8gc2V0dXBfZW52aXJvbm1lbnQoKSBhbmQgb25seQpv
cGVuIGl0IG9uY2UgYW5kIGNsb3NlIGl0IGJlZm9yZSBsZWF2ZSB0aGUgdGVzdC4KClJldmlld2Vk
LWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
PgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVs
LmNvbT4KLS0tCiB0ZXN0cy9rbXNfZmJjb25fZmJ0LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNf
ZmJjb25fZmJ0LmMgYi90ZXN0cy9rbXNfZmJjb25fZmJ0LmMKaW5kZXggNjcxMTdhMjQuLmQ1MzRh
YmQyIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfZmJjb25fZmJ0LmMKKysrIGIvdGVzdHMva21zX2Zi
Y29uX2ZidC5jCkBAIC02NCw3ICs2NCw2IEBAIHN0YXRpYyB2b2lkIHNldHVwX2RybShzdHJ1Y3Qg
ZHJtX2luZm8gKmRybSkKIAkJcmV0dXJuOwogCiAJZHJtLT5mZCA9IGRybV9vcGVuX2RyaXZlcl9t
YXN0ZXIoRFJJVkVSX0lOVEVMKTsKLQlkcm0tPmRlYnVnZnNfZmQgPSBpZ3RfZGVidWdmc19kaXIo
ZHJtLT5mZCk7CiAKIAlkcm0tPnJlcyA9IGRybU1vZGVHZXRSZXNvdXJjZXMoZHJtLT5mZCk7CiAJ
aWd0X3JlcXVpcmUoZHJtLT5yZXMpOwpAQCAtMjk1LDYgKzI5NCw3IEBAIHN0YXRpYyB2b2lkIHNl
dHVwX2Vudmlyb25tZW50KHN0cnVjdCBkcm1faW5mbyAqZHJtKQogCiAJZHJtX2ZkID0gZHJtX29w
ZW5fZHJpdmVyX21hc3RlcihEUklWRVJfSU5URUwpOwogCWlndF9yZXF1aXJlKGRybV9mZCA+PSAw
KTsKKwlkcm0tPmRlYnVnZnNfZmQgPSBpZ3RfZGVidWdmc19kaXIoZHJtX2ZkKTsKIAlpZ3RfYXNz
ZXJ0KGNsb3NlKGRybV9mZCkgPT0gMCk7CiAKIAkvKgpAQCAtMzA5LDYgKzMwOSw4IEBAIHN0YXRp
YyB2b2lkIHRlYXJkb3duX2Vudmlyb25tZW50KHN0cnVjdCBkcm1faW5mbyAqZHJtKQogewogCWlm
IChkcm0tPmZkID49IDApCiAJCXRlYXJkb3duX2RybShkcm0pOworCisJY2xvc2UoZHJtLT5kZWJ1
Z2ZzX2ZkKTsKIH0KIAogaWd0X21haW4KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
