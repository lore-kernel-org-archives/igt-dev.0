Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2941989E3B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2019 13:16:30 +0000 (UTC)
From: Andi Shyti <andi.shyti@intel.com>
Date: Tue,  5 Mar 2019 15:16:11 +0200
Message-Id: <20190305131611.2367-7-andi.shyti@intel.com>
In-Reply-To: <20190305131611.2367-1-andi.shyti@intel.com>
References: <20190305131611.2367-1-andi.shyti@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH v10 6/6] tests: gem_exec_basic: add "exec-ctx"
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
X2Jhc2ljCnRlc3QuIFRoZSBtYWluIGdvYWwgaXMgdG8gcmVhY2ggdGhlIGVuZ2luZXMgYnkgdXNp
bmcKdGhlIG5ldyB1YXBpIGludGVyZmFjaW5nIHdpdGggaWd0X3JlcXVpcmVfZ2VtX2VuZ2luZV9s
aXN0KCkuCgpUaGUgImV4ZWMtY3R4IiBzdWJ0ZXN0IHNpbXBseSBnZXRzIHRoZSBsaXN0IG9mIGVu
Z2luZXMsIGJpbmRzCnRoZW0gdG8gYSBjb250ZXh0IGFuZCBleGVjdXRlcyBhIGJ1ZmZlci4gVGhp
cyBpcyBkb25lIHRocm91Z2ggYQpuZXcgImZvcl9lYWNoX2VuZ2luZTIiIGxvb3Agd2hpY2ggaXRl
cmF0ZXMgdGhyb3VnaCB0aGUKZW5naW5lcy4KClNpZ25lZC1vZmYtYnk6IEFuZGkgU2h5dGkgPGFu
ZGkuc2h5dGlAaW50ZWwuY29tPgotLS0KIHRlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYyB8IDEy
ICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS90ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2Jh
c2ljLmMKaW5kZXggZGNiODM4NjRiMWMxLi41ZDk1NTE3OWMyYTUgMTAwNjQ0Ci0tLSBhL3Rlc3Rz
L2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYworKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMK
QEAgLTEzNSw2ICsxMzUsMTggQEAgaWd0X21haW4KIAkJCWd0dChmZCwgZS0+ZXhlY19pZCB8IGUt
PmZsYWdzKTsKIAl9CiAKKwlpZ3Rfc3VidGVzdCgiZXhlYy1jdHgiKSB7CisJCXVpbnQzMl90IGN0
eF9pZDsKKwkJaW50IGluZGV4X21hcCA9IDA7CisKKwkJY3R4X2lkID0gZ2VtX2NvbnRleHRfY3Jl
YXRlKGZkKTsKKwkJZm9yX2VhY2hfZW5naW5lMihmZCwgY3R4X2lkKQorCQkJaWd0X2Fzc2VydChn
ZW1fY29udGV4dF9oYXNfZW5naW5lKGZkLCArK2luZGV4X21hcCwKKwkJCQkJCQkgIGN0eF9pZCkp
OworCisJCWdlbV9jb250ZXh0X2Rlc3Ryb3koZmQsIGN0eF9pZCk7CisJfQorCiAJaWd0X2ZpeHR1
cmUgewogCQlpZ3Rfc3RvcF9oYW5nX2RldGVjdG9yKCk7CiAJCWNsb3NlKGZkKTsKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
