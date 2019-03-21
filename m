Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E706E167
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 18:26:28 +0000 (UTC)
Date: Thu, 21 Mar 2019 20:26:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190321182625.GK3888@intel.com>
References: <20190321135714.30854-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190321135714.30854-1-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Minimum width
 and height for planar YUV formats on i915 devices
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBNYXIgMjEsIDIwMTkgYXQgMDM6NTc6MTRQTSArMDIwMCwgTWlrYSBLYWhvbGEgd3Jv
dGU6Cj4gVXNlIG1pbmltdW0gb2YgMTZ4MTYgc2l6ZSBmb3IgaTkxNSBkZXZpY2VzIG9ubHkgYXMg
b3RoZXIgSFcncyBtYXkgaGF2ZSBkaWZmZXJlbnQgbGltaXRhdGlvbnMuCj4gVGhlIGRlZmF1bHQg
aXMgOHg4LgoKSSBndWVzcyB0aGUgOHg4IGlzIGVxdWFsbHkgYXJiaXRyYXJ5IGZvciBvdGhlciBk
ZXZpY2VzLiBCdXQgbWF5YmUgaXQncwphIGdvb2QgZW5vdWdoIGRlZmF1bHQ/CgpSZXZpZXdlZC1i
eTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCj4gCj4g
U3VnZ2VzdGVkLWJ5OiBWaWxsZSBTeXJqYWxhIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPgo+
IC0tLQo+ICB0ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zX3BsYW5lX3NjYWxpbmcuYyBiL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMKPiBpbmRleCAw
MWY1ZjdjOS4uMTBjODUyZDUgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcu
Ywo+ICsrKyBiL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMKPiBAQCAtMTQ5LDcgKzE0OSw3IEBA
IHN0YXRpYyB2b2lkIGNoZWNrX3NjYWxpbmdfcGlwZV9wbGFuZV9yb3QoZGF0YV90ICpkLCBpZ3Rf
cGxhbmVfdCAqcGxhbmUsCj4gIAo+ICAJLyogY3JlYXRlIGJ1ZmZlciBpbiB0aGUgcmFuZ2Ugb2Yg
IG1pbiBhbmQgbWF4IHNvdXJjZSBzaWRlIGxpbWl0LiovCj4gIAl3aWR0aCA9IGhlaWdodCA9IDg7
Cj4gLQlpZiAoaXNfcGxhbmFyX3l1dl9mb3JtYXQocGl4ZWxfZm9ybWF0KSkKPiArCWlmIChpc19p
OTE1X2RldmljZShkLT5kcm1fZmQpICYmIGlzX3BsYW5hcl95dXZfZm9ybWF0KHBpeGVsX2Zvcm1h
dCkpCj4gIAkJd2lkdGggPSBoZWlnaHQgPSAxNjsKPiAgCWlndF9jcmVhdGVfY29sb3JfZmIoZGlz
cGxheS0+ZHJtX2ZkLCB3aWR0aCwgaGVpZ2h0LAo+ICAJCSAgICAgICBwaXhlbF9mb3JtYXQsIHRp
bGluZywgMC4wLCAxLjAsIDAuMCwgJmQtPmZiWzBdKTsKPiAtLSAKPiAyLjE3LjEKCi0tIApWaWxs
ZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
