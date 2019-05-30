Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913D96E3A0
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2019 16:02:19 +0000 (UTC)
Date: Thu, 30 May 2019 21:35:05 +0530
From: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <20190530160505.GB16874@intel.com>
References: <20190530154222.16804-1-ramalingam.c@intel.com>
 <20190530154222.16804-6-ramalingam.c@intel.com>
 <155923144765.27302.9057723698511741237@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155923144765.27302.9057723698511741237@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 5/5] test/prime_vgem: use the
 gem_engine_topology library
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMjAxOS0wNS0zMCBhdCAxNjo1MDo0NyArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1
b3RpbmcgUmFtYWxpbmdhbSBDICgyMDE5LTA1LTMwIDE2OjQyOjIyKQo+ID4gUmVwbGFjZSB0aGUg
bGVnYWN5IGZvcl9lYWNoX2VuZ2luZSogZGVmaW5lcyB3aXRoIHRoZSBvbmVzCj4gPiBpbXBsZW1l
bnRlZCBpbiB0aGUgZ2VtX2VuZ2luZV90b3BvbG9neSBsaWJyYXJ5Lgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Cj4gPiAtLS0KPiA+
ICB0ZXN0cy9wcmltZV92Z2VtLmMgfCA3MCArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDM4
IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvcHJpbWVfdmdlbS5jIGIv
dGVzdHMvcHJpbWVfdmdlbS5jCj4gPiBpbmRleCA2OWFlOGM5YjA3MTAuLjc2ODlmNmIzZDZjOCAx
MDA2NDQKPiA+IC0tLSBhL3Rlc3RzL3ByaW1lX3ZnZW0uYwo+ID4gKysrIGIvdGVzdHMvcHJpbWVf
dmdlbS5jCj4gPiBAQCAtMzI1LDcgKzMyNSw3IEBAIHN0YXRpYyBib29sIHByaW1lX2J1c3koaW50
IGZkLCBib29sIGV4Y2wpCj4gPiAgICAgICAgIHJldHVybiBwb2xsKCZwZmQsIDEsIDApID09IDA7
Cj4gPiAgfQo+ID4gIAo+ID4gLXN0YXRpYyB2b2lkIHdvcmsoaW50IGk5MTUsIGludCBkbWFidWYs
IHVuc2lnbmVkIHJpbmcsIHVpbnQzMl90IGZsYWdzKQo+ID4gK3N0YXRpYyB2b2lkIHdvcmsoaW50
IGk5MTUsIGludCBkbWFidWYsIGNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAq
ZSkKPiA+ICB7Cj4gPiAgICAgICAgIGNvbnN0IGludCBTQ1JBVENIID0gMDsKPiA+ICAgICAgICAg
Y29uc3QgaW50IEJBVENIID0gMTsKPiA+IEBAIC0zNDEsNyArMzQxLDcgQEAgc3RhdGljIHZvaWQg
d29yayhpbnQgaTkxNSwgaW50IGRtYWJ1ZiwgdW5zaWduZWQgcmluZywgdWludDMyX3QgZmxhZ3Mp
Cj4gPiAgICAgICAgIG1lbXNldCgmZXhlY2J1ZiwgMCwgc2l6ZW9mKGV4ZWNidWYpKTsKPiA+ICAg
ICAgICAgZXhlY2J1Zi5idWZmZXJzX3B0ciA9ICh1aW50cHRyX3Qpb2JqOwo+ID4gICAgICAgICBl
eGVjYnVmLmJ1ZmZlcl9jb3VudCA9IDI7Cj4gPiAtICAgICAgIGV4ZWNidWYuZmxhZ3MgPSByaW5n
IHwgZmxhZ3M7Cj4gPiArICAgICAgIGV4ZWNidWYuZmxhZ3MgPSBlID8gZS0+ZmxhZ3MgOiBJOTE1
X0VYRUNfREVGQVVMVDsKPiAKPiBBZ2FpbiwgdGhpcyBpcyByYW5kb20gc2VsZWN0aW9uLiBJOTE1
X0VYRUNfREVGQVVMVCBpcyBkYW5nZXJvdXMgb25jZSBhCj4gcmFuZG9tIGVuZ2luZSBtYXAgaGFz
IGJlZW4gaW5zdGFsbGVkLgpTbyBzaG91bGQgd2UgdXNlIEk5MTVfRVhFQ19SRU5ERVIgaW5zdGVh
ZCBvZiBJOTE1X0VYRUNfREVGQVVMVD8KCi1SYW0uCj4gLUNocmlzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
