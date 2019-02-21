Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B50893EB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 10:24:21 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 21 Feb 2019 12:24:13 +0200
Message-Id: <20190221102413.28800-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH CI] HAX: Default to multiple-mode
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

LS0tCiBydW5uZXIvcnVubmVyX3Rlc3RzLmMgfCA0ICsrKy0KIHJ1bm5lci9zZXR0aW5ncy5jICAg
ICB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9ydW5uZXIvcnVubmVyX3Rlc3RzLmMgYi9ydW5uZXIvcnVubmVyX3Rlc3Rz
LmMKaW5kZXggZTQ2NTY4YWMuLmU0MjZhNzc4IDEwMDY0NAotLS0gYS9ydW5uZXIvcnVubmVyX3Rl
c3RzLmMKKysrIGIvcnVubmVyL3J1bm5lcl90ZXN0cy5jCkBAIC0yMTcsNyArMjE3LDcgQEAgaWd0
X21haW4KIAkJaWd0X2Fzc2VydCghc2V0dGluZ3Muc3luYyk7CiAJCWlndF9hc3NlcnRfZXEoc2V0
dGluZ3MubG9nX2xldmVsLCBMT0dfTEVWRUxfTk9STUFMKTsKIAkJaWd0X2Fzc2VydCghc2V0dGlu
Z3Mub3ZlcndyaXRlKTsKLQkJaWd0X2Fzc2VydCghc2V0dGluZ3MubXVsdGlwbGVfbW9kZSk7CisJ
CWlndF9hc3NlcnQoc2V0dGluZ3MubXVsdGlwbGVfbW9kZSk7CiAJCWlndF9hc3NlcnRfZXEoc2V0
dGluZ3MuaW5hY3Rpdml0eV90aW1lb3V0LCAwKTsKIAkJaWd0X2Fzc2VydF9lcShzZXR0aW5ncy5v
dmVyYWxsX3RpbWVvdXQsIDApOwogCQlpZ3RfYXNzZXJ0KCFzZXR0aW5ncy51c2Vfd2F0Y2hkb2cp
OwpAQCAtMjI2LDYgKzIyNiw4IEBAIGlndF9tYWluCiAJCWlndF9hc3NlcnQoIXNldHRpbmdzLnBp
Z2xpdF9zdHlsZV9kbWVzZyk7CiAJfQogCisJcmV0dXJuOworCiAJaWd0X3N1YnRlc3RfZ3JvdXAg
ewogCQljaGFyICpjd2Q7CiAJCWNoYXIgKnBhdGg7CmRpZmYgLS1naXQgYS9ydW5uZXIvc2V0dGlu
Z3MuYyBiL3J1bm5lci9zZXR0aW5ncy5jCmluZGV4IGU2NDI0NGU2Li4xMjJiZTExMSAxMDA2NDQK
LS0tIGEvcnVubmVyL3NldHRpbmdzLmMKKysrIGIvcnVubmVyL3NldHRpbmdzLmMKQEAgLTIzMiw2
ICsyMzIsNyBAQCBzdGF0aWMgYm9vbCByZWFkYWJsZV9maWxlKGNoYXIgKmZpbGVuYW1lKQogdm9p
ZCBpbml0X3NldHRpbmdzKHN0cnVjdCBzZXR0aW5ncyAqc2V0dGluZ3MpCiB7CiAJbWVtc2V0KHNl
dHRpbmdzLCAwLCBzaXplb2YoKnNldHRpbmdzKSk7CisJc2V0dGluZ3MtPm11bHRpcGxlX21vZGUg
PSB0cnVlOwogfQogCiB2b2lkIGZyZWVfc2V0dGluZ3Moc3RydWN0IHNldHRpbmdzICpzZXR0aW5n
cykKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
