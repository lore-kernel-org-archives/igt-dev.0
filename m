Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170066E688
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Sep 2018 10:51:57 +0000 (UTC)
Message-ID: <1536231113.20284.18.camel@intel.com>
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu, 06 Sep 2018 13:51:53 +0300
In-Reply-To: <1535548332-8413-1-git-send-email-juhapekka.heikkila@gmail.com>
References: <1535372854-3031-2-git-send-email-juhapekka.heikkila@gmail.com>
 <1535548332-8413-1-git-send-email-juhapekka.heikkila@gmail.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: Fix
 bad-pixel-format not to be run on gen11 and later
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: mika.kahola@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMDE4LTA4LTI5IGF0IDE2OjEyICswMzAwLCBKdWhhLVBla2thIEhlaWtraWxhIHdy
b3RlOgo+IGdlbjExIGVuYWJsZXMgOTAvMjcwIHJvdGF0aW9uIGZvciBSR0I1NjUgbW9kZS4gSUdU
IHdvdWxkIG5lZWQgc3VwcG9ydAo+IGZvcgo+IEM4IG1vZGUgdG8gZW5hYmxlIHJ1bm5pbmcgdGhp
cyBzdWJ0ZXN0IG9uIGdlbjExIGFuZCBsYXRlci4KPiAKPiB2MiAoTWlrYSBLYWhvbGEpOiBDb21i
aW5lIGdlbiBjaGVja3MgaW50byBvbmUgY29tcGFyaXNvbi4gVXBkYXRlCj4gY29tbWVudCBvbiB3
aHkgYmFkLXBpeGVsLWZvcm1hdCBpcyBkaXNhYmxlZCBiZXlvbmQgZ2VuMTEuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNv
bT4KPiAtLS0KPiDCoHRlc3RzL2ttc19yb3RhdGlvbl9jcmMuYyB8IDcgKysrKysrLQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS90ZXN0cy9rbXNfcm90YXRpb25fY3JjLmMgYi90ZXN0cy9rbXNfcm90YXRpb25fY3JjLmMK
PiBpbmRleCBiOTk0Y2M1Li41ZWQwYzBiIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ttc19yb3RhdGlv
bl9jcmMuYwo+ICsrKyBiL3Rlc3RzL2ttc19yb3RhdGlvbl9jcmMuYwo+IEBAIC01NTcsNyArNTU3
LDEyIEBAIGlndF9tYWluCj4gwqAJZGF0YS5wb3NfeSA9IDA7Cj4gwqAKPiDCoAlpZ3Rfc3VidGVz
dF9mKCJiYWQtcGl4ZWwtZm9ybWF0Iikgewo+IC0JCWlndF9yZXF1aXJlKGdlbiA+PSA5KTsKPiAr
CQkvKgo+ICsJCcKgKiBnZW4xMSBlbmFibGVzIFJHQjU2NSByb3RhdGlvbiBmb3IgOTAvMjcwIGRl
Z3JlZXMuCj4gKwkJwqAqIERSTV9GT1JNQVRfQzggZm10IG5lZWQgdG8gYmUgZW5hYmxlZCBmb3Ig
SUdUIGlmCj4gd2FudCB0byBydW4KPiArCQnCoCogdGhpcyB0ZXN0IG9uIGdlbjExIGFuZCBsYXRl
ci4KPiArCQnCoCovCj4gKwkJaWd0X3JlcXVpcmUoZ2VuID49IDkgJiYgZ2VuIDwgMTEpOwo+IMKg
CQlkYXRhLnJvdGF0aW9uID0gSUdUX1JPVEFUSU9OXzkwOwo+IMKgCQlkYXRhLm92ZXJyaWRlX2Zt
dCA9IERSTV9GT1JNQVRfUkdCNTY1Owo+IMKgCQl0ZXN0X3BsYW5lX3JvdGF0aW9uKCZkYXRhLCBE
Uk1fUExBTkVfVFlQRV9QUklNQVJZLAo+IHRydWUpOwpCb3RoIHBhdGNoZXMgbm93IHB1c2hlZCB0
byBJR1QuCgotLSAKTWlrYSBLYWhvbGEgLSBJbnRlbCBPVEMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
