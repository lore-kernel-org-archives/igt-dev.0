Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFF589DC5
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 15:53:56 +0000 (UTC)
Date: Wed, 13 Feb 2019 17:53:41 +0200
Message-Id: <20190213155341.23435-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20190213155341.23435-1-arkadiusz.hiler@intel.com>
References: <20190213155341.23435-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] gitlab-ci: Remove autotools from
 corss-compilation containers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: Arkadiusz Hiler via igt-dev <igt-dev@lists.freedesktop.org>
Reply-To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

V2Ugb25seSB1c2UgbWVzb24gdGhlcmUuCgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgotLS0KIERv
Y2tlcmZpbGUuZGViaWFuLWFybTY0IHwgOCAtLS0tLS0tLQogRG9ja2VyZmlsZS5kZWJpYW4tYXJt
aGYgfCA4IC0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL0RvY2tlcmZpbGUuZGViaWFuLWFybTY0IGIvRG9ja2VyZmlsZS5kZWJpYW4tYXJtNjQK
aW5kZXggMzRmYjVhZDQuLjdiM2EzYzdjIDEwMDY0NAotLS0gYS9Eb2NrZXJmaWxlLmRlYmlhbi1h
cm02NAorKysgYi9Eb2NrZXJmaWxlLmRlYmlhbi1hcm02NApAQCAtMzYsMTEgKzM2LDMgQEAgUlVO
IGFwdC1nZXQgaW5zdGFsbCAtdCBzdHJldGNoLWJhY2twb3J0cyAteSBcCiAJCQkJCWxpYmRybS1k
ZXY6YXJtNjQgXAogCQkJCQlxZW11LXVzZXIgXAogCQkJCQlxZW11LXVzZXItc3RhdGljCi0KLSMg
YXV0b3Rvb2xzIGJ1aWxkIGRlcHMKLVJVTiBhcHQtZ2V0IGluc3RhbGwgLXkgXAotCQkJYXV0b2Nv
bmYgXAotCQkJYXV0b21ha2UgXAotCQkJeHV0aWxzLWRldiBcCi0JCQlsaWJ0b29sIFwKLQkJCW1h
a2UKZGlmZiAtLWdpdCBhL0RvY2tlcmZpbGUuZGViaWFuLWFybWhmIGIvRG9ja2VyZmlsZS5kZWJp
YW4tYXJtaGYKaW5kZXggODFhZDVjNjEuLmM2N2ExZTJhIDEwMDY0NAotLS0gYS9Eb2NrZXJmaWxl
LmRlYmlhbi1hcm1oZgorKysgYi9Eb2NrZXJmaWxlLmRlYmlhbi1hcm1oZgpAQCAtMzYsMTEgKzM2
LDMgQEAgUlVOIGFwdC1nZXQgaW5zdGFsbCAtdCBzdHJldGNoLWJhY2twb3J0cyAteSBcCiAJCQkJ
CWxpYmRybS1kZXY6YXJtaGYgXAogCQkJCQlxZW11LXVzZXIgXAogCQkJCQlxZW11LXVzZXItc3Rh
dGljCi0KLSMgYXV0b3Rvb2xzIGJ1aWxkIGRlcHMKLVJVTiBhcHQtZ2V0IGluc3RhbGwgLXkgXAot
CQkJYXV0b2NvbmYgXAotCQkJYXV0b21ha2UgXAotCQkJeHV0aWxzLWRldiBcCi0JCQlsaWJ0b29s
IFwKLQkJCW1ha2UKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2
