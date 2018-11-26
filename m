Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from 3.mo178.mail-out.ovh.net (3.mo178.mail-out.ovh.net
 [46.105.44.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0B76E272
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Nov 2018 09:13:35 +0000 (UTC)
Received: from player788.ha.ovh.net (unknown [10.109.160.93])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id A5EF140BD7
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Nov 2018 10:07:45 +0100 (CET)
Date: Mon, 26 Nov 2018 11:07:37 +0200
From: Andi Shyti <andi@etezian.org>
Message-ID: <20181126090737.GA1745@jack.zhora.eu>
References: <20181121161023.1603-1-andi.shyti@intel.com>
 <20181121161023.1603-3-andi.shyti@intel.com>
 <f8355c69-2b92-65c1-e51c-d309531d2db7@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8355c69-2b92-65c1-e51c-d309531d2db7@linux.intel.com>
Subject: Re: [igt-dev] [RFC v2 2/3] lib: implement new engine discovery
 interface
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgVHZydGtvLAoKanVzdCBmZXcgdGhpbmdzIHRoYXQgY2FtZSB0byBteSBtaW5kIHdoaWxlIGdv
aW5nIHRocm91Z2ggeW91cgpyZXZpZXcuCgo+ID4gKwlxdWVyeV9lbmdpbmVzID0gbWFsbG9jKHNp
emUpOwo+ID4gKwlpZiAoIXF1ZXJ5X2VuZ2luZXMpCj4gPiArCQlyZXR1cm4gTlVMTDsKPiAKPiBX
ZSBwcm9iYWJseSB3YW50IHRvIGlndF9hc3NlcnQgb24gdGhpcyBzaW5jZSB0aGVyZSBpcyBubyBw
b2ludCBnb2luZwo+IGZ1cnRoZXIuCgppc24ndCBpZ3RfYXNzZXJ0IHVzZWQgZm9yIHRoZSB0ZXN0
IG91dGNvbWU/IFdoYXQgSSBtZWFuIGlzIHRoYXQKdGhlIHRlc3Qgb3V0Y29tZSB3b3VsZCBiZSB0
byBxdWVyeSBhbmQgc2V0IHRoZSBlbmdpbmVzLCBidXQgaWYgd2UKZmFpbCBpbiBtYWxsb2Mgd2Ug
ZG8gbm90IG5lY2Vzc2FyaWx5IGZhaWwgdGhlIHRlc3QsIGJ1dCB3ZSBoYXZlIGEKZGlmZmVyZW50
IGtpbmQgb2Ygc3lzdGVtIGZhaWx1cmUuCgoodGhpcyBpcyBub3QgaW1wb3J0YW50LCBqdXN0IGZv
ciBtZSB0byB1bmRlcnN0YW5kIGJldHRlciA6KSApCgo+ID4gK2ludCBnZXRfZW5naW5lcyhpbnQg
ZmQsIHVpbnQzMl90IGN0eF9pZCkKPiAKPiBzZXR1cF9jdHhfZW5naW5lcz8KPiAKPiBEb2VzIGl0
IG5lZWQgdG8gYmUgZXhwb3J0ZWQgb3IgaXQgY2FuIGJlIHN0YXRpYz8KCkhvdyBkbyB3ZSByZWFj
aCBpdCBmcm9tIG91dHNpZGUgaWYgd2Ugc2V0IGl0IHN0YXRpYz8gVGhpcwpmdW5jdGlvbiBpcyBj
YWxsZWQgaW4gdGhlIGZvcl9lYWNoX2VuZ2luZV9jdHggbWFjcm8gdGhhdCBpcyB1c2VkCm91dHNp
ZGUgZnJvbSBpZ3RfZ3QuYwoKPiA+ICsjZGVmaW5lIGZvcl9lYWNoX2VuZ2luZV9jdHgoZmQsIGN0
eCwgZSkgXAo+IAo+IEhpZ2ggbGV2ZWwgZGVzaWduIHF1ZXN0aW9uOiBEbyB3ZSB3YW50ICdlJyB0
byBiZSBhbiBpbnRlZ2VyIG9yIGEgc3RydWN0Cj4gZGVzY3JpYmluZyBlYWNoIGVuZ2luZT8KCkRv
IHlvdSBtZWFuIHRoYXQgeW91IHdvdWxkIHlvdSBwcmVmZXIgaXRlcmF0aW5nIHdpdGggYQonaTkx
NV9jb250ZXh0X3BhcmFtX2VuZ2luZXMnIG9yIGEgJ2ludGVsX2V4ZWN1dGlvbl9lbmdpbmUnIHN0
cnVjdAppbnN0ZWFkIG9mIGFuICdlJyBpbnRlZ2VyPyBUaGlzIHdheSBpdCB3b3VsZCBhbHNvIGJl
IGRpZmZlcmVudApmcm9tIGhvdyB0aGUgY3VycmVudCAnZm9yX2VhY2hfZW5naW5lJyB3b3Jrcy4K
CkkgY291bGQgZG8gaXQgaW4gYSBuZXh0IHBhdGNoLCBzbyB0aGF0IGluIHRoaXMgb25lIHdlIGtl
ZXAgaXQgYXMKY2xvc2UgYXMgcG9zc2libGUgdG8gdGhlIGN1cnJlbnQgd2F5IG9mIGRvaW5nIHRo
aW5ncy4KCkFuZGkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
