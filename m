Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2158B6EFD7
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:04 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:31 +0200
Message-Id: <20190116112050.27647-3-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 02/21] lib/i915/gem_context: Help static
 analysis with execution flow
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

SWYgYW4gaWd0X2lvY3RsIGZhaWxzLCBlcnJubyBpcyBzZXQgdG8gbm9uLXplcm8sIGFuZCBzdGF0
aWMgYW5hbHlzaXMKZG9lc24ndCBxdWl0ZSBnZXQgaXQuIEFkZCBhbiBpZ3RfYXNzdW1lKCkgdG8g
aGVscC4KClNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwu
Y29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBNaWNo
YcWCIFdpbmlhcnNraSA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+Ci0tLQogbGliL2k5MTUv
Z2VtX2NvbnRleHQuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pOTE1L2dlbV9jb250ZXh0LmMgYi9s
aWIvaTkxNS9nZW1fY29udGV4dC5jCmluZGV4IDY2OWJkMzE4Li43ODFkZWEwMCAxMDA2NDQKLS0t
IGEvbGliL2k5MTUvZ2VtX2NvbnRleHQuYworKysgYi9saWIvaTkxNS9nZW1fY29udGV4dC5jCkBA
IC04Miw4ICs4MiwxMCBAQCBpbnQgX19nZW1fY29udGV4dF9jcmVhdGUoaW50IGZkLCB1aW50MzJf
dCAqY3R4X2lkKQogICAgICAgIG1lbXNldCgmY3JlYXRlLCAwLCBzaXplb2YoY3JlYXRlKSk7CiAg
ICAgICAgaWYgKGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX0k5MTVfR0VNX0NPTlRFWFRfQ1JFQVRF
LCAmY3JlYXRlKSA9PSAwKQogICAgICAgICAgICAgICAgKmN0eF9pZCA9IGNyZWF0ZS5jdHhfaWQ7
Ci0gICAgICAgZWxzZQotICAgICAgICAgICAgICAgZXJyID0gLWVycm5vOworICAgICAgIGVsc2Ug
eworCSAgICAgICBlcnIgPSAtZXJybm87CisJICAgICAgIGlndF9hc3N1bWUoZXJyICE9IDApOwor
ICAgICAgIH0KIAogICAgICAgIGVycm5vID0gMDsKICAgICAgICByZXR1cm4gZXJyOwotLSAKMi4x
OS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
