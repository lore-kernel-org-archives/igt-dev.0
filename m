Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C2E6E077
 for <igt-dev@lists.freedesktop.org>; Sat,  1 Sep 2018 09:04:14 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180831135716.28372-1-katarzyna.dec@intel.com>
References: <20180831135716.28372-1-katarzyna.dec@intel.com>
Message-ID: <153579263657.12034.9817034680104806971@skylake-alporthouse-com>
Date: Sat, 01 Sep 2018 10:03:56 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/drmtest: Move open device to
 separate function
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
To: Katarzyna Dec <katarzyna.dec@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLYXRhcnp5bmEgRGVjICgyMDE4LTA4LTMxIDE0OjU3OjE2KQo+IFdoaWxlIHdvcmtp
bmcgb24gSUdUIGNvZGUgYW5kIGR1cmluZyByZXZpZXdlcyBJJ3ZlIG5vdGljZWQgdGhhdAo+IGl0
IGNvdWxkIGJlIG5pY2UgdG8gaGF2ZSBmdW5jdGlvbiB0aGF0IGlzIG9wZW5pbmcgcGFydGljdWxh
ciBkZXZpY2UuCj4gTGV0J3MgbW92ZSBvdXQgY29uZGl0aW9ucyBmb3Igb3BlbmluZyBkZXZpY2Ug
YW5kIHJlbmFtZSBfX29wZW5fZGV2aWNlCj4gdG8gX19zZWFyY2hfYW5kX29wZW4oKSBmdW5jdGlv
bi4KPiAKPiB2MjogUmVmYWN0b3JlZCBvcGVuX2RldmljZSBldmVuIG1vcmUgYnkgZ2V0dGluZyBk
ZXZpY2UgbmFtZSBvbmNlIGFuZAo+IHJldHVybmluZyBmZCBmb3IgaXQuIChDaHJpcykKPiB2Mzog
QWRkZWQgbmFtZV9zaXplIHRvIF9fZ2V0X2RybV9kZXZpY2VfbmFtZSwgcmVtb3ZlZCB1bnVzZWQg
aXNfWF9kZXZpY2UuCj4gdjQ6IEZpeGVkIGNhc2VzIHdpdGggZmFpbGluZyB2aXJ0aW9fZ3B1Cj4g
djU6IFJlYmFzZSwgaW5kZW50IGZpeGVzCj4gCj4gU2lnbmVkLW9mZi1ieTogS2F0YXJ6eW5hIERl
YyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+Cj4gQ2M6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8g
PGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+Cj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrPgoKVGlkaWVkLCByZXZpZXdlZCBhbmQgcHVzaGVkLgotQ2hy
aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
