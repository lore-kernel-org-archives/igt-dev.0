Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6AF88503
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 16:15:29 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Wed, 24 Apr 2019 19:15:26 +0300
Message-Id: <20190424161526.19208-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] ci: build with Clang
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

VGhpcyBhZGRzIGEgYnVpbGQgc3RlcCB3aXRoIENsYW5nIG9uIEZlZG9yYS4gSG9wZWZ1bGx5IHRo
aXMgY2FuIGhlbHAga2VlcGluZwpDbGFuZyBidWlsZHMgaGVhbHRoeS4KClNpZ25lZC1vZmYtYnk6
IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KLS0tCiAuZ2l0bGFiLWNpLnltbCB8IDgg
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS8u
Z2l0bGFiLWNpLnltbCBiLy5naXRsYWItY2kueW1sCmluZGV4IGFlOGNiYjY3Li5lN2QzMTM3NiAx
MDA2NDQKLS0tIGEvLmdpdGxhYi1jaS55bWwKKysrIGIvLmdpdGxhYi1jaS55bWwKQEAgLTQ3LDYg
KzQ3LDE0IEBAIGJ1aWxkOnRlc3RzLWZlZG9yYS1vbGRlc3QtbWVzb246CiAgICAgLSBuaW5qYSAt
QyBidWlsZAogICAgIC0gbmluamEgLUMgYnVpbGQgaWd0LWdwdS10b29scy1kb2MKIAorYnVpbGQ6
dGVzdHMtZmVkb3JhLWNsYW5nOgorICBzdGFnZTogYnVpbGQKKyAgc2NyaXB0OgorICAgIC0gZG5m
IGluc3RhbGwgLXkgY2xhbmcKKyAgICAtIGV4cG9ydCBDQz1jbGFuZworICAgIC0gbWVzb24gJE1F
U09OX09QVElPTlMgYnVpbGQKKyAgICAtIG5pbmphIC1DIGJ1aWxkCisKIGJ1aWxkOnRlc3RzLWRl
Ymlhbi1tZXNvbjoKICAgaW1hZ2U6ICRDSV9SRUdJU1RSWS8kQ0lfUFJPSkVDVF9QQVRIL2lndC1k
ZWJpYW46bGF0ZXN0CiAgIHN0YWdlOiBidWlsZAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
