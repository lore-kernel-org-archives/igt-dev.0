Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D67A89AAE
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2019 11:22:04 +0000 (UTC)
Date: Tue, 19 Mar 2019 13:22:01 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190319112201.GX3888@intel.com>
References: <1552993078-16293-1-git-send-email-juhapekka.heikkila@gmail.com>
 <1552993078-16293-2-git-send-email-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1552993078-16293-2-git-send-email-juhapekka.heikkila@gmail.com>
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

T24gVHVlLCBNYXIgMTksIDIwMTkgYXQgMTI6NTc6NThQTSArMDIwMCwgSnVoYS1QZWtrYSBIZWlr
a2lsYSB3cm90ZToKPiBwbGFuZSBhbHBoYSBhbmQgYmxlbmQgd291bGQgYWZmZWN0IG90aGVyIHRl
c3RzIGlmIGxlZnQKPiBpbiB1bmV4cGVjdGVkIHN0YXRlcwo+IAo+IHYyICh2aWxsZSBzeXJqw6Rs
w6QpOiB1c2UgIlByZS1tdWx0aXBsaWVkIiBhcyBkZWZhdWx0IGZvcgo+IElHVF9QTEFORV9QSVhF
TF9CTEVORF9NT0RFLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1
aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCj4gLS0tCj4gIGxpYi9pZ3Rfa21zLmMg
fCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMuYwo+IGluZGV4IGUxZWFjYzEuLmM3
ODgzMDggMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9rbXMuYwo+ICsrKyBiL2xpYi9pZ3Rfa21zLmMK
PiBAQCAtMTc4MSw2ICsxNzgxLDEzIEBAIHN0YXRpYyB2b2lkIGlndF9wbGFuZV9yZXNldChpZ3Rf
cGxhbmVfdCAqcGxhbmUpCj4gIAlpZiAoaWd0X3BsYW5lX2hhc19wcm9wKHBsYW5lLCBJR1RfUExB
TkVfUk9UQVRJT04pKQo+ICAJCWlndF9wbGFuZV9zZXRfcHJvcF92YWx1ZShwbGFuZSwgSUdUX1BM
QU5FX1JPVEFUSU9OLCBJR1RfUk9UQVRJT05fMCk7Cj4gIAo+ICsJaWYgKGlndF9wbGFuZV9oYXNf
cHJvcChwbGFuZSwgSUdUX1BMQU5FX1BJWEVMX0JMRU5EX01PREUpKQo+ICsJCWlndF9wbGFuZV9z
ZXRfcHJvcF9lbnVtKHBsYW5lLCBJR1RfUExBTkVfUElYRUxfQkxFTkRfTU9ERSwgIlByZS1tdWx0
aXBsaWVkIik7Cj4gKwo+ICsJaWYgKGlndF9wbGFuZV9oYXNfcHJvcChwbGFuZSwgSUdUX1BMQU5F
X0FMUEhBKSkKPiArCQlpZ3RfcGxhbmVfc2V0X3Byb3BfdmFsdWUocGxhbmUsIElHVF9QTEFORV9B
TFBIQSwgMHhmZmZmKTsKPiArCj4gKwo+ICAJaWd0X3BsYW5lX2NsZWFyX3Byb3BfY2hhbmdlZChw
bGFuZSwgSUdUX1BMQU5FX0lOX0ZFTkNFX0ZEKTsKPiAgCXBsYW5lLT52YWx1ZXNbSUdUX1BMQU5F
X0lOX0ZFTkNFX0ZEXSA9IH4wVUxMOwo+ICAJcGxhbmUtPmdlbV9oYW5kbGUgPSAwOwo+IC0tIAo+
IDIuNy40Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
CgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldg==
