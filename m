Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C876E28E
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Sep 2018 11:51:50 +0000 (UTC)
MIME-Version: 1.0
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
In-Reply-To: <153625436007.731.11882011080163926994@skylake-alporthouse-com>
References: <20180906165156.35060-1-antonio.argenziano@intel.com>
 <153625313302.731.14479652810383829070@skylake-alporthouse-com>
 <9a262bd2-7d22-ec48-34af-45d4bb782590@intel.com>
 <153625436007.731.11882011080163926994@skylake-alporthouse-com>
Message-ID: <153658030810.4856.4585369926561862498@jlahtine-desk.ger.corp.intel.com>
Date: Mon, 10 Sep 2018 14:51:48 +0300
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_ctx_isoation: Remove dead code
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMDktMDYgMjA6MTk6MjApCj4gUXVvdGluZyBBbnRv
bmlvIEFyZ2Vuemlhbm8gKDIwMTgtMDktMDYgMTg6MDU6NDgpCj4gPiAKPiA+IAo+ID4gT24gMDYv
MDkvMTggMDk6NTgsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+ID4gUXVvdGluZyBBbnRvbmlvIEFy
Z2Vuemlhbm8gKDIwMTgtMDktMDYgMTc6NTE6NTYpCj4gPiA+PiBQcm9iYWJseSBqdXN0IGxlZnRv
dmVyIGNvZGUgdGhhdCBlc2NhcGVkIHJldmlldy4KPiA+ID4gCj4gPiA+IFRoZSAnLy8nIGluZGlj
YXRlcyBhIHdpc2ggdGhhdCBpZ3RfY2lfZmFpbF9vbigpIGV4aXN0ZWQuIFRoZSBwcm9ibGVtIGFz
Cj4gPiA+IGl0IGN1cnJlbnRseSBzdGFuZHMgaXMgdGhhdCB3ZSBkb24ndCBnZXQgYSBiaWcgd2Fy
bmluZyB0byB1cGRhdGUgdGhpcwo+ID4gPiB0ZXN0IGZvciBmdXR1cmUgZ2VuLiBpaXJjIHRoZSBp
bnRlbnQgd2FzIHRvIHRyeSBhbmQgcmVpbmZvcmNlIHRoYXQgdGhpcwo+ID4gPiB3YXMgYSB0ZXN0
IGxpbWl0YXRpb24gZm9yIENJIGFuZCBzaG91bGRuJ3QgYWxhcm0gYW55IG90aGVyIHVzZXIuCj4g
PiAKPiA+IENoYW5nZSBpdCB0byBhbiBpZ3Rfd2FybigpPyBOb3Qgc3VyZSBob3cgQ0kgZGVhbHMg
d2l0aCB0aG9zZSBidXQgbWF5YmUgCj4gPiB3ZSBjYW4gYXNrIHRvIG1hcmsgdGhlbSBpbiBhIHNw
ZWNpYWwgd2F5Lgo+IAo+IFNlZW1zIHJlYXNvbmFibGUuIEkgY2FuJ3QgcmVtZW1iZXIgaWYgaWd0
X3dhcm4gKyBTS0lQID09IG9yYW5nZSBmbGFnIGluCj4gQ0kuIElmIGl0IGRvZXMsIHllcyB0aGF0
IHNlZW1zIGZpbmUuIEl0IGRvZXNuJ3QgcmVhbGx5IG1hdHRlciB0aGF0IG11Y2gsCj4gSSBqdXN0
IGRvbid0IGxpa2UgaW5kaWNhdGluZyBhIGZhaWwgaW4gdGhlIGNhc2UgdGVzdCBoYXNuJ3QgYmVl
biBydW4KPiBiZWNhdXNlIGl0IGlzIG91dCBvZiBkYXRlLiAoQnV0IHRoYXQncyBwcm9iYWJseSB0
b28gbXVjaCBoYWlyc3BsaXR0aW5nCj4gb24gbXkgcGFydC4pCgpUaGVyZSdzIGEgdHlwbyBpbiB0
aGUgcGF0Y2ggdGl0bGUgcy9pc29hdGlvbi9pc29sYXRpb24vLgoKUmVnYXJkcywgSm9vbmFzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
