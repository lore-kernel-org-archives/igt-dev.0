Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B708925D
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2019 10:16:30 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 20 May 2019 13:16:23 +0300
Message-Id: <20190520101623.12466-2-petri.latvala@intel.com>
In-Reply-To: <20190520101623.12466-1-petri.latvala@intel.com>
References: <20190520101623.12466-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] HAX: Check all conditions to abort
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

LS0tCiBydW5uZXIvZXhlY3V0b3IuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3J1bm5lci9leGVjdXRvci5jIGIvcnVu
bmVyL2V4ZWN1dG9yLmMKaW5kZXggYzA3ZTUzZmEuLjRhNDRjNjMzIDEwMDY0NAotLS0gYS9ydW5u
ZXIvZXhlY3V0b3IuYworKysgYi9ydW5uZXIvZXhlY3V0b3IuYwpAQCAtMzU0LDcgKzM1NCw3IEBA
IHN0YXRpYyBjaGFyICpuZWVkX3RvX2Fib3J0KGNvbnN0IHN0cnVjdCBzZXR0aW5ncyogc2V0dGlu
Z3MpCiAJZm9yIChpdCA9IGFib3J0X2hhbmRsZXJzOyBpdC0+Y29uZGl0aW9uOyBpdCsrKSB7CiAJ
CWNoYXIgKmFib3J0OwogCi0JCWlmICghKHNldHRpbmdzLT5hYm9ydF9tYXNrICYgaXQtPmNvbmRp
dGlvbikpCisJCWlmIChmYWxzZSAmJiAhKHNldHRpbmdzLT5hYm9ydF9tYXNrICYgaXQtPmNvbmRp
dGlvbikpCiAJCQljb250aW51ZTsKIAogCQlhYm9ydCA9IGl0LT5oYW5kbGVyKCk7Ci0tIAoyLjE5
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
