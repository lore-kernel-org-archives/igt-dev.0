Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 13 Nov 2018 15:53:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20181113235353.GA25613@mdroper-desk.amr.corp.intel.com>
References: <20181113232149.22753-1-matthew.d.roper@intel.com>
 <20181113232256.22828-1-matthew.d.roper@intel.com>
 <8275fd1b-5a61-7f48-6817-e0fdad42d0dc@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8275fd1b-5a61-7f48-6817-e0fdad42d0dc@intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2]
 tests/kms_crtc_background_color: overhaul for latest ABI proposal (v2)
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTMsIDIwMTggYXQgMTE6NDM6MTJQTSArMDAwMCwgTGlvbmVsIExhbmR3ZXJs
aW4gd3JvdGU6Cj4gT24gMTMvMTEvMjAxOCAyMzoyMiwgTWF0dCBSb3BlciB3cm90ZToKPiA+IEl0
J3Mgd29ydGggbm90aW5nIHRoYXQgd2UgZG9uJ3Qgc2VlbSB0byBiZSBhYmxlIHRvIHRlc3QgdGhp
cyBmZWF0dXJlCj4gPiB3aXRoIENSQydzLiAgT3JpZ2luYWxseSB3ZSB3YW50ZWQgdG8gZHJhdyBh
IGNvbG9yIGludG8gYSBwbGFuZSdzIEZCCj4gPiAod2l0aCBDYWlybykgYW5kIHRoZW4gY29tcGFy
ZSB0aGUgQ1JDIHRvIHR1cm5pbmcgb2ZmIGFsbCBwbGFuZXMgYW5kIGp1c3QKPiA+IHNldHRpbmcg
dGhlIENSVEMgYmFja2dyb3VuZCB0byB0aGUgc2FtZSBjb2xvci4gIEhvd2V2ZXIgdGhlIHByZWNp
c2lvbgo+ID4gYW5kIHJvdW5kaW5nIG9mIHRoZSBjb2xvciBjb21wb25lbnRzIGNhdXNlcyB0aGUg
Q1JDJ3MgdG8gY29tZSBvdXQKPiA+IGRpZmZlcmVudGx5LCBldmVuIHRob3VnaCB0aGUgZW5kIHJl
c3VsdCBpcyB2aXN1YWxseSBpZGVudGljYWwuICBTbyBhdAo+ID4gdGhlIG1vbWVudCB0aGlzIHRl
c3QgaXMgbWFpbmx5IHVzZWZ1bCBmb3IgdmlzdWFsIGluc3BlY3Rpb24gaW4KPiA+IGludGVyYWN0
aXZlIG1vZGUuCj4gSGV5IE1hdHQsCj4gT3V0IG9mIGN1cmlvc2l0eSwgYXJlIHRoZSBDUkNzIGRp
ZmZlcmVudCBvbmx5IHdoZW4gd2l0aCAxNmJwYz8gT3Igd2l0aCA4YnBjCj4gdG9vPwoKQm90aCA4
IGFuZCAxNiBnaXZlIGRpZmZlcmVudCBDUkMncy4gIEkgc3VzcGVjdCBpdCdzIGJlY2F1c2UgY2Fp
cm8KaGFuZGxlcyB0aGUgY29sb3IgdmFsdWVzICh3aGljaCBnZXQgcGFzc2VkIGFzIGRvdWJsZSkg
c2xpZ2h0bHkKZGlmZmVyZW50bHkgaW50ZXJuYWxseSwgYWx0aG91Z2ggSSBoYXZlbid0IHJ1bGVk
IG91dCBhIHNsaWdodCBpbmFjY3VyYWN5Cm9uIHRoZSBoYXJkd2FyZSBzaWRlLiAgR2l2ZW4gdGhl
IGFscGhhIHByb2JsZW1zIG9uIGdlbjkvZ2VuMTAsIGl0CndvdWxkbid0IHN1cnByaXNlIG1lIGlm
IGl0IHR1cm5zIG91dCB0aGF0IG91ciBoYXJkd2FyZSBpcyBhbHNvIHRyZWF0aW5nCmEgMTBicGMg
Y29tcG9uZW50IG9mIDB4M2ZmIGFzIDAuOTk5IHJhdGhlciB0aGFuIDEuMC4KCgpNYXR0Cgo+IAo+
IFRoYW5rcywKPiAKPiAtCj4gTGlvbmVsCj4gCj4gCj4gCgotLSAKTWF0dCBSb3BlcgpHcmFwaGlj
cyBTb2Z0d2FyZSBFbmdpbmVlcgpJb1RHIFBsYXRmb3JtIEVuYWJsaW5nICYgRGV2ZWxvcG1lbnQK
SW50ZWwgQ29ycG9yYXRpb24KKDkxNikgMzU2LTI3OTUKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
