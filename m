Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <2c71f2e6-2d60-740a-7e87-dde07d651ab0@linux.intel.com>
References: <20190520144739.13111-1-tvrtko.ursulin@linux.intel.com>
 <20190520144739.13111-3-tvrtko.ursulin@linux.intel.com>
 <155842546526.23981.5722257697980402246@skylake-alporthouse-com>
 <2c71f2e6-2d60-740a-7e87-dde07d651ab0@linux.intel.com>
Message-ID: <155845258508.23981.3242009455865980581@skylake-alporthouse-com>
Date: Tue, 21 May 2019 16:29:45 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 02/27] trace.pl: Ignore signaling on non
 i915 fences
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNS0yMSAxNDoyMjoxOCkKPiAKPiBPbiAyMS8w
NS8yMDE5IDA4OjU3LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFR2cnRrbyBVcnN1
bGluICgyMDE5LTA1LTIwIDE1OjQ3OjE0KQo+ID4+IEZyb206IFR2cnRrbyBVcnN1bGluIDx0dnJ0
a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gPj4KPiA+PiBnZW1fd3NpbSB1c2VzIHRoZSBzd19mZW5j
ZSB0aW1lbGluZSBhbmQgY29uZnVzZXMgdGhlIHNjcmlwdC4KPiA+Pgo+ID4+IHYyOgo+ID4+ICAg
KiBDaGVjayB0aGUgY29ycmVjdCB0aW1lbGluZSBhcyB3ZWxsLiAoQ2hyaXMpCj4gPj4KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+
ID4+IC0tLQo+ID4+ICAgc2NyaXB0cy90cmFjZS5wbCB8IDMgKysrCj4gPj4gICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy90cmFj
ZS5wbCBiL3NjcmlwdHMvdHJhY2UucGwKPiA+PiBpbmRleCA4Yzg5NmNmZGU2YjAuLmFjMTQxYTUx
NDA1NSAxMDA3NTUKPiA+PiAtLS0gYS9zY3JpcHRzL3RyYWNlLnBsCj4gPj4gKysrIGIvc2NyaXB0
cy90cmFjZS5wbAo+ID4+IEBAIC00NDMsNiArNDQzLDkgQEAgd2hpbGUgKDw+KSB7Cj4gPj4gICAg
ICAgICAgfSBlbHNpZiAoJHRwX25hbWUgZXEgJ2RtYV9mZW5jZTpkbWFfZmVuY2Vfc2lnbmFsZWQ6
Jykgewo+ID4+ICAgICAgICAgICAgICAgICAgbXkgJG5rZXk7Cj4gPj4gICAKPiA+PiArICAgICAg
ICAgICAgICAgbmV4dCB1bmxlc3MgJHRweydkcml2ZXInfSBlcSAnaTkxNScgYW5kCj4gPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICR0cHsndGltZWxpbmUnfSBlcSAnc2lnbmFsZWQnOwo+
ID4gCj4gPiBIb3BlZnVsbHkgdGhhdCByZW1haW5zIHVuaXF1ZS4uLgo+ID4gUmV2aWV3ZWQtYnk6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gCj4gPiBJIGRvIHJl
Y2FsbCB3YW50aW5nIHRvIHJlbW92ZSB0aGUgc3RyaW5ncyBmcm9tIGFsbCB0aGUgdHJhY2Vwb2lu
dHMgOi1wCj4gCj4gRWVlay4uIGxldCdzIHRyeSBhbmQgbm90IG1ha2UgdGhlIHJlcXVlc3QgdHJh
Y2luZyBhYmlsaXR5IGV2ZW4gbW9yZSB1c2VsZXNzLgoKWW91IGhhdmUgdGhlIGNvbnRleHQgaWQs
IHdoaWNoIGlzIHN1cHBvc2VkIHRvIGJlIHVuaXF1ZSAoc28gbG9uZyBhcyB3ZSBkb24ndApydW4g
Zm9yIGEgZmV3IHllYXJzLCBzaG91bGQgYmUpLiBBY3R1YWxseSwgd291bGRuJ3QgdGhhdCBiZSBi
ZXR0ZXIgaGVyZT8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
