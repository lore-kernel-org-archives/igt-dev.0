Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA34897C5
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2019 07:46:50 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Tue, 27 Aug 2019 07:46:48 +0000
Message-ID: <5b979337dee5e5e56dfee60af4b33f68961b6fc7.camel@intel.com>
References: <20190820141956.31508-1-matthew.d.roper@intel.com>
In-Reply-To: <20190820141956.31508-1-matthew.d.roper@intel.com>
Content-Language: en-US
Content-ID: <AA90186D19E0494488FC495EAF6E60B7@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_lowres: Skip if no
 suitable mode is possible
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA4LTIwIGF0IDA3OjE5IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBX
aGVuIGNob29zaW5nIGEgbG93IHJlc29sdXRpb24gbW9kZSB0byBzd2l0Y2ggdG8sIHdlIHNlYXJj
aCB0aGUNCj4gY29ubmVjdG9yJ3MgbW9kZSBsaXN0IGZvciBhIG1vZGUgdGhhdCdzIHNtYWxsIGVu
b3VnaCB0aGF0IGEgcGxhbmUNCj4gcG9zaXRpb25lZCBpbiB0aGUgYm90dG9tIGxlZnQgY29ybmVy
IG9mIHRoZSBzY3JlZW4gaW4gdGhlIG9yaWdpbmFsIG1vZGUNCj4gd2lsbCBiZSBmdWxseSBvZmZz
Y3JlZW4gaW4gdGhlIG5ldywgc21hbGxlciBtb2RlLiAgSG93ZXZlciBpZiBubw0KPiBzdWl0YWJs
ZSBtb2RlcyBhcmUgZm91bmQgaW4gdGhlIG1vZGVsaXN0LCB3ZSBibGluZGx5IGZhbGwgYmFjayB0
byBhIDEweDcNCj4gbW9kZSB3aXRob3V0IGFjdHVhbGx5IGNoZWNraW5nIHRoYXQgdGhlIGNhbmFy
eSBwbGFuZSB3aWxsIG5vdyBiZQ0KPiBvZmZzY3JlZW4uICBJZiwgZm9yIGV4YW1wbGUsIHRoZSBv
cmlnaW5hbCBtb2RlIHdhcyAxM3g3LCB0aGVuIHN3aXRjaGluZw0KPiB0byAxMHg3IHdpbGwgbGVh
dmUgdGhlIHBsYW5lIHZpc2libGUgb25zY3JlZW4sIGNhdXNpbmcgdGhlIHRlc3QgdG8gZmFpbC4N
Cj4gDQo+IEJlZm9yZSBmYWxsaW5nIGJhY2sgdG8gYSAxMHg3IG1vZGUsIGNoZWNrIHdoZXRoZXIg
dGhhdCdzIGFjdHVhbGx5IHNtYWxsDQo+IGVub3VnaC4gIElmIGl0IGlzbid0IGp1c3Qgc2tpcCB0
aGlzIHN1YnRlc3QuDQo+IA0KPiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9MTA1NTgxDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQgUm9wZXIgPG1h
dHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMva21zX3BsYW5lX2xvd3Jl
cy5jIHwgNCArKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BsYW5lX2xvd3Jlcy5jIGIvdGVz
dHMva21zX3BsYW5lX2xvd3Jlcy5jDQo+IGluZGV4IDY4Yjg1MDI1Li4zZjIwZWQzMiAxMDA2NDQN
Cj4gLS0tIGEvdGVzdHMva21zX3BsYW5lX2xvd3Jlcy5jDQo+ICsrKyBiL3Rlc3RzL2ttc19wbGFu
ZV9sb3dyZXMuYw0KPiBAQCAtNTksOCArNTksMTAgQEAgZ2V0X2xvd3Jlc19tb2RlKGludCBkcm1m
ZCwgaWd0X291dHB1dF90ICpvdXRwdXQsIGRybU1vZGVNb2RlSW5mbyAqbW9kZV9kZWZhdWx0KQ0K
PiAgCQl9DQo+ICAJfQ0KPiAgDQo+IC0JaWYgKCFmb3VuZCkNCj4gKwlpZiAoIWZvdW5kKSB7DQo+
ICsJCWlndF9za2lwX29uKGxpbWl0IDw9IDc2OCk7DQoNCkluc3RlYWQgb2YgaGFyZGNvZGluZyA3
NjgsIGNhbiB3ZSB1c2UgMTAyNCAtIFNJWkU/IFRoaXMgd291bGQgbWFrZSBpdA0KY2xlYXJlciB3
aGVyZSB0aGlzIHZhbHVlIGNvbWVzIGZyb20uDQoNCj4gIAkJcmV0dXJuICppZ3Rfc3RkXzEwMjRf
bW9kZV9nZXQoKTsNCj4gKwl9DQo+ICANCj4gIAlyZXR1cm4gbW9kZTsNCj4gIH0NCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
