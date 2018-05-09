Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367B56ED71
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 18:20:15 +0000 (UTC)
Date: Wed, 9 May 2018 11:20:14 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20180509182014.GI2552@intel.com>
References: <20180509004855.4121-1-dhinakaran.pandiyan@intel.com>
 <87po2545xr.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87po2545xr.fsf@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tools/vbt_decode: Print DRRS and PSR
 flags
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
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDksIDIwMTggYXQgMTA6NTc6MzZBTSArMDMwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gVHVlLCAwOCBNYXkgMjAxOCwgRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJh
bi5wYW5kaXlhbkBpbnRlbC5jb20+IHdyb3RlOgo+ID4gVGhlc2UgYml0cyBhcmUgdXNlZnVsIGZv
ciBkZWJ1Zy4KPiA+Cj4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5k
aXlhbkBpbnRlbC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3Vs
YUBpbnRlbC5jb20+CgpwdXNoZWQsIHRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKYnR3OgppbnRlbF92
YnRfZGVjb2RlIC0tZmlsZT0vc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvMC9pOTE1X3ZidCB8IGdyZXAg
LWkgcHNyCkJEQiBibG9jayA5IC0gUFNSIGJsb2NrOgoJCUlkbGUgZnJhbWVzIHRvIGZvciBQU1Ig
ZW5hYmxlOiAwCglFbmFibGUgUFNSOiB5ZXMKClRoYW5rcywKUm9kcmlnby4KCj4gCj4gPiAtLS0K
PiA+ICB0b29scy9pbnRlbF92YnRfZGVjb2RlLmMgfCAyICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy9pbnRlbF92YnRfZGVj
b2RlLmMgYi90b29scy9pbnRlbF92YnRfZGVjb2RlLmMKPiA+IGluZGV4IGQ3Y2JjNDM2Li5lNjFm
MGE4YyAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL2ludGVsX3ZidF9kZWNvZGUuYwo+ID4gKysrIGIv
dG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jCj4gPiBAQCAtNzIxLDYgKzcyMSw4IEBAIHN0YXRpYyB2
b2lkIGR1bXBfZHJpdmVyX2ZlYXR1cmUoc3RydWN0IGNvbnRleHQgKmNvbnRleHQsCj4gPiAgCXBy
aW50ZigiXHRMZWdhY3kgQ1JUIG1heCBZOiAlZFxuIiwgZmVhdHVyZS0+bGVnYWN5X2NydF9tYXhf
eSk7Cj4gPiAgCXByaW50ZigiXHRMZWdhY3kgQ1JUIG1heCByZWZyZXNoOiAlZFxuIiwKPiA+ICAJ
ICAgICAgIGZlYXR1cmUtPmxlZ2FjeV9jcnRfbWF4X3JlZnJlc2gpOwo+ID4gKwlwcmludGYoIlx0
RW5hYmxlIERSUlM6ICVzXG4iLCBZRVNOTyhmZWF0dXJlLT5kcnJzX2VuYWJsZWQpKTsKPiA+ICsJ
cHJpbnRmKCJcdEVuYWJsZSBQU1I6ICVzXG4iLCBZRVNOTyhmZWF0dXJlLT5wc3JfZW5hYmxlZCkp
Owo+ID4gIH0KPiA+ICAKPiA+ICBzdGF0aWMgdm9pZCBkdW1wX2VkcChzdHJ1Y3QgY29udGV4dCAq
Y29udGV4dCwKPiAKPiAtLSAKPiBKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgVGVjaG5v
bG9neSBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
