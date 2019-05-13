Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0520289956
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 10:43:44 +0000 (UTC)
References: <20190513004508.8042-1-andi@etezian.org>
 <20190513004508.8042-9-andi@etezian.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <da5c01ae-c774-6f3b-a6b3-c6ab38c1795a@linux.intel.com>
Date: Mon, 13 May 2019 11:43:41 +0100
MIME-Version: 1.0
In-Reply-To: <20190513004508.8042-9-andi@etezian.org>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH v23 08/14] test/i915: gem_cs_tlb: use the
 gem_engine_topology library
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
To: Andi Shyti <andi@etezian.org>, IGT dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDEzLzA1LzIwMTkgMDE6NDUsIEFuZGkgU2h5dGkgd3JvdGU6Cj4gRnJvbTogQW5kaSBTaHl0
aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+Cj4gCj4gUmVwbGFjZSB0aGUgbGVnYWN5IGZvcl9lYWNo
X2VuZ2luZSogZGVmaW5lcyB3aXRoIHRoZSBvbmVzCj4gaW1wbGVtZW50ZWQgaW4gdGhlIGdlbV9l
bmdpbmVfdG9wb2xvZ3kgbGlicmFyeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRpIFNoeXRpIDxh
bmRpLnNoeXRpQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4g
LS0tCj4gICB0ZXN0cy9pOTE1L2dlbV9jc190bGIuYyB8IDggKysrKy0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3Rlc3RzL2k5MTUvZ2VtX2NzX3RsYi5jIGIvdGVzdHMvaTkxNS9nZW1fY3NfdGxiLmMKPiBpbmRl
eCA1MWUxYzRlMTk5MzAuLjEzZGU1NDk5ZjFjNyAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2dl
bV9jc190bGIuYwo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX2NzX3RsYi5jCj4gQEAgLTE0MCw3ICsx
NDAsNyBAQCBzdGF0aWMgdm9pZCBydW5fb25fcmluZyhpbnQgZmQsIHVuc2lnbmVkIHJpbmdfaWQs
IGNvbnN0IGNoYXIgKnJpbmdfbmFtZSkKPiAgIAo+ICAgaWd0X21haW4KPiAgIHsKPiAtCWNvbnN0
IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lICplOwo+ICsJY29uc3Qgc3RydWN0IGludGVs
X2V4ZWN1dGlvbl9lbmdpbmUyICplOwo+ICAgCWludCBmZCA9IC0xOwo+ICAgCj4gICAJaWd0X3Nr
aXBfb25fc2ltdWxhdGlvbigpOwo+IEBAIC0xNTAsOSArMTUwLDkgQEAgaWd0X21haW4KPiAgIAkJ
aWd0X3JlcXVpcmVfZ2VtKGZkKTsKPiAgIAl9Cj4gICAKPiAtCWZvciAoZSA9IGludGVsX2V4ZWN1
dGlvbl9lbmdpbmVzOyBlLT5uYW1lOyBlKyspCj4gLQkJaWd0X3N1YnRlc3RfZigiJXMlcyIsIGUt
PmV4ZWNfaWQgPyAiIiA6ICJiYXNpYy0iLCBlLT5uYW1lKQo+IC0JCQlydW5fb25fcmluZyhmZCwg
ZS0+ZXhlY19pZCB8IGUtPmZsYWdzLCBlLT5uYW1lKTsKPiArCV9fZm9yX2VhY2hfcGh5c2ljYWxf
ZW5naW5lKGZkLCBlKQo+ICsJCWlndF9zdWJ0ZXN0X2YoIiVzIiwgZS0+bmFtZSkKPiArCQkJcnVu
X29uX3JpbmcoZmQsIGUtPmZsYWdzLCBlLT5uYW1lKTsKPiAgIAo+ICAgCWlndF9maXh0dXJlCj4g
ICAJCWNsb3NlKGZkKTsKPiAKClJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVy
c3VsaW5AaW50ZWwuY29tPgoKUmVnYXJkcywKClR2cnRrbwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXY=
