Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FF96E73B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Sep 2018 20:35:22 +0000 (UTC)
References: <20180906195957.34053-1-antonio.argenziano@intel.com>
 <153626422884.16893.3772193550130441840@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <d0c0e331-138e-e861-0723-595f69d7e11e@intel.com>
Date: Thu, 6 Sep 2018 13:35:22 -0700
MIME-Version: 1.0
In-Reply-To: <153626422884.16893.3772193550130441840@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_ctx_isoation: Add warn for
 newer gens.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAwNi8wOS8xOCAxMzowMywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE4LTA5LTA2IDIwOjU5OjU3KQo+PiBBZGQgYSB3YXJuaW5nIHRvIHVw
ZGF0ZSB0ZXN0IGlmIEdFTiB2ZXJzaW9uIGlzIG5vdCByZWNvZ25pemVkLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+
Cj4+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPj4gLS0tCj4+
ICAgdGVzdHMvZ2VtX2N0eF9pc29sYXRpb24uYyB8IDQgKysrLQo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2dlbV9jdHhfaXNvbGF0aW9uLmMgYi90ZXN0cy9nZW1fY3R4X2lzb2xhdGlvbi5jCj4+IGluZGV4
IDQzMjVlMWMyLi5iZDA3YjE0MSAxMDA2NDQKPj4gLS0tIGEvdGVzdHMvZ2VtX2N0eF9pc29sYXRp
b24uYwo+PiArKysgYi90ZXN0cy9nZW1fY3R4X2lzb2xhdGlvbi5jCj4+IEBAIC03MDAsNyArNzAw
LDkgQEAgaWd0X21haW4KPj4gICAgICAgICAgICAgICAgICBpZ3RfcmVxdWlyZShoYXNfY29udGV4
dF9pc29sYXRpb24pOwo+PiAgIAo+PiAgICAgICAgICAgICAgICAgIGdlbiA9IGludGVsX2dlbihp
bnRlbF9nZXRfZHJtX2RldmlkKGZkKSk7Cj4+IC0gICAgICAgICAgICAgICAvL2lndF9jaV9mYWls
X29uKGdlbiA+IExBU1RfS05PV05fR0VOKTsKPj4gKwo+PiArICAgICAgICAgICAgICAgaWd0X3dh
cm5fb25fZihnZW4gPiBMQVNUX0tOT1dOX0dFTiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiR0VOIG5vdCByZWNvZ25pemVkISBUZXN0IG5lZWRzIHRvIGJlIHVwZGF0ZWQgdG8g
cnVuLiIpOwo+PiAgICAgICAgICAgICAgICAgIGlndF9za2lwX29uKGdlbiA+IExBU1RfS05PV05f
R0VOKTsKPiAKPiBVbnF1ZXN0aW9uYWJseSBhbiBpbXByb3ZlbWVudCwKPiBSZXZpZXdlZC1ieTog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gCj4gUmVtZW1iZXIgdG8g
OnNldCBjaW5vPTowLCgwIHRob3VnaCwgaS5lLiBjb250aW51YXRpb24gbGluZXMgc2hvdWxkIGJl
Cj4gaW5kZW50ZWQgdG8gdGhlIGJyYWNrZXQuCgpUaGFua3MsIEknbGwgY2hhbmdlIGl0IHdoZW4g
cHVzaGluZywKCkFudG9uaW8KCj4gLUNocmlzCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
