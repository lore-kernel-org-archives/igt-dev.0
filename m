Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1157D6E9F7
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2019 06:15:44 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Tue, 24 Sep 2019 06:15:41 +0000
Message-ID: <c64e0593736647913fc11d6efe48d5c6ab327a69.camel@intel.com>
References: <20190923130613.14805-1-petri.latvala@intel.com>
In-Reply-To: <20190923130613.14805-1-petri.latvala@intel.com>
Content-Language: en-US
Content-ID: <4D3FB2F723B8554C8668F276686D2AE1@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] testdisplay: Don't double-close udev fd
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA5LTIzIGF0IDE2OjA2ICswMzAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOgo+
IHRlc3RkaXNwbGF5IHVzZXMgR0lPIGZvciBwb2xsaW5nIHRoZSB1ZGV2IGZkIGZvciBldmVudHMu
IFdoZW4KPiBzaHV0dGluZwo+IGRvd24sIGJvdGggdGhlIEdJTyBjaGFubmVsIGFuZCBsaWJ1ZGV2
IHdhbnQgdG8gY2xvc2UgdGhlaXIgcmVzcGVjdGl2ZQo+IGZkcywgbGVhZGluZyB0byBhIGRvdWJs
ZSBjbG9zZS4KPiAKPiBTaW5jZSB2ZXJzaW9uIDI0MCAoYXMgdXNlZCBieSBVYnVudHUgMTkuMDQp
LCBsaWJ1ZGV2IGhhcyBjb21wbGFpbmVkCj4gbG91ZGx5IGlmIGNsb3NlKCkgZmFpbHMgd2l0aCBF
QkFERi4gUHJldmlvdXNseSB0aGUgZXJyb3IgaGFzIGZsb3duCj4gdW5kZXIgdGhlIHJhZGFyLgo+
IAo+IENhbGxpbmcgZ19pb19jaGFubmVsX3NodXRkb3duKCkgd2lsbCBjYWxsIGNsb3NlKCkgb24g
dGhlIGZkCj4gcmVnYXJkbGVzcwo+IG9mIGdfaW9fY2hhbm5lbF9zZXRfY2xvc2Vfb25fdW5yZWYs
IHNvIG9wZW5jb2RlIHRoZSBmbHVzaCBhbmQgdW5yZWYKPiBpbnN0ZWFkIHRvIGF2b2lkIGRvdWJs
ZSBjbG9zaW5nLgo+IAoKUmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRl
bC5jb20+Cgo+IFNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50
ZWwuY29tPgo+IENjOiBKYW5pIFNhYXJpbmVuIDxqYW5pLnNhYXJpbmVuQGludGVsLmNvbT4KPiBD
YzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgo+IC0tLQo+ICB0
ZXN0cy90ZXN0ZGlzcGxheV9ob3RwbHVnLmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy90
ZXN0ZGlzcGxheV9ob3RwbHVnLmMKPiBiL3Rlc3RzL3Rlc3RkaXNwbGF5X2hvdHBsdWcuYwo+IGlu
ZGV4IDU4MWQ5ODdlLi5jZDc4NDg5NSAxMDA2NDQKPiAtLS0gYS90ZXN0cy90ZXN0ZGlzcGxheV9o
b3RwbHVnLmMKPiArKysgYi90ZXN0cy90ZXN0ZGlzcGxheV9ob3RwbHVnLmMKPiBAQCAtMTE3LDgg
KzExNywxMCBAQCBvdXQ6Cj4gIAo+ICB2b2lkIHRlc3RkaXNwbGF5X2NsZWFudXBfaG90cGx1Zyh2
b2lkKQo+ICB7Cj4gLQlpZiAodWRldmNoYW5uZWwpCj4gLQkJZ19pb19jaGFubmVsX3NodXRkb3du
KHVkZXZjaGFubmVsLCBUUlVFLCBOVUxMKTsKPiArCWlmICh1ZGV2Y2hhbm5lbCkgewo+ICsJCWdf
aW9fY2hhbm5lbF9mbHVzaCh1ZGV2Y2hhbm5lbCwgTlVMTCk7Cj4gKwkJZ19pb19jaGFubmVsX3Vu
cmVmKHVkZXZjaGFubmVsKTsKPiArCX0KPiAgCWlmICh1ZXZlbnRfbW9uaXRvcikKPiAgCQl1ZGV2
X21vbml0b3JfdW5yZWYodWV2ZW50X21vbml0b3IpOwo+ICAJaWYgKHVkZXYpCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
