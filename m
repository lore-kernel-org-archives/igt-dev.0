Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BC76E190
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2020 09:00:04 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Wed,  8 Jul 2020 10:58:55 +0200
Message-Id: <20200708085900.4706-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/5] Portion of libdrm removal in simple
 tests
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBzZXJpZXMgaXMgYSBwYXJ0IG9mIGxpYmRybSByZW1vdmFsLiBJdCByZW1vdmVzIHRoZSBk
ZXBlbmRlbmN5IAppbiBhIGZldyBzaW1wbGUgdGVzdHMuCgpDYzogQ2hyaXMgV2lsc29uIDxjaHJp
c0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3
LmtlbXBjenluc2tpQGludGVsLmNvbT4KCkRvbWluaWsgR3J6ZWdvcnplayAoNSk6CiAgdGVzdHMv
aTkxNS9nZW1fYmFkX2FkZHJlc3M6IFJlbW92YWwgbGliZHJtIGRlcGVuZGVuY3kKICB0ZXN0cy9p
OTE1L2dlbV9iYWRfYmF0Y2g6IFJlbW92YWwgbGliZHJtIGRlcGVuZGVuY3kKICB0ZXN0cy9pOTE1
L2dlbV9iYWRfYmxpdDogUmVtb3ZhbCBsaWJkcm0gZGVwZW5kZW5jeQogIHRlc3RzL2k5MTUvZ2Vt
X2V4ZWNfYmFkX2RvbWFpbnM6IFJlbW92YWwgbGliZHJtIGRlcGVuZGVuY3kKICB0ZXN0cy9pOTE1
L2dlbV9ub25fc2VjdXJlX2JhdGNoOiBSZW1vdmFsIGxpYmRybSBkZXBlbmRlbmN5CgogdGVzdHMv
aTkxNS9nZW1fYmFkX2FkZHJlc3MuYyAgICAgIHwgIDM0ICsrKystLS0tCiB0ZXN0cy9pOTE1L2dl
bV9iYWRfYmF0Y2guYyAgICAgICAgfCAgMzAgKysrLS0tLQogdGVzdHMvaTkxNS9nZW1fYmFkX2Js
aXQuYyAgICAgICAgIHwgIDU3ICsrKysrKy0tLS0tLS0KIHRlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFk
X2RvbWFpbnMuYyB8IDEzMyArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIHRlc3RzL2k5
MTUvZ2VtX25vbl9zZWN1cmVfYmF0Y2guYyB8ICA0MSArKysrLS0tLS0KIDUgZmlsZXMgY2hhbmdl
ZCwgMTI1IGluc2VydGlvbnMoKyksIDE3MCBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
