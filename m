Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEB96E043
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 12:06:46 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 13 Mar 2019 14:06:38 +0200
Message-Id: <20190313120641.7350-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] gem_exec_gttfill: Plug memory leak
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

YnkgZnJlZWluZyBiYXRjaGVzIGluIGZpbGxndHQoKQoKU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0
dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fZXhlY19n
dHRmaWxsLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfZ3R0ZmlsbC5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19n
dHRmaWxsLmMKaW5kZXggZWZkNjEyYmIuLmM1NjI3YzgwIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1
L2dlbV9leGVjX2d0dGZpbGwuYworKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2d0dGZpbGwuYwpA
QCAtMTk2LDYgKzE5Niw3IEBAIHN0YXRpYyB2b2lkIGZpbGxndHQoaW50IGZkLCB1bnNpZ25lZCBy
aW5nLCBpbnQgdGltZW91dCkKIAkJbXVubWFwKGJhdGNoZXNbaV0ucHRyLCBCQVRDSF9TSVpFKTsK
IAkJZ2VtX2Nsb3NlKGZkLCBiYXRjaGVzW2ldLmhhbmRsZSk7CiAJfQorCWZyZWUoYmF0Y2hlcyk7
CiAKIAlzaGFyZWRbbmVuZ2luZV0gPSAwOwogCWZvciAodW5zaWduZWQgaSA9IDA7IGkgPCBuZW5n
aW5lOyBpKyspCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
