Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190508121058.27038-14-tvrtko.ursulin@linux.intel.com>
References: <20190508121058.27038-1-tvrtko.ursulin@linux.intel.com>
 <20190508121058.27038-14-tvrtko.ursulin@linux.intel.com>
Message-ID: <155749495035.10894.4199156109033147118@skylake-alporthouse-com>
Date: Fri, 10 May 2019 14:29:10 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 13/21] gem_wsim: Compact int command
 parsing with a macro
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

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNS0wOCAxMzoxMDo1MCkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFBhcnNpbmcgYW4gaW50
ZWdlciB3b3JrbG9hZCBkZXNjcmlwdG9yIGZpZWxkIGlzIGEgY29tbW9uIHBhdHRlcm4gd2hpY2gg
d2UKPiBjYW4gZXh0cmFjdCB0byBhIGhlbHBlciBtYWNybyBhbmQgYnkgZG9pbmcgc28gZnVydGhl
ciBpbXByb3ZlIHRoZQo+IHJlYWRhYmlsaXR5IG9mIHRoZSBtYWluIHBhcnNpbmcgbG9vcC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29t
Pgo+IC0tLQo+ICBiZW5jaG1hcmtzL2dlbV93c2ltLmMgfCA4MCArKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25z
KCspLCA1NSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYmVuY2htYXJrcy9nZW1fd3Np
bS5jIGIvYmVuY2htYXJrcy9nZW1fd3NpbS5jCj4gaW5kZXggNGRiZmMzZTkyMmE5Li5jMmUxM2Q5
OTM5YzIgMTAwNjQ0Cj4gLS0tIGEvYmVuY2htYXJrcy9nZW1fd3NpbS5jCj4gKysrIGIvYmVuY2ht
YXJrcy9nZW1fd3NpbS5jCj4gQEAgLTM3MCw2ICszNzAsMTUgQEAgc3RhdGljIGludCBwYXJzZV9l
bmdpbmVfbWFwKHN0cnVjdCB3X3N0ZXAgKnN0ZXAsIGNvbnN0IGNoYXIgKl9zdHIpCj4gICAgICAg
ICByZXR1cm4gMDsKPiAgfQo+ICAKPiArI2RlZmluZSBpbnRfZmllbGQoX1NURVBfLCBfRklFTERf
LCBfQ09ORF8sIF9FUlJfKSBcCj4gKyAgICAgICBpZiAoKGZpZWxkID0gc3RydG9rX3IoZnN0YXJ0
LCAiLiIsICZmY3R4KSkpIHsgXAo+ICsgICAgICAgICAgICAgICB0bXAgPSBhdG9pKGZpZWxkKTsg
XAo+ICsgICAgICAgICAgICAgICBjaGVja19hcmcoX0NPTkRfLCBfRVJSXywgbnJfc3RlcHMpOyBc
Cj4gKyAgICAgICAgICAgICAgIHN0ZXAudHlwZSA9IF9TVEVQXzsgXAo+ICsgICAgICAgICAgICAg
ICBzdGVwLl9GSUVMRF8gPSB0bXA7IFwKPiArICAgICAgICAgICAgICAgZ290byBhZGRfc3RlcDsg
XAo+ICsgICAgICAgfSBcCgpNb3JlIGhpZGRlbiBjb250cm9sIGZsb3cgOi1wClJldmlld2VkLWJ5
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
