Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684C589760
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2019 09:49:45 +0000 (UTC)
References: <20190604084612.13950-1-petri.latvala@intel.com>
 <0e81bb65-c04c-749d-dd64-9bfdd71a9c5e@linux.intel.com>
 <20190605090832.GB22949@platvala-desk.ger.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <bf72e9ea-4a16-bdc2-22c9-b2c582548277@linux.intel.com>
Date: Wed, 5 Jun 2019 10:49:43 +0100
MIME-Version: 1.0
In-Reply-To: <20190605090832.GB22949@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] perf_pmu: Actually require engines again
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
To: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Andi Shyti <andi.shyti@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA1LzA2LzIwMTkgMTA6MDgsIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4gT24gVHVlLCBKdW4g
MDQsIDIwMTkgYXQgMDk6NTE6MTdBTSArMDEwMCwgVHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4+Cj4+
IE9uIDA0LzA2LzIwMTkgMDk6NDYsIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4+PiBJbiBjb21taXQg
MzJlNDIxZjZmNzRhICgidGVzdDogcGVyZl9wbXU6IHVzZSB0aGUgZ2VtX2VuZ2luZV90b3BvbG9n
eQo+Pj4gbGlicmFyeSIpIHBlcmZfcG11IHdhcyBjb252ZXJ0ZWQgdG8gdXNlIGdlbV9jb250ZXh0
X2hhc19lbmdpbmUoKQo+Pj4gaW5zdGVhZCBvZiBnZW1fcmVxdWlyZV9lbmdpbmUsIGJ1dCBtaXNz
aW5nIHRoZSBjcnVjaWFsIHBhcnQgb2YKPj4+IGlndF9yZXF1aXJlKCkuCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4+PiBDYzog
VHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KPj4+IENjOiBBbmRpIFNo
eXRpIDxhbmRpLnNoeXRpQGludGVsLmNvbT4KPj4+IC0tLQo+Pj4gICAgdGVzdHMvcGVyZl9wbXUu
YyB8IDYgKysrLS0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS90ZXN0cy9wZXJmX3BtdS5jIGIvdGVzdHMv
cGVyZl9wbXUuYwo+Pj4gaW5kZXggNzJiOTE2NmEuLmZkYWY5NmRhIDEwMDY0NAo+Pj4gLS0tIGEv
dGVzdHMvcGVyZl9wbXUuYwo+Pj4gKysrIGIvdGVzdHMvcGVyZl9wbXUuYwo+Pj4gQEAgLTE3MTQs
NyArMTcxNCw3IEBAIGlndF9tYWluCj4+PiAgICAJCWlndF9zdWJ0ZXN0X2dyb3VwIHsKPj4+ICAg
IAkJCWlndF9maXh0dXJlIHsKPj4+IC0JCQkJZ2VtX2NvbnRleHRfaGFzX2VuZ2luZShmZCwgMCwg
ZS0+ZmxhZ3MpOwo+Pj4gKwkJCQlpZ3RfcmVxdWlyZShnZW1fY29udGV4dF9oYXNfZW5naW5lKGZk
LCAwLCBlLT5mbGFncykpOwo+Pgo+PiBIbW1tLi4gaXMgdGhlIGxpbmUgZXZlbiBuZWVkZWQ/IEkg
dGhpbmsgaXRlcmF0b3Igd2lsbCBvbmx5IGNvbnRhaW4gYXZhaWxhYmxlCj4+IGVuZ2luZXMuCj4g
Cj4gCj4gR29vZCBxdWVzdGlvbiwgbG9va3MgbGlrZSBuby4KPiAKPiBEb2VzIHRoZSBpdGVyYXRv
ciBvbmx5IGdpdmUgYXZhaWxhYmxlIGVuZ2luZXMgb24geWUgb2xkZSBrZXJuZWxzIHRvbz8KClRo
ZXJlIGlzIGEgZ2VtX2hhc19yaW5nIGluIGdlbV9lbmdpbmVfdG9wb2xvZ3kuYy9pbnRlbF9pbml0
X2VuZ2luZV9saXN0IApvbiB0aGUgbGVnYWN5IHBhdGggc28gSSB0aGluayBpdCBmaWx0ZXJzIHRo
ZW0gdGhlcmUgYXMgd2VsbC4KCkFuZGk/CgpSZWdhcmRzLAoKVHZydGtvCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
