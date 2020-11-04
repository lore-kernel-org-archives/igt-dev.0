Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C286E192
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2020 18:00:20 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed,  4 Nov 2020 19:00:08 +0100
Message-Id: <20201104180008.42282-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201104180008.42282-1-zbigniew.kempczynski@intel.com>
References: <20201104180008.42282-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tools/intel_gpu_top: Fix broken
 integrated device selection
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
Cc: Petri Latvala <petri.latvala@intel.com>, Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

TGFzdCBjaGFuZ2VzIGluY2lkZW50YWxseSBicm9rZSBpbnRlZ3JhdGVkIGRldmljZSBzZWxlY3Rp
b24gb24gIWRpc2NyZXRlCnBsYXRmb3Jtcy4gQWRkIGZhbGxiYWNrIHRvIHNlbGVjdCBjYXJkIGlu
IGRpc2NyZXRlIC8gaW50ZWdyYXRlZCBvcmRlci4KClNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtl
bXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgpDYzogUGV0cmkgTGF0
dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CkNjOiBBeWF6IEEgU2lkZGlxdWkgPGF5YXou
c2lkZGlxdWlAaW50ZWwuY29tPgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0t
CiB0b29scy9pbnRlbF9ncHVfdG9wLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9pbnRlbF9ncHVfdG9w
LmMgYi90b29scy9pbnRlbF9ncHVfdG9wLmMKaW5kZXggMWI2Yzg2MzMuLjI5OGRlZmE0IDEwMDY0
NAotLS0gYS90b29scy9pbnRlbF9ncHVfdG9wLmMKKysrIGIvdG9vbHMvaW50ZWxfZ3B1X3RvcC5j
CkBAIC0xNDAwLDcgKzE0MDAsOSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJ
fSBlbHNlIHsKIAkJcmV0ID0gaWd0X2RldmljZV9maW5kX2ZpcnN0X2k5MTVfZGlzY3JldGVfY2Fy
ZCgmY2FyZCk7CiAJCWlmICghcmV0KQotCQkJZnByaW50ZihzdGRlcnIsICJObyBkZXZpY2UgZmls
dGVyIHNwZWNpZmllZCBhbmQgbm8gZGlzY3JldGUgaTkxNSBkZXZpY2VzIGZvdW5kXG4iKTsKKwkJ
CXJldCA9IGlndF9kZXZpY2VfZmluZF9pbnRlZ3JhdGVkX2NhcmQoJmNhcmQpOworCQlpZiAoIXJl
dCkKKwkJCWZwcmludGYoc3RkZXJyLCAiTm8gZGV2aWNlIGZpbHRlciBzcGVjaWZpZWQgYW5kIG5v
IGRpc2NyZXRlL2ludGVncmF0ZWQgaTkxNSBkZXZpY2VzIGZvdW5kXG4iKTsKIAl9CiAKIAlpZiAo
IXJldCkgewotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
