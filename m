Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDF089852
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2019 21:15:05 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190318204701.30654-1-sujaritha.sundaresan@intel.com>
References: <20190318204701.30654-1-sujaritha.sundaresan@intel.com>
Message-ID: <155294368968.4168.14995499269644582799@skylake-alporthouse-com>
Date: Mon, 18 Mar 2019 21:14:54 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Including E2BIG error to
 whitelist
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
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBTdWphcml0aGEgU3VuZGFyZXNhbiAoMjAxOS0wMy0xOCAyMDo0NzowMSkKPiBBZGRp
bmcgRTJCSUcoNykgdG8gdGhlIHdoaXRlbGlzdCB0byBwcmV2ZW50IGl0IGZyb20gZmxhZ2dpbmcK
PiB1cCBpbiBDSSBhbmQgcG9sbHV0aW5nIHRoZSBkbWVzZyB3aXRoIHdhcm5pbmdzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFN1amFyaXRoYSBTdW5kYXJlc2FuIDxzdWphcml0aGEuc3VuZGFyZXNhbkBp
bnRlbC5jb20+Cj4gQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNv
bT4KPiBDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gLS0tCj4g
IHJ1bm5lci9yZXN1bHRnZW4uYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3J1bm5lci9yZXN1bHRnZW4uYyBiL3J1bm5lci9yZXN1
bHRnZW4uYwo+IGluZGV4IDMyYjU5ZDU5Li45YmYxYzQwNiAxMDA2NDQKPiAtLS0gYS9ydW5uZXIv
cmVzdWx0Z2VuLmMKPiArKysgYi9ydW5uZXIvcmVzdWx0Z2VuLmMKPiBAQCAtNDkwLDYgKzQ5MCwx
MCBAQCBzdGF0aWMgY29uc3QgY2hhciBpZ3RfZG1lc2dfd2hpdGVsaXN0W10gPQo+ICAgICAgICAg
ICogbWVzc2FnZS4KPiAgICAgICAgICAqLwo+ICAgICAgICAgImk5MTU6IHByb2JlIG9mIFswLTk6
Ll0rIGZhaWxlZCB3aXRoIGVycm9yIC0yNSIgXwo+ICsgICAgICAgLyogRmF1bHQgaW5qZWN0aW9u
IHN1YnRlc3QgdGVybWluYXRlcyB3aXRoIEUyQklHIGFmdGVyIHRoZQo+ICsgICAgICAgICogdGVz
dCBlbmRzLCB3aGljaCBwcm9kdWNlcyB0aGlzIG1lc3NhZ2UuCj4gKyAgICAgICAgKi8KPiArICAg
ICAgICJpOTE1OiBwcm9iZSBvZiBbMC05Oi5dKyBmYWlsZWQgd2l0aCBlcnJvciAtNyIgXwoKRm9y
IGZhdWx0IGluamVjdGlvbiBpdCBpcyBsZWdhbCBmb3IgaXQgdG8gcmV0dXJuIGFueSBlcnJvciBj
b2RlLCBidXQKb25seSBmYXVsdCBpbmplY3Rpb24uIFRoaXMgbmVlZHMgdG8gYmUgYSBwZXItdGVz
dCB3aGl0ZWxpc3QsIHByZWZlcmFibHkKc3VwcGxpZWQgYnkgdGhlIHRlc3QgaXRzZWxmLiBDb3Vs
ZCB3ZSBoYXZlIGEgY29udHJvbCBsaW5rIGJhY2sgdG8gdGhlCnJ1bm5lciBpZiB3ZSBkb24ndCB3
YW50IGlndCB0byBydW4gaXRzZWxmPwotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
