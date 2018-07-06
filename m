Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88266F0B5
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jul 2018 16:45:48 +0000 (UTC)
References: <20180706163940.7699-1-ville.syrjala@linux.intel.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <18659693-b570-a3dd-62f2-b76081129843@intel.com>
Date: Fri, 6 Jul 2018 09:45:45 -0700
MIME-Version: 1.0
In-Reply-To: <20180706163940.7699-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_draw: Zero initalize the
 igt_bufs
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAwNi8wNy8xOCAwOTozOSwgVmlsbGUgU3lyamFsYSB3cm90ZToKPiBGcm9tOiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IAo+IEkgbWlzc2VkIHRo
ZXNlIHdoZW4gc3ByaW5rbGluZyB0aGUgbWVtc2V0cy4gVXNpbmcgc3RhY2sgZ2FyYmFnZSBhcyB0
aGUKPiBhdXggc3VyZmFjZSBzdGF0ZSBpc24ndCBhIGdvb2QgaWRlYS4gQ2F1c2VzIGttc19mcm9u
dF9idWZmZXJfdHJhY2tpbmcKPiB0byBmYWlsIG9uIHNrbCsuCj4gCj4gRml4ZXM6IGE0MzkzYzM5
NTFlYyAoImxpYjogQWRkIGF1eCBzdXJmYWNlIHN0YXRlIHRvIGlndF9idWYiKQo+IFNpZ25lZC1v
ZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CgpS
ZXZpZXdlZC1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50ZWwu
Y29tPgoKPiAtLS0KPiAgIGxpYi9pZ3RfZHJhdy5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
ZHJhdy5jIGIvbGliL2lndF9kcmF3LmMKPiBpbmRleCBlYmFlOTE1MTEzZGEuLmM3ZDU3NzBkY2Ey
OCAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X2RyYXcuYwo+ICsrKyBiL2xpYi9pZ3RfZHJhdy5jCj4g
QEAgLTU2OCw3ICs1NjgsNyBAQCBzdGF0aWMgdm9pZCBkcmF3X3JlY3RfcmVuZGVyKGludCBmZCwg
c3RydWN0IGNtZF9kYXRhICpjbWRfZGF0YSwKPiAgIAlkcm1faW50ZWxfYm8gKnNyYywgKmRzdDsK
PiAgIAl1aW50MzJfdCBkZXZpZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZmQpOwo+ICAgCWlndF9y
ZW5kZXJfY29weWZ1bmNfdCByZW5kZXJjb3B5ID0gaWd0X2dldF9yZW5kZXJfY29weWZ1bmMoZGV2
aWQpOwo+IC0Jc3RydWN0IGlndF9idWYgc3JjX2J1ZiwgZHN0X2J1ZjsKPiArCXN0cnVjdCBpZ3Rf
YnVmIHNyY19idWYgPSB7fSwgZHN0X2J1ZiA9IHt9Owo+ICAgCXN0cnVjdCBpbnRlbF9iYXRjaGJ1
ZmZlciAqYmF0Y2g7Cj4gICAJdWludDMyX3QgdGlsaW5nLCBzd2l6emxlOwo+ICAgCXN0cnVjdCBi
dWZfZGF0YSB0bXA7Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
