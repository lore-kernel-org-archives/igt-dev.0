Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F5F6E1FB
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2019 07:13:00 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Fri, 22 Mar 2019 07:12:56 +0000
Message-ID: <56e1a1aaa3b77a97d50c2ea456cdea258f02e459.camel@intel.com>
References: <20190321135714.30854-1-mika.kahola@intel.com>
 <20190321182625.GK3888@intel.com>
In-Reply-To: <20190321182625.GK3888@intel.com>
Content-Language: en-US
Content-ID: <5B9897538B9E8B418C450F8CB3E0130C@intel.com>
MIME-Version: 1.0
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
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UHVzaGVkIQoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IQoKQ2hlZXJzLApNaWthCgpPbiBUaHUsIDIw
MTktMDMtMjEgYXQgMjA6MjYgKzAyMDAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiBPbiBUaHUs
IE1hciAyMSwgMjAxOSBhdCAwMzo1NzoxNFBNICswMjAwLCBNaWthIEthaG9sYSB3cm90ZToKPiA+
IFVzZSBtaW5pbXVtIG9mIDE2eDE2IHNpemUgZm9yIGk5MTUgZGV2aWNlcyBvbmx5IGFzIG90aGVy
IEhXJ3MgbWF5Cj4gPiBoYXZlIGRpZmZlcmVudCBsaW1pdGF0aW9ucy4KPiA+IFRoZSBkZWZhdWx0
IGlzIDh4OC4KPiAKPiBJIGd1ZXNzIHRoZSA4eDggaXMgZXF1YWxseSBhcmJpdHJhcnkgZm9yIG90
aGVyIGRldmljZXMuIEJ1dCBtYXliZQo+IGl0J3MKPiBhIGdvb2QgZW5vdWdoIGRlZmF1bHQ/Cj4g
Cj4gUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+Cj4gCj4gPiAKPiA+IFN1Z2dlc3RlZC1ieTogVmlsbGUgU3lyamFsYSA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8bWlr
YS5rYWhvbGFAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgdGVzdHMva21zX3BsYW5lX3NjYWxpbmcu
YyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMgYi90ZXN0
cy9rbXNfcGxhbmVfc2NhbGluZy5jCj4gPiBpbmRleCAwMWY1ZjdjOS4uMTBjODUyZDUgMTAwNjQ0
Cj4gPiAtLS0gYS90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCj4gPiArKysgYi90ZXN0cy9rbXNf
cGxhbmVfc2NhbGluZy5jCj4gPiBAQCAtMTQ5LDcgKzE0OSw3IEBAIHN0YXRpYyB2b2lkIGNoZWNr
X3NjYWxpbmdfcGlwZV9wbGFuZV9yb3QoZGF0YV90Cj4gPiAqZCwgaWd0X3BsYW5lX3QgKnBsYW5l
LAo+ID4gIAo+ID4gIAkvKiBjcmVhdGUgYnVmZmVyIGluIHRoZSByYW5nZSBvZiAgbWluIGFuZCBt
YXggc291cmNlIHNpZGUKPiA+IGxpbWl0LiovCj4gPiAgCXdpZHRoID0gaGVpZ2h0ID0gODsKPiA+
IC0JaWYgKGlzX3BsYW5hcl95dXZfZm9ybWF0KHBpeGVsX2Zvcm1hdCkpCj4gPiArCWlmIChpc19p
OTE1X2RldmljZShkLT5kcm1fZmQpICYmCj4gPiBpc19wbGFuYXJfeXV2X2Zvcm1hdChwaXhlbF9m
b3JtYXQpKQo+ID4gIAkJd2lkdGggPSBoZWlnaHQgPSAxNjsKPiA+ICAJaWd0X2NyZWF0ZV9jb2xv
cl9mYihkaXNwbGF5LT5kcm1fZmQsIHdpZHRoLCBoZWlnaHQsCj4gPiAgCQkgICAgICAgcGl4ZWxf
Zm9ybWF0LCB0aWxpbmcsIDAuMCwgMS4wLCAwLjAsICZkLT5mYlswXSk7Cj4gPiAtLSAKPiA+IDIu
MTcuMQo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
