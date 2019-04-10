Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA34897EE
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 15:52:18 +0000 (UTC)
References: <20190410111931.28305-1-maarten.lankhorst@linux.intel.com>
 <20190410111931.28305-3-maarten.lankhorst@linux.intel.com>
 <155489546967.3516.16665785841642844899@skylake-alporthouse-com>
 <07e03cad-ca38-ba6c-17e1-a9b35ee57bba@linux.intel.com>
 <155490064091.3516.13220204429939408781@skylake-alporthouse-com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <8cd7b1ae-dd93-2f3f-ac78-c3de950d00dc@linux.intel.com>
Date: Wed, 10 Apr 2019 17:52:14 +0200
MIME-Version: 1.0
In-Reply-To: <155490064091.3516.13220204429939408781@skylake-alporthouse-com>
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

T3AgMTAtMDQtMjAxOSBvbSAxNDo1MCBzY2hyZWVmIENocmlzIFdpbHNvbjoKPiBRdW90aW5nIE1h
YXJ0ZW4gTGFua2hvcnN0ICgyMDE5LTA0LTEwIDEzOjQ0OjIzKQo+PiBPcCAxMC0wNC0yMDE5IG9t
IDEzOjI0IHNjaHJlZWYgQ2hyaXMgV2lsc29uOgo+Pj4gUXVvdGluZyBNYWFydGVuIExhbmtob3Jz
dCAoMjAxOS0wNC0xMCAxMjoxOTozMSkKPj4+PiBJZiB3ZSB1bmV4cGVjdGVkbHkgcGFzcywgd2Ug
Z2V0IGEgY3J5cHRpYwo+Pj4+IChrbXNfZmxpcDo5MzUpIENSSVRJQ0FMOiBUZXN0IGFzc2VydGlv
biBmYWlsdXJlIGZ1bmN0aW9uIHNldF9mbGFnLCBmaWxlIGttc19mbGlwLmM6MjcxOgo+Pj4+IChr
bXNfZmxpcDo5MzUpIENSSVRJQ0FMOiBGYWlsZWQgYXNzZXJ0aW9uOiAhKCp2ICYgZmxhZykKPj4+
PiAoa21zX2ZsaXA6OTM1KSBDUklUSUNBTDogTGFzdCBlcnJubzogMjUsIEluYXBwcm9wcmlhdGUg
aW9jdGwgZm9yIGRldmljZQo+Pj4+Cj4+Pj4gSW5zdGVhZCBvZiBhIG1vcmUgZGVzY3JpcHRpdmUg
YXNzZXJ0aW9uIGVycm9yLCBjbGVhciB0aGUgcmVxdWVzdCBmb3IKPj4+PiBldmVudCB0byBmaXgg
dGhpcy4KPj4+Pgo+Pj4+IFRoaXMgd2lsbCBjaGFuZ2UgdGhlIGVycm9yIHJlcG9ydGVkIGluIGJ1
ZyAjMTAzMjU3Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1h
YXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPj4+PiBSZWZlcmVuY2VzOiBodHRwczov
L2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDMyNTcKPj4+PiAtLS0KPj4+
PiAgdGVzdHMva21zX2ZsaXAuYyB8IDYgKysrLS0tCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zX2ZsaXAuYyBiL3Rlc3RzL2ttc19mbGlwLmMKPj4+PiBpbmRleCBlNTBjOTFlYWQxMmMuLmY4
ZjM1ODFlZWQyYiAxMDA3NTUKPj4+PiAtLS0gYS90ZXN0cy9rbXNfZmxpcC5jCj4+Pj4gKysrIGIv
dGVzdHMva21zX2ZsaXAuYwo+Pj4+IEBAIC02OTIsNyArNjkyLDcgQEAgc3RhdGljIHVuc2lnbmVk
IGludCBydW5fdGVzdF9zdGVwKHN0cnVjdCB0ZXN0X291dHB1dCAqbykKPj4+PiAgICAgICAgIH0K
Pj4+PiAgCj4+Pj4gICAgICAgICBpZiAoZG9fZmxpcCAmJiAoby0+ZmxhZ3MgJiBURVNUX0VJTlZB
TCkgJiYgby0+ZmxpcF9zdGF0ZS5jb3VudCA+IDApCj4+Pj4gLSAgICAgICAgICAgICAgIGlndF9h
c3NlcnQoZG9fcGFnZV9mbGlwKG8sIG5ld19mYl9pZCwgdHJ1ZSkgPT0gZXhwZWN0ZWRfZWludmFs
KTsKPj4+PiArICAgICAgICAgICAgICAgaWd0X2Fzc2VydChkb19wYWdlX2ZsaXAobywgbmV3X2Zi
X2lkLCBmYWxzZSkgPT0gZXhwZWN0ZWRfZWludmFsKTsKPj4+IElmIHlvdSBoYXZlIGFuIGV4cGVj
dGVkIHZhbHVlLCB1c2UgaWd0X2Fzc2VydF9lcSgpIHRvIHByaW50IHdoYXQgd2FzCj4+PiByZXR1
cm5lZCBpbnN0ZWFkLgo+Pj4gLUNocmlzCj4+IHItYiB3aXRoIHRoYXQgZml4ZWQ/Cj4gU3VyZS4K
PiBSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4g
Zm9yIGFsbCAzLCB0aGUgb3RoZXIgMiBsb29rZWQgaGFybWxlc3MgYW5kIHNlbnNpYmxlLgo+IC1D
aHJpcwoKVGhhbmtzLCBwdXNoZWQuIDopCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
