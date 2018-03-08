Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901C16E29C
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Mar 2018 11:25:50 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu,  8 Mar 2018 13:25:43 +0200
Message-Id: <20180308112544.18579-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/meson: Build gem_ctx_isolation
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

SXQgd2FzIGxlZnQgb3V0LgoKU2lnbmVkLW9mZi1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1
c3ouaGlsZXJAaW50ZWwuY29tPgotLS0KIHRlc3RzL21lc29uLmJ1aWxkIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9tZXNvbi5idWlsZCBi
L3Rlc3RzL21lc29uLmJ1aWxkCmluZGV4IDU4NzI5MjMxLi42ZTc3NmJiNyAxMDA2NDQKLS0tIGEv
dGVzdHMvbWVzb24uYnVpbGQKKysrIGIvdGVzdHMvbWVzb24uYnVpbGQKQEAgLTM1LDYgKzM1LDcg
QEAgdGVzdF9wcm9ncyA9IFsKIAknZ2VtX2N0eF9iYWRfZXhlYycsCiAJJ2dlbV9jdHhfY3JlYXRl
JywKIAknZ2VtX2N0eF9leGVjJywKKwknZ2VtX2N0eF9pc29sYXRpb24nLAogCSdnZW1fY3R4X3Bh
cmFtJywKIAknZ2VtX2N0eF9zd2l0Y2gnLAogCSdnZW1fY3R4X3RocmFzaCcsCi0tIAoyLjE0LjMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
