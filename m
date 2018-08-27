Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DD8892BD
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Aug 2018 13:14:07 +0000 (UTC)
Message-ID: <1535375645.20284.2.camel@intel.com>
From: Mika Kahola <mika.kahola@intel.com>
Date: Mon, 27 Aug 2018 16:14:05 +0300
In-Reply-To: <1535372854-3031-2-git-send-email-juhapekka.heikkila@gmail.com>
References: <1535372854-3031-1-git-send-email-juhapekka.heikkila@gmail.com>
 <1535372854-3031-2-git-send-email-juhapekka.heikkila@gmail.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_rotation_crc: Fix
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

T24gTW9uLCAyMDE4LTA4LTI3IGF0IDE1OjI3ICswMzAwLCBKdWhhLVBla2thIEhlaWtraWxhIHdy
b3RlOgo+IGdlbjExIGVuYWJsZXMgOTAvMjcwIHJvdGF0aW9uIGZvciBSR0I1NjUgbW9kZS4gSUdU
IHdvdWxkIG5lZWQgc3VwcG9ydAo+IGZvcgo+IEM4IG1vZGUgdG8gZW5hYmxlIHJ1bm5pbmcgdGhp
cyBzdWJ0ZXN0IG9uIGdlbjExIGFuZCBsYXRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWhhLVBl
a2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPgo+IC0tLQo+IMKgdGVz
dHMva21zX3JvdGF0aW9uX2NyYy5jIHwgNiArKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3JvdGF0aW9uX2NyYy5jIGIv
dGVzdHMva21zX3JvdGF0aW9uX2NyYy5jCj4gaW5kZXggYjk5NGNjNS4uMzVlNjcyMSAxMDA2NDQK
PiAtLS0gYS90ZXN0cy9rbXNfcm90YXRpb25fY3JjLmMKPiArKysgYi90ZXN0cy9rbXNfcm90YXRp
b25fY3JjLmMKPiBAQCAtNTU4LDYgKzU1OCwxMiBAQCBpZ3RfbWFpbgo+IMKgCj4gwqAJaWd0X3N1
YnRlc3RfZigiYmFkLXBpeGVsLWZvcm1hdCIpIHsKPiDCoAkJaWd0X3JlcXVpcmUoZ2VuID49IDkp
Owo+ICsJCS8qCj4gKwkJwqAqIGdlbjExIGVuYWJsZXMgUkdCNTY1IHJvdGF0aW9uIGZvciA5MC8y
NzAgZGVncmVlcy4KPiArCQnCoCogQzggbW9kZSBuZWVkIHRvIGJlIGVuYWJsZWQgZm9yIElHVCBp
ZiB3YW50IHRvIHJ1bgo+IHRoaXMgdGVzdAo+ICsJCcKgKiBvbiBnZW4xMSBvbndhcmRzLgo+ICsJ
CcKgKi8KPiArCQlpZ3RfcmVxdWlyZShnZW4gPCAxMSk7CkNvdWxkIHdlIGNvbWJpbmUgdGhlc2Ug
dHdvIHJlcXVpcmVtZW50cz8gQ29tbWVudCBtaWdodCBuZWVkIHRvIGJlCnJlcGhyYXNlZCBhIGJp
dCB0b28uCgo+IMKgCQlkYXRhLnJvdGF0aW9uID0gSUdUX1JPVEFUSU9OXzkwOwo+IMKgCQlkYXRh
Lm92ZXJyaWRlX2ZtdCA9IERSTV9GT1JNQVRfUkdCNTY1Owo+IMKgCQl0ZXN0X3BsYW5lX3JvdGF0
aW9uKCZkYXRhLCBEUk1fUExBTkVfVFlQRV9QUklNQVJZLAo+IHRydWUpOwotLSAKTWlrYSBLYWhv
bGEgLSBJbnRlbCBPVEMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
