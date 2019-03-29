Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D19F6E8A3
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2019 10:40:17 +0000 (UTC)
Date: Fri, 29 Mar 2019 12:40:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190329104010.GT3888@intel.com>
References: <20190329103526.12364-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190329103526.12364-1-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kms: Clear pipe color
 management properties on reset.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBNYXIgMjksIDIwMTkgYXQgMTE6MzU6MjVBTSArMDEwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gSnVzdCBsaWtlIHdlIHRyeSB0byBzYW5pdGl6ZSBhbGwgcHJvcGVydGllcyBp
biBpZ3RfcGxhbmVfcmVzZXQsIHdlCj4gc2hvdWxkIGRvIHRoZSBzYW1lIGZvciBwaXBlIHByb3Bl
cnRpZXMuIExvYWRpbmcgYSB3cm9uZyBsdXQgY291bGQKPiBhZmZlY3QgcGFzc2luZyBhbmQgZmFp
bGluZyB0ZXN0cywgc28gd2UgbmVlZCB0byBiZSBjYXJlZnVsIGFuZCBzZXQKPiBzYW5lIGRlZmF1
bHRzIGZvciBldmVyeXRoaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCj4gLS0tCj4gIGxpYi9p
Z3Rfa21zLmMgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9saWIvaWd0X2ttcy5jCj4gaW5kZXgg
NDNmNDU5OTcwNzNjLi4wNWNiOWJkMjIwOTAgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9rbXMuYwo+
ICsrKyBiL2xpYi9pZ3Rfa21zLmMKPiBAQCAtMTgwNCw2ICsxODA0LDE1IEBAIHN0YXRpYyB2b2lk
IGlndF9waXBlX3Jlc2V0KGlndF9waXBlX3QgKnBpcGUpCj4gIAlpZ3RfcGlwZV9vYmpfc2V0X3By
b3BfdmFsdWUocGlwZSwgSUdUX0NSVENfQUNUSVZFLCAwKTsKPiAgCWlndF9waXBlX29ial9jbGVh
cl9wcm9wX2NoYW5nZWQocGlwZSwgSUdUX0NSVENfT1VUX0ZFTkNFX1BUUik7Cj4gIAo+ICsJaWYg
KGlndF9waXBlX29ial9oYXNfcHJvcChwaXBlLCBJR1RfQ1JUQ19DVE0pKQo+ICsJCWlndF9waXBl
X29ial9zZXRfcHJvcF92YWx1ZShwaXBlLCBJR1RfQ1JUQ19DVE0sIDApOwo+ICsKPiArCWlmIChp
Z3RfcGlwZV9vYmpfaGFzX3Byb3AocGlwZSwgSUdUX0NSVENfR0FNTUFfTFVUKSkKPiArCQlpZ3Rf
cGlwZV9vYmpfc2V0X3Byb3BfdmFsdWUocGlwZSwgSUdUX0NSVENfR0FNTUFfTFVULCAwKTsKPiAr
Cj4gKwlpZiAoaWd0X3BpcGVfb2JqX2hhc19wcm9wKHBpcGUsIElHVF9DUlRDX0RFR0FNTUFfTFVU
KSkKPiArCQlpZ3RfcGlwZV9vYmpfc2V0X3Byb3BfdmFsdWUocGlwZSwgSUdUX0NSVENfREVHQU1N
QV9MVVQsIDApOwo+ICsKPiAgCXBpcGUtPm91dF9mZW5jZV9mZCA9IC0xOwo+ICB9Cj4gIAo+IC0t
IAo+IDIuMjAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
