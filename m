Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <73df9149-e9a2-8fc7-ba53-073ca496d5aa@linux.intel.com>
References: <20190627125521.10782-1-tvrtko.ursulin@linux.intel.com>
 <156164078479.9225.15669406077978719204@skylake-alporthouse-com>
 <73df9149-e9a2-8fc7-ba53-073ca496d5aa@linux.intel.com>
Message-ID: <156164439534.9225.10573719047261245304@skylake-alporthouse-com>
Date: Thu, 27 Jun 2019 15:06:35 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Silence Valgrind warning in
 synce_fence_status
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

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNi0yNyAxNDo1OToxMCkKPiAKPiBPbiAyNy8w
Ni8yMDE5IDE0OjA2LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPj4gKyAgICAgICBWRyhWQUxHUklO
RF9NQUtFX01FTV9ERUZJTkVEKCZmZW5jZV9pbmZvLCBzaXplb2YoZmVuY2VfaW5mbykpKTsKPiA+
IAo+ID4gTW9yZSBmdW4gd291bGQgYmUgdG8KPiA+IAo+ID4gc3RydWN0IHN5bmNfZmVuY2VfaW5m
byBmZW5jZV9pbmZvID0geyAuc3RhdHVzID0gLUVOT1NZUyB9Owo+ID4gCj4gPiBTbyB0aGF0IHZh
bGdyaW5kIGtub3dzIGl0IGlzIGluaXRpYWxpc2VkIGFuZCB3ZSByZWxpYWJseSByZXBvcnQgYW4g
ZXJyb3IKPiA+IGlmIHRoZSBrZXJuZWwgZmFpbHMgdG8gZmlsbCBpbiB0aGUgc3RydWN0Lgo+IAo+
IC4uLiBzdXJlLCB0aGlzIGlzIGFsc28gb2theS4gRm9yIG1lIC1FTk9TWVMgaXMgbm90IHN0cmlj
dGx5IG5lZWRlZCBhdCAKPiB0aGlzIGxldmVsLiBJdCB3b3VsZCBiZSBtb3JlIG9mIGEgdW5pdCB0
ZXN0IGZvciB0aGUgaW9jdGwsIG5vdCBiZWxvbmdpbmcgCj4gdG8gdGhlIGxpYnJhcnkgaGVscGVy
LCBidXQgaXQgaXMgYWxzbyBmaW5lIHRvIGluamVjdCBzb21lIG1vcmUgZXhwbGljaXQgCj4gdHJh
c2ggc28gaXQgY2FuIGJlIGNhdWdodCBldmVuIGlmIHRoZXJlIGFyZSBubyBzcGVjaWZpYyB1bml0
IHRlc3RzLgo+IAo+IEkgZG9uJ3QgYWxzbyBzZWUgYSBwcm9ibGVtIHdpdGggVmFsZ3JpbmQgYW5u
b3RhdGlvbi4gSXQgZG9lc24ndCBoaWRlIAo+IGFueXRoaW5nLCBub3IgZG9lcyBpdCBzYW5pdGlz
ZXMuIEJ1dCB5ZXMsIGl0IGlzIG5vdCBuZWVkZWQgaWYgd2UgZ28gZm9yIAo+IC1FTk9TWVMgdHJp
Y2suCgpUaGF0J3MgYWxsIEkgd2FzIHRoaW5raW5nLCB0d28gYmlyZHMgb25lIHN0b25lLiBJIHRo
aW5rIGl0IGlzIGEgYm9udXMgaWYKd2UgZG9uJ3QgcGFwZXIgb3ZlciB0aGUga2VybmVsIHJhbmRv
bWx5IHNlcnZpbmcgdXAgZ2FyYmFnZSAtLSBidXQgYXQgdGhlCnNhbWUgdGltZSByYW5kb20gZmFp
bHVyZXMgYXJlIG5vdCB0aGUgZWFzaWVzdCB0byBkZWJ1Zy4gQnV0IGF0IGxlYXN0IHRoZXkKc2Vy
dmUgYXMgY2FuYXJpZXMuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXY=
