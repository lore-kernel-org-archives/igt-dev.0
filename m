Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5669A89CE0
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2020 15:07:53 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200604100353.24552-3-zbigniew.kempczynski@intel.com>
References: <20200604100353.24552-1-zbigniew.kempczynski@intel.com>
 <20200604100353.24552-3-zbigniew.kempczynski@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159128326923.22562.7110812910455946075@build.alporthouse.com>
Date: Thu, 04 Jun 2020 16:07:49 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/4] lib/intel_batchbuffer: add bb
 reset
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
To: zbigniew.kempczynski@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMDYtMDQgMTE6MDM6NTEpCj4gKy8q
Kgo+ICsgKiBpbnRlbF9iYl9vYmplY3Rfb2Zmc2V0X3RvX2J1ZjoKPiArICogQGliYjogcG9pbnRl
ciB0byBpbnRlbF9iYgo+ICsgKiBAYnVmOiBidWZmZXIgd2Ugd2FudCB0byBzdG9yZSBsYXN0IGV4
ZWMgb2Zmc2V0IGFuZCBjb250ZXh0IGlkCj4gKyAqCj4gKyAqIENvcHkgb2JqZWN0IG9mZnNldCB1
c2VkIGluIHRoZSBiYXRjaCB0byBpbnRlbF9idWYgdG8gYWxsb3cgY2FsbGVyIHByZXBhcmUKPiAr
ICogb3RoZXIgYmF0Y2ggbGlrZWx5IHdpdGhvdXQgcmVsb2NhdGlvbnMuCj4gKyAqLwo+ICtib29s
IGludGVsX2JiX29iamVjdF9vZmZzZXRfdG9fYnVmKHN0cnVjdCBpbnRlbF9iYiAqaWJiLCBzdHJ1
Y3QgaW50ZWxfYnVmICpidWYpCj4gK3sKPiArICAgICAgIHN0cnVjdCBkcm1faTkxNV9nZW1fZXhl
Y19vYmplY3QyIG9iamVjdCA9IHsgLmhhbmRsZSA9IGJ1Zi0+aGFuZGxlIH07Cj4gKyAgICAgICBz
dHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNfb2JqZWN0MiAqKmZvdW5kOwo+ICsKPiArICAgICAgIGln
dF9hc3NlcnQoaWJiKTsKPiArICAgICAgIGlndF9hc3NlcnQoYnVmKTsKPiArCj4gKyAgICAgICBm
b3VuZCA9IHRmaW5kKCh2b2lkICopICZvYmplY3QsICZpYmItPnJvb3QsIF9fY29tcGFyZV9vYmpl
Y3RzKTsKPiArICAgICAgIGlmICghZm91bmQpIHsKPiArICAgICAgICAgICAgICAgYnVmLT5hZGRy
Lm9mZnNldCA9IDA7Cj4gKyAgICAgICAgICAgICAgIGJ1Zi0+YWRkci5jdHggPSAwOwo+ICsKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGJ1
Zi0+YWRkci5vZmZzZXQgPSAoKmZvdW5kKS0+b2Zmc2V0Owo+ICsgICAgICAgYnVmLT5hZGRyLmN0
eCA9IGliYi0+Y3R4OwoKT2ssIHNvIGl0J3MgdHJhY2tpbmcgY3R4IHNvIHRoYXQgd2UgY2FuIHJl
dHVybiB0aGUgcmlnaHQgb2Zmc2V0IHdoZW4gdGhlCmJ1ZmZlciBpcyB1c2VkIGJ5IG11bHRpcGxl
IGNvbnRleHRzLiBCdXQgY3R4IGlzIG5ldmVyIGNvbXBhcmVkIGluIHRoZQpsb29rdXA/CgpbVGhl
cmUncyBhbHNvIHRoZSBwcm9ibGVtIG9mIHVpbnQzMl90IGN0eCByZXVzZSwgZXhjZXB0IHRoZXJl
IGl0IGNhbgpwcm9iYWJseSBoYXBwaWx5IGluaGVyaXQgdGhlIG9sZCBhZGRyLl0KLUNocmlzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
