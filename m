Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Deepak Singh Rawat <drawat@vmware.com>
Date: Tue, 16 Oct 2018 16:00:17 +0000
Message-ID: <BYAPR05MB41816E700ED1A672784F31CFBAFE0@BYAPR05MB4181.namprd05.prod.outlook.com>
References: <20181011001657.1715-1-drawat@vmware.com>
 <20181011001657.1715-4-drawat@vmware.com>
 <20181011162311.GK31561@phenom.ffwll.local>
 <BYAPR05MB418196B84F6B33CD5DCFE658BAFD0@BYAPR05MB4181.namprd05.prod.outlook.com>
 <20181016122117.GR31561@phenom.ffwll.local>
In-Reply-To: <20181016122117.GR31561@phenom.ffwll.local>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v3 04/18] drm/selftest: Add drm damage
 helper selftest
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sinclair Yeh <syeh@vmware.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Pekka Paalanen <ppaalanen@gmail.com>, linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

PiA+ID4gT2J2aW91c2x5IG5lZWRzIHNvbWUgYWRqdXN0aW5nIG9uIHRoZSBpZ3Qgc2lkZSB0b28s
IHNpbmNlIHdlIHNlZW0gdG8gYmUKPiA+ID4gbWlzc2luZyB0aGUgaWd0IHNjYWZmb2xkaW5nIGZv
ciB0ZXN0cy1kcm0taGVscGVyLmtvLgo+ID4gPiAtRGFuaWVsCj4gPgo+ID4gSGkgRGFuaWVsLAo+
ID4KPiA+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4gSSBhbSBhIGxpdHRsZSBjb25mdXNlZCBoZXJl
LiBTaG91bGQgd2UgaGF2ZSBzaW5nbGUKPiA+IGtlcm5lbCBtb2R1bGUgZm9yIGRybSBwbGFuZSBo
ZWxwZXIgc2VsZnRlc3QgYW5kIGRhbWFnZSBoZWxwZXIgc2VsZnRlc3Q/Cj4gPiBBbHNvIHNoYWxs
IEkgcmVuYW1lIHRoZSBrZXJuZWwgc2VsZnR0ZXN0IHRvIGttc18qPwo+ID4KPiA+IEZvciB1c2Vy
LXNwYWNlIGlndCB0ZXN0IGl0IHNob3VsZCBiZSBpdCBtYWtlcyBzZW5zZSB0byByZW5hbWUgdG8K
PiBrbXNfc2VsZnRldHM/Cj4gCj4gU2luY2UgSSB3ZW50IGJhY2smZm9ydGggb24gdGhpcyB3YXkg
dG9vIG1hbnkgdGltZXM6Cj4gLSBpZ3Qgc2hvdWxkIGJlIGNhbGxlZCBrbXNfc2VsZnRlc3QuIFBs
ZWFzZSB3b3JrIHRvZ2V0aGVyIHdpdGggaWd0Cj4gICBtYWludGFpbmVycyAoQXJlayBhbmQgUGV0
cmkpLCBzaW5jZSB3ZSBhbHNvIG5lZWQgdG8gdXBkYXRlIHRoZSBDSQo+ICAgYnVpbGRpbmcgaW5m
cmFzdHJ1Y3R1cmUgdG8gbWFrZSBzdXJlIGl0IHVwZGF0ZXMgdGhlIGxpc3Qgb2Ygc3VidGVzdHMK
PiAgIGltcGxlbWVudGVkIGJ5IHRoZSBrZXJuZWwuCj4gCj4gLSBLZXJuZWwgbW9kdWxlIEknZCBj
YWxsIHRlc3QtZHJtX21vZGVzZXQua28uIFRoYXQga2VybmVsIG1vZHVsZSBjYW4gdGhlbgo+ICAg
aW5jbHVkZSB0aGUgZXhpc3RpbmcgdGVzdC1kcm0taGVscGVyLmMgKGNvdWxkIHByb2JhYmx5IHJl
bmFtZSB0bwo+ICAgdGVzdC1kcm1fcGxhbmVfaGVscGVyLmMgZm9yIGNsYXJpdHkpIGFuZCB5b3Vy
IG5ldyBkYW1hZ2UgaGVscGVyIChuYW1lZAo+ICAgdGVzdC1kcm1fZGFtYWdlX2hlbHBlci5jIGZv
ciBjb25zaXN0ZW5jeSkuCj4gCj4gRG9lcyB0aGF0IG1ha2Ugc2Vuc2UgdG8gZXZlcnlvbmU/Cj4g
CgpZZXMgaXQgbWFrZXMgc2Vuc2UgdG8gbWUgYW5kIGluIGZhY3QgSSBoYWQgc2ltaWxhciBjaGFu
Z2VzIGluIG1pbmQuIEFuZCwgCnNpbmNlIGV4aXN0aW5nIHBsYW5lIHNlbGZ0ZXN0IGFyZSBub3Qg
aW52b2tlZCBmcm9tIGlndCBpdCdzIHNhZmUgdG8gcmVuYW1lCmtlcm5lbCBtb2R1bGUuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWls
aW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
