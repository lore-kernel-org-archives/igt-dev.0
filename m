Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F7D6E105
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jul 2018 08:59:22 +0000 (UTC)
References: <20180724135927.7926-1-maarten.lankhorst@linux.intel.com>
 <20180724135927.7926-3-maarten.lankhorst@linux.intel.com>
 <20180726065546.u3twarazmqdabrs5@platvala-desk.ger.corp.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <bf0e4a75-af54-afa2-506b-72d5cbfd879c@linux.intel.com>
Date: Thu, 26 Jul 2018 10:57:44 +0200
MIME-Version: 1.0
In-Reply-To: <20180726065546.u3twarazmqdabrs5@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_nv12: Add nv12 specific
 tests.
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjYtMDctMTggb20gMDg6NTUgc2NocmVlZiBQZXRyaSBMYXR2YWxhOgo+IE9uIFR1ZSwgSnVs
IDI0LCAyMDE4IGF0IDAzOjU5OjI3UE0gKzAyMDAsIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOgo+
PiBBZGQgdGVzdHMgZXhjZXJjaXNpbmcgc3dpdGNoaW5nIGJldHdlZW4gdmFyaW91cyBzY2FsZWQv
dW5zY2FsZWQKPj4gdHJhbnNpdGlvbnMgdG8gYW5kIGZyb20gTlYxMiwgc2luY2Ugc29tZSBvZiB0
aGUgd29ya2Fyb3VuZHMgbWVudGlvbgo+PiB0aGlzIG1heSBmYWlsLgo+Pgo+PiBXZSBhbHNvIGFk
ZCBOVjEyIHNwZWNpZmljIGNsaXBwaW5nL3NjYWxpbmcgdGVzdHMsIHRvIG1ha2Ugc3VyZQo+PiB0
aGF0IE5WMTIgc3JjIGNvb3JkaW5hdGVzIGFyZSBhbHdheXMgcHJvZ3JhbW1lZCBhcyBhIG11bHRp
cGxlIG9mIDQKPj4gY29ycmVjdGx5LCBhbmQgdmVyaWZ5IHNjYWxpbmcvY2xpcHBpbmcgd29ya3Mg
d2l0aCBDUkMgdGVzdHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4+IC0tLQo+PiAgdGVzdHMvTWFrZWZp
bGUuc291cmNlcyB8ICAgMSArCj4+ICB0ZXN0cy9rbXNfbnYxMi5jICAgICAgIHwgNzQzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICB0ZXN0cy9tZXNvbi5idWls
ZCAgICAgIHwgICAxICsKPj4gIDMgZmlsZXMgY2hhbmdlZCwgNzQ1IGluc2VydGlvbnMoKykKPj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9rbXNfbnYxMi5jCj4+Cj4+IGRpZmYgLS1naXQgYS90
ZXN0cy9NYWtlZmlsZS5zb3VyY2VzIGIvdGVzdHMvTWFrZWZpbGUuc291cmNlcwo+PiBpbmRleCBj
ODQ5MzNmMWQ5NzEuLmRhYjkyNjBmNTg0ZCAxMDA2NDQKPj4gLS0tIGEvdGVzdHMvTWFrZWZpbGUu
c291cmNlcwo+PiArKysgYi90ZXN0cy9NYWtlZmlsZS5zb3VyY2VzCj4+IEBAIC0xOTAsNiArMTkw
LDcgQEAgVEVTVFNfcHJvZ3MgPSBcCj4+ICAJa21zX2ludmFsaWRfZG90Y2xvY2sgXAo+PiAgCWtt
c19sZWdhY3lfY29sb3JrZXkgXAo+PiAgCWttc19tbWFwX3dyaXRlX2NyYyBcCj4+ICsJa21zX252
MTIgXAo+PiAgCWttc19wYW5lbF9maXR0aW5nIFwKPj4gIAlrbXNfcGlwZV9iX2NfaXZiIFwKPj4g
IAlrbXNfcGlwZV9jcmNfYmFzaWMgXAo+PiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX252MTIuYyBi
L3Rlc3RzL2ttc19udjEyLmMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAw
MDAwMDAwLi4wNWFlODNlNTNkZGEKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi90ZXN0cy9rbXNf
bnYxMi5jCj4+IEBAIC0wLDAgKzEsNzQzIEBACj4+ICsvKgo+PiArICogUGVybWlzc2lvbiBpcyBo
ZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEK
Pgo+IFdoZXJlJ3MgdGhlIGNvcHlyaWdodCBsaW5lPwo+Cj4KPgpJbmRlZWQsIGdvb2QgY2F0Y2gu
IDopCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
