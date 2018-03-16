Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09EC6EBA5
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Mar 2018 16:26:26 +0000 (UTC)
References: <20180316161657.21398-1-maarten.lankhorst@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ba22ddea-e33c-9e1d-9794-c8c1cae17b79@linux.intel.com>
Date: Fri, 16 Mar 2018 17:26:24 +0100
MIME-Version: 1.0
In-Reply-To: <20180316161657.21398-1-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] kms_frontbuffer_tracking: Fix PSR
 reporting after PSR active flag is removed.
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTYtMDMtMTggb20gMTc6MTYgc2NocmVlZiBNYWFydGVuIExhbmtob3JzdDoKPiBFaXRoZXIg
dGhlIG1haW4gbGluayBpbiBzdGFuZGJ5IG1vZGUgb3IgaHcgZW5hYmxlZCBpcyBlbm91Z2ggdG8K
PiBzYXkgdGhhdCBQU1IgaXMgYWN0aXZhdGVkLCBzbyBqdXN0IHVzZSBib3RoLgo+Cj4gQnVnemls
bGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwNTUxOQo+
IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51
eC5pbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyBiL3Rlc3RzL2tt
c19mcm9udGJ1ZmZlcl90cmFja2luZy5jCj4gaW5kZXggNDU0MTAzZDM2N2M3Li5lNGRhNzA2YjA2
MzEgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKPiArKysg
Yi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwo+IEBAIC03ODEsNyArNzgxLDcgQEAg
c3RhdGljIGJvb2wgcHNyX2lzX2VuYWJsZWQodm9pZCkKPiAgCWNoYXIgYnVmWzI1Nl07Cj4gIAo+
ICAJZGVidWdmc19yZWFkKCJpOTE1X2VkcF9wc3Jfc3RhdHVzIiwgYnVmKTsKPiAtCXJldHVybiBz
dHJzdHIoYnVmLCAiXG5BY3RpdmU6IHllc1xuIikgJiYKPiArCXJldHVybiBzdHJzdHIoYnVmLCAi
XG5NYWluIGxpbmsgaW4gc3RhbmRieSBtb2RlOiB5ZXNcbiIpIHx8Cj4gIAkgICAgICAgc3Ryc3Ry
KGJ1ZiwgIlxuSFcgRW5hYmxlZCAmIEFjdGl2ZSBiaXQ6IHllc1xuIik7Cj4gIH0KPiAgCgpObSwg
b3RoZXIgcGF0Y2ggaXMgYmV0dGVyLCBjYXJyeSBvbi4gOikKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
