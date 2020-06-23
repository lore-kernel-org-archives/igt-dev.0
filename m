Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B766E41D
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2020 13:35:46 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200623130056.20071-2-zbigniew.kempczynski@intel.com>
References: <20200623130056.20071-1-zbigniew.kempczynski@intel.com>
 <20200623130056.20071-2-zbigniew.kempczynski@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159291934216.10607.7788710079320567614@build.alporthouse.com>
Date: Tue, 23 Jun 2020 14:35:42 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/4] lib/intel_batchbuffer: Extend
 intel_bb
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

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMDYtMjMgMTQ6MDA6NTMpCj4gLXN0
YXRpYyB2b2lkIF9faW50ZWxfYmJfZGVzdHJveV9vYmplY3RzKHN0cnVjdCBpbnRlbF9iYiAqaWJi
KQo+ICtzdGF0aWMgdm9pZCBfX2ludGVsX2JiX2Rlc3Ryb3lfcmVsb2NhdGlvbnMoc3RydWN0IGlu
dGVsX2JiICppYmIpCj4gIHsKPiAgICAgICAgIHVpbnQzMl90IGk7Cj4gIAo+ICAgICAgICAgLyog
RnJlZSByZWxvY2F0aW9ucyAqLwo+IC0gICAgICAgZm9yIChpID0gMDsgaSA8IGliYi0+bnVtX29i
amVjdHM7IGkrKykKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBpYmItPm51bV9vYmplY3RzOyBp
KyspIHsKPiAgICAgICAgICAgICAgICAgZnJlZShmcm9tX3VzZXJfcG9pbnRlcihpYmItPm9iamVj
dHNbaV0ucmVsb2NzX3B0cikpOwo+ICsgICAgICAgICAgICAgICBpYmItPm9iamVjdHNbaV0ucmVs
b2NzX3B0ciA9IHRvX3VzZXJfcG9pbnRlcihOVUxMKTsKClJlc2V0IGliYi0+b2JqZWN0c1tpXS5y
ZWxvY2F0aW9uX2NvdW50ID0gMCBhcyB3ZWxsLCBmb3IgY29tcGxldGVuZXNzPwoKPiArICAgICAg
IH0KPiAgCj4gLSAgICAgICBmcmVlKGliYi0+b2JqZWN0cyk7Cj4gLSAgICAgICB0ZGVzdHJveShp
YmItPnJvb3QsIF9fZG9fbm90aGluZyk7Cj4gKyAgICAgICBpYmItPnJlbG9jcyA9IE5VTEw7Cj4g
KyAgICAgICBpYmItPm51bV9yZWxvY3MgPSAwOwo+ICsgICAgICAgaWJiLT5hbGxvY2F0ZWRfcmVs
b2NzID0gMDsKPiArfQoKPiArdm9pZCBpbnRlbF9iYl9mbHVzaF9vbl9yaW5nKHN0cnVjdCBpbnRl
bF9iYiAqaWJiLCBpbnQgcmluZykKPiArewo+ICsgICAgICAgdW5zaWduZWQgaW50IHVzZWQgPSBp
bnRlbF9iYl9vdXRfZmx1c2goaWJiKTsKPiArICAgICAgIHVpbnQzMl90IGN0eDsKPiArCj4gKyAg
ICAgICBpZiAodXNlZCA9PSAwKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAg
ICAgLyogWFhYIGJhZCBrZXJuZWwgQVBJICovCj4gKyAgICAgICBjdHggPSBpYmItPmN0eDsKPiAr
ICAgICAgIGlmIChyaW5nICE9IEk5MTVfRVhFQ19SRU5ERVIpCj4gKyAgICAgICAgICAgICAgIGN0
eCA9IDA7CgpCb28gOikKCj4gKwo+ICsgICAgICAgaW50ZWxfYmJfZXhlY193aXRoX2NvbnRleHQo
aWJiLCBpbnRlbF9iYl9vZmZzZXQoaWJiKSwgY3R4LAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmluZyB8IEk5MTVfRVhFQ19OT19SRUxPQywKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHRydWUpOwo+ICsgICAgICAgaW50ZWxfYmJfcmVzZXQoaWJiLCBm
YWxzZSk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
