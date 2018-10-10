Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519AA8929B
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Oct 2018 16:57:53 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Wed, 10 Oct 2018 17:57:43 +0100
Message-Id: <20181010165747.23667-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/4] tests/perf: add support for new oa
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

SGkgYWxsLAoKVGhpcyBzZXJpZXMgYWRkIHRlc3RzIGZvciB0aGUgbmV3IE9BIGJ1ZmZlciBzaXpl
IHBhcmFtZXRlciBvbiB0aGUgaTkxNQpwZXJmIHN0cmVhbSBvcGVuIGlvY3RsLgoKQ2hlZXJzLAoK
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
fCAxMjYgKysrKysrKy0tCiAxMyBmaWxlcyBjaGFuZ2VkLCAxMzM2IGluc2VydGlvbnMoKyksIDc1
IGRlbGV0aW9ucygtKQoKLS0KMi4xOS4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
