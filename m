Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8236F00A
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:48:53 +0000 (UTC)
References: <20190116112050.27647-1-petri.latvala@intel.com>
 <20190116112050.27647-13-petri.latvala@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <8b5be6ee-8d27-8b93-255c-37f68b064b09@linux.intel.com>
Date: Wed, 16 Jan 2019 11:48:53 +0000
MIME-Version: 1.0
In-Reply-To: <20190116112050.27647-13-petri.latvala@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 12/21] benchmarks/gem_userptr_benchmark:
 Correctly free memory
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDE2LzAxLzIwMTkgMTE6MjAsIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4gaWYgKHApIGZyZWUo
cCkgZG9lcyBhIHVzZWxlc3MgY2hlY2ssIGZyZWUoTlVMTCkgaXMgYSB2YWxpZCBjYWxsLiBBbHNv
Cj4gYXNzaWduIE5VTEwgc28gd2UgZG9uJ3QgZW5kIHVwIGRvdWJsZS1mcmVlaW5nIG1lbW9yeSBp
ZiBhbnlvbmUKPiByZW9yZGVycyBucl9ib3MgdG8gaGF2ZSBhIDAgYWZ0ZXIgb3RoZXIgdmFsdWVz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwu
Y29tPgo+IENjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IC0t
LQo+ICAgYmVuY2htYXJrcy9nZW1fdXNlcnB0cl9iZW5jaG1hcmsuYyB8IDUgKysrLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2JlbmNobWFya3MvZ2VtX3VzZXJwdHJfYmVuY2htYXJrLmMgYi9iZW5jaG1hcmtzL2dl
bV91c2VycHRyX2JlbmNobWFyay5jCj4gaW5kZXggZjc3MTZkZmEuLmJlZjJjY2M0IDEwMDY0NAo+
IC0tLSBhL2JlbmNobWFya3MvZ2VtX3VzZXJwdHJfYmVuY2htYXJrLmMKPiArKysgYi9iZW5jaG1h
cmtzL2dlbV91c2VycHRyX2JlbmNobWFyay5jCj4gQEAgLTM1NSw4ICszNTUsOSBAQCBzdGF0aWMg
dm9pZCB0ZXN0X2ltcGFjdF9vdmVybGFwKGludCBmZCwgY29uc3QgY2hhciAqcHJlZml4KQo+ICAg
Cj4gICAJCWZvciAoaSA9IDA7IGkgPCBucl9ib3Nbc3VidGVzdF07IGkrKykKPiAgIAkJCWdlbV9j
bG9zZShmZCwgaGFuZGxlc1tpXSk7Cj4gLQkJaWYgKGJsb2NrKQo+IC0JCQlmcmVlKGJsb2NrKTsK
PiArCj4gKwkJZnJlZShibG9jayk7Cj4gKwkJYmxvY2sgPSBOVUxMOwo+ICAgCX0KPiAgIH0KPiAg
IAo+IAoKUmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5j
b20+CgpSZWdhcmRzLAoKVHZydGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
