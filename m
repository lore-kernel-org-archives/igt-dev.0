Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180228153506.13035-1-tvrtko.ursulin@linux.intel.com>
References: <20180228110829.12126-1-tvrtko.ursulin@linux.intel.com>
 <20180228153506.13035-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <151989193999.32001.6337987697128867059@mail.alporthouse.com>
Date: Thu, 01 Mar 2018 08:12:19 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2] lib/igt_pm: Restore
 runtime pm state on test exit
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
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMi0yOCAxNTozNTowNikKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFNvbWUgdGVzdHMgKHRo
ZSBvbmVzIHdoaWNoIGNhbGwgaWd0X3NldHVwX3J1bnRpbWVfcG0gYW5kCj4gaWd0X3BtX2VuYWJs
ZV9hdWRpb19ydW50aW1lX3BtKSBjaGFuZ2UgZGVmYXVsdCBzeXN0ZW0gY29uZmlndXJhdGlvbiBh
bmQKPiBuZXZlciByZXN0b3JlIGl0Lgo+IAo+IFRoZSBjb25maWd1cmVkIHJ1bnRpbWUgc3VzcGVu
ZCBpcyBhZ2dyZXNzaXZlIGFuZCBtYXkgaW5mbHVlbmNlIGJlaGF2aW91cgo+IG9mIHN1YnNlcXVl
bnQgdGVzdHMsIHNvIGl0IGlzIGJldHRlciB0byByZXN0b3JlIHRvIHByZXZpb3VzIHZhbHVlcyBv
biB0ZXN0Cj4gZXhpdC4KPiAKPiBUaGlzIHdheSBzeXN0ZW0gYmVoYXZpb3VyLCB3aXRoIHJlZ2Fy
ZHMgdG8gYSByYW5kb20gc2VxdWVuY2Ugb2YgZXhlY3V0ZWQKPiB0ZXN0cywgd2lsbCBiZSBtb3Jl
IGNvbnNpc3RlbnQgZnJvbSBvbmUgcnVuIHRvIGFub3RoZXIuCj4gCj4gdjI6IFJlYWQgZmFpbHVy
ZSBtZWFucyBubyBydW50aW1lIHBtIHN1cHBvcnQgc28gZG9uJ3QgYXNzZXJ0IG9uIGl0Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+
Cj4gQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+ICMgdjEKUmV2aWV3ZWQtYnk6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
