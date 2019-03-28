Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFC56E2F4
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2019 08:03:00 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <85345a3cd06beeebed677d0d7333a90b8a9a2e40.camel@intel.com>
References: <20190321085938.17043-1-simon.ser@intel.com>
 <155315913079.22764.16577903388199927509@skylake-alporthouse-com>
 <85345a3cd06beeebed677d0d7333a90b8a9a2e40.camel@intel.com>
Message-ID: <155376016486.24691.16808480006997937692@skylake-alporthouse-com>
Date: Thu, 28 Mar 2019 08:02:44 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_latency: fix
 uninitialized variable
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
To: "Ser, Simon" <simon.ser@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBTZXIsIFNpbW9uICgyMDE5LTAzLTI4IDA3OjU5OjA0KQo+IE9uIFRodSwgMjAxOS0w
My0yMSBhdCAwOTowNSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gUXVvdGluZyBTaW1v
biBTZXIgKDIwMTktMDMtMjEgMDg6NTk6MzgpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNl
ciA8c2ltb24uc2VyQGludGVsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICB0ZXN0cy9pOTE1L2dlbV9l
eGVjX2xhdGVuY3kuYyB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2Vt
X2V4ZWNfbGF0ZW5jeS5jCj4gPiA+IGIvdGVzdHMvaTkxNS9nZW1fZXhlY19sYXRlbmN5LmMKPiA+
ID4gaW5kZXggNmRkMTkxZWMuLjFiMDIyZGY1IDEwMDY0NAo+ID4gPiAtLS0gYS90ZXN0cy9pOTE1
L2dlbV9leGVjX2xhdGVuY3kuYwo+ID4gPiArKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2xhdGVu
Y3kuYwo+ID4gPiBAQCAtNTk3LDcgKzU5Nyw3IEBAIHJ0aG9nX2xhdGVuY3lfb25fcmluZyhpbnQg
ZmQsIHVuc2lnbmVkIGludAo+ID4gPiBlbmdpbmUsIGNvbnN0IGNoYXIgKm5hbWUsIHVuc2lnbmVk
IGluCj4gPiA+ICAgICAgICAgZm9yICh1bnNpZ25lZCBpbnQgY2hpbGQgPSAwOyBjaGlsZCA8IG5l
bmdpbmU7IGNoaWxkKyspIHsKPiA+ID4gICAgICAgICAgICAgICAgIHN0cnVjdCBydF9wa3Qgbm9y
bWFsID0gcmVzdWx0c1tOUEFTUyAqIGNoaWxkICsgMV07Cj4gPiA+ICAgICAgICAgICAgICAgICBp
Z3Rfc3RhdHNfdCBzdGF0czsKPiA+ID4gLSAgICAgICAgICAgICAgIGRvdWJsZSB2YXJpYW5jZTsK
PiA+ID4gKyAgICAgICAgICAgICAgIGRvdWJsZSB2YXJpYW5jZSA9IDAuMDsKPiA+IAo+ID4gSSBr
bm93IEkgcmV2aWV3ZWQgYSBwYXRjaCBieSBQZXRyaSB3aXRoIHRoZSBzYW1lIGZpeC4uLgo+ID4g
LUNocmlzCj4gCj4gSW5kZWVkOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0
Y2gvMjkxODkzLwo+IAo+IEknbGwgbWFyayB0aGlzIG9uZSBhcyBzdXBlcnNlZWRlZC4KCkFuZCBJ
IHB1c2hlZCBQZXRyaSdzIHNvIHRoYXQgd2FybmluZyBzaG91bGQgZGlzYXBwZWFyLgotQ2hyaXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
