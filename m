Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AAC89FF7
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jul 2021 14:12:43 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Tue, 20 Jul 2021 16:12:29 +0200
Message-Id: <20210720141232.12812-2-andrzej.turko@linux.intel.com>
In-Reply-To: <20210720141232.12812-1-andrzej.turko@linux.intel.com>
References: <20210720141232.12812-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/intel_allocator: Fix argument names
 in declarations
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

VW5pZnkgdGhlIGFyZ3VtZW50IG5hbWVzIHRvIGF2b2lkIGNvbmZ1c2lvbi4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJ6ZWogVHVya28gPGFuZHJ6ZWoudHVya29AbGludXguaW50ZWwuY29tPgpDYzogWmJp
Z25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Ci0tLQog
bGliL2ludGVsX2FsbG9jYXRvci5oIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvaW50ZWxfYWxsb2Nh
dG9yLmggYi9saWIvaW50ZWxfYWxsb2NhdG9yLmgKaW5kZXggYzE0ZjU3YjRkLi43ZDlkMDExMjMg
MTAwNjQ0Ci0tLSBhL2xpYi9pbnRlbF9hbGxvY2F0b3IuaAorKysgYi9saWIvaW50ZWxfYWxsb2Nh
dG9yLmgKQEAgLTE0NCwxMyArMTQ0LDEzIEBAIHN0cnVjdCBpbnRlbF9hbGxvY2F0b3IgewogCQkJ
ICB1aW50NjRfdCBzaXplLCB1aW50NjRfdCBhbGlnbm1lbnQsCiAJCQkgIGVudW0gYWxsb2NhdG9y
X3N0cmF0ZWd5IHN0cmF0ZWd5KTsKIAlib29sICgqaXNfYWxsb2NhdGVkKShzdHJ1Y3QgaW50ZWxf
YWxsb2NhdG9yICppYWwsIHVpbnQzMl90IGhhbmRsZSwKLQkJCSAgICAgdWludDY0X3Qgc2l6ZSwg
dWludDY0X3QgYWxpZ25tZW50KTsKKwkJCSAgICAgdWludDY0X3Qgc2l6ZSwgdWludDY0X3Qgb2Zm
c2V0KTsKIAlib29sICgqcmVzZXJ2ZSkoc3RydWN0IGludGVsX2FsbG9jYXRvciAqaWFsLAotCQkJ
dWludDMyX3QgaGFuZGxlLCB1aW50NjRfdCBzdGFydCwgdWludDY0X3Qgc2l6ZSk7CisJCQl1aW50
MzJfdCBoYW5kbGUsIHVpbnQ2NF90IHN0YXJ0LCB1aW50NjRfdCBlbmQpOwogCWJvb2wgKCp1bnJl
c2VydmUpKHN0cnVjdCBpbnRlbF9hbGxvY2F0b3IgKmlhbCwKLQkJCSAgdWludDMyX3QgaGFuZGxl
LCB1aW50NjRfdCBzdGFydCwgdWludDY0X3Qgc2l6ZSk7CisJCQkgIHVpbnQzMl90IGhhbmRsZSwg
dWludDY0X3Qgc3RhcnQsIHVpbnQ2NF90IGVuZCk7CiAJYm9vbCAoKmlzX3Jlc2VydmVkKShzdHJ1
Y3QgaW50ZWxfYWxsb2NhdG9yICppYWwsCi0JCQkgICAgdWludDY0X3Qgc3RhcnQsIHVpbnQ2NF90
IHNpemUpOworCQkJICAgIHVpbnQ2NF90IHN0YXJ0LCB1aW50NjRfdCBlbmQpOwogCWJvb2wgKCpm
cmVlKShzdHJ1Y3QgaW50ZWxfYWxsb2NhdG9yICppYWwsIHVpbnQzMl90IGhhbmRsZSk7CiAKIAl2
b2lkICgqZGVzdHJveSkoc3RydWN0IGludGVsX2FsbG9jYXRvciAqaWFsKTsKLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
