Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21F489BBE
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2019 13:14:14 +0000 (UTC)
Date: Tue, 2 Jul 2019 16:14:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190702131411.GO5942@intel.com>
References: <20190702130229.23742-1-simon.ser@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702130229.23742-1-simon.ser@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_eld: print debug message when
 no ELD is found
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
To: Simon Ser <simon.ser@intel.com>
Cc: igt-dev@lists.freedesktop.org, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMDQ6MDI6MjlQTSArMDMwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IFdoZW4gdGhpcyBoYXBwZW5zLCB0aGUgbG9ncyB3ZXJlIGNvbXBsZXRlbHkgZW1wdHkgcHJl
dmlvdXNseSwgd2hpY2ggY2FuIGJlCj4gcXVpdGUgY29uZnVzaW5nLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKPiAtLS0KPiAgbGliL2ln
dF9lbGQuYyB8IDggKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2VsZC5jIGIvbGliL2lndF9l
bGQuYwo+IGluZGV4IDNkN2ZkNGRkMGE4Mi4uMTZjNGFjMDZjNmY2IDEwMDY0NAo+IC0tLSBhL2xp
Yi9pZ3RfZWxkLmMKPiArKysgYi9saWIvaWd0X2VsZC5jCj4gQEAgLTIwNywxMCArMjA3LDExIEBA
IGJvb2wgZWxkX2dldF9pZ3Qoc3RydWN0IGVsZF9lbnRyeSAqZWxkKQo+ICB7Cj4gIAlESVIgKmRp
cjsKPiAgCXN0cnVjdCBkaXJlbnQgKmRpcmVudDsKPiAtCWludCBpOwo+ICsJaW50IGksIG5fZWxk
czsKPiAgCWNoYXIgY2FyZFs2NF07Cj4gIAljaGFyIHBhdGhbUEFUSF9NQVhdOwo+IAo+ICsJbl9l
bGRzID0gMDsKPiAgCWZvciAoaSA9IDA7IGkgPCA4OyBpKyspIHsKPiAgCQlzbnByaW50ZihjYXJk
LCBzaXplb2YoY2FyZCksICIvcHJvYy9hc291bmQvY2FyZCVkIiwgaSk7Cj4gIAkJZGlyID0gb3Bl
bmRpcihjYXJkKTsKPiBAQCAtMjIyLDYgKzIyMyw4IEBAIGJvb2wgZWxkX2dldF9pZ3Qoc3RydWN0
IGVsZF9lbnRyeSAqZWxkKQo+ICAJCQkJICAgIHN0cmxlbihFTERfUFJFRklYKSkgIT0gMCkKPiAg
CQkJCWNvbnRpbnVlOwo+IAo+ICsJCQluX2VsZHMrKzsKPiArCj4gIAkJCXNucHJpbnRmKHBhdGgs
IHNpemVvZihwYXRoKSwgIiVzLyVzIiwgY2FyZCwKPiAgCQkJCSBkaXJlbnQtPmRfbmFtZSk7Cj4g
IAkJCWlmICghZWxkX3BhcnNlX2VudHJ5KHBhdGgsIGVsZCkpIHsKPiBAQCAtMjQ2LDYgKzI0OSw5
IEBAIGJvb2wgZWxkX2dldF9pZ3Qoc3RydWN0IGVsZF9lbnRyeSAqZWxkKQo+ICAJCWNsb3NlZGly
KGRpcik7Cj4gIAl9Cj4gCj4gKwlpZiAobl9lbGRzID09IDApCj4gKwkJaWd0X2RlYnVnKCJGb3Vu
ZCB6ZXJvIEVMRHNcbiIpOwo+ICsKPiAgCXJldHVybiBmYWxzZTsKPiAgfQo+IAo+IC0tCj4gMi4y
Mi4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cgot
LSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
