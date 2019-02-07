Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719C16EC21
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Feb 2019 08:41:16 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190207083444.GG19504@kdec5-desk.ger.corp.intel.com>
References: <20190207080804.23389-1-katarzyna.dec@intel.com>
 <154952708825.27542.792377367111198868@skylake-alporthouse-com>
 <20190207083444.GG19504@kdec5-desk.ger.corp.intel.com>
Message-ID: <154952886188.27542.5659194632883589184@skylake-alporthouse-com>
Date: Thu, 07 Feb 2019 08:41:01 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_mmap_wc: Adjust loop to
 OBJECT_SIZE
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
To: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLYXRhcnp5bmEgRGVjICgyMDE5LTAyLTA3IDA4OjM0OjQ0KQo+IE9uIFRodSwgRmVi
IDA3LCAyMDE5IGF0IDA4OjExOjI4QU0gKzAwMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1
b3RpbmcgS2F0YXJ6eW5hIERlYyAoMjAxOS0wMi0wNyAwODowODowNCkKPiA+ID4gV2hlbiB3ZSBy
dW4gdGVzdCB3aXRoIElOVEVMX1NJTVVMQVRJT049MSB3ZSBzZXQgT0JKRUNUX1NJWkUKPiA+ID4g
dG8gMU0gd2hpY2ggaXMgbm90IHJlZmxlY3RlZCBpbiB0ZXN0X2Nsb3NlKCkgbG9vcC4KPiA+IAo+
ID4gV2h5IHdvdWxkIHlvdSBib3RoZXIgcnVubmluZyB0aGlzIHRlc3Qgb24gc2ltdWxhdGlvbj8g
SXQncyBqdXN0IGEgdGVzdAo+ID4gb2YgdGhlIGtlcm5lbCByZWZlcmVuY2UgY291bnRpbmcuCj4g
PiAtQ2hyaXMKPiBTbyB3aHkgZG8gd2UgaGF2ZSBkaWZmZXJlbnQgb2JqZWN0IHNpemUgZm9yIHNp
bXVsYXRpb24gaW4gdGhpcyB0ZXN0IHdoZW4gd2UKPiBzaG91bGQgbm90IGJvdGhlcj8KCk5vIGlk
ZWEuIEFsbCBodyBpbnRlcmFjdGlvbiBzaG91bGQgYmUgY292ZXJlZCBieSBzZWxmdGVzdHMgKHRo
aXMKY2VydGFpbmx5IGlzKSwgdGhlIHJhaXNvbiBkJ2V0cmUgZm9yIGlndCBpcyB0byBjb3ZlciB1
c2VyIG9ic2VydmFibGUKYmVoYXZpb3VyLiBGb3IgdGhlIHNpbXVsYXRvciwgd2Ugc2hvdWxkIGp1
c3QgYmUgYWJsZSB0byB1c2Ugc2VmdGVzdHMKZm9sbG93ZWQgYnkgYmFyZSB1QUJJIGNoZWNrcyBi
ZWZvcmUgbW92aW5nIG9udG8gcmVhbCB3b3JrbG9hZHMuCgo+IEJ0dyAtIEkgYW0gZml4aW5nIGEg
YnVnIGluIHlvdXIgY29kZS4KCk5vcGUsIHRoYXQgaXMgbm90aGluZyB0byBkbyB3aXRoIG1lLiBT
b21lb25lIGVsc2UgdGhvdWdodCBpcyB3YXMgYSBnb29kCmlkZWEuIEkgZG8gbm90IGxpa2UgaGF2
aW5nIHRlc3RzIHZhcnksIG1ha2UgZGlmZmVyZW50IHRlc3RzLgotQ2hyaXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
