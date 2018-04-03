Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <63199548-08b6-446f-4185-082a87287ed3@intel.com>
 <20180329184622.10480-1-tvrtko.ursulin@linux.intel.com>
 <1522437301.774767662@f417.i.mail.ru>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <1a6753ca-628b-f4ad-15b1-f13484033d4c@linux.intel.com>
Date: Tue, 3 Apr 2018 10:38:16 +0100
MIME-Version: 1.0
In-Reply-To: <1522437301.774767662@f417.i.mail.ru>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t v3] intel-gpu-top: Rewrite the tool to
 be safe to use
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
To: Rinat Ibragimov <ibragimovrinat@mail.ru>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: igt-dev@lists.freedesktop.org, Eero Tamminen <eero.t.tamminen@intel.com>, Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDMwLzAzLzIwMTggMjA6MTUsIFJpbmF0IElicmFnaW1vdiB3cm90ZToKPiAKPiAKPj4g0KfQ
tdGC0LLQtdGA0LMsIDI5INC80LDRgNGC0LAgMjAxOCwgMjE6NDYgKzAzOjAwINC+0YIgVHZydGtv
IFVyc3VsaW4gPHR1cnN1bGluQHVyc3VsaW4ubmV0PjoKPj4KPiAKPj4gKyNkZWZpbmUgZW5naW5l
X3B0cihlbmdpbmVzLCBuKSBcCj4+ICsoKHN0cnVjdCBlbmdpbmUgKikoKHVuc2lnbmVkIGNoYXIg
KikoJmVuZ2luZXMtPmVuZ2luZSkgKyAobikgKiBzaXplb2Yoc3RydWN0IGVuZ2luZSkpKQo+IAo+
IEkgdGhpbmsgKCZlbmdpbmVzLT5lbmdpbmUgKyAobikpIGlzIGVhc2llciB0byByZWFkLgoKQWJz
b2x1dGVseSBhZ3JlZWQuCgo+PiAraWYgKGZkIDwgMCAmJiAhY250LT5vcHRpb25hbCkKPj4gK3Jl
dHVybiAtMTsKPiAKPiBJJ3ZlIHRyaWVkIHRvIHJ1biBpdCBvbiBTa3lsYWtlIG9uIExpbnV4IDQu
MTYsIGFuZCBpbnRlbF9ncHVfdG9wIGlzIHdvcmtpbmcsIGFzIGxvbmcgYXMKPiBJIHJlbW92ZSB0
aGVzZSBsaW5lcy4gT3RoZXJ3aXNlIGl0IGZhaWxzIHdoaWxlIHRyeWluZyAidmNzMSIuIEVycm9y
IG1lc3NhZ2Ugc2F5cyBhYm91dAo+IExpbnV4IDQuMTYsIHdoaWNoIGlzIGEgYml0IGNvbmZ1c2lu
Zy4KPiAKPiBUaGVyZSBhcmUgY29kZSB0aGF0IHNldHMgYW5kIHRlc3RzICJwcmVzZW50IiBmaWVs
ZCBvZiBzdHJ1Y3QgcG11X2NvdW50ZXIuIFNvLAo+IEkgZ3Vlc3MsIGl0J3MgZmluZSB0byByZW1v
dmUgdGhlIGNvZGUsIGFuZCB0aHVzIG1ha2UgYWxsIGNvdW50ZXJzIG9wdGlvbmFsPwo+IAo+PiAr
Cj4+ICtpZiAoIWNudC0+cHJlc2VudCkgewo+PiArc3RybmNweShidWYsICItLS0iLCBidWZzeik7
Cj4+ICDCoHJldHVybjsKPj4gK30KPiAKPiBJZiB5b3UgZGVjaWRlIHRvIG1ha2UgYWxsIGNvdW50
ZXJzIG9wdGlvbmFsLCB0aGlzIHdpbGwgYmUgdXNlZCBmb3IgImJ1c3kiIG51bWJlcnMKPiB0b28u
IEJ1dCAiYnVzeSIgaXMgNiBjaGFyYWN0ZXJzIHdpZGUsIHVubGlrZSAic2VtYSIgYW5kICJ3YWl0
Iiwgd2hpY2ggYXJlIDMgZWFjaC4KClllcCBJIGZhaWxlZCB0byBpbXBsZW1lbnQgdGhpcyBjb3Jy
ZWN0bHkuIEZpeGVkIGluIHY0IGhvcGVmdWxseS4KCkRlZmluaXRlbHkgdGhhbmtzIGEgbG90IGZv
ciB0aGlzIGFuZCBwcmV2aW91cyBmZWVkYmFjayEKClJlZ2FyZHMsCgpUdnJ0a28KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
