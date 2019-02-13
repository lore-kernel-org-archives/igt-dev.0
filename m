Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEF689DC7
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 15:53:54 +0000 (UTC)
Date: Wed, 13 Feb 2019 17:53:40 +0200
Message-Id: <20190213155341.23435-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] gitlab-ci: Add 'ninja test' step for
 armhf
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
List-ID: <igt-dev@lists.freedesktop.org>

Li4uIGZvciBjb21wbGV0ZW5lc3MuCgpDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVu
QHRpLmNvbT4KU2lnbmVkLW9mZi1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJA
aW50ZWwuY29tPgotLS0KIC5naXRsYWItY2kueW1sIHwgMTQgKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwg
Yi8uZ2l0bGFiLWNpLnltbAppbmRleCBhZDkzODk3OS4uYWU4Y2JiNjcgMTAwNjQ0Ci0tLSBhLy5n
aXRsYWItY2kueW1sCisrKyBiLy5naXRsYWItY2kueW1sCkBAIC0xMTMsNiArMTEzLDIwIEBAIHRl
c3Q6bmluamEtdGVzdC1hcm02NDoKICAgICAgIC0gYnVpbGQKICAgICB3aGVuOiBvbl9mYWlsdXJl
CiAKK3Rlc3Q6bmluamEtdGVzdC1hcm1oZjoKKyAgaW1hZ2U6ICRDSV9SRUdJU1RSWS8kQ0lfUFJP
SkVDVF9QQVRIL2lndC1kZWJpYW4tYXJtaGY6bGF0ZXN0CisgIGRlcGVuZGVuY2llczoKKyAgICAt
IGJ1aWxkOnRlc3RzLWRlYmlhbi1tZXNvbi1hcm1oZgorICBzdGFnZTogdGVzdAorICBzY3JpcHQ6
CisgICAgLSBleHBvcnQgUEtHX0NPTkZJR19QQVRIPS91c3IvbGliL2FybS1saW51eC1nbnVlYWJp
aGYvcGtnY29uZmlnLworICAgIC0gZW52ID4gYnVpbGQvZW52ZHVtcC50eHQKKyAgICAtIG5pbmph
IC1DIGJ1aWxkIHRlc3QKKyAgYXJ0aWZhY3RzOgorICAgIHBhdGhzOgorICAgICAgLSBidWlsZAor
ICAgIHdoZW46IG9uX2ZhaWx1cmUKKwogdGVzdDp0ZXN0LWxpc3QtZGlmZjoKICAgZGVwZW5kZW5j
aWVzOgogICAgIC0gYnVpbGQ6dGVzdHMtZGViaWFuLWF1dG90b29scwotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
