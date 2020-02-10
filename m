Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129056EBDE
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 10:31:44 +0000 (UTC)
References: <20191205123113.12611-1-zbigniew.kempczynski@intel.com>
 <157554961951.22727.15891786065422931889@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <f5ebacf0-0c9b-28f8-6138-1933a0ebcaa9@linux.intel.com>
Date: Mon, 10 Feb 2020 10:31:40 +0000
MIME-Version: 1.0
In-Reply-To: <157554961951.22727.15891786065422931889@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915/gem_mman: Add support for
 GEM_MMAP_OFFSET ioctl
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
To: Chris Wilson <chris@chris-wilson.co.uk>, =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA1LzEyLzIwMTkgMTI6NDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFpiaWdu
aWV3IEtlbXBjennFhHNraSAoMjAxOS0xMi0wNSAxMjozMToxMykKPj4gV2l0aCBpbnRyb2R1Y3Rp
b24gb2YgbmV3IGtlcm5lbCBpb2N0bCB3ZSBuZWVkIHRvIGNvdmVyIHRoaXMgaW4KPj4gdGhlIElH
VCdzLiBQYXRjaCBhZGRzIG1tYXAgZnVuY3Rpb25zIGFwcHJvcHJpYXRlIGZvciB0aGlzLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBMdWthc3ogS2FsYW1hcnogPGx1a2Fzei5rYWxhbWFyekBpbnRlbC5j
b20+Cj4+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnpp
YW5vQGludGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6
Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Cj4+IENjOiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KPiAKPiBEbyB3ZSByZWFsbHkgaGF2ZSBwZW9wbGUgb3V0c2lk
ZSBvZiBnZW1fbW1hcF93Yy5jIGFuZCBnZW1fbW1hcF9vZmZzZXQuYwo+IHRoYXQgY2FyZSB3aGV0
aGVyIHRoZWlyIFdDL1dCIG1tYXBwaW5nIGlzIHByb3ZpZGVkIGJ5IE1NQVBfT0ZGU0VUX0lPQ1RM
Cj4gb3IgTU1BUF9JT0NUTC4gVGhleSBqdXN0IGV4cGVjdCBpdCB0byB3b3JrLCBJIHdvdWxkIGhh
dmUgdGhvdWdodCAtLQo+IGJhc2ljYWxseSBqdXN0IGdlbV9tbWFwX19kZXZpY2VfY29oZXJlbnQg
KGFuZCBtYXliZSB0aGUgYWx0ZXJuYXRpdmUgd291bGQKPiBiZSBnZW1fbW1hcF9fY2FjaGVfY29o
ZXJlbnQsIGRvbid0IHF1b3RlIG1lIG9uIHRoYXQgOikKPiAKPiBJdCdzIG5vdCBhIGh1Z2UgZGVh
bCwgSSB0aGluayBpdCBmYWxscyB1bmRlciBvdmVyZW5naW5lZXJpbmcgdGhhdCB3aWxsCj4gc2lt
cGx5IGxlYWQgdG8gY29uZnVzaW9uIG9mICJ3aGVuIGRvIEkgdXNlIG9uZSBhbmQgbm90IHRoZSBv
dGhlcj8iCgpXaGF0IHNoYWxsIHdlIGRvIHdpdGggY2FsbCBzaXRlcyB3aGljaCB1c2VkIHRvIGRv
OgoKICAgZ2VtX21tYXBfX2d0dCgpCiAgIGdldF9zZXRfZG9tYWluKEdUVCkKCkFuZCBub3cgZG86
CgogICBnZW1fbW1hcF9fZGV2aWNlX2NvaGVyZW50KCkKICAgZ2VtX3NldF9kb21haW4oR1RUKQoK
PwoKU291bmRzIGxpa2Ugd2UgbmVlZCBhIGhlbHBlciB0byBlaXRoZXIgbGV0cyB0aGUgY2FsbGVy
IGtub3cgd2hpY2ggCmZsYXZvdXIgb2YgbW1hcCB3YXMgdXNlZCBzbyBjb3JyZWN0IGZsdXNoaW5n
IGNhbiBiZSBkb25lLCBvciBhIApzeW5jaHJvbm91cyBoZWxwZXIgd2hlcmUgcG9zc2libGUgc291
bmRzIG11Y2ggZWFzaWVyOgoKICAgZ2VtX21tYXBfX2RldmljZV9jb2hlcmVudF9zeW5jKCkgLSBk
b2VzIHRoZSBjb3JyZWN0IHNldF9kb21haW4gaW50ZXJuYWxseQoKUmVnYXJkcywKClR2cnRrbwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
