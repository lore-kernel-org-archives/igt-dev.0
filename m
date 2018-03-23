Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180323115428.23406-1-tvrtko.ursulin@linux.intel.com>
References: <152179884167.23562.9863516190314553500@mail.alporthouse.com>
 <20180323115428.23406-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <152180675088.23562.12811811718900739482@mail.alporthouse.com>
Date: Fri, 23 Mar 2018 12:05:50 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v3 2/3] tests/gem_eio: Speed
 up test execution
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
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMy0yMyAxMTo1NDoyOCkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IElmIHdlIHN0b3AgcmVs
eWluZyBvbiByZWd1bGFyIEdQVSBoYW5ncyB0byBiZSBkZXRlY3RlZCwgYnV0IHRyaWdnZXIgdGhl
bQo+IG1hbnVhbGx5IGFzIHNvb24gYXMgd2Uga25vdyBvdXIgYmF0Y2ggb2YgaW50ZXJlc3QgaXMg
YWN0dWFsbHkgZXhlY3V0aW5nCj4gb24gdGhlIEdQVSwgd2UgY2FuIGRyYW1hdGljYWxseSBzcGVl
ZCB1cCB2YXJpb3VzIHN1YnRlc3RzLgo+IAo+IFRoaXMgaXMgZW5hYmxlZCBieSB0aGUgcG9sbGFi
bGUgc3BpbiBiYXRjaCBhZGRlZCBpbiB0aGUgcHJldmlvdXMgcGF0Y2guCj4gCj4gdjI6Cj4gICog
VGVzdCBnZW1fd2FpdCBhZnRlciByZXNldC93ZWRnZSBhbmQgd2l0aCByZXNldC93ZWRnZSBhZnRl
ciBhIGZldwo+ICAgIHByZWRlZmluZWQgaW50ZXJ2YWxzIHNpbmNlIGdlbV93YWl0IGludm9jYXRp
b24uIChDaHJpcyBXaWxzb24pCj4gCj4gdjM6Cj4gIENocmlzIFdpbHNvbjoKPiAgKiBEZWNyZWFz
ZSBzaG9ydCB0ZXN0IHRvIDF1cy4KPiAgKiBVc2UgUE9TSVggdGltZXJzIGluc3RlYWQgb2Ygc2ln
bmFscyB0byBhdm9pZCBpbnRlcnJ1cHRpbmcgZ2VtX3dhaXQuCj4gICogSW1wcm92ZSBjb21tZW50
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRl
bC5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KPiBDYzogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50ZWwu
Y29tPgoKSSBjYW4ndCB0aGluayBvZiBhbnl0aGluZyBlbHNlIHRoYXQgbWlnaHQgZ28gd3Jvbmcs
IHNvClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
LUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
