Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8AE6E095
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 20:36:31 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Wed,  9 May 2018 13:36:29 -0700
Message-Id: <20180509203629.10409-1-antonio.argenziano@intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/igt_dummyload: Fix possible NULL
 pointer dereference
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
List-ID: <igt-dev@lists.freedesktop.org>

TWFrZSBzdXJlIHRoYXQgb25lIG9mIHRoZSAnbW1hcCcgZnVuY3Rpb25zIHJldHVybnMgYSB2YWxp
ZCBwb2ludGVyIHRvCmF2b2lkIGRlcmVmZXJlbmNpbmcgYSBOVUxMIHBvaW50ZXIgbGF0ZXIgb24u
IChJc3N1ZSBmb3VuZCB2aWEgY292ZXJpdHkpCgpTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vu
emlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Ci0tLQogbGliL2lndF9kdW1teWxv
YWQuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9saWIvaWd0X2R1bW15bG9hZC5jIGIvbGliL2lndF9kdW1teWxvYWQuYwppbmRleCBiYTkxN2Jh
NS4uZTk2YzA3Y2YgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZHVtbXlsb2FkLmMKKysrIGIvbGliL2ln
dF9kdW1teWxvYWQuYwpAQCAtMTI1LDYgKzEyNSw4IEBAIGVtaXRfcmVjdXJzaXZlX2JhdGNoKGln
dF9zcGluX3QgKnNwaW4sIGludCBmZCwgdWludDMyX3QgY3R4LCB1bnNpZ25lZCBlbmdpbmUsCiAJ
aWYgKCFiYXRjaCkKIAkJYmF0Y2ggPSBfX2dlbV9tbWFwX19ndHQoZmQsIG9ialtCQVRDSF0uaGFu
ZGxlLAogCQkJCSAgICAgICAJQkFUQ0hfU0laRSwgUFJPVF9XUklURSk7CisJaWd0X2Fzc2VydChi
YXRjaCk7CisKIAlnZW1fc2V0X2RvbWFpbihmZCwgb2JqW0JBVENIXS5oYW5kbGUsCiAJCQlJOTE1
X0dFTV9ET01BSU5fR1RULCBJOTE1X0dFTV9ET01BSU5fR1RUKTsKIAlleGVjYnVmLT5idWZmZXJf
Y291bnQrKzsKLS0gCjIuMTYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
