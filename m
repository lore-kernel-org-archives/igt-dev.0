Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CA46E97F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Mar 2018 18:17:37 +0000 (UTC)
Message-ID: <1521656245.3150.2.camel@intel.com>
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
Date: Wed, 21 Mar 2018 11:17:25 -0700
In-Reply-To: <152159436823.2146.5478909311393493798@mail.alporthouse.com>
References: <20180321002945.31876-1-paulo.r.zanoni@intel.com>
 <152159436823.2146.5478909311393493798@mail.alporthouse.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH igt] tests/kms_frontbuffer_tracking: increase
 FBC wait timeout to 5s
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RW0gUXVhLCAyMDE4LTAzLTIxIMOgcyAwMTowNiArMDAwMCwgQ2hyaXMgV2lsc29uIGVzY3JldmV1
Ogo+IFF1b3RpbmcgUGF1bG8gWmFub25pICgyMDE4LTAzLTIxIDAwOjI5OjQ1KQo+ID4gRnJvbTog
IkxvZnN0ZWR0LCBNYXJ0YSIgPG1hcnRhLmxvZnN0ZWR0QGludGVsLmNvbT4KPiA+IAo+ID4gVGhp
cyBpcyBhIHBhcnRpYWwgcmV2ZXJ0IG9mOgo+ID4gNjQ1OTBjN2I3NjhkYzhkOGRkOTYyZjgxMmQ1
ZmY1YTM5ZTdlOGI1NAo+ID4gKCJrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmc6Cj4gPiByZWR1Y2Ug
dGhlIEZCQyB3YWl0IHRpbWVvdXQgdG8gMnMiKQo+ID4gCj4gPiBUaGUgc3VidGVzdHM6IGlndEBr
bXNfZnJvbnRidWZmZXJfdHJhY2tpbmdAZmJjLSpkcmF3KiBoYXZlCj4gPiBub24tY29uc2lzdGVu
dCByZXN1bHRzLCBwZW5kaW5nIGJldHdlZW4gZmFpbCBhbmQgcGFzcy4gVGhlIGZhaWxzCj4gPiBh
cmUKPiA+IGFsd2F5cyBkdWUgdG8gIkZCQyBkaXNhYmxlZCIuICBXaXRoIHRoaXMgaW5jcmVhc2Ug
aW4gdGltZW91dCB0aGUKPiA+IGZsaXAtZmxvcCBiZWhhdmlvciBpcyBubyBsb25nZXIgcmVwcm9k
dWNpYmxlLgo+IAo+IFdlIGhhdmVuJ3Qgc2VlbiB0aGlzIGJlaGF2aW91ciBmb3IgYSBmZXcgbW9u
dGhzLCBhZmFpY3QuIEN1cnJlbnRseSB3ZQo+IGhhdmUgRkJDIHBlcm1hLWRpc2FibGVkIGR1ZSB0
byBiYWQgbW9kZSwgdW5kZXJydW5zIGFuZCB3aGF0bm90LCBhbmQKPiBmbGlwIGZsb3BzIGZyb20g
Q1JDIG1pc21hdGNoZXMuIEJ1dCBubyBGQkMgdGltZW91dHMgd2FpdGluZyBmb3IgCj4gZW5hYmxl
LgoKVGhlbiB3aHkgaXMgaXQgYmVpbmcgcmVwb3J0ZWQgYXMgaGlnaGVzdC1wcmlvcml0eS1uZWVk
cy10by1iZS1maXhlZC0KaW1tZWRpYXRlbHkgdG8gbWU/IFRoZSBnb2FsIG9mIHRoZSBwYXRjaCB3
b3VsZCBiZSB0byB0cnkgdG8gcmVkdWNlIHRoZQpmbGlwLWZsb3BwaW5nIGNhdXNlZCBieSB0aGUg
bG93IHRpbWVvdXQgc28gd2UgY2FuIGJldHRlciBzcGxpdCB0aGlzCnR5cGUgb2YgcHJvYmxlbSBm
cm9tIHRoZSBvdGhlcnMgdGhhdCBtYXkgYmUgaGFwcGVuaW5nLgoKPiAtQ2hyaXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
