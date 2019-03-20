Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78917894A7
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 10:40:53 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <435bfc2f-0c8c-ff95-7c02-1c3e96fdfbc1@linux.intel.com>
References: <20190319234441.1449-1-andi.shyti@intel.com>
 <20190319234441.1449-8-andi.shyti@intel.com>
 <fefbaf78-9a42-b449-3676-92c6ac99dcbc@linux.intel.com>
 <155307658058.8718.6756951288202495614@skylake-alporthouse-com>
 <435bfc2f-0c8c-ff95-7c02-1c3e96fdfbc1@linux.intel.com>
Message-ID: <155307843412.8718.497243951839483261@skylake-alporthouse-com>
Date: Wed, 20 Mar 2019 10:40:34 +0000
Subject: Re: [igt-dev] [PATCH v13 7/9] lib/igt_gt: use
 for_each_engine_class_instance to loop through active engines
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
To: Andi Shyti <andi.shyti@intel.com>, IGT dev <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wMy0yMCAxMDozMzo0MykKPiAKPiBPbiAyMC8w
My8yMDE5IDEwOjA5LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFR2cnRrbyBVcnN1
bGluICgyMDE5LTAzLTIwIDEwOjA0OjUwKQo+ID4+Cj4gPj4gT24gMTkvMDMvMjAxOSAyMzo0NCwg
QW5kaSBTaHl0aSB3cm90ZToKPiA+PiBJZiB5b3UgZG8gdGhpcywgYW5kIGFsc28gYWRkIHZjczIg
dG8gdGhlIHN0YXRpYyB0YWJsZSBpbiB0aGlzIHNlcmllcywKPiA+IAo+ID4gQ2FuIHdlIGdpdmUg
dGhlIHN0YXRpYyB0YWJsZSBldmVyeSBjbGFzcyB3aXRoIHVwIHRvIE1BWF9JTlNUQU5DRV4yPwo+
ID4gU2hvdGd1biBhcHByb2FjaC4KPiAKPiBQcm9ibGVtIGlzIHRlc3QgZW51bWVyYXRpb24gaXMg
ZHJpdmVuIG9mIGl0IGFuZCB3ZSBhcmUgbm90IGFsbG93ZWQgdG8gCj4gYWNjZXNzIHRoZSBkZXZp
Y2UgaW4gdGhhdCBwaGFzZS4gQW5kIEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBlbnVtZXJhdGUg
Cj4gYSBnYXppbGxpb24gb2Ygc3VidGVzdHMganVzdCB0byBtYWtlIHRoZSBzdGF0aWMgdGFibGUg
ZnV0dXJlIHByb29mLgoKSGF2aW5nIGEgZmV3IGh1bmRyZWQgdW5yZXBvcnRlZCB0ZXN0cyBzaG91
bGQgbm90IGJlIGFuIGlzc3VlLiBBbmQgc2hvdWxkCmJlIGEgbW90aXZhdG9yIGZvciBzb21lb25l
IGVsc2UgdG8gZml4IHRoZWlyIHByb2JsZW0gaWYgaXQgd2FzLiBBbmQgQ0kKZm9saywgaXQgaXMg
YSBwcm9ibGVtIGluIHRoZSBzdGF0aWMgcGFydGl0aW9uIGRlc2lnbi4KIAo+IFNvIEkgd2FzIHRo
aW5raW5nIEFuZGkgd291bGQgYmUgYWRkaW5nIGFuIGFzc2VydCBpbiB0aGUgY29kZSB3aGljaCAK
PiBib3Jyb3dzIHRoZSBuYW1lIGZyb20gdGhlIHN0YXRpYyB0YWJsZSBzbyB3ZSBub3RpY2UgaXQg
bmVlZHMgdG8gYmUgCj4gZXhwYW5kZWQgZm9yIG5ldyBlbmdpbmVzLgoKQW5kIHRoZW4gd2UgYXJl
IGFsd2F5cyBiZWhpbmQgYW5kIGhhdmluZyB0byBrZWVwIGludGVybmFsIGZvcmtzLCBpbnN0ZWFk
Cm9mIGZ1dHVyZXByb29maW5nIGFzIG11Y2ggYXMgd2UgY2FuIGdldCBhd2F5IHdpdGguCi1DaHJp
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
