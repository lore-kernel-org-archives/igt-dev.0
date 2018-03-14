Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479246E316
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Mar 2018 16:18:31 +0000 (UTC)
References: <20180314105411.39866-1-maarten.lankhorst@linux.intel.com>
 <152102545046.515.12129576002521464744@mail.alporthouse.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <27752d94-bb6c-e7dd-3697-7486627832fc@linux.intel.com>
Date: Wed, 14 Mar 2018 17:18:28 +0100
MIME-Version: 1.0
In-Reply-To: <152102545046.515.12129576002521464744@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_panel_fitting: Make test pass
 on gen9's pipe C
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTQtMDMtMTggb20gMTI6MDQgc2NocmVlZiBDaHJpcyBXaWxzb246Cj4gUXVvdGluZyBNYWFy
dGVuIExhbmtob3JzdCAoMjAxOC0wMy0xNCAxMDo1NDoxMSkKPj4gVGhlIGxlZ2FjeSB0ZXN0IGZh
aWxzIGJlY2F1c2UgaXQgdHJpZXMgc2NhbGluZyBvbiBwaXBlIEMsCj4+IGJlY2F1c2UgdGhlIHNp
bmdsZSBzY2FsZXIgaXMgYWxyZWFkeSB1c2VkIGZvciBDUlRDIHNjYWxpbmcuCj4+IE9uIG90aGVy
IHBpcGVzIGFuZCBuZXdlciBnZW5zIHdlIGhhdmUgMiBzY2FsZXJzLCBzbyBzcGVjaWFsCj4+IGNh
c2UgcGlwZSBDIGhlcmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4+IEJ1Z3ppbGxhOiBodHRwczovL2J1
Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDU0NTYKPj4gLS0tCj4+ICB0ZXN0
cy9rbXNfcGFuZWxfZml0dGluZy5jIHwgOCArKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BhbmVsX2ZpdHRpbmcu
YyBiL3Rlc3RzL2ttc19wYW5lbF9maXR0aW5nLmMKPj4gaW5kZXggMWYwODdlY2M4MmEwLi41ZGNl
MTAxMDAzYzUgMTAwNjQ0Cj4+IC0tLSBhL3Rlc3RzL2ttc19wYW5lbF9maXR0aW5nLmMKPj4gKysr
IGIvdGVzdHMva21zX3BhbmVsX2ZpdHRpbmcuYwo+PiBAQCAtMTMzLDYgKzEzMywxNCBAQCBzdGF0
aWMgdm9pZCB0ZXN0X3BhbmVsX2ZpdHRpbmcoZGF0YV90ICpkKQo+PiAgICAgICAgICAgICAgICAg
aWd0X3BsYW5lX3NldF9zaXplKGQtPnBsYW5lMiwgbW9kZS0+aGRpc3BsYXktMjAwLCBtb2RlLT52
ZGlzcGxheS0yMDApOwo+PiAgICAgICAgICAgICAgICAgaWd0X2Rpc3BsYXlfY29tbWl0MihkaXNw
bGF5LCBDT01NSVRfVU5JVkVSU0FMKTsKPj4gIAo+PiArICAgICAgICAgICAgICAgLyoKPj4gKyAg
ICAgICAgICAgICAgICAqIGdlbjkgcGlwZSBDIGhhcyBvbmx5IDEgc2NhbGVyIHNoYXJlZCB3aXRo
IHRoZSBjcnRjLCB3aGljaAo+PiArICAgICAgICAgICAgICAgICogbWVhbnMgcGlwZSBzY2FsaW5n
IGNhbid0IHdvcmsgc2ltdWx0YW5lb3VzbHkgd2l0aCBwYW5lbAo+PiArICAgICAgICAgICAgICAg
ICogZml0dGluZy4KPiArIFNpbmNlIHRoaXMgaXMgdGhlIGxlZ2FjeSBwYXRoLCB1c2Vyc3BhY2Ug
aGFzIHRvIGtub3cgYWJvdXQgdGhlIEhXCj4gbGltaXRhdGlvbnMsIHdoZXJlYXMgYXRvbWljIGNh
biBhc2suCkNvbnNpZGVyaW5nIHRoaXMgdGVzdCB3YXMgYWJvdXQgbWFraW5nIHN1cmUgYm90aCBj
YW4gYmUgdXNlZCBhdCB0aGUgc2FtZSB0aW1lLCBJIHRob3VnaHQgaXQgd2FzIGJldHRlciBub3Qg
dG8gYXNrLiA6KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
