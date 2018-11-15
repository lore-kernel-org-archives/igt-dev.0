Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0106E5E6
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Nov 2018 20:39:30 +0000 (UTC)
Date: Thu, 15 Nov 2018 22:39:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20181115203927.GA9144@intel.com>
References: <20181115185737.19311-1-eric@anholt.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181115185737.19311-1-eric@anholt.net>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/6] kms_content_protection: Fix log
 bug on 32-bit platforms.
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
To: Eric Anholt <eric@anholt.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTUsIDIwMTggYXQgMTA6NTc6MzJBTSAtMDgwMCwgRXJpYyBBbmhvbHQgd3Jv
dGU6Cj4gbG9uZyBpcyBkaWZmZXJlbnQgYmV0d2VlbiAzMiBhbmQgNjQgYW5kIHNob3VsZCBiYXNp
Y2FsbHkgbmV2ZXIgYmUKPiB1c2VkLiAgRml4ZXMgY29tcGlsZXIgd2FybmluZyBhYm91dCBwYXNz
aW5nIHRoZSB3cm9uZyB0eXBlLgo+IAo+IHYyOiBVc2UgdGhlIFBSSWQ2NCBtYWNyb3MgaW5zdGVh
ZCBvZiBsb25nIGxvbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogRXJpYyBBbmhvbHQgPGVyaWNAYW5o
b2x0Lm5ldD4KClJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgoKPiAtLS0KPiAgdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jIHwg
MyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMgYi90ZXN0cy9r
bXNfY29udGVudF9wcm90ZWN0aW9uLmMKPiBpbmRleCA4MDFlZmY2NmMyNzIuLmVmOTBlZDRjMTc5
MiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMKPiArKysgYi90
ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMKPiBAQCAtODksNyArODksOCBAQCB3YWl0X2Zv
cl9wcm9wX3ZhbHVlKGlndF9vdXRwdXRfdCAqb3V0cHV0LCB1aW50NjRfdCBleHBlY3RlZCwKPiAg
CQkJcmV0dXJuIHRydWU7Cj4gIAkJdXNsZWVwKDEwMDApOwo+ICAJfQo+IC0JaWd0X2luZm8oInBy
b3BfdmFsdWUgbWlzbWF0Y2ggJWxkICE9ICVsZFxuIiwgdmFsLCBleHBlY3RlZCk7Cj4gKwlpZ3Rf
aW5mbygicHJvcF92YWx1ZSBtaXNtYXRjaCAlIiBQUklkNjQgIiAhPSAlIiBQUklkNjQgIlxuIiwK
PiArCQkgdmFsLCBleHBlY3RlZCk7Cj4gIAo+ICAJcmV0dXJuIGZhbHNlOwo+ICB9Cj4gLS0gCj4g
Mi4xOS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
CgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
