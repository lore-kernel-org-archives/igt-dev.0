Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180228100800.11840-1-tvrtko.ursulin@linux.intel.com>
 <20180228100800.11840-2-tvrtko.ursulin@linux.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <89067d3a-9f6f-33e8-0358-e638bc919200@intel.com>
Date: Wed, 28 Feb 2018 10:39:58 +0000
MIME-Version: 1.0
In-Reply-To: <20180228100800.11840-2-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/perf: Fix build warning
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
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVs
LmNvbT4KCk9uIDI4LzAyLzE4IDEwOjA4LCBUdnJ0a28gVXJzdWxpbiB3cm90ZToKPiBGcm9tOiBU
dnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+Cj4gTW92ZSB2YXJpYWJs
ZSBkZWNsYXJhdGlvbiB0byB0b3Agb2Ygc2NvcGUgdG8gYXZvaWQgQzkwIGJ1aWxkIHdhcm5pbmcu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwu
Y29tPgo+IC0tLQo+ICAgdGVzdHMvcGVyZi5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvcGVyZi5j
IGIvdGVzdHMvcGVyZi5jCj4gaW5kZXggYzMwMmEzNTViODUwLi43OGJmNmNkZDM1MDQgMTAwNjQ0
Cj4gLS0tIGEvdGVzdHMvcGVyZi5jCj4gKysrIGIvdGVzdHMvcGVyZi5jCj4gQEAgLTE3MjYsNiAr
MTcyNiw3IEBAIHRlc3Rfb2FfZXhwb25lbnRzKHZvaWQpCj4gICAJCWludCBidWZfc2l6ZSA9IHNh
bXBsZV9zaXplICogbWF4X3JlcG9ydHMgKiAxLjU7Cj4gICAJCXVpbnQ4X3QgKmJ1ZiA9IGNhbGxv
YygxLCBidWZfc2l6ZSk7Cj4gICAJCWludCByZXQsIG5fdGltZXJfcmVwb3J0cyA9IDA7Cj4gKwkJ
dWludDMyX3QgbWF0Y2hlcyA9IDA7Cj4gICAJCXN0cnVjdCB7Cj4gICAJCQl1aW50MzJfdCByZXBv
cnRbNjRdOwo+ICAgCQl9IHRpbWVyX3JlcG9ydHNbMzBdOwo+IEBAIC0xNzg1LDcgKzE3ODYsNiBA
QCB0ZXN0X29hX2V4cG9uZW50cyh2b2lkKQo+ICAgCQlpZ3RfZGVidWcoInJlcG9ydCUwNGkgdHM9
JTA4eCBod19pZD0weCUwOHhcbiIsIDAsCj4gICAJCQkgIHRpbWVyX3JlcG9ydHNbMF0ucmVwb3J0
WzFdLAo+ICAgCQkJICBvYV9yZXBvcnRfZ2V0X2N0eF9pZCh0aW1lcl9yZXBvcnRzWzBdLnJlcG9y
dCkpOwo+IC0JCXVpbnQzMl90IG1hdGNoZXMgPSAwOwo+ICAgCQlmb3IgKGludCBpID0gMTsgaSA8
IG5fdGltZXJfcmVwb3J0czsgaSsrKSB7Cj4gICAJCQl1aW50MzJfdCBkZWx0YSA9Cj4gICAJCQkJ
dGltZXJfcmVwb3J0c1tpXS5yZXBvcnRbMV0gLSB0aW1lcl9yZXBvcnRzW2kgLSAxXS5yZXBvcnRb
MV07CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
