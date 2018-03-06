Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x231.google.com (mail-wm0-x231.google.com
 [IPv6:2a00:1450:400c:c09::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402736E06D
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Mar 2018 14:43:04 +0000 (UTC)
Received: by mail-wm0-x231.google.com with SMTP id x7so22637525wmc.0
 for <igt-dev@lists.freedesktop.org>; Tue, 06 Mar 2018 06:43:04 -0800 (PST)
Date: Tue, 6 Mar 2018 15:42:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20180306144259.GL22212@phenom.ffwll.local>
References: <20180211185433.22500-1-chris@chris-wilson.co.uk>
 <151868650767.15373.14591219774933240864@mail.alporthouse.com>
 <20180220121718.GQ22199@phenom.ffwll.local>
 <151912933947.4312.13558357558249191696@mail.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <151912933947.4312.13558357558249191696@mail.alporthouse.com>
Subject: Re: [igt-dev] [PATCH igt] igt/kms_frontbuffer_tracking: Disable FBC
 testing for -ENODEV
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMTI6MjI6MTlQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAxOC0wMi0yMCAxMjoxNzoxOCkKPiA+IE9u
IFRodSwgRmViIDE1LCAyMDE4IGF0IDA5OjIxOjQ3QU0gKzAwMDAsIENocmlzIFdpbHNvbiB3cm90
ZToKPiA+ID4gUXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMDItMTEgMTg6NTQ6MzMpCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
Cj4gPiA+IAo+ID4gPiBQb2tlLCBDSSBpcyBzdGlsbCB0cmlwcGluZyBvdmVyIHRoaXMuLi4KPiA+
IAo+ID4gQ2FuIHlvdSBnaXZlIGEgYml0IG1vcmUgY29udGV4dCBhYm91dCB3aGF0J3MgZ29pbmcg
b24gYW5kIGhvdyB0aGlzCj4gPiBoYXBwZW5zPyBCdWd6aWxsYSBvciB3aGF0ZXZlciAuLi4gSSdt
IGNvbmZ1c2VkLgo+IAo+IGk5MTVfZmJjX3N0YXR1cygpOgo+IAlpZiAoIUhBU19GQkMoZGV2X3By
aXYpKQo+IAkJcmV0dXJuIC1FTk9ERVY7Cj4gCj4gU28gd2hlbmV2ZXIgQ0kgaXMgcnVuIG9uIG1h
Y2hpbmVzIHdpdGhvdXQgRkJDIChhbGwgb2YgaXRzIGdlbjMtZ2VuNQo+IG1hY2hpbmUsIGFzIHRo
ZSBvbmx5IGlsayBhcHBlYXJzIHRvIGJlIGEgZGVza3RvcCB1bmxlc3MgSSBtaXNzZWQgb25lKQo+
IGJ1ZiBpcyBlbXB0eS4KCk9oLCBJIGVudGlyZWx5IG1pc3NlZCB0aGF0IHdlIGVycm5vIG91dCB0
aGUgcmVhZCByaWdodCBhd2F5IGluIHRoYXQgY2FzZS4KClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
