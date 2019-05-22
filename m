Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190522150413.27697-1-tvrtko.ursulin@linux.intel.com>
References: <20190522150413.27697-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <155853770228.28319.16250706533744427369@skylake-alporthouse-com>
Date: Wed, 22 May 2019 16:08:22 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Fix pointer cast build issue
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNS0yMiAxNjowNDoxMykKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFVzZSBmcm9tX3VzZXJf
cG9pbnRlciB3aGVuIGNhc3RpbmcgX191NjQgdG8gYSBwb2ludGVyLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gQ2M6IEFuZGkg
U2h5dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvaTkxNS9nZW1fZW5naW5l
X3RvcG9sb2d5LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaTkxNS9nZW1fZW5naW5lX3RvcG9sb2d5
LmMgYi9saWIvaTkxNS9nZW1fZW5naW5lX3RvcG9sb2d5LmMKPiBpbmRleCBkZDI2ZmFlMDA4NTMu
LjdjYTM2MTY2ODdiOSAxMDA2NDQKPiAtLS0gYS9saWIvaTkxNS9nZW1fZW5naW5lX3RvcG9sb2d5
LmMKPiArKysgYi9saWIvaTkxNS9nZW1fZW5naW5lX3RvcG9sb2d5LmMKPiBAQCAtODEsNyArODEs
NyBAQCBzdGF0aWMgdm9pZCBjdHhfbWFwX2VuZ2luZXMoaW50IGZkLCBzdHJ1Y3QgaW50ZWxfZW5n
aW5lX2RhdGEgKmVkLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2k5
MTVfZ2VtX2NvbnRleHRfcGFyYW0gKnBhcmFtKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgaTkxNV9j
b250ZXh0X3BhcmFtX2VuZ2luZXMgKmVuZ2luZXMgPQo+IC0gICAgICAgICAgICAgICAgICAgICAg
IChzdHJ1Y3QgaTkxNV9jb250ZXh0X3BhcmFtX2VuZ2luZXMgKikgcGFyYW0tPnZhbHVlOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGZyb21fdXNlcl9wb2ludGVyKHBhcmFtLT52YWx1ZSk7CgpP
bmx5IGEgc2luZ2xlIHRhYiBpbmRlbnQgcmVxdWlyZWQuCgpSZXZpZXdlZC1ieTogQ2hyaXMgV2ls
c29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cgo+ICAgICAgICAgaW50IGkgPSAwOwo+ICAK
PiAgICAgICAgIGZvciAodHlwZW9mKGVuZ2luZXMtPmVuZ2luZXNbMF0pICpwID0KCkFuZCBzdHJ1
Y3QgaTkxNV9lbmdpbmVfY2xhc3NfaW5zdGFuY2Ugd2FzIGFkZGVkIHRvIG1ha2UgdGhpcyBmb3Io
KSBsb29wCm5pY2VyLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2
