Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9496E11D
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2019 19:29:12 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191031185307.gnahtgx4xze3647b@vrkonda-desk.ra.intel.com>
References: <20191031185307.gnahtgx4xze3647b@vrkonda-desk.ra.intel.com>
Message-ID: <157255014702.13036.14246359556945643505@skylake-alporthouse-com>
Date: Thu, 31 Oct 2019 19:29:07 +0000
Subject: Re: [igt-dev] [PATCH] i915/gem_spin_batch: Add test to execute in
 parallel on all engines
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
To: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWYW5zaGlkaGFyIEtvbmRhICgyMDE5LTEwLTMxIDE4OjUzOjA3KQo+IE9uIFRodSwg
T2N0IDMxLCAyMDE5IGF0IDA2OjE3OjI4UE0gKzAwMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+
UXVvdGluZyBWYW5zaGlkaGFyIEtvbmRhICgyMDE5LTEwLTMxIDE4OjAxOjU5KQo+ID4+IEFkZCBh
IHRlc3QgdGhhdCBzdWJtaXRzIGJhdGNoIGJ1ZmZlcnMgdG8gYWxsIGVuZ2luZXMgYW5kIGV4ZWN1
dGVzIHRoZW0KPiA+PiBpbiBwYXJhbGxlbDsgZWl0aGVyIGZyb20gdGhlIHNhbWUgY29udGV4dCBv
ciBmcm9tIG5ldyBjb250ZXh0cyBmb3IgZWFjaAo+ID4+IGVuZ2luZS4KPiA+Cj4gPkR1cGxpY2F0
aW5nIGEgdGVzdCBmb3Igd2hhdCBwdXJwb3NlPyBQZWRhZ29neT8KPiAKPiBJdCB3b3VsZCBiZSBn
cmVhdCBpZiB5b3UgY291bGQgcG9pbnQgb3V0IHdoaWNoIHRlc3QgdGhpcyBkdXBsaWNhdGVzLgo+
IEkndmUgYmVlbiBsb29raW5nIGZvciBhIHRlc3QgdGhhdCBwcm92ZXMgYSBiYXRjaCBidWZmZXIg
aXMgZXhlY3V0aW5nIGluCj4gcGFyYWxsZWwgb24gYWxsIGVuZ2luZXMuIE90aGVycyBJIHNwb2tl
IHRvIGNvdWxkbid0IHBvaW50IG91dCBhIHRlc3QuCgpUaGVyZSBhcmUgcXVpdGUgYSBmZXcsIGRl
cGVuZGluZyBvbiBqdXN0IGhvdyB5b3Ugd2FudCB0byBnbyBhYm91dApwcm92aW5nIGV4ZWN1dGlv
bi4gVGhlIGZvY3VzIGZvciBnZW1fc3Bpbl9iYXRjaCBpcyBkZW1vbnN0cmF0aW5nIHRoYXQKdGhl
IGlndF9zcGluX3QgQVBJIHdvcmtzIGFzIGFkdmVydGlzZWQsIG5vdCB0aGUgdUFCSSBwZXIgc2Uu
CgpTbyB3aGF0J3MgeW91ciBwcmltYXJ5IGZvY3VzIGhlcmU/IERlbW9uc3RyYXRpbmcgaG93IHRv
IHVzZSBpZ3Rfc3Bpbl90LAp2ZXJpZnlpbmcgdGhhdCB3ZSBjYW4gc2NoZWR1bGUgcGFyYWxsZWwg
ZW5naW5lcywgdGhhdCB3ZSBjYW4gc3BlY2lmeQpwYXJhbGxlbCBzZXQgb2YgZW5naW5lcywgd2Ug
cmVwb3J0IHBhcmFsbGVsIGFjdGl2aXR5IG9yIHRoYXQgdGhlIEhXCmJlaGF2ZXMgaW4gYSBjZXJ0
YWluIHdheT8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
