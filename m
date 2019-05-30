Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42836E15E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2019 15:39:37 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Thu, 30 May 2019 21:12:17 +0530
Message-Id: <20190530154222.16804-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/5] Engine discovery for few more tests
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

TmV3IHVBUEkgaXMgdXNlZCBmb3IgZGlzY292ZXJ5IG9mIGVuZ2luZXMgYXQgYmVsb3cgdGVzdHMK
CWdlbV9iYWRfcmVsb2MKCWdlbV9leGVjX2FzeW5jCglnZW1fZXhlY19jYXB0dXJlCglnZW1fZXhl
Y19wYXJhbXMKCXByaW1lX3ZnZW0KClJhbWFsaW5nYW0gQyAoNSk6CiAgdGVzdC9pOTE1OiBnZW1f
YmFkX3JlbG9jOiB1c2UgdGhlIGdlbV9lbmdpbmVfdG9wb2xvZ3kgbGlicmFyeQogIHRlc3QvaTkx
NTogZ2VtX2V4ZWNfYXN5bmM6IHVzZSB0aGUgZ2VtX2VuZ2luZV90b3BvbG9neSBsaWJyYXJ5CiAg
dGVzdC9pOTE1OiBnZW1fZXhlY19jYXB0dXJlOiB1c2UgdGhlIGdlbV9lbmdpbmVfdG9wb2xvZ3kg
bGlicmFyeQogIHRlc3QvaTkxNTogZ2VtX2V4ZWNfcGFyYW1zOiB1c2UgdGhlIGdlbV9lbmdpbmVf
dG9wb2xvZ3kgbGlicmFyeQogIHRlc3QvcHJpbWVfdmdlbTogdXNlIHRoZSBnZW1fZW5naW5lX3Rv
cG9sb2d5IGxpYnJhcnkKCiB0ZXN0cy9pOTE1L2dlbV9iYWRfcmVsb2MuYyAgICB8IDE0ICsrKy0t
LS0KIHRlc3RzL2k5MTUvZ2VtX2V4ZWNfYXN5bmMuYyAgIHwgMzQgKysrKysrKystLS0tLS0tLS0K
IHRlc3RzL2k5MTUvZ2VtX2V4ZWNfY2FwdHVyZS5jIHwgMjQgKysrKystLS0tLS0tCiB0ZXN0cy9p
OTE1L2dlbV9leGVjX3BhcmFtcy5jICB8IDQxICsrKystLS0tLS0tLS0tLS0tLS0tCiB0ZXN0cy9w
cmltZV92Z2VtLmMgICAgICAgICAgICB8IDcwICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDExMiBkZWxldGlvbnMo
LSkKCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
