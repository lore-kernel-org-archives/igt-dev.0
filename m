Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF936E1EF
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Mar 2018 14:30:37 +0000 (UTC)
Date: Fri, 16 Mar 2018 16:30:33 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180316143033.GI5453@intel.com>
References: <1521206427-28202-1-git-send-email-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1521206427-28202-1-git-send-email-vidya.srinivas@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] [i-g-t] tests/kms_plane_scaling: fb
 height to be multiplier of 4 for YUV 420 planar
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
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org, sunil.kamath@intel.com, ville.syrjala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBNYXIgMTYsIDIwMTggYXQgMDY6NTA6MjdQTSArMDUzMCwgVmlkeWEgU3Jpbml2YXMg
d3JvdGU6Cj4gRm9yIEdlbjksIEdMSywgQ05MLCBHTFY6IERpc3BsYXkgV0EgMTEwNjoKPiBEaXNw
bGF5IGNvcnJ1cHRpb24vY29sb3Igc2hpZnQgb2JzZXJ2ZWQgd2hlbiB1c2luZyBOVjEyIHdpdGgK
PiAyNzAgcm90YXRpb24gb3IgOTAgcm90YXRpb24gKyBob3Jpem9udGFsIGZsaXAuCj4gV0E6IE5W
MTIgd2l0aCAyNzAgcm90YXRpb24gb3IgOTAgcm90YXRpb24gKyBob3Jpem9udGFsIGZsaXAgcmVx
dWlyZXMKPiB0aGUgcHJvZ3JhbW1lZCBwbGFuZSBoZWlnaHQgdG8gYmUgYSBtdWx0aXBsZSBvZiA0
Lgo+IFBhdGNoIGNoYW5nZXMgdGhlIE5WMTIgYnVmZmVyIHRvIDIweDIwIHRvIG1haW50YWluIGJv
dGgKPiBmYiA+IG1pbiBmYiBhbmQgYWxzbyBtdWx0aXBsaWVyIG9mIDQKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IFZpZHlhIFNyaW5pdmFzIDx2aWR5YS5zcmluaXZhc0BpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3Rz
L2ttc19wbGFuZV9zY2FsaW5nLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcGxhbmVfc2Nh
bGluZy5jIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwo+IGluZGV4IDM2ZmNmYzAuLmI5NGQ3
ODUgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwo+ICsrKyBiL3Rlc3Rz
L2ttc19wbGFuZV9zY2FsaW5nLmMKPiBAQCAtMTMyLDcgKzEzMiw3IEBAIHN0YXRpYyB2b2lkIGNo
ZWNrX3NjYWxpbmdfcGlwZV9wbGFuZV9yb3QoZGF0YV90ICpkLCBpZ3RfcGxhbmVfdCAqcGxhbmUs
Cj4gIAkvKiBjcmVhdGUgYnVmZmVyIGluIHRoZSByYW5nZSBvZiAgbWluIGFuZCBtYXggc291cmNl
IHNpZGUgbGltaXQuKi8KPiAgCXdpZHRoID0gaGVpZ2h0ID0gOTsKPiAgCWlmIChwaXhlbF9mb3Jt
YXQgPT0gRFJNX0ZPUk1BVF9OVjEyKQo+IC0JCXdpZHRoID0gaGVpZ2h0ID0gMTc7Cj4gKwkJd2lk
dGggPSBoZWlnaHQgPSAyMDsKCldoeSAyMCBhbmQgbm90IDE2PyBJIHRob3VnaHQgMTYgd2FzIHRo
ZSBsaW1pdD8KCj4gIAlpZ3RfY3JlYXRlX2NvbG9yX2ZiKGRpc3BsYXktPmRybV9mZCwgd2lkdGgs
IGhlaWdodCwKPiAgCQkgICAgICAgcGl4ZWxfZm9ybWF0LCB0aWxpbmcsIDAuMCwgMS4wLCAwLjAs
ICZkLT5mYlswXSk7Cj4gIAlpZ3RfcGxhbmVfc2V0X2ZiKHBsYW5lLCAmZC0+ZmJbMF0pOwo+IC0t
IAo+IDIuNy40Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2CgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsIE9UQwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
