Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180724102931.25352-1-tvrtko.ursulin@linux.intel.com>
References: <20180724100852.24896-1-tvrtko.ursulin@linux.intel.com>
 <20180724102931.25352-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <153243523685.11002.15539745648907799152@skylake-alporthouse-com>
Date: Tue, 24 Jul 2018 13:27:16 +0100
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t v6 2/4] lib/igt_pm: Find HDA
 device when attempting to enable runtime PM
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wNy0yNCAxMToyOTozMSkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IEhEQSBhdWRpbyBkZXZp
Y2UgY2FuIGJlIHByZXNlbnQgYXQgdmFyaW91cyBQQ0kgcGF0aHMgb24gZGlmZmVyZW50IHN5c3Rl
bXMKPiB3aGljaCB0aGUgZXhpc3RpbmcgY29kZSBkaWQgbm90IGFjY291bnQgZm9yLgo+IAo+IEZ1
cnRoZXJtb3JlIHRoZSBmYWlsdXJlIHRvIGVuYWJsZSBydW50aW1lIFBNIHdhcyBzaWxlbnQgbGVh
dmluZyBjYWxsZXJzCj4gaW4gdGhlIGRhcmsuCj4gCj4gSW1wcm92ZSBpdCBieSBhdXRvLWxvY2F0
aW5nIHRoZSBQQ0kgcGF0aCBhbmQgbG9nZ2luZyBhIHdhcm5pbmcgd2hlbgo+IHNvbWV0aGluZyBp
cyBub3QgYXMgZXhwZWN0ZWQuCj4gCj4gdjI6Cj4gICogSWYgdGhlcmUgaXMgbm8gYXVkaW8gaHcv
ZHJpdmVyIHRoZXJlIGlzIG5vIGZhaWx1cmUuCj4gCj4gdjM6Cj4gICogQ29tbWVudC4KPiAgKiBT
a2lwIG5vbi1zeW1saW5rcy4KPiAgKiBGcmVlIHBhdGggb24gZmFpbHVyZSBhbmQgcmVzdG9yZS4K
PiAgKiBTaW1wbGlmeSB3aXRoIGFzcHJpbnRmLiAoQ2hyaXMgV2lsc29uKQo+IAo+IHY0Ogo+ICAq
IEZpbmQgc25kX2hkYV9pbnRlbCBpbnN0YW5jZSB0aWVkIHdpdGggYW4gSW50ZWwgZGV2aWNlLgo+
IAo+IHY1Ogo+ICAqIEZpeCBtZW1vcnkgbGVhayBhbmQgc2lsZW5jZSBWYWxncmluZCB3YXJuaW5n
Lgo+IAo+IHY2Ogo+ICAqIEZpeCBlcnJvciBvdXQgbG9naWMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
VHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkNJIGxvb2tzIHByb21p
c2luZywgYXMgZmFyIG15IGtub3dsZWRnZSBnb2VzIChhbmQgSSBhbSBzb3JyeSB0byBzYXkKZmlu
ZGluZyB0aGUgY2hpbGQgZGV2aWNlcyBpcyBiZXlvbmQgbXkgc3lzZnMga2VuKSwgc2VyaWVzIGlz
ClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNo
cmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVs
LWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
