Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E07289D61
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 01:06:16 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190321010015.1317-3-andi.shyti@intel.com>
References: <20190321010015.1317-1-andi.shyti@intel.com>
 <20190321010015.1317-3-andi.shyti@intel.com>
Message-ID: <155313034473.21108.4734216289926274316@skylake-alporthouse-com>
Date: Thu, 21 Mar 2019 01:05:49 +0000
Subject: Re: [igt-dev] [PATCH v14 2/5] lib: ioctl_wrappers: reach engines by
 index as well
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
To: Andi Shyti <andi.shyti@intel.com>, IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTAzLTIxIDAxOjAwOjEyKQo+IFdpdGggdGhlIG5ldyBl
bmdpbmUgcXVlcnkgbWV0aG9kIGVuZ2luZXMgYXJlIHJlYWNoYWJsZSB0aHJvdWdoCj4gYW4gaW5k
ZXggYW5kIGNvbnRleHQgdGhleSBhcmUgY29tYmluZWQgd2l0aC4KPiAKPiBUaGUgJ2dlbV9oYXNf
cmluZygpJyBiZWNvbWVzICdnZW1fY29udGV4dF9oYXNfZW5naW5lKCknIHRoYXQKPiByZXF1aXJl
cyB0aGUgaW5kZXggdGhhdCB0aGUgZW5naW5lIGlzIG1hcHBlZCB3aXRoaW4gdGhlIGRyaXZlci4K
PiBUaGUgZnVuY3Rpb24gaGFzIGJlZW4gbW92ZWQgZnJvbSBsaWIvaW9jdGxfd2FwcGVycyB0bwo+
IGxpYi9pOTE1L2dlbV9jb250ZXh0IHdoZXJlIGl0IGlzIG1vcmUgYXBwcm9wcmlhdGUuCj4gCj4g
VGhlIHByZXZpb3VzICdnZW1faGFzX3JpbmcoKScgZnVuY3Rpb24gYmVjb21lcyBhIHdyYXBwZXIg
dG8gdGhlCj4gbmV3ICdnZW1fY29udGV4dF9oYXNfZW5naW5lKCknLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAtLS0KPiAgbGliL2k5MTUvZ2Vt
X2NvbnRleHQuYyB8IDIxICsrKysrKysrKysrKysrKysrKysrKwo+ICBsaWIvaTkxNS9nZW1fY29u
dGV4dC5oIHwgIDIgKysKPiAgbGliL2lvY3RsX3dyYXBwZXJzLmMgICB8IDE5IC0tLS0tLS0tLS0t
LS0tLS0tLS0KPiAgbGliL2lvY3RsX3dyYXBwZXJzLmggICB8ICAzICsrLQo+ICA0IGZpbGVzIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9saWIvaTkxNS9nZW1fY29udGV4dC5jIGIvbGliL2k5MTUvZ2VtX2NvbnRleHQuYwo+IGluZGV4
IDE2MDA0Njg1ZTkyMC4uNWUyZTMxZTkxMzg0IDEwMDY0NAo+IC0tLSBhL2xpYi9pOTE1L2dlbV9j
b250ZXh0LmMKPiArKysgYi9saWIvaTkxNS9nZW1fY29udGV4dC5jCj4gQEAgLTI3NSwzICsyNzUs
MjQgQEAgdm9pZCBnZW1fY29udGV4dF9zZXRfcHJpb3JpdHkoaW50IGZkLCB1aW50MzJfdCBjdHhf
aWQsIGludCBwcmlvKQo+ICB7Cj4gICAgICAgICBpZ3RfYXNzZXJ0KF9fZ2VtX2NvbnRleHRfc2V0
X3ByaW9yaXR5KGZkLCBjdHhfaWQsIHByaW8pID09IDApOwo+ICB9Cj4gKwo+ICtib29sIGdlbV9j
b250ZXh0X2hhc19lbmdpbmUoaW50IGZkLCB1bnNpZ25lZCBlbmdpbmUsIHVuc2lnbmVkIGN0eCkK
Ckl0J3Mgc3RpbGwgQkFDS1dBUkRTISEhIQotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2
