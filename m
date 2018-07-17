Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E6A6E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jul 2018 18:59:07 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 17 Jul 2018 11:58:51 -0700
Message-Id: <20180717185851.20502-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/psr: Add a few PSR tests to
 fastfeedback test list for some coverage
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
Cc: Martin Peres <martin.peres@linux.intel.com>, Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UFNSIHRlc3RzIGFyZSBwcmltYXJpbHkgZXhlY3V0ZWQgb24gc2hhcmRzIG1hY2hpbmVzIHRoYXQg
ZG8gbm90IGhhdmUgdGhlCnJlcXVpcmVkIHBhbmVscywgdGhlIG9ubHkgdGVzdCBpbiBmYXN0ZmVl
ZGJhY2sgZG9lcyBub3QgZG8gbXVjaC4gU28gYWRkCnRoZXNlIHRlc3RzIHRvIHByb3ZpZGUgc29t
ZSBtZWFuaW5nZnVsIGNvdmVyYWdlLgoKQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGlu
dGVsLmNvbT4KQ2M6IE1hcnRpbiBQZXJlcyA8bWFydGluLnBlcmVzQGxpbnV4LmludGVsLmNvbT4K
U2lnbmVkLW9mZi1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBp
bnRlbC5jb20+Ci0tLQogdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCB8IDUg
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IGIvdGVzdHMv
aW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdAppbmRleCA0YjQwNWUzNi4uMmUxYWJmMjMg
MTAwNjQ0Ci0tLSBhL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKKysrIGIv
dGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdApAQCAtMjQzLDcgKzI0MywxMCBA
QCBpZ3RAa21zX3BpcGVfY3JjX2Jhc2ljQHJlYWQtY3JjLXBpcGUtYy1mcmFtZS1zZXF1ZW5jZQog
aWd0QGttc19waXBlX2NyY19iYXNpY0BzdXNwZW5kLXJlYWQtY3JjLXBpcGUtYQogaWd0QGttc19w
aXBlX2NyY19iYXNpY0BzdXNwZW5kLXJlYWQtY3JjLXBpcGUtYgogaWd0QGttc19waXBlX2NyY19i
YXNpY0BzdXNwZW5kLXJlYWQtY3JjLXBpcGUtYwotaWd0QGttc19wc3JAYmFzaWMKK2lndEBrbXNf
cHNyQHByaW1hcnlfcGFnZV9mbGlwCitpZ3RAa21zX3BzckBjdXJzb3JfcGxhbmVfbW92ZQoraWd0
QGttc19wc3JAc3ByaXRlX3BsYW5lX29ub2ZmCitpZ3RAa21zX3BzckBwcmltYXJ5X21tYXBfZ3R0
CiBpZ3RAa21zX3NldG1vZGVAYmFzaWMtY2xvbmUtc2luZ2xlLWNydGMKIGlndEBwbV9iYWNrbGln
aHRAYmFzaWMtYnJpZ2h0bmVzcwogaWd0QHBtX3JwbUBiYXNpYy1wY2ktZDMtc3RhdGUKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
