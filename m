Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF0189D8D
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 13:00:12 +0000 (UTC)
Date: Tue, 12 Mar 2019 15:00:04 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190312130004.GL4038@platvala-desk.ger.corp.intel.com>
References: <20190312112114.1979-1-petri.latvala@intel.com>
 <155239047742.30003.3351260138826147792@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155239047742.30003.3351260138826147792@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/ioctl_wrappers: Assert that
 prime_handle_to_fd returns a valid fd
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBNYXIgMTIsIDIwMTkgYXQgMTE6MzQ6MzdBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgUGV0cmkgTGF0dmFsYSAoMjAxOS0wMy0xMiAxMToyMToxNCkKPiA+IElm
IHRoZSBpb2N0bCBpcyBzdWNjZXNzZnVsLCB0aGUgcmV0dXJuZWQgZmQgc2hvdWxkIGJlIHZhbGlk
LiBDaGVjawo+ID4gdGhhdCBpdCBpcywgdGh1cyBhbHNvIGhlbHBpbmcgc3RhdGljIGFuYWx5c2lz
IGluIGFsbW9zdCA3MCBjYWxsIHNpdGVzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBM
YXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIGxpYi9pb2N0bF93
cmFwcGVycy5jIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9saWIvaW9jdGxfd3JhcHBlcnMuYyBiL2xpYi9pb2N0bF93cmFwcGVy
cy5jCj4gPiBpbmRleCAzOTkyMGY4Ny4uMzE5NjllNzcgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvaW9j
dGxfd3JhcHBlcnMuYwo+ID4gKysrIGIvbGliL2lvY3RsX3dyYXBwZXJzLmMKPiA+IEBAIC0xMzMy
LDYgKzEzMzIsNyBAQCBpbnQgcHJpbWVfaGFuZGxlX3RvX2ZkKGludCBmZCwgdWludDMyX3QgaGFu
ZGxlKQo+ID4gICAgICAgICBhcmdzLmZkID0gLTE7Cj4gPiAgCj4gPiAgICAgICAgIGRvX2lvY3Rs
KGZkLCBEUk1fSU9DVExfUFJJTUVfSEFORExFX1RPX0ZELCAmYXJncyk7Cj4gPiArICAgICAgIGln
dF9hc3NlcnRfZmQoYXJncy5mZCk7Cj4gCj4gV2h5PyBXaHkgd291bGQgd2UgYmUgdXNpbmcgYSBz
dGF0aWMgYW5hbHlzaXMgdG9vbCB0aGF0IGNvbXBsYWlucyBhYm91dAo+IGZlZWRpbmcgaW52YWxp
ZCBkYXRhIHRvIHRoZSBrZXJuZWwsIGJlY2F1c2UgdGhhdCBpcyBleGFjdGx5IHRoZSBnb2FsIG9m
Cj4gaWd0LgoKQmVjYXVzZSBhZnRlciB0ZWFjaGluZyBpdCB3aGF0IGRhdGEgc2hvdWxkIGJlIGlu
dmFsaWQgYW5kIHdoYXQgc2hvdWxkCmJlIHZhbGlkLCBpdCBoYXMgYWxyZWFkeSByZXZlYWxlZCBh
IGNvdXBsZSBvZiBidWdzPwoKQXJlIHlvdSBvYmplY3RpbmcgdG8gY2hlY2tpbmcgdGhhdCB0aGUg
aW9jdGwgZ2l2ZXMgYW4gZmQgdGhhdCBpcyA+PSAwPwpXaGVyZSdzIHRoZSBsaW5lIGhlcmUsIHdo
YXQgcGFydHMgb2YgdGhlIHVhcGkgc2VtYW50aWNzIG11c3QgYWx3YXlzIGJlCmxlZnQgdW5jaGVj
a2VkIGluIGEgdGVzdCBzdWl0ZSBmb3IgdWFwaT8KCgotLSAKUGV0cmkgTGF0dmFsYQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
