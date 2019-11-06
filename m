Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6612B89DC2
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2019 16:14:54 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191106160016.GA2077@ideak-desk.fi.intel.com>
References: <20191105193454.4611-1-imre.deak@intel.com>
 <20191105214220.6394-1-imre.deak@intel.com>
 <157303870005.24928.3132671099761392777@skylake-alporthouse-com>
 <20191106160016.GA2077@ideak-desk.fi.intel.com>
Message-ID: <157305687595.26738.10985391469160168336@skylake-alporthouse-com>
Date: Wed, 06 Nov 2019 16:14:36 +0000
Subject: Re: [igt-dev] [PATCH v3 1/3] lib/rendercopy: Add AUX page table
 support
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org, Brian Welty <brian.welty@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBJbXJlIERlYWsgKDIwMTktMTEtMDYgMTY6MDA6MTYpCj4gT24gV2VkLCBOb3YgMDYs
IDIwMTkgYXQgMTE6MTE6NDBBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gV2hhdCdz
IHRoZSBjb2hlcmVuY3kgbW9kZWwgZm9yIHRoZSBwZ3QtPmJvPyBUaGVyZSdzIGEgbG90IG9mIHdy
aXRlcyBoZXJlCj4gPiBmcm9tIHRoZSBDUFUgaG93IGFyZSB5b3UgbWFraW5nIHN1cmUgdGhleSBh
cmUgdmlzaWJsZSB0byB0aGUgR1BVPwo+IAo+IE15IHVuZGVyc3RhbmRpbmc6IGV4ZWNidWYgd2ls
bCBkbyBhIGNsZmx1c2ggZm9yIHRoZSBidWYgb24gbm9uLUxMQwo+IHBsYXRmb3Jtcywgd2hpbGUg
b24gTExDIHBsYXRmb3JtcyB0aGF0J3Mgbm90IG5lZWRlZDsgbm90IHN1cmUgaWYgdGhlcmUKPiB3
aWxsIGJlIGFueSBub24tTExDIHBsYXRmb3JtcyB3aGVyZSB0aGUgQVVYIHBhZ2V0YWJsZSB3aWxs
IGJlIG5lZWRlZC4KCk5vLCB3ZSBkb24ndCB1bmxlc3MgeW91IHRlbGwgdXMgeW91IG1vZGlmaWVk
IGl0IGJldHdlZW4gYmF0Y2hlcy4gVGhhdAp3b3VsZCBiZSB0aGUgY2FzZSBpZiB5b3Ugd2VyZSB1
c2luZyBkcm1faW50ZWxfYm9fbWFwKHRydWUpIGV2ZXJ5dGltZSwKYnV0IGFnYWluIHRoYXQgd2ls
bCB0aGVuIHN0YWxsIHRoZSBHUFUgYmV0d2VlbiBldmVyeSBiYXRjaCAtLSB3aGljaCB3ZQpkZWZp
bml0ZWx5IGRvIG5vdCB3YW50IHdoZW4gdGVzdGluZyBbYXMgaXQgd2lsbCBoaWRlIGV2ZXJ5IGJ1
Z10gOikKCj4gT24gdG9wIG9mIHRoYXQgdGhlIEFVWCBHQU0gaGFzIGl0cyBvd24gY2FjaGVzIC0g
Zm91bmQgdGhhdCBub3cgaW4gYW4gSFNECj4gZG9jIC0gd2hpY2ggd2lsbCBiZSBpbnZhbGlkYXRl
ZCB3aGVuZXZlciBHQU0ncyB0b3AgbGV2ZWwgdGFibGUgYmFzZQo+IHBvaW50ZXIgcmVnaXN0ZXIg
aXMgc2V0IGZyb20gdGhlIGNvbnRleHQgaW1hZ2UsIHdoaWNoIGhhcHBlbnMgd2hlbnZlcgo+IHN3
aXRjaGluZyB0byB0aGUgY29udGV4dC4KCkJ1dCBub3QgZm9yIGEgbGl0ZS1yZXN0b3JlPyBTbyB3
ZSBoYXZlIGEgcHJvYmxlbSB3aGVuIHVwZGF0aW5nIGV4aXN0aW5nCmVudHJpZXMgYmV0d2VlbiBi
YXRjaGVzIGluc2lkZSB0aGUgc2FtZSBjb250ZXh0PyBXZSBwdXQgYSBiaWcgaGFtbWVyIGF0CnRo
ZSBmcm9udCBvZiB0aGUgcmVxdWVzdCBmb3IgVExCIGludmFsaWRhdGlvbi4gSWYgdGhlcmUncyBh
IGZsdXNoIHdlIGNhbgphZGQsIHdlIG5lZWQgaXQgdGhlcmUuCi1DaHJpcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
