Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D7089E86
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2019 12:30:19 +0000 (UTC)
References: <20190524150334.15833-1-simon.ser@intel.com>
 <20190524150334.15833-8-simon.ser@intel.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <b1202073-5717-e765-d1cb-f400bd48c260@linux.intel.com>
Date: Mon, 27 May 2019 15:30:15 +0300
MIME-Version: 1.0
In-Reply-To: <20190524150334.15833-8-simon.ser@intel.com>
Content-Language: en-PH
Subject: Re: [igt-dev] [PATCH i-g-t v2 7/9] lib/igt_audio: make
 audio_extract_channel_s32_le support a NULL dst
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
List-ID: <igt-dev@lists.freedesktop.org>

T24gMjQvMDUvMjAxOSAxODowMywgU2ltb24gU2VyIHdyb3RlOgo+IFRoaXMgYWRkcyBhIHNucHJp
bnRmLWxpa2UgYmVoYXZpb3VyIHRvIGF1ZGlvX2V4dHJhY3RfY2hhbm5lbF9zMzJfbGUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgoKUmV2aWV3ZWQt
Ynk6IE1hcnRpbiBQZXJlcyA8bWFydGluLnBlcmVzQGxpbnV4LmludGVsLmNvbT4KCj4gLS0tCj4g
IGxpYi9pZ3RfYXVkaW8uYyB8IDExICsrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfYXVk
aW8uYyBiL2xpYi9pZ3RfYXVkaW8uYwo+IGluZGV4IGYyYWFjMGUyM2EzNy4uYzc0MDdmYTFhOTdi
IDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfYXVkaW8uYwo+ICsrKyBiL2xpYi9pZ3RfYXVkaW8uYwo+
IEBAIC00NDUsNyArNDQ1LDEzIEBAIGJvb2wgYXVkaW9fc2lnbmFsX2RldGVjdChzdHJ1Y3QgYXVk
aW9fc2lnbmFsICpzaWduYWwsIGludCBzYW1wbGluZ19yYXRlLAo+ICB9Cj4gIAo+ICAvKioKPiAt
ICogRXh0cmFjdHMgYSBzaW5nbGUgY2hhbm5lbCBmcm9tIGEgbXVsdGktY2hhbm5lbCBTMzJfTEUg
aW5wdXQgYnVmZmVyLgo+ICsgKiBhdWRpb19leHRyYWN0X2NoYW5uZWxfczMyX2xlOiBleHRyYWN0
cyBhIHNpbmdsZSBjaGFubmVsIGZyb20gYSBtdWx0aS1jaGFubmVsCj4gKyAqIFMzMl9MRSBpbnB1
dCBidWZmZXIuCj4gKyAqCj4gKyAqIElmIGRzdF9jYXAgaXMgemVybywgbm8gY29weSBpcyBwZXJm
b3JtZWQuIFRoaXMgY2FuIGJlIHVzZWQgdG8gY29tcHV0ZSB0aGUKPiArICogbWluaW11bSByZXF1
aXJlZCBjYXBhY2l0eS4KPiArICoKPiArICogUmV0dXJuczogdGhlIG51bWJlciBvZiBzYW1wbGVz
IGV4dHJhY3RlZC4KPiAgICovCj4gIHNpemVfdCBhdWRpb19leHRyYWN0X2NoYW5uZWxfczMyX2xl
KGRvdWJsZSAqZHN0LCBzaXplX3QgZHN0X2NhcCwKPiAgCQkJCSAgICBpbnQzMl90ICpzcmMsIHNp
emVfdCBzcmNfbGVuLAo+IEBAIC00NTYsNiArNDYyLDkgQEAgc2l6ZV90IGF1ZGlvX2V4dHJhY3Rf
Y2hhbm5lbF9zMzJfbGUoZG91YmxlICpkc3QsIHNpemVfdCBkc3RfY2FwLAo+ICAJaWd0X2Fzc2Vy
dChjaGFubmVsIDwgbl9jaGFubmVscyk7Cj4gIAlpZ3RfYXNzZXJ0KHNyY19sZW4gJSBuX2NoYW5u
ZWxzID09IDApOwo+ICAJZHN0X2xlbiA9IHNyY19sZW4gLyBuX2NoYW5uZWxzOwo+ICsJaWYgKGRz
dF9jYXAgPT0gMCkKPiArCQlyZXR1cm4gZHN0X2xlbjsKPiArCj4gIAlpZ3RfYXNzZXJ0KGRzdF9s
ZW4gPD0gZHN0X2NhcCk7Cj4gIAlmb3IgKGkgPSAwOyBpIDwgZHN0X2xlbjsgaSsrKQo+ICAJCWRz
dFtpXSA9IChkb3VibGUpIHNyY1tpICogbl9jaGFubmVscyArIGNoYW5uZWxdIC8gSU5UMzJfTUFY
Owo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
