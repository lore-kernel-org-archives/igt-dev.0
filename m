Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A7D6E058
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jan 2019 22:18:41 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 30 Jan 2019 22:18:33 +0000
Message-Id: <20190130221833.19999-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] sw_sync: Initialise struct before use
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

c3dfc3luYzogLi4vbGliL2lndF9jb3JlLmM6MTU5MjogX19pZ3RfZm9ya19oZWxwZXI6IEFzc2Vy
dGlvbiBgIXByb2MtPnJ1bm5pbmcnCgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9w
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA4ODg5ClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL3N3X3N5bmMuYyB8IDUgKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvdGVzdHMvc3dfc3luYy5jIGIvdGVzdHMvc3dfc3luYy5jCmluZGV4IDIwNzkwOGVkNy4u
YWM0Y2FmOGJhIDEwMDY0NAotLS0gYS90ZXN0cy9zd19zeW5jLmMKKysrIGIvdGVzdHMvc3dfc3lu
Yy5jCkBAIC0xNzEsMTIgKzE3MSwxMSBAQCBzdGF0aWMgdm9pZCB0ZXN0X3N5bmNfYnVzeSh2b2lk
KQogCiBzdGF0aWMgdm9pZCB0ZXN0X3N5bmNfYnVzeV9mb3JrX3VuaXhzb2NrZXQodm9pZCkKIHsK
KwlzdHJ1Y3QgaWd0X2hlbHBlcl9wcm9jZXNzIHByb2MgPSB7fTsKIAlpbnQgZmVuY2U7CiAJaW50
IHRpbWVsaW5lOwogCWludCBza2lwID0gMDsKIAlpbnQgc3ZbMl07Ci0Jc3RydWN0IGlndF9oZWxw
ZXJfcHJvY2VzcyBwcm9jOwotCiAKIAl0aW1lbGluZSA9IHN3X3N5bmNfdGltZWxpbmVfY3JlYXRl
KCk7CiAJZmVuY2UgPSBzd19zeW5jX3RpbWVsaW5lX2NyZWF0ZV9mZW5jZSh0aW1lbGluZSwgMSk7
CkBAIC0yNTgsMTAgKzI1NywxMCBAQCBvdXQ6CiAKIHN0YXRpYyB2b2lkIHRlc3Rfc3luY19idXN5
X2Zvcmsodm9pZCkKIHsKKwlzdHJ1Y3QgaWd0X2hlbHBlcl9wcm9jZXNzIHByb2MgPSB7fTsKIAlp
bnQgZmVuY2U7CiAJaW50IHRpbWVsaW5lOwogCWludCBza2lwID0gMDsKLQlzdHJ1Y3QgaWd0X2hl
bHBlcl9wcm9jZXNzIHByb2M7CiAKIAl0aW1lbGluZSA9IHN3X3N5bmNfdGltZWxpbmVfY3JlYXRl
KCk7CiAJZmVuY2UgPSBzd19zeW5jX3RpbWVsaW5lX2NyZWF0ZV9mZW5jZSh0aW1lbGluZSwgMSk7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
