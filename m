Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BE76E8FB
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Mar 2018 11:38:20 +0000 (UTC)
References: <1521608769-25758-1-git-send-email-vidya.srinivas@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <585d9e6a-dce9-fbbd-e84c-4aff86efe9ef@linux.intel.com>
Date: Wed, 21 Mar 2018 12:38:17 +0100
MIME-Version: 1.0
In-Reply-To: <1521608769-25758-1-git-send-email-vidya.srinivas@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] [i-g-t] tests/kms_plane_scaling: modify
 fb height for yuv planar
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
To: Vidya Srinivas <vidya.srinivas@intel.com>, igt-dev@lists.freedesktop.org
Cc: sunil.kamath@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjEtMDMtMTggb20gMDY6MDYgc2NocmVlZiBWaWR5YSBTcmluaXZhczoKPiBmYiBzcmMgaGVp
Z2h0IHRvIGJlIG1vcmUgdGhhbiBtaW5pbXVtIHNjYW5saW5lcyBmb3IgcGxhbmFyCj4gZm9ybWF0
cyBsaWtlIE5WMTIuIENoYW5naW5nIHRoZSBmYiBoZWlnaHQgdG8gMTkKPiBzbyB0aGF0IHRoZSBo
ZWlnaHQgaXMgbW9yZSB0aGFuIG1pbiB2YWx1ZSBhZnRlciBLTUQgYWRqdXN0bWVudHMKPgo+IENy
ZWRpdHMtdG86IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBWaWR5YSBTcmluaXZhcyA8dmlkeWEuc3Jpbml2YXNAaW50ZWwu
Y29tPgo+IC0tLQo+ICB0ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIHwgNiArKysrLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcu
Ywo+IGluZGV4IDM2ZmNmYzAuLjAyN2I0MmUgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21zX3BsYW5l
X3NjYWxpbmcuYwo+ICsrKyBiL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMKPiBAQCAtMTMwLDkg
KzEzMCwxMSBAQCBzdGF0aWMgdm9pZCBjaGVja19zY2FsaW5nX3BpcGVfcGxhbmVfcm90KGRhdGFf
dCAqZCwgaWd0X3BsYW5lX3QgKnBsYW5lLAo+ICAJbW9kZSA9IGlndF9vdXRwdXRfZ2V0X21vZGUo
b3V0cHV0KTsKPiAgCj4gIAkvKiBjcmVhdGUgYnVmZmVyIGluIHRoZSByYW5nZSBvZiAgbWluIGFu
ZCBtYXggc291cmNlIHNpZGUgbGltaXQuKi8KPiAtCXdpZHRoID0gaGVpZ2h0ID0gOTsKPiAgCWlm
IChwaXhlbF9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9OVjEyKQo+IC0JCXdpZHRoID0gaGVpZ2h0ID0g
MTc7Cj4gKwkJd2lkdGggPSBoZWlnaHQgPSAxOTsKPiArCWVsc2UKPiArCQl3aWR0aCA9IGhlaWdo
dCA9IDk7Cj4gKwo+ICAJaWd0X2NyZWF0ZV9jb2xvcl9mYihkaXNwbGF5LT5kcm1fZmQsIHdpZHRo
LCBoZWlnaHQsCj4gIAkJICAgICAgIHBpeGVsX2Zvcm1hdCwgdGlsaW5nLCAwLjAsIDEuMCwgMC4w
LCAmZC0+ZmJbMF0pOwo+ICAJaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgJmQtPmZiWzBdKTsKCkJ1
dCBpbiBhbGwgc2VyaW91c25lc3MsIGlmIHdlIGNyZWF0ZSB1bmRlcnJ1bnMgc2hvdWxkIHdlIHNp
bXBseSByZWZ1c2UgdG8gc2hvdyBOVjEyIHdpdGggLUVJTlZBTCBpZiBpdCdzIG5vdCBjb3JyZWN0
bHkgYWxpZ25lZD8KCkkgY2FuIHVuZGVyc3RhbmQgdGhhdCB3ZSBkb24ndCBkbyBpdCBmb3IgbGVn
YWN5IGZvcm1hdHMsIGJ1dCBkb24ndCBzZWUgd2h5IHdlIGNhbid0IGRvIGl0IGZvciBOVjEyLiBF
c3BlY2lhbGx5IHNpbmNlIGl0J3MgYSBjb3JuZXIgY2FzZSB0aGF0Cgpjb3VsZCBiZSB1bmRlcnN0
YW5kYWJsZSBpZiB5b3Uga25vdyB0aGUgaHcgZm9ybWF0IGFzIHdlbGwuCgp+TWFhcnRlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
