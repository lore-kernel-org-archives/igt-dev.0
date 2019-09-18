Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469456EEC7
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2019 10:50:02 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190918104533.GW4019@platvala-desk.ger.corp.intel.com>
References: <20190918103518.22012-1-chris@chris-wilson.co.uk>
 <20190918104533.GW4019@platvala-desk.ger.corp.intel.com>
Message-ID: <156880379774.5729.1411264022557053301@skylake-alporthouse-com>
Date: Wed, 18 Sep 2019 11:49:57 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Add signal sender name when
 dying
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTA5LTE4IDExOjQ1OjMzKQo+IE9uIFdlZCwgU2Vw
IDE4LCAyMDE5IGF0IDExOjM1OjE4QU0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFdl
IHdhbnQgdG8ga25vdyB3aG8gc2VudCB1cyB0aGUgZmF0YWwgc2lnbmFsLCBmb3IgdGhlcmUgYXJl
IHBsZW50eSBvZgo+ID4gZmluZ2VycyB0byBnbyBhcm91bmQuCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gQ2M6IFBldHJp
IExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgcnVubmVyL2V4
ZWN1dG9yLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvcnVubmVyL2V4ZWN1dG9yLmMgYi9ydW5uZXIvZXhlY3V0b3IuYwo+ID4gaW5kZXggYzFj
ZmNjZTgzLi5mNzE4MzI5M2QgMTAwNjQ0Cj4gPiAtLS0gYS9ydW5uZXIvZXhlY3V0b3IuYwo+ID4g
KysrIGIvcnVubmVyL2V4ZWN1dG9yLmMKPiA+IEBAIC02MDksNiArNjA5LDI2IEBAIHN0YXRpYyBi
b29sIGtpbGxfY2hpbGQoaW50IHNpZywgcGlkX3QgY2hpbGQpCj4gPiAgICAgICByZXR1cm4gdHJ1
ZTsKPiA+ICB9Cj4gPiAgCj4gPiArc3RhdGljIGNvbnN0IGNoYXIgKmdldF9jbWRsaW5lKHBpZF90
IHBpZCwgY2hhciAqYnVmLCBzaXplX3QgbGVuKQo+ID4gK3sKPiA+ICsgICAgIGludCBmZDsKPiA+
ICsKPiA+ICsgICAgIGlmIChzbnByaW50ZihidWYsIGxlbiwgIi9wcm9jLyVkL2NtZGxpbmUiLCBw
aWQpID4gbGVuKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gInVua25vd24iOwo+ID4gKwo+ID4g
KyAgICAgZmQgPSBvcGVuKGJ1ZiwgT19SRE9OTFkpOwo+ID4gKyAgICAgaWYgKGZkIDwgMCkKPiA+
ICsgICAgICAgICAgICAgcmV0dXJuICJ1bmtub3duIjsKPiA+ICsKPiA+ICsgICAgIGxlbiA9IHJl
YWQoZmQsIGJ1ZiwgbGVuIC0gMSk7Cj4gPiArICAgICBjbG9zZShmZCk7Cj4gPiArICAgICBpZiAo
bGVuIDwgMCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuICJ1bmtub3duIjsKPiA+ICsKPiA+ICsg
ICAgIGJ1ZltsZW5dID0gJ1wwJzsKPiA+ICsgICAgIHJldHVybiBidWY7Cj4gPiArfQo+IAo+IEFy
ZSB5b3UgaW50ZW50aW9uYWxseSBvbmx5IHByaW50aW5nIGFyZ3ZbMF0/IGFyZ3YgaXRlbXMgYXJl
Cj4gXDAtc2VwYXJhdGVkIGluIC9wcm9jLyovY21kbGluZS4KClllcywgd2Ugb25seSB3YW50IGEg
aHVtYW4gZnJpZW5kbHkgcHJvY2VzcyBuYW1lLCBvciBkbyB3ZSBuZWVkIHRoZSBmdWxsCmNtZGxp
bmUgYmVjYXVzZSBpdCdzIGphdmE/Pz8gSWYgaXQncyBqYXZhLCBJJ20gcnVubmluZyBhd2F5Lgot
Q2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
