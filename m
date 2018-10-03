Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2125B6E42A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Oct 2018 10:25:40 +0000 (UTC)
Date: Wed, 3 Oct 2018 13:25:36 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20181003102536.GF17124@platvala-desk.ger.corp.intel.com>
References: <1537977563-18878-1-git-send-email-jyoti.r.yadav@intel.com>
 <1537977563-18878-7-git-send-email-jyoti.r.yadav@intel.com>
 <20181002133801.GH20560@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181002133801.GH20560@ideak-desk.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1 6/6] [intel-gfx] tests/Makefile :
 Added new file tests/pm_dc.c for compilation.
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
To: Imre Deak <imre.deak@intel.com>
Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>, igt-dev@lists.freedesktop.org, anusha.srivatsa@intel.com, intel-gfx@lists.freedektop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDIsIDIwMTggYXQgMDQ6Mzg6MDFQTSArMDMwMCwgSW1yZSBEZWFrIHdyb3Rl
Ogo+IE9uIFdlZCwgU2VwIDI2LCAyMDE4IGF0IDExOjU5OjIzQU0gLTA0MDAsIEp5b3RpIFlhZGF2
IHdyb3RlOgo+ID4gU2lnbmVkLW9mZi1ieTogSnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50
ZWwuY29tPgo+ID4gLS0tCj4gPiAgdGVzdHMvTWFrZWZpbGUuc291cmNlcyB8IDEgKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
TWFrZWZpbGUuc291cmNlcyBiL3Rlc3RzL01ha2VmaWxlLnNvdXJjZXMKPiA+IGluZGV4IGM4NDkz
M2YuLmQ0OTE0MjAgMTAwNjQ0Cj4gPiAtLS0gYS90ZXN0cy9NYWtlZmlsZS5zb3VyY2VzCj4gPiAr
KysgYi90ZXN0cy9NYWtlZmlsZS5zb3VyY2VzCj4gPiBAQCAtMjE0LDYgKzIxNCw3IEBAIFRFU1RT
X3Byb2dzID0gXAo+ID4gIAlwbV9scHNwIFwKPiA+ICAJcG1fcmM2X3Jlc2lkZW5jeSBcCj4gPiAg
CXBtX3JwbSBcCj4gPiArCXBtX2RjIFwKPiAKPiB0ZXN0cy9tZXNvbi5idWlsZCBhbHNvIG5lZWRz
IHRvIGJlIHVwZGF0ZWQuCj4gCj4gQ0kgZGlkbid0IHJ1biB0aGUgbmV3IHN1YnRlc3RzLCBub3Qg
c3VyZSB3aHksIG1heWJlIGl0IGRlcGVuZHMgb24KPiBtZXNvbi5idWlsZD8KPiAKCkNJIGJ1aWxk
cyB3aXRoIG1lc29uLCB5ZXMuCgpQbGVhc2UgbWFrZSB0aGlzIGNoYW5nZSBpbiB0aGUgc2FtZSBj
b21taXQgdGhhdCBhZGRzIHRoZSB0ZXN0LgoKCi0tIApQZXRyaSBMYXR2YWxhCgoKCgo+ID4gIAlw
bV9ycHMgXAo+ID4gIAlwbV9zc2V1IFwKPiA+ICAJcHJpbWVfYnVzeSBcCj4gPiAtLSAKPiA+IDIu
Ny40Cj4gPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
