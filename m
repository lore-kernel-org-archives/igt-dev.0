Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907ED89B42
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Oct 2018 15:28:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 63-v6so34126059wra.11
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Oct 2018 08:28:27 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Thu, 18 Oct 2018 16:28:01 +0100
Message-Id: <20181018152815.31816-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20181018152815.31816-1-tvrtko.ursulin@linux.intel.com>
References: <20181018152815.31816-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 03/17] trace.pl: Virtual engine preemption
 support
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClVzZSB0aGUg
J2NvbXBsZXRlZD8nIHRyYWNlcG9pbnQgZmllbGQgdG8gZGV0ZWN0IG1vcmUgcm9idXN0bHkgd2hl
biBhCnJlcXVlc3QgaGFzIGJlZW4gcHJlZW1wdGVkIGFuZCByZW1vdmUgaXQgZnJvbSB0aGUgZW5n
aW5lIGRhdGFiYXNlIGlmIHNvLgoKT3RoZXJ3aXNlIHRoZSBzY3JpcHQgY2FuIGhpdCBhIHNjZW5h
cmlvIHdoZXJlIHRoZSBzYW1lIGdsb2JhbCBzZXFubyB3aWxsCmJlIG1lbnRpb25lZCBtdWx0aXBs
ZSB0aW1lcyAob24gYW4gZW5naW5lIHNlcW5vKSB3aGljaCBhYm9ydHMgcHJvY2Vzc2luZy4KClNp
Z25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0t
LQogc2NyaXB0cy90cmFjZS5wbCB8IDE0ICsrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvdHJh
Y2UucGwgYi9zY3JpcHRzL3RyYWNlLnBsCmluZGV4IDcyNzQ3YjA0NjIwMi4uYTU1ZTRmMzk1Mzlh
IDEwMDc1NQotLS0gYS9zY3JpcHRzL3RyYWNlLnBsCisrKyBiL3NjcmlwdHMvdHJhY2UucGwKQEAg
LTQ4MSwxMiArNDgxLDE2IEBAIHdoaWxlICg8PikgewogCX0gZWxzaWYgKCR0cF9uYW1lIGVxICdp
OTE1Omk5MTVfcmVxdWVzdF9vdXQ6JykgewogCQlteSAkZ2tleSA9IGdsb2JhbF9rZXkoJHJpbmcs
ICR0cHsnZ2xvYmFsJ30pOwogCi0JCWRpZSB1bmxlc3MgZXhpc3RzICRkYnska2V5fTsKLQkJZGll
IHVubGVzcyBleGlzdHMgJGRieyRrZXl9LT57J3N0YXJ0J307Ci0JCWRpZSBpZiBleGlzdHMgJGRi
eyRrZXl9LT57J2VuZCd9OworCQlpZiAoJHRweydjb21wbGV0ZWQ/J30pIHsKKwkJCWRpZSB1bmxl
c3MgZXhpc3RzICRkYnska2V5fTsKKwkJCWRpZSB1bmxlc3MgZXhpc3RzICRkYnska2V5fS0+eydz
dGFydCd9OworCQkJZGllIGlmIGV4aXN0cyAkZGJ7JGtleX0tPnsnZW5kJ307CiAKLQkJJGRieyRr
ZXl9LT57J2VuZCd9ID0gJHRpbWU7Ci0JCSRkYnska2V5fS0+eydub3RpZnknfSA9ICRub3RpZnl7
JGdrZXl9IGlmIGV4aXN0cyAkbm90aWZ5eyRna2V5fTsKKwkJCSRkYnska2V5fS0+eydlbmQnfSA9
ICR0aW1lOworCQkJJGRieyRrZXl9LT57J25vdGlmeSd9ID0gJG5vdGlmeXskZ2tleX0gaWYgZXhp
c3RzICRub3RpZnl7JGdrZXl9OworCQl9IGVsc2UgeworCQkJZGVsZXRlICRkYnska2V5fTsKKwkJ
fQogCX0gZWxzaWYgKCR0cF9uYW1lIGVxICdpOTE1OmludGVsX2VuZ2luZV9ub3RpZnk6Jykgewog
CQlteSAkZ2tleSA9IGdsb2JhbF9rZXkoJHJpbmcsICRzZXFubyk7CiAKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
