Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1806E46C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2018 12:52:47 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180126150302.12337-1-lukasz.kalamarz@intel.com>
 <151697967468.674.10136288566334785019@mail.alporthouse.com>
 <1517228306.3558.1.camel@intel.com>
In-Reply-To: <1517228306.3558.1.camel@intel.com>
Message-ID: <151723036250.10214.13073712035160344047@mail.alporthouse.com>
Date: Mon, 29 Jan 2018 12:52:42 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] gem_gpu_fill: Merging gem_gpgpu_fill
 and gem_media_fill into one
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
To: "Kalamarz, Lukasz" <lukasz.kalamarz@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLYWxhbWFyeiwgTHVrYXN6ICgyMDE4LTAxLTI5IDEyOjE4OjI3KQo+IE9uIEZyaSwg
MjAxOC0wMS0yNiBhdCAxNToxNCArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gUXVvdGlu
ZyBMdWthc3ogS2FsYW1hcnogKDIwMTgtMDEtMjYgMTU6MDM6MDIpCj4gPiA+IEltcGxlbWVudGF0
aW9uIG9mIHRob3NlIHRlc3Qgb25seSBkaWZmZXIgd2l0aCBmaWxsX2Z1bmN0aW9uIHVzZWQgYnkK
PiA+ID4gZWl0aGVyIG1lZGlhIG9yIGdwZ3B1IHBpcGVsaW5lLCB3aGljaCBzaGFyZWQgc2FtZSB0
eXBlLiBSYXRoZXIgdGhhbgo+ID4gPiBoYXZpbmcgdHdvIHRlc3RzLCB3aGljaCBhcmUgaW4gOTgl
IGNvcHktcGFzdGUgaXQgaXMgZWFzaWVyIHRvCj4gPiA+IG1haW50YWluIG9uZSB3aXRoIHNhbWUg
ZnVuY3Rpb25hbGl0eS4KPiA+IAo+ID4gSSBoZWFyIHRoZXJlJ3MgYSByZW5kZXIgZXF1aXZhbGVu
dCBhcyB3ZWxsLgo+ID4gSSBwcmVzdW1lIGVhY2ggcm91dGluZSBpcyBydW4gb3ZlciBhbGwgZW5n
aW5lcyB0aGF0IHN1cHBvcnQgaXQ/Cj4gCj4gVGhlcmUgaXMgc2ltaWxhciB0ZXN0IChnZW1fcmVu
ZGVyX2NvcHkpIHdpdGggc2xpZ2h0bHkgZGlmZmVyZW50Cj4gc2VtYW50aWNzIGFuZCBpdCBpcyB1
c2luZyBvdGhlciBzdHJ1Y3QgdG8gcGVyZm9ybSBvcGVyYXRpb24KPiAoaWd0X2ZpbGxmdW5jX3Qg
dnMgaWd0X2NvcHlfZnVuY3Rpb25fdCkuCj4gV2UgY2FuIGltcGxlbWVudCByZW5kZXJfZmlsbF9m
dW5jIHVzaW5nIHJlbmRlciBibGl0LiBJcyB0aGF0IHdoYXQgWW91Cj4gaGF2ZSBpbiBtaW5kPyAK
Clllcy4KCj4gRWFjaCByb3V0aW5lIGlzIHJ1biBvdmVyIGFsbCBlbmdpbmVzIChtZWFuaW5nIHRo
ZSBvbmx5IGVuZ2luZSB0aGF0Cj4gc3VwcG9ydHMgaXQgLSByZW5kZXIpLgoKSG1tLCBJIHRob3Vn
aHQgbWVkaWFmaWxsIHdhcyB2Y3MuIElmIG5vdCwgd2UgYXJlIGxhY2tpbmcgYW4gZXhlcmNpc2Vy
LgpXaGV0aGVyIG9yIG5vdCB0aGF0IGlzIGltcG9ydGFudCBpcyBhbm90aGVyIHF1ZXN0aW9uLgot
Q2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
