Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C8789AFF
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2019 11:38:22 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon,  9 Sep 2019 14:38:08 +0300
Message-Id: <20190909113809.1229-3-petri.latvala@intel.com>
In-Reply-To: <20190909113809.1229-1-petri.latvala@intel.com>
References: <20190909113809.1229-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] HAX: Check all conditions to abort
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

LS0tCiBydW5uZXIvZXhlY3V0b3IuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ydW5uZXIvZXhlY3V0b3IuYyBi
L3J1bm5lci9leGVjdXRvci5jCmluZGV4IDZhYzk1NjYzLi41ZWQxOTFmOSAxMDA2NDQKLS0tIGEv
cnVubmVyL2V4ZWN1dG9yLmMKKysrIGIvcnVubmVyL2V4ZWN1dG9yLmMKQEAgLTM1OCw3ICszNTgs
NyBAQCBzdGF0aWMgY2hhciAqbmVlZF90b19hYm9ydChjb25zdCBzdHJ1Y3Qgc2V0dGluZ3MqIHNl
dHRpbmdzKQogCWZvciAoaXQgPSBhYm9ydF9oYW5kbGVyczsgaXQtPmNvbmRpdGlvbjsgaXQrKykg
ewogCQljaGFyICphYm9ydDsKIAotCQlpZiAoIShzZXR0aW5ncy0+YWJvcnRfbWFzayAmIGl0LT5j
b25kaXRpb24pKQorCQlpZiAoZmFsc2UgJiYgIShzZXR0aW5ncy0+YWJvcnRfbWFzayAmIGl0LT5j
b25kaXRpb24pKQogCQkJY29udGludWU7CiAKIAkJYWJvcnQgPSBpdC0+aGFuZGxlcigpOwpAQCAt
MTQ3NSw2ICsxNDc1LDkgQEAgYm9vbCBleGVjdXRlKHN0cnVjdCBleGVjdXRlX3N0YXRlICpzdGF0
ZSwKIAogCWluaXRfd2F0Y2hkb2dzKHNldHRpbmdzKTsKIAorCWlmICh0cnVlIHx8IHNldHRpbmdz
LT5hYm9ydF9tYXNrICYgQUJPUlRfUElORykKKwkJcGluZ19jb25maWcoKTsKKwogCWlmICghdW5h
bWUoJnVuYW1lYnVmKSkgewogCQlkcHJpbnRmKHVuYW1lZmQsICIlcyAlcyAlcyAlcyAlc1xuIiwK
IAkJCXVuYW1lYnVmLnN5c25hbWUsCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
