Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5B76E317
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2018 18:53:52 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180207184723.29066-1-antonio.argenziano@intel.com>
References: <20180207184723.29066-1-antonio.argenziano@intel.com>
Message-ID: <151802962016.8135.7414377029606267264@mail.alporthouse.com>
Date: Wed, 07 Feb 2018 18:53:40 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] igt/gem_userptr_blits: Check mlock
 requirement before asserting
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTgtMDItMDcgMTg6NDc6MjMpCj4gVGhlIHRl
c3RzIHRoYXQgZG8gbWxvY2tlZCBldmljdGlvbnMgc29tZXRpbWVzIGZhaWwgYmVjYXVzZSBhIGNo
aWxkIHRoZXkKPiBzcGF3biB3b3VsZCBtYXAgYSBsb3Qgb2YgbWVtb3J5IGFuZCBnZXQga2lsbGVk
IGJ5IE9PTS4gVGhpcyBwYXRjaCBkb2VzCj4gbm90IGNvbnNpZGVyIHRoaXMgYSBmYWlsIHNpbmNl
IGl0IGlzIGEgcmVxdWlyZW1lbnQgb2YgdGhlIHRlc3QgdG8gYmUKPiBhYmxlIHRvIG1sb2NrIHRo
ZSBtZW1vcnkuCgpUaGV5IGRpZSBhZnRlciB3ZSBjb25maXJtIHRoYXQgdGhlcmUgaXMgZW5vdWdo
IGF2YWlsYWJsZSBtZW1vcnkgdG8Kc2F0aXNmeSB0aGUgcmVxdWVzdC4gSXQncyBhIGJ1ZyBzb21l
d2hlcmUuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
