Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180906000350.2478-5-drawat@vmware.com>
References: <20180906000350.2478-1-drawat@vmware.com>
 <20180906000350.2478-5-drawat@vmware.com>
Message-ID: <153622433707.3050.13686202456647481282@skylake-alporthouse-com>
Date: Thu, 06 Sep 2018 09:58:57 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 4/5] lib/igt_fb: Check for
 stride before creating cairo surface
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
To: Deepak Rawat <drawat@vmware.com>, igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-graphics-maintainer@vmware.com, syeh@vmware.com, thellstrom@vmware.com
Cc: Deepak Rawat <drawat@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEZWVwYWsgUmF3YXQgKDIwMTgtMDktMDYgMDE6MDM6NDkpCj4gQ2Fpcm8gc3VyZmFj
ZSBjcmVhdGlvbiB3aWxsIGZhaWwgaWYgc3RyaWRlIG9mIHByb3ZpZGVkIGJ1ZmZlciBpcyBub3QK
PiBzYW1lIGFzIGV4cGVjdGVkIGJ5IGNhaXJvLiBUaGlzIGZhaWxzIGZvciB2bXdnZnggb2RkIGxl
bmd0aCBmcmFtZWJ1ZmZlcgo+IGFzIGluIHZtd2dmeCBzdHJpZGUgaXMgYWx3YXlzIHdpZHRoICog
YnBwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+
Cj4gLS0tCj4gIGxpYi9pZ3RfZmIuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5jCj4g
aW5kZXggYmE5OTVhMWEuLjI3MjRlMzIzIDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfZmIuYwo+ICsr
KyBiL2xpYi9pZ3RfZmIuYwo+IEBAIC0xMzQ5LDYgKzEzNDksOSBAQCBzdGF0aWMgdm9pZCBjcmVh
dGVfY2Fpcm9fc3VyZmFjZV9fZ3R0KGludCBmZCwgc3RydWN0IGlndF9mYiAqZmIpCj4gICAgICAg
ICAgICAgICAgIHB0ciA9IGdlbV9tbWFwX19ndHQoZmQsIGZiLT5nZW1faGFuZGxlLCBmYi0+c2l6
ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQUk9UX1JFQUQgfCBQUk9U
X1dSSVRFKTsKPiAgCj4gKyAgICAgICBpZ3RfcmVxdWlyZShmYi0+c3RyaWRlID09IGNhaXJvX2Zv
cm1hdF9zdHJpZGVfZm9yX3dpZHRoKAo+ICsgICAgICAgICAgICAgICBkcm1fZm9ybWF0X3RvX2Nh
aXJvKGZiLT5kcm1fZm9ybWF0KSwgZmItPndpZHRoKSk7Cj4gKwo+ICAgICAgICAgZmItPmNhaXJv
X3N1cmZhY2UgPQo+ICAgICAgICAgICAgICAgICBjYWlyb19pbWFnZV9zdXJmYWNlX2NyZWF0ZV9m
b3JfZGF0YShwdHIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGRybV9mb3JtYXRfdG9fY2Fpcm8oZmItPmRybV9mb3JtYXQpLAoKSXMgdGhlcmUg
bm90IGEgCmlndF9yZXF1aXJlX2YvaWd0X2Fzc2VydF9mKGNhaXJvX3N1cmZhY2Vfc3RhdHVzKGZi
LT5jYWlyb19zdXJmYWNlKSA9PSBDQUlST19TVEFUVVNfU1VDQ0VTUywKIlVuYWJsZSB0byBjcmVh
dGUgYSBjYWlybyBzdXJmYWNlOiAlcyIsIGNhaXJvX3N0YXR1c190b19zdHJpbmcoY2Fpcm9fc3Vy
ZmFjZV9zdGF0dXMoZmItPmNhaXJvX3N1cmZhY2UpKSk7CmhlcmU/Ci1DaHJpcwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
