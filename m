Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C820E6E808
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2019 12:30:34 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191128121922.GA22156@intel.com>
References: <20191128112733.16542-1-ramalingam.c@intel.com>
 <20191128113535.GA16857@intel.com>
 <157494144413.7216.543982190380419945@skylake-alporthouse-com>
 <20191128121922.GA22156@intel.com>
Message-ID: <157494422990.7216.16753135990831162558@skylake-alporthouse-com>
Date: Thu, 28 Nov 2019 12:30:29 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/dumb_buffer: Tests for creation
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBSYW1hbGluZ2FtIEMgKDIwMTktMTEtMjggMTI6MTk6MjIpCj4gT24gMjAxOS0xMS0y
OCBhdCAxMTo0NDowNCArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gUXVvdGluZyBSYW1h
bGluZ2FtIEMgKDIwMTktMTEtMjggMTE6MzU6MzYpCj4gPiA+IE9uIDIwMTktMTEtMjggYXQgMTY6
NTc6MzMgKzA1MzAsIFJhbWFsaW5nYW0gQyB3cm90ZToKPiA+ID4gPiBUZXN0cyBhcmUgZGV2ZWxv
cGVkIGZvciBkdW1iIGJ1ZmZlciBjcmVhdGlvbi4KPiA+ID4gPiAKPiA+ID4gPiB2MjoKPiA+ID4g
PiAgIE1hZGUgYXMgYSBnZW5lcmljIHRlc3QgZm9yIGR1bWIgYnVmZmVyIGNyZWF0aW9uIFtDaHJp
c10KPiA+ID4gQ2hyaXMsCj4gPiA+IAo+ID4gPiBBcyB5b3UgaGF2ZSBtZW50aW9uZWQgSSBoYXZl
IG1hZGUgdGhpcyBhcyBnZW5lcmljIHRlc3QuCj4gPiAKPiA+IFdlIGhhdmUgYSBkaWZmZXJlbnQg
aWRlYSBhYm91dCBnZW5lcmljIDopCj4gPiAKPiA+IGdlbV93cml0ZS9nZW1fcmVhZCBhcmUgaTkx
NSBpb2N0bHMuCj4gPiAKPiA+IFdlIHdhbnQgdG8gb25seSB1c2UgRFVNQl9DUkVBVEUsIERVTUJf
TU1BUCwgRFVNQl9ERVNUUk9ZIGFuZCB0aGVuIGl0Cj4gPiB3aWxsIHdvcmsgd2l0aCBEUklWRVJf
QU5ZLgo+IEV4Y2VwdCBEVU1QX01NQVAgdXNlZCBhbGwgb3RoZXIgc3R1ZmYuLi4gbWlzc2VkIHRo
YXQgZ2VtX3JlYWQgaXMgdXNpbmcKPiBEUk1fSU9DVExfSTkxNV9HRU1fUFJFQUQuIEkgdHJpZWQg
d2l0aCBkdW1iX21tYXAgKyBtZW1fY3B5IGluc3RlYWQgb2YgZ2VtX3JlYWQuIEJ1dCBmYWlsZWQg
dGhlcmUgZm9yIHVua25vd24gcmVhc29ucy4KCkhtbS4gV2UgZG9uJ3QgbmVlZCBhIERVTUJfU1lO
QyBhcyBhIGR1bWIgYnVmZmVyIHNob3VsZCBuZXZlciBiZSBhY2Nlc3NlZApieSBhbnl0aGluZyBv
dGhlciB0aGFuIERVTUJfTU1BUCAobm8gR1BVIHJlbmRlcmluZykgYW5kIHNjYW5vdXQgKHJlYWQK
ZnJvbSBIVywgbmV2ZXIgd3JpdGUpLiBTbyBHUFUgY29oZXJlbmN5IGlzc3VlcyBhcmUgb3V0c2lk
ZSB0aGUgc2NvcGUgb2YKdGhlIGR1bWIgYXBpLCBidXQgaWYgeW91IGNhbiBmaW5kIHN0YWxlIGRh
dGEganVzdCBieSB1c2luZyBEVU1CX01NQVAgd2UKbmVlZCB0byBmaXggdGhhdCBwcm9udG8uCi1D
aHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
