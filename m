Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7E489A57
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jun 2018 09:51:54 +0000 (UTC)
References: <20180523183110.1975-1-ville.syrjala@linux.intel.com>
 <20180523183110.1975-2-ville.syrjala@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <4433405a-4373-700f-c8f6-62118654b831@linux.intel.com>
Date: Tue, 5 Jun 2018 11:51:52 +0200
MIME-Version: 1.0
In-Reply-To: <20180523183110.1975-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] lib: Don't use dumb buffers for
 YCbCr
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjMtMDUtMTggb20gMjA6MzEgc2NocmVlZiBWaWxsZSBTeXJqYWxhOgo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4KPiBXZSBkb24ndCBk
byB0aGUgImJsYWNrICE9IHplcm8iIGNsZWFyaW5nIGZvciBkdW1iIGJ1ZmZlcnMsIHNvIGxldCdz
IG5vdAo+IHVzZSB0aGVtIGZvciBZQ2JDciBmcmFtZWJ1ZmZlcnMuCj4KPiB2MjogVXNlIGlndF9m
b3JtYXRfaXNfeXV2KCkKPgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGxpYi9pZ3RfZmIuYyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5jCj4gaW5kZXggNGYxN2Y5OTQ1NDE5Li5j
ODlmNzg1MGVkNzAgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9mYi5jCj4gKysrIGIvbGliL2lndF9m
Yi5jCj4gQEAgLTM1OSw3ICszNTksNyBAQCBzdGF0aWMgaW50IGNyZWF0ZV9ib19mb3JfZmIoaW50
IGZkLCBpbnQgd2lkdGgsIGludCBoZWlnaHQsCj4gIAlpZiAob2Zmc2V0cykKPiAgCQltZW1zZXQo
b2Zmc2V0cywgMCwgQVJSQVlfU0laRShmb3JtYXQtPnBsYW5lX2JwcCkgKiBzaXplb2YoKm9mZnNl
dHMpKTsKPiAgCj4gLQlpZiAodGlsaW5nIHx8IHNpemUgfHwgc3RyaWRlIHx8IGZvcm1hdC0+cGxh
bmVzID4gMSkgewo+ICsJaWYgKHRpbGluZyB8fCBzaXplIHx8IHN0cmlkZSB8fCBpZ3RfZm9ybWF0
X2lzX3l1dihmb3JtYXQtPmRybV9pZCkpIHsKPiAgCQl1bnNpZ25lZCBjYWxjdWxhdGVkX3NpemUs
IGNhbGN1bGF0ZWRfc3RyaWRlOwo+ICAKPiAgCQlpZiAoZm9ybWF0LT5wbGFuZXMgPiAxKQoKSSBm
ZWFyIHRoaXMgd2lsbCBub3QgYWxsb3cgdXMgdG8gc3VwcG9ydCAhaTkxNSwgd2Ugc2hvdWxkIHN0
YXJ0IGNhcmluZyBhdCBzb21lIHBvaW50IGFuZCBlaXRoZXIgbW92ZSB0byBtaW5pZ2JtIG9yIHJv
bGwgc3BlY2lhbCBjYXNlcyBmb3IgZWFjaCBkcml2ZXIuLgoKQnV0IGZvciBub3cgaXQncyBvay4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
