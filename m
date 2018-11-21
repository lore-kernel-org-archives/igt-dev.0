Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F7F6E605
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Nov 2018 17:41:01 +0000 (UTC)
Date: Wed, 21 Nov 2018 19:40:58 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20181121174058.GG1830@ideak-desk.fi.intel.com>
References: <1541244966-27134-1-git-send-email-jyoti.r.yadav@intel.com>
 <1541244966-27134-4-git-send-email-jyoti.r.yadav@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1541244966-27134-4-git-send-email-jyoti.r.yadav@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/5] [intel-gfx] tests/pm_dc: Added
 test for DC6 during PSR
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

T24gU2F0LCBOb3YgMDMsIDIwMTggYXQgMDc6MzY6MDRBTSAtMDQwMCwgSnlvdGkgWWFkYXYgd3Jv
dGU6Cj4gVGhpcyBwYXRjaCBhZGQgc3VidGVzdCB0byBjaGVjayBEQzYgZW50cnkgb24gUFNSIGZv
ciB0aGUgc3VwcG9ydGVkCj4gcGxhdGZvcm1zLgo+IAo+IHYyOiBSZW5hbWUgdGhlIHN1YnRlc3Qg
d2l0aCBtb3JlIG1lYW5pbmdmdWwgbmFtZS4KPiB2MzogUmViYXNlZC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKeW90aSBZYWRhdiA8anlvdGkuci55YWRhdkBpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3Rz
L3BtX2RjLmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvcG1fZGMuYyBiL3Rlc3RzL3BtX2RjLmMKPiBp
bmRleCA2NzFjMGY1Li4zZWNmYjFjIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL3BtX2RjLmMKPiArKysg
Yi90ZXN0cy9wbV9kYy5jCj4gQEAgLTIwMyw2ICsyMDMsMTggQEAgaW50IG1haW4oaW50IGFyZ2Ms
IGNoYXIgKmFyZ3ZbXSkKPiAgCQl0ZXN0X2RjX3N0YXRlX3BzcigmZGF0YSwgQ0hFQ0tfREM1KTsK
PiAgCQljbGVhbnVwKCZkYXRhKTsKPiAgCX0KPiArCj4gKwlpZ3Rfc3VidGVzdCgiZGM2LXBzciIp
IHsKPiArCQlwc3JfZW5hYmxlKGRhdGEuZGVidWdmc19mZCk7Cj4gKwkJaWd0X3JlcXVpcmVfZihl
ZHBfcHNyX3Npbmtfc3VwcG9ydCgmZGF0YSksCj4gKwkJCSAgICAgICJTaW5rIGRvZXMgbm90IHN1
cHBvcnQgUFNSXG4iKTsKPiArCQkvKiBDaGVjayBEQzUgY291bnRlciBpcyBhdmFpbGFibGUgZm9y
IHRoZSBwbGF0Zm9ybS4KICAgICAgICAgICAgICAgICAgICAgICAgIF5EQzYKPiArCQkgKiBTa2lw
IHRoZSB0ZXN0IGlmIGNvdW50ZXIgaXMgbm90IGF2YWlsYWJsZS4KPiArCQkgKi8KPiArCQlyZWFk
X2RjX2NvdW50ZXIoZGF0YS5kcm1fZmQsIENIRUNLX0RDNik7Cj4gKwkJdGVzdF9kY19zdGF0ZV9w
c3IoJmRhdGEsIENIRUNLX0RDNik7Cj4gKwkJY2xlYW51cCgmZGF0YSk7CgpZb3UgYWRkIHRoaXMg
aGVyZSBvbmx5IHRvIHJlbW92ZSBpdCBpbiBhIGxhdGVyIHBhdGNoLgoKPiArCX0KPiAgCWlndF9m
aXh0dXJlIHsKPiAgCQljbG9zZShkYXRhLmRlYnVnZnNfZmQpOwo+ICAJCWRpc3BsYXlfZmluaSgm
ZGF0YSk7Cj4gLS0gCj4gMS45LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
