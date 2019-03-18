Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B12589A44
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2019 14:32:34 +0000 (UTC)
Date: Mon, 18 Mar 2019 16:32:30 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190318143230.GN3888@intel.com>
References: <1552907710-4345-1-git-send-email-juhapekka.heikkila@gmail.com>
 <1552907710-4345-2-git-send-email-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1552907710-4345-2-git-send-email-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_kms: reset plane alpha and
 blend in igt_plane_reset()
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDE6MTU6MTBQTSArMDIwMCwgSnVoYS1QZWtrYSBIZWlr
a2lsYSB3cm90ZToKPiBwbGFuZSBhbHBoYSBhbmQgYmxlbmQgd291bGQgYWZmZWN0IG90aGVyIHRl
c3RzIGlmIGxlZnQKPiBpbiB1bmV4cGVjdGVkIHN0YXRlcwo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1
aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+Cj4gLS0tCj4g
IGxpYi9pZ3Rfa21zLmMgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMuYwo+IGlu
ZGV4IGUxZWFjYzEuLmNkYjVhYmEgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9rbXMuYwo+ICsrKyBi
L2xpYi9pZ3Rfa21zLmMKPiBAQCAtMTc4MSw2ICsxNzgxLDEzIEBAIHN0YXRpYyB2b2lkIGlndF9w
bGFuZV9yZXNldChpZ3RfcGxhbmVfdCAqcGxhbmUpCj4gIAlpZiAoaWd0X3BsYW5lX2hhc19wcm9w
KHBsYW5lLCBJR1RfUExBTkVfUk9UQVRJT04pKQo+ICAJCWlndF9wbGFuZV9zZXRfcHJvcF92YWx1
ZShwbGFuZSwgSUdUX1BMQU5FX1JPVEFUSU9OLCBJR1RfUk9UQVRJT05fMCk7Cj4gIAo+ICsJaWYg
KGlndF9wbGFuZV9oYXNfcHJvcChwbGFuZSwgSUdUX1BMQU5FX1BJWEVMX0JMRU5EX01PREUpKQo+
ICsJCWlndF9wbGFuZV9zZXRfcHJvcF9lbnVtKHBsYW5lLCBJR1RfUExBTkVfUElYRUxfQkxFTkRf
TU9ERSwgIk5vbmUiKTsKCiJQcmUtbXVsdGlwbGllZCIgaXMgdGhlIGRlZmF1bHQgdmFsdWUgZm9y
IHRoaXMgcHJvcC4KCj4gKwo+ICsJaWYgKGlndF9wbGFuZV9oYXNfcHJvcChwbGFuZSwgSUdUX1BM
QU5FX0FMUEhBKSkKPiArCQlpZ3RfcGxhbmVfc2V0X3Byb3BfdmFsdWUocGxhbmUsIElHVF9QTEFO
RV9BTFBIQSwgMHhmZmZmKTsKPiArCj4gKwo+ICAJaWd0X3BsYW5lX2NsZWFyX3Byb3BfY2hhbmdl
ZChwbGFuZSwgSUdUX1BMQU5FX0lOX0ZFTkNFX0ZEKTsKPiAgCXBsYW5lLT52YWx1ZXNbSUdUX1BM
QU5FX0lOX0ZFTkNFX0ZEXSA9IH4wVUxMOwo+ICAJcGxhbmUtPmdlbV9oYW5kbGUgPSAwOwo+IC0t
IAo+IDIuNy40Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2CgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
