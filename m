Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 30 Aug 2019 08:58:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20190830155807.GX13677@mdroper-desk.amr.corp.intel.com>
References: <20190829164707.30012-1-matthew.d.roper@intel.com>
 <af4dba4e9b212257fd95c5cc4cbfe3358db095cb.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af4dba4e9b212257fd95c5cc4cbfe3358db095cb.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: Skip on
 platforms without atomic modesetting
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
To: "Ser, Simon" <simon.ser@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMTI6Mjc6NDVBTSAtMDcwMCwgU2VyLCBTaW1vbiB3cm90
ZToKPiBPbiBUaHUsIDIwMTktMDgtMjkgYXQgMDk6NDcgLTA3MDAsIE1hdHQgUm9wZXIgd3JvdGU6
Cj4gPiBUaGlzIHRlc3QgcGVyZm9ybXMgZGlzcGxheSB1cGRhdGVzIHZpYSBDT01NSVRfQVRPTUlD
LCBidXQgZmFpbHMgdG8gY2hlY2sKPiA+IHRoYXQgdGhlIHBsYXRmb3JtIGJlaW5nIHRlc3RlZCBh
Y3R1YWxseSBzdXBwb3J0cyBhdG9taWMuICBUaGlzIGNhdXNlcwo+ID4gZmFpbHVyZXMgb24gc29t
ZSBvZiBvdXIgb2xkZXIgcHJlLWdlbjUgcGxhdGZvcm1zLgo+ID4gCj4gPiBCdWd6aWxsYTogaHR0
cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA2MDEyCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgo+IAo+IFJl
dmlld2VkLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+CgpQdXNoZWQsIHRoYW5r
cyBmb3IgdGhlIHJldmlldy4KCgpNYXR0Cgo+IAo+ID4gLS0tCj4gPiAgdGVzdHMva21zX3JvdGF0
aW9uX2NyYy5jIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcm90YXRpb25fY3JjLmMgYi90ZXN0cy9rbXNfcm90
YXRpb25fY3JjLmMKPiA+IGluZGV4IGZlNDA0ODEwLi42NjhjMTczMiAxMDA2NDQKPiA+IC0tLSBh
L3Rlc3RzL2ttc19yb3RhdGlvbl9jcmMuYwo+ID4gKysrIGIvdGVzdHMva21zX3JvdGF0aW9uX2Ny
Yy5jCj4gPiBAQCAtNzgwLDYgKzc4MCw3IEBAIGlndF9tYWluCj4gPiAgCQlpZ3RfcmVxdWlyZV9w
aXBlX2NyYyhkYXRhLmdmeF9mZCk7Cj4gPiAgCj4gPiAgCQlpZ3RfZGlzcGxheV9yZXF1aXJlKCZk
YXRhLmRpc3BsYXksIGRhdGEuZ2Z4X2ZkKTsKPiA+ICsJCWlndF9yZXF1aXJlKGRhdGEuZGlzcGxh
eS5pc19hdG9taWMpOwo+ID4gIAl9Cj4gPiAgCj4gPiAgCWZvciAoc3VidGVzdCA9IHN1YnRlc3Rz
OyBzdWJ0ZXN0LT5yb3Q7IHN1YnRlc3QrKykgewoKLS0gCk1hdHQgUm9wZXIKR3JhcGhpY3MgU29m
dHdhcmUgRW5naW5lZXIKVlRULU9TR0MgUGxhdGZvcm0gRW5hYmxlbWVudApJbnRlbCBDb3Jwb3Jh
dGlvbgooOTE2KSAzNTYtMjc5NQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXY=
