Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04EE6E8EB
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 18:47:03 +0000 (UTC)
Date: Tue, 19 Nov 2019 10:47:02 -0800
From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Message-ID: <20191119184701.GA15588@intel.com>
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
 <20191119110117.13209-2-venkata.s.dhanalakota@intel.com>
 <157416186350.10169.17147049716181579154@skylake-alporthouse-com>
 <9d2b9921-d26f-4416-af34-1bb9b7d1bfa1@linux.intel.com>
 <157416338013.10169.9033467622461448226@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157416338013.10169.9033467622461448226@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] test/i915: gem_exec_parallel: Fix
 for using context engine map
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
To: Chris Wilson <chris@chris-wilson.co.uk>, andi.shyti@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMTkvMTEvMTkgMTE6MzYsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRrbyBV
cnN1bGluICgyMDE5LTExLTE5IDExOjIyOjMwKQo+ID4gCj4gPiBPbiAxOS8xMS8yMDE5IDExOjEx
LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiA+IFF1b3RpbmcgVmVua2F0YSBTYW5kZWVwIERoYW5h
bGFrb3RhICgyMDE5LTExLTE5IDExOjAxOjE3KQo+ID4gPj4gU2luY2UgZW5naW5lcyBhcmUgbm93
IGxvb2tlZCB1cCBiYXNlZCBvbiBjb250ZXh0IGVuZ2luZSBtYXAsCj4gPiA+PiBjb250ZXh0IHNo
b3VsZCBiZSBzZXR1cCB3aXRoIGVuZ2luZXMgYmVmb3JlIHVzaW5nIGluIGV4ZWNidWYuCj4gPiA+
IAo+ID4gPiBTdG9wIGNoYW5naW5nIGZ1bmRhbWVudGFsIHRlc3RzIG9mIGxlZ2FjeSBiZWhhdmlv
dXIuIElmIHlvdSB3YW50IHRvCj4gPiA+IGV4ZXJjaXNlIG5ldyBBUEksIGRvIHNvIGluIHBhcmFs
bGVsLgo+ID4gCj4gPiBUaGUgdGVzdCBpcyBhbHJlYWR5IHVzaW5nIHRoZSBuZXcgYXBpIHNvIGFz
IGl0IHN0YW5kcyB0aGVyZSdzIGEgbWlzbWF0Y2ggCj4gPiBvbiBlbmdpbmUgZmxhZ3MgYW5kIGNv
bnRleHQgLSBzaW5jZSBpdCBwYXNzZXMgdGhlIGVuZ2luZSBmbGFncyB0byB0aGUgCj4gPiB0aHJl
YWQsIGRlcml2ZWQgZnJvbSBhIGNvbnRleHQgd2l0aCBlbmdpbmUgbWFwLCBidXQgdGhlIHRocmVh
ZCB1c2VzIGEgCj4gPiBsZWdhY3kgY29udGV4dC4gSXQgaGFzIHRvIGJlIGFsaWduZWQgZm9yIHRo
ZSBpbnRlbmRlZCBlbmdpbmUgdG8gZ2V0IAo+ID4gZXhlcmNpc2VkLgo+IAo+IFRoZW4gY29uc2lk
ZXIgaXQgYSByZXRyb3NwZWN0aXZlIGNvbXBsYWludCBmb3IgbXVja2luZyB1cCBhIGJhc2ljIHRl
c3QgOi1wCkkndmUgYWRkZWQgQW5keSB0byB0aHJlYWQob3duZXIgb2Ygb3JnaW5hbCBwYXRjaCBz
ZXJpZXMpLiBJJ20gd29uZGVyaW5nIGlmIHdlCnNob3VsZCByZXZpZXcgdGhlIGFsbCB0ZXN0cyB3
aGljaCBhcmUgYWRvcHRlZCB0byB1c2UgbmV3IEFQSSBvbmx5IGFuZApoYXZlIGJvdGggbGVnYWN5
IGFuZCBuZXcgYmVoYXZpb3VyLgoKflNhbmRlZXAuCj4gLUNocmlzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
