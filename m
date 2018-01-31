Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DB36E49D
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2018 19:39:45 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Wed, 31 Jan 2018 11:39:01 -0800
Message-Id: <20180131193901.5150-1-antonio.argenziano@intel.com>
Subject: [igt-dev] [PATCH i-g-t] igt/gem_exec_params: Drop drm master
 privileges only on drm master fds
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U3VidGVzdCAnc2VjdXJlLW5vbi1tYXN0ZXInIHRyaWVzIHRvIGRyb3AgZHJtLW1hc3RlciBwcml2
aWxlZ2VzIG9uIGEKbm9uIGRybS1tYXN0ZXIgZmQuIEluc3RlYWQgZHJvcCBtYXN0ZXIgcHJpdmls
ZWdlcyBhZnRlciB0aGUgc3VidGVzdAphY3F1aXJlcyBpdCBzbyB0aGF0IG90aGVyIHN1YnRlc3Rz
IGFyZSBub3QgYWZmZWN0ZWQgYnkgaXQuCgpTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlh
bm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2g+CkNjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5j
b20+Ci0tLQogdGVzdHMvZ2VtX2V4ZWNfcGFyYW1zLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9nZW1fZXhl
Y19wYXJhbXMuYyBiL3Rlc3RzL2dlbV9leGVjX3BhcmFtcy5jCmluZGV4IGUxYzQ4YjQwLi5kYmQ4
OWU3YyAxMDA2NDQKLS0tIGEvdGVzdHMvZ2VtX2V4ZWNfcGFyYW1zLmMKKysrIGIvdGVzdHMvZ2Vt
X2V4ZWNfcGFyYW1zLmMKQEAgLTM0MywxMyArMzQzLDEzIEBAIGlndF9tYWluCiAJfQogCiAJaWd0
X3N1YnRlc3QoInNlY3VyZS1ub24tbWFzdGVyIikgewotCQlpZ3RfZGV2aWNlX2Ryb3BfbWFzdGVy
KGZkKTsKIAkJZXhlY2J1Zi5mbGFncyA9IEk5MTVfRVhFQ19SRU5ERVIgfCBJOTE1X0VYRUNfU0VD
VVJFOwogCQlSVU5fRkFJTChFUEVSTSk7CiAJCWlndF9kZXZpY2Vfc2V0X21hc3RlcihmZCk7CiAJ
CWlndF9hc3NlcnQoZHJtSW9jdGwoZmQsCiAJCQkJICAgIERSTV9JT0NUTF9JOTE1X0dFTV9FWEVD
QlVGRkVSMiwKIAkJCQkgICAgJmV4ZWNidWYpID09IDApOworCQlpZ3RfZGV2aWNlX2Ryb3BfbWFz
dGVyKGZkKTsgLyogT25seSBuZWVkcyB0ZW1wb3JhcnkgbWFzdGVyICovCiAJfQogCiAJLyogSEFO
RExFX0xVVCBhbmQgTk9fUkVMT0MgYXJlIGFscmVhZHkgZXhlcmNpc2VkIGJ5IGdlbV9leGVjX2x1
dF9oYW5kbGUsCi0tIAoyLjE0LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
