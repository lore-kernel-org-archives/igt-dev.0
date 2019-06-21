Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC886E440
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2019 10:22:04 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190621100345.20019-1-ramalingam.c@intel.com>
 <20190621100345.20019-19-ramalingam.c@intel.com>
In-Reply-To: <20190621100345.20019-19-ramalingam.c@intel.com>
Message-ID: <156111251798.2401.4267037283995089197@skylake-alporthouse-com>
Date: Fri, 21 Jun 2019 11:21:58 +0100
Subject: Re: [igt-dev] [RFC v2 18/43] tests/i915/gem_exec_create: use the
 gem_engine_topology library
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
To: Ramalingam C <ramalingam.c@intel.com>, andi@etezian.org, igt-dev@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBSYW1hbGluZ2FtIEMgKDIwMTktMDYtMjEgMTE6MDM6MjApCj4gUmVwbGFjZSB0aGUg
bGVnYWN5IGZvcl9lYWNoX2VuZ2luZSogZGVmaW5lcyB3aXRoIHRoZSBvbmVzCj4gaW1wbGVtZW50
ZWQgaW4gdGhlIGdlbV9lbmdpbmVfdG9wb2xvZ3kgbGlicmFyeS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2k5
MTUvZ2VtX2V4ZWNfY3JlYXRlLmMgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dl
bV9leGVjX2NyZWF0ZS5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19jcmVhdGUuYwo+IGluZGV4IDU0
YTI0MjllNDlkOS4uOWUyMTMyMGQwMjIxIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4
ZWNfY3JlYXRlLmMKPiArKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2NyZWF0ZS5jCj4gQEAgLTYz
LDExICs2MywxMSBAQCBzdGF0aWMgdm9pZCBhbGwoaW50IGZkLCB1bnNpZ25lZCBmbGFncywgaW50
IHRpbWVvdXQsIGludCBuY3B1cykKPiAgICAgICAgIHN0cnVjdCBkcm1faTkxNV9nZW1fZXhlY19v
YmplY3QyIG9iajsKPiAgICAgICAgIHVuc2lnbmVkIGVuZ2luZXNbMTZdOwo+ICAgICAgICAgdW5z
aWduZWQgbmVuZ2luZTsKPiAtICAgICAgIHVuc2lnbmVkIGVuZ2luZTsKPiArICAgICAgIGNvbnN0
IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZTsKPiAgCj4gICAgICAgICBuZW5naW5l
ID0gMDsKPiAtICAgICAgIGZvcl9lYWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZW5naW5lKQo+IC0g
ICAgICAgICAgICAgICBlbmdpbmVzW25lbmdpbmUrK10gPSBlbmdpbmU7Cj4gKyAgICAgICBfX2Zv
cl9lYWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZSkKPiArICAgICAgICAgICAgICAgZW5naW5lc1tu
ZW5naW5lKytdID0gZS0+ZmxhZ3M7Cj4gICAgICAgICBpZ3RfcmVxdWlyZShuZW5naW5lKTsKCllv
dSB3aWxsIGhhdmUgbm90aWNlZCB0aGlzIHBhdHRlcm4gcXVpdGUgZnJlcXVlbnRseSwgYW5kIHBv
c3NpYmx5CmNvbnNpZGVyZWQgYSBoZWxwZXIgdG8gc2ltcGx5IHJldHVybiB0aGUgZW5naW5lIG1h
cD8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
