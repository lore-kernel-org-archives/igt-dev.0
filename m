Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135F86E484
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2019 12:41:49 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <157307550308.26738.15877789316829631152@skylake-alporthouse-com>
References: <20191105193454.4611-1-imre.deak@intel.com>
 <20191105214220.6394-1-imre.deak@intel.com>
 <157303870005.24928.3132671099761392777@skylake-alporthouse-com>
 <20191106160016.GA2077@ideak-desk.fi.intel.com>
 <157305687595.26738.10985391469160168336@skylake-alporthouse-com>
 <20191106163649.GB2077@ideak-desk.fi.intel.com>
 <157305975054.26738.7202718363105466782@skylake-alporthouse-com>
 <20191106190410.GA4718@ideak-desk.fi.intel.com>
 <157307550308.26738.15877789316829631152@skylake-alporthouse-com>
Message-ID: <157313049529.1799.6842248427029326412@skylake-alporthouse-com>
Date: Thu, 07 Nov 2019 12:41:35 +0000
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

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMTEtMDYgMjE6MjU6MDMpCj4gUXVvdGluZyBJbXJl
IERlYWsgKDIwMTktMTEtMDYgMTk6MDQ6MTApCj4gPiBBbiBBUEkgdG8gY3JlYXRlIHRoZSBwYWdl
dGFibGUgYXQgYSBoaWdoZXIgbGV2ZWwgd291bGQgYmUgbW9yZSBlZmZpY2llbnQKPiA+IGluIGFu
eSBjYXNlLiBBcmUgeW91IG9rIGltcGxlbWVudGluZyB0aGF0IGFzIGEgZm9sbG93LXVwIGFuZCBz
dGFydGluZwo+ID4gd2l0aCB0aGUgY3VycmVudCBhcHByb2FjaD8KPiAKPiBJJ20gb2sgd2l0aCBh
Y2NlcHRpbmcgdGhpcyBhcyBwcm9vZiB3ZSBjYW4gZG8gZW5kLXRvLWVuZCBjb21wcmVzc2lvbgo+
IG9udG8gc2Nhbm91dC4gQnV0IHRoZXJlJ3MgcGxlbnR5IG9mIHdvcmsgaWYgd2Ugd2FudCB0byB0
cnkgYW5kIGJyZWFrIHRoZQo+IGtlcm5lbCA6LXAKClN1ZmZpY2UgdG8gc2F5LCBmaXggdXAgdGhl
IHJlbG9jIGRlbHRhLCBhbmQgaGF2ZSBhIApSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJp
c0BjaHJpcy13aWxzb24uY28udWs+CmZvciB0aGUgc2VyaWVzLiBJIGRpZCBub3QgY2hlY2sgdGhl
IHNoaWZ0cyBhZ2FpbnN0IHNwZWMsIGJ1dCB0aGUKc3RydWN0dXJlIGxvb2tzIHNhbmUuCi1DaHJp
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
