Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA096EC9B
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2019 07:31:53 +0000 (UTC)
Date: Thu, 19 Sep 2019 09:31:50 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20190919073150.GN25026@kdec5-desk.ger.corp.intel.com>
References: <20190918081745.26669-1-katarzyna.dec@intel.com>
 <20190918141400.le3ohrj2wzujvjvy@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918141400.le3ohrj2wzujvjvy@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 0/2] Adding gpgpu_fill and media_fill
 on TGL
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDU6MTQ6MDBQTSArMDMwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IE9uIFdlZCwgU2VwIDE4LCAyMDE5IGF0IDEwOjE3OjQzQU0gKzAyMDAsIEthdGFy
enluYSBEZWMgd3JvdGU6Cj4gPiBpUGF0Y2hlcyBhZGQgbWVkaWFfZmlsbCBhbmQgZ3BncHVfZmls
bCBmdW5jdGlvbnMgb24gVEdMLgo+ID4gCj4gPiB2MjogU3dpdGNoZWQgdG8gSVNfR0VOMTIgbWFj
cm8uCj4gPiB2MzogTWlub3IgY2hlY2twYXRjaCBjaGFuZ2VzCj4gPiAKPiA+IEthdGFyenluYSBE
ZWMgKDIpOgo+ID4gICBsaWIvZ3BncHVfZmlsbC90Z2w6IEltcGxlbWVudCBncGdwdV9maWxsZnVu
YyBmb3IgVEdMCj4gPiAgIGxpYi9tZWRpYV9maWxsL3RnbDogSW1wbGVtZW50IG1lZGlhX2ZpbGxm
dW5jIGZvciBUR0wKPiA+IAo+ID4gIGxpYi9ncGdwdV9maWxsLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrCj4gPiAgbGliL2dwZ3B1X2ZpbGwuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysrCj4gPiAgbGliL2k5MTUvc2hh
ZGVycy9SRUFETUUgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKPiA+ICBsaWIvaTkxNS9z
aGFkZXJzL2dwZ3B1L2dlbjEyX2dwZ3B1X2tlcm5lbC5hc20gfCAxMiArKysrKysrKysKPiA+ICBs
aWIvaTkxNS9zaGFkZXJzL21lZGlhL2dlbjEyX21lZGlhX2tlcm5lbC5hc20gfCAxMyArKysrKysr
KysrCj4gPiAgbGliL2ludGVsX2JhdGNoYnVmZmVyLmMgICAgICAgICAgICAgICAgICAgICAgIHwg
IDYgKysrKy0KPiA+ICBsaWIvbWVkaWFfZmlsbC5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyNSArKysrKysrKysrKysrKysrKysrCj4gPiAgbGliL21lZGlhX2ZpbGwuaCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysrCj4gPiAgOCBmaWxlcyBjaGFuZ2VkLCA5
NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxp
Yi9pOTE1L3NoYWRlcnMvZ3BncHUvZ2VuMTJfZ3BncHVfa2VybmVsLmFzbQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBsaWIvaTkxNS9zaGFkZXJzL21lZGlhL2dlbjEyX21lZGlhX2tlcm5lbC5hc20K
PiAKPiBSZXZpZXdlZC1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwu
Y29tPgo+IAo+IGZvciB0aGUgd2hvbGUgc2VyaWVzCgpQdXNoZWQhIFRoYW5rcyA6KQpLYXNpYQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
