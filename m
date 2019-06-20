Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902696E431
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2019 12:29:12 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu, 20 Jun 2019 15:29:02 +0300
Message-Id: <20190620122902.20761-3-arkadiusz.hiler@intel.com>
In-Reply-To: <20190620122902.20761-1-arkadiusz.hiler@intel.com>
References: <20190620122902.20761-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] runner/settings: Be consistent with
 empty blacklist
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

SWYgcHJvdmlkZWQgYW4gZW1wdHkgYmxhY2tsaXN0IGxldCdzIGZhaWwgaW5zdGVhZCBvZiByZXR1
cm5pbmcgYSB2YWx1ZQpvZiB1bmluaXRpYWxpemVkIHZhcmlhYmxlLgoKQ2M6IE9sZWcgVmFzaWxl
diA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZh
bGFAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5o
aWxlckBpbnRlbC5jb20+Ci0tLQogcnVubmVyL3NldHRpbmdzLmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ydW5uZXIv
c2V0dGluZ3MuYyBiL3J1bm5lci9zZXR0aW5ncy5jCmluZGV4IDk5MjBlMWE2Li44YjM5YzA2MyAx
MDA2NDQKLS0tIGEvcnVubmVyL3NldHRpbmdzLmMKKysrIGIvcnVubmVyL3NldHRpbmdzLmMKQEAg
LTIyNyw3ICsyMjcsNyBAQCBzdGF0aWMgYm9vbCBwYXJzZV9ibGFja2xpc3Qoc3RydWN0IHJlZ2V4
X2xpc3QgKmV4Y2x1ZGVfcmVnZXhlcywKIAlGSUxFICpmOwogCWNoYXIgKmxpbmUgPSBOVUxMOwog
CXNpemVfdCBsaW5lX2xlbiA9IDA7Ci0JYm9vbCBzdGF0dXM7CisJYm9vbCBzdGF0dXMgPSBmYWxz
ZTsKIAogCWlmICgoZiA9IGZvcGVuKGJsYWNrbGlzdF9maWxlbmFtZSwgInIiKSkgPT0gTlVMTCkg
ewogCQlmcHJpbnRmKHN0ZGVyciwgIkNhbm5vdCBvcGVuIGJsYWNrbGlzdCBmaWxlICVzXG4iLCBi
bGFja2xpc3RfZmlsZW5hbWUpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
