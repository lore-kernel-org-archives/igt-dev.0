Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5698289FD4
 for <igt-dev@lists.freedesktop.org>; Sun,  2 Aug 2020 12:04:52 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200802063601.8259-4-zbigniew.kempczynski@intel.com>
References: <20200802063601.8259-1-zbigniew.kempczynski@intel.com>
 <20200802063601.8259-4-zbigniew.kempczynski@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun, 02 Aug 2020 13:04:48 +0100
Message-ID: <159636988890.26228.15790696545409769483@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v21 03/17] lib/intel_bufops: change
 stride requirements for Grantsdale
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
To: zbigniew.kempczynski@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMDgtMDIgMDc6MzU6NDcpCj4gU2ln
bmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBp
bnRlbC5jb20+Cj4gLS0tCj4gIGxpYi9pbnRlbF9idWZvcHMuYyB8IDkgKysrKystLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2xpYi9pbnRlbF9idWZvcHMuYyBiL2xpYi9pbnRlbF9idWZvcHMuYwo+IGluZGV4IDJi
YTRkYmY2Li5kMDc3YjFhYyAxMDA2NDQKPiAtLS0gYS9saWIvaW50ZWxfYnVmb3BzLmMKPiArKysg
Yi9saWIvaW50ZWxfYnVmb3BzLmMKPiBAQCAtNzUyLDggKzc1Miw3IEBAIHN0YXRpYyB2b2lkIF9f
aW50ZWxfYnVmX2luaXQoc3RydWN0IGJ1Zl9vcHMgKmJvcHMsCj4gIAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGlmIChib3BzLT5pbnRlbF9nZW4gPCAzKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdGlsZV93aWR0aCA9IDEyODsKPiAtICAgICAgICAgICAgICAgICAgICAgICBl
bHNlIGlmIChJU185MTVHTShkZXZpZCkgfHwgSVNfOTE1RyhkZXZpZCkgfHwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBidWYtPnRpbGluZyA9PSBJOTE1X1RJTElOR19YKQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGVsc2UgaWYgKElTXzkxNUcoZGV2aWQpIHx8IGJ1Zi0+dGls
aW5nID09IEk5MTVfVElMSU5HX1gpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0
aWxlX3dpZHRoID0gNTEyOwoKI2RlZmluZSBIQVNfMTI4X0JZVEVfWV9USUxJTkcoZGV2X3ByaXYp
IFwKCSghSVNfR0VOKGRldl9wcml2LCAyKSAmJiAhKElTX0k5MTVHKGRldl9wcml2KSB8fCBJU19J
OTE1R00oZGV2X3ByaXYpKSkKClRoYXQgaXMgYm90aCBpOTE1ZyBhbmQgaTkxNWdtIHVzZSA1MTJC
IGZvciB5LXRpbGluZyB3aWR0aHMuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
