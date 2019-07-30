Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 30 Jul 2019 22:24:53 +0100
Message-Id: <20190730212454.6954-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_exec_schedule: Avoid using
 borked engines
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Q2hlY2sgZm9yIHZpYWJpbGl0eSBvZiBzdG9yZS1kd29yZCBiZWZvcmUgdXNlLgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMv
aTkxNS9nZW1fZXhlY19zY2hlZHVsZS5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1f
ZXhlY19zY2hlZHVsZS5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19zY2hlZHVsZS5jCmluZGV4IDRj
Y2FjYmE0MS4uNmU4NDY2Mjk5IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX3NjaGVk
dWxlLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19zY2hlZHVsZS5jCkBAIC0yODIsOSArMjgy
LDExIEBAIHN0YXRpYyB2b2lkIHNtb2tldGVzdChpbnQgZmQsIHVuc2lnbmVkIHJpbmcsIHVuc2ln
bmVkIHRpbWVvdXQpCiAJbmVuZ2luZSA9IDA7CiAJaWYgKHJpbmcgPT0gQUxMX0VOR0lORVMpIHsK
IAkJZm9yX2VhY2hfcGh5c2ljYWxfZW5naW5lKGZkLCBlbmdpbmUpCi0JCQllbmdpbmVzW25lbmdp
bmUrK10gPSBlbmdpbmU7CisJCQlpZiAoZ2VtX2Nhbl9zdG9yZV9kd29yZChmZCwgZW5naW5lKSkK
KwkJCQllbmdpbmVzW25lbmdpbmUrK10gPSBlbmdpbmU7CiAJfSBlbHNlIHsKLQkJZW5naW5lc1tu
ZW5naW5lKytdID0gcmluZzsKKwkJaWYgKGdlbV9jYW5fc3RvcmVfZHdvcmQoZmQsIHJpbmcpKQor
CQkJZW5naW5lc1tuZW5naW5lKytdID0gcmluZzsKIAl9CiAJaWd0X3JlcXVpcmUobmVuZ2luZSk7
CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
