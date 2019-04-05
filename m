Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
 <20190314095839.38fb95d1@collabora.com>
In-Reply-To: <20190314095839.38fb95d1@collabora.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 5 Apr 2019 12:40:14 +1000
Message-ID: <CAPM=9tz90rbbYCZS5377cEwM7MPyMjnW6CWWqdoAmai8fa+3ZQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH 0/7] some cleanups and uapi clarification for
 leases
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
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAxNCBNYXIgMjAxOSBhdCAxODo1OCwgQm9yaXMgQnJlemlsbG9uCjxib3Jpcy5icmV6
aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDI4IEZlYiAyMDE5IDE1OjQ5
OjAzICswMTAwCj4gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6
Cj4KPiA+IEhpIGFsbCwKPiA+Cj4gPiBOb3RoaW5nIHRvbyBtYWpvciwgb25seSB0aGluZ3MgSSBk
aWQgZmluZCBpbiBhbGwgbXkgaWd0IHRlc3QgZXh0ZW5kaW5nIGZvcgo+ID4gZHJtIGxlYXNlIGlz
IHNvbWUgY29ybmVyIGNhc2VzIGFyb3VuZCBpbXBsaWNpdCBwbGFuZXMgYW5kIGF0b21pYyB0YXJn
ZXQKPiA+IGNydGNzLiBSZXZpZXcgYW5kIGNvbW1lbnRzIHZlcnkgbXVjaCBhcHByZWNpYXRlZC4K
PiA+Cj4gPiBDaGVlcnMsIERhbmllbAo+ID4KPiA+IFRlc3Qtd2l0aDogMjAxOTAyMjgxNDE5MTgu
MjYwNDMtMS1kYW5pZWwudmV0dGVyQGZmd2xsLmNoCj4gPgo+ID4gRGFuaWVsIFZldHRlciAoNyk6
Cj4gPiAgIGRybS9sZWFzZXM6IERyb3Agb2JqZWN0X2lkIHZhbGlkYXRpb24gZm9yIG5lZ2F0aXZl
IGlkcwo+ID4gICBkcm0vbGVhc2U6IERyb3AgcmVjdXJzaXZlIGxlYWRzIGNoZWNrcwo+ID4gICBk
cm0vbGVhc2VzOiBEb24ndCBpbml0IHRvIDAgaW4gZHJtX21hc3Rlcl9jcmVhdGUKPiA+ICAgZHJt
L2xlYXNlOiBDaGVjayBmb3IgbGVzc29yIG91dHNpZGUgb2YgbG9ja3MKPiA+ICAgZHJtL2xlYXNl
OiBNYWtlIHN1cmUgaW1wbGljaXQgcGxhbmVzIGFyZSBsZWFzZWQKPiA+ICAgZHJtL2F0b21pYzog
V2lyZSBmaWxlX3ByaXYgdGhyb3VnaCBmb3IgcHJvcGVydHkgY2hhbmdlcwo+ID4gICBkcm0vYXRv
bWljOiAtRUFDQ0VTUyBmb3IgbGVhc2UtZGVuaWVkIGNydGMgbG9va3VwCj4KPiBJIGhhZCBhIGxv
b2sgYXQgcGF0Y2hlcyA1LTcgYW5kIHRoZXkgc2VlbSB0byBkbyB0aGUgcmlnaHQgdGhpbmcsIGJ1
dCBteQo+IGtub3dsZWRnZSBvbiBEUk0gbGVhc2VzIGlzIHF1aXRlIGxpbWl0ZWQsIGFuZCBnaXZl
biBhbGwgdGhlIGNvcm5lcgo+IGNhc2VzIG9mIGxlZ2FjeSBDUlRDL3BsYW5lIHVwZGF0ZXMsIEkn
bSBub3QgY29tZm9ydGFibGUgYWRkaW5nIG15IFItYgo+IG9uIHRoZXNlLgoKRm9yIHRoZSBzZXJp
ZXM6CgpSZXZpZXdlZC1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
