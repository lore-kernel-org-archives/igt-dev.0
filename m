Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9551B6EC6C
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2018 15:49:56 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <151741348157.10214.9226102139237949466@mail.alporthouse.com>
References: <20180131123441.32102-1-tvrtko.ursulin@linux.intel.com>
 <151741348157.10214.9226102139237949466@mail.alporthouse.com>
Message-ID: <151741378846.10214.1316225455958343845@mail.alporthouse.com>
Date: Wed, 31 Jan 2018 15:49:48 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/dummyload: Allow spin batches
 to be restarted
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
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMDEtMzEgMTU6NDQ6NDEpCj4gUXVvdGluZyBUdnJ0
a28gVXJzdWxpbiAoMjAxOC0wMS0zMSAxMjozNDo0MCkKPiA+IGRpZmYgLS1naXQgYS9saWIvaWd0
X2R1bW15bG9hZC5oIGIvbGliL2lndF9kdW1teWxvYWQuaAo+ID4gaW5kZXggZmZhN2UzNTFkZWEz
Li5iOWYyMDFkNGFmYjYgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvaWd0X2R1bW15bG9hZC5oCj4gPiAr
KysgYi9saWIvaWd0X2R1bW15bG9hZC5oCj4gPiBAQCAtMzYsNiArMzYsMTIgQEAgdHlwZWRlZiBz
dHJ1Y3QgaWd0X3NwaW4gewo+ID4gICAgICAgICBzdHJ1Y3QgaWd0X2xpc3QgbGluazsKPiA+ICAg
ICAgICAgdWludDMyX3QgKmJhdGNoOwo+ID4gICAgICAgICBpbnQgb3V0X2ZlbmNlOwo+ID4gKyAg
ICAgICBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNfb2JqZWN0MiBvYmpbMl07Cj4gPiArICAgICAg
IHN0cnVjdCBkcm1faTkxNV9nZW1fcmVsb2NhdGlvbl9lbnRyeSByZWxvY3NbMl07Cj4gPiArICAg
ICAgIHN0cnVjdCBkcm1faTkxNV9nZW1fZXhlY2J1ZmZlcjIgZXhlY2J1ZjsKPiAKPiBJJ20gZHVi
aW91cyB3aGV0aGVyIHdlIHdhbnQgdG8gZW1pdCB0aGUgZGVwZW5kZW5jeSBvYmogb24gcmVzdWJt
aXQuIEkKPiBjYW4gc2VlIHdoZXJlIGl0IG1heSBiZSBkZXNpcmVkLCBhbmQgd2hlcmUgaXQgbWF5
IGJlIGEgaGluZHJhbmNlLgo+IAo+IEkgdGhpbmsgSSdtIGNvbWluZyBkb3duIG9uIHRoZSBzaWRl
IHRoYXQgdG8gcmVlbWl0IHRoZSBkZXBlbmRlbmN5IGlzCj4gc3VycHJpc2luZywgYW5kIHdvdWxk
IGFyZ3VlIHRoYXQgaWYgdGhhdCBpcyBkZXNpcmVkIGl0IHNob3VsZCBiZSBhbgo+IGV4cGxpY2l0
IHBhcmFtZXRlciB0byByZXN0YXJ0KCkuCgpTdHJvbmdlciBoaW50IHRoYXQgaXQgaXMgc3VycHJp
c2luZyB0byByZW1pdCB0aGUgZGVwZW5kZW5jeSBvYmogaXMgdGhhdAppdCBpcyBvd25lZCBieSB0
aGUgY2FsbGVyLCB3aG8gbWF5IG5vdCByZWFsaXNlIGl0IGhhcyBiZWVuIGNhcHR1cmVkIGJ5CnRo
ZSBzcGluIGJhdGNoIGFuZCB3aWxsIGNhbGwgZ2VtX2Nsb3NlKCkgb24gaXQuCi1DaHJpcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
