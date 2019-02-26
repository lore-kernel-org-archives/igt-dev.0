Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0496E00E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 18:44:17 +0000 (UTC)
References: <20190226182353.2125-1-antonio.argenziano@intel.com>
 <155120579777.17933.14831240638485565131@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <f2c631c6-b393-bfea-c95f-14f99c18a6fe@intel.com>
Date: Tue, 26 Feb 2019 10:44:17 -0800
MIME-Version: 1.0
In-Reply-To: <155120579777.17933.14831240638485565131@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/i915: Add mmap_offset support
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
Cc: Janulgue Abdiel <abdiel.janulgue@intel.com>, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyNi8wMi8xOSAxMDoyOSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAyLTI2IDE4OjIzOjUzKQo+PiArYm9vbCBoYXNfbW1hcF9vZmZz
ZXQoaW50IGZkKQo+IAo+IFByZWZpeCBwbGVhc2UuCj4gCj4+ICt7Cj4+ICsgICAgICAgc3RhdGlj
IGludCBoYXNfbW1hcF9vZmZzZXQgPSAtMTsKPiAKPiBXaGF0J3Mgb3VyIHBsYW4gdG8gYXZvaWRp
bmcgdGhlIHN0YXRpYz8KCkhvdyBhYm91dDogbWFrZSB0aGUgdmFyaWFibGUgbm90IHN0YXRpYyBh
bmQgcmVtb3ZlIHRoZSBpZj8KCj4gCj4gSSBkb24ndCB0aGluayB3ZSBuZWVkIHRoZSBzdGF0aWNz
IGZvciB0aGVzZSwgYXMgdGhlaXIgdXNlIHNob3VsZCBiZQo+IGxpbWl0ZWQgdG8gZml4dHVyZXMu
IE9uY2UgcGxhbiBoYXMgYmVlbiBkZWNpZGVkIHVwb24sIGVuYWN0IGl0IGZvciBhbGwKPiBpbiBn
ZW1fbW1hbi5jIDopCgpPSywgdGhlcmUgaXNuJ3QgcmVhbGx5IG11Y2ggaW4gZ2VtX21tYW4sIEkn
bGwgYWRkIGEgcGF0Y2ggYmVmb3JlIHRoaXMgCm9uZSB0byByZW1vdmUgd2hhdCBpcyB0aGVyZSBh
bmQgbm90IGFkZCB0aGlzIGhlcmUuCgpBbnRvbmlvCgo+IAo+PiArCj4+ICsgICAgICAgaWYgKGhh
c19tbWFwX29mZnNldCA9PSAtMSkgewo+PiArICAgICAgICAgICAgICAgc3RydWN0IGRybV9pOTE1
X2dldHBhcmFtIGdwOwo+PiArCj4+ICsgICAgICAgICAgICAgICBoYXNfbW1hcF9vZmZzZXQgPSAw
Owo+PiArCj4+ICsgICAgICAgICAgICAgICBtZW1zZXQoJmdwLCAwLCBzaXplb2YoZ3ApKTsKPj4g
KyAgICAgICAgICAgICAgIGdwLnBhcmFtID0gMHg1NTsgLyogSTkxNV9QQVJBTV9NTUFQX09GRlNF
VF9WRVJTSU9OICovCj4+ICsgICAgICAgICAgICAgICBncC52YWx1ZSA9ICZoYXNfbW1hcF9vZmZz
ZXQ7Cj4+ICsgICAgICAgICAgICAgICBpb2N0bChmZCwgRFJNX0lPQ1RMX0k5MTVfR0VUUEFSQU0s
ICZncCk7Cj4+ICsgICAgICAgfQo+PiArCj4+ICsgICAgICAgcmV0dXJuIGhhc19tbWFwX29mZnNl
dCA+IDA7Cj4+ICt9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
