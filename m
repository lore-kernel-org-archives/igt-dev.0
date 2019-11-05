Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641A36E959
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2019 09:24:36 +0000 (UTC)
Date: Tue, 5 Nov 2019 10:24:33 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20191105092433.GR28532@kdec5-desk.ger.corp.intel.com>
References: <20191024110546.25569-1-petri.latvala@intel.com>
 <20191024110546.25569-9-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024110546.25569-9-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 8/8] i915/gem_exec_basic: Use dynamic
 subtests
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDI6MDU6NDZQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBJbnN0ZWFkIG9mIGdlbmVyYXRpbmcgYSBzdWJ0ZXN0IGZvciBlYWNoIGVuZ2luZSBp
biBhIHN0YXRpYyBsaXN0LAo+IGNvbnZlcnQgdG8gZHluYW1pYyBzdWJ0ZXN0cywgd2l0aCBvbmUg
ZHluYW1pYyBzdWJ0ZXN0IHBlciBhY3R1YWxseQo+IHByZXNlbnQgcGh5c2ljYWwgZW5naW5lLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29t
Pgo+IC0tLQo+ICB0ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMgfCAyNiArKysrKysrKysrKysr
KysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fZXhlY19iYXNpYy5jIGIv
dGVzdHMvaTkxNS9nZW1fZXhlY19iYXNpYy5jCj4gaW5kZXggMTI4Nzg2MGIuLmIyZDZkZGMyIDEw
MDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYwo+ICsrKyBiL3Rlc3RzL2k5
MTUvZ2VtX2V4ZWNfYmFzaWMuYwo+IEBAIC0xNTksMTMgKzE1OSwyNSBAQCBpZ3RfbWFpbgo+ICAJ
aWd0X3N1YnRlc3QoImd0dC1hbGwiKQo+ICAJCWd0dF9hbGwoZmQpOwo+ICAKPiAtCV9fZm9yX2Vh
Y2hfcGh5c2ljYWxfZW5naW5lKGZkLCBlKSB7Cj4gLQkJaWd0X3N1YnRlc3RfZigiYmFzaWMtJXMi
LCBlLT5uYW1lKQo+IC0JCQlub29wKGZkLCBlLT5mbGFncyk7Cj4gLQkJaWd0X3N1YnRlc3RfZigi
cmVhZG9ubHktJXMiLCBlLT5uYW1lKQo+IC0JCQlyZWFkb25seShmZCwgZS0+ZmxhZ3MpOwo+IC0J
CWlndF9zdWJ0ZXN0X2YoImd0dC0lcyIsIGUtPm5hbWUpCj4gLQkJCWd0dChmZCwgZS0+ZmxhZ3Mp
Owo+ICsJaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljX3N1YnN1YnRlc3RzKCJiYXNpYyIpIHsKPiAr
CQlfX2Zvcl9lYWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZSkgewo+ICsJCQlpZ3RfZHluYW1pY19z
dWJzdWJ0ZXN0X2YoIiVzIiwgZS0+bmFtZSkKPiArCQkJCW5vb3AoZmQsIGUtPmZsYWdzKTsKPiAr
CQl9Cj4gKwl9Cj4gKwo+ICsJaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljX3N1YnN1YnRlc3RzKCJy
ZWFkb25seSIpIHsKPiArCQlfX2Zvcl9lYWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZSkgewo+ICsJ
CQlpZ3RfZHluYW1pY19zdWJzdWJ0ZXN0X2YoIiVzIiwgZS0+bmFtZSkKPiArCQkJCXJlYWRvbmx5
KGZkLCBlLT5mbGFncyk7Cj4gKwkJfQo+ICsJfQo+ICsKPiArCWlndF9zdWJ0ZXN0X3dpdGhfZHlu
YW1pY19zdWJzdWJ0ZXN0cygiZ3R0Iikgewo+ICsJCV9fZm9yX2VhY2hfcGh5c2ljYWxfZW5naW5l
KGZkLCBlKSB7Cj4gKwkJCWlndF9keW5hbWljX3N1YnN1YnRlc3RfZigiJXMiLCBlLT5uYW1lKQo+
ICsJCQkJZ3R0KGZkLCBlLT5mbGFncyk7Cj4gKwkJfQo+ICAJfQo+ICAKPiAgCWlndF9maXh0dXJl
IHsKPiAtLSAKPiAyLjE5LjEKPgpMR1RNIDopClJldmlld2VkLWJ5OiBLYXRhcnp5bmEgRGVjIDxr
YXRhcnp5bmEuZGVjQGludGVsLmNvbT4KS2FzaWEgOikKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2
