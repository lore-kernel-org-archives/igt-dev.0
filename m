Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C5C6EBC9
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2019 19:26:45 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191112183908.1711141-1-vanshidhar.r.konda@intel.com>
 <20191112183908.1711141-2-vanshidhar.r.konda@intel.com>
In-Reply-To: <20191112183908.1711141-2-vanshidhar.r.konda@intel.com>
Message-ID: <157358679840.13929.5417683729804579288@skylake-alporthouse-com>
Date: Tue, 12 Nov 2019 19:26:38 +0000
Subject: Re: [igt-dev] [RFC PATCH 1/1] i915/gem_tiled_blits: Avoid
 SET_TILING on Gen 9+
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
To: Vanshidhar Konda <vanshidhar.r.konda@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWYW5zaGlkaGFyIEtvbmRhICgyMDE5LTExLTEyIDE4OjM5OjA4KQo+IFRoZSB0ZXN0
IGN1cnJlbnRseSB1c2VzIFNFVF9USUxJTkcgSU9DVEwgZm9yIGJ1ZmZlciBvYmplY3RzLiBUaGlz
IElPQ1RMCj4gaXMgbm90IHN1cHBvcnRlZCBvbiBHZW4xMiBhbmQgYmV5b25kLiBVcGRhdGUgdGhl
IHRlc3QgdG8gdXNlCj4gaWd0X2JsaXR0ZXJfZmFzdF9jb3B5X19yYXcoKSBvbiBHZW4gOSsgLSB0
aGlzIGF2b2lkcyBoYXZlIHRvIHVzZQo+IFNFVF9USUxJTkcgSU9DVEwgYXMgd2VsbCBhcyBpbmNy
ZWFzZXMgdGhlIHVzYWdlIG9mCj4gaWd0X2JsaXR0ZXJfZmFzdF9jb3B5X19yYXcoKSBtZXRob2Qg
YXZhaWxhYmxlIGluIHRoZSBsaWJyYXJ5LgoKSSB3b3VsZCBtdWNoIHByZWZlciBub3QgdG8gbWl4
IGFuZCBtYXRjaCBsaWJkcm0gd2l0aCBuYXRpdmUuIEp1c3QKY29udmVydCBpdCB0byBuYXRpdmUu
Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
