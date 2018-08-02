Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180719093601.11788-1-tvrtko.ursulin@linux.intel.com>
 <20180719093601.11788-2-tvrtko.ursulin@linux.intel.com>
 <33c68593-3dd7-83d3-744a-1b9375b234e0@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <93e18332-3829-40b0-c140-5948583c26c7@linux.intel.com>
Date: Thu, 2 Aug 2018 11:29:15 +0100
MIME-Version: 1.0
In-Reply-To: <33c68593-3dd7-83d3-744a-1b9375b234e0@Intel.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/4] trace.pl: Context save
 only applies to last request of a bunch
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
To: John Harrison <John.C.Harrison@Intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDI3LzA3LzIwMTggMjI6MzcsIEpvaG4gSGFycmlzb24gd3JvdGU6Cj4gT24gNy8xOS8yMDE4
IDI6MzUgQU0sIFR2cnRrbyBVcnN1bGluIHdyb3RlOgo+PiBGcm9tOiBUdnJ0a28gVXJzdWxpbjx0
dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4+Cj4+IFNraXAgYWNjb3VudGluZyB0aGUgY29udGV4
dCBzYXZlIHRpbWUgZm9yIGFueXRoaW5nIGJ1dCB0aGUgbGFzdCByZXF1ZXN0IG9mCj4+IHRoZSBj
b2FsZXNjZWQgYnVuY2gsIGFuZCBhbHNvIHNraXAgZHJhd2luZyB0aG9zZSBib3hlcyBvbiB0aGUg
dGltZWxpbmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluPHR2cnRrby51cnN1
bGluQGludGVsLmNvbT4KPj4gLS0tCj4+ICAgc2NyaXB0cy90cmFjZS5wbCB8IDEwICsrKysrKyst
LS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
Pgo+Pgo+IE5vdCBzdXJlIGlmIHlvdSBhcmUgbm90IGdldHRpbmcgc29tZSBvZiBteSByZXBsaWVz
PyBJIGhhdmUgZGVmaW5pdGVseSAKPiBzZW50IGFuIFItQiB0byB0aGlzIHBhdGNoIGF0IGxlYXN0
IHR3aWNlIGFscmVhZHkuIE1heWJlIHRoZXkgYXJlIGdldHRpbmcgCj4gY2F1Z2h0IGJ5IHNvbWUg
a2luZCBvZiBtYWlsaW5nIGxpc3QgZmlsdGVyPyBJIGtub3cgeW91ciBwYXRjaGVzIGFwcGVhciAK
PiByYW5kb21seSBpbiBvbmUgb2YgdGhyZWUgbWFpbGJveGVzIGZvciBtZSAtIGluYm94LCBJR1Qg
b3IgSW50ZWxHRlggCj4gYWNjb3JkaW5nIHRvIHdoaWNoIHJ1bGUgaGFwcGVucyB0byB0YWtlIHBy
ZWNlZGVuY2Ugb24gYW55IGdpdmVuIHNlY29uZCAKPiA6KC4gQW55d2F5Li4uCj4gCj4gUmV2aWV3
ZWQtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+CgpUaGFua3Mh
CgpJIGxvb2tlZCBiYWNrd2FyZHMgYSBiaXQgYW5kIGl0IHNlZW1zIChmcm9tIG15IGVuZCBhdCBs
ZWFzdCEpIHRoYXQgb24gCnByZXZpb3VzIHR3byBvY2Nhc2lvbnMgeW91IGRpZCBhIHJlcGx5IGlu
c3RlYWQgb2YgcmVwbHkgdG8gYWxsIHNvIEkgCm1pc3NlZCBpdC4KClJlZ2FyZHMsCgpUdnJ0a28K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
