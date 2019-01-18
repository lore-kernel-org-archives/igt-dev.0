Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2F26F5FB
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jan 2019 07:20:36 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y11so9759212lfj.4
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jan 2019 23:20:36 -0800 (PST)
References: <20190117193438.2891-1-dhinakaran.pandiyan@intel.com>
From: =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juhapekka.heikkila@gmail.com>
Message-ID: <81b073b2-3ef9-ad6d-f439-121af8ed1c1a@gmail.com>
Date: Fri, 18 Jan 2019 09:20:32 +0200
MIME-Version: 1.0
In-Reply-To: <20190117193438.2891-1-dhinakaran.pandiyan@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_available_modes_crc: Reset
 output->pipe after testing it.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SGksCgpJIGFjdHVhbGx5IGhhZCB0aGlzIGZpeCBpbmNsdWRlZCBoZXJlIApodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMjY4ODY3LwoKbXkgcGF0Y2ggZml4ZXMgYWxzbyBm
ZXcgb3RoZXIgaXNzdWVzIGJ1dCBpdCBzdGlsbCBuZWVkIHNvbWUgd29yayB3aXRoIApnYW1tYSB0
YWJsZXMsIEkgaGF2ZSB0aGVyZSBzb21lIG1pc21hdGNoLgoKWW91ciBwYXRjaCBjYW4gZ28gaW4g
b24gbXkgYmVoYWxmLCBJIGRvbid0IHlldCBrbm93IGhvdyBzb29uIEkgZ2V0IHRob3NlIApnYW1t
YSB0YWJsZXMgd29ya2luZyBzbyBhbGwgY3JjJ3Mgd2lsbCBzdGFydCB0byBwYXNzLgoKUmV2aWV3
ZWQtYnk6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+
CgpEaGluYWthcmFuIFBhbmRpeWFuIGtpcmpvaXR0aSAxNy4xLjIwMTkga2xvIDIxLjM0Ogo+IE5v
dCBjbGVhcmluZyB0aGUgcGlwZSByZXN1bHRzIGluIGEgdGVzdCBmYWlsdXJlIHdoZW4gdGhlIHNh
bWUgcGlwZSBpcwo+IGFzc2lnbmVkIHRvIHRoZSBuZXh0IG91dHB1dC4KPiAKPiBDYzogSnVoYS1Q
ZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KPiBTdWdnZXN0ZWQt
Ynk6IEphbWVzIEF1c211cyA8amFtZXMuYXVzbXVzQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KPiAt
LS0KPiAgIHRlc3RzL2ttc19hdmFpbGFibGVfbW9kZXNfY3JjLmMgfCAxICsKPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfYXZhaWxh
YmxlX21vZGVzX2NyYy5jIGIvdGVzdHMva21zX2F2YWlsYWJsZV9tb2Rlc19jcmMuYwo+IGluZGV4
IDQ1YTQ3NzUwLi4wYzAyODJmOCAxMDA2NDQKPiAtLS0gYS90ZXN0cy9rbXNfYXZhaWxhYmxlX21v
ZGVzX2NyYy5jCj4gKysrIGIvdGVzdHMva21zX2F2YWlsYWJsZV9tb2Rlc19jcmMuYwo+IEBAIC00
ODQsNiArNDg0LDcgQEAgdGVzdF9hdmFpbGFibGVfbW9kZXMoZGF0YV90KiBkYXRhKQo+ICAgCQlp
Z3RfcGlwZV9jcmNfc3RvcChkYXRhLT5waXBlX2NyYyk7Cj4gICAJCWlndF9waXBlX2NyY19mcmVl
KGRhdGEtPnBpcGVfY3JjKTsKPiAgIAkJaWd0X2Rpc3BsYXlfY29tbWl0MigmZGF0YS0+ZGlzcGxh
eSwgZGF0YS0+Y29tbWl0KTsKPiArCQlpZ3Rfb3V0cHV0X3NldF9waXBlKG91dHB1dCwgUElQRV9O
T05FKTsKPiAgIAl9Cj4gICAJaWd0X2Fzc2VydChpbnZhbGlkcyA9PSAwKTsKPiAgIH0KPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
