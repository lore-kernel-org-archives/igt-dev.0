Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E9C89259
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2019 08:30:21 +0000 (UTC)
Date: Thu, 16 May 2019 11:30:17 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190516083017.z6w2ekwaoty4hre2@ahiler-desk1.fi.intel.com>
References: <20190515072922.30768-2-simon.ser@intel.com>
 <20190516072757.9577-1-simon.ser@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516072757.9577-1-simon.ser@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5] tests/kms_chamelium: skip if
 GetAudioFormat is not supported
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
To: Simon Ser <simon.ser@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTA6Mjc6NTdBTSArMDMwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IFNraXAgYXVkaW8gdGVzdHMgaW4gY2FzZSBHZXRBdWRpb0Zvcm1hdCBpcyBub3Qgc3VwcG9y
dGVkIGJ5IHRoZSBDaGFtZWxpdW0KPiBkZXZpY2UgKGJlY2F1c2UgaXQgaXMgb3V0ZGF0ZWQpLgo+
IAo+IEEgbmV3IF9fY2hhbWVsaXVtX3JwYyBmdW5jdGlvbiBoYXMgYmVlbiBpbnRyb2R1Y2VkLiBU
aGUgZGlmZmVyZW5jZSB3aXRoCj4gY2hhbWVsaXVtX3JwYyBpcyB0aGF0IGl0IGRvZXNuJ3QgYXNz
ZXJ0cyB0aGF0IHRoZSBYTUwtUlBDIHN1Y2NlZWRzLgo+IAo+IEEgbmV3IGNoYW1lbGl1bV9zdXBw
b3J0c19nZXRfYXVkaW9fZm9ybWF0IGZ1bmN0aW9uIGhhcyBiZWVuIGludHJvZHVjZWQuIEl0Cj4g
dHJpZXMgdG8gY2FsbCBHZXRBdWRpb0Zvcm1hdHMgd2l0aCBhYnJpdHJhcnkgcGFyYW1ldGVycywg
YW5kIGNoZWNrcyB3aGV0aGVyIHRoZQo+IGNhbGwgZmFpbHMgYmVjYXVzZSB0aGUgbWV0aG9kIGRv
ZXNuJ3QgZXhpc3QuIEl0IGlzIG5vdCBwb3NzaWJsZSB0byBnZW5lcmFsaXplCj4gaXQgaW50byBj
aGFtZWxpdW1fc3VwcG9ydHNfbWV0aG9kIGJlY2F1c2Ugc29tZSBtZXRob2RzIG1pZ2h0IGhhdmUg
c2lkZS1lZmZlY3RzCj4gKGFuZCB0aGUgb25seSB3YXkgdG8gY2hlY2sgd2hldGhlciBhIG1ldGhv
ZCBleGlzdHMgaXMgdG8gdHJ5IHRvIGNhbGwgaXQpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNpbW9u
IFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KPiBDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0
dmFsYUBpbnRlbC5jb20+Cj4gQ2M6IEFyZWsgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+CgpS
ZXZpZXdlZC1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgoK
PiAtLS0KPiAKPiBDaGFuZ2VzIGZyb20gdjQgdG8gdjU6IGRvbid0IGV4cG9zZSBjaGFtZWxpdW1f
c3VwcG9ydHNfZ2V0X2F1ZGlvX2Zvcm1hdAo+IGRpcmVjdGx5LCBpbnN0ZWFkIGNhbGwgaXQgaW4g
Y2hhbWVsaXVtX2hhc19hdWRpb19zdXBwb3J0IChBcmVrKQoKVHJhZGl0aW9uYWxseSB3ZSBhcmUg
a2VlcGluZyB0aGVtIGluIHRoZSBjb21taXQgbWVzc2FnZSB0byBoYXZlIHNvbWUKY29udGV4dCBv
biBldm9sdXRpb24gb2YgdGhlIHBhdGNoLgoKLS0gCkNoZWVycywKQXJlawpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
