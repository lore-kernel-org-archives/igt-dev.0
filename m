Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7F889124
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2019 09:25:18 +0000 (UTC)
Date: Tue, 14 May 2019 12:25:18 +0300
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20190514092518.GA2720@intel.intel>
References: <20190513175613.2507-1-andi.shyti@intel.com>
 <20190513175613.2507-5-andi.shyti@intel.com>
 <155782487795.2525.16323516297882838434@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155782487795.2525.16323516297882838434@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH v24 04/14] lib: igt_gt: make
 gem_engine_can_store_dword() check engine class
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
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgQ2hyaXMsCgpPbiBUdWUsIE1heSAxNCwgMjAxOSBhdCAxMDowNzo1N0FNICswMTAwLCBDaHJp
cyBXaWxzb24gd3JvdGU6Cj4gUXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTA1LTEzIDE4OjU2OjAz
KQo+ID4gLWJvb2wgZ2VtX2Nhbl9zdG9yZV9kd29yZChpbnQgZmQsIHVuc2lnbmVkIGludCBlbmdp
bmUpCj4gPiArYm9vbCBnZW1fY2xhc3NfY2FuX3N0b3JlX2R3b3JkKGludCBmZCwgaW50IGNsYXNz
KQo+ID4gIHsKPiA+ICAgICAgICAgdWludDE2X3QgZGV2aWQgPSBpbnRlbF9nZXRfZHJtX2Rldmlk
KGZkKTsKPiA+ICAgICAgICAgY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvICppbmZvID0g
aW50ZWxfZ2V0X2RldmljZV9pbmZvKGRldmlkKTsKPiA+IEBAIC01NjksOCArNTY5LDggQEAgYm9v
bCBnZW1fY2FuX3N0b3JlX2R3b3JkKGludCBmZCwgdW5zaWduZWQgaW50IGVuZ2luZSkKPiA+ICAg
ICAgICAgaWYgKGdlbiA9PSAzICYmIChpbmZvLT5pc19ncmFudHNkYWxlIHx8IGluZm8tPmlzX2Fs
dmlzbykpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOyAvKiBvbmx5IHN1cHBvcnRz
IHBoeXNpY2FsIGFkZHJlc3NlcyAqLwo+ID4gIAo+ID4gLSAgICAgICBpZiAoZ2VuID09IDYgJiYg
KChlbmdpbmUgJiAweDNmKSA9PSBJOTE1X0VYRUNfQlNEKSkKPiA+IC0gICAgICAgICAgICAgICBy
ZXR1cm4gZmFsc2U7IC8qIGtpbGxzIHRoZSBtYWNoaW5lISAqLwo+ID4gKyAgICAgICBpZiAoZ2Vu
ID09IDYgJiYgY2xhc3MgPT0gSTkxNV9FTkdJTkVfQ0xBU1NfVklERU8pCj4gPiArICAgICAgICAg
ICAgICAgcmV0dXJuIGZhbHNlOwo+IAo+IFByb2JhYmx5IHdpc2UgdG8ga2VlcCB0aGUgbm90ZSBh
Ym91dCB3aHkgaXQgaXMgZXhjbHVkZWQuIEl0J3MgYSBuYXN0eQo+IHN1cnByaXNlLgoKSSBoYXZl
IGFub3RoZXIgcGF0Y2ggcmVhZHkgb24gdGhpcyBvbmUgd2l0aCBvbmUgb2YgeW91ciBTdWdnZXN0
ZWQtYnkKdGhhdCBJIHdpbGwgc2VuZCBsYXRlciBpbiBhIGRpZmZlcmVudCBwYXRjaHNldC4KCkFu
ZGkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
