Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C92E72F89
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 20:01:17 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 26 Jul 2021 22:00:00 +0200
Message-Id: <20210726200026.4815-27-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 26/52] tests/gem_mmap: Add allocator
 support
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
Cc: Sai Gowtham <sai.gowtham.ch@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogU2FpIEdvd3RoYW0gPHNhaS5nb3d0aGFtLmNoQGludGVsLmNvbT4KClNpZ25lZC1vZmYt
Ynk6IFNhaSBHb3d0aGFtIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+CkNjOiBaYmlnbmlldyBL
ZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IFBldHJpIExh
dHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpDYzogQXNodXRvc2ggRGl4aXQgPGFzaHV0
b3NoLmRpeGl0QGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9tbWFwLmMgfCA0ICsrKy0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS90ZXN0cy9pOTE1L2dlbV9tbWFwLmMgYi90ZXN0cy9pOTE1L2dlbV9tbWFwLmMKaW5kZXgg
YTc3YzBhZDYwLi42MWM5YzVjMTkgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX21tYXAuYwor
KysgYi90ZXN0cy9pOTE1L2dlbV9tbWFwLmMKQEAgLTEyMyw4ICsxMjMsOSBAQCB0ZXN0X3BmX25v
bmJsb2NrKGludCBpOTE1KQogewogCWlndF9zcGluX3QgKnNwaW47CiAJdWludDMyX3QgKnB0cjsK
Kwl1aW50NjRfdCBhaG5kID0gZ2V0X3JlbG9jX2FobmQoaTkxNSwgMCk7CiAKLQlzcGluID0gaWd0
X3NwaW5fbmV3KGk5MTUpOworCXNwaW4gPSBpZ3Rfc3Bpbl9uZXcoaTkxNSwgLmFobmQgPSBhaG5k
KTsKIAogCWlndF9zZXRfdGltZW91dCgxLCAiaW5pdGlhbCBwYWdlZmF1bHRpbmcgZGlkIG5vdCBj
b21wbGV0ZSB3aXRoaW4gMXMiKTsKIApAQCAtMTM1LDYgKzEzNiw3IEBAIHRlc3RfcGZfbm9uYmxv
Y2soaW50IGk5MTUpCiAJaWd0X3Jlc2V0X3RpbWVvdXQoKTsKIAogCWlndF9zcGluX2ZyZWUoaTkx
NSwgc3Bpbik7CisJcHV0X2FobmQoYWhuZCk7CiB9CiAKIHN0YXRpYyBpbnQgbW1hcF9pb2N0bChp
bnQgaTkxNSwgc3RydWN0IGRybV9pOTE1X2dlbV9tbWFwICphcmcpCi0tIAoyLjI2LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
