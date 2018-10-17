Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020496E3C8
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Oct 2018 16:07:23 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20181017153013.kvkrmqqowpw4wu4d@ahiler-desk1.fi.intel.com>
References: <20181017121545.29096-1-arkadiusz.hiler@intel.com>
 <153977963993.22931.1527870108804631182@skylake-alporthouse-com>
 <20181017153013.kvkrmqqowpw4wu4d@ahiler-desk1.fi.intel.com>
Message-ID: <153979144594.19935.6782487976794867148@skylake-alporthouse-com>
Date: Wed, 17 Oct 2018 16:50:46 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests: Rename drv_module_reload to
 i915_load
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>, Petri Latvala <petri.latvala@intel.com>, Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTgtMTAtMTcgMTY6MzA6MTMpCj4gT24gV2VkLCBP
Y3QgMTcsIDIwMTggYXQgMDE6MzQ6MDBQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTgtMTAtMTcgMTM6MTU6NDMpCj4gPiA+IFRoZSB0
ZXN0IGlzIGk5MTUgc3BlY2lmaWMsIHNvIGxldCdzIGJlIGNsZWFyIG9uIHRoYXQuIFRoZXJlIGlz
IGFsc28gbW9yZQo+ID4gPiBzdWJ0ZXN0cyBjb21pbmcgdGhhdCBhcmUgbm90IGp1c3QgcmVsb2Fk
aW5nLgo+ID4gCj4gPiBJdCdzIHN0aWxsIGZvY3Vzc2VkIG9uIG1vZHVsZV9sb2FkLCBzbyBJIHdv
dWxkIHdhbnQgdG8ga2VlcCBtb2R1bGUgaW4KPiA+IHRoZXJlIHNvIGl0J3MgY2xlYXJseSBub3Ro
aW5nIHRvIGRvIHdpdGggcnVudGltZSBsb2FkcyAod29ya2xvYWRzKS4KPiAKPiBrCj4gCj4gPiBB
bmQgYWRkaW5nIGEgJ2k5MTUnIGlzIGEgZ29vZCB0aW1lIHRvIHN0YXJ0IGEgaTkxNS8KPiAKPiBJ
IGd1ZXNzIGl0IHN0aWxsIG1ha2VzIHNlbnNlIHRvIGhhdmUgdGhlIGJpbmFyaWVzIGluIGEgc2lu
Z2xlIGRpcmVjdG9yeSwKPiBib3RoIGluIGJ1aWxkIGRpciBhbmQgbGliZXhlYywganVzdCBwcmVm
aXhlZCB3aXRoIHRoZSBmb2xkZXIgbmFtZS4KPiAKPiBXaXRoIG1lc29uIHRoYXQncyBxdWl0ZSBl
YXN5OgoKU2VlbXMgb3ZlcmtpbGwgZm9yICdpOTE1L2k5MTVfbW9kdWxlX2xvYWQnLCBhbmQgbWF5
YmUgbm90IGFsbCBpOTE1Lwp0ZXN0cyB3aWxsIHRoZW1zZWx2ZXMgc3RhcnQgd2l0aCBpOTE1Xz8g
SnVzdCB0aGF0IGk5MTUvIGlzIHRoZQpjb2xsZWN0aW9uIG9mIGk5MTUgc3BlY2lmaWMgdGVzdHMg
KGxpa2UgZ2VtXywgZHJ2X2hhbmdtYW4pLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
