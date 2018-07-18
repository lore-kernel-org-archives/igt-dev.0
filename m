Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Wed, 18 Jul 2018 10:45:13 +0100
Message-Id: <20180718094514.5903-8-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180718094514.5903-1-tvrtko.ursulin@linux.intel.com>
References: <20180718094514.5903-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] [PATCH i-g-t 7/8] trace.pl: Basic preemption support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkp1c3QgZm9y
Z2V0IGFib3V0IGVhcmxpZXIgcmVxdWVzdF9pbiBldmVudHMuCgpTaWduZWQtb2ZmLWJ5OiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIHNjcmlwdHMvdHJhY2Uu
cGwgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL3RyYWNlLnBsIGIvc2NyaXB0cy90cmFjZS5wbAppbmRl
eCA2MGQ0Mjg2NWFjYmQuLjQxYmVkZWVmYjc3NiAxMDA3NTUKLS0tIGEvc2NyaXB0cy90cmFjZS5w
bAorKysgYi9zY3JpcHRzL3RyYWNlLnBsCkBAIC00MDgsNyArNDA4LDkgQEAgd2hpbGUgKDw+KSB7
CiAJfSBlbHNpZiAoJHRwX25hbWUgZXEgJ2k5MTU6aTkxNV9yZXF1ZXN0X2luOicpIHsKIAkJbXkg
JXJlcTsKIAotCQlkaWUgaWYgZXhpc3RzICRkYnska2V5fTsKKwkJIyBwcmVlbXB0aW9uCisJCWRl
bGV0ZSAkZGJ7JGtleX0gaWYgZXhpc3RzICRkYnska2V5fTsKKwogCQlkaWUgdW5sZXNzIGV4aXN0
cyAkcXVldWV7JGtleX07CiAJCWRpZSB1bmxlc3MgZXhpc3RzICRzdWJtaXR7JGtleX07CiAKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
SW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
