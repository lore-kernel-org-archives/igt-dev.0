Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
In-Reply-To: <156578676134.10647.13792156620503442179@jlahtine-desk.ger.corp.intel.com>
References: <20190814102140.3275-1-lukasz.kalamarz@intel.com>
 <20190814102140.3275-3-lukasz.kalamarz@intel.com>
 <156577867063.2301.17355529603266735071@skylake-alporthouse-com>
 <156578676134.10647.13792156620503442179@jlahtine-desk.ger.corp.intel.com>
Message-ID: <156579034684.12626.12701872101760656075@jlahtine-desk.ger.corp.intel.com>
Date: Wed, 14 Aug 2019 16:45:46 +0300
Subject: Re: [igt-dev] [RFC PATCH 2/4] lib/i915/intel_memory_region: Add lib
 to manage memory regions
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Lukasz Kalamarz <lukasz.kalamarz@intel.com>, igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

KyBBYmRpZWwvaW50ZWwtZ2Z4CgpRdW90aW5nIEpvb25hcyBMYWh0aW5lbiAoMjAxOS0wOC0xNCAx
NTo0NjowMSkKPiBRdW90aW5nIENocmlzIFdpbHNvbiAoMjAxOS0wOC0xNCAxMzozMToxMCkKPiA+
IFF1b3RpbmcgTHVrYXN6IEthbGFtYXJ6ICgyMDE5LTA4LTE0IDExOjIxOjM4KQo+ID4gPiArLyoq
Cj4gPiA+ICsgKiAgZ2VtX2dldF9wYWdlX3NpemU6Cj4gPiA+ICsgKiAgQGZkOiBvcGVuIGk5MTUg
ZHJtIGZpbGUgZGVzY3JpcHRvcgo+ID4gPiArICogIEBtZW1fcmVnaW9uX3R5cGU6IHVzZWQgbWVt
b3J5X3JlZ2lvbiB0eXBlCj4gPiA+ICsgKgo+ID4gPiArICogIFdpdGggaW50cm9kdWN0aW9uIG9m
IExNRU0gd2Ugb2JzZXJ2ZSBkaWZmZXJlbnQgcGFnZSBzaXplcyBmb3IgdGhvc2UgdHdvCj4gPiA+
ICsgKiAgbWVtb3J5IHJlZ2lvbnMuIFdpdGhvdXQgdGhpcyBoZWxwZXIgZnVuY3Rpb24gd2UgbWF5
IGJlIHByb25lIHRvIGZvcmdldAo+ID4gPiArICogIGFib3V0IHNldHRpbmcgcHJvcGVyIHBhZ2Ug
c2l6ZS4KPiA+ID4gKyAqLwo+ID4gPiArdWludDMyX3QgZ2VtX2dldF9iYXRjaF9zaXplKGludCBm
ZCwgdWludDhfdCBtZW1fcmVnaW9uX3R5cGUpCj4gPiA+ICt7Cj4gPiA+ICsgICAgICAgcmV0dXJu
IChtZW1fcmVnaW9uX3R5cGUgPT0gTE9DQUxfSTkxNV9ERVZJQ0VfTUVNT1JZKSA/IDY1NTM2IDog
NDA5NjsKPiA+IAo+ID4gWW91IGhhdmUgdG8gYmUga2lkZGluZyBtZS4gVGhpcywgdGhpcyBjb25z
dGl0dXRlcyBhIGZvcndhcmQgdGhpbmtpbmcgdUFQST8KPiAKPiBXZSBzaG91bGQgYmUganVzdCBm
aW5lIHJlcXVlc3RpbmcgdGhlIG1pbmltdW0gQk8gc2l6ZSB3ZSBuZWVkLCBsZXR0aW5nIHRoZSBL
TUQKPiByb3VuZCB0aGUgc2l6ZXMgdXAgYW5kIHJlYWRpbmcgYmFjayB0aGUgY3JlYXRlZCBCTyBz
aXplLgo+IAo+IChOb3cgdGhhdCB0aGUgcmVncmVzc2lvbiBoYXMgYmVlbiBmaXhlZCwgdG9vIDop
ICkKPiAKPiBTbyB0aGUgY29kZSBsb2dpYyBuZWVkcyB0byBiZSB1cGRhdGVkIHRvIGZvbGxvdyB0
aGF0LgoKT24gYSBzZWNvbmQgdGhvdWdodCB3ZSBtYXkgYmUgYmV0dGVyIG9mZiByb3VuZGluZyB0
aGUgYmFja2luZyBzdG9yYWdlCnNpemUgdXAgdHJhbnNwYXJlbnRseS4KCkkgZ3Vlc3MgdGhlIHBy
aW1lIHF1ZXN0aW9uIGlzIHdoeSB3b3VsZCB0aGUgdXNlcnNwYWNlL0lHVCBjYXJlIGZvcgphY3R1
YWwgYmFja2luZyBzdG9yYWdlIHNpemU/CgpBYmRpZWwvTWF0dCwgaG93IHBhaW5mdWwgd291bGQg
aXQgYmUgdG8gcm91bmQgdGhlIGJhY2tpbmcgc3RvcmFnZSBzaXplCnVwLCBpcnJlc3BlY3RpdmUg
b2YgdGhlIEJPIHNpemU/CgpSZWdhcmRzLCBKb29uYXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2
