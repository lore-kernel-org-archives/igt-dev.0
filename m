Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6117888AEF
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Oct 2018 16:20:46 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 15 Oct 2018 17:20:37 +0100
Message-Id: <20181015162041.29140-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/4] tests/perf: add support for new oa
 buffer size parameter
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
List-ID: <igt-dev@lists.freedesktop.org>

SGkgYWxsLAoKVGhpcyB2MiB1cGRhdGVzIHBhdGNoIDQgd2l0aCB0aGUgY2hhbmdlcyBzdWdnZXN0
ZWQgYnkgQ2hyaXMgcmVnYXJkaW5nCnRoZSBPQSBidWZmZXIgc2l6ZSBwYXJhbWV0ZXIgdmFsaWQg
dmFsdWVzLiBXZSBhbHNvIHR3ZWFrIHRoZSBtaW5pbXVtCmJ1ZmZlciBzaXplIGZpbGwgZHVyYXRp
b24gcmVxdWlyZW1lbnQgdG8gbWFrZSB0aGUgdGVzdCBtb3JlIHJlbGlhYmxlLgoKQ2hlZXJzLAoK
TGlvbmVsIExhbmR3ZXJsaW4gKDQpOgogIGluY2x1ZGU6IGJ1bXAgZHJtIHVBUEkgaGVhZGVycwog
IHRlc3RzL3BlcmY6IGJ1ZmZlci1maWxsOiBkcm9wIGxvYWQgaGVscGVyIHVzYWdlCiAgdGVzdHMv
cGVyZjogcmVuYW1lIE1BWF9PQV9CVUZGRVJfU0laRQogIHRlc3RzL3BlcmY6IGFkZCBuZXcgdGVz
dHMgZm9yIGNvbmZpZ3VyYWJsZSBPQSBidWZmZXIgc2l6ZQoKIGluY2x1ZGUvZHJtLXVhcGkvYW1k
Z3B1X2RybS5oICB8ICA1MiArKystCiBpbmNsdWRlL2RybS11YXBpL2RybS5oICAgICAgICAgfCAg
MTYgKysKIGluY2x1ZGUvZHJtLXVhcGkvZHJtX2ZvdXJjYy5oICB8IDIxNSArKysrKysrKysrKysr
KwogaW5jbHVkZS9kcm0tdWFwaS9kcm1fbW9kZS5oICAgIHwgIDI2ICstCiBpbmNsdWRlL2RybS11
YXBpL2V0bmF2aXZfZHJtLmggfCAgIDYgKwogaW5jbHVkZS9kcm0tdWFwaS9leHlub3NfZHJtLmgg
IHwgMjQwICsrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtLXVhcGkvaTkxNV9kcm0uaCAgICB8
ICA1NiArKysrCiBpbmNsdWRlL2RybS11YXBpL21zbV9kcm0uaCAgICAgfCAgIDIgKwogaW5jbHVk
ZS9kcm0tdWFwaS90ZWdyYV9kcm0uaCAgIHwgNDkyICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLQogaW5jbHVkZS9kcm0tdWFwaS92YzRfZHJtLmggICAgIHwgIDEzICstCiBpbmNsdWRl
L2RybS11YXBpL3ZpcnRncHVfZHJtLmggfCAgIDEgKwogaW5jbHVkZS9kcm0tdWFwaS92bXdnZnhf
ZHJtLmggIHwgMTY2ICsrKysrKysrLS0tCiB0ZXN0cy9wZXJmLmMgICAgICAgICAgICAgICAgICAg
fCAxMzQgKysrKysrKy0tCiAxMyBmaWxlcyBjaGFuZ2VkLCAxMzQ0IGluc2VydGlvbnMoKyksIDc1
IGRlbGV0aW9ucygtKQoKLS0KMi4xOS4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
