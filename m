Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21DF6ED8F
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Aug 2019 09:47:31 +0000 (UTC)
References: <20190725103034.8882-1-lionel.g.landwerlin@intel.com>
 <20190725103034.8882-11-lionel.g.landwerlin@intel.com>
 <156460522446.2512.13711873169438917838@skylake-alporthouse-com>
 <7a6d81bf-1bd1-9118-4fc6-7b0903f6d5c7@intel.com>
 <156473711931.6598.14824855310596046770@skylake-alporthouse-com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <9a18b2c4-db2b-203e-e3e9-fee1ae0ca748@intel.com>
Date: Fri, 2 Aug 2019 12:47:29 +0300
MIME-Version: 1.0
In-Reply-To: <156473711931.6598.14824855310596046770@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 10/10] tests/i915/exec_fence: add
 timeline fence tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMDIvMDgvMjAxOSAxMjoxMSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgTGlvbmVs
IExhbmR3ZXJsaW4gKDIwMTktMDgtMDIgMTA6MDM6NTkpCj4+IE9uIDMxLzA3LzIwMTkgMjM6MzMs
IENocmlzIFdpbHNvbiB3cm90ZToKPj4+IFF1b3RpbmcgTGlvbmVsIExhbmR3ZXJsaW4gKDIwMTkt
MDctMjUgMTE6MzA6MzQpCj4+PiBZb3UgY291bGQgbW92ZSB0aGlzIHRvIGEgc2Vjb25kIGNvbnRl
eHQgYW5kIGF2b2lkIHRoZSBkaWZmZXJlbnRpYXRpb24KPj4+IGJldHdlZW4gZW5naW5lczoKPj4+
Cj4+PiAgICAgICAgZmVuY2UuZmxhZ3MgPSBJOTE1X0VYRUNfRkVOQ0VfV0FJVDsKPj4+ICAgICAg
ICBleGVjYnVmLnJzdmQxID0gZ2VtX2NvbnRleHRfY3JlYXRlKGZkKTsKPj4+Cj4+PiAgICAgICAg
biA9IDA7Cj4+PiAgICAgICAgZm9yX2VhY2hfZW5naW5lKGZkLCBlbmdpbmUpIHsKPj4+ICAgICAg
ICAgICAgICAgIG9iai5oYW5kbGUgPSBnZW1fY3JlYXRlKGZkLCA0MDk2KTsKPj4+ICAgICAgICAg
ICAgICAgIGdlbV93cml0ZShmZCwgb2JqLmhhbmRsZSwgMCwgJmJiZSwgc2l6ZW9mKGJiZSkpOwo+
Pj4KPj4+ICAgICAgICAgICAgICAgIC8qIFVuc3luY2hyb25pc2VkIHdpbGwgZXhlY3V0ZSBhaGVh
ZCBvZiB0aGUgYmxvY2thZ2UgKi8KPj4+ICAgICAgICAgICAgICAgIGV4ZWNidWYuZmxhZ3MgPSBl
bmdpbmU7Cj4+PiAgICAgICAgICAgICAgICBleGVjYnVmLmNsaXByZWN0c19wdHIgPSAwOwo+Pj4g
ICAgICAgICAgICAgICAgZ2VtX2V4ZWNidWYoZmQsICZleGVjYnVmKTsKPj4+ICAgICAgICAgICAg
ICAgIGdlbV9zeW5jKGZkLCBvYmouaGFuZGxlKTsKPj4KPj4gTm90IHF1aXRlIHN1cmUgdGhpcyBl
bmRzIHVwIGJsb2NraW5nIG9uIGVuZ2luZT0xLgo+IEl0J3MgYSBkaWZmZXJlbnQgY29udGV4dCwg
aXQncyBhbGxvd2VkIHRvIGV4ZWN1dGUgYWhlYWQgb2YgdGhlIHNwaW5uZXIKPiB3aGVuIHRoZSBz
cGlubmVyIGV4Y2VlZHMgaXRzIHRpbWVzbGljZSAtLSBzbyBsb25nIGFzIHByZWVtcHRpb24gaXMK
PiBlbmFibGVkIG9uIHRoZSBzcGlubmVyLiBJZiBub3QsIHRoYXQncyBrZXJuZWwgYnVnLgo+IC1D
aHJpcwo+CkhtbS4uLiBtb2RpZnlpbmcgdGhlIGV4aXN0aW5nIHRlc3Rfc3luY29ial93YWl0KCkg
dG8gZG8gdGhlIHNhbWUgbGVhZHMgCnRvIGEgZGVhZGxvY2suCgpUaGF0J3Mgb24gYSBzdGFibGUg
NS4wIGtlcm5lbCwgc28gdGhhdCBhcHBlYXJzIHVucmVsYXRlZCB0byBteSB0aW1lbGluZSAKc2Vt
YXBob3JlIGNoYW5nZXMuCgoKLUxpb25lbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
