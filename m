Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Thu, 11 Oct 2018 17:25:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181011152559.GE31561@phenom.ffwll.local>
References: <20181011002104.1845-1-drawat@vmware.com>
 <20181011002104.1845-6-drawat@vmware.com>
 <20181011090535.GC31561@phenom.ffwll.local>
 <BYAPR05MB418195CE949ED42641295378BAE10@BYAPR05MB4181.namprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR05MB418195CE949ED42641295378BAE10@BYAPR05MB4181.namprd05.prod.outlook.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t 6/6] tests/plane_damage: Integrate
 kernel selftest test-drm_damage_helper
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
To: Deepak Singh Rawat <drawat@vmware.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sinclair Yeh <syeh@vmware.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Pekka Paalanen <ppaalanen@gmail.com>, linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTEsIDIwMTggYXQgMDM6MjM6NThQTSArMDAwMCwgRGVlcGFrIFNpbmdoIFJh
d2F0IHdyb3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvbWVzb24uYnVpbGQgYi90ZXN0cy9t
ZXNvbi5idWlsZAo+ID4gPiBpbmRleCA2OTdmZjUxNS4uNWFjZDdhYTIgMTAwNjQ0Cj4gPiA+IC0t
LSBhL3Rlc3RzL21lc29uLmJ1aWxkCj4gPiA+ICsrKyBiL3Rlc3RzL21lc29uLmJ1aWxkCj4gPiA+
IEBAIC05LDYgKzksNyBAQCB0ZXN0X3Byb2dzID0gWwo+ID4gPiAgCSdkZWJ1Z2ZzX3Rlc3QnLAo+
ID4gPiAgCSdkcm1faW1wb3J0X2V4cG9ydCcsCj4gPiA+ICAJJ2RybV9tbScsCj4gPiA+ICsJJ2Ry
bV9wbGFuZV9kYW1hZ2UnLAo+ID4gCj4gPiBGb3IgZnV0dXJlIHByb29maW5nIEkgdGhpbmsgaXQn
ZCBiZSBtdWNoIGJldHRlciBpZiB3ZSBjYWxsIHRoaXMgZHJtX2ttcyBvcgo+ID4gc2ltaWxhci4g
VGhlIGluZGl2aWR1YWwgc3VidGVzdCByZXN1bHRzIHdpbGwgYmUgYWxsIGV4cG9zZWQsIGJ1dCB0
aGVyZSdzIGEKPiA+IGJpdCBhIHByb2JsZW0gd2hlbiB3ZSBhbHdheXMgaGF2ZSB0byB1cGdyYWRl
IGJvdGggaWd0IGFuZCB0aGUga2VybmVsIGF0Cj4gPiB0aGUgc2FtZSB0aW1lLiBBdCBsZWFzdCB3
aXRoIHRoZSBjdXJyZW50IENJIGluZnJhc3RydWN0dXJlLgo+IAo+IERvIHlvdSBtZWFuIGRybV9r
bXNfcGxhbmVfZGFtYWdlPyBJSVVDIHRoaXMgaXMgdG8gYWxsb3cgcnVubmluZyB0ZXN0Cj4gZnJv
bSBydW4tdGVzdC5zaD8gSSBzdXBwb3NlIGluIHRoYXQgY2FzZSBpdCBzaG91bGQgYmUgbmFtZWQK
PiBrbXNfcGxhbmVfZGFtYWdlLCBiZWNhdXNlIGFsbCBvdGhlciBrbXMgdGVzdCBzdGFydHMgd2l0
aCBrbXNfKi4KCkFoIHllcywgc3RpY2tpbmcgdG8gdGhlIGttc18gcHJlZml4IGlzIGEgZ29vZCBp
ZGVhLiAga21zX3NlbGZ0ZXN0cyBpcyB3aGF0CkknZCByZWNvbW1lbmQuIEZvciBib3RoIHRoZSBp
Z3Qgd3JhcHBlciBoZXJlLCBhbmQgdGhlIGtlcm5lbCBtb2R1bGUuCgpUaGF0IHdheSBpdCdzIGEg
bmF0dXJhbCBwbGFjZSB0byBhZGQgYWxsIGtpbmRzIG9mIGttcyBzZWxmIHRlc3RzIGluIHRoZQpm
dXR1cmUsIHdpdGhvdXQgdGhlIG5lZWQgdG8gZ28gdGhyb3VnaCB0aGUgYmFzaWMgc2NhZmZvbGRp
bmcgc3RlcHMgYWdhaW4uCgpDaGVlcnMsIERhbmllbAo+IAo+ID4gCj4gPiBJJ20gYWxzbyBhc2tp
bmcgdGhlIEFSTSBmb2xrcyB0byB0eXBlIHNlbGZ0ZXN0cyBmb3IgdGhlIG5ldyBibG9ja18qIGZv
cm1hdAo+ID4gZGVzY3JpcHRpb24gc3R1ZmYsIHNvIHRoaXMgd2lsbCBjb21lIGluIGhhbmR5IHJl
YWwgc29vbi4KPiA+IC1EYW5pZWwKPiA+IAo+ID4gPiAgCSdkcm1fcmVhZCcsCj4gPiA+ICAJJ2Ry
dl9nZXRwYXJhbXNfYmFzaWMnLAo+ID4gPiAgCSdkcnZfaGFuZ21hbicsCj4gPiA+IC0tCj4gPiA+
IDIuMTcuMQoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWdmeAo=
