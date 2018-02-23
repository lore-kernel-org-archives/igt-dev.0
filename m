Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D9D6F093
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2018 10:01:44 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <151937767192.26255.16441034774256890811@mail.alporthouse.com>
References: <20180221231947.4184-11-antonio.argenziano@intel.com>
 <20180223005438.26761-1-antonio.argenziano@intel.com>
 <151937767192.26255.16441034774256890811@mail.alporthouse.com>
Message-ID: <151938009582.26255.1852094568625270236@mail.alporthouse.com>
Date: Fri, 23 Feb 2018 10:01:35 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v3] igt: Use lib gem_execbuf where
 possible
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

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMDItMjMgMDk6MjE6MTEpCj4gUXVvdGluZyBBbnRv
bmlvIEFyZ2Vuemlhbm8gKDIwMTgtMDItMjMgMDA6NTQ6MzgpCj4gPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvZ2VtX2V4ZWNfZmVuY2UuYyBiL3Rlc3RzL2dlbV9leGVjX2ZlbmNlLmMKPiA+IGluZGV4IGI0
MTUxOTlmLi45ZDk1Yzk4MiAxMDA2NDQKPiA+IC0tLSBhL3Rlc3RzL2dlbV9leGVjX2ZlbmNlLmMK
PiA+ICsrKyBiL3Rlc3RzL2dlbV9leGVjX2ZlbmNlLmMKPiA+IEBAIC01NjUsNyArNTUzLDcgQEAg
c3RhdGljIHZvaWQgdGVzdF9rZWVwX2luX2ZlbmNlKGludCBmZCwgdW5zaWduZWQgaW50IGVuZ2lu
ZSwgdW5zaWduZWQgaW50IGZsYWdzKQo+ID4gICAgICAgICBsYXN0ID0gLTE7Cj4gPiAgICAgICAg
IGNvdW50ID0gMDsKPiA+ICAgICAgICAgZG8gewo+ID4gLSAgICAgICAgICAgICAgIGludCBlcnIg
PSBfX2V4ZWNidWYoZmQsICZleGVjYnVmKTsKPiA+ICsgICAgICAgICAgICAgICBpbnQgZXJyID0g
X19nZW1fZXhlY2J1Zl93cihmZCwgJmV4ZWNidWYpOwo+IAo+IERhcm4uIEJ1dCB0aGlzIHN0aWxs
IGNhbGxzIGRybUlvY3RsKCkgYW5kIHdlIG5lZWQgdGhlIEVJTlRSIGVzY2FwZS4KCkRyb3BwZWQg
dGhlIGh1bmtzIHRvIGdlbV9leGVjX2ZlbmNlIGFuZCBwdXNoZWQuIFRoYW5rcyEKLUNocmlzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
