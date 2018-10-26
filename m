Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D466E4C1
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Oct 2018 15:57:18 +0000 (UTC)
References: <20181026120305.18672-1-stanislav.lisovskiy@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <1554118f-088c-4a2b-d258-765a15b15c58@linux.intel.com>
Date: Fri, 26 Oct 2018 17:57:16 +0200
MIME-Version: 1.0
In-Reply-To: <20181026120305.18672-1-stanislav.lisovskiy@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/igt_fb: Fix unused variable buf.
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

T3AgMjYtMTAtMTggb20gMTQ6MDMgc2NocmVlZiBTdGFuaXNsYXYgTGlzb3Zza2l5Ogo+IERlc3Bp
dGUgdGhlIGNvbW1lbnQgdGVtcG9yYXJ5IGJ1ZiBpcyBub3QKPiB1c2VkIGFueXdoZXJlIGluIGNv
bnZlcnRfbnYxMl90b19yZ2IyNCwKPiBzbyBpdCBoYXMgdG8gYmUgZWl0aGVyIHJlbW92ZWQgb3Ig
dXNlZCBpbnN0ZWFkCj4gb2YgY3Z0LT5zcmMucHRyLgo+Cj4gdjI6IFB1dCBpdCBpbiB1c2UgaW5z
dGVhZCBvZiByZW1vdmluZyBhcyBvdGhlcgo+IGZ1bmN0aW9ucyBzZWVtIHRvIHVzZSBpdC4KPgo+
IFNpZ25lZC1vZmYtYnk6IFN0YW5pc2xhdiBMaXNvdnNraXkgPHN0YW5pc2xhdi5saXNvdnNraXlA
aW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvaWd0X2ZiLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIv
aWd0X2ZiLmMgYi9saWIvaWd0X2ZiLmMKPiBpbmRleCA0NzAwYjE1Mi4uNWU3NzVjNDQgMTAwNjQ0
Cj4gLS0tIGEvbGliL2lndF9mYi5jCj4gKysrIGIvbGliL2lndF9mYi5jCj4gQEAgLTE1MzgsOCAr
MTUzOCw4IEBAIHN0YXRpYyB2b2lkIGNvbnZlcnRfbnYxMl90b19yZ2IyNChzdHJ1Y3QgZmJfY29u
dmVydCAqY3Z0KQo+ICAJICogZnJvbSB0aGVyZS4KPiAgCSAqLwo+ICAJaWd0X21lbWNweV9mcm9t
X3djKGJ1ZiwgY3Z0LT5zcmMucHRyLCBjdnQtPnNyYy5mYi0+c2l6ZSk7Cj4gLQl5ID0gY3Z0LT5z
cmMucHRyICsgY3Z0LT5zcmMuZmItPm9mZnNldHNbMF07Cj4gLQl1diA9IGN2dC0+c3JjLnB0ciAr
IGN2dC0+c3JjLmZiLT5vZmZzZXRzWzFdOwo+ICsJeSA9IGJ1ZiArIGN2dC0+c3JjLmZiLT5vZmZz
ZXRzWzBdOwo+ICsJdXYgPSBidWYgKyBjdnQtPnNyYy5mYi0+b2Zmc2V0c1sxXTsKPiAgCj4gIAlm
b3IgKGkgPSAwOyBpIDwgY3Z0LT5kc3QuZmItPmhlaWdodCAvIDI7IGkrKykgewo+ICAJCWZvciAo
aiA9IDA7IGogPCBjdnQtPmRzdC5mYi0+d2lkdGggLyAyOyBqKyspIHsKCk11Y2ggYmV0dGVyIQoK
UmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
