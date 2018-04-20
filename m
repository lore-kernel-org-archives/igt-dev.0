Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBF96E245
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Apr 2018 11:15:51 +0000 (UTC)
From: Lukasz Kalamarz <lukasz.kalamarz@intel.com>
Date: Fri, 20 Apr 2018 13:15:27 +0200
Message-Id: <20180420111528.14430-3-lukasz.kalamarz@intel.com>
In-Reply-To: <20180420111528.14430-1-lukasz.kalamarz@intel.com>
References: <20180420111528.14430-1-lukasz.kalamarz@intel.com>
Subject: [igt-dev] [PATCH i-g-t v4 3/4] lib/intel_batchbuffer: Removal of
 state variable from a intel_batchbuffer structure
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
List-ID: <igt-dev@lists.freedesktop.org>

V2l0aCBhIHJlbW92YWwgb2YgYWxsIHJlZmVyZW5jZXMgdG8gc3RhdGUgdmFyaWFibGUgdGhlcmUg
aXMKbm8gbG9uZ2VyIGFueSBuZWVkIHRvIGtlZXAgaXQgaW4gc3RydWN0dXJlLgoKU2lnbmVkLW9m
Zi1ieTogTHVrYXN6IEthbGFtYXJ6IDxsdWthc3oua2FsYW1hcnpAaW50ZWwuY29tPgpDYzogS2F0
YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+CkNjOiBSYWRvc2xhdyBTendpY2h0
ZW5iZXJnIDxyYWRvc2xhdy5zendpY2h0ZW5iZXJnQGludGVsLmNvbT4KQ2M6IERhbmllbGUgQ2Vy
YW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+Ci0tLQogbGliL2lu
dGVsX2JhdGNoYnVmZmVyLmggfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvbGliL2ludGVsX2JhdGNoYnVmZmVyLmggYi9saWIvaW50ZWxfYmF0Y2hidWZm
ZXIuaAppbmRleCAyYzI2MmQ3Li42NzQ0YmNiIDEwMDY0NAotLS0gYS9saWIvaW50ZWxfYmF0Y2hi
dWZmZXIuaAorKysgYi9saWIvaW50ZWxfYmF0Y2hidWZmZXIuaApAQCAtMjEsNyArMjEsNiBAQCBz
dHJ1Y3QgaW50ZWxfYmF0Y2hidWZmZXIgewogCiAJdWludDhfdCBidWZmZXJbQkFUQ0hfU1pdOwog
CXVpbnQ4X3QgKnB0ciwgKmVuZDsKLQl1aW50OF90ICpzdGF0ZTsKIH07CiAKIHN0cnVjdCBpbnRl
bF9iYXRjaGJ1ZmZlciAqaW50ZWxfYmF0Y2hidWZmZXJfYWxsb2MoZHJtX2ludGVsX2J1Zm1nciAq
YnVmbWdyLAotLSAKMi45LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
