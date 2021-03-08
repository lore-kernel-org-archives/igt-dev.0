Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2AB6E84D
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Mar 2021 10:18:01 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210308094756.GB7125@zkempczy-mobl2>
References: <20210301161403.98278-1-zbigniew.kempczynski@intel.com>
 <20210301161403.98278-20-zbigniew.kempczynski@intel.com>
 <161495519869.8241.6229953895790444346@build.alporthouse.com>
 <20210308094756.GB7125@zkempczy-mobl2>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 08 Mar 2021 10:17:52 +0000
Message-ID: <161519867201.19494.17478413461726228682@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v21 19/35] tests/api_intel_bb: Modify
 test to verify intel_bb with allocator
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
To: zbigniew.kempczynski@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjEtMDMtMDggMDk6NDc6NTYpCj4gT24g
RnJpLCBNYXIgMDUsIDIwMjEgYXQgMDI6Mzk6NThQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3Rl
Ogo+ID4gUXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjEtMDMtMDEgMTY6MTM6NDcp
Cj4gPiA+ICAgICAgICAgaW50ZWxfYmJfZW1pdF9iYmUoaWJiKTsKPiA+ID4gLSAgICAgICBpZ3Rf
ZGVidWcoImV4ZWMgZmxhZ3M6ICUiIFBSSVg2NCAiXG4iLCBmbGFncyk7Cj4gPiA+IC0gICAgICAg
aW50ZWxfYmJfZXhlYyhpYmIsIGludGVsX2JiX29mZnNldChpYmIpLCBmbGFncywgdHJ1ZSk7Cj4g
PiA+ICsgICAgICAgaW50ZWxfYmJfZmx1c2hfYmxpdChpYmIpOwo+ID4gPiArICAgICAgIGludGVs
X2JiX3N5bmMoaWJiKTsKPiA+IAo+ID4gSG1tLiBUaGF0IGRvZXMgcmVtaW5kIG1lLCBJIGhhdmVu
J3Qgc2VlbiBFWEVDX09CSkVDVF9XUklURSBiZWluZyBzZXQuCj4gPiAtQ2hyaXMKPiAKPiAKPiBJ
biBfX2VtaXRfYmxpdCgpIC0+IGludGVsX2JiX2VtaXRfYmx0X2NvcHkoKSB3ZSBhZGQgZHN0IGFz
IHRhcmdldDoKPiAKPiAuLi4KPiAgICAgICAgIGludGVsX2JiX2FkZF9pbnRlbF9idWYoaWJiLCBz
cmMsIGZhbHNlKTsKPiAgICAgICAgIGludGVsX2JiX2FkZF9pbnRlbF9idWYoaWJiLCBkc3QsIHRy
dWUpOwo+IC4uLgoKU28gdGhlIHN5bmMgaXMgYmVjYXVzZT8gRXZlcnl0aW1lIEkgc2VlIGFuIGlt
cGxpY2l0IHN5bmMgdGhlIGltcGxpY2F0aW9uCmlzIHRoYXQgaXQgaXMgY292ZXJpbmcgb3ZlciBh
IGJ1Zy4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
