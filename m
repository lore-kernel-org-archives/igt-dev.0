Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346B58919E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2019 13:06:25 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190318131043.GB30702@intel.com>
References: <20190215214608.32021-1-prathap.kumar.valsan@intel.com>
 <20190315191555.6792-1-prathap.kumar.valsan@intel.com>
 <20190318131043.GB30702@intel.com>
Message-ID: <155291437385.4168.16028572505368306948@skylake-alporthouse-com>
Date: Mon, 18 Mar 2019 13:06:13 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v7] i915/gem_mocs_settings: Add mocs
 table for icelake
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
To: "Kumar Valsan, Prathap" <prathap.kumar.valsan@intel.com>, Lis Tomasz <tomasz.lis@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLdW1hciBWYWxzYW4sIFByYXRoYXAgKDIwMTktMDMtMTggMTM6MTA6NDMpCj4gT24g
RnJpLCBNYXIgMTUsIDIwMTkgYXQgMDM6MTU6NTVQTSAtMDQwMCwgUHJhdGhhcCBLdW1hciBWYWxz
YW4gd3JvdGU6Cj4gPiArc3RhdGljIHZvaWQgaXNvbGF0aW9uX3Rlc3QoaW50IGZkLCB1bnNpZ25l
ZCBlbmdpbmUpCj4gPiArewo+ID4gKyAgICAgdWludDMyX3QgY3R4WzJdID0geyBnZW1fY29udGV4
dF9jcmVhdGUoZmQpLCBnZW1fY29udGV4dF9jcmVhdGUoZmQpIH07Cj4gPiArCj4gPiArICAgICAv
KiBBbnkgd3JpdGVzIGJ5IG9uZSBub3JtYWwgY2xpZW50IHNob3VsZCBub3QgYWZmZWN0IGEgc2Vj
b25kIGNsaWVudCAqLwo+ID4gKyAgICAgd3JpdGVfZGlydHlfbW9jcyhmZCwgZW5naW5lLCBjdHhb
MF0sIGZhbHNlKTsKPiA+ICsgICAgIGNoZWNrX21vY3NfdmFsdWVzKGZkLCBlbmdpbmUsIGN0eFsx
XSwgZmFsc2UpOwo+ID4gKwo+ID4gKyAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KGN0eCk7IGkrKykKPiA+ICsgICAgICAgICAgICAgZ2VtX2NvbnRleHRfZGVzdHJveShmZCwgY3R4
W2ldKTsKPiA+ICt9Cj4gPiArCj4gPiAgaWd0X21haW4KPiA+ICB7Cj4gPiAgICAgICBjb25zdCBz
dHJ1Y3QgaW50ZWxfZXhlY3V0aW9uX2VuZ2luZSAqZTsKPiA+IEBAIC00OTAsNiArNTU5LDE0IEBA
IGlndF9tYWluCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICB9Cj4gPiArCj4gPiArICAgICAgICAg
ICAgIGlndF9zdWJ0ZXN0X2YoIm1vY3MtaXNvbGF0aW9uLSVzIiwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGUtPm5hbWUpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBnZW1f
cmVxdWlyZV9jb250ZXh0cyhmZCk7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgICAgICAgaXNv
bGF0aW9uX3Rlc3QoZmQsIGUtPmV4ZWNfaWQgfCBlLT5mbGFncyk7Cj4gPiArICAgICAgICAgICAg
IH0KPiA+ICsKPiA+ICAgICAgIH0KPiBDaHJpcywKPiBBZGRlZCBpc29sYXRpb25fdGVzdCBhcyBh
IHN1YnRlc3QuIENhbiBpIGdldCBhIHItYiBpZiB0aGlzIGxvb2tzIGdvb2QgdG8KPiB5b3UuCgpZ
dXAsIHRoYXQgbG9va3MgbGlrZSB3aGF0IEkgZXhwZWN0IHdlIG5lZWQgdG8gdmVyaWZ5IHRoZSBB
QkkgdGhhdCBtb2NzCnZhbHVlcyBhcmUgaW5kZXBlbmRlbnQgd2l0aG91dCBvdmVyYnVyZGVuaW5n
IG91cnNlbHZlcyB3aXRoIGFjdHVhbCBIVwppbXBsZW1lbnRhdGlvbi4KClJldmlld2VkLWJ5OiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
