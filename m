Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A796E057
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jul 2018 13:36:22 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 23 Jul 2018 14:36:13 +0100
Message-Id: <20180723133613.6418-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t] lib: Don't assert all KMS drivers support
 edid_override
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

ZWRpZF9vdmVycmlkZSBpcyBhIGk5MTUua28gZGVidWdmcyBmZWF0dXJlOyBqdXN0IHNraXAgYW55
IGttcyB0ZXN0IHRoYXQKZGVwZW5kcyBvbiBiZWluZyBhYmxlIHRvIG92ZXJyaWRlIHRoZSBlZGlk
LgoKQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lk
PTEwNzMzNwpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KLS0tCiBsaWIvaWd0X2ttcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuYyBiL2xpYi9p
Z3Rfa21zLmMKaW5kZXggMDFjYmM1ODBhLi4yNTgwZTIyYjUgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3Rf
a21zLmMKKysrIGIvbGliL2lndF9rbXMuYwpAQCAtOTEzLDcgKzkxMyw3IEBAIHZvaWQga21zdGVz
dF9mb3JjZV9lZGlkKGludCBkcm1fZmQsIGRybU1vZGVDb25uZWN0b3IgKmNvbm5lY3RvciwKIAlk
ZWJ1Z2ZzX2ZkID0gaWd0X2RlYnVnZnNfb3Blbihkcm1fZmQsIHBhdGgsIE9fV1JPTkxZIHwgT19U
UlVOQyk7CiAJZnJlZShwYXRoKTsKIAotCWlndF9hc3NlcnQoZGVidWdmc19mZCAhPSAtMSk7CisJ
aWd0X3JlcXVpcmUoZGVidWdmc19mZCAhPSAtMSk7CiAKIAlpZiAobGVuZ3RoID09IDApCiAJCXJl
dCA9IHdyaXRlKGRlYnVnZnNfZmQsICJyZXNldCIsIDUpOwotLSAKMi4xOC4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
