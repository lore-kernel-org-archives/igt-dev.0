Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B283B89DD3
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Sep 2018 13:37:30 +0000 (UTC)
Date: Wed, 5 Sep 2018 16:37:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180905133726.GR5565@intel.com>
References: <cover.2608afc0c4c8efaee37268ea6e9dee558c619b13.1535721136.git-series.maxime.ripard@bootlin.com>
 <646c39734b6dde4b74f215b64f094cddc9e00ebe.1535721136.git-series.maxime.ripard@bootlin.com>
 <20180831134218.GZ5565@intel.com>
 <20180905093549.2sv3ggjp5j6yiihz@flea>
 <20180905101434.GL5565@intel.com>
 <20180905131903.ucuftgtcq4hzze2s@flea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180905131903.ucuftgtcq4hzze2s@flea>
Subject: Re: [igt-dev] [PATCH v6 05/13] fb: Fix ARGB8888 color depth
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
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBTZXAgMDUsIDIwMTggYXQgMDM6MTk6MDNQTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBPbiBXZWQsIFNlcCAwNSwgMjAxOCBhdCAwMToxNDozNFBNICswMzAwLCBWaWxsZSBT
eXJqw6Rsw6Qgd3JvdGU6Cj4gPiA+IEluIHRoZSBzYW1lIGZvcm1hdCBsaXN0Ogo+ID4gPiAgIC0g
UkdCNTY1IGhhcyBhIGRlcHRoIG9mIDE2Cj4gPiA+ICAgLSBYUkdCODg4OCBoYXMgYSBkZXB0aCBv
ZiAyNAo+ID4gPiAgIC0gWFJHQjIxMDEwMTAgaGFzIGEgZGVwdGggb2YgMzAKPiA+ID4gICAtIEFS
R0I4ODg4IGhhcyBhIGRlcHRoIG9mIDMyCj4gPiA+IAo+ID4gPiBXaGljaCBzZWVtcyB0byBpbmRp
Y2F0ZSB0aGF0IHRoZSBsaXN0IGluZGVlZCBtZWFudCB0aGF0IHRoZSBjb2xvcgo+ID4gPiBkZXB0
aCBpcyBhYm91dCB0aGUgY29sb3IsIGFuZCB0aGF0IEFSR0I4ODg4IGlzIHdyb25nLgo+ID4gCj4g
PiBOb25lIG9mIHRob3NlIG90aGVyIHRoaW5ncyBoYXZlIGFscGhhLCBzbyB0aGV5IGFyZSBzdGls
bAo+ID4gY29uc2lzdGVudCB3aXRoIHRoZSBkZXB0aD09MzIgZGVmaW5pdGlvbiBmb3IgQVJHQjg4
OC4KPiAKPiAiMjQgYml0cyBhbG1vc3QgYWx3YXlzIHVzZXMgOCBiaXRzIG9mIGVhY2ggb2YgUiwg
RywgQi4gQXMgb2YgMjAxOAo+IDI0LWJpdCBjb2xvciBkZXB0aCBpcyB1c2VkIGJ5IHZpcnR1YWxs
eSBldmVyeSBjb21wdXRlciBhbmQgcGhvbmUKPiBkaXNwbGF5IGFuZCB0aGUgdmFzdCBtYWpvcml0
eSBvZiBpbWFnZSBzdG9yYWdlIGZvcm1hdHMuIEFsbW9zdCBhbGwKPiBjYXNlcyB3aGVyZSB0aGVy
ZSBhcmUgMzIgYml0cyBwZXIgcGl4ZWwgbWVhbiB0aGF0IDI0IGFyZSB1c2VkIGZvciB0aGUKPiBj
b2xvciwgYW5kIHRoZSByZW1haW5pbmcgOCBhcmUgdGhlIGFscGhhIGNoYW5uZWwgb3IgdW51c2Vk
LiIKPiAKPiBUaGVyZSdzIDMyYnBwLCBidXQgdGhlIGRlcHRoIGlzIDI0IGJpdHMuCj4gCj4gQnV0
IG1heWJlIHRoZSBYMTEgbGVnYWN5IHNheXMgb3RoZXJ3aXNlLCBJIGRvbid0IGtub3cuIFdoYXQn
cyB5b3VyCj4gc3VnZ2VzdGlvbiB0aGVuPyBhZGRpbmcgeWV0IGFub3RoZXIgZmllbGQ/CgpKdXN0
IGxlYXZlIGl0IGFzIGlzPwoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
