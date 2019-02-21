Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8176B89320
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 21:51:14 +0000 (UTC)
References: <20190221192745.31178-1-antonio.argenziano@intel.com>
 <20190221192745.31178-2-antonio.argenziano@intel.com>
 <155077838923.4937.5133375546234436543@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <21c2072d-f92d-d32f-9fa2-f07152d1213e@intel.com>
Date: Thu, 21 Feb 2019 13:51:14 -0800
MIME-Version: 1.0
In-Reply-To: <155077838923.4937.5133375546234436543@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [RFC 1/5] tests/prime_self_import: Swap gtt mapping
 for cpu
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMS8wMi8xOSAxMTo0NiwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAyLTIxIDE5OjI3OjQxKQo+PiBUaGUgdGVzdCB1c2VzIGd0dCBt
YXBwaW5nIHRvIGNoZWNrIHR3byBCT3MgaGF2ZSB0aGUgc2FtZSBjb250ZW50LCBzaW5jZQo+PiBp
dCBzZWVtcyB0aGVyZSBpcyBubyBjb250ZW50aW9uIG9uIHRoZSBCT3MgdXNlIGNwdSBtYXBwaW5n
IHRvIG1ha2UgaXQKPj4gY29tcGF0aWJsZSB3aXRoIHBsYXRmb3JtcyB0aGF0IGRvIG5vdCBoYXZl
IGEgbWFwcGFibGUgYXBlcnR1cmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQXJnZW56
aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNvbT4KPj4gLS0tCj4+ICAgdGVzdHMvcHJp
bWVfc2VsZl9pbXBvcnQuYyB8IDQgKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS90ZXN0cy9wcmltZV9zZWxm
X2ltcG9ydC5jIGIvdGVzdHMvcHJpbWVfc2VsZl9pbXBvcnQuYwo+PiBpbmRleCA4YzRmNTMyMS4u
OTA1ZmZmZmIgMTAwNjQ0Cj4+IC0tLSBhL3Rlc3RzL3ByaW1lX3NlbGZfaW1wb3J0LmMKPj4gKysr
IGIvdGVzdHMvcHJpbWVfc2VsZl9pbXBvcnQuYwo+PiBAQCAtNTksOCArNTksOCBAQCBjaGVja19i
byhpbnQgZmQxLCB1aW50MzJfdCBoYW5kbGUxLCBpbnQgZmQyLCB1aW50MzJfdCBoYW5kbGUyKQo+
PiAgICAgICAgICBjaGFyICpwdHIxLCAqcHRyMjsKPj4gICAgICAgICAgaW50IGk7Cj4+ICAgCj4+
IC0gICAgICAgcHRyMSA9IGdlbV9tbWFwX19ndHQoZmQxLCBoYW5kbGUxLCBCT19TSVpFLCBQUk9U
X1JFQUQgfCBQUk9UX1dSSVRFKTsKPj4gLSAgICAgICBwdHIyID0gZ2VtX21tYXBfX2d0dChmZDIs
IGhhbmRsZTIsIEJPX1NJWkUsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUpOwo+PiArICAgICAgIHB0
cjEgPSBnZW1fbW1hcF9fY3B1KGZkMSwgaGFuZGxlMSwgMCwgQk9fU0laRSwgUFJPVF9SRUFEIHwg
UFJPVF9XUklURSk7Cj4+ICsgICAgICAgcHRyMiA9IGdlbV9tbWFwX19jcHUoZmQyLCBoYW5kbGUy
LCAwLCBCT19TSVpFLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFKTsKPiAKPiBzZXRfZG9tYWluKCkg
d291bGQgYmUgcmVxdWlyZWQgZm9yIHBlZGFnb2d5LCBtbWFwX19ndHQgaXMgbWFnaWMuCgpXaHkg
ZG8gd2UgbmVlZCB0aGUgc2V0X2RvbWFpbiBoZXJlPyBJdCBsb29rcyBsaWtlIHdlIGFyZSBub3Qg
d3JpdGluZyB0byAKdGhvc2UgQk9zLgoKQW50b25pbwoKPiAtQ2hyaXMKPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
