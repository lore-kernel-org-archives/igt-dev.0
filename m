Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31DA89395
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2019 11:28:13 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 16 May 2019 14:27:55 +0300
Message-Id: <20190516112755.28311-2-petri.latvala@intel.com>
In-Reply-To: <20190516112755.28311-1-petri.latvala@intel.com>
References: <20190516112755.28311-1-petri.latvala@intel.com>
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
bmVyL2V4ZWN1dG9yLmMKaW5kZXggYmU3ODQ3NGMuLjcyZjJmMDIwIDEwMDY0NAotLS0gYS9ydW5u
ZXIvZXhlY3V0b3IuYworKysgYi9ydW5uZXIvZXhlY3V0b3IuYwpAQCAtMzM5LDcgKzMzOSw3IEBA
IHN0YXRpYyBjaGFyICpuZWVkX3RvX2Fib3J0KGNvbnN0IHN0cnVjdCBzZXR0aW5ncyogc2V0dGlu
Z3MpCiAJZm9yIChpdCA9IGFib3J0X2hhbmRsZXJzOyBpdC0+Y29uZGl0aW9uOyBpdCsrKSB7CiAJ
CWNoYXIgKmFib3J0OwogCi0JCWlmICghKHNldHRpbmdzLT5hYm9ydF9tYXNrICYgaXQtPmNvbmRp
dGlvbikpCisJCWlmIChmYWxzZSAmJiAhKHNldHRpbmdzLT5hYm9ydF9tYXNrICYgaXQtPmNvbmRp
dGlvbikpCiAJCQljb250aW51ZTsKIAogCQlhYm9ydCA9IGl0LT5oYW5kbGVyKCk7Ci0tIAoyLjE5
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
