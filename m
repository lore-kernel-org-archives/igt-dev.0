Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACFD894C9
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 12:44:27 +0000 (UTC)
References: <20190410111931.28305-1-maarten.lankhorst@linux.intel.com>
 <20190410111931.28305-3-maarten.lankhorst@linux.intel.com>
 <155489546967.3516.16665785841642844899@skylake-alporthouse-com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <07e03cad-ca38-ba6c-17e1-a9b35ee57bba@linux.intel.com>
Date: Wed, 10 Apr 2019 14:44:23 +0200
MIME-Version: 1.0
In-Reply-To: <155489546967.3516.16665785841642844899@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_flip: Do not request
 event for flips we expect to fail.
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTAtMDQtMjAxOSBvbSAxMzoyNCBzY2hyZWVmIENocmlzIFdpbHNvbjoKPiBRdW90aW5nIE1h
YXJ0ZW4gTGFua2hvcnN0ICgyMDE5LTA0LTEwIDEyOjE5OjMxKQo+PiBJZiB3ZSB1bmV4cGVjdGVk
bHkgcGFzcywgd2UgZ2V0IGEgY3J5cHRpYwo+PiAoa21zX2ZsaXA6OTM1KSBDUklUSUNBTDogVGVz
dCBhc3NlcnRpb24gZmFpbHVyZSBmdW5jdGlvbiBzZXRfZmxhZywgZmlsZSBrbXNfZmxpcC5jOjI3
MToKPj4gKGttc19mbGlwOjkzNSkgQ1JJVElDQUw6IEZhaWxlZCBhc3NlcnRpb246ICEoKnYgJiBm
bGFnKQo+PiAoa21zX2ZsaXA6OTM1KSBDUklUSUNBTDogTGFzdCBlcnJubzogMjUsIEluYXBwcm9w
cmlhdGUgaW9jdGwgZm9yIGRldmljZQo+Pgo+PiBJbnN0ZWFkIG9mIGEgbW9yZSBkZXNjcmlwdGl2
ZSBhc3NlcnRpb24gZXJyb3IsIGNsZWFyIHRoZSByZXF1ZXN0IGZvcgo+PiBldmVudCB0byBmaXgg
dGhpcy4KPj4KPj4gVGhpcyB3aWxsIGNoYW5nZSB0aGUgZXJyb3IgcmVwb3J0ZWQgaW4gYnVnICMx
MDMyNTcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4+IFJlZmVyZW5jZXM6IGh0dHBzOi8vYnVncy5mcmVl
ZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwMzI1Nwo+PiAtLS0KPj4gIHRlc3RzL2ttc19m
bGlwLmMgfCA2ICsrKy0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mbGlwLmMgYi90ZXN0cy9r
bXNfZmxpcC5jCj4+IGluZGV4IGU1MGM5MWVhZDEyYy4uZjhmMzU4MWVlZDJiIDEwMDc1NQo+PiAt
LS0gYS90ZXN0cy9rbXNfZmxpcC5jCj4+ICsrKyBiL3Rlc3RzL2ttc19mbGlwLmMKPj4gQEAgLTY5
Miw3ICs2OTIsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IHJ1bl90ZXN0X3N0ZXAoc3RydWN0IHRl
c3Rfb3V0cHV0ICpvKQo+PiAgICAgICAgIH0KPj4gIAo+PiAgICAgICAgIGlmIChkb19mbGlwICYm
IChvLT5mbGFncyAmIFRFU1RfRUlOVkFMKSAmJiBvLT5mbGlwX3N0YXRlLmNvdW50ID4gMCkKPj4g
LSAgICAgICAgICAgICAgIGlndF9hc3NlcnQoZG9fcGFnZV9mbGlwKG8sIG5ld19mYl9pZCwgdHJ1
ZSkgPT0gZXhwZWN0ZWRfZWludmFsKTsKPj4gKyAgICAgICAgICAgICAgIGlndF9hc3NlcnQoZG9f
cGFnZV9mbGlwKG8sIG5ld19mYl9pZCwgZmFsc2UpID09IGV4cGVjdGVkX2VpbnZhbCk7Cj4gSWYg
eW91IGhhdmUgYW4gZXhwZWN0ZWQgdmFsdWUsIHVzZSBpZ3RfYXNzZXJ0X2VxKCkgdG8gcHJpbnQg
d2hhdCB3YXMKPiByZXR1cm5lZCBpbnN0ZWFkLgo+IC1DaHJpcwoKci1iIHdpdGggdGhhdCBmaXhl
ZD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
