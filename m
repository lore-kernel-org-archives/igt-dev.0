Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180605165051.29136-1-tvrtko.ursulin@linux.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <968beaa4-415e-9e69-78df-8968b8023ba1@intel.com>
Date: Tue, 5 Jun 2018 18:15:46 +0100
MIME-Version: 1.0
In-Reply-To: <20180605165051.29136-1-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] scripts/trace.pl: Support
 class:instance engine tracepoints
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
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVs
LmNvbT4KCk9uIDA1LzA2LzE4IDE3OjUwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToKPiBGcm9tOiBU
dnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+Cj4gTmV3IHdheSBvZiBk
ZXNjcmliaW5nIGVuZ2luZXMgbmVlZHMgdGhlIHRvb2wgdG8gYmUgYWRhcHRlZCB0byB1bmRlcnN0
YW5kIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGlu
QGludGVsLmNvbT4KPiAtLS0KPiAgIHNjcmlwdHMvdHJhY2UucGwgfCA0ICsrKy0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9zY3JpcHRzL3RyYWNlLnBsIGIvc2NyaXB0cy90cmFjZS5wbAo+IGluZGV4IDA2OGVlZTY4YjMw
Yy4uZWE2YzY2NzY5NmY0IDEwMDc1NQo+IC0tLSBhL3NjcmlwdHMvdHJhY2UucGwKPiArKysgYi9z
Y3JpcHRzL3RyYWNlLnBsCj4gQEAgLTM3OCw2ICszNzgsOCBAQCB3aGlsZSAoPD4pIHsKPiAgIAkJ
JGsgPSAnZ2xvYmFsJyBpZiAkayBlcSAnZ2xvYmFsX3NlcW5vJzsKPiAgIAkJY2hvcCAkdiBpZiBz
dWJzdHIoJHYsIC0xLCAxKSBlcSAnLCc7Cj4gICAJCSR0cHska30gPSAkdjsKPiArCj4gKwkJJHRw
eydyaW5nJ30gPSAkdHB7J2VuZ2luZSd9IGlmICRrIGVxICdlbmdpbmUnOwo+ICAgCX0KPiAgIAo+
ICAgCW5leHQgaWYgZXhpc3RzICR0cHsncmluZyd9IGFuZCBleGlzdHMgJGlnbm9yZV9yaW5neyR0
cHsncmluZyd9fTsKPiBAQCAtNjMxLDcgKzYzMyw3IEBAIGZvcmVhY2ggbXkgJGdpZCAoc29ydCBr
ZXlzICVyaW5ncykgewo+ICAgCj4gICAJIyBFeHRyYWN0IGFsbCBHUFUgYnVzeSBpbnRlcnZhbHMg
YW5kIHNvcnQgdGhlbS4KPiAgIAlmb3JlYWNoIG15ICRrZXkgKEBzb3J0ZWRfa2V5cykgewo+IC0J
CW5leHQgdW5sZXNzICRkYnska2V5fS0+eydyaW5nJ30gPT0gJHJpbmc7Cj4gKwkJbmV4dCB1bmxl
c3MgJGRieyRrZXl9LT57J3JpbmcnfSBlcSAkcmluZzsKPiAgIAkJcHVzaCBAc18sICRkYnska2V5
fS0+eydzdGFydCd9Owo+ICAgCQlwdXNoIEBlXywgJGRieyRrZXl9LT57J2VuZCd9Owo+ICAgCQlk
aWUgaWYgJGRieyRrZXl9LT57J3N0YXJ0J30gPiAkZGJ7JGtleX0tPnsnZW5kJ307CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
