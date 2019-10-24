Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC5189F5F
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2019 11:08:32 +0000 (UTC)
Date: Thu, 24 Oct 2019 14:08:30 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20191024110830.GC25209@platvala-desk.ger.corp.intel.com>
References: <20191021175001.1357-1-ville.syrjala@linux.intel.com>
 <20191022125409.20175-1-stanislav.lisovskiy@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022125409.20175-1-stanislav.lisovskiy@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: Reduce pixel format
 test execution time
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMDM6NTQ6MDlQTSArMDMwMCwgU3RhbmlzbGF2IExpc292
c2tpeSB3cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBpZ3Qt
ZGV2IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2Yg
VmlsbGUgU3lyamFsYQo+ID4gU2VudDogbWFhbmFudGFpIDIxLiBsb2tha3V1dGEgMjAxOSAyMC41
MAo+ID4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBTdWJqZWN0OiBbaWd0
LWRldl0gW1BBVENIIGktZy10XSB0ZXN0cy9rbXNfcGxhbmU6IFJlZHVjZSBwaXhlbCBmb3JtYXQg
dGVzdCBleGVjdXRpb24KPiA+IHRpbWUKPiA+IAo+ID4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IAo+ID4gQnkgZGVmYXVsdCByZWR1Y2Ug
dGhlIHNldCBvZiBjb2xvcnMgd2UgdGVzdCBieSBoYWxmLCBhbmQgb25seSB0ZXN0IGFsbCB0aGUg
WUNiQ3IKPiA+IHJhbmdlL2VuY29kaW5nIGNvbWJpbmF0aW9ucyBmb3IgbGluZWFyIGJ1ZmZlcnMu
IFRoaXMgc2hvdWxkIGhvcGVmdWxseSBzdGlsbCBwcm92aWRlCj4gPiBkZWNlbnQgY292ZXJhZ2Ug
d2l0aCBhIGJpZyByZWR1Y3Rpb24gaW4gZXhlY3V0aW9uIHRpbWUuCj4gPiBUaGUgcHJldmlvdXMg
bW9yZSBleHRlbnNpdmUgY292ZXJhZ2UgaXMgbm93IGhpZGRlbiBiZWhpbmQgdGhlIC0tZXh0ZW5k
ZWQKPiA+IGNvbW1hbmQgbGluZSBhcmd1bWVudC4KPiA+IAo+ID4gT24gS0JMOgo+ID4gdGltZSBr
bXNfcGxhbmUgLS1yIHBpeGVsLWZvcm1hdC1waXBlLUEtcGxhbmVzCj4gPiAtIHJlYWwgICAgICAg
IDFtNyw5OTVzCj4gPiArIHJlYWwgICAgICAgIDBtMjIsOTQzcwo+ID4gCj4gPiBGdXJ0aGVyIGlk
ZWFzIGZvciBtb3JlIHJlZHVjdGlvbjoKPiA+IC0gRG9uJ3QgdGVzdCBvbiBhbGwgcGxhbmVzIChl
Zy4gb24gaWNsKyB3ZSBjb3VsZCB0ZXN0IG9uIG9uZSBoZHIKPiA+ICAgcGxhbmUsIG9uZSBzZHIg
dXYgcGxhbmUsIGFuZCBvbmUgc2RyIHkgcGxhbmUpCj4gPiAtIERvbid0IHRlc3QgYWJzb2x1dGVs
eSBldmVyeSBwaXhlbCBmb3JtYXQgKyBtb2RpZmllciBjb21iaW5hdGlvbgo+ID4gLSBQaXBlbGlu
ZSBldmVuIGRlZXBlciB0byBtYWtlIGVhY2ggY29sb3IgY2hlY2tlZCB0YWtlIG9ubHkgYSBzaW5n
bGUKPiA+ICAgZnJhbWUgKGN1cnJlbnRseSBJIHRoaW5rIGl0IHNob3VsZCBiZSB0YWtpbmcgdHdv
IGZyYW1lcyBwZXIgY29sb3IpCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFN0YW5p
c2xhdiBMaXNvdnNraXkgPHN0YW5pc2xhdi5saXNvdnNraXlAaW50ZWwuY29tPgoKCk1lcmdlZCB0
aGlzLiBUaGFua3MhCgoKLS0gClBldHJpIExhdHZhbGEKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2
