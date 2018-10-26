Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFA96E45A
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Oct 2018 11:25:13 +0000 (UTC)
References: <20181026104427.11112-1-stanislav.lisovskiy@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <6f83ac6b-e0ae-32e0-42b4-5b9ad637786b@linux.intel.com>
Date: Fri, 26 Oct 2018 13:25:09 +0200
MIME-Version: 1.0
In-Reply-To: <20181026104427.11112-1-stanislav.lisovskiy@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v1] lib/igt_fb: Remove unused variable
 buf.
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, igt-dev@lists.freedesktop.org
Cc: ville.syrjala@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjYtMTAtMTggb20gMTI6NDQgc2NocmVlZiBTdGFuaXNsYXYgTGlzb3Zza2l5Ogo+IERlc3Bp
dGUgdGhlIGNvbW1lbnQgdGVtcG9yYXJ5IGJ1ZiBpcyBub3QKPiB1c2VkIGFueXdoZXJlIGluIGNv
bnZlcnRfbnYxMl90b19yZ2IyNCwKPiBzbyBpdCBoYXMgdG8gYmUgZWl0aGVyIHJlbW92ZWQgb3Ig
dXNlZCBpbnN0ZWFkCj4gb2YgY3Z0LT5zcmMucHRyLgo+IEN1cnJlbnRseSByZW1vdmluZyBpdCBh
cyBvdGhlciBmdW5jdGlvbnMgc2VlbQo+IG5vdCB0byB1c2UgaXQgZWl0aGVyLCB0byBtYWtlIHRo
ZSBjb2RlIG1vcmUgY29uc2lzdGVudC4KPgo+IFNpZ25lZC1vZmYtYnk6IFN0YW5pc2xhdiBMaXNv
dnNraXkgPHN0YW5pc2xhdi5saXNvdnNraXlAaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvaWd0X2Zi
LmMgfCA5IC0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0X2ZiLmMKPiBpbmRleCA0NzAwYjE1Mi4u
ZDkyNzY5YTkgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9mYi5jCj4gKysrIGIvbGliL2lndF9mYi5j
Cj4gQEAgLTE1MjgsMTYgKzE1MjgsOSBAQCBzdGF0aWMgdm9pZCBjb252ZXJ0X252MTJfdG9fcmdi
MjQoc3RydWN0IGZiX2NvbnZlcnQgKmN2dCkKPiAgCXVpbnQ4X3QgKnJnYjI0ID0gY3Z0LT5kc3Qu
cHRyOwo+ICAJdW5zaWduZWQgaW50IHJnYjI0X3N0cmlkZSA9IGN2dC0+ZHN0LmZiLT5zdHJpZGVz
WzBdOwo+ICAJdW5zaWduZWQgaW50IHBsYW5hcl9zdHJpZGUgPSBjdnQtPnNyYy5mYi0+c3RyaWRl
c1swXTsKPiAtCXVpbnQ4X3QgKmJ1ZiA9IG1hbGxvYyhjdnQtPnNyYy5mYi0+c2l6ZSk7Cj4gIAlz
dHJ1Y3QgaWd0X21hdDQgbSA9IGlndF95Y2Jjcl90b19yZ2JfbWF0cml4KGN2dC0+c3JjLmZiLT5j
b2xvcl9lbmNvZGluZywKPiAgCQkJCQkJICAgIGN2dC0+c3JjLmZiLT5jb2xvcl9yYW5nZSk7Cj4g
IAo+IC0JLyoKPiAtCSAqIFJlYWRpbmcgZnJvbSB0aGUgQk8gaXMgYXdmdWxseSBzbG93IGJlY2F1
c2Ugb2YgbGFjayBvZiByZWFkIGNhY2hpbmcsCj4gLQkgKiBpdCdzIGZhc3RlciB0byBjb3B5IHRo
ZSB3aG9sZSBCTyB0byBhIHRlbXBvcmFyeSBidWZmZXIgYW5kIGNvbnZlcnQKPiAtCSAqIGZyb20g
dGhlcmUuCj4gLQkgKi8KPiAtCWlndF9tZW1jcHlfZnJvbV93YyhidWYsIGN2dC0+c3JjLnB0ciwg
Y3Z0LT5zcmMuZmItPnNpemUpOwo+ICAJeSA9IGN2dC0+c3JjLnB0ciArIGN2dC0+c3JjLmZiLT5v
ZmZzZXRzWzBdOwo+ICAJdXYgPSBjdnQtPnNyYy5wdHIgKyBjdnQtPnNyYy5mYi0+b2Zmc2V0c1sx
XTsKYXNzaWduIHkgYW5kIHV2IHRvICZidWZbLi4uLT5vZmZzZXRzW2JsYV1dPyBPdGhlcndpc2Ug
bmljZSBjYXRjaCwgdGhpcyBpcyBkZXN0cm95aW5nIHBlcmZvcm1hbmNlLiA6KQoKfk1hYXJ0ZW4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
