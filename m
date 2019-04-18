Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB896E0BD
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2019 08:46:18 +0000 (UTC)
References: <20190416151128.2465-1-andi.shyti@intel.com>
 <20190416151128.2465-6-andi.shyti@intel.com>
 <030e2dba-1dd8-da25-2dd7-e2a7cdd6ad87@intel.com>
 <a0de5a71-e513-0e8c-a1ed-3a7571bd1275@linux.intel.com>
 <155551808147.25904.958785807683888289@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <826c7416-33a8-b28f-015f-1900242087a6@linux.intel.com>
Date: Thu, 18 Apr 2019 09:46:15 +0100
MIME-Version: 1.0
In-Reply-To: <155551808147.25904.958785807683888289@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH v21 5/6] lib: igt_dummyload: use
 for_each_context_engine()
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi.shyti@intel.com>, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDE3LzA0LzIwMTkgMTc6MjEsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE5LTA0LTE3IDE3OjE0OjQ1KQo+PiBTbyB3aGF0IHRvIGRvIHRvIHByZXNl
cnZlIGNvbXBhdGliaWxpdHkgd2l0aCBlYi5mbGFncyBhbmQgbm90IG1lc3MgdXAKPj4gdGhlIGNv
bnRleHQgaW4gaGVyZS4uIHVzZSB0aGUgc3RhdGljIGl0ZXJhdG9yIGZvciBjb250ZXh0cyB3by8g
bWFwcyBhbmQKPj4gbGVnYWN5IGViPyBCdXQgd2hhdCBkb2VzIEFMTF9FTkdJTkVTIG1lYW4gdGhl
bj8gUGhhc2Ugb3V0IEFMTF9FTkdJTkVTCj4+IHN1cHBvcnQgaW4gc3BpbiBiYXRjaD8gTmVlZHMg
YW4gYXVkaXQgb2YgaG93IG1hbnkgY2FsbCBzaXRlcyB3ZSBoYXZlIGFuZAo+PiBob3cgZG8gdGhl
eSBsb29rLgo+IAo+IEFjdHVhbGx5LCB3ZSd2ZV5JJ3ZlIG9wZW4tY29kZWQgc2V2ZXJhbCBjYWxs
c2l0ZSB0aGF0IGNvdWxkIGRvIHdpdGgKPiBBTExfRU5HSU5FUy4gQW5kIEkgdGhpbmsgdGhhdCdz
IGEgZ29vZCB0aGluZyAtLSBhcyB0aGUgc2V0dXAgcmVxdWlyZXMgYQo+IGJpdCBvZiBmaW5lc3Nl
IGFuZCByZXN1Ym1pdHRpbmcgdGhlIHNwaW4gYmF0Y2ggd29ya3MgcXVpdGUgd2VsbC4gTm8KPiBk
b3VidCBzb21lb25lIGVsc2Ugd2lsbCBiZSB0ZW1wdGVkIHRvIHJlZmFjdG9yLgoKSSBkaWRuJ3Qg
cXVpdGUgZ2V0IGlmIHlvdSB3YW50IG1vcmUgdXNhZ2VzIG9mIHNwaW5fYmF0Y2goQUxMX0VOR0lO
RVMpIG9yIApmZXdlciBpbiB0aGUgZnV0dXJlPwoKRG8gd2UgYWdyZWUgdGhhdCBmb3Igbm93IGF0
IGxlYXN0IHdlIGRvbid0IHdhbnQgdG8gc2lsZW50bHkgbW9kaWZ5IHRoZSAKY29udGV4dCwgYW5k
IHNvIGZvciBub3cgdG8gZ28gd2l0aCBkdWFsIHBhdGhzIGluIHRoZSBzcGluIGJhdGNoIApjb25z
dHJ1Y3Rvciwgc28gQW5kaSBoYXMgYSB3YXkgZm9yd2FyZD8KClJlZ2FyZHMsCgpUdnJ0a28KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
