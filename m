Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <0e9ca619-ac6b-ada1-cb2e-1cbbd8ae3170@linux.intel.com>
References: <20180326105758.5211-1-tvrtko.ursulin@linux.intel.com>
 <20180403123825.7341-1-tvrtko.ursulin@linux.intel.com>
 <152276104904.32747.9344901902339011480@mail.alporthouse.com>
 <0e9ca619-ac6b-ada1-cb2e-1cbbd8ae3170@linux.intel.com>
Message-ID: <152277264848.32747.5978450744595739772@mail.alporthouse.com>
Date: Tue, 03 Apr 2018 17:24:08 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2] tests/perf_pmu: Avoid RT
 thread for accuracy test
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
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wNC0wMyAxNzowOTowOSkKPiAKPiBPbiAwMy8w
NC8yMDE4IDE0OjEwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBUbyBtZSBpdCBzZWVtcyBsaWtl
IHRoZSBjbG9zZWQgc3lzdGVtIHdpdGggZWFjaCBsb29wIGJlaW5nICJzcGluIHRoZW4KPiA+IGFk
anVzdGVkIHNsZWVwIiB3aWxsIGF1dG9jb3JyZWN0IGFuZCBtb3JlIGxpa2VseSB0byBmaW5pc2gg
Y29ycmVjdCAoYXMKPiA+IHdlIGFyZSBsZXNzIHJlbGlhbnQgb24gdGhlIG5leHQgbG9vcCBmb3Ig
dGhlIGFjY3VyYWN5KS4gSXQncyBwcmV0dHkgbXVjaAo+ID4gaW1tYXRlcmlhbCwgYXMgd2UgZXhw
ZWN0IHRoZSBwbXUgdG8gbWF0Y2ggdGhlIG1lYXN1cmVtZW50cyAoYW5kIG5vdCBvdXIKPiA+IGV4
cGVjdGF0aW9ucyksIGJ1dCBJIGZpbmQgdGhlIG9uZSBwYXNzIGRvZXMgYWxsIG11Y2ggc2ltcGxl
ciB0byBmb2xsb3cuCj4gCj4gU2luY2Ugd2UgZG8gYSBnb29kIG51bWJlciBvZiBsb29wcywgYW5k
IGhvcGUgdGhlIGNhbGlicmF0aW9uIHdpbGwgCj4gY29udmVyZ2UgcXVpY2tseSAod2hpY2ggaXQg
ZG9lcyBmb3IgbWUpLCBJIGRvbid0IHNlZSB0aGF0IHRoZXJlIGlzIGFuIAo+IGlzc3VlIHRoZXJl
LgoKSSdtIHNpdHRpbmcgaGVyZSBkcmlua2luZyBjb2ZmZWUgdHJ5aW5nIHRvIGRlY2lkZSBpZiBp
dCBkb2VzIGNvbnZlcmdlIDspClRoYXQncyB0aGUgcHJvYmxlbSBoZXJlLCBJIG5lZWQgdG8gYWN0
dWFsbHkgZmluZCBhIHBlbmNpbCwgc29tZSBwYXBlcgphbmQgcmVtZW1iZXIgc29tZSBiYXNpYyBt
YXRocyBmb3Igc2VyaWVzIGNvbnZlcmdlbmNlLiBOb3QgaGFwcGVuaW5nIHdpdGgKdGhlIGFtb3Vu
dCBvZiBjb2ZmZWUgSSBuZWVkIHRvIGRyaW5rIGF0IHRoZSBtb21lbnQuCi1DaHJpcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
