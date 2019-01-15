Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190115174747.3138-4-liviu.dudau@arm.com>
References: <20190115174747.3138-1-liviu.dudau@arm.com>
 <20190115174747.3138-4-liviu.dudau@arm.com>
Message-ID: <154757805730.30063.1853125668491466900@skylake-alporthouse-com>
Date: Tue, 15 Jan 2019 18:47:47 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v5 3/6] lib: Add function to
 hash a framebuffer
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
To: Brian Starkey <brian.starkey@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Intel GFX ML <intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMaXZpdSBEdWRhdSAoMjAxOS0wMS0xNSAxNzo0Nzo0NCkKPiAraW50IGlndF9mYl9n
ZXRfY3JjKHN0cnVjdCBpZ3RfZmIgKmZiLCBpZ3RfY3JjX3QgKmNyYykKPiArewo+ICsjZGVmaW5l
IEZOVjFhX09GRlNFVF9CSUFTIDIxNjYxMzYyNjEKPiArI2RlZmluZSBGTlYxYV9QUklNRSAxNjc3
NzYxOQo+ICsgICAgICAgdWludDMyX3QgaGFzaDsKPiArICAgICAgIHZvaWQgKm1hcDsKPiArICAg
ICAgIGNoYXIgKnB0ciwgKmxpbmUgPSBOVUxMOwo+ICsgICAgICAgaW50IHgsIHksIGNwcCA9IGln
dF9kcm1fZm9ybWF0X3RvX2JwcChmYi0+ZHJtX2Zvcm1hdCkgLyA4Owo+ICsgICAgICAgdWludDMy
X3Qgc3RyaWRlID0gY2FsY19wbGFuZV9zdHJpZGUoZmIsIDApOwo+ICsKPiArICAgICAgIGlmIChm
Yi0+aXNfZHVtYikKPiArICAgICAgICAgICAgICAgbWFwID0ga21zdGVzdF9kdW1iX21hcF9idWZm
ZXIoZmItPmZkLCBmYi0+Z2VtX2hhbmRsZSwgZmItPnNpemUsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBST1RfUkVBRCk7Cj4gKyAgICAgICBlbHNlCj4g
KyAgICAgICAgICAgICAgIG1hcCA9IGdlbV9tbWFwX19ndHQoZmItPmZkLCBmYi0+Z2VtX2hhbmRs
ZSwgZmItPnNpemUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUFJPVF9S
RUFEKTsKPiArICAgICAgIHB0ciA9IG1hcDsKPiArCj4gKyAgICAgICAvKgo+ICsgICAgICAgICog
RnJhbWVidWZmZXJzIGFyZSBvZnRlbiB1bmNhY2hlZCwgd2hpY2ggY2FuIG1ha2UgYnl0ZS13aXNl
IGFjY2Vzc2VzCj4gKyAgICAgICAgKiB2ZXJ5IHNsb3cuIFdlIGNvcHkgZWFjaCBsaW5lIG9mIHRo
ZSBGQiBpbnRvIGEgbG9jYWwgYnVmZmVyIHRvIHNwZWVkCj4gKyAgICAgICAgKiB1cCB0aGUgaGFz
aGluZy4KPiArICAgICAgICAqLwo+ICsgICAgICAgbGluZSA9IG1hbGxvYyhzdHJpZGUpOwo+ICsg
ICAgICAgaWYgKCFsaW5lKSB7Cj4gKyAgICAgICAgICAgICAgIG11bm1hcChtYXAsIGZiLT5zaXpl
KTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAgICB9Cj4gKwo+ICsg
ICAgICAgaGFzaCA9IEZOVjFhX09GRlNFVF9CSUFTOwo+ICsKPiArICAgICAgIGZvciAoeSA9IDA7
IHkgPCBmYi0+aGVpZ2h0OyB5KyssIHB0ciArPSBzdHJpZGUpIHsKPiArCj4gKyAgICAgICAgICAg
ICAgIG1lbWNweShsaW5lLCBwdHIsIHN0cmlkZSk7CgppZ3RfbWVtY3B5X2Zyb21fd2MoKSBmb3Ig
dGhlIHJlYXNvbnMgY2l0ZWQgYWJvdmUuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
