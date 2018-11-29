Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229396E4A8
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Nov 2018 15:24:12 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id x30so2235415edx.2
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Nov 2018 07:24:12 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 29 Nov 2018 16:24:04 +0100
Message-Id: <20181129152404.32546-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] gitlab-CI: Keep build artifacts when
 arm64-test fails
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Petri Latvala <petri.latvala@intel.com>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlcmUncyBzb21ldGhpbmcgdmVyeSBmdW5reSBnb2luZyBvbiB3aXRoIHRoZSBvY2Nhc2lvbmFs
IGNvbW1pdApjb25zaXN0ZW50bHkgZmFpbGluZywgZS5nLgoKaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLy0vam9icy81MTIwOAoKV2UgbmVlZCB0byBjYXRj
aCBpdCB0byB1bmRlcnN0YW5kIHdoYXQgaGFwcGVucy4KCnYyOiBBbHNvIGR1bXAgdGhlIGVudmly
b25tZW50IChQZXRyaSkKCkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNv
bT4KQWNrZWQtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiAu
Z2l0bGFiLWNpLnltbCB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS8uZ2l0bGFiLWNpLnltbCBiLy5naXRsYWIt
Y2kueW1sCmluZGV4IDBlNTVlMzE1N2E2OS4uYmNjMzJjZDljNzFmIDEwMDY0NAotLS0gYS8uZ2l0
bGFiLWNpLnltbAorKysgYi8uZ2l0bGFiLWNpLnltbApAQCAtOTcsNyArOTcsMTMgQEAgdGVzdDpu
aW5qYS10ZXN0LWFybTY0OgogICBkZXBlbmRlbmNpZXM6CiAgICAgLSBidWlsZDp0ZXN0cy1kZWJp
YW4tbWVzb24tYXJtNjQKICAgc3RhZ2U6IHRlc3QKLSAgc2NyaXB0OiBuaW5qYSAtQyBidWlsZCB0
ZXN0CisgIHNjcmlwdDoKKyAgICAtIGVudiA+IGJ1aWxkL2VudmR1bXAudHh0CisgICAgLSBuaW5q
YSAtQyBidWlsZCB0ZXN0CisgIGFydGlmYWN0czoKKyAgICBwYXRoczoKKyAgICAgIC0gYnVpbGQK
KyAgICB3aGVuOiBvbl9mYWlsdXJlCiAKIHRlc3Q6dGVzdC1saXN0LWRpZmY6CiAgIGRlcGVuZGVu
Y2llczoKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
