Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE2B6E134
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2019 10:27:42 +0000 (UTC)
Received: from platvala by thrakatuluk with local (Exim 4.91)
 (envelope-from <petri.latvala@intel.com>) id 1h4NaO-0001NM-6r
 for igt-dev@lists.freedesktop.org; Thu, 14 Mar 2019 12:27:40 +0200
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 14 Mar 2019 12:27:40 +0200
Message-Id: <20190314102740.5243-2-petri.latvala@intel.com>
In-Reply-To: <20190314102740.5243-1-petri.latvala@intel.com>
References: <20190314102740.5243-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [CI 2/2] gem_exec_fence: Really loop through all engines
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

Q29udGludWUgaW5zdGVhZCBvZiBicmVha2luZyBvbiB0aGUgZmlyc3QgZW5naW5lLgoKU2lnbmVk
LW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CkNjOiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KUmV2aWV3ZWQtYnk6IENocmlzIFdp
bHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2k5MTUvZ2VtX2V4ZWNf
ZmVuY2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfZmVuY2UuYyBiL3Rlc3RzL2k5
MTUvZ2VtX2V4ZWNfZmVuY2UuYwppbmRleCBiYTQ2NTk1ZC4uYzY2NjE2MjYgMTAwNjQ0Ci0tLSBh
L3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfZmVuY2UuYworKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2Zl
bmNlLmMKQEAgLTI3NCw3ICsyNzQsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2ZlbmNlX2J1c3lfYWxs
KGludCBmZCwgdW5zaWduZWQgZmxhZ3MpCiAKIAkJaWYgKGFsbCA8IDApIHsKIAkJCWFsbCA9IGZl
bmNlOwotCQkJYnJlYWs7CisJCQljb250aW51ZTsKIAkJfQogCiAJCW5ldyA9IHN5bmNfZmVuY2Vf
bWVyZ2UoYWxsLCBmZW5jZSk7Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
