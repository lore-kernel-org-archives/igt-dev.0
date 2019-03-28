Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E591F6E46B
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2019 18:25:20 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190328175450.8370-1-ville.syrjala@linux.intel.com>
References: <20190328175450.8370-1-ville.syrjala@linux.intel.com>
Message-ID: <155379750421.24691.2244143803211785340@skylake-alporthouse-com>
Date: Thu, 28 Mar 2019 18:25:04 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: Don't use blitter for
 large buffers
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE5LTAzLTI4IDE3OjU0OjQ5KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gVGhlIGJsaXR0
ZXIgc3RyaWRlIGlzIGxpbWl0ZWQgdG8gPDMyay4gRmFsbCBiYWNrIHRvIGd0dCBtbWFwIG9yCj4g
cmVuZGVyY29weSBpZiB3ZSdyZSBhYm91dCB0byBleGNlZWQgdGhhdC4KPiAKPiBOb3QgcXVpdGUg
c3VyZSB3aHkgd2UncmUgbm90IGp1c3QgdXNpbmcgZ3R0IG1tYXAgZm9yIFkgdGlsaW5nCj4gYWx3
YXlzLiBCdXQgbGV0J3Mga2VlcCBpdCBsaWtlIHRoYXQgZm9yIG5vdy4KPiAKPiB2MjogVXNlIHJl
bmRlcmNvcHkgYXMgdGhlIGZhbGxiYWNrIGZvciBZZgo+IAo+IENjOiBEaGluYWthcmFuIFBhbmRp
eWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIv
aWd0X2ZiLmMgfCAyNSArKysrKysrKysrKysrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIv
aWd0X2ZiLmMgYi9saWIvaWd0X2ZiLmMKPiBpbmRleCBmY2Q3YzRjNWQxODcuLjhiNmFkZjU1YTMz
OCAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X2ZiLmMKPiArKysgYi9saWIvaWd0X2ZiLmMKPiBAQCAt
MTUwMiw2ICsxNTAyLDIwIEBAIHN0cnVjdCBmYl9ibGl0X3VwbG9hZCB7Cj4gICAgICAgICBzdHJ1
Y3QgaW50ZWxfYmF0Y2hidWZmZXIgKmJhdGNoOwo+ICB9Owo+ICAKPiArc3RhdGljIGJvb2wgdXNl
X3JlbmRlcmNvcHkoY29uc3Qgc3RydWN0IGlndF9mYiAqZmIpCj4gK3sKPiArICAgICAgIHJldHVy
biBpc19jY3NfbW9kaWZpZXIoZmItPm1vZGlmaWVyKSB8fAo+ICsgICAgICAgICAgICAgICAoZmIt
Pm1vZGlmaWVyID09IEk5MTVfRk9STUFUX01PRF9ZZl9USUxFRCAmJgo+ICsgICAgICAgICAgICAg
ICAgZmItPnN0cmlkZXNbMF0gPj0gMzI3NjgpOwoKQW5kIHByb2JhYmx5IHdpc2UgdG8gYXNzZXJ0
IDw9IDI1NmsuCgo+ICsKPiArc3RhdGljIGJvb2wgdXNlX2JsaXR0ZXIoY29uc3Qgc3RydWN0IGln
dF9mYiAqZmIpCj4gK3sKPiArICAgICAgIHJldHVybiAoZmItPm1vZGlmaWVyID09IEk5MTVfRk9S
TUFUX01PRF9ZX1RJTEVEIHx8Cj4gKyAgICAgICAgICAgICAgIGZiLT5tb2RpZmllciA9PSBJOTE1
X0ZPUk1BVF9NT0RfWWZfVElMRUQpICYmCj4gKyAgICAgICAgICAgICAgIGZiLT5zdHJpZGVzWzBd
IDwgMzI3Njg7CgozMmsgZHdvcmRzIGlzIHRoZSBsaW1pdCBmb3IgdGlsZWQgYmxpdHMgKG9uIGdl
bjQrKS4gSSBwcmVzdW1lIHN0cmlkZXNbXQppcyBpbiBieXRlcy4KLUNocmlzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
