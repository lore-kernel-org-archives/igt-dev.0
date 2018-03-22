Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20180322111712.9056-1-tvrtko.ursulin@linux.intel.com>
 <20180322111712.9056-2-tvrtko.ursulin@linux.intel.com>
 <152171875518.23562.12227602056261860847@mail.alporthouse.com>
 <499c5ae6-900f-0958-149e-036ba0d9de7a@linux.intel.com>
 <152172253496.23562.6501030072098510709@mail.alporthouse.com>
 <972a685e-2654-a939-82f8-53f8f6aa1ba5@intel.com>
 <152174247057.23562.16458503208522153436@mail.alporthouse.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <44a637e3-a591-228a-e2db-8b617b8851bd@intel.com>
Date: Thu, 22 Mar 2018 15:25:25 -0700
MIME-Version: 1.0
In-Reply-To: <152174247057.23562.16458503208522153436@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 2/3] tests/gem_eio: Speed up
 test execution
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMi8wMy8xOCAxMToxNCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE4LTAzLTIyIDE3OjMyOjQ2KQo+Pgo+Pgo+PiBPbiAyMi8wMy8xOCAw
NTo0MiwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+Pj4gUXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAx
OC0wMy0yMiAxMjozNjo1OCkKPj4+Pgo+Pj4+IE9uIDIyLzAzLzIwMTggMTE6MzksIENocmlzIFdp
bHNvbiB3cm90ZToKPj4+Pj4gUXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMy0yMiAxMTox
NzoxMSkKPj4+Pj4KPj4+Pj4+ICAgICAgICAgICAgdHJpZ2dlcl9yZXNldChmZCk7Cj4+Pj4+PiAr
Cj4+Pj4+PiArICAgICAgIC8qIEhBQ0sgZm9yIENJICovCj4+Pj4+PiArICAgICAgIGlndF9hc3Nl
cnQoaWd0X25zZWNfZWxhcHNlZCgmdHMpIDwgNWU5KTsKPj4+Pj4KPj4+Pj4gaWd0X3NlY29uZHNf
ZWxhcHNlZCgpIHRoZSBhcHByb3hpbWF0aW9uIGlzIHdvcnRoIHRoZSByZWFkYWJpbGl0eS4KPj4+
Pj4KPj4+Pj4gSW4gdGhpcyBjYXNlIHlvdSBtaWdodCBsaWtlIHRvIHRyeSBpZ3Rfc2V0X3RpbWVv
dXQoKSwgYXMgSSB0aGluayBlYWNoCj4+Pj4+IHN1YnRlc3QgYW5kIGV4aXRoYW5kbGVycyBhcmUg
aW4gcGxhY2UgdG8gbWFrZSB0aGVtIHJvYnVzdCBhZ2FpbnN0Cj4+Pj4+IHByZW1hdHVyZSBmYWls
dXJlcy4KPj4+Pgo+Pj4+IFdlbGwgdGhpcyB3YXMganVzdCB0byBzZWUgdGhhdCB3aWxsIGhhcHBl
biBvbiB0aGUgc2hhcmRzIGhlcmUuIEFzCj4+Pj4gbWVudGlvbmVkIGluIHRoZSBjb21taXQgSSBn
ZXQgdGhhdCB5ZXQgdW5leHBsYWluZWQgR1BVIGhhbmcgYXQgc3VidGVzdAo+Pj4+IGV4aXQgaGVy
ZS4gU28gdGhlIGFzc2VydCBhYm92ZSBpcyBqdXN0IHRvIG5vdGljZSBpZiB0aGUgc2FtZSBoYXBw
ZW5zIG9uCj4+Pj4gc2hhcmRzLgo+Pj4KPj4+IEFuZCBJIHdhcyB0aGlua2luZyBpdCB3YXMgYSBy
ZWFzb25hYmxlIGVuaGFuY2VtZW50IDopIFByb2JhYmx5IG1vcmUgc28KPj4+IGZvciBpZ3QvZ2Vt
X3dhaXQgaXRzZWxmIHRvIGFzayB0aGF0IGlmIHdlIHJlc2V0IHRoZSByZXF1ZXN0IHdlIGFyZQo+
Pj4gd2FpdGluZyB1cG9uIGl0IGNvbXBsZXRlcyBpbiBhIHRpbWVseSBtYW5uZXIuIChXZSBkb24n
dCBjYXJlIGFib3V0Cj4+PiB3ZWRnZWQgaGFuZGxpbmcgdGhlcmUsIGp1c3QgcmVzZXQgaGFuZGxp
bmcuKQo+Pgo+PiBIb3cgYWJvdXQgY2hlY2tpbmcgZm9yIHJlc2V0IHdoZW4gd2UgZG8gZ2VtX3Rl
c3RfZW5naW5lKCksIHdoaWNoIHNlZW1zCj4+IHRvIG5vdCBmYWlsIG9uIHJlc2V0LCAoY3J1ZGVs
eSBodHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTAxNjA1OS8pPwo+IAo+IEkgd2FzIHRoaW5raW5n
IHRoYXQgdGhlIHRpbWVvdXQgd291bGQgYmUgZ29vZCBhcm91bmQgdGhlIHRlc3QgYXMgYQo+IHdo
b2xlLCBiZWNhdXNlIGl0IGlzIG5vdyBtZWFudCB0byBiZSB1YmVyZmFzdC4KTWFrZXMgc2Vuc2Uu
CgpUaGFua3MsCkFudG9uaW8KCj4gLUNocmlzCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWdmeAo=
