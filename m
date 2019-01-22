Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C653893C0
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jan 2019 18:55:16 +0000 (UTC)
References: <20190122181728.2500-1-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <73afc737-d2bc-7ee0-a252-92562768749e@intel.com>
Date: Tue, 22 Jan 2019 10:55:15 -0800
MIME-Version: 1.0
In-Reply-To: <20190122181728.2500-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Include the size in the error
 message for mlock
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMi8wMS8xOSAxMDoxNywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IEtub3dpbmcgaG93IG11
Y2ggd2UgdHJpZWQgdG8gYWxsb2NhdGUgd291bGQgYmUgdXNlZnVsIGlmIG9uZSBzaG91bGQgbmVl
ZAo+IHRvIGRlYnVnIHdoeSBpdCBmYWlsZWQuCj4gCj4gUmVmZXJlbmNlczogaHR0cHM6Ly9idWdz
LmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA5NDM5Cj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpMR1RNLgoKUmV2aWV3ZWQt
Ynk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNvbT4KCj4g
LS0tCj4gICBsaWIvaWd0X2F1eC5jIHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2F1eC5j
IGIvbGliL2lndF9hdXguYwo+IGluZGV4IDEyNTBkNWM1Zi4uMmUyZDU1MmI1IDEwMDY0NAo+IC0t
LSBhL2xpYi9pZ3RfYXV4LmMKPiArKysgYi9saWIvaWd0X2F1eC5jCj4gQEAgLTEwODAsMTQgKzEw
ODAsMTQgQEAgdm9pZCBpZ3RfbG9ja19tZW0oc2l6ZV90IHNpemUpCj4gICAKPiAgIAlsb2NrZWRf
bWVtID0gbWFsbG9jKGxvY2tlZF9zaXplKTsKPiAgIAlpZ3RfcmVxdWlyZV9mKGxvY2tlZF9tZW0s
Cj4gLQkJICAgICAgIkNvdWxkIG5vdCBhbGxvY2F0ZSBlbm91Z2ggbWVtb3J5IHRvIGxvY2suXG4i
KTsKPiArCQkgICAgICAiQ291bGQgbm90IG1hbGxvYyAlemRNaUIgZm9yIGxvY2tpbmcuXG4iLCBz
aXplKTsKPiAgIAo+ICAgCS8qIHdyaXRlIGludG8gZWFjaCBwYWdlIHRvIGVuc3VyZSBpdCBpcyBh
bGxvY2F0ZWQgKi8KPiAgIAlmb3IgKGkgPSAwOyBpIDwgbG9ja2VkX3NpemU7IGkgKz0gcGFnZXNp
emUpCj4gICAJCWxvY2tlZF9tZW1baV0gPSBpOwo+ICAgCj4gICAJcmV0ID0gbWxvY2sobG9ja2Vk
X21lbSwgbG9ja2VkX3NpemUpOwo+IC0JaWd0X2Fzc2VydF9mKHJldCA9PSAwLCAiQ291bGQgbm90
IGxvY2sgbWVtb3J5IGludG8gUkFNLlxuIik7Cj4gKwlpZ3RfYXNzZXJ0X2YocmV0ID09IDAsICJD
b3VsZCBub3QgbWxvY2sgJXpkTWlCLlxuIiwgc2l6ZSk7Cj4gICB9Cj4gICAKPiAgIC8qKgo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
