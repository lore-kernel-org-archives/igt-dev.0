Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F3B8970B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2019 21:35:08 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <b4355583-f691-0c8a-ccaf-33f8c18667be@intel.com>
References: <20190613215448.17994-1-antonio.argenziano@intel.com>
 <20190613215448.17994-8-antonio.argenziano@intel.com>
 <156050604320.12536.16435457755743913885@skylake-alporthouse-com>
 <b4355583-f691-0c8a-ccaf-33f8c18667be@intel.com>
Message-ID: <156054809261.5386.5163653458782524065@skylake-alporthouse-com>
Date: Fri, 14 Jun 2019 22:34:52 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v6 7/9] igt/i915: Require GTT mapping to
 be available when needed.
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
Cc: Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDYtMTQgMjI6MTY6NTUpCj4gCj4gCj4g
T24gMTQvMDYvMTkgMDI6NTQsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTA2LTEzIDIyOjU0OjQ2KQo+ID4+IGRpZmYgLS1naXQgYS90ZXN0
cy9pOTE1L2dlbV9sYXJnZW9iamVjdC5jIGIvdGVzdHMvaTkxNS9nZW1fbGFyZ2VvYmplY3QuYwo+
ID4+IGluZGV4IDUxODM5NmZhLi5hMmQ0N2VkYyAxMDA2NDQKPiA+PiAtLS0gYS90ZXN0cy9pOTE1
L2dlbV9sYXJnZW9iamVjdC5jCj4gPj4gKysrIGIvdGVzdHMvaTkxNS9nZW1fbGFyZ2VvYmplY3Qu
Ywo+ID4+IEBAIC04NCw2ICs4NCw4IEBAIGlndF9zaW1wbGVfbWFpbgo+ID4+ICAgCj4gPj4gICAg
ICAgICAgZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0lOVEVMKTsKPiA+PiAgIAo+ID4+ICsg
ICAgICAgZ2VtX3JlcXVpcmVfbW1hcF9ndHQoZmQpOwo+ID4gCj4gPiBOZWVkIHRvIGluY29ycG9y
YXRlIGVsc2V3aGVyZS4gT3IgYmUgc2F0aXNmaWVkIHdpdGggdGhlIGVzc2VudGlhbHMgdGhhdAo+
ID4gd2UgY2FuIGFsbG9jYXRlIGxhcmdlIG9iamVjdHMuIE5vdyBob3cgbGFyZ2UgaXMgYSBtYXR0
ZXIgb2YgZGViYXRlLCBJCj4gPiB0aGluayBsYXJnZXIgdGhhbiBtZW1vcnkgYnV0IEkgaGF2ZW4n
dCB5ZXQgZml4ZWQgdGhlIGtlcm5lbC4KPiAKPiBOb3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGhlcmUu
IEFyZSB5b3Ugc2F5aW5nIHdlIHNob3VsZCBtb3ZlIHRoZSB0ZXN0LCBvciAKPiBqdXN0IGhhdmUg
YSBsYXJnZSBvYmplY3QgYWxsb2NhdGlvbiB0ZXN0IGFkZGVkIHRvIHNvbWV0aGluZyBlbHNlPwoK
TmFoLCBqdXN0IHF1ZXN0aW9uaW5nIHRoZSBwdXJwb3NlIG9mIHRoZSB0ZXN0IHJlYWxseS4gSXQn
cyBwcmV0dHkKdXNlbGVzcy4uLiBJZiB0aGUgaW50ZW50IGlzIHRvIHRha2UgYSBsYXJnZSBvYmpl
Y3QgYW5kIGNoZWNrIHRoYXQgYWxsCmlvY3RscyB3b3JrLCBpdCdzIG1pc3NpbmcgYSBsb3Qgb2Yg
dGhlIGRyaXZlci4gT24gdGhlIG90aGVyIGhhbmQsIHdlCnNob3VsZCBoYXZlIHRoYXQgcHJldHR5
IG11Y2ggY292ZXJlZCBieSB0aGUgaW9jdGwgdGVzdHMuCgpJIHRoaW5rIHRoZXJlIGlzIHJlYXNv
bmFibGUgc2NvcGUgZm9yIGEgImxhcmdlb2JqZWN0IiB0ZXN0LCBidXQKbG9va2luZyBhdCB0aGUg
dGVzdCBpdCBpcyBwcmV0dHkgdXNlbGVzcyBhbmQgc2hvdWxkIGp1c3QgZGlzYXBwZWFyLgotQ2hy
aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
