Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9058919D
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 09:31:46 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id u57so15311847edm.3
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 02:31:46 -0700 (PDT)
Date: Wed, 24 Apr 2019 11:31:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190424093140.GN9857@phenom.ffwll.local>
References: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
 <20190314095839.38fb95d1@collabora.com>
 <CAPM=9tz90rbbYCZS5377cEwM7MPyMjnW6CWWqdoAmai8fa+3ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tz90rbbYCZS5377cEwM7MPyMjnW6CWWqdoAmai8fa+3ZQ@mail.gmail.com>
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
To: Dave Airlie <airlied@gmail.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBBcHIgMDUsIDIwMTkgYXQgMTI6NDA6MTRQTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3Jv
dGU6Cj4gT24gVGh1LCAxNCBNYXIgMjAxOSBhdCAxODo1OCwgQm9yaXMgQnJlemlsbG9uCj4gPGJv
cmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIDI4IEZl
YiAyMDE5IDE1OjQ5OjAzICswMTAwCj4gPiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPiB3cm90ZToKPiA+Cj4gPiA+IEhpIGFsbCwKPiA+ID4KPiA+ID4gTm90aGluZyB0b28g
bWFqb3IsIG9ubHkgdGhpbmdzIEkgZGlkIGZpbmQgaW4gYWxsIG15IGlndCB0ZXN0IGV4dGVuZGlu
ZyBmb3IKPiA+ID4gZHJtIGxlYXNlIGlzIHNvbWUgY29ybmVyIGNhc2VzIGFyb3VuZCBpbXBsaWNp
dCBwbGFuZXMgYW5kIGF0b21pYyB0YXJnZXQKPiA+ID4gY3J0Y3MuIFJldmlldyBhbmQgY29tbWVu
dHMgdmVyeSBtdWNoIGFwcHJlY2lhdGVkLgo+ID4gPgo+ID4gPiBDaGVlcnMsIERhbmllbAo+ID4g
Pgo+ID4gPiBUZXN0LXdpdGg6IDIwMTkwMjI4MTQxOTE4LjI2MDQzLTEtZGFuaWVsLnZldHRlckBm
ZndsbC5jaAo+ID4gPgo+ID4gPiBEYW5pZWwgVmV0dGVyICg3KToKPiA+ID4gICBkcm0vbGVhc2Vz
OiBEcm9wIG9iamVjdF9pZCB2YWxpZGF0aW9uIGZvciBuZWdhdGl2ZSBpZHMKPiA+ID4gICBkcm0v
bGVhc2U6IERyb3AgcmVjdXJzaXZlIGxlYWRzIGNoZWNrcwo+ID4gPiAgIGRybS9sZWFzZXM6IERv
bid0IGluaXQgdG8gMCBpbiBkcm1fbWFzdGVyX2NyZWF0ZQo+ID4gPiAgIGRybS9sZWFzZTogQ2hl
Y2sgZm9yIGxlc3NvciBvdXRzaWRlIG9mIGxvY2tzCj4gPiA+ICAgZHJtL2xlYXNlOiBNYWtlIHN1
cmUgaW1wbGljaXQgcGxhbmVzIGFyZSBsZWFzZWQKPiA+ID4gICBkcm0vYXRvbWljOiBXaXJlIGZp
bGVfcHJpdiB0aHJvdWdoIGZvciBwcm9wZXJ0eSBjaGFuZ2VzCj4gPiA+ICAgZHJtL2F0b21pYzog
LUVBQ0NFU1MgZm9yIGxlYXNlLWRlbmllZCBjcnRjIGxvb2t1cAo+ID4KPiA+IEkgaGFkIGEgbG9v
ayBhdCBwYXRjaGVzIDUtNyBhbmQgdGhleSBzZWVtIHRvIGRvIHRoZSByaWdodCB0aGluZywgYnV0
IG15Cj4gPiBrbm93bGVkZ2Ugb24gRFJNIGxlYXNlcyBpcyBxdWl0ZSBsaW1pdGVkLCBhbmQgZ2l2
ZW4gYWxsIHRoZSBjb3JuZXIKPiA+IGNhc2VzIG9mIGxlZ2FjeSBDUlRDL3BsYW5lIHVwZGF0ZXMs
IEknbSBub3QgY29tZm9ydGFibGUgYWRkaW5nIG15IFItYgo+ID4gb24gdGhlc2UuCj4gCj4gRm9y
IHRoZSBzZXJpZXM6Cj4gCj4gUmV2aWV3ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhh
dC5jb20+CgpGaW5hbGx5IGdvdHRlbiBhcm91bmQgdG8gcHVsbGluZyBpdCBhbGwgaW4sIHRoYW5r
cyBmb3IgYWxsIHlvdXIgcmV2aWV3cy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
