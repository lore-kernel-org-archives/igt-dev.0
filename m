Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA627890E4
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2019 16:31:26 +0000 (UTC)
References: <20191024110546.25569-1-petri.latvala@intel.com>
 <20191024110546.25569-9-petri.latvala@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <927ea8d0-6e78-403f-3779-f0741218d72d@linux.intel.com>
Date: Fri, 8 Nov 2019 16:31:24 +0000
MIME-Version: 1.0
In-Reply-To: <20191024110546.25569-9-petri.latvala@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 8/8] i915/gem_exec_basic: Use dynamic
 subtests
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDI0LzEwLzIwMTkgMTI6MDUsIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4gSW5zdGVhZCBvZiBn
ZW5lcmF0aW5nIGEgc3VidGVzdCBmb3IgZWFjaCBlbmdpbmUgaW4gYSBzdGF0aWMgbGlzdCwKPiBj
b252ZXJ0IHRvIGR5bmFtaWMgc3VidGVzdHMsIHdpdGggb25lIGR5bmFtaWMgc3VidGVzdCBwZXIg
YWN0dWFsbHkKPiBwcmVzZW50IHBoeXNpY2FsIGVuZ2luZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQ
ZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPiAtLS0KPiAgIHRlc3RzL2k5
MTUvZ2VtX2V4ZWNfYmFzaWMuYyB8IDI2ICsrKysrKysrKysrKysrKysrKystLS0tLS0tCj4gICAx
IGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fZXhlY19iYXNpYy5jIGIvdGVzdHMvaTkxNS9nZW1fZXhl
Y19iYXNpYy5jCj4gaW5kZXggMTI4Nzg2MGIuLmIyZDZkZGMyIDEwMDY0NAo+IC0tLSBhL3Rlc3Rz
L2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYwo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMu
Ywo+IEBAIC0xNTksMTMgKzE1OSwyNSBAQCBpZ3RfbWFpbgo+ICAgCWlndF9zdWJ0ZXN0KCJndHQt
YWxsIikKPiAgIAkJZ3R0X2FsbChmZCk7Cj4gICAKPiAtCV9fZm9yX2VhY2hfcGh5c2ljYWxfZW5n
aW5lKGZkLCBlKSB7Cj4gLQkJaWd0X3N1YnRlc3RfZigiYmFzaWMtJXMiLCBlLT5uYW1lKQo+IC0J
CQlub29wKGZkLCBlLT5mbGFncyk7Cj4gLQkJaWd0X3N1YnRlc3RfZigicmVhZG9ubHktJXMiLCBl
LT5uYW1lKQo+IC0JCQlyZWFkb25seShmZCwgZS0+ZmxhZ3MpOwo+IC0JCWlndF9zdWJ0ZXN0X2Yo
Imd0dC0lcyIsIGUtPm5hbWUpCj4gLQkJCWd0dChmZCwgZS0+ZmxhZ3MpOwo+ICsJaWd0X3N1YnRl
c3Rfd2l0aF9keW5hbWljX3N1YnN1YnRlc3RzKCJiYXNpYyIpIHsKCkJpa2VzaGVkIG9uIHRoZSBu
YW1lIG1heWJlLCBzaW5jZSAic3Vic3ViIiByZWFkcyBhIGJpdCBmdW5ueS4KCmlndF9keW5hbWlj
X3N1YnRlc3RfZ3JvdXAgPwoKUmVnYXJkcywKClR2cnRrbwoKPiArCQlfX2Zvcl9lYWNoX3BoeXNp
Y2FsX2VuZ2luZShmZCwgZSkgewo+ICsJCQlpZ3RfZHluYW1pY19zdWJzdWJ0ZXN0X2YoIiVzIiwg
ZS0+bmFtZSkKPiArCQkJCW5vb3AoZmQsIGUtPmZsYWdzKTsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJ
aWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljX3N1YnN1YnRlc3RzKCJyZWFkb25seSIpIHsKPiArCQlf
X2Zvcl9lYWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZSkgewo+ICsJCQlpZ3RfZHluYW1pY19zdWJz
dWJ0ZXN0X2YoIiVzIiwgZS0+bmFtZSkKPiArCQkJCXJlYWRvbmx5KGZkLCBlLT5mbGFncyk7Cj4g
KwkJfQo+ICsJfQo+ICsKPiArCWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pY19zdWJzdWJ0ZXN0cygi
Z3R0Iikgewo+ICsJCV9fZm9yX2VhY2hfcGh5c2ljYWxfZW5naW5lKGZkLCBlKSB7Cj4gKwkJCWln
dF9keW5hbWljX3N1YnN1YnRlc3RfZigiJXMiLCBlLT5uYW1lKQo+ICsJCQkJZ3R0KGZkLCBlLT5m
bGFncyk7Cj4gKwkJfQo+ICAgCX0KPiAgIAo+ICAgCWlndF9maXh0dXJlIHsKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
