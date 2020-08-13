Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF79A6E204
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2020 11:21:51 +0000 (UTC)
References: <20200806132935.23293-1-karthik.b.s@intel.com>
 <594bbda7-65ca-91d9-5a63-96f95bf9ac83@daenzer.net>
 <690eb9de-c1db-ecd4-e4f3-c2484e84c5b9@intel.com>
 <f033f418-8874-733d-8e77-1aec4080c9c9@daenzer.net>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <dd896dc4-c0f0-0a75-f7b8-717117446b48@intel.com>
Date: Thu, 13 Aug 2020 16:51:47 +0530
MIME-Version: 1.0
In-Reply-To: <f033f418-8874-733d-8e77-1aec4080c9c9@daenzer.net>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/kms_async_flips: Add test to
 validate asynchronous flips
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
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Cc: igt-dev@lists.freedesktop.org, daniel.vetter@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiA4LzcvMjAyMCA2OjI5IFBNLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPiBPbiAyMDIwLTA4
LTA3IDExOjMxIGEubS4sIEthcnRoaWsgQiBTIHdyb3RlOgo+PiBPbiA4LzYvMjAyMCA4OjE5IFBN
LCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4+IE9uIDIwMjAtMDgtMDYgMzoyOSBwLm0uLCBLYXJ0
aGlrIEIgUyB3cm90ZToKPj4+PiBBc3luY2hyb25vdXMgZmxpcHMgYXJlIGlzc3VlZCB1c2luZyB0
aGUgcGFnZSBmbGlwIElPQ1RMLgo+Pj4+IFRoZSB0ZXN0IGNvbnNpc3RzIG9mIHR3byBzdWJ0ZXN0
cy4gVGhlIGZpcnN0IHN1YnRlc3Qgd2FpdHMgZm9yCj4+Pj4gdGhlIHBhZ2UgZmxpcCBldmVudCB0
byBiZSByZWNlaXZlZCBiZWZvcmUgZ2l2aW5nIHRoZSBuZXh0IGZsaXAsCj4+Pj4gYW5kIHRoZSBz
ZWNvbmQgc3VidGVzdCBkb2Vzbid0IHdhaXQgZm9yIHBhZ2UgZmxpcCBldmVudHMuCj4+Pgo+Pj4g
VGhlIGxhdHRlciBzb3VuZHMgc2tldGNoeS4gSXQgbWlnaHQgZ2V0IGx1Y2t5IG1vc3Qgb2YgdGhl
IHRpbWUsIGJ1dCBpZgo+Pj4gdGhlIHByZXZpb3VzIGZsaXAgaXMgc3RpbGwgcGVuZGluZywgdGhl
IGlvY3RsIHdpbGwgZmFpbCB3aXRoIEVCVVNZLgo+Pj4KPj4KPj4gVGhhbmtzIGZvciB0aGUgcmV2
aWV3Lgo+PiBJIHdpbGwgdXBkYXRlIHRoZSB0ZXN0IHRvIHJldHJ5IG9uIGdldHRpbmcgRUJVU1kg
dW50aWwgMSB2YmxhbmsgdGltZSBhbmQKPj4gdGhlbiBmYWlsIGlmIHdlJ3JlIHN0aWxsIGdldHRp
bmcgRUJVU1kuCj4gCj4gVGhhdCBjb3VsZCBzdGlsbCBmYWlsIHdpdGggQU1EIEdQVXMsIHdoZXJl
IHRoZSB2YmxhbmsgaW50ZXJydXB0IGNhbiBmaXJlCj4gZWFybGllciB0aGFuIHRoZSBmbGlwIGNv
bXBsZXRpb24gaW50ZXJydXB0Lgo+IAo+IEkgZG9uJ3QgZ2V0IHRoZSBwb2ludCBvZiBzdWNoIGEg
c3ViLXRlc3QgVEJILiBVc2Vyc3BhY2Ugc2hvdWxkIGFsd2F5cwo+IHVzZSB0aGUgZmxpcCBjb21w
bGV0aW9uIGV2ZW50IHRvIGtub3cgd2hlbiBhIGZsaXAgaGFzIGNvbXBsZXRlZCBhbmQKPiBhbm90
aGVyIG9uZSBjYW4gYmUgc3VibWl0dGVkLgo+IApUaGlzIHN1Yi10ZXN0IHdhcyBhZGRlZCBhcyB0
aGUgQVBJIGNvdWxkIGJlIGNhbGxlZCB3aXRob3V0IHJlcXVlc3RpbmcgCmZvciBldmVudHMgYXMg
d2VsbC4KCkRvIHlvdSBzdWdnZXN0IHdlIGRvY3VtZW50IHNvbWV3aGVyZSB0aGF0IHRoaXMgQVBJ
IGNhbm5vdCBiZSB1c2VkIGxpa2UgCnRoYXQgb3IgaXMgdGhlcmUgYSBwb3NzaWJpbGl0eSBvZiB0
aGlzIEFQSSBzdGlsbCBiZWluZyBjYWxsZWQgZnJvbSAKdXNlcnNwYWNlIHdpdGhvdXQgcmVxdWVz
dGluZyBmb3IgZXZlbnRzPwoKVGhhbmtzLApLYXJ0aGlrLkIuUwo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
