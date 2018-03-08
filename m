Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097776E13C
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Mar 2018 15:47:04 +0000 (UTC)
References: <20180226175920.15815-1-lionel.g.landwerlin@intel.com>
 <20180226175920.15815-2-lionel.g.landwerlin@intel.com>
 <193ab3f3-5d1f-41b1-9b36-c8112b7c54ca@linux.intel.com>
 <66da2e97-fdcd-3b65-65b1-099ef74ab5bd@intel.com>
 <152052029992.18139.484286988595424085@mail.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <663f3743-68f3-bfb5-0835-11abb3ebb872@linux.intel.com>
Date: Thu, 8 Mar 2018 15:47:01 +0000
MIME-Version: 1.0
In-Reply-To: <152052029992.18139.484286988595424085@mail.alporthouse.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t v5 2/3] tests: add i915 query tests
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA4LzAzLzIwMTggMTQ6NDQsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIExpb25l
bCBMYW5kd2VybGluICgyMDE4LTAzLTA4IDE0OjMxOjE2KQo+PiBPbiAwOC8wMy8xOCAxMToyMiwg
VHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4+PiBJbnRlcmVzdGluZyBxdWVzdGlvbiBob3cgd2Ugd2Fu
dCB0byBuYW1lIHRoaXMgdGVzdC4gV2UgZG9uJ3QgaGF2ZSBhbnkKPj4+IGk5MTVfIHByZWZpeCB0
ZXN0cywgYnV0IGZvciBpbnN0YW5jZSB0aGVyZSBpcyBkcnZfZ2V0cGFyYW1zX2Jhc2ljLAo+Pj4g
c3VnZ2VzdGluZyB0aGlzIGNvdWxkIGJlIGNhbGxlZCBkcnZfcXVlcnlfaW9jdGwgb3Igc29tZXRo
aW5nPwo+Pj4KPj4+IE9wZW4gZm9yIGRpc2N1c3Npb24gSSBndWVzcy4KPj4KPj4gSSd2ZSBiZWVu
IGNvbnNpZGVyaW5nIHJlbmFtaW5nIHBlcmYuYyAodGhhdCdzIGEgcHJldHR5IGNvbmZ1c2luZyBv
bmUuLi4pCj4+Cj4+IE9uZSBjb3VsZCBhcmd1ZSB0aGF0IGlmIElHVCB0ZXN0cyBtb3JlIHRoYW4g
aW50ZWwgZGV2aWNlcywgd2Ugc2hvdWxkCj4+IGhhdmUgYSBkcml2ZXIgcHJlZml4IChJIHNlZSB2
YzQgaGFzKS4KPiAKPiBZZXMuIE1vdmUgYWxsIG9mIHRoZSBpOTE1LmtvIHNwZWNpZmljIHRlc3Rz
IHRvIHRlc3RzL2k5MTUvCj4gCj4gRm9yIGJ1aWxkIHN5c3RlbSBzaW1wbGljaXR5LCBJJ2QgYWR2
b2NhdGUga2VlcGluZyBnZW5lcmljIHRlc3RzCj4gc2VwYXJhdGUgZnJvbSBkcml2ZXIgc3BlY2lm
aWMgdGVzdHMuIFNvIGttc19mbGlwIHdvdWxkIGhhdmUga21zLyBhbmQKPiBpOTE1LyBwb3J0aW9u
cywgZXRjLgo+IAo+IChBbmQgdG9vbHMvaTkxNTsgYmVuY2htYXJrcy9pOTE1IGV0YykKCk9rYXkg
YnV0IHBlbmNpbCBpbiBmb3IgZnV0dXJlIHdvcmsgSSdkIHN1Z2dlc3Qgc2luY2Ugd2UgYXJlIHdv
cmtpbmcgCmFnYWluc3QgYSBkZWFkbGluZSBoZXJlLiA6KSBBdCBsZWFzdCBubyBuZWVkIHRvIGlu
Y29ycG9yYXRlIGxhcmdlciAKcmVuYW1lcyBsaWtlIHRoYXQgaW50byB0aGlzIHdvcmsuCgpSZWdh
cmRzLAoKVHZydGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
