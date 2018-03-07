Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A976E07C
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Mar 2018 15:27:04 +0000 (UTC)
Date: Wed, 7 Mar 2018 17:26:58 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20180307152658.GC3313@ahiler-desk1.ger.corp.intel.com>
References: <20180227085232.54025-1-maarten.lankhorst@linux.intel.com>
 <20180227085232.54025-4-maarten.lankhorst@linux.intel.com>
 <20180307151737.GB3313@ahiler-desk1.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180307151737.GB3313@ahiler-desk1.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/4] tests/kms_frontbuffer_tracking:
 Convert test to use igt_display, v3.
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

T24gV2VkLCBNYXIgMDcsIDIwMTggYXQgMDU6MTc6MzdQTSArMDIwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IE9uIFR1ZSwgRmViIDI3LCAyMDE4IGF0IDA5OjUyOjMxQU0gKzAxMDAsIE1hYXJ0
ZW4gTGFua2hvcnN0IHdyb3RlOgo+ID4gU3RyYWlnaHQgY29udmVyc2lvbiwgbm8gYmVoYXZpb3Jh
bCBjaGFuZ2VzIHlldC4KPiA+IAo+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+IC0gSGFuZGxlIDJ4
IG91dHB1dHMgY29ycmVjdGx5Lgo+ID4gQ2hhbmdlcyBzaW5jZSB2MjoKPiA+IC0gU2V0IGNvcnJl
Y3QgcGFyYW1ldGVycyBpbiBzZXRfbW9kZV9mb3JfcGFyYW1zLCBzbyBhdG9taWMgY29tbWl0IGZv
cgo+ID4gICAyeCBvdXRwdXRzIGRvZXNuJ3Qgc2NhbGUuCj4gPiAtIEZpeCBhY2NpZGVudGFsIHNj
YWxpbmcgaW4gc2V0X3ByaW1fcGxhbmVfZm9yX3BhcmFtcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
PiAKPiBHZW5lcmFsbHkgdGhlIGNvbnZlcnNpb24gbG9va3MgZ29vZCB0byBtZSwgYnV0IEkgY2Fu
J3Qgc2xhcCByLWIKPiB5ZXQgYmVjYXVzZSB0aGVyZSBhcmUgdGhvc2UgbmV3IGZhaWxzOgo+IAo+
IAo+IFRlc3Qga21zX2Zyb250YnVmZmVyX3RyYWNraW5nOgo+ICAgICAgICAgU3ViZ3JvdXAgZmJj
LTJwLXByaW1zY3JuLXByaS1zaHJmYi1kcmF3LXJlbmRlcjoKPiAgICAgICAgICAgICAgICAgcGFz
cyAgICAgICAtPiBGQUlMICAgICAgIChzaGFyZC1oc3cpCj4gICAgICAgICBTdWJncm91cCBmYmMt
MnAtc2NuZHNjcm4tcHJpLXNocmZiLWRyYXctbW1hcC1ndHQ6Cj4gICAgICAgICAgICAgICAgIHBh
c3MgICAgICAgLT4gRkFJTCAgICAgICAoc2hhcmQtaHN3KQo+ICAgICAgICAgU3ViZ3JvdXAgZmJj
LTJwLXNjbmRzY3JuLXNocmZiLXBsZmxpcC1ibHQ6Cj4gICAgICAgICAgICAgICAgIHBhc3MgICAg
ICAgLT4gRkFJTCAgICAgICAoc2hhcmQtaHN3KQo+IAo+IAo+IFRoZXJlJ3MgZXZlbiBhIGJ1ZyBm
b3IgdGhhdCAoZmRvIzEwMTYyMyksIGJ1dCB3ZSBuZXZlciBoYWQgaGl0IHRoZSBpc3N1ZQo+IHdp
dGggdGhvc2UgcGFydGljdWxhciAzIHRlc3RzIGJlZm9yZSwgc28gdGhleSBhcmUgbm90IHN1cHBy
ZXNzZWQgYnkgdGhlCj4gY2lidWdsb2cuCj4gCj4gSSd2ZSBkb25lIGEgQ0kgcmVydW4gdG8gbWFr
ZSBzdXJlIGl0J3MgY29uc2lzdGVudCAoYW5kIGl0IGlzLCAyLzIgOi0pKQo+IGFuZCBJJ3ZlIHRy
aWVkIHRvIGZpZ3VyZSBvdXQgd2h5IHdlIGhpdCB0aGUgaXNzdWUgd2l0aCB5b3VyIGNoYW5nZXMK
PiB3aGlsZSBJIHdhcyBkb2luZyB0aGUgcmV2aWV3LCBidXQgSSBoYXZlbid0IHNwb3R0ZWQgYW55
dGhpbmcgc3VzcGljaW91cy4KCk9uIGEgc2Vjb25kIHRob3VnaHQgaXQgbWF5IGJlIHRoZSBvcHRp
bWl6YXRpb25zIGZyb20gdGhlIDR0aCBwYXRjaAptYWtpbmcgdGhlIGlzc3VlIG1vcmUgY29uc2lz
dGVudC4KCkknbGwgc2VuZCB0aGUgZmlyc3QgdGhyZWUgcGF0Y2hlcyB0byBnZXQgYSByb3VuZCBv
ZiBDSSB0cmVhdG1lbnQuCgotLSAKQ2hlZXJzLApBcmVrCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
