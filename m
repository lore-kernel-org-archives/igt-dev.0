Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F696E619
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Nov 2018 17:43:20 +0000 (UTC)
Date: Wed, 21 Nov 2018 19:43:18 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20181121174318.GI1830@ideak-desk.fi.intel.com>
References: <1541244966-27134-1-git-send-email-jyoti.r.yadav@intel.com>
 <1541244966-27134-6-git-send-email-jyoti.r.yadav@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1541244966-27134-6-git-send-email-jyoti.r.yadav@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 5/5] [intel-gfx] tests/pm_dc: Added
 test for DC6 during DPMS
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jyoti Yadav <jyoti.r.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gU2F0LCBOb3YgMDMsIDIwMTggYXQgMDc6MzY6MDZBTSAtMDQwMCwgSnlvdGkgWWFkYXYgd3Jv
dGU6Cj4gQWRkZWQgbmV3IHN1YnRlc3QgZm9yIERDNiBlbnRyeSBkdXJpbmcgRFBNUyBvbi9vZmYg
Y3ljbGUuCj4gRHVyaW5nIERQTVMgb24vb2ZmIGN5Y2xlIERDNiBjb3VudGVyIGlzIGluY3JlbWVu
dGVkLgo+IAo+IHYyOiBSZW5hbWVkIHRoZSBzdWJ0ZXN0IG5hbWUuCj4gdjM6IFJlYmFzZWQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29tPgo+
IC0tLQo+ICB0ZXN0cy9wbV9kYy5jIHwgMTEgKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
cG1fZGMuYyBiL3Rlc3RzL3BtX2RjLmMKPiBpbmRleCBkNDdiODM3Li42ZDcxZTM0IDEwMDY0NAo+
IC0tLSBhL3Rlc3RzL3BtX2RjLmMKPiArKysgYi90ZXN0cy9wbV9kYy5jCj4gQEAgLTIxMSw3ICsy
MTEsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQo+ICAJCWlndF9pbmZvKCJS
dW50aW1lIFBNIHN1cHBvcnQ6ICVkXG4iLCBoYXNfcnVudGltZV9wbSk7Cj4gIAkJaWd0X3JlcXVp
cmUoaGFzX3J1bnRpbWVfcG0pOwo+ICAJCWlndF9yZXF1aXJlKGlndF9wbV9kbWNfbG9hZGVkKGRh
dGEuZGVidWdmc19mZCkpOwo+IC0JCWlndF9kaXNwbGF5X2luaXQoJmRhdGEtPmRpc3BsYXksIGRh
dGEtPmRybV9mZCk7Cj4gKwkJaWd0X2Rpc3BsYXlfaW5pdCgmZGF0YS5kaXNwbGF5LCBkYXRhLmRy
bV9mZCk7CgpTaG91bGQgYmUgZml4ZWQgaW4gdGhlIHBhdGNoIGFkZGluZyBpdC4KCj4gIAkJLy9k
aXNwbGF5X2luaXQoJmRhdGEpOwo+ICAJfQo+ICAKPiBAQCAtMjQ4LDYgKzI0OCwxNSBAQCBpbnQg
bWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQo+ICAJLy8JY2xlYW51cCgmZGF0YSk7Cj4gIAl9
Cj4gIAo+ICsJaWd0X3N1YnRlc3QoImRjNi1kcG1zIikgewo+ICsJCS8qIENoZWNrIERDNiBjb3Vu
dGVyIGlzIGF2YWlsYWJsZSBmb3IgdGhlIHBsYXRmb3JtLgo+ICsJCSAqIFNraXAgdGhlIHRlc3Qg
aWYgY291bnRlciBpcyBub3QgYXZhaWxhYmxlLgo+ICsJCSAqLwo+ICsJCXJlYWRfZGNfY291bnRl
cihkYXRhLmRybV9mZCwgQ0hFQ0tfREM2KTsKPiArCQl0ZXN0X2RjX3N0YXRlX2RwbXMoJmRhdGEs
IENIRUNLX0RDNik7Cj4gKwkJLy9jbGVhbnVwKCZkYXRhKTsKCkxlZnRvdmVyIGNvZGUuCgo+ICsJ
fQo+ICsKPiAgCWlndF9maXh0dXJlIHsKPiAgCQljbG9zZShkYXRhLmRlYnVnZnNfZmQpOwo+ICAJ
CWRpc3BsYXlfZmluaSgmZGF0YSk7Cj4gLS0gCj4gMS45LjEKPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
