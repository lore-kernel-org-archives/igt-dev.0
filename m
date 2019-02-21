Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8E68935A
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 22:08:31 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190221192745.31178-1-antonio.argenziano@intel.com>
 <20190221192745.31178-2-antonio.argenziano@intel.com>
 <155077838923.4937.5133375546234436543@skylake-alporthouse-com>
 <21c2072d-f92d-d32f-9fa2-f07152d1213e@intel.com>
In-Reply-To: <21c2072d-f92d-d32f-9fa2-f07152d1213e@intel.com>
Message-ID: <155078690577.4937.9977005494640953101@skylake-alporthouse-com>
Date: Thu, 21 Feb 2019 22:08:25 +0000
Subject: Re: [igt-dev] [RFC 1/5] tests/prime_self_import: Swap gtt mapping
 for cpu
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

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMjEgMjE6NTE6MTQpCj4gCj4gCj4g
T24gMjEvMDIvMTkgMTE6NDYsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAyLTIxIDE5OjI3OjQxKQo+ID4+IFRoZSB0ZXN0IHVzZXMgZ3R0
IG1hcHBpbmcgdG8gY2hlY2sgdHdvIEJPcyBoYXZlIHRoZSBzYW1lIGNvbnRlbnQsIHNpbmNlCj4g
Pj4gaXQgc2VlbXMgdGhlcmUgaXMgbm8gY29udGVudGlvbiBvbiB0aGUgQk9zIHVzZSBjcHUgbWFw
cGluZyB0byBtYWtlIGl0Cj4gPj4gY29tcGF0aWJsZSB3aXRoIHBsYXRmb3JtcyB0aGF0IGRvIG5v
dCBoYXZlIGEgbWFwcGFibGUgYXBlcnR1cmUuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbnRv
bmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4gPj4gLS0tCj4g
Pj4gICB0ZXN0cy9wcmltZV9zZWxmX2ltcG9ydC5jIHwgNCArKy0tCj4gPj4gICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdp
dCBhL3Rlc3RzL3ByaW1lX3NlbGZfaW1wb3J0LmMgYi90ZXN0cy9wcmltZV9zZWxmX2ltcG9ydC5j
Cj4gPj4gaW5kZXggOGM0ZjUzMjEuLjkwNWZmZmZiIDEwMDY0NAo+ID4+IC0tLSBhL3Rlc3RzL3By
aW1lX3NlbGZfaW1wb3J0LmMKPiA+PiArKysgYi90ZXN0cy9wcmltZV9zZWxmX2ltcG9ydC5jCj4g
Pj4gQEAgLTU5LDggKzU5LDggQEAgY2hlY2tfYm8oaW50IGZkMSwgdWludDMyX3QgaGFuZGxlMSwg
aW50IGZkMiwgdWludDMyX3QgaGFuZGxlMikKPiA+PiAgICAgICAgICBjaGFyICpwdHIxLCAqcHRy
MjsKPiA+PiAgICAgICAgICBpbnQgaTsKPiA+PiAgIAo+ID4+IC0gICAgICAgcHRyMSA9IGdlbV9t
bWFwX19ndHQoZmQxLCBoYW5kbGUxLCBCT19TSVpFLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFKTsK
PiA+PiAtICAgICAgIHB0cjIgPSBnZW1fbW1hcF9fZ3R0KGZkMiwgaGFuZGxlMiwgQk9fU0laRSwg
UFJPVF9SRUFEIHwgUFJPVF9XUklURSk7Cj4gPj4gKyAgICAgICBwdHIxID0gZ2VtX21tYXBfX2Nw
dShmZDEsIGhhbmRsZTEsIDAsIEJPX1NJWkUsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUpOwo+ID4+
ICsgICAgICAgcHRyMiA9IGdlbV9tbWFwX19jcHUoZmQyLCBoYW5kbGUyLCAwLCBCT19TSVpFLCBQ
Uk9UX1JFQUQgfCBQUk9UX1dSSVRFKTsKPiA+IAo+ID4gc2V0X2RvbWFpbigpIHdvdWxkIGJlIHJl
cXVpcmVkIGZvciBwZWRhZ29neSwgbW1hcF9fZ3R0IGlzIG1hZ2ljLgo+IAo+IFdoeSBkbyB3ZSBu
ZWVkIHRoZSBzZXRfZG9tYWluIGhlcmU/IEl0IGxvb2tzIGxpa2Ugd2UgYXJlIG5vdCB3cml0aW5n
IHRvIAo+IHRob3NlIEJPcy4KCmdlbV9tbWFwX19ndHQoKSBpcyBhbiBpbXBsaWNpdCBzZXRfZG9t
YWluLCBnZW1fbW1hcF9fY3B1KCkgaXMgbm90LgooTGVhcm4gZnJvbSBvdXIgbWlzdGFrZXMhKQoK
Y2hlY2tfYm8gaXMgYm90aCBhIHJlYWRlciBhbmQgd3JpdGVyCi1DaHJpcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
