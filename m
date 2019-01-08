Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0AC126EF71
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jan 2019 15:02:42 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Tue,  8 Jan 2019 16:02:20 +0100
Message-Id: <20190108150224.2679-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH RFC i-g-t 0/4] VC4 load tracker testing
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
Cc: Eben Upton <eben@raspberrypi.org>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBzZXJpZXMgaW50cm9kdWNlcyBoZWxwZXJzIGFuZCBhIHNpbXBsZSB0ZXN0ICh3aXRoIHR3
byBzdWJ0ZXN0cykKZm9yIHRlc3RpbmcgdGhlIFZDNCBsb2FkIHRyYWNrZXIuIFNlZSB0aGUgZmlu
YWwgY29tbWl0IG1lc3NhZ2UgZm9yCm1vcmUgZGV0YWlscyBhYm91dCB0aGUgdGVzdC4KClRoaXMg
c2VyaWVzIGlzIHBvc3RlZCBhcyBSRkMgc2luY2UgdGhlIGtlcm5lbCBwaWVjZSBhcmUgc3RpbGwg
dW5kZXIKcmV2aWV3LiBJdCBhbGxvd3MgdGVzdGluZyB0aGUgc2VyaWVzIHdpdGggSUdUIGluIHRo
ZSBtZWFudGltZSAoYW5kIHdhcwp1c2VkIGZvciB0ZXN0aW5nIHRoZSBrZXJuZWwgc2lkZSkuCgpU
aGUgdHdvIHByZWxpbWluYXJ5IHBhdGNoZXMgd2VyZSBhbHJlYWR5IHNlbnQgYXMgcGFydCBvZiBh
bm90aGVyIHNlcmllcwphbmQgYXJlIGluY2x1ZGVkIHNvIHRoYXQgQ0kgY2FuIGF0dGVtcHQgdG8g
YnVpbGQgdGhlIHdob2xlIHNlcmllcy4KCkNoZWVycywKClBhdWwKClBhdWwgS29jaWFsa293c2tp
ICg0KToKICBsaWIvaWd0X2ttczogQWRkIGhlbHBlcnMgdG8gY291bnQgYW5kIGl0ZXJhdGUgcGxh
bmVzIGZyb20gcGlwZQogIGxpYi9pZ3Rfa21zOiBBZGQgaGVscGVycyB0byBjb3VudCBhbmQgaXRl
cmF0ZSBwbGFuZXMgZnJvbSBvdXRwdXQKICBsaWIvaWd0X3ZjNDogQWRkIGhlbHBlcnMgZm9yIHVu
ZGVycnVuIGNvdW50IGFuZCBsb2FkIHRyYWNrZXIgc3RhdGUKICB0ZXN0czogQWRkIFZDNCBsb2Fk
IHRyYWNrZXIgdGVzdHMKCiBsaWIvaWd0X2ttcy5jICAgICAgICAgICAgfCAgODQgKysrKysrKysr
KysrKwogbGliL2lndF9rbXMuaCAgICAgICAgICAgIHwgICA2ICsKIGxpYi9pZ3RfdmM0LmMgICAg
ICAgICAgICB8ICAzMiArKysrKwogbGliL2lndF92YzQuaCAgICAgICAgICAgIHwgICA2ICsKIHRl
c3RzL01ha2VmaWxlLnNvdXJjZXMgICB8ICAgMSArCiB0ZXN0cy9tZXNvbi5idWlsZCAgICAgICAg
fCAgIDEgKwogdGVzdHMvdmM0X2xvYWRfdHJhY2tlci5jIHwgMjQ5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogNyBmaWxlcyBjaGFuZ2VkLCAzNzkgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3ZjNF9sb2FkX3RyYWNrZXIuYwoKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
