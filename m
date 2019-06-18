Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A66A6E200
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2019 18:01:06 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 18 Jun 2019 23:26:11 +0530
Message-Id: <20190618175617.22546-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/6] DEBUG DC states igt tests patch series
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
Cc: jyoti.r.yadav@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBpcyBhIHJlc3VibWlzc2lvbiBvZiBzZXJpZXMgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy81NjcxMy8KdG8gY29sbGVjdCBEQzYgaWd0IHRlc3QgZmFpbHVyZSBy
ZXBvcnQgZnJvbSBDSSBCYXQgdGVzdC4KVGhpcyBzZXJpZXMgc2tpcCB0aGUgREM2IHRlc3QgaWYg
aW4gY2FzZSBQQzgrIHJlc2lkZW5jaWVzIGxpbWl0ZWQKYnkgQklPUy4KClRoaXMgc2VyaWVzIGFk
ZHMgREMgc3RhdGUgSUdUIHRlc3QgdG8gQ0kgRmFzdCBmZWVkYmFjayBsaXN0LgoKQW5zaHVtYW4g
R3VwdGEgKDEpOgogIERPX05PVF9NRVJHRTogRGVidWcgcGF0Y2ggdG8gY292ZXIgREMgSUdUIHRl
c3QuCgpKeW90aSBZYWRhdiAoNSk6CiAgbGliL2lndF9wbTogaWd0IGxpYiBoZWxwZXIgcm91dGlu
ZXMgdG8gc3VwcG9ydCBEQzUvNiB0ZXN0cwogIHRlc3RzL2k5MTUvaTkxNV9wbV9kYzogQWRkZWQg
bmV3IHRlc3QgdG8gdmVyaWZ5IERpc3BsYXkgQyBTdGF0ZXMKICB0ZXN0cy9pOTE1L2k5MTVfcG1f
ZGM6IEFkZGVkIHRlc3QgZm9yIERDNiBkdXJpbmcgUFNSCiAgdGVzdHMvaTkxNS9pOTE1X3BtX2Rj
OiBBZGRlZCB0ZXN0IGZvciBEQzUgZHVyaW5nIERQTVMKICB0ZXN0cy9pOTE1L2k5MTVfcG1fZGM6
IEFkZGVkIHRlc3QgZm9yIERDNiBkdXJpbmcgRFBNUwoKIGxpYi9pZ3RfcG0uYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAxOTAgKysrKysrKysrKy0tLQogbGliL2lndF9wbS5oICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNiArLQogdGVzdHMvTWFrZWZpbGUuc291cmNlcyAgICAgICAg
ICAgICAgICB8ICAgMyArCiB0ZXN0cy9pOTE1L2k5MTVfcG1fYmFja2xpZ2h0LmMgICAgICAgIHwg
ICA2ICstCiB0ZXN0cy9pOTE1L2k5MTVfcG1fZGMuYyAgICAgICAgICAgICAgIHwgMzg3ICsrKysr
KysrKysrKysrKysrKysrKysrKysrCiB0ZXN0cy9pOTE1L2k5MTVfcG1fcnBtLmMgICAgICAgICAg
ICAgIHwgIDI0ICstCiB0ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IHwgICA0
ICsKIHRlc3RzL21lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogOCBmaWxl
cyBjaGFuZ2VkLCA1NTQgaW5zZXJ0aW9ucygrKSwgNjcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgdGVzdHMvaTkxNS9pOTE1X3BtX2RjLmMKCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
