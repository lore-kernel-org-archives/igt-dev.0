Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C6B6F378
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jan 2019 09:50:54 +0000 (UTC)
Date: Thu, 17 Jan 2019 11:50:52 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190117095052.GD17124@platvala-desk.ger.corp.intel.com>
References: <20190112014607.13446-1-jose.souza@intel.com>
 <20190112014607.13446-7-jose.souza@intel.com>
 <1fefb333444bd5ad208445b4dcfacb85cb2cbc93.camel@intel.com>
 <586fcec8b35d9dfa501b8026a7a0412fc23f8e6c.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <586fcec8b35d9dfa501b8026a7a0412fc23f8e6c.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 07/10] lib/psr: Drop support to old
 kernels without new PSR debugfs interface
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
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan,
 Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBKYW4gMTcsIDIwMTkgYXQgMDI6MDc6MjdBTSArMDAwMCwgU291emEsIEpvc2Ugd3Jv
dGU6Cj4gT24gVHVlLCAyMDE5LTAxLTE1IGF0IDIxOjIxIC0wODAwLCBEaGluYWthcmFuIFBhbmRp
eWFuIHdyb3RlOgo+ID4gT24gRnJpLCAyMDE5LTAxLTExIGF0IDE3OjQ2IC0wODAwLCBKb3PDqSBS
b2JlcnRvIGRlIFNvdXphIHdyb3RlOgo+ID4gPiBUaGUgbmV4dHMgcGF0Y2hlcyB3aWxsIGFkZCBQ
U1IyIHRlc3RzIGFuZCBmb3IgdGhhdCB3ZSBuZWVkIHRoZSBuZXcKPiA+ID4gUFNSIGRlYnVnZnMg
aW50ZXJmYWNlIHRoYXQgd2FzIHJlbGVhc2VkIGluIGtlcm5lbCA0LjIwIHNvIGl0IHdpbGwKPiA+
ID4gbm90Cj4gPiA+IGJyZWFrIGZvciBhbnkgdXBkYXRlZCBzeXN0ZW0gYW5kIHdlIGNhbiBkcm9w
IHN1cHBvcnQgdG8gdGhlIG9sZAo+ID4gPiBkZWJ1Z3NmcyBhbmQgdGhlIHN1cHBvcnQgdG8ga2Vy
bmVscyB3aXRob3V0IGV2ZW4gYSBkZWJ1Z2ZzCj4gPiA+IGludGVyZmFjZS4KPiA+IAo+ID4gQ2Fu
J3Qgd2UgaGF2ZSBwc3Jfc2V0KG1vZGUgPT0gUFNSX01PREVfMikgc2tpcCBpZiB0aGUga2VybmVs
IGRvZXMgbm90Cj4gPiBzdXBwb3J0IHRoZSBuZXcgaW50ZXJmYWNlPwo+IAo+IFdlIGNvdWxkIGJ1
dCB3aHkga2VlcCBzdXBwb3J0aW5nIG9sZCBrZXJuZWxzPyBNeSBleHBlcmllbmNlIG9mIHJ1bm5p
bmcKPiBhIG5ld2VyIElHVCBvdmVyIGEgb2xkIGtlcm5lbCBvciBvbiB0aGUgY29udHJhcnkgd2Fz
IGFsd2F5cwo+IHByb2JsZW1hdGljLgoKCkFueSBwcm9ibGVtYXRpYyBleHBlcmllbmNlcyB5b3Ug
bWlnaHQgaGF2ZSBlbmNvdW50ZXJlZCBzaG91bGQgYmUgZmlsZWQKYXMgYnVncy4gV2UgZG8gc3Vw
cG9ydCBvbGQga2VybmVscyAodG8gYSBsZW5ndGgpIGFuZCBzaG91bGRuJ3QKa25vd2luZ2x5IGJy
ZWFrIHN1cHBvcnQgZm9yIHRoZW0gd2l0aG91dCBhbiBpbmZvcm1lZCBkZWNpc2lvbi4KCgotLSAK
UGV0cmkgTGF0dmFsYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
