Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9816E38A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Mar 2018 08:44:04 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180228171244.GO5453@intel.com>
References: <20180227215040.11297-1-chris@chris-wilson.co.uk>
 <20180228090016.4589-1-chris@chris-wilson.co.uk>
 <20180228171244.GO5453@intel.com>
Message-ID: <151989383974.32001.1950194953531149234@mail.alporthouse.com>
Date: Thu, 01 Mar 2018 08:43:59 +0000
Subject: Re: [igt-dev] [PATCH igt v6] lib: Provide an accelerated routine
 for readback from WC
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqw6Rsw6QgKDIwMTgtMDItMjggMTc6MTI6NDQpCj4gT24gV2VkLCBG
ZWIgMjgsIDIwMTggYXQgMDk6MDA6MTZBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
KyNpZiBkZWZpbmVkKF9feDg2XzY0X18pICYmICFkZWZpbmVkKF9fY2xhbmdfXykKPiA+ICsjZGVm
aW5lIE1PVk5UIDUxMgo+IAo+IFdoYXQncyB0aGlzIE1PVk5UIGRlZmluZT8KCkkgY2FuJ3QgcmVt
ZW1iZXIuIEkgcHJlc3VtZSBJIHdhcyB0aGlua2luZyBhYm91dCBob29raW5nIGl0IHVwIHRvIGEK
ZGV0ZWN0aW9uIGJpdC4gQnV0IDUxMj8gRGVmaW5pdGVseSBjb3BpZWQgdGhhdCBmcm9tIHNvbWV3
aGVyZS4KCj4gPiArI3ByYWdtYSBHQ0MgcHVzaF9vcHRpb25zCj4gPiArI3ByYWdtYSBHQ0MgdGFy
Z2V0KCJzc2U0LjEiKQo+ID4gKyNwcmFnbWEgR0NDIGRpYWdub3N0aWMgaWdub3JlZCAiLVdwb2lu
dGVyLWFyaXRoIgo+ID4gKwo+ID4gKyNkZWZpbmUgbWluKHgsIHkpICh7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiA+ICsgICAgIHR5cGVvZih4KSBfbWluMSA9ICh4KTsgICAgICAgICAg
ICAgICAgICBcCj4gPiArICAgICB0eXBlb2YoeSkgX21pbjIgPSAoeSk7ICAgICAgICAgICAgICAg
ICAgXAo+ID4gKyAgICAgKHZvaWQpICgmX21pbjEgPT0gJl9taW4yKTsgICAgICAgICAgICAgIFwK
PiA+ICsgICAgIF9taW4xIDwgX21pbjIgPyBfbWluMSA6IF9taW4yOyAgICAgICAgICBcCj4gPiAr
fSkKPiAKPiBpZ3RfYXV4LmggaGFzIHRoaXMgYWxyZWFkeSBJIGJlbGlldmUuCgpNaXNzZWQgaXQs
IHRoYW5rcy4gSSBqdXN0IHdhc24ndCBleHBlY3RpbmcgaXQgb3IgTUlOIHRvIGJlIHVuZGVmaW5l
ZC4KCj4gPiArI2luY2x1ZGUgPHNtbWludHJpbi5oPgo+ID4gK3N0YXRpYyB2b2lkIG1lbWNweV9m
cm9tX3djX3NzZTQxKHZvaWQgKmRzdCwgY29uc3Qgdm9pZCAqc3JjLCB1bnNpZ25lZCBsb25nIGxl
bikKPiA+ICt7Cj4gPiArICAgICBjaGFyIGJ1ZlsxNl07Cj4gPiArCj4gPiArICAgICAvKiBGbHVz
aCB0aGUgaW50ZXJuYWwgYnVmZmVyIG9mIHBvdGVudGlhbCBzdGFsZSBnZnggZGF0YSAqLwo+ID4g
KyAgICAgX19idWlsdGluX2lhMzJfbWZlbmNlKCk7Cj4gCj4gSXNuJ3QgdGhlcmUgYSBfbW1fbWZl
bmNlKCk/CgpJZiB5b3UgcmVtZW1iZXIgdGhlcmUncyBvbmx5IG9uZSAnXycsIHllcywgYXBwYXJl
bnRseSB0aGVyZSBpcy4KCj4gQXBhcnQgZnJvbSB0aG9zZSBldmVyeXRoaW5nIGxvb2tzIGFsbCBy
aWdodCB0byBtZS4KPiBSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4KVGhhbmtzLAotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
