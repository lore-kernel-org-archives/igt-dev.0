Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180404095152.5110-1-tvrtko.ursulin@linux.intel.com>
References: <20180403163943.8425-1-tvrtko.ursulin@linux.intel.com>
 <20180404095152.5110-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <152345301974.13225.13439333285979784135@mail.alporthouse.com>
Date: Wed, 11 Apr 2018 14:23:39 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v4] tests/perf_pmu: Avoid RT
 thread for accuracy test
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
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wNC0wNCAxMDo1MTo1MikKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFJlYWx0aW1lIHNjaGVk
dWxpbmcgaW50ZXJmZXJlcyB3aXRoIGV4ZWNsaXN0cyBzdWJtaXNzaW9uICh0YXNrbGV0KSBzbyB0
cnkKPiB0byBzaW1wbGlmeSB0aGUgUFdNIGxvb3AgaW4gYSBmZXcgd2F5czoKPiAKPiAgKiBEcm9w
IFJULgo+ICAqIExvbmdlciBiYXRjaGVzIGZvciBzbWFsbGVyIHN5c3RlbWF0aWMgZXJyb3IuCj4g
ICogTW9yZSB0cnV0aGZ1bCB0ZXN0IGR1cmF0aW9uIGNhbGN1bGF0aW9uLgo+ICAqIExlc3MgY2xv
Y2sgcXVlcmllcy4KPiAgKiBObyBzZWxmLWFkanVzdCAtIGluc3RlYWQganVzdCByZXBvcnQgdGhl
IGFjaGlldmVkIGN5Y2xlIGFuZCBsZXQgdGhlCj4gICAgcGFyZW50IGNoZWNrIGFnYWluc3QgaXQu
Cj4gICogUmVwb3J0IGFic29sdXRlIGN5Y2xlIGVycm9yLgo+IAo+IHYyOgo+ICAqIEJyaW5nIGJh
Y2sgc2VsZi1hZGp1c3QuIChDaHJpcyBXaWxzb24pCj4gICAgKEJ1dCBzbGlnaHRseSBmaXhlZCB2
ZXJzaW9uIHdpdGggbm8gb3ZlcmZsb3cuKQo+IAo+IHYzOgo+ICAqIExvZyBhdmVyYWdlIGFuZCBt
ZWFuIGNhbGlicmF0aW9uIGZvciBlYWNoIHBhc3MuCj4gCj4gdjQ6Cj4gICogRWxpbWluYXRlIGRl
dmVsb3BtZW50IGxlZnRvdmVycy4KPiAgKiBGaXggdmFyaWFuY2UgbG9nZ2luZy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgoKRnJv
bSBhIHByYWdtYXRpYyBwb2ludCBvZiB2aWV3LCB0aGVyZSdzIG5vIHBvaW50IHdhaXRpbmcgZm9y
IG1lIHRvIGJlCmhhcHB5IHdpdGggdGhlIGNvbnZlcmdlbmNlIGlmIENJIGlzLCBhbmQgdGhlIHZh
cmlhbmNlIHdpbGwgZGVmaW5pdGVseSBiZQppbnRlcmVzdGluZyAoYWx0aG91Z2ggeW91IGNvdWxk
IGhhdmUgdXNlZCBpZ3RfbWVhbiB0byBjb21wdXRlIHRoZQppdGVyYXRpdmUgdmFyaWFuY2UpLCBz
bwoKUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgot
Q2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
