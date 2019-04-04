Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E346E5BF
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2019 22:57:11 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190404223925.1102-2-lucas.demarchi@intel.com>
References: <20190404223925.1102-1-lucas.demarchi@intel.com>
 <20190404223925.1102-2-lucas.demarchi@intel.com>
Message-ID: <155441862108.8259.14904428968269588615@skylake-alporthouse-com>
Date: Thu, 04 Apr 2019 23:57:01 +0100
Subject: Re: [igt-dev] [PATCH 2/4] gem_exec_parallel: do not special case
 the default
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
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMdWNhcyBEZSBNYXJjaGkgKDIwMTktMDQtMDQgMjM6Mzk6MjMpCj4gQSBkZWZhdWx0
IG1ha2VzIHNlbnNlIHdoZW4gaXQncyB0aGUgbW9zdCB1c2VkLgoKSXQncyBub3QgdGhlIG1vc3Qg
dXNlZCBuYW1lLi4uCiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRl
bWFyY2hpQGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvaTkxNS9nZW1fZXhlY19wYXJhbGxlbC5j
IHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYWxsZWwuYyBiL3Rl
c3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYWxsZWwuYwo+IGluZGV4IGE2ZmE2OThlLi5mODMyMGMzYSAx
MDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX3BhcmFsbGVsLmMKPiArKysgYi90ZXN0
cy9pOTE1L2dlbV9leGVjX3BhcmFsbGVsLmMKPiBAQCAtMjMxLDcgKzIzMSw3IEBAIGlndF9tYWlu
Cj4gICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWU7Cj4gICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGZsYWdzOwo+ICAgICAgICAgfSBtb2Rlc1tdID0gewo+IC0gICAgICAgICAgICAgICB7
ICIiLCAwIH0sCj4gKyAgICAgICAgICAgICAgIHsgImJhc2ljIiwgMCB9LAo+ICAgICAgICAgICAg
ICAgICB7ICJjb250ZXh0cyIsIENPTlRFWFRTIH0sCj4gICAgICAgICAgICAgICAgIHsgImZkcyIs
IEZEUyB9LAo+ICAgICAgICAgICAgICAgICB7IE5VTEwgfQo+IEBAIC0yNDYsNyArMjQ2LDcgQEAg
aWd0X21haW4KPiAgICAgICAgIH0KPiAgCj4gICAgICAgICBmb3IgKGNvbnN0IHN0cnVjdCBtb2Rl
ICptID0gbW9kZXM7IG0tPm5hbWU7IG0rKykKPiAtICAgICAgICAgICAgICAgaWd0X3N1YnRlc3Rf
ZigiJXMiLCAqbS0+bmFtZSA/IG0tPm5hbWUgOiAiYmFzaWMiKQo+ICsgICAgICAgICAgICAgICBp
Z3Rfc3VidGVzdF9mKCIlcyIsIG0tPm5hbWUpCj4gICAgICAgICAgICAgICAgICAgICAgICAgYWxs
KGZkLCBBTExfRU5HSU5FUywgbS0+ZmxhZ3MpOwoKSXQgZ2V0cyB1c2VkIGFnYWluIHdoZXJlIGJh
c2ljIHNob3VsZCBub3QgYmUgYWRkZWQuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
