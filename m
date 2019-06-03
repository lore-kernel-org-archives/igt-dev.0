Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 3 Jun 2019 14:19:19 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190603111919.GA22949@platvala-desk.ger.corp.intel.com>
References: <20190529132421.27905-1-chris@chris-wilson.co.uk>
 <dcc8f38f-2c9b-cb95-3061-0384e95fb7a2@linux.intel.com>
 <20190603103253.GZ22949@platvala-desk.ger.corp.intel.com>
 <2165d563-140f-1fb8-5234-c0099892fe96@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2165d563-140f-1fb8-5234-c0099892fe96@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Fix
 intel_get_current_physical_engine() iterator
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMTE6Mzk6MjVBTSArMDEwMCwgVHZydGtvIFVyc3VsaW4g
d3JvdGU6Cj4gCj4gT24gMDMvMDYvMjAxOSAxMTozMiwgUGV0cmkgTGF0dmFsYSB3cm90ZToKPiA+
IE9uIE1vbiwgSnVuIDAzLCAyMDE5IGF0IDExOjE5OjQ4QU0gKzAxMDAsIFR2cnRrbyBVcnN1bGlu
IHdyb3RlOgo+ID4gPiAKPiA+ID4gT24gMjkvMDUvMjAxOSAxNDoyNCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+ID4gPiA+IElmIHdlIHJ1biBvdXQgb2YgZW5naW5lcywgaW50ZWxfZ2V0X2N1cnJlbnRf
cGh5c2ljYWxfZW5naW5lKCkgZGVncmFkZXMKPiA+ID4gPiBpbnRvIGFuIGluZmluaXRlIGxvb3Ag
YXMgYWx0aG91Z2ggaXQgYWR2YW5jZWQgdGhlIGl0ZXJhdG9yLCBpdCBkaWQgbm90Cj4gPiA+ID4g
dXBkYXRlIGl0cyBsb2NhbCBlbmdpbmUgcG9pbnRlci4KPiA+ID4gCj4gPiA+IFdlIGhhZCBvbmUg
aW5maW5pdGUgbG9vcCBpbiB0aGVyZSBhbHJlYWR5Li4gQUZBSVIgaXQgd2FzIG9uIG9uZSBlbmdp
bmUKPiA+ID4gcGxhdGZvcm1zLiBEb2VzIHRoZSBuZXcgaW5jYXJuYXRpb24gaGFwcGVuIGFjdHVh
bGx5IHZpYSB0aGUKPiA+ID4gX19mb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUgaXRlcmF0b3Igb3Ig
cGVyaGFwcyBvbmx5IHdoZW4gY2FsbGluZwo+ID4gPiBpbnRlbF9nZXRfY3VycmVudF9waHlzaWNh
bF9lbmdpbmUgYWZ0ZXIgbG9vcCBlbmQ/IFdoeSBpdCB3YXNuJ3Qgc2VlbiBpbgo+ID4gPiB0ZXN0
aW5nPwo+ID4gCj4gPiAKPiA+IFRoZSBuZXcgaW5jYXJuYXRpb24gaGFwcGVucyB3aXRoIGEgd2Vk
Z2VkIEdQVS4gVGhhdCdzIGEgY2FzZSB0aGF0J3MKPiA+IGhhcmQgdG8gY29tZSBieSBpbiB0ZXN0
aW5nLgo+IAo+IDEuCj4gQ29sb3VyIG1lIGNvbmZ1c2VkLiA6KSBIb3cgZG9lcyBhIHdlZGdlZCBH
UFUgYWZmZWN0IHRoaXMgbG9vcD8KCldlZGdpbmcgY291bGQgYmUgYSByZWQgaGVycmluZywgYnV0
IHJlZ2FyZGxlc3MgdGhlIEdQVSB3YXMgaW4gYSBmdW5reQpzdGF0ZS4KCkFuIGVhc3kgcmVwcm9k
dWN0aW9uIG1ldGhvZCBpcyBqdXN0CgojICAuL3BlcmZfcG11CgooYXMgbm9ybWFsIHVzZXIsIG5v
dCByb290ISkKCgotLSAKUGV0cmkgTGF0dmFsYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
