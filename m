Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340DD6E170
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Nov 2018 13:45:34 +0000 (UTC)
Date: Mon, 5 Nov 2018 15:45:30 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20181105134530.2hqdluzmmwqfefxs@ahiler-desk1.fi.intel.com>
References: <20181008121042.30556-1-petri.latvala@intel.com>
 <20181105105048.s6gdr4nxacpixymn@ahiler-desk1.fi.intel.com>
 <20181105114252.GV17124@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181105114252.GV17124@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/tools_test: Find the tool
 binaries also from bindir
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDE6NDI6NTJQTSArMDIwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBNb24sIE5vdiAwNSwgMjAxOCBhdCAxMjo1MDo0OFBNICswMjAwLCBBcmthZGl1
c3ogSGlsZXIgd3JvdGU6Cj4gPiBPbiBNb24sIE9jdCAwOCwgMjAxOCBhdCAwMzoxMDo0MlBNICsw
MzAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOgo+ID4gPiBBbHNvIHByaW50IHdoYXQgZGlyZWN0b3J5
IGdldHMgdXNlZC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBl
dHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIHRlc3RzL3Rvb2xzX3Rlc3Qu
YyB8IDI3ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDIwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0
IGEvdGVzdHMvdG9vbHNfdGVzdC5jIGIvdGVzdHMvdG9vbHNfdGVzdC5jCj4gPiA+IGluZGV4IGEw
MDI1YmVkLi5hYzg3MTdjNSAxMDA2NDQKPiA+ID4gLS0tIGEvdGVzdHMvdG9vbHNfdGVzdC5jCj4g
PiA+ICsrKyBiL3Rlc3RzL3Rvb2xzX3Rlc3QuYwo+ID4gPiBAQCAtNTksMjAgKzU5LDMzIEBAIHN0
YXRpYyB2b2lkIGFzc2VydF9jbWRfc3VjY2VzcyhpbnQgZXhlY19yZXR1cm4pCj4gPiA+ICAJaWd0
X2Fzc2VydF9lcShleGVjX3JldHVybiwgSUdUX0VYSVRfU1VDQ0VTUyk7Cj4gPiA+ICB9Cj4gPiA+
ICAKPiA+ID4gK2Jvb2wgY2hkaXJfdG9fdG9vbHNfZGlyKCkKPiA+ID4gK3sKPiA+ID4gKwljaGFy
IHBhdGhbNDA5Nl07Cj4gPiAKPiA+IHVzZSBQQVRIX01BWAo+ID4gCj4gPiA+ICsKPiA+ID4gKwkv
KiBUcnkgVE9PTFMgcmVsYXRpdmUgdG8gY3dkICovCj4gPiA+ICsJaWYgKGNoZGlyKFRPT0xTKSA9
PSAwKQo+ID4gPiArCQlyZXR1cm4gdHJ1ZTsKPiA+IAo+ID4gMXN0IGNoZGlyKFRPT0xTKQo+ID4g
Cj4gPiA+ICsKPiA+ID4gKwkvKiBUcnkgVE9PTFMgYW5kIGluc3RhbGwgZGlyIHJlbGF0aXZlIHRv
IHRlc3QgYmluYXJ5ICovCj4gPiA+ICsJaWYgKHJlYWRsaW5rKCIvcHJvYy9zZWxmL2V4ZSIsIHBh
dGgsIHNpemVvZihwYXRoKSkgPiAwKQo+ID4gPiArCQljaGRpcihkaXJuYW1lKHBhdGgpKTsKPiA+
ID4gKwo+ID4gPiArCXJldHVybiBjaGRpcihUT09MUykgPT0gMCB8fCBjaGRpcigiLi4vLi4vYmlu
IikgPT0gMDsKPiA+IAo+ID4gMm5kIGNoZGlyKFRPT0xTKQo+ID4gCj4gPiBvbmUgc2hvdWxkIGJl
IGVub3VnaAo+IAo+IFRPT0xTIGlzICIuLi9ibGFoYmxhaCIgYW5kIGNoZGlyKGRpcm5hbWUocGF0
aCkpIGNoYW5nZXMgd2hhdCB0aGUgc2Vjb25kIG9uZSBkb2VzLgoKcmlnaHQKClJldmlld2VkLWJ5
OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
