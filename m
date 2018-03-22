Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <972a685e-2654-a939-82f8-53f8f6aa1ba5@intel.com>
References: <20180322111712.9056-1-tvrtko.ursulin@linux.intel.com>
 <20180322111712.9056-2-tvrtko.ursulin@linux.intel.com>
 <152171875518.23562.12227602056261860847@mail.alporthouse.com>
 <499c5ae6-900f-0958-149e-036ba0d9de7a@linux.intel.com>
 <152172253496.23562.6501030072098510709@mail.alporthouse.com>
 <972a685e-2654-a939-82f8-53f8f6aa1ba5@intel.com>
Message-ID: <152174247057.23562.16458503208522153436@mail.alporthouse.com>
Date: Thu, 22 Mar 2018 18:14:30 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 2/3] tests/gem_eio: Speed up
 test execution
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTgtMDMtMjIgMTc6MzI6NDYpCj4gCj4gCj4g
T24gMjIvMDMvMTggMDU6NDIsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1b3RpbmcgVHZydGtv
IFVyc3VsaW4gKDIwMTgtMDMtMjIgMTI6MzY6NTgpCj4gPj4KPiA+PiBPbiAyMi8wMy8yMDE4IDEx
OjM5LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPj4+IFF1b3RpbmcgVHZydGtvIFVyc3VsaW4gKDIw
MTgtMDMtMjIgMTE6MTc6MTEpCj4gPj4+Cj4gPj4+PiAgICAgICAgICAgdHJpZ2dlcl9yZXNldChm
ZCk7Cj4gPj4+PiArCj4gPj4+PiArICAgICAgIC8qIEhBQ0sgZm9yIENJICovCj4gPj4+PiArICAg
ICAgIGlndF9hc3NlcnQoaWd0X25zZWNfZWxhcHNlZCgmdHMpIDwgNWU5KTsKPiA+Pj4KPiA+Pj4g
aWd0X3NlY29uZHNfZWxhcHNlZCgpIHRoZSBhcHByb3hpbWF0aW9uIGlzIHdvcnRoIHRoZSByZWFk
YWJpbGl0eS4KPiA+Pj4KPiA+Pj4gSW4gdGhpcyBjYXNlIHlvdSBtaWdodCBsaWtlIHRvIHRyeSBp
Z3Rfc2V0X3RpbWVvdXQoKSwgYXMgSSB0aGluayBlYWNoCj4gPj4+IHN1YnRlc3QgYW5kIGV4aXRo
YW5kbGVycyBhcmUgaW4gcGxhY2UgdG8gbWFrZSB0aGVtIHJvYnVzdCBhZ2FpbnN0Cj4gPj4+IHBy
ZW1hdHVyZSBmYWlsdXJlcy4KPiA+Pgo+ID4+IFdlbGwgdGhpcyB3YXMganVzdCB0byBzZWUgdGhh
dCB3aWxsIGhhcHBlbiBvbiB0aGUgc2hhcmRzIGhlcmUuIEFzCj4gPj4gbWVudGlvbmVkIGluIHRo
ZSBjb21taXQgSSBnZXQgdGhhdCB5ZXQgdW5leHBsYWluZWQgR1BVIGhhbmcgYXQgc3VidGVzdAo+
ID4+IGV4aXQgaGVyZS4gU28gdGhlIGFzc2VydCBhYm92ZSBpcyBqdXN0IHRvIG5vdGljZSBpZiB0
aGUgc2FtZSBoYXBwZW5zIG9uCj4gPj4gc2hhcmRzLgo+ID4gCj4gPiBBbmQgSSB3YXMgdGhpbmtp
bmcgaXQgd2FzIGEgcmVhc29uYWJsZSBlbmhhbmNlbWVudCA6KSBQcm9iYWJseSBtb3JlIHNvCj4g
PiBmb3IgaWd0L2dlbV93YWl0IGl0c2VsZiB0byBhc2sgdGhhdCBpZiB3ZSByZXNldCB0aGUgcmVx
dWVzdCB3ZSBhcmUKPiA+IHdhaXRpbmcgdXBvbiBpdCBjb21wbGV0ZXMgaW4gYSB0aW1lbHkgbWFu
bmVyLiAoV2UgZG9uJ3QgY2FyZSBhYm91dAo+ID4gd2VkZ2VkIGhhbmRsaW5nIHRoZXJlLCBqdXN0
IHJlc2V0IGhhbmRsaW5nLikKPiAKPiBIb3cgYWJvdXQgY2hlY2tpbmcgZm9yIHJlc2V0IHdoZW4g
d2UgZG8gZ2VtX3Rlc3RfZW5naW5lKCksIHdoaWNoIHNlZW1zIAo+IHRvIG5vdCBmYWlsIG9uIHJl
c2V0LCAoY3J1ZGVseSBodHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTAxNjA1OS8pPwoKSSB3YXMg
dGhpbmtpbmcgdGhhdCB0aGUgdGltZW91dCB3b3VsZCBiZSBnb29kIGFyb3VuZCB0aGUgdGVzdCBh
cyBhCndob2xlLCBiZWNhdXNlIGl0IGlzIG5vdyBtZWFudCB0byBiZSB1YmVyZmFzdC4KLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
