Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190228141828.2567-4-tvrtko.ursulin@linux.intel.com>
References: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
 <20190228141828.2567-4-tvrtko.ursulin@linux.intel.com>
Message-ID: <155136429518.5847.12808789372500594905@skylake-alporthouse-com>
Date: Thu, 28 Feb 2019 14:31:40 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] autoconf: Silence void pointer
 arithmetic warnings
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

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wMi0yOCAxNDoxODoyNykKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IE1lc29uIGJ1aWxkIGRv
ZXMgaXQgc28gbWFrZSB0aGUgdHdvIHN5bW1ldHJpY2FsIGluIHRoaXMgcmVzcGVjdC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+
IC0tLQo+ICBjb25maWd1cmUuYWMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCj4gaW5k
ZXggNGY1NWVhNWQwZjg5Li4yMTBlMmM1N2RmNTUgMTAwNjQ0Cj4gLS0tIGEvY29uZmlndXJlLmFj
Cj4gKysrIGIvY29uZmlndXJlLmFjCj4gQEAgLTI1Niw2ICsyNTYsOCBAQCBBQ19BUkdfRU5BQkxF
KHdlcnJvciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtGYWlsIG9uIHdhcm5pbmdz
XSksCj4gICAgICAgICAgICAgICBbXSwgW2VuYWJsZV93ZXJyb3I9bm9dKQo+ICAKPiArQ1dBUk5G
TEFHUz0iJENXQVJORkxBR1MgLVduby1wb2ludGVyLWFyaXRoIgoKXG8vCgo+ICsKPiAgaWYgdGVz
dCAieCRlbmFibGVfZGVidWciID0geHllczsgdGhlbgo+ICAgICAgICAgQVNfQ09NUElMRVJfRkxB
RyhbLWczXSwgW0RFQlVHX0NGTEFHUz0iLWczIl0sIFtERUJVR19DRkxBR1M9Ii1nIl0pCj4gICAg
ICAgICBBU19DT01QSUxFUl9GTEFHKFstT2ddLCBbREVCVUdfQ0ZMQUdTKz0iIC1PZyAtV25vLW1h
eWJlLXVuaW5pdGlhbGl6ZWQiXSwgIyBkaXNhYmxlIG1heWJlLXVuaW5pdGlhbGl6ZWQgZHVlIHRv
IGZhbHNlIHBvc2l0aXZlcwo+IC0tIAoKQnV0IHNob3VsZG4ndCB3ZSBiZSB1c2luZyBzb21ldGhp
bmcgbGlrZSB0aGUgYWJvdmUgdG8gdmVyaWZ5IHRoZSBmbGFnCmV4aXN0cz8KLUNocmlzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
