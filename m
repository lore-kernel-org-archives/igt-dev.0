Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5336EA4A
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 09:44:23 +0000 (UTC)
Date: Thu, 8 Apr 2021 11:44:15 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210408094415.GB55970@zkempczy-mobl2>
References: <20210408065231.47694-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20210408093320.GA55970@zkempczy-mobl2>
 <SN6PR11MB3421E22329FA8E875A0AE0BDDF749@SN6PR11MB3421.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN6PR11MB3421E22329FA8E875A0AE0BDDF749@SN6PR11MB3421.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [i-g-t] lib/gem_submission: Remove __gem_execbuf call
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
To: "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandey,
 Hariom" <hariom.pandey@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBBcHIgMDgsIDIwMjEgYXQgMTE6Mzk6MTlBTSArMDIwMCwgU3VyZW5kcmFrdW1hciBV
cGFkaHlheSwgVGVqYXNrdW1hclggd3JvdGU6Cj4gCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQo+ID4gRnJvbTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNr
aUBpbnRlbC5jb20+Cj4gPiBTZW50OiAwOCBBcHJpbCAyMDIxIDE1OjAzCj4gPiBUbzogU3VyZW5k
cmFrdW1hciBVcGFkaHlheSwgVGVqYXNrdW1hclgKPiA+IDx0ZWphc2t1bWFyeC5zdXJlbmRyYWt1
bWFyLnVwYWRoeWF5QGludGVsLmNvbT4KPiA+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgUGFuZGV5LCBIYXJpb20KPiA+IDxoYXJpb20ucGFuZGV5QGludGVsLmNvbT4KPiA+IFN1
YmplY3Q6IFJlOiBbaWd0LWRldl0gW2ktZy10XSBsaWIvZ2VtX3N1Ym1pc3Npb246IFJlbW92ZSBf
X2dlbV9leGVjYnVmIGNhbGwKPiA+Cj4gPiBPbiBUaHUsIEFwciAwOCwgMjAyMSBhdCAxMjoyMjoz
MVBNICswNTMwLCBUZWphcyBVcGFkaHlheSB3cm90ZToKPiA+ID4gQWZ0ZXIgcmVsb2Mgc3VwcG9y
dCBnb3QgZHJvcHBlZCBvbiBHRU4xMi8xMissIGxvdCBvZiB0ZXN0cyBhcmUKPiA+ID4gcmVwb3J0
aW5nIGZhaWx1cmVzIHdoaWNoIHNob3VsZCBiZSBza2lwcGVkIHVzaW5nIGNoZWNrCj4gPiA+IGdl
bV9oYXNfcmVsb2NhdGlvbnMoKS4gVGhlIHByb2JsZW0gaXMgbG90IG9mIHRob3NlIGZhaWx1cmVz
IGFyZSBkdWUgdG8KPiA+ID4gZGlyZWN0IF9fZ2VtX2V4ZWNidWYoKSBjYWxsIHdoZXJlIHdlIGNh
bnQgcHV0IGdlbV9oYXNfIHJlbG9jYXRpb25zCj4gPiA+IGNoZWNrIHRvIHNraXAgdGhlIHRlc3Qg
aW4gY2FzZSBwbGF0Zm9ybSBkb2VzIG5vdCBzdXBwb3J0IHJlYXNvbiBiZWluZwo+ID4gPiBpdCBh
bHNvIGNhbGxzIF9fZ2VtX2V4ZWNidWYgd2hpY2ggY3JlYXRlcyBuZXZlciBlbmRpbmcgbG9vcC4g
VGh1cyB0bwo+ID4gPiBhdm9pZCBsb29waW5nLCBjYWxsIF9fZ2VtX2V4ZWNidWYoKSBpbnNpZGUg
Z2VtX2hhc19yZWxvY2F0aW9ucygpIGlzCj4gPiA+IHJlcGxhY2VkIHdpdGggZGlyZWN0IGlvY3Rs
IGNhbGwuCj4gPgo+ID4gV2UgY2Fubm90IGRvIHRoYXQuIFdlIGhhdmUgdG8gZml4IHRlc3RzLCBu
b3QgdG8gc2tpcCB0aGVtLgo+IFdlIGFyZSBhbHJlYWR5IHNraXBwaW5nIGZvciBnZW1fZXhlY19y
ZWxvYyBhZnRlciBjaGVja2luZyByZWxvYyBzdXBwb3J0LgoKQmVjYXVzZSBhcyB0ZXN0IG5hbWUg
c3VnZ2VzdHMgaXQgZXhlcmNpc2UgdGhlIHJlbG9jYXRpb25zLgoKLS0KWmJpZ25pZXcKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
