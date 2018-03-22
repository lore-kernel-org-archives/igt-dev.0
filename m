Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180322111712.9056-1-tvrtko.ursulin@linux.intel.com>
 <20180322111712.9056-2-tvrtko.ursulin@linux.intel.com>
 <152171875518.23562.12227602056261860847@mail.alporthouse.com>
 <499c5ae6-900f-0958-149e-036ba0d9de7a@linux.intel.com>
 <152172253496.23562.6501030072098510709@mail.alporthouse.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <972a685e-2654-a939-82f8-53f8f6aa1ba5@intel.com>
Date: Thu, 22 Mar 2018 10:32:46 -0700
MIME-Version: 1.0
In-Reply-To: <152172253496.23562.6501030072098510709@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 2/3] tests/gem_eio: Speed up
 test execution
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMi8wMy8xOCAwNTo0MiwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgVHZydGtv
IFVyc3VsaW4gKDIwMTgtMDMtMjIgMTI6MzY6NTgpCj4+Cj4+IE9uIDIyLzAzLzIwMTggMTE6Mzks
IENocmlzIFdpbHNvbiB3cm90ZToKPj4+IFF1b3RpbmcgVHZydGtvIFVyc3VsaW4gKDIwMTgtMDMt
MjIgMTE6MTc6MTEpCj4+Pgo+Pj4+ICAgICAgICAgICB0cmlnZ2VyX3Jlc2V0KGZkKTsKPj4+PiAr
Cj4+Pj4gKyAgICAgICAvKiBIQUNLIGZvciBDSSAqLwo+Pj4+ICsgICAgICAgaWd0X2Fzc2VydChp
Z3RfbnNlY19lbGFwc2VkKCZ0cykgPCA1ZTkpOwo+Pj4KPj4+IGlndF9zZWNvbmRzX2VsYXBzZWQo
KSB0aGUgYXBwcm94aW1hdGlvbiBpcyB3b3J0aCB0aGUgcmVhZGFiaWxpdHkuCj4+Pgo+Pj4gSW4g
dGhpcyBjYXNlIHlvdSBtaWdodCBsaWtlIHRvIHRyeSBpZ3Rfc2V0X3RpbWVvdXQoKSwgYXMgSSB0
aGluayBlYWNoCj4+PiBzdWJ0ZXN0IGFuZCBleGl0aGFuZGxlcnMgYXJlIGluIHBsYWNlIHRvIG1h
a2UgdGhlbSByb2J1c3QgYWdhaW5zdAo+Pj4gcHJlbWF0dXJlIGZhaWx1cmVzLgo+Pgo+PiBXZWxs
IHRoaXMgd2FzIGp1c3QgdG8gc2VlIHRoYXQgd2lsbCBoYXBwZW4gb24gdGhlIHNoYXJkcyBoZXJl
LiBBcwo+PiBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdCBJIGdldCB0aGF0IHlldCB1bmV4cGxhaW5l
ZCBHUFUgaGFuZyBhdCBzdWJ0ZXN0Cj4+IGV4aXQgaGVyZS4gU28gdGhlIGFzc2VydCBhYm92ZSBp
cyBqdXN0IHRvIG5vdGljZSBpZiB0aGUgc2FtZSBoYXBwZW5zIG9uCj4+IHNoYXJkcy4KPiAKPiBB
bmQgSSB3YXMgdGhpbmtpbmcgaXQgd2FzIGEgcmVhc29uYWJsZSBlbmhhbmNlbWVudCA6KSBQcm9i
YWJseSBtb3JlIHNvCj4gZm9yIGlndC9nZW1fd2FpdCBpdHNlbGYgdG8gYXNrIHRoYXQgaWYgd2Ug
cmVzZXQgdGhlIHJlcXVlc3Qgd2UgYXJlCj4gd2FpdGluZyB1cG9uIGl0IGNvbXBsZXRlcyBpbiBh
IHRpbWVseSBtYW5uZXIuIChXZSBkb24ndCBjYXJlIGFib3V0Cj4gd2VkZ2VkIGhhbmRsaW5nIHRo
ZXJlLCBqdXN0IHJlc2V0IGhhbmRsaW5nLikKCkhvdyBhYm91dCBjaGVja2luZyBmb3IgcmVzZXQg
d2hlbiB3ZSBkbyBnZW1fdGVzdF9lbmdpbmUoKSwgd2hpY2ggc2VlbXMgCnRvIG5vdCBmYWlsIG9u
IHJlc2V0LCAoY3J1ZGVseSBodHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTAxNjA1OS8pPwoKQW50
b25pbwoKPiAtQ2hyaXMKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IEludGVsLWdmeCBtYWlsaW5nIGxpc3QKPiBJbnRlbC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1nZngKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
