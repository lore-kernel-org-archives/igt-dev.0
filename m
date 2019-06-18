Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E186E161
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2019 13:01:40 +0000 (UTC)
From: "Peres, Martin" <martin.peres@intel.com>
Date: Tue, 18 Jun 2019 13:01:37 +0000
Message-ID: <56A4AB1F0E1B5D4C83D27F43C50F662E58FDD2AC@IRSMSX107.ger.corp.intel.com>
References: <20190618125543.646-1-simon.ser@intel.com>
 <20190618125543.646-2-simon.ser@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_chamelium: fix read from
 uninitialized value in flatline audio test
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
To: "Ser, Simon" <simon.ser@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gMTgvMDYvMjAxOSAxNTo1NSwgU2VyLCBTaW1vbiB3cm90ZToKPiBzdHJlYWsgaXNuJ3QgaW5p
dGlhbGl6ZWQsIHdoaWNoIG1ha2VzIHRoZSB0ZXN0IGZhaWwgaW4gdGhlIGNhc2UgaW4gd2hpY2gg
aXQncwo+IG5vdCB6ZXJvIGJ5IGNoYW5jZS4gVGhpcyBidWcgaGFzIGJlZW4gc2VlbiBpbiBwcm9k
dWN0aW9u4oSiLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVs
LmNvbT4KClJldmlld2VkLWJ5OiBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRl
bC5jb20+Cgo+IC0tLQo+ICB0ZXN0cy9rbXNfY2hhbWVsaXVtLmMgfCAxICsKPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jaGFtZWxp
dW0uYyBiL3Rlc3RzL2ttc19jaGFtZWxpdW0uYwo+IGluZGV4IDk0NDM4ZTlhZTBmYy4uMzc4MDI0
ZDhmZDA1IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ttc19jaGFtZWxpdW0uYwo+ICsrKyBiL3Rlc3Rz
L2ttc19jaGFtZWxpdW0uYwo+IEBAIC0xMjM3LDYgKzEyMzcsNyBAQCBzdGF0aWMgYm9vbCB0ZXN0
X2F1ZGlvX2ZsYXRsaW5lKHN0cnVjdCBhdWRpb19zdGF0ZSAqc3RhdGUpCj4gIAlyZWN2ID0gTlVM
TDsKPiAgCXJlY3ZfbGVuID0gMDsKPiAgCWFtcF9zdWNjZXNzID0gZmFsc2U7Cj4gKwlzdHJlYWsg
PSAwOwo+ICAJd2hpbGUgKCFhbXBfc3VjY2VzcyAmJiBzdGF0ZS0+bXNlYyA8IEFVRElPX1RJTUVP
VVQpIHsKPiAgCQlhdWRpb19zdGF0ZV9yZWNlaXZlKHN0YXRlLCAmcmVjdiwgJnJlY3ZfbGVuKTsK
PiAgCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
