Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BC26E62C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Nov 2018 16:10:37 +0000 (UTC)
From: Andi Shyti <andi.shyti@intel.com>
Date: Wed, 21 Nov 2018 18:10:20 +0200
Message-Id: <20181121161023.1603-1-andi.shyti@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC v2 0/3] new engine discovery interface
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
To: IGT dev <igt-dev@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

SGksCgp0aGlzIGlzIGEgcmVxdWVzdCBmb3IgY29tbWVudHMgZm9yIHRoZSBuZXcgZW5naW5lIGRp
c2NvdmVyeQppbnRlcmZhY2UgZGV2ZWxvcGVkIGJ5IFR2cnRrbyBhbmQgQ2hyaXNbKl0uCgpUaGFu
a3MgQ2hyaXMgYW5kIFR2cnRrbyBmb3IgeW91ciBjb21tZW50cyBpbiB0aGUgdjEsIGhlcmUncyB0
aGUKY2hhbmdlbG9nOgoKVjEgLS0+IFYyCi0gYWRkZWQgYSBkZW1vIHRlc3QgdGhhdCBzaW1wbHkg
cXVlcmllcyB0aGUgZHJpdmVyIGFib3V0IHRoZQogIGVuZ2luZXMgYW5kIGV4ZWN1dGVzIGEgYnVm
ZmVyICh0aGFua3MgVHZydGtvKQotIHJlZmFjdG9yZWQgdGhlIGZvcl9lYWNoX2VuZ2luZV9jdHgo
KSBtYWNybyBzbyB0aGF0IHdoYXQgaW4gdGhlCiAgcHJldmlvdXMgdmVyc2lvbiB3YXMgZG9uZSBi
eSB0aGUgImJpbmQiIGZ1bmN0aW9uLCBub3cgaXQncyBkb25lCiAgaW4gdGhlIGZpcnN0IGl0ZXJh
dGlvbi4gKFRoYW5rcyBDcmhpcykKLSByZW1vdmVkIHRoZSAiZ2VtX2hhc19yaW5nX2N0eCgpIiBi
ZWNhdXNlIGl0IHdhcyBvdXQgb2YgdGhlCiAgc2NvcGUuCi0gcmVuYW1lIGZ1bmN0aW9ucyB0byBt
b3JlIG1lYW5pbmdmdWwgbmFtZXMKCkFuZGkKClsqXSBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Au
b3JnL350dXJzdWxpbi9kcm0taW50ZWwKCkFuZGkgU2h5dGkgKDMpOgogIGluY2x1ZGUvZHJtLXVh
cGk6IGltcG9ydCBpOTE1X2RybS5oIGhlYWRlciBmaWxlCiAgbGliOiBpbXBsZW1lbnQgbmV3IGVu
Z2luZSBkaXNjb3ZlcnkgaW50ZXJmYWNlCiAgdGVzdHM6IGdlbV9nZW1fcXVlcnlfZW5naW5lc19k
ZW1vOiBjcmVhdGUgdGVzdAoKIGluY2x1ZGUvZHJtLXVhcGkvaTkxNV9kcm0uaCAgICAgICAgIHwg
MjM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIGxpYi9pZ3RfZ3QuYyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDgzICsrKysrKysrKysKIGxpYi9pZ3RfZ3QuaCAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA4ICsKIHRlc3RzL01ha2VmaWxlLnNvdXJjZXMgICAgICAgICAgICAgIHwg
ICAzICsKIHRlc3RzL2k5MTUvZ2VtX3F1ZXJ5X2VuZ2luZXNfZGVtby5jIHwgIDU2ICsrKysrKysK
IHRlc3RzL21lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgIHwgICAxICsKIDYgZmlsZXMgY2hh
bmdlZCwgMzg4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgdGVzdHMvaTkxNS9nZW1fcXVlcnlfZW5naW5lc19kZW1vLmMKCi0tIAoyLjE5LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
