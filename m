Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC0D6E053
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 00:24:24 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190215000448.35496-1-antonio.argenziano@intel.com>
 <155018971092.19733.897425551786762625@skylake-alporthouse-com>
 <a5c0f02d-50d3-062a-aff9-54e0a0910a28@intel.com>
In-Reply-To: <a5c0f02d-50d3-062a-aff9-54e0a0910a28@intel.com>
Message-ID: <155019025967.25941.10278206653525522646@skylake-alporthouse-com>
Date: Fri, 15 Feb 2019 00:24:19 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_exec_schedule.c:
 Switch to gem_sync and gem_read
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMTUgMDA6MjE6NDUpCj4gCj4gCj4g
T24gMTQvMDIvMTkgMTY6MTUsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAyLTE1IDAwOjA0OjQ4KQo+ID4+ICsKPiA+PiArICAgICAgIHJl
dHVybiB2YWx1ZTsKPiA+PiArCj4gPj4gK30KPiA+PiArCj4gPj4gK3N0YXRpYyBpbmxpbmUKPiA+
PiArdm9pZCBfX3N5bmNfcmFuZ2VfcmVhZF91MzIoaW50IGZkLCB1aW50MzJfdCBoYW5kbGUsIHVp
bnQzMl90ICpkZXN0LCB1aW50NjRfdCBzaXplKQo+ID4gCj4gPiBJIHByb2JhYmx5IHdvdWxkIGhh
dmUgZ29uZSB3aXRoIHN5bmNfcmVhZF91MzJfY291bnQsIG9yCj4gPiBzeW5jX3JlYWQodm9pZCAq
ZHN0LCB1aW50NjRfdCBzaXplKQo+IAo+IFdvdWxkbid0IHlvdSBzdGlsbCBuZWVkIGFuIGhhbmRs
ZSBpbiB0aGlzIF4KCkFuZCB0aGUgZmQsIG9mYy4gSnVzdCB1c2luZyBzdWdnZXN0aXZlLUMuCi1D
aHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
