Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20181120180757.25494-1-tvrtko.ursulin@linux.intel.com>
 <154273781365.11623.18047213113245098824@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <380c8239-5719-7f57-36a2-021d1d3496b3@linux.intel.com>
Date: Tue, 20 Nov 2018 18:27:17 +0000
MIME-Version: 1.0
In-Reply-To: <154273781365.11623.18047213113245098824@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/drv_selftest: Allow
 passing in module options from the command line
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDIwLzExLzIwMTggMTg6MTYsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE4LTExLTIwIDE4OjA3OjU3KQo+PiBGcm9tOiBUdnJ0a28gVXJzdWxpbiA8
dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+Pgo+PiBBIG5ldyBvcHRpb24gJy0ta21vZC1vcHRp
b25zJyBpcyBhZGRlZCB3aGljaCB0YWtlcyBhIHN0cmluZyB3aGljaCB3aWxsIGJlCj4+IHBhc3Nl
ZCB0byBtb2Rwcm9iZSB3aGVuIGxvYWRpbmcgdGhlIG1vZHVsZS4KPj4KPj4gVGhpcyBmb3IgaW5z
dGFuY2UgYWxsb3dzIGVhc3kgb3ZlcnJpZGUgb2YgdGhpbmdzIGxpa2UgdGhlIHJhbmRvbSBzZWVk
IHdoZW4KPj4gdHJ5aW5nIHRvIHJlcHJvZHVjZSBmYWlsdXJlcy4KPiAgIAo+IEFueXdheSB3ZSBj
YW4gc2ltcGx5IGV4dGVuZCB0aGUgb3B0aW9uIHBhcnNpbmcgbG9jYWxseT8gKEp1c3QgZmluZCBp
dAo+IHVuc2lnaHRseSB0byBoYXZlIHRlc3Qgc3BlY2lmaWMgb3B0aW9ucyBpbiBsaWJpZ3QuKQoK
V2VsbC4uIGl0IGlzIG5vdCB0ZXN0IHNwZWNpZmljIGJ1dCBrbW9kIHNwZWNpZmljIGJ1dCBwb2lu
dCBzdGlsbCBzdGFuZHMuCgo+IFN0YXNoaW5nIGFyZ2MvYXJndiBpbiBpZ3Rfc3VidGVzdF9pbml0
X3BhcnNlX29wdHMoKSBhbmQgdGhlbiBiZWluZyBhYmxlCj4gdG8gcnVuIGdldG9wdHMgaW5zaWRl
IGlndF9tYWluIHt9PwoKWWVwLCBJIGRpZG4ndCBrbm93IHdlIGhhdmUgdGhpcyBhbHJlYWR5LgoK
PiBJIGFsc28gaGFkIGluIG1pbmQgYW4gZW52IGZvciBtb2R1bGUgb3B0aW9ucywgd2hpY2ggbWF5
IGJlIGFsc28gdXNlZnVsCj4gZm9yIHRoZSBtb2R1bGUgcmVsb2FkaW5nIGFuZCBhdXRvbG9hZGlu
Zy4KCkluIHRoYXQgY2FzZSwgc2luY2UgbW9kcHJvYmUoOCkgc3VwcG9ydHMgTU9EUFJPQkVfT1BU
SU9OUywgd2UgY291bGQgCnBlcmhhcHMgZW11bGF0ZSB0aGF0IGluIGlndF9rbW9kPyBPciBhZGQg
c3VwcG9ydCBkaXJlY3RseSB0byBsaWJrbW9kPyAKV2l0aCBlaXRoZXIgd2Ugd291bGRuJ3QgZXZl
biBuZWVkIHRoZSBjb21tYW5kIGxpbmUgcGFzcyB0aHJvdWdoLiBBZGRpbmcgCkx1Y2FzIGZvciBh
biBvcGluaW9uIHNpbmNlIGttb2Qgc2VlbXMgdG8gYmUgaGlzIGJhYnkuCgpSZWdhcmRzLAoKVHZy
dGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
