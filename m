Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <87v9wrp1rb.fsf@intel.com>
References: <20190627125521.10782-1-tvrtko.ursulin@linux.intel.com>
 <87v9wrp1rb.fsf@intel.com>
Date: Thu, 27 Jun 2019 17:04:57 +0300
Message-ID: <87pnmzp1iu.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Silence Valgrind warning in
 synce_fence_status
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyNyBKdW4gMjAxOSwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVs
LmNvbT4gd3JvdGU6Cj4gT24gVGh1LCAyNyBKdW4gMjAxOSwgVHZydGtvIFVyc3VsaW4gPHR2cnRr
by51cnN1bGluQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4+IEZyb206IFR2cnRrbyBVcnN1bGlu
IDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4+Cj4+IExldCBWYWxncmluZCBrbm93IHRoZSBp
b2N0bCBpbml0aWFsaXplcyB0aGUgcGFzc2VkIGluIGluZm8gYmxvY2sgdG8gcmVkdWNlCj4+IHRo
ZSBub2lzZSB3aGlsZSBkZWJ1Z2dpbmcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1
bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4+IC0tLQo+PiAgbGliL3N3X3N5bmMuYyB8
IDExICsrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvbGliL3N3X3N5bmMuYyBiL2xpYi9zd19zeW5jLmMKPj4gaW5kZXggZjIw
ODYwMzMxMmMyLi43M2YzZjcwMTVkOWQgMTAwNjQ0Cj4+IC0tLSBhL2xpYi9zd19zeW5jLmMKPj4g
KysrIGIvbGliL3N3X3N5bmMuYwo+PiBAQCAtNDEsNiArNDEsMTUgQEAKPj4gICNpbmNsdWRlICJk
cm10ZXN0LmgiCj4+ICAjaW5jbHVkZSAiaW9jdGxfd3JhcHBlcnMuaCIKPj4gIAo+PiArI2lmZGVm
IEhBVkVfVkFMR1JJTkQKPj4gKyNpbmNsdWRlIDx2YWxncmluZC92YWxncmluZC5oPgo+PiArI2lu
Y2x1ZGUgPHZhbGdyaW5kL21lbWNoZWNrLmg+Cj4+ICsKPj4gKyNkZWZpbmUgVkcoeCkgeAo+PiAr
I2Vsc2UKPj4gKyNkZWZpbmUgVkcoeCkgZG8ge30gd2hpbGUgKDApCj4KPiBPT0MsIHdoeSBub3Qg
anVzdAo+Cj4gI2RlZmluZSBWQUxHUklORF9NQUtFX01FTV9ERUZJTkVEKC4uLikKCkFuZCB0byB1
bmRlcmxpbmUsIHRoaXMgaXMgbm90IGEgcmVxdWVzdCB0byBjaGFuZ2UgYW55dGhpbmchCgpCUiwK
SmFuaS4KCgo+Cj4gQlIsCj4gSmFuaS4KPgo+PiArI2VuZGlmCj4+ICsKPj4gIC8qKgo+PiAgICog
U0VDVElPTjpzd19zeW5jCj4+ICAgKiBAc2hvcnRfZGVzY3JpcHRpb246IFNvZnR3YXJlIHN5bmMg
KGZlbmNpbmcpIHN1cHBvcnQgbGlicmFyeQo+PiBAQCAtMjE4LDYgKzIyNyw4IEBAIGludCBzeW5j
X2ZlbmNlX3N0YXR1cyhpbnQgZmVuY2UpCj4+ICAJaWYgKGZpbGVfaW5mby5udW1fZmVuY2VzICE9
IDEpCj4+ICAJCXJldHVybiAtRUlOVkFMOwo+PiAgCj4+ICsJVkcoVkFMR1JJTkRfTUFLRV9NRU1f
REVGSU5FRCgmZmVuY2VfaW5mbywgc2l6ZW9mKGZlbmNlX2luZm8pKSk7Cj4+ICsKPj4gIAlyZXR1
cm4gZmVuY2VfaW5mby5zdGF0dXM7Cj4+ICB9CgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4g
U291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXY=
