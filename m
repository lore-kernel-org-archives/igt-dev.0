Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6EB89131
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 14:56:43 +0000 (UTC)
Date: Thu, 25 Apr 2019 17:56:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190425145630.GM1747@intel.com>
References: <20190424161526.19208-1-simon.ser@intel.com>
 <20190425073525.GA9857@phenom.ffwll.local>
 <87a7getn6f.fsf@intel.com>
 <20190425134949.GB3273@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190425134949.GB3273@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH i-g-t] ci: build with Clang
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMDM6NDk6NDlQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIEFwciAyNSwgMjAxOSBhdCAwMTowNToyOFBNICswMzAwLCBKYW5pIE5p
a3VsYSB3cm90ZToKPiA+IE9uIFRodSwgMjUgQXByIDIwMTksIERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4gd3JvdGU6Cj4gPiA+IE9uIFdlZCwgQXByIDI0LCAyMDE5IGF0IDA3OjE1OjI2
UE0gKzAzMDAsIFNpbW9uIFNlciB3cm90ZToKPiA+ID4+IFRoaXMgYWRkcyBhIGJ1aWxkIHN0ZXAg
d2l0aCBDbGFuZyBvbiBGZWRvcmEuIEhvcGVmdWxseSB0aGlzIGNhbiBoZWxwIGtlZXBpbmcKPiA+
ID4+IENsYW5nIGJ1aWxkcyBoZWFsdGh5Lgo+ID4gPj4gCj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBT
aW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+Cj4gPiA+PiAtLS0KPiA+ID4+ICAuZ2l0bGFi
LWNpLnltbCB8IDggKysrKysrKysKPiA+ID4+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspCj4gPiA+PiAKPiA+ID4+IGRpZmYgLS1naXQgYS8uZ2l0bGFiLWNpLnltbCBiLy5naXRsYWIt
Y2kueW1sCj4gPiA+PiBpbmRleCBhZThjYmI2Ny4uZTdkMzEzNzYgMTAwNjQ0Cj4gPiA+PiAtLS0g
YS8uZ2l0bGFiLWNpLnltbAo+ID4gPj4gKysrIGIvLmdpdGxhYi1jaS55bWwKPiA+ID4+IEBAIC00
Nyw2ICs0NywxNCBAQCBidWlsZDp0ZXN0cy1mZWRvcmEtb2xkZXN0LW1lc29uOgo+ID4gPj4gICAg
ICAtIG5pbmphIC1DIGJ1aWxkCj4gPiA+PiAgICAgIC0gbmluamEgLUMgYnVpbGQgaWd0LWdwdS10
b29scy1kb2MKPiA+ID4+ICAKPiA+ID4+ICtidWlsZDp0ZXN0cy1mZWRvcmEtY2xhbmc6Cj4gPiA+
PiArICBzdGFnZTogYnVpbGQKPiA+ID4+ICsgIHNjcmlwdDoKPiA+ID4+ICsgICAgLSBkbmYgaW5z
dGFsbCAteSBjbGFuZwo+ID4gPj4gKyAgICAtIGV4cG9ydCBDQz1jbGFuZwo+ID4gPj4gKyAgICAt
IG1lc29uICRNRVNPTl9PUFRJT05TIGJ1aWxkCj4gPiA+PiArICAgIC0gbmluamEgLUMgYnVpbGQK
PiA+ID4KPiA+ID4gVWggd2h5Pwo+ID4gPgo+ID4gPiBUaGUgdGhpbmcgdGhhdCBicm9rZW4gaXMg
YnVpbGRpbmcgb24gbm9uLXg4NiBob3N0cywgYW5kIHRoYXQncyB0aGUgdGhpbmcKPiA+ID4gZ2l0
bGFiIENJIGNhdWdodC4gSSBoYXZlIG5vIGlkZWEgd2h5IHRoaXMgaXMgYWxsIGFib3V0IGNsYW5n
IChpbW8gaXQncwo+ID4gPiBub3QpLCBhbmQgSSBkb24ndCB0aGluayB3ZSBzaG91bGQgY2FyZSBh
Ym91dCBjbGFuZyBlaXRoZXIuCj4gPiAKPiA+IEFuZCB3aHkgc2hvdWxkbid0IHdlIGNhcmUgYWJv
dXQgY2xhbmc/Cj4gCj4gV2hhdCBJIG1lYW50IGlzOiBXZSBhbHJlYWR5IGhhdmUgZ2l0bGFiIGNp
IHRhcmdldHMgdGhhdCBjYXVnaHQgdGhlIHJlY2VudAo+IGNsYW5nIHJlZ3Jlc3Npb24gKGJlY2F1
c2UgYSBsb3QgbW9yZSBicm9rZSkuIE5vIG9uZSBnYXZlIGEgc2hpdCBmcm9tIHdoYXQKPiBJIGNh
biB0ZWxsLCBzbyBJIGd1ZXNzIEknbSBxdWVzdGlvbmluZyB0aGUgdmFsdWUgb2YgbW9yZSBnaXRs
YWIgQ0kgdGFyZ2V0cwo+IGluIGdlbmVyYWwuCgpIYXMgdGhlIGdpdGxhYiBjaSBzdHVmZiBiZWVu
IGZpeGVkIHNvIGl0IGRvZXNuJ3QgZmFpbCAxMDAlIG9mIHRpbWUKYW55d2F5PyBBdCBsZWFzdCBJ
J3ZlIGFscmVhZHkgYmVlbiBmdWxseSBjb25kaXRpb25lZCB0byBpZ25vcmUgYWxsCmdpdGxhYiBl
cnJvcnMgYmVjYXVzZSBvZiB0aGF0LgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
