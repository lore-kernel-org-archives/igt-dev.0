Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805B96E15D
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Oct 2018 13:00:12 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed, 24 Oct 2018 16:00:02 +0300
Message-Id: <20181024130004.12770-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20181024130004.12770-1-arkadiusz.hiler@intel.com>
References: <20181024130004.12770-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/4] gitlab-ci: Compile using autotools
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
Cc: Petri Latvala <petri.latvala@intel.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

TGV0J3MgbWFrZSBzdXJlIHRoYXQgSUdUIGNvbXBpbGVzIHdpdGggYXV0b3Rvb2xzLgoKU2lnbmVk
LW9mZi1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgotLS0K
IC5naXRsYWItY2kueW1sICAgIHwgNyArKysrKysrCiBEb2NrZXJmaWxlLmRlYmlhbiB8IDggKysr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhLy5n
aXRsYWItY2kueW1sIGIvLmdpdGxhYi1jaS55bWwKaW5kZXggMDMwYjM0MDUuLjM5NGNkODZkIDEw
MDY0NAotLS0gYS8uZ2l0bGFiLWNpLnltbAorKysgYi8uZ2l0bGFiLWNpLnltbApAQCAtMzMsNiAr
MzMsMTMgQEAgYnVpbGQ6dGVzdHMtZGViaWFuOgogICAgIC0gbWVzb24gJE1FU09OX09QVElPTlMg
YnVpbGQKICAgICAtIG5pbmphIC1DIGJ1aWxkCiAKK2J1aWxkOnRlc3RzLWRlYmlhbi1hdXRvdG9v
bHM6CisgIGltYWdlOiAkQ0lfUkVHSVNUUlkvJENJX1BST0pFQ1RfUEFUSC9pZ3QtZGViaWFuOmxh
dGVzdAorICBzdGFnZTogYnVpbGQKKyAgc2NyaXB0OgorICAgIC0gLi9hdXRvZ2VuLnNoIC0tZW5h
YmxlLXtjaGFtZWxpdW0sYXVkaW8saW50ZWwsYW1kZ3B1LG5vdXZlYXUsdGVzdHMscnVubmVyfQor
ICAgIC0gbWFrZSAtagorCiBuaW5qYTp0ZXN0OgogICBzdGFnZTogdGVzdAogICBzY3JpcHQ6CmRp
ZmYgLS1naXQgYS9Eb2NrZXJmaWxlLmRlYmlhbiBiL0RvY2tlcmZpbGUuZGViaWFuCmluZGV4IDFj
NzBmMDE1Li4xMDQ5MDZjMSAxMDA2NDQKLS0tIGEvRG9ja2VyZmlsZS5kZWJpYW4KKysrIGIvRG9j
a2VyZmlsZS5kZWJpYW4KQEAgLTMzLDMgKzMzLDExIEBAIFJVTiBhcHQtZ2V0IGluc3RhbGwgLXQg
c3RyZXRjaC1iYWNrcG9ydHMgLXkgXAogCQkJCQltZXNvbiBcCiAJCQkJCWxpYmRybS1kZXYgXAog
CQkJCQlsaWJkcm0taW50ZWwxCisKKyMgYXV0b3Rvb2xzIGJ1aWxkIGRlcHMKK1JVTiBhcHQtZ2V0
IGluc3RhbGwgLXkgXAorCQkJYXV0b2NvbmYgXAorCQkJYXV0b21ha2UgXAorCQkJeHV0aWxzLWRl
diBcCisJCQlsaWJ0b29sIFwKKwkJCW1ha2UKLS0gCjIuMTcuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
