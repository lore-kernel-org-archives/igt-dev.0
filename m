Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20191101142123.18136-1-chris@chris-wilson.co.uk>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <d85f54be-4ef1-8647-7b9b-65adf93c30a8@intel.com>
Date: Fri, 1 Nov 2019 19:26:17 +0200
MIME-Version: 1.0
In-Reply-To: <20191101142123.18136-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/i915_selftests: Expose
 'perf' selftests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gMDEvMTEvMjAxOSAxNjoyMSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IEZpbmQgYWxsIHRoZSBw
ZXJmKiBzZWxmdGVzdHMgYW5kIGV4cG9zZSB0aGVtIGluIG91ciBpZ3QuIEluIENJIHdlIGV4cGVj
dAo+IHRoZXNlIG5vdCB0byBiZSBydW4gaW4gQkFUIChzaW5jZSB0aGV5IGFyZSBqdXN0IHBlcmZv
cm1hbmNlIHRlc3RzIHJhdGhlcgo+IHRoYW4gY29uZm9ybWFuY2UpLCBidXQgZXhwZWN0IHRoZSBy
ZXN1bHRzIHRvIGJlIGF2YWlsYWJsZSBmcm9tIHRoZQo+IHNoYXJkcy4KPgo+IFNpZ25lZC1vZmYt
Ynk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBNYXR0aGV3
IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+Cj4gQ2M6IFRvbWkgU2FydmVsYSA8dG9taS5w
LnNhcnZlbGFAaW50ZWwuY29tPgpBY2tlZC1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5n
LmxhbmR3ZXJsaW5AaW50ZWwuY29tPgo+IC0tLQo+ICAgdGVzdHMvaTkxNS9pOTE1X3NlbGZ0ZXN0
LmMgfCA1ICsrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvaTkxNS9pOTE1X3NlbGZ0ZXN0LmMgYi90ZXN0cy9pOTE1L2k5MTVfc2Vs
ZnRlc3QuYwo+IGluZGV4IDZkNTk3ZTY4Mi4uYWJjOGM5Yzc5IDEwMDY0NAo+IC0tLSBhL3Rlc3Rz
L2k5MTUvaTkxNV9zZWxmdGVzdC5jCj4gKysrIGIvdGVzdHMvaTkxNS9pOTE1X3NlbGZ0ZXN0LmMK
PiBAQCAtNDAsNCArNDAsOSBAQCBpZ3RfbWFpbgo+ICAgCQkJICAgICJsaXZlX3NlbGZ0ZXN0cz0t
MSBkaXNhYmxlX2Rpc3BsYXk9MSBzdF9maWx0ZXI9JXMiLAo+ICAgCQkJICAgIGVudikgPCBzaXpl
b2Yob3B0cykpOwo+ICAgCWlndF9rc2VsZnRlc3RzKCJpOTE1Iiwgb3B0cywgImxpdmVfc2VsZnRl
c3RzIiwgImxpdmUiKTsKPiArCj4gKwlpZ3RfYXNzZXJ0KHNucHJpbnRmKG9wdHMsIHNpemVvZihv
cHRzKSwKPiArCQkJICAgICJwZXJmX3NlbGZ0ZXN0cz0tMSBkaXNhYmxlX2Rpc3BsYXk9MSBzdF9m
aWx0ZXI9JXMiLAo+ICsJCQkgICAgZW52KSA8IHNpemVvZihvcHRzKSk7Cj4gKwlpZ3Rfa3NlbGZ0
ZXN0cygiaTkxNSIsIG9wdHMsICJwZXJmX3NlbGZ0ZXN0cyIsICJwZXJmIik7Cj4gICB9CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
