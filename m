Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <2ebddb86-a072-45f7-b64c-26e296d3ba0e@intel.com>
References: <20190729191955.24544-1-chris@chris-wilson.co.uk>
 <2ebddb86-a072-45f7-b64c-26e296d3ba0e@intel.com>
Message-ID: <156459872707.15787.1928235939364477079@skylake-alporthouse-com>
Date: Wed, 31 Jul 2019 19:45:27 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_schedule: Avoid using
 borked engines
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
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaW5heSBCZWxnYXVta2FyICgyMDE5LTA3LTMxIDE5OjMxOjM4KQo+IAo+IAo+IE9u
IDA3LzI5LzIwMTkgMTI6MTkgUE0sIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IENoZWNrIGZvciB2
aWFiaWxpdHkgb2Ygc3RvcmUtZHdvcmQgYmVmb3JlIHVzZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+IC0tLQo+ID4gICB0
ZXN0cy9pOTE1L2dlbV9leGVjX3NjaGVkdWxlLmMgfCA2ICsrKystLQo+ID4gICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS90ZXN0cy9pOTE1L2dlbV9leGVjX3NjaGVkdWxlLmMgYi90ZXN0cy9pOTE1L2dlbV9leGVjX3Nj
aGVkdWxlLmMKPiA+IGluZGV4IDRjY2FjYmE0MS4uNmU4NDY2Mjk5IDEwMDY0NAo+ID4gLS0tIGEv
dGVzdHMvaTkxNS9nZW1fZXhlY19zY2hlZHVsZS5jCj4gPiArKysgYi90ZXN0cy9pOTE1L2dlbV9l
eGVjX3NjaGVkdWxlLmMKPiA+IEBAIC0yODIsOSArMjgyLDExIEBAIHN0YXRpYyB2b2lkIHNtb2tl
dGVzdChpbnQgZmQsIHVuc2lnbmVkIHJpbmcsIHVuc2lnbmVkIHRpbWVvdXQpCj4gPiAgICAgICBu
ZW5naW5lID0gMDsKPiA+ICAgICAgIGlmIChyaW5nID09IEFMTF9FTkdJTkVTKSB7Cj4gPiAgICAg
ICAgICAgICAgIGZvcl9lYWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZW5naW5lKQo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgIGVuZ2luZXNbbmVuZ2luZSsrXSA9IGVuZ2luZTsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBpZiAoZ2VtX2Nhbl9zdG9yZV9kd29yZChmZCwgZW5naW5lKSkKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVuZ2luZXNbbmVuZ2luZSsrXSA9IGVuZ2luZTsK
PiA+ICAgICAgIH0gZWxzZSB7Cj4gCj4gVGhlIGdlbV9jYW5fc3RvcmVfZHdvcmQoKSBjaGVjayBp
cyBhbHJlYWR5IGV4ZWN1dGVkIGluIHRoZSBmaXh0dXJlIGZvciAKPiBwZXIgZW5naW5lIHNtb2tl
dGVzdCwgcmlnaHQ/Cj4gV2Ugb25seSBuZWVkIGl0IGZvciB0aGUgc21va2V0ZXN0LWFsbCBjYXNl
PwoKWWVzLCBidXQgSSBsaWtlZCB0aGUgc3ltbWV0cnkuCi1DaHJpcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
