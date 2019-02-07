Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207806E98E
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Feb 2019 14:02:16 +0000 (UTC)
Date: Thu, 7 Feb 2019 16:02:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190207140212.GH20097@intel.com>
References: <20190207133652.5346-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190207133652.5346-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Fix comparison of
 unsigned integers
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBGZWIgMDcsIDIwMTkgYXQgMDM6MzY6NTJQTSArMDIwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBEaWZmZXJlbmNlIG9mIHVuc2lnbmVkIGludHMgaXMgdW5zaWduZWQgaW50LCBhbmQg
dGhlcmVmb3JlIGFsd2F5cwo+IGxhcmdlciB0aGFuIHplcm8uCj4gCj4gU2lnbmVkLW9mZi1ieTog
UGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gLS0tCj4gIHRlc3RzL2ttc19mbGlwLmMgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZmxpcC5jIGIvdGVzdHMva21zX2ZsaXAuYwo+IGluZGV4
IDc5OGZjNGU4Li45NmY0YTJmNyAxMDA3NTUKPiAtLS0gYS90ZXN0cy9rbXNfZmxpcC5jCj4gKysr
IGIvdGVzdHMva21zX2ZsaXAuYwo+IEBAIC01MDIsNyArNTAyLDcgQEAgc3RhdGljIHZvaWQgY2hl
Y2tfc3RhdGUoY29uc3Qgc3RydWN0IHRlc3Rfb3V0cHV0ICpvLCBjb25zdCBzdHJ1Y3QgZXZlbnRf
c3RhdGUgKmUKPiAgCWlmIChvLT5mbGFncyAmIFRFU1RfVFNfQ09OVCkgewo+ICAJCS8qIElnbm9y
ZSBzZXFfc3RlcCBoZXJlIHNpbmNlIHZibGFuayB3YWl0cyB0aW1lIG91dCBpbW1lZGlhdGVseQo+
ICAJCSAqIHdoZW4gd2Uga2lsbCB0aGUgY3J0Yy4gKi8KPiAtCQlpZ3RfYXNzZXJ0X2YoZXMtPmN1
cnJlbnRfc2VxIC0gZXMtPmxhc3Rfc2VxID49IDAsCj4gKwkJaWd0X2Fzc2VydF9mKGVzLT5jdXJy
ZW50X3NlcSA+PSBlcy0+bGFzdF9zZXEsCgpUaGF0IHdvbid0IGhhbmRsZSB3cmFwYXJvdW5kLiBJ
IGd1ZXNzIEkgc2hvdWxkIGFjdHVhbGx5IHB1c2ggbXkKdmJsYW5rX2JlZm9yZS9hZnRlcigpIHN0
dWZmIGFuZCBleHRlbmQgaXRzIHVzZSBhIGJpdC4KCkFzc3VtaW5nIEkgY2FuIHN0aWxsIGZpbmQg
aXQuLi4KCj4gIAkJCSAgICAgInVuZXhwZWN0ZWQgJXMgc2VxICV1LCBzaG91bGQgYmUgPj0gJXVc
biIsCj4gIAkJCSAgICAgZXMtPm5hbWUsIGVzLT5jdXJyZW50X3NlcSwgZXMtPmxhc3Rfc2VxKTsK
PiAgCQlpZ3RfYXNzZXJ0X2YoZXMtPmN1cnJlbnRfc2VxIC0gZXMtPmxhc3Rfc2VxIDw9IDE1MCwK
PiAtLSAKPiAyLjE5LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
