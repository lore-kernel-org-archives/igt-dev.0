Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20180315125617.12062-1-tvrtko.ursulin@linux.intel.com>
 <152111966955.25315.15544334273574135347@mail.alporthouse.com>
 <1a8be18d-e456-b3b0-3483-d95594ea8b27@linux.intel.com>
 <152112155077.25315.9635916282186626812@mail.alporthouse.com>
 <24aaf956-edc7-d497-72e3-89a27f9ea9db@linux.intel.com>
 <152112516207.25315.17980920719053138096@mail.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <e0e38429-10a5-47f8-7838-75d9c087c50e@linux.intel.com>
Date: Thu, 15 Mar 2018 14:53:08 +0000
MIME-Version: 1.0
In-Reply-To: <152112516207.25315.17980920719053138096@mail.alporthouse.com>
Content-Language: en-GB
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] tests/perf_pmu: Improve
 accuracy by waiting on spinner to start
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDE1LzAzLzIwMTggMTQ6NDYsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE4LTAzLTE1IDE0OjM3OjU5KQo+Pgo+PiBPbiAxNS8wMy8yMDE4IDEzOjQ1
LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4+PiBBcyB3ZSBhcmUgbWFraW5nIGNoYW5nZXMgdG8gaWd0
X3NwaW5fdCwgb25lIG9mIHRoZSBpZGVhcyB3YXMgdGhhdCB3ZSBwdXQKPj4+IHRoZSBvYmpbXSBh
cnJheSB0aGVyZSAod2l0aCB0aGUgb2Zmc2V0cyBhbmQgZmxhZ3Mgc2V0dXAgY29ycmVjdGx5KSBz
bwo+Pj4gdGhhdCB3ZSBjb3VsZCBqdXN0IGZlZWQgdGhhdCBpbiBhZ2FpbiBsYXRlciB3aXRob3V0
IGhhdmluZyB0byB3b3JyeQo+Pj4gYWJvdXQgdGhlIHJlbG9jYXRpb25zLgo+Pgo+PiBJIHRyaWVk
IHRoYXQgYmVmb3JlIGJ1dCB3ZSBjb3VsZG4ndCBhZ3JlZSBvbiByZXN1Ym1pdCBzZW1hbnRpY3Mu
Cj4+Cj4+IE15IHBhdGNoIGhhZCBpZ3Rfc3Bpbl9iYXRjaF9yZXN0YXJ0KGZkLCBzcGluKSAtIHNv
IGVtaXR0aW5nIHRoZSBleGFjdAo+PiBzYW1lIGJhdGNoLCBpbmNsdWRpbmcgdGhlIGRlcGVuZGVu
Y3kuIFRoYXQgd291bGQgYWN0dWFsbHkgd29yayB3ZWxsIGZvcgo+PiB0aGlzIHVzZSBjYXNlLgo+
Pgo+PiBTbyBpZiB5b3UgYXJlIGhhcHB5IHdpdGggdGhhdCwgSSBjYW4gcmVzdXJyZWN0IHRoYXQg
cGF0Y2gsIGFkZCBvbmUgbW9yZQo+PiB0byBpbXBsZW1lbnQgc3R1ZmYgZnJvbSB0aGlzIHBhdGNo
LCBhbmQgcmViYXNlIHBlcmZfcG11IGNoYW5nZXMgdG8gZm9sbG93Lgo+IAo+IEhvbmVzdGx5LCBi
ZXN0IHRvIGRvIGhlcmUgZmlyc3QsIGFzIHdlIHdpbGwgcHJvYmFibHkgdGFrZSBmb3JldmVyIHRv
IGNvbWUKPiB1cCB3aXRoIHNvbWV0aGluZyB3ZSBib3RoIGxpa2UgYW5kIGFwcGxpZXMgdG8gbW9y
ZSB0ZXN0IGNhc2VzLgoKRG9uJ3QgcXVpdGUgZ2V0IHdoYXQgeW91IG1lYW4gYnkgImJlc3QgdG8g
ZG8gaGVyZSBmaXJzdCIgLSB3aGVyZSBpcyAKaGVyZT8gU3RpbGwgbG9jYWxseSB0byBwZXJmX3Bt
dSBzbyBubyBnZW5lcmljIHNwaW4gYmF0Y2ggcmVzdWJtaXQgeWV0PyAKQnV0IEkgY2FuIGNhY2hl
IHRoZSBvYmogYXJyYXkgdW5kZXIgc3Bpbl9iYXRjaF90IGFzIGEgc2hvcnRjdXQgZm9yIHRpbWUg
CmJlaW5nPwoKUmVnYXJkcywKClR2cnRrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1nZngK
