Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75FC89A08
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Feb 2019 09:19:02 +0000 (UTC)
From: Andi Shyti <andi.shyti@intel.com>
Date: Wed,  6 Feb 2019 11:18:50 +0200
Message-Id: <20190206091850.2078-5-andi.shyti@intel.com>
In-Reply-To: <20190206091850.2078-1-andi.shyti@intel.com>
References: <20190206091850.2078-1-andi.shyti@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH v6 4/4] tests: gem_exec_basic: add "exec-ctx"
 buffer execution demo test
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
To: IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlICJleGVjLWN0eCIgaXMgYSBkZW1vIHN1YnRlc3QgaW5zZXJ0ZWQgaW4gdGhlIGdlbV9leGVj
X2Jhc2ljCnRlc3QuIFRoZSBtYWluIGdvYWwgb2YgdGhlIHRlc3QgaXMgdG8gZ2V0IHRvIHRoZSBl
bmdpbmVzIGJ5IHVzaW5nCnRoZSBuZXcgQVBJIGFzIGltcGxlbWVudGVkIGluIGluIGNvbW1pdCA4
NzA3OWUwNCAoImxpYjogaW1wbGVtZW50Cm5ldyBlbmdpbmUgZGlzY292ZXJ5IGludGVyZmFjZSIp
LgoKVGhlICJleGVjLWN0eCIgc3VidGVzdCBzaW1wbHkgZ2V0cyB0aGUgbGlzdCBvZiBlbmdpbmVz
LCBiaW5kcwp0aGVtIHRvIGEgY29udGV4dCBhbmQgZXhlY3V0ZXMgYSBidWZmZXIuIFRoaXMgaXMg
ZG9uZSB0aHJvdWdoIGEKbmV3ICJmb3JfZWFjaF9lbmdpbmVfY3R4IiBsb29wIHdoaWNoIGl0ZXJh
dGVzIHRocm91Z2ggdGhlCmVuZ2luZXMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRpIFNoeXRpIDxhbmRp
LnNoeXRpQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMgfCAxNCAr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS90ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2Jh
c2ljLmMKaW5kZXggZGNiODM4NjRiMWMxLi5iNjg4MjlmNjY0ZGIgMTAwNjQ0Ci0tLSBhL3Rlc3Rz
L2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYworKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMK
QEAgLTEzNSw2ICsxMzUsMjAgQEAgaWd0X21haW4KIAkJCWd0dChmZCwgZS0+ZXhlY19pZCB8IGUt
PmZsYWdzKTsKIAl9CiAKKwlpZ3Rfc3VidGVzdCgiZXhlYy1jdHgiKSB7CisJCXVpbnQzMl90IGN0
eF9pZDsKKwkJc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplMjsKKwkJaW50IGluZGV4
X21hcCA9IDA7CisKKwkJY3R4X2lkID0gZ2VtX2NvbnRleHRfY3JlYXRlKGZkKTsKKworCQlmb3Jf
ZWFjaF9lbmdpbmVfY3R4KGZkLCBjdHhfaWQsIGUyKQorCQkJaWd0X2Fzc2VydChnZW1faGFzX3Jp
bmdfYnlfaWR4KGZkLCArK2luZGV4X21hcCwKKwkJCQkJCSAgICAgICBjdHhfaWQpKTsKKworCQln
ZW1fY29udGV4dF9kZXN0cm95KGZkLCBjdHhfaWQpOworCX0KKwogCWlndF9maXh0dXJlIHsKIAkJ
aWd0X3N0b3BfaGFuZ19kZXRlY3RvcigpOwogCQljbG9zZShmZCk7Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
