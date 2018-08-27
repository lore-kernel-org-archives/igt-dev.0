Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5626E271
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Aug 2018 16:33:54 +0000 (UTC)
Date: Mon, 27 Aug 2018 09:33:54 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20180827163354.GL6432@intel.com>
References: <1535372854-3031-1-git-send-email-juhapekka.heikkila@gmail.com>
 <1535372854-3031-2-git-send-email-juhapekka.heikkila@gmail.com>
 <1535375645.20284.2.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1535375645.20284.2.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_rotation_crc: Fix
 bad-pixel-format not to be run on gen11 and later
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMDQ6MTQ6MDVQTSArMDMwMCwgTWlrYSBLYWhvbGEgd3Jv
dGU6Cj4gT24gTW9uLCAyMDE4LTA4LTI3IGF0IDE1OjI3ICswMzAwLCBKdWhhLVBla2thIEhlaWtr
aWxhIHdyb3RlOgo+ID4gZ2VuMTEgZW5hYmxlcyA5MC8yNzAgcm90YXRpb24gZm9yIFJHQjU2NSBt
b2RlLiBJR1Qgd291bGQgbmVlZCBzdXBwb3J0Cj4gPiBmb3IKPiA+IEM4IG1vZGUgdG8gZW5hYmxl
IHJ1bm5pbmcgdGhpcyBzdWJ0ZXN0IG9uIGdlbjExIGFuZCBsYXRlci4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNv
bT4KPiA+IC0tLQo+ID4gwqB0ZXN0cy9rbXNfcm90YXRpb25fY3JjLmMgfCA2ICsrKysrKwo+ID4g
wqAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS90
ZXN0cy9rbXNfcm90YXRpb25fY3JjLmMgYi90ZXN0cy9rbXNfcm90YXRpb25fY3JjLmMKPiA+IGlu
ZGV4IGI5OTRjYzUuLjM1ZTY3MjEgMTAwNjQ0Cj4gPiAtLS0gYS90ZXN0cy9rbXNfcm90YXRpb25f
Y3JjLmMKPiA+ICsrKyBiL3Rlc3RzL2ttc19yb3RhdGlvbl9jcmMuYwo+ID4gQEAgLTU1OCw2ICs1
NTgsMTIgQEAgaWd0X21haW4KPiA+IMKgCj4gPiDCoAlpZ3Rfc3VidGVzdF9mKCJiYWQtcGl4ZWwt
Zm9ybWF0Iikgewo+ID4gwqAJCWlndF9yZXF1aXJlKGdlbiA+PSA5KTsKPiA+ICsJCS8qCj4gPiAr
CQnCoCogZ2VuMTEgZW5hYmxlcyBSR0I1NjUgcm90YXRpb24gZm9yIDkwLzI3MCBkZWdyZWVzLgo+
ID4gKwkJwqAqIEM4IG1vZGUgbmVlZCB0byBiZSBlbmFibGVkIGZvciBJR1QgaWYgd2FudCB0byBy
dW4KPiA+IHRoaXMgdGVzdAo+ID4gKwkJwqAqIG9uIGdlbjExIG9ud2FyZHMuCj4gPiArCQnCoCov
Cj4gPiArCQlpZ3RfcmVxdWlyZShnZW4gPCAxMSk7Cj4gQ291bGQgd2UgY29tYmluZSB0aGVzZSB0
d28gcmVxdWlyZW1lbnRzPyBDb21tZW50IG1pZ2h0IG5lZWQgdG8gYmUKPiByZXBocmFzZWQgYSBi
aXQgdG9vLgoKYWxzbywgaXNuJ3QgYW55IG90aGVyIHdheSB0byBjaGVjayB0aGUgY2FwYWJpbGl0
eSBpbnN0ZWFkIG9mIHNwcmVhZGluZwpnZW4gY2hlY2tzPwoKPiAKPiA+IMKgCQlkYXRhLnJvdGF0
aW9uID0gSUdUX1JPVEFUSU9OXzkwOwo+ID4gwqAJCWRhdGEub3ZlcnJpZGVfZm10ID0gRFJNX0ZP
Uk1BVF9SR0I1NjU7Cj4gPiDCoAkJdGVzdF9wbGFuZV9yb3RhdGlvbigmZGF0YSwgRFJNX1BMQU5F
X1RZUEVfUFJJTUFSWSwKPiA+IHRydWUpOwo+IC0tIAo+IE1pa2EgS2Fob2xhIC0gSW50ZWwgT1RD
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBp
Z3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
