Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190228141828.2567-2-tvrtko.ursulin@linux.intel.com>
References: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
 <20190228141828.2567-2-tvrtko.ursulin@linux.intel.com>
Message-ID: <155136395323.5847.13177410525767591837@skylake-alporthouse-com>
Date: Thu, 28 Feb 2019 14:25:53 +0000
Subject: Re: [Intel-gfx] [PATCH i-g-t 2/5] gem_wsim: Round mmap to page size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wMi0yOCAxNDoxODoyNSkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IG1tYXAoMikgbWFuZGF0
ZXMgc2l6ZSBpcyBwYWdlIGFsaWduZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3Vs
aW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KPiAtLS0KPiAgYmVuY2htYXJrcy9nZW1fd3Np
bS5jIHwgNyArKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2JlbmNobWFya3MvZ2VtX3dzaW0uYyBiL2JlbmNo
bWFya3MvZ2VtX3dzaW0uYwo+IGluZGV4IDBhNWFiYzA4ZDhjMi4uNTdjZWI5ODNjZjgyIDEwMDY0
NAo+IC0tLSBhL2JlbmNobWFya3MvZ2VtX3dzaW0uYwo+ICsrKyBiL2JlbmNobWFya3MvZ2VtX3dz
aW0uYwo+IEBAIC03MzcsNiArNzM3LDcgQEAgaW5pdF9iYihzdHJ1Y3Qgd19zdGVwICp3LCB1bnNp
Z25lZCBpbnQgZmxhZ3MpCj4gIHsKPiAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGludCBhcmJfcGVy
aW9kID0KPiAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfYmJfc3oody0+cHJlZW1wdF91cykg
LyBzaXplb2YodWludDMyX3QpOwo+ICsgICAgICAgY29uc3QgdW5zaWduZWQgaW50IG1tYXBfbGVu
ID0gQUxJR04ody0+YmJfc3osIDQwOTYpOwo+ICAgICAgICAgdW5zaWduZWQgaW50IGk7Cj4gICAg
ICAgICB1aW50MzJfdCAqcHRyOwoKWW91IG9ubHkgbmVlZCB0byBkbyBpdCBmb3IKCnd3LT5iYl9z
eiA9IEFMSUdOKGdldF9iYl9zeigpLCA0MDk2KTsKCkFsbCBiYXRjaCBsZW5ndGhzIGFyZSBzdGFy
dCA9IHd3LT5iYl9zeiAtIGdldF9iYl9zeigpIGFuZCBzbyByZW1haW4KY29ycmVjdC4gUmlnaHQ/
Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJ
bnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZng=
