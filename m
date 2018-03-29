Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180329093440.312-1-tvrtko.ursulin@linux.intel.com>
References: <152218018504.10679.17153519565017698305@mail.alporthouse.com>
 <20180329093440.312-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <152231677140.10679.16894733605833475860@mail.alporthouse.com>
Date: Thu, 29 Mar 2018 10:46:11 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2] tests/gem_eio: Never
 re-use contexts which were in the middle of GPU reset
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

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMy0yOSAxMDozNDo0MCkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IENvbnRleHRzIGV4ZWN1
dGluZyB3aGVuIHJlc2V0IHRyaWdnZXJzIGFyZSBwb3RlbnRpYWx5IGNvcnJ1cHQgc28gdHJ5aW5n
IHRvCj4gdXNlIHRoZW0gZnJvbSBhIHN1YnNlcXVlbnQgdGVzdCAobGlrZSB0aGUgZGVmYXVsdCBj
b250ZXh0KSBjYW4gaGFuZyB0aGUKPiBHUFUgb3IgZXZlbiB0aGUgZHJpdmVyLgo+IAo+IFdvcmth
cm91bmQgdGhhdCBieSBhbHdheXMgY3JlYXRpbmcgYSBkZWRpY2F0ZWQgY29udGV4dCB3aGljaCB3
aWxsIGJlCj4gcnVubmluZyB3aGVuIEdQVSByZXNldCBoYXBwZW5zLgo+IAo+IHYyOgo+ICAqIEV4
cG9ydCBhbmQgdXNlIGdlbV9yZW9wZW5fZGV2aWNlIHNvIHRoZSB0ZXN0IHdvcmtzIG9uIG9sZCBn
ZW5zIGFzIHdlbGwuCj4gICAgKENocmlzIFdpbHNvbikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgoKTWF0Y2hlcyB3aGF0IEkgd3Jv
dGVeVyBpbWFnaW5lZCAoYXMgaWYgeW91IGJlbGlldmUgSSB3b3VsZCBoYXZlIGJvdGhlcmVkCndp
dGggdGhlIGV4cG9ydCByYXRoZXIgdGhhbiBjdXQnbidwYXN0ZSA7KQoKSGF2ZSBhIGNvbmRpdGlv
bmFsClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
b24gdGhlIGNvbmRpdGlvbiB0aGF0IHlvdSB0aHJvdyBpbiBhIHRlc3QgdGhhdCByZXVzZWQgYSBm
ZXcgY29udGV4dHMgYSBmZXcKdGltZXMuIEkgdGhpbmsgc29tZXRoaW5nIGxpa2UKCmZvciAobmN0
eCBpbiBwcmltZSgxLCBuZXh0X3ByaW1lKE1BWF9FTFNQKSkpIHsKCXdoaWxlIChsb29wKSB7CgkJ
Zm9yIChjdHggPSBuY3R4KSB7CgkJCWZvcl9lYWNoX2VuZ2luZSgpIHsKCQkJCWFkZC1zcGluKGN0
eCwgZW5naW5lKTsKCQkJfQoJCQllbmQtc3Bpbi4KCQl9CgkJLy8gc29tZXRoaW5nLCBzb21ldGhp
bmcgaW5qZWN0IHdlZGdlCgl9Cgo/Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
