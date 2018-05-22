Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCEA89E38
 for <igt-dev@lists.freedesktop.org>; Tue, 22 May 2018 18:03:54 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue, 22 May 2018 19:03:49 +0100
Message-Id: <20180522180351.12009-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t v4 0/2] intel: per context powergating tests
 & benchmark
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

SGksCgpBbm90aGVyIGl0ZXJhdGlvbiB0byByZWZsZWN0IHRoZSBjaGFuZ2VzIGluIGk5MTUuCgpD
aGVlcnMsCgpMaW9uZWwgTGFuZHdlcmxpbiAoMik6CiAgaGVhZGVyczogYnVtcAogIHRlc3RzOiBh
ZGQgc2xpY2UgcG93ZXIgcHJvZ3JhbW1pbmcgdGVzdAoKIGluY2x1ZGUvZHJtLXVhcGkvYW1kZ3B1
X2RybS5oICB8ICAgMyArCiBpbmNsdWRlL2RybS11YXBpL2RybV9tb2RlLmggICAgfCAgIDkgKy0K
IGluY2x1ZGUvZHJtLXVhcGkvZXRuYXZpdl9kcm0uaCB8ICAgNiArCiBpbmNsdWRlL2RybS11YXBp
L2k5MTVfZHJtLmggICAgfCAgMzggKysKIGluY2x1ZGUvZHJtLXVhcGkvbXNtX2RybS5oICAgICB8
ICAgMiArCiBpbmNsdWRlL2RybS11YXBpL3ZpcnRncHVfZHJtLmggfCAgIDEgKwogdGVzdHMvTWFr
ZWZpbGUuc291cmNlcyAgICAgICAgIHwgICAxICsKIHRlc3RzL2dlbV9jdHhfcGFyYW0uYyAgICAg
ICAgICB8ICAgNCArLQogdGVzdHMvZ2VtX2N0eF9zc2V1LmMgICAgICAgICAgIHwgOTk0ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdGVzdHMvbWVzb24uYnVpbGQgICAgICAgICAg
ICAgIHwgICAxICsKIDEwIGZpbGVzIGNoYW5nZWQsIDEwNTUgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9nZW1fY3R4X3NzZXUuYwoKLS0KMi4x
Ny4wCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
