Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <b21d4eb9-4fd3-cd41-d73f-437b930c7e0d@linux.intel.com>
References: <20180228110829.12126-1-tvrtko.ursulin@linux.intel.com>
 <151981633284.21577.15318265579483089548@mail.alporthouse.com>
 <b21d4eb9-4fd3-cd41-d73f-437b930c7e0d@linux.intel.com>
Message-ID: <151982086599.21577.13165532006541490280@mail.alporthouse.com>
Date: Wed, 28 Feb 2018 12:27:45 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] lib/igt_pm: Restore runtime
 pm state on test exit
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMi0yOCAxMTozODowMSkKPiAKPiBPbiAyOC8w
Mi8yMDE4IDExOjEyLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFR2cnRrbyBVcnN1
bGluICgyMDE4LTAyLTI4IDExOjA4OjI5KQo+ID4+IEZyb206IFR2cnRrbyBVcnN1bGluIDx0dnJ0
a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gPj4KPiA+PiBTb21lIHRlc3RzICh0aGUgb25lcyB3aGlj
aCBjYWxsIGlndF9zZXR1cF9ydW50aW1lX3BtIGFuZAo+ID4+IGlndF9wbV9lbmFibGVfYXVkaW9f
cnVudGltZV9wbSkgY2hhbmdlIGRlZmF1bHQgc3lzdGVtIGNvbmZpZ3VyYXRpb24gYW5kCj4gPj4g
bmV2ZXIgcmVzdG9yZSBpdC4KPiA+Pgo+ID4+IFRoZSBjb25maWd1cmVkIHJ1bnRpbWUgc3VzcGVu
ZCBpcyBhZ2dyZXNzaXZlIGFuZCBtYXkgaW5mbHVlbmNlIGJlaGF2aW91cgo+ID4+IG9mIHN1YnNl
cXVlbnQgdGVzdHMsIHNvIGl0IGlzIGJldHRlciB0byByZXN0b3JlIHRvIHByZXZpb3VzIHZhbHVl
cyBvbiB0ZXN0Cj4gPj4gZXhpdC4KPiA+Pgo+ID4+IFRoaXMgd2F5IHN5c3RlbSBiZWhhdmlvdXIs
IHdpdGggcmVnYXJkcyB0byBhIHJhbmRvbSBzZXF1ZW5jZSBvZiBleGVjdXRlZAo+ID4+IHRlc3Rz
LCB3aWxsIGJlIG1vcmUgY29uc2lzdGVudCBmcm9tIG9uZSBydW4gdG8gYW5vdGhlci4KPiA+IAo+
ID4gT3RvaCwgaWYgYmVoYXZpb3VyIGNoYW5nZXMgaW4gc3Vic2VxdWVudCB0ZXN0cywgd2UgbGlr
ZWx5IGhhdmUgYSBsYWNrIG9mCj4gPiB0ZXN0aW5nIDooCj4gCj4gWWVhaCwgYW5kIEkgYW0gbm90
IHNheWluZyBpdCBkb2VzIC0gaGF2ZW4ndCBzcG90dGVkIGFueXRoaW5nIGxpa2UgdGhhdCwgCj4g
anVzdCB0aGF0IGl0IGxlYXZlcyB0aGUgYXV0by1zdXNwZW5kIHdpdGggemVybyBkZWxheSBhZnRl
cndhcmRzLCAKPiBjb21wYXJlZCB0byBvdGhlcndpc2UgZGVmYXVsdCAxMHMuCj4gCj4gTWF5YmUg
aXQgaXMgZ29vZCBmb3IgY292ZXJhZ2UsIGV2ZW4gd2l0aCB0aGUgZG93bnNpZGUgb2YgcmFuZG9t
bmVzcyAKPiBjb25zaWRlcmluZyBzaGFyZCBydW5zLCBvciBtYXliZSBpdCBuZWVkcyB0byBiZSBt
b3JlIGV4cGxpY2l0LgoKSSBhY3R1YWxseSB0aG91Z2h0IChvciBhdCBsZWFzdCBwaWNrZWQgdXAg
dGhlIGlkZWEpIHdlIGVuYWJsZWQgMAphdXRvc3VzcGVuZCBkZWxheSB0aHJvdWdob3V0IGlndC4g
QW5kIHRoYXQgaXQncyBvbmx5IGJlY2F1c2UgbW9zdCBvZiB0aW1lCndlIGhhdmUgYSBkaXNwbGF5
IGNvbm5lY3RlZCB0aGF0IHByZXZlbnRzIHJwbSBtYWRuZXNzLgotQ2hyaXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
