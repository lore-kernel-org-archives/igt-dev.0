Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20190529211354.16007-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190529211354.16007-1-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 30 May 2019 11:39:32 +0100
Message-ID: <CAM0jSHNFg1wsiiQdRfH-=ZFsRLy-31btuGSwCyO_BzQoKjrSsQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_workarounds: Mix and match SRM
 with mmio reads
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyOSBNYXkgMjAxOSBhdCAyMjoxNCwgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+IHdyb3RlOgo+Cj4gT24gYXBsLCBtbWlvIHJlYWRzIGZhaWwsIHJlYWRpbmcg
MC4KPiBPbiBjbWwsIFNSTSByZWFkcyBmYWlsLCByZWFkaW5nIDAuCj4KPiBDb21iaW5lIGJvdGgg
YXBwcm9hY2hlcywgc3RhcnRpbmcgd2l0aCBTUk0gYW5kIGZpeGluZyBpbiB0aGUgYmxhbmtzIHdp
dGgKPiBtbWlvIHJlYWRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0Bj
aHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy53aWxsaWFtLmF1
bGRAZ21haWwuY29tPgo+IENjOiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy53aWxsaWFtLmF1bGRA
Z21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
