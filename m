Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EE16E511
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2019 15:22:31 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191014150817.18549-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20191014150817.18549-1-ville.syrjala@linux.intel.com>
Message-ID: <157106654582.21259.3011457382851030993@skylake-alporthouse-com>
Date: Mon, 14 Oct 2019 16:22:25 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Add igt_trace()
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

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE5LTEwLTE0IDE2OjA4OjE3KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gQWRkIGlndF90
cmFjZSgpIHdoaWNoIGNhbiBiZSB1c2VkIHRvIGluamVjdCBtZXNzYWdlcyBpbnRvIHRoZQo+IGtl
cm5lbCBmdHJhY2UgYnVmZmVyIHZpYSB0aGUgdHJhY2VfbWFya2VyIGZpbGUuIFF1aXRlIHVzZWZ1
bCB3aGVuCj4gdHJ5aW5nIHRvIGNvcnJlbGF0ZSB0ZXN0IGNhc2UgYWN0aXZpdHkgd2l0aCBrZXJu
ZWwgdHJhY2Vwb2ludHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgbGliL2lndF9jb3JlLmMgfCAxNiAr
KysrKysrKysrKysrKysrCj4gIGxpYi9pZ3RfY29yZS5oIHwgIDkgKysrKysrKysrCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2Nv
cmUuYyBiL2xpYi9pZ3RfY29yZS5jCj4gaW5kZXggOTQwOTEzYzE4NWVlLi42YTljMDM2MzkzYWMg
MTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9jb3JlLmMKPiArKysgYi9saWIvaWd0X2NvcmUuYwo+IEBA
IC00MjEsNiArNDIxLDIyIEBAIHZvaWQgaWd0X2ttc2coY29uc3QgY2hhciAqZm9ybWF0LCAuLi4p
Cj4gICAgICAgICBmY2xvc2UoZmlsZSk7Cj4gIH0KPiAgCj4gK3ZvaWQgaWd0X3RyYWNlKGNvbnN0
IGNoYXIgKmZvcm1hdCwgLi4uKQo+ICt7Cj4gKyAgICAgICB2YV9saXN0IGFwOwo+ICsgICAgICAg
RklMRSAqZmlsZTsKCldlIGNvdWxkIGRvCgpiYXNlID0gaWd0X2RlYnVnZnNfbW91bnQoKTsKc25w
cmludGYoYnVmLCBzaXplb2YoYnVmKSwgIiVzL3RyYWNpbmcvdHJhY2VfbWFya2VyIiwgYmFzZSk7
Cgp0byBiZSBwYXJhbm9pZC4KCj4gKwo+ICsgICAgICAgZmlsZSA9IGZvcGVuKCIvc3lzL2tlcm5l
bC9kZWJ1Zy90cmFjaW5nL3RyYWNlX21hcmtlciIsICJ3Iik7Cj4gKyAgICAgICBpZiAoZmlsZSA9
PSBOVUxMKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgICAgdmFfc3RhcnQo
YXAsIGZvcm1hdCk7Cj4gKyAgICAgICB2ZnByaW50ZihmaWxlLCBmb3JtYXQsIGFwKTsKPiArICAg
ICAgIHZhX2VuZChhcCk7CgpXcml0ZXMgdG8gdHJhY2VfbWFya2VyIGFyZSBjb3BpZWQgdmVyYmF0
aW0gKHdpdGggYSB0cmFpbGluZyAnXG4nIGlmCmxhY2tpbmcpLgoKPiArCj4gKyAgICAgICBmY2xv
c2UoZmlsZSk7Cj4gK30KCk1lY2hhbmljYWxseSBsb29rcyBmaW5lLApSZXZpZXdlZC1ieTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1DaHJpcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
