Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D026E075
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Aug 2018 13:12:41 +0000 (UTC)
Message-ID: <1535375432.20284.0.camel@intel.com>
From: Mika Kahola <mika.kahola@intel.com>
Date: Mon, 27 Aug 2018 16:10:32 +0300
In-Reply-To: <1535372854-3031-1-git-send-email-juhapekka.heikkila@gmail.com>
References: <1535372854-3031-1-git-send-email-juhapekka.heikkila@gmail.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_plane_scaling: Allow
 DRM_FORMAT_RGB565 rotation on gen>=11
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
b3RlOgo+IFRlc3QgRFJNX0ZPUk1BVF9SR0I1NjUgcm90YXRpb24gd2hlbiBnZW4gaXMgMTEgb3Ig
aGlnaGVyLgo+IApMb29rcyBvayB0byBtZS4KClJldmlld2VkLWJ5OiBNaWthIEthaG9sYSA8bWlr
YS5rYWhvbGFAaW50ZWwuY29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxh
IDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPgo+IC0tLQo+IMKgdGVzdHMva21zX3BsYW5l
X3NjYWxpbmcuYyB8IDcgKysrKy0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BsYW5lX3NjYWxp
bmcuYyBiL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMKPiBpbmRleCAyZjE5YTQyLi43YzY0ZWQx
IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMKPiArKysgYi90ZXN0cy9r
bXNfcGxhbmVfc2NhbGluZy5jCj4gQEAgLTE1NiwxMCArMTU2LDEwIEBAIHN0YXRpYyBjb25zdCBp
Z3Rfcm90YXRpb25fdCByb3RhdGlvbnNbXSA9IHsKPiDCoAlJR1RfUk9UQVRJT05fMjcwLAo+IMKg
fTsKPiDCoAo+IC1zdGF0aWMgYm9vbCBjYW5fcm90YXRlKHVuc2lnbmVkIGZvcm1hdCkKPiArc3Rh
dGljIGJvb2wgY2FuX3JvdGF0ZShkYXRhX3QgKmQsIHVuc2lnbmVkIGZvcm1hdCkKPiDCoHsKPiDC
oAlpZiAoZm9ybWF0ID09IERSTV9GT1JNQVRfQzggfHwKPiAtCcKgwqDCoMKgZm9ybWF0ID09IERS
TV9GT1JNQVRfUkdCNTY1KQo+ICsJwqDCoMKgwqAoaW50ZWxfZ2VuKGQtPmRldmlkKSA8IDExICYm
IGZvcm1hdCA9PQo+IERSTV9GT1JNQVRfUkdCNTY1KSkKPiDCoAkJcmV0dXJuIGZhbHNlOwo+IMKg
Cj4gwqAJcmV0dXJuIHRydWU7Cj4gQEAgLTE4MCw3ICsxODAsOCBAQCBzdGF0aWMgdm9pZCB0ZXN0
X3NjYWxlcl93aXRoX3JvdGF0aW9uX3BpcGUoZGF0YV90Cj4gKmQsIGVudW0gcGlwZSBwaXBlLAo+
IMKgCQkJaWd0X3JvdGF0aW9uX3Qgcm90ID0gcm90YXRpb25zW2ldOwo+IMKgCQkJZm9yIChpbnQg
aiA9IDA7IGogPCBwbGFuZS0+ZHJtX3BsYW5lLQo+ID5jb3VudF9mb3JtYXRzOyBqKyspIHsKPiDC
oAkJCQl1bnNpZ25lZCBmb3JtYXQgPSBwbGFuZS0+ZHJtX3BsYW5lLQo+ID5mb3JtYXRzW2pdOwo+
IC0JCQkJaWYgKGlndF9mYl9zdXBwb3J0ZWRfZm9ybWF0KGZvcm1hdCkKPiAmJiBjYW5fcm90YXRl
KGZvcm1hdCkpCj4gKwkJCQlpZiAoaWd0X2ZiX3N1cHBvcnRlZF9mb3JtYXQoZm9ybWF0KQo+ICYm
Cj4gKwkJCQnCoMKgwqDCoGNhbl9yb3RhdGUoZCwgZm9ybWF0KSkKPiDCoAkJCQkJY2hlY2tfc2Nh
bGluZ19waXBlX3BsYW5lX3JvdAo+IChkLCBwbGFuZSwgZm9ybWF0LAo+IMKgCQkJCQkJCQnCoMKg
wqDCoAo+IMKgTE9DQUxfSTkxNV9GT1JNQVRfTU9EX1lfVElMRUQsCj4gwqAJCQkJCQkJCcKgwqDC
oMKgCj4gwqBwaXBlLCBvdXRwdXQsIHJvdCk7Ci0tIApNaWthIEthaG9sYSAtIEludGVsIE9UQwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
