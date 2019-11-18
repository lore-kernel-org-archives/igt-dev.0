Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA496E3FC
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2019 10:41:47 +0000 (UTC)
Date: Mon, 18 Nov 2019 12:41:44 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20191118104144.GW25209@platvala-desk.ger.corp.intel.com>
References: <20191118101731.22772-1-petri.latvala@intel.com>
 <157407320026.24372.5679256947699482048@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157407320026.24372.5679256947699482048@skylake-alporthouse-com>
Subject: Re: [igt-dev] [CI PATCH i-g-t 1/1] i915/gem_exec_basic: Use dynamic
 subtests
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

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTA6MzM6MjBBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgUGV0cmkgTGF0dmFsYSAoMjAxOS0xMS0xOCAxMDoxNzozMSkKPiA+IElu
c3RlYWQgb2YgZ2VuZXJhdGluZyBhIHN1YnRlc3QgZm9yIGVhY2ggZW5naW5lIGluIGEgc3RhdGlj
IGxpc3QsCj4gPiBjb252ZXJ0IHRvIGR5bmFtaWMgc3VidGVzdHMsIHdpdGggb25lIGR5bmFtaWMg
c3VidGVzdCBwZXIgYWN0dWFsbHkKPiA+IHByZXNlbnQgcGh5c2ljYWwgZW5naW5lLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4K
PiA+IFJldmlld2VkLWJ5OiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4K
PiA+IC0tLQo+ID4gIHRlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYyB8IDI2ICsrKysrKysrKysr
KysrKysrKystLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9leGVjX2Jh
c2ljLmMgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMKPiA+IGluZGV4IDEyODc4NjBiLi5i
MmQ2ZGRjMiAxMDA2NDQKPiA+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYwo+ID4g
KysrIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19iYXNpYy5jCj4gPiBAQCAtMTU5LDEzICsxNTksMjUg
QEAgaWd0X21haW4KPiA+ICAgICAgICAgaWd0X3N1YnRlc3QoImd0dC1hbGwiKQo+ID4gICAgICAg
ICAgICAgICAgIGd0dF9hbGwoZmQpOwo+ID4gIAo+ID4gLSAgICAgICBfX2Zvcl9lYWNoX3BoeXNp
Y2FsX2VuZ2luZShmZCwgZSkgewo+ID4gLSAgICAgICAgICAgICAgIGlndF9zdWJ0ZXN0X2YoImJh
c2ljLSVzIiwgZS0+bmFtZSkKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIG5vb3AoZmQsIGUt
PmZsYWdzKTsKPiA+IC0gICAgICAgICAgICAgICBpZ3Rfc3VidGVzdF9mKCJyZWFkb25seS0lcyIs
IGUtPm5hbWUpCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICByZWFkb25seShmZCwgZS0+Zmxh
Z3MpOwo+ID4gLSAgICAgICAgICAgICAgIGlndF9zdWJ0ZXN0X2YoImd0dC0lcyIsIGUtPm5hbWUp
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBndHQoZmQsIGUtPmZsYWdzKTsKPiA+ICsgICAg
ICAgaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljX3N1YnN1YnRlc3RzKCJiYXNpYyIpIHsKPiAKPiBp
Z3Rfc3VidGVzdF93aXRoX2R5bmFtaWMoImJhc2ljIikKPiAKPiA+ICsgICAgICAgICAgICAgICBf
X2Zvcl9lYWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZSkgewo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgaWd0X2R5bmFtaWNfc3Vic3VidGVzdF9mKCIlcyIsIGUtPm5hbWUpCj4gCj4gaWd0X2R5
bmFtaWNfZigpCgpJIHRoaW5rIHdlIG1pZ2h0IGhhdmUgYSB3aW5uZXIgZm9yIHRoZSBuYW1pbmcu
CgoKLS0gClBldHJpIExhdHZhbGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2
