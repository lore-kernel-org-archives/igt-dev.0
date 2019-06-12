Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204D489487
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2019 10:53:54 +0000 (UTC)
References: <20190607110848.7516-1-simon.ser@intel.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <292745eb-cc76-185f-70ad-32360f6fd792@linux.intel.com>
Date: Wed, 12 Jun 2019 13:53:49 +0300
MIME-Version: 1.0
In-Reply-To: <20190607110848.7516-1-simon.ser@intel.com>
Content-Language: en-PH
Subject: Re: [igt-dev] [PATCH i-g-t] lib/tests/igt_audio: fix
 bad-function-cast warning
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
To: Simon Ser <simon.ser@intel.com>, igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T24gMDcvMDYvMjAxOSAxNDowOCwgU2ltb24gU2VyIHdyb3RlOgo+IENhc3QgYSB2YXJpYWJsZSBp
bnN0ZWFkIG9mIHRoZSByZXR1cm4gdmFsdWUgb2YgdGhlIGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBNYXJ0
aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGxpYi90ZXN0
cy9pZ3RfYXVkaW8uYyB8IDcgKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvdGVzdHMvaWd0X2F1ZGlv
LmMgYi9saWIvdGVzdHMvaWd0X2F1ZGlvLmMKPiBpbmRleCA0N2U2MWFkZjc0ZmUuLmVlZTRkZDUx
ZjA0YyAxMDA2NDQKPiAtLS0gYS9saWIvdGVzdHMvaWd0X2F1ZGlvLmMKPiArKysgYi9saWIvdGVz
dHMvaWd0X2F1ZGlvLmMKPiBAQCAtNjUsMTEgKzY1LDE0IEBAIHN0YXRpYyB2b2lkIHRlc3Rfc2ln
bmFsX2RldGVjdF9ub2lzZShzdHJ1Y3QgYXVkaW9fc2lnbmFsICpzaWduYWwpCj4gIAlkb3VibGUg
YnVmW0JVRkZFUl9MRU5dOwo+ICAJYm9vbCBvazsKPiAgCXNpemVfdCBpOwo+ICsJbG9uZyByOwo+
IAo+ICAJLyogR2VuZXJhdGUgcmFuZG9tIHNhbXBsZXMgYmV0d2VlbiAtMSBhbmQgMSAqLwo+ICAJ
c3JhbmQoNDIpOwo+IC0JZm9yIChpID0gMDsgaSA8IEJVRkZFUl9MRU47IGkrKykKPiAtCQlidWZb
aV0gPSAoZG91YmxlKSByYW5kb20oKSAvIFJBTkRfTUFYICogMiAtIDE7Cj4gKwlmb3IgKGkgPSAw
OyBpIDwgQlVGRkVSX0xFTjsgaSsrKSB7Cj4gKwkJciA9IHJhbmRvbSgpOwo+ICsJCWJ1ZltpXSA9
IChkb3VibGUpIHIgLyBSQU5EX01BWCAqIDIgLSAxOwo+ICsJfQo+IAo+ICAJb2sgPSBhdWRpb19z
aWduYWxfZGV0ZWN0KHNpZ25hbCwgU0FNUExJTkdfUkFURSwgMCwgYnVmLCBCVUZGRVJfTEVOKTsK
PiAKPiAtLQo+IDIuMjEuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
