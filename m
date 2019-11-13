Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E657B6ECA9
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2019 08:50:25 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Wed, 13 Nov 2019 08:50:23 +0000
Message-ID: <9cec20e3f72de86d28ab622cd1520ec512b40d75.camel@intel.com>
References: <1573223082-29928-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1573223082-29928-1-git-send-email-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Content-ID: <627C8CF00B48F34D84E69B943989CDB8@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor: use safe values for
 test image to avoid rounding errors
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
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTExLTA4IGF0IDE2OjI0ICswMjAwLCBKdWhhLVBla2thIEhlaWtraWxhIHdy
b3RlOgo+IGluc3RlYWQgb2YgMC41IHVzZSAxLjAgZm9yIHdoaXRlIGNvbG9yLCB0aGlzIGlzIGR1
ZSB0byBiaXQKPiByZXBsaWNhdGlvbgo+IGVmZmVjdC4gQWxzbyBzZXQgY2Fpcm8gdG8gdXNlIHNh
bWUgYmxlbmRpbmcgbW9kZSBhcyB3aGF0IEhXIHVzZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVo
YS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KClJldmlld2Vk
LWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPgoKPiAtLS0KPiAgdGVzdHMv
a21zX2N1cnNvcl9jcmMuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2N1cnNvcl9jcmMu
YyBiL3Rlc3RzL2ttc19jdXJzb3JfY3JjLmMKPiBpbmRleCBkMGZiOGYxLi4wMTI1MTIyIDEwMDY0
NAo+IC0tLSBhL3Rlc3RzL2ttc19jdXJzb3JfY3JjLmMKPiArKysgYi90ZXN0cy9rbXNfY3Vyc29y
X2NyYy5jCj4gQEAgLTc4LDEyICs3OCwxMyBAQCBzdGF0aWMgdm9pZCBkcmF3X2N1cnNvcihjYWly
b190ICpjciwgaW50IHgsIGludAo+IHksIGludCBjdywgaW50IGNoLCBkb3VibGUgYSkKPiAgCS8q
IENhaXJvIGRvZXNuJ3QgbGlrZSB0byBiZSBmZWQgbnVtYmVycyB0aGF0IGFyZSB0b28gd2lsZCAq
Lwo+ICAJaWYgKCh4IDwgU0hSVF9NSU4pIHx8ICh4ID4gU0hSVF9NQVgpIHx8ICh5IDwgU0hSVF9N
SU4pIHx8ICh5ID4KPiBTSFJUX01BWCkpCj4gIAkJcmV0dXJuOwo+ICsJY2Fpcm9fc2V0X29wZXJh
dG9yKGNyLCBDQUlST19PUEVSQVRPUl9TT1VSQ0UpOwo+ICAJY2Fpcm9fc2V0X2FudGlhbGlhcyhj
ciwgQ0FJUk9fQU5USUFMSUFTX05PTkUpOwo+ICAJLyogNCBjb2xvciByZWN0YW5nbGVzIGluIHRo
ZSBjb3JuZXJzLCBSR0JZICovCj4gIAlpZ3RfcGFpbnRfY29sb3JfYWxwaGEoY3IsIHgsICAgICAg
eSwgICAgICB3bCwgaHQsIDEuMCwgMC4wLAo+IDAuMCwgYSk7Cj4gIAlpZ3RfcGFpbnRfY29sb3Jf
YWxwaGEoY3IsIHggKyB3bCwgeSwgICAgICB3ciwgaHQsIDAuMCwgMS4wLAo+IDAuMCwgYSk7Cj4g
IAlpZ3RfcGFpbnRfY29sb3JfYWxwaGEoY3IsIHgsICAgICAgeSArIGh0LCB3bCwgaGIsIDAuMCwg
MC4wLAo+IDEuMCwgYSk7Cj4gLQlpZ3RfcGFpbnRfY29sb3JfYWxwaGEoY3IsIHggKyB3bCwgeSAr
IGh0LCB3ciwgaGIsIDAuNSwgMC41LAo+IDAuNSwgYSk7Cj4gKwlpZ3RfcGFpbnRfY29sb3JfYWxw
aGEoY3IsIHggKyB3bCwgeSArIGh0LCB3ciwgaGIsIDEuMCwgMS4wLAo+IDEuMCwgYSk7Cj4gIH0K
PiAgCj4gIHN0YXRpYyB2b2lkIGN1cnNvcl9lbmFibGUoZGF0YV90ICpkYXRhKQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
