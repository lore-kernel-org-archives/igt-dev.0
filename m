Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFB46E8C9
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Aug 2018 11:54:34 +0000 (UTC)
Date: Fri, 31 Aug 2018 13:54:32 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20180831115432.GD18600@kdec5-desk.ger.corp.intel.com>
References: <20180831104115.11344-1-katarzyna.dec@intel.com>
 <20180831110049.15277-1-katarzyna.dec@intel.com>
 <20180831115108.auuck57ppuh5pulu@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180831115108.auuck57ppuh5pulu@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/drmtest: Move open device to
 separate function
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBBdWcgMzEsIDIwMTggYXQgMDI6NTE6MDhQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBGcmksIEF1ZyAzMSwgMjAxOCBhdCAwMTowMDo0OVBNICswMjAwLCBLYXRhcnp5
bmEgRGVjIHdyb3RlOgo+ID4gV2hpbGUgd29ya2luZyBvbiBJR1QgY29kZSBhbmQgZHVyaW5nIHJl
dmlld2VzIEkndmUgbm90aWNlZCB0aGF0Cj4gPiBpdCBjb3VsZCBiZSBuaWNlIHRvIGhhdmUgZnVu
Y3Rpb24gdGhhdCBpcyBvcGVuaW5nIHBhcnRpY3VsYXIgZGV2aWNlLgo+ID4gTGV0J3MgbW92ZSBv
dXQgY29uZGl0aW9ucyBmb3Igb3BlbmluZyBkZXZpY2UgYW5kIHJlbmFtZSBfX29wZW5fZGV2aWNl
Cj4gPiB0byBfX3NlYXJjaF9hbmRfb3BlbigpIGZ1bmN0aW9uLgo+ID4gCj4gPiB2MjogUmVmYWN0
b3JlZCBvcGVuX2RldmljZSBldmVuIG1vcmUgYnkgZ2V0dGluZyBkZXZpY2UgbmFtZSBvbmNlIGFu
ZAo+ID4gcmV0dXJuaW5nIGZkIGZvciBpdC4gKENocmlzKQo+ID4gdjM6IEFkZGVkIG5hbWVfc2l6
ZSB0byBfX2dldF9kcm1fZGV2aWNlX25hbWUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEthdGFy
enluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwuY29tPgo+ID4gQ2M6IERhbmllbGUgQ2VyYW9s
byBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+Cj4gPiBDYzogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiAtLS0KPiAKPiAKPiAKPiBUaGlz
IGJyZWFrcyBvcGVuaW5nIHZpcnRpb19ncHUuCj4gCj4gCj4gLS0gCj4gUGV0cmkgTGF0dmFsYQo+
IApJIHdpbGwgbG9vayBhdCB0aGF0LgpLYXNpYSA6KQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
