Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188716E5EE
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Nov 2018 10:33:24 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu,  8 Nov 2018 12:33:15 +0200
Message-Id: <20181108103315.20378-1-petri.latvala@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/pm_rpm: Assert that we get
 connector data
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9DSV9EUk1fNTA4OC9maS1i
eXQtY2xhcHBlci9pZ3RAcG1fcnBtQG1vZHVsZS1yZWxvYWQuaHRtbApzaG93cyB0aGUgdGVzdCBj
cmFzaGluZyBpbiBnZXRfY29ubmVjdG9yX2VkaWQuIERpcmVjdGx5IHRoZXJlLCBub3QgaW4KYW55
IGxpYmRybSBmdW5jdGlvbi4gVGhlIG9ubHkgd2F5IEkgc2VlIHRoYXQgY2FuIGhhcHBlbiBpcyBp
Zgpkcm1Nb2RlR2V0Q29ubmVjdG9yQ3VycmVudCgpIHJldHVybmVkIE5VTEwuCgpUT0RPOiBDaGFu
Z2UgY29tbWl0IG1lc3NhZ2UgZnJvbSByYW5kb20gZ3Vlc3NpbmcgdG8gYW4gZXhwbGFuYXRpb24g
b2YKYW4gYWN0dWFsIGNhdXNlLgoKUmVmZXJlbmNlczogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9w
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA4Njc1ClNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEg
PHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgotLS0KIHRlc3RzL3BtX3JwbS5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9wbV9ycG0uYyBi
L3Rlc3RzL3BtX3JwbS5jCmluZGV4IDc0ODhlZmQ3Li41NDdlMDhhYSAxMDA2NDQKLS0tIGEvdGVz
dHMvcG1fcnBtLmMKKysrIGIvdGVzdHMvcG1fcnBtLmMKQEAgLTM5Niw2ICszOTYsNyBAQCBzdGF0
aWMgdm9pZCBpbml0X21vZGVfc2V0X2RhdGEoc3RydWN0IG1vZGVfc2V0X2RhdGEgKmRhdGEpCiAJ
CWZvciAoaW50IGkgPSAwOyBpIDwgZGF0YS0+cmVzLT5jb3VudF9jb25uZWN0b3JzOyBpKyspIHsK
IAkJCWRhdGEtPmNvbm5lY3RvcnNbaV0gPSBkcm1Nb2RlR2V0Q29ubmVjdG9yQ3VycmVudChkcm1f
ZmQsCiAJCQkJCQkJCQkgZGF0YS0+cmVzLT5jb25uZWN0b3JzW2ldKTsKKwkJCWlndF9hc3NlcnQo
ZGF0YS0+Y29ubmVjdG9yc1tpXSk7CiAJCQlkYXRhLT5lZGlkc1tpXSA9IGdldF9jb25uZWN0b3Jf
ZWRpZChkYXRhLT5jb25uZWN0b3JzW2ldLCBpKTsKIAkJfQogCi0tIAoyLjE4LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
