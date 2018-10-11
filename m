Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Deepak Singh Rawat <drawat@vmware.com>
Date: Thu, 11 Oct 2018 15:23:58 +0000
Message-ID: <BYAPR05MB418195CE949ED42641295378BAE10@BYAPR05MB4181.namprd05.prod.outlook.com>
References: <20181011002104.1845-1-drawat@vmware.com>
 <20181011002104.1845-6-drawat@vmware.com>
 <20181011090535.GC31561@phenom.ffwll.local>
In-Reply-To: <20181011090535.GC31561@phenom.ffwll.local>
Content-Language: en-US
MIME-Version: 1.0
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sinclair Yeh <syeh@vmware.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Pekka Paalanen <ppaalanen@gmail.com>, linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

PiA+IGRpZmYgLS1naXQgYS90ZXN0cy9tZXNvbi5idWlsZCBiL3Rlc3RzL21lc29uLmJ1aWxkCj4g
PiBpbmRleCA2OTdmZjUxNS4uNWFjZDdhYTIgMTAwNjQ0Cj4gPiAtLS0gYS90ZXN0cy9tZXNvbi5i
dWlsZAo+ID4gKysrIGIvdGVzdHMvbWVzb24uYnVpbGQKPiA+IEBAIC05LDYgKzksNyBAQCB0ZXN0
X3Byb2dzID0gWwo+ID4gIAknZGVidWdmc190ZXN0JywKPiA+ICAJJ2RybV9pbXBvcnRfZXhwb3J0
JywKPiA+ICAJJ2RybV9tbScsCj4gPiArCSdkcm1fcGxhbmVfZGFtYWdlJywKPiAKPiBGb3IgZnV0
dXJlIHByb29maW5nIEkgdGhpbmsgaXQnZCBiZSBtdWNoIGJldHRlciBpZiB3ZSBjYWxsIHRoaXMg
ZHJtX2ttcyBvcgo+IHNpbWlsYXIuIFRoZSBpbmRpdmlkdWFsIHN1YnRlc3QgcmVzdWx0cyB3aWxs
IGJlIGFsbCBleHBvc2VkLCBidXQgdGhlcmUncyBhCj4gYml0IGEgcHJvYmxlbSB3aGVuIHdlIGFs
d2F5cyBoYXZlIHRvIHVwZ3JhZGUgYm90aCBpZ3QgYW5kIHRoZSBrZXJuZWwgYXQKPiB0aGUgc2Ft
ZSB0aW1lLiBBdCBsZWFzdCB3aXRoIHRoZSBjdXJyZW50IENJIGluZnJhc3RydWN0dXJlLgoKRG8g
eW91IG1lYW4gZHJtX2ttc19wbGFuZV9kYW1hZ2U/IElJVUMgdGhpcyBpcyB0byBhbGxvdyBydW5u
aW5nIHRlc3QKZnJvbSBydW4tdGVzdC5zaD8gSSBzdXBwb3NlIGluIHRoYXQgY2FzZSBpdCBzaG91
bGQgYmUgbmFtZWQKa21zX3BsYW5lX2RhbWFnZSwgYmVjYXVzZSBhbGwgb3RoZXIga21zIHRlc3Qg
c3RhcnRzIHdpdGgga21zXyouCgo+IAo+IEknbSBhbHNvIGFza2luZyB0aGUgQVJNIGZvbGtzIHRv
IHR5cGUgc2VsZnRlc3RzIGZvciB0aGUgbmV3IGJsb2NrXyogZm9ybWF0Cj4gZGVzY3JpcHRpb24g
c3R1ZmYsIHNvIHRoaXMgd2lsbCBjb21lIGluIGhhbmR5IHJlYWwgc29vbi4KPiAtRGFuaWVsCj4g
Cj4gPiAgCSdkcm1fcmVhZCcsCj4gPiAgCSdkcnZfZ2V0cGFyYW1zX2Jhc2ljJywKPiA+ICAJJ2Ry
dl9oYW5nbWFuJywKPiA+IC0tCj4gPiAyLjE3LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ2Z4Cg==
