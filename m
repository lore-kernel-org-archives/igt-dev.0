Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9C7895E7
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 12:50:45 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190410111931.28305-1-maarten.lankhorst@linux.intel.com>
 <20190410111931.28305-3-maarten.lankhorst@linux.intel.com>
 <155489546967.3516.16665785841642844899@skylake-alporthouse-com>
 <07e03cad-ca38-ba6c-17e1-a9b35ee57bba@linux.intel.com>
In-Reply-To: <07e03cad-ca38-ba6c-17e1-a9b35ee57bba@linux.intel.com>
Message-ID: <155490064091.3516.13220204429939408781@skylake-alporthouse-com>
Date: Wed, 10 Apr 2019 13:50:40 +0100
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNYWFydGVuIExhbmtob3JzdCAoMjAxOS0wNC0xMCAxMzo0NDoyMykKPiBPcCAxMC0w
NC0yMDE5IG9tIDEzOjI0IHNjaHJlZWYgQ2hyaXMgV2lsc29uOgo+ID4gUXVvdGluZyBNYWFydGVu
IExhbmtob3JzdCAoMjAxOS0wNC0xMCAxMjoxOTozMSkKPiA+PiBJZiB3ZSB1bmV4cGVjdGVkbHkg
cGFzcywgd2UgZ2V0IGEgY3J5cHRpYwo+ID4+IChrbXNfZmxpcDo5MzUpIENSSVRJQ0FMOiBUZXN0
IGFzc2VydGlvbiBmYWlsdXJlIGZ1bmN0aW9uIHNldF9mbGFnLCBmaWxlIGttc19mbGlwLmM6Mjcx
Ogo+ID4+IChrbXNfZmxpcDo5MzUpIENSSVRJQ0FMOiBGYWlsZWQgYXNzZXJ0aW9uOiAhKCp2ICYg
ZmxhZykKPiA+PiAoa21zX2ZsaXA6OTM1KSBDUklUSUNBTDogTGFzdCBlcnJubzogMjUsIEluYXBw
cm9wcmlhdGUgaW9jdGwgZm9yIGRldmljZQo+ID4+Cj4gPj4gSW5zdGVhZCBvZiBhIG1vcmUgZGVz
Y3JpcHRpdmUgYXNzZXJ0aW9uIGVycm9yLCBjbGVhciB0aGUgcmVxdWVzdCBmb3IKPiA+PiBldmVu
dCB0byBmaXggdGhpcy4KPiA+Pgo+ID4+IFRoaXMgd2lsbCBjaGFuZ2UgdGhlIGVycm9yIHJlcG9y
dGVkIGluIGJ1ZyAjMTAzMjU3Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5r
aG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+PiBSZWZlcmVuY2Vz
OiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDMyNTcKPiA+
PiAtLS0KPiA+PiAgdGVzdHMva21zX2ZsaXAuYyB8IDYgKysrLS0tCj4gPj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0
IGEvdGVzdHMva21zX2ZsaXAuYyBiL3Rlc3RzL2ttc19mbGlwLmMKPiA+PiBpbmRleCBlNTBjOTFl
YWQxMmMuLmY4ZjM1ODFlZWQyYiAxMDA3NTUKPiA+PiAtLS0gYS90ZXN0cy9rbXNfZmxpcC5jCj4g
Pj4gKysrIGIvdGVzdHMva21zX2ZsaXAuYwo+ID4+IEBAIC02OTIsNyArNjkyLDcgQEAgc3RhdGlj
IHVuc2lnbmVkIGludCBydW5fdGVzdF9zdGVwKHN0cnVjdCB0ZXN0X291dHB1dCAqbykKPiA+PiAg
ICAgICAgIH0KPiA+PiAgCj4gPj4gICAgICAgICBpZiAoZG9fZmxpcCAmJiAoby0+ZmxhZ3MgJiBU
RVNUX0VJTlZBTCkgJiYgby0+ZmxpcF9zdGF0ZS5jb3VudCA+IDApCj4gPj4gLSAgICAgICAgICAg
ICAgIGlndF9hc3NlcnQoZG9fcGFnZV9mbGlwKG8sIG5ld19mYl9pZCwgdHJ1ZSkgPT0gZXhwZWN0
ZWRfZWludmFsKTsKPiA+PiArICAgICAgICAgICAgICAgaWd0X2Fzc2VydChkb19wYWdlX2ZsaXAo
bywgbmV3X2ZiX2lkLCBmYWxzZSkgPT0gZXhwZWN0ZWRfZWludmFsKTsKPiA+IElmIHlvdSBoYXZl
IGFuIGV4cGVjdGVkIHZhbHVlLCB1c2UgaWd0X2Fzc2VydF9lcSgpIHRvIHByaW50IHdoYXQgd2Fz
Cj4gPiByZXR1cm5lZCBpbnN0ZWFkLgo+ID4gLUNocmlzCj4gCj4gci1iIHdpdGggdGhhdCBmaXhl
ZD8KClN1cmUuClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KZm9yIGFsbCAzLCB0aGUgb3RoZXIgMiBsb29rZWQgaGFybWxlc3MgYW5kIHNlbnNpYmxl
LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
