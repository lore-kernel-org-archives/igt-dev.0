Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D4E6E40A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Oct 2018 09:06:49 +0000 (UTC)
Date: Wed, 3 Oct 2018 12:06:35 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20181003090635.cx2y3u4rjgeijpel@ahiler-desk1.fi.intel.com>
References: <20180927131142.32134-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180927131142.32134-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] runner: Add time_elapsed field to
 results
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBTZXAgMjcsIDIwMTggYXQgMDQ6MTE6NDJQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBXaGVuIHN0YXJ0aW5nIGEgdGVzdCBydW4sIGRyb3AgYSB0aW1lc3RhbXAgZmlsZS4g
RG8gdGhlIHNhbWUgd2hlbgo+IGVuZGluZyBhIHJ1bi4gU2xhcCB0aG9zZSB0aW1lc3RhbXBzIGRp
cmVjdGx5IGludG8gdGhlIHRpbWVfZWxhcHNlZAo+IGZpZWxkIGluIHJlc3VsdHMuanNvbi4KPiAK
PiBVc2luZyB0aW1lc3RhbXBzIGluc3RlYWQgb2YgbWVhc3VyaW5nIGFjdHVhbCBlbGFwc2VkIHRp
bWUgZ29lcyBhZ2FpbnN0Cj4gdGhlIG5hbWluZyBvZiB0aGUgZmllbGQsIGJ1dCB0aGUgbmFtZSBp
cyBjaG9zZW4gYnkgcGlnbGl0LiBFdmVuIHRob3VnaAo+IHBpZ2xpdCBpdHNlbGYgdXNlcyB0aW1l
c3RhbXBzLgo+IAo+IENvcm5lciBjYXNlczoKPiAKPiBPbiBpbmNvbXBsZXRlIHRlc3QgcnVucywg
dGhlIGVuZCB0aW1lc3RhbXAgd2lsbCBiZSBtaXNzaW5nLiBUaGUKPiB0aW1lX2VsYXBzZWQgZmll
bGQgd2lsbCBvbmx5IGhhdmUgdGhlIHN0YXJ0IHRpbWVzdGFtcC4gVGhpcyBtYXRjaGVzCj4gcGln
bGl0IGJlaGF2aW91ciBleGFjdGx5Lgo+IAo+IE9uIGluY29tcGxldGUgYnV0IHJlc3VtZWQgdGVz
dCBydW5zLCB0aGUgZW5kIHRpbWVzdGFtcCB3aWxsIGJlIHRoZQo+IHRpbWUgd2hlbiB0aGUgcmVz
dW1lIGZpbmlzaGVzLiBQaWdsaXQgZG9lc24ndCBkbyB0aGlzLCBhbmQgaW5zdGVhZAo+IGxlYXZl
cyB0aGUgZW5kIHRpbWVzdGFtcCBtaXNzaW5nLiBEaXNjdXNzaW5nIHdoaWNoIGJlaGF2aW91ciBp
cyBiZXR0ZXIKPiBpcyBsZWZ0IGFzIGFuIGV4ZXJjaXNlIHRvIHRoZSByZWFkZXJzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+IENj
OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Cj4gQ2M6IFRvbWkg
U2FydmVsYSA8dG9taS5wLnNhcnZlbGFAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IEFya2FkaXVz
eiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KCk9uY2UgdGhpcyBnZXRzIG1lcmdl
ZCB3ZSB3aWxsIGhhdmUgdG8gdXBkYXRlIElHVCBvbiB0aGUgdGhlIENJIGhvc3QuCgotLSAKQ2hl
ZXJzLApBcmVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
