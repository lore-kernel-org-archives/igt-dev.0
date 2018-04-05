Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu,  5 Apr 2018 19:47:56 +0100
Message-Id: <20180405184757.15907-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH igt 1/2] lib: Acquire master for pollable
 spinbatch on gen4/5
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Z2VuNC81IHJlcXVpcmUgYSBEUk1fTUFTVEVSIHRvIHVzZSBNSV9TVE9SRV9EVywgbWFrZSBpdCBz
by4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVr
PgpDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KLS0tCiBsaWIv
aWd0X2R1bW15bG9hZC5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZHVtbXlsb2FkLmMgYi9saWIv
aWd0X2R1bW15bG9hZC5jCmluZGV4IDk4YWI3YWMyLi5iYTkxN2JhNSAxMDA2NDQKLS0tIGEvbGli
L2lndF9kdW1teWxvYWQuYworKysgYi9saWIvaWd0X2R1bW15bG9hZC5jCkBAIC0zMSw2ICszMSw3
IEBACiAKICNpbmNsdWRlICJpZ3RfY29yZS5oIgogI2luY2x1ZGUgImRybXRlc3QuaCIKKyNpbmNs
dWRlICJpZ3RfZGV2aWNlLmgiCiAjaW5jbHVkZSAiaWd0X2R1bW15bG9hZC5oIgogI2luY2x1ZGUg
ImlndF9ndC5oIgogI2luY2x1ZGUgImludGVsX2NoaXBzZXQuaCIKQEAgLTE0NCw4ICsxNDUsMTAg
QEAgZW1pdF9yZWN1cnNpdmVfYmF0Y2goaWd0X3NwaW5fdCAqc3BpbiwgaW50IGZkLCB1aW50MzJf
dCBjdHgsIHVuc2lnbmVkIGVuZ2luZSwKIAogCQlpZ3RfYXNzZXJ0KCFkZXApOwogCi0JCWlmIChn
ZW4gPT0gNCB8fCBnZW4gPT0gNSkKKwkJaWYgKGdlbiA9PSA0IHx8IGdlbiA9PSA1KSB7CiAJCQll
eGVjYnVmLT5mbGFncyB8PSBJOTE1X0VYRUNfU0VDVVJFOworCQkJaWd0X3JlcXVpcmUoX19pZ3Rf
ZGV2aWNlX3NldF9tYXN0ZXIoZmQpID09IDApOworCQl9CiAKIAkJc3Bpbi0+cG9sbF9oYW5kbGUg
PSBnZW1fY3JlYXRlKGZkLCA0MDk2KTsKIAotLSAKMi4xNi4zCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
