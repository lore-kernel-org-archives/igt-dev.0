Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB3B8984C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 17:40:39 +0000 (UTC)
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Date: Wed, 13 Mar 2019 18:38:20 +0100
Message-ID: <20190313173821.14659-7-michal.winiarski@intel.com>
In-Reply-To: <20190313173821.14659-1-michal.winiarski@intel.com>
References: <20190313173821.14659-1-michal.winiarski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 7/8] lib/igt_sysfs: Simplify obtaining
 sysfs path
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

Tm93IHRoYXQgd2UndmUgZXh0cmFjdGVkIGNhcmQgaW5kZXgsIHdlIG5vIGxvbmdlciBoYXZlIHRo
ZSBuZWVkIHRvCml0ZXJhdGUgb3ZlciBkZXZpY2Ugbm9kZXMuCgp2MjogRHJvcCByZXQuCgpTaWdu
ZWQtb2ZmLWJ5OiBNaWNoYcWCIFdpbmlhcnNraSA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+
ClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0t
CiBsaWIvaWd0X3N5c2ZzLmMgfCAyNyArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2xpYi9pZ3Rfc3lzZnMuYyBiL2xpYi9pZ3Rfc3lzZnMuYwppbmRleCBhYTg4MDc3NS4uZjgwNmY0
ZmMgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3Rfc3lzZnMuYworKysgYi9saWIvaWd0X3N5c2ZzLmMKQEAg
LTEwNiwzMCArMTA2LDEzIEBAIGNoYXIgKmlndF9zeXNmc19wYXRoKGludCBkZXZpY2UsIGNoYXIg
KnBhdGgsIGludCBwYXRobGVuKQogCWlmIChmc3RhdChkZXZpY2UsICZzdCkgfHwgIVNfSVNDSFIo
c3Quc3RfbW9kZSkpCiAJCXJldHVybiBOVUxMOwogCi0JZm9yIChpbnQgbiA9IDA7IG4gPCAxNjsg
bisrKSB7Ci0JCWludCBsZW4sIHJldCwgbWFqLCBtaW47Ci0JCUZJTEUgKmZpbGU7CisJc25wcmlu
dGYocGF0aCwgcGF0aGxlbiwgIi9zeXMvZGV2L2NoYXIvJWQ6JWQiLAorCQkgbWFqb3Ioc3Quc3Rf
cmRldiksIG1pbm9yKHN0LnN0X3JkZXYpKTsKIAotCQlsZW4gPSBzbnByaW50ZihwYXRoLCBwYXRo
bGVuLCAiL3N5cy9jbGFzcy9kcm0vY2FyZCVkIiwgbik7Ci0KLQkJc3ByaW50ZihwYXRoICsgbGVu
LCAiL2RldiIpOwotCQlmaWxlID0gZm9wZW4ocGF0aCwgInIiKTsKLQkJaWYgKCFmaWxlKQotCQkJ
Y29udGludWU7Ci0KLQkJcmV0ID0gZnNjYW5mKGZpbGUsICIlZDolZCIsICZtYWosICZtaW4pOwot
CQlmY2xvc2UoZmlsZSk7Ci0KLQkJaWYgKHJldCAhPSAyIHx8IG1ham9yKHN0LnN0X3JkZXYpICE9
IG1haiB8fAotCQkgICAgbWlub3Ioc3Quc3RfcmRldikgIT0gbWluKQotCQkJY29udGludWU7Ci0K
LQkJcGF0aFtsZW5dID0gJ1wwJzsKLQotCQlyZXR1cm4gcGF0aDsKLQl9CisJaWYgKGFjY2Vzcyhw
YXRoLCBGX09LKSkKKwkJcmV0dXJuIE5VTEw7CiAKLQlyZXR1cm4gTlVMTDsKKwlyZXR1cm4gcGF0
aDsKIH0KIAogLyoqCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
