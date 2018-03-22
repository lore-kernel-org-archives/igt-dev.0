Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <499c5ae6-900f-0958-149e-036ba0d9de7a@linux.intel.com>
References: <20180322111712.9056-1-tvrtko.ursulin@linux.intel.com>
 <20180322111712.9056-2-tvrtko.ursulin@linux.intel.com>
 <152171875518.23562.12227602056261860847@mail.alporthouse.com>
 <499c5ae6-900f-0958-149e-036ba0d9de7a@linux.intel.com>
Message-ID: <152172253496.23562.6501030072098510709@mail.alporthouse.com>
Date: Thu, 22 Mar 2018 12:42:14 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/gem_eio: Speed up test
 execution
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMy0yMiAxMjozNjo1OCkKPiAKPiBPbiAyMi8w
My8yMDE4IDExOjM5LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFR2cnRrbyBVcnN1
bGluICgyMDE4LTAzLTIyIDExOjE3OjExKQo+ID4gCj4gPj4gICAgICAgICAgdHJpZ2dlcl9yZXNl
dChmZCk7Cj4gPj4gKwo+ID4+ICsgICAgICAgLyogSEFDSyBmb3IgQ0kgKi8KPiA+PiArICAgICAg
IGlndF9hc3NlcnQoaWd0X25zZWNfZWxhcHNlZCgmdHMpIDwgNWU5KTsKPiA+IAo+ID4gaWd0X3Nl
Y29uZHNfZWxhcHNlZCgpIHRoZSBhcHByb3hpbWF0aW9uIGlzIHdvcnRoIHRoZSByZWFkYWJpbGl0
eS4KPiA+IAo+ID4gSW4gdGhpcyBjYXNlIHlvdSBtaWdodCBsaWtlIHRvIHRyeSBpZ3Rfc2V0X3Rp
bWVvdXQoKSwgYXMgSSB0aGluayBlYWNoCj4gPiBzdWJ0ZXN0IGFuZCBleGl0aGFuZGxlcnMgYXJl
IGluIHBsYWNlIHRvIG1ha2UgdGhlbSByb2J1c3QgYWdhaW5zdAo+ID4gcHJlbWF0dXJlIGZhaWx1
cmVzLgo+IAo+IFdlbGwgdGhpcyB3YXMganVzdCB0byBzZWUgdGhhdCB3aWxsIGhhcHBlbiBvbiB0
aGUgc2hhcmRzIGhlcmUuIEFzIAo+IG1lbnRpb25lZCBpbiB0aGUgY29tbWl0IEkgZ2V0IHRoYXQg
eWV0IHVuZXhwbGFpbmVkIEdQVSBoYW5nIGF0IHN1YnRlc3QgCj4gZXhpdCBoZXJlLiBTbyB0aGUg
YXNzZXJ0IGFib3ZlIGlzIGp1c3QgdG8gbm90aWNlIGlmIHRoZSBzYW1lIGhhcHBlbnMgb24gCj4g
c2hhcmRzLgoKQW5kIEkgd2FzIHRoaW5raW5nIGl0IHdhcyBhIHJlYXNvbmFibGUgZW5oYW5jZW1l
bnQgOikgUHJvYmFibHkgbW9yZSBzbwpmb3IgaWd0L2dlbV93YWl0IGl0c2VsZiB0byBhc2sgdGhh
dCBpZiB3ZSByZXNldCB0aGUgcmVxdWVzdCB3ZSBhcmUKd2FpdGluZyB1cG9uIGl0IGNvbXBsZXRl
cyBpbiBhIHRpbWVseSBtYW5uZXIuIChXZSBkb24ndCBjYXJlIGFib3V0CndlZGdlZCBoYW5kbGlu
ZyB0aGVyZSwganVzdCByZXNldCBoYW5kbGluZy4pCi1DaHJpcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
