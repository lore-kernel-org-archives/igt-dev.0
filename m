Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8078188DA5
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 11:22:31 +0000 (UTC)
Date: Wed, 20 Feb 2019 13:22:27 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190220112227.ykrhqp6lgqucfs2y@ahiler-desk1.fi.intel.com>
References: <20190219075716.11553-1-daniel.vetter@ffwll.ch>
 <20190219075716.11553-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190219075716.11553-5-daniel.vetter@ffwll.ch>
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] lib/tests: Add testcase for
 nonexisting subtest name
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBGZWIgMTksIDIwMTkgYXQgMDg6NTc6MTZBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXaGlsZSBhdCBpdCwgY29udmVydCB0aGUgZXhpc3RpbmcgdGVzdGNhc2UgZm9yIGlu
dmFsaWQgc3VidGVzdCBuYW1lcwo+IHRvIGEgcG9zaXRpdmUgb25lLgo+IAo+IFRoaXMgaXMgdGhl
IG9ubHkgdGhpbmcgdGhlIGludmFsaWQgc3VidGVzdCBjaGVja2luZyBmb3IgYWxsIHRlc3RzIGRp
ZAo+IGNvdmVyLCB3aGljaCB3YXNuJ3QgY292ZXJlZCB0aHJvdWdoIHNvbWUgb3RoZXIgY2hlY2tz
IGFscmVhZHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+Cj4gLS0tCj4gIGxpYi90ZXN0cy9pZ3RfaW52YWxpZF9zdWJ0ZXN0X25hbWUu
YyB8IDYyICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgbGliL3Rlc3RzL21lc29uLmJ1
aWxkICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvdGVzdHMvaWd0X2lu
dmFsaWRfc3VidGVzdF9uYW1lLmMgYi9saWIvdGVzdHMvaWd0X2ludmFsaWRfc3VidGVzdF9uYW1l
LmMKPiBpbmRleCA0MTgwNzFkYTA1OTEuLmY5NjJlMGRmMDEyMSAxMDA2NDQKPiAtLS0gYS9saWIv
dGVzdHMvaWd0X2ludmFsaWRfc3VidGVzdF9uYW1lLmMKPiArKysgYi9saWIvdGVzdHMvaWd0X2lu
dmFsaWRfc3VidGVzdF9uYW1lLmMKPiBAQCAtMjEsMTEgKzIxLDcxIEBACj4gICAqIElOIFRIRSBT
T0ZUV0FSRS4KPiAgICovCj4gIAo+ICsjaW5jbHVkZSA8ZXJybm8uaD4KPiArI2luY2x1ZGUgPHN5
cy93YWl0Lmg+Cj4gKwo+ICAjaW5jbHVkZSAiaWd0X2NvcmUuaCIKPiAgCj4gLWlndF9tYWluCj4g
KyNpbmNsdWRlICJpZ3RfdGVzdHNfY29tbW9uLmgiCj4gKwo+ICtzdGF0aWMgdm9pZCBpbnZhbGlk
X3N1YnRlc3RfbmFtZSh2b2lkKQo+ICB7Cj4gKwljaGFyIHByb2dbXSA9ICJpZ3Rfbm9fZXhpdCI7
Cj4gKwljaGFyICpmYWtlX2FyZ3ZbXSA9IHtwcm9nfTsKPiArCWludCBmYWtlX2FyZ2MgPSAxOwoK
U2FtZSB0aGluZyB3aXRoIEFSUkFZX1NJWkUgYXMgaW4gNC81LCBidXQgdGhhdCBpbiB0aG9zZSB0
cml2aWFsIGNhc2VzCml0J3MganVzdCBzdWdhci4KClJldmlld2VkLWJ5OiBBcmthZGl1c3ogSGls
ZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
