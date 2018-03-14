Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F2C6E0E4
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Mar 2018 14:44:32 +0000 (UTC)
Date: Wed, 14 Mar 2018 16:44:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180314144429.GF5453@intel.com>
References: <20180314112021.60224-1-maarten.lankhorst@linux.intel.com>
 <20180314112021.60224-3-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180314112021.60224-3-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] tests/kms_rmfb: Use
 for_each_pipe_with_single_output.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMTI6MjA6MThQTSArMDEwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gQSBzaW5nbGUgb3V0cHV0IG9uIGV2ZXJ5IHBpcGUgd2lsbCBkbyBmb3IgdGVz
dGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cgo+IC0tLQo+ICB0ZXN0cy9rbXNfcm1mYi5jIHwg
OCArKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcm1mYi5jIGIvdGVzdHMva21zX3JtZmIu
Ywo+IGluZGV4IGM5N2FkY2VlYTc2MS4uZjM0NjFjYzkxOWU5IDEwMDY0NAo+IC0tLSBhL3Rlc3Rz
L2ttc19ybWZiLmMKPiArKysgYi90ZXN0cy9rbXNfcm1mYi5jCj4gQEAgLTEyOSwxNSArMTI5LDEw
IEBAIHN0YXRpYyB2b2lkCj4gIHJ1bl9ybWZiX3Rlc3Qoc3RydWN0IHJtZmJfZGF0YSAqZGF0YSwg
Ym9vbCByZW9wZW4pCj4gIHsKPiAgCWlndF9vdXRwdXRfdCAqb3V0cHV0Owo+IC0JaW50IHZhbGlk
X3Rlc3RzID0gMDsKPiAgCWVudW0gcGlwZSBwaXBlOwo+ICAKPiAtCWZvcl9lYWNoX3BpcGVfd2l0
aF92YWxpZF9vdXRwdXQoJmRhdGEtPmRpc3BsYXksIHBpcGUsIG91dHB1dCkgewo+ICsJZm9yX2Vh
Y2hfcGlwZV93aXRoX3NpbmdsZV9vdXRwdXQoJmRhdGEtPmRpc3BsYXksIHBpcGUsIG91dHB1dCkK
PiAgCQl0ZXN0X3JtZmIoZGF0YSwgb3V0cHV0LCBwaXBlLCByZW9wZW4pOwo+IC0JCXZhbGlkX3Rl
c3RzID0gMTsKPiAtCX0KPiAtCj4gLQlpZ3RfcmVxdWlyZV9mKHZhbGlkX3Rlc3RzLCAibm8gdmFs
aWQgY3J0Yy9jb25uZWN0b3IgY29tYmluYXRpb25zIGZvdW5kXG4iKTsKPiAgfQo+ICAKPiAgaWd0
X21haW4KPiBAQCAtMTUyLDYgKzE0Nyw3IEBAIGlndF9tYWluCj4gIAkJa21zdGVzdF9zZXRfdnRf
Z3JhcGhpY3NfbW9kZSgpOwo+ICAKPiAgCQlpZ3RfZGlzcGxheV9pbml0KCZkYXRhLmRpc3BsYXks
IGRhdGEuZHJtX2ZkKTsKPiArCQlpZ3RfZGlzcGxheV9yZXF1aXJlX291dHB1dCgmZGF0YS5kaXNw
bGF5KTsKPiAgCX0KPiAgCj4gIAlpZ3Rfc3VidGVzdF9mKCJybWZiLWlvY3RsIikKPiAtLSAKPiAy
LjE2LjIKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
Ci0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwgT1RDCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
