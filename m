Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEF06E3FC
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2019 12:33:38 +0000 (UTC)
Date: Thu, 20 Jun 2019 15:33:36 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190620123336.GG22949@platvala-desk.ger.corp.intel.com>
References: <20190620122902.20761-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620122902.20761-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] runner/executor: Make sure that
 intervals_left is always initialized
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMDM6Mjk6MDBQTSArMDMwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IGludGVydmFsc19sZWZ0IGdvdCBpbml0aWFsaXplZCBvbmx5IHdoZW4gd2hlbiB3
ZSBoYWQgYSB0aW1lb3V0IGV4Y2VlZGluZwo+IHdhdGNoZG9nIGNhcGFiaWxpdGllcywgbWVhbmlu
ZyB3ZSBoYWQgdG8gdXNlIG11bHRpcGxlIHNob3J0ZXIgaW50ZXJ2YWxzCj4gCj4gYnkgbW92aW5n
IGludGVydmFsc19sZWZ0ID0gdGltZW91dF9pbnRlcnZhbHMgZG93biB3ZSBhcmUgYWx3YXlzCj4g
aW5pdGlhbGl6aW5nIGl0Cj4gCj4gQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50
ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVy
QGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGlu
dGVsLmNvbT4KCgo+IC0tLQo+ICBydW5uZXIvZXhlY3V0b3IuYyB8IDMgKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
cnVubmVyL2V4ZWN1dG9yLmMgYi9ydW5uZXIvZXhlY3V0b3IuYwo+IGluZGV4IDdlNWZiZThmLi5i
Y2U0ZDQyMCAxMDA2NDQKPiAtLS0gYS9ydW5uZXIvZXhlY3V0b3IuYwo+ICsrKyBiL3J1bm5lci9l
eGVjdXRvci5jCj4gQEAgLTQ5Myw3ICs0OTMsNiBAQCBzdGF0aWMgaW50IG1vbml0b3Jfb3V0cHV0
KHBpZF90IGNoaWxkLAo+ICAJCQlpZiAod2RfdGltZW91dCAtIHdkX2V4dHJhIDwgMCkKPiAgCQkJ
CXdkX2V4dHJhID0gd2RfdGltZW91dCAvIDI7Cj4gIAkJCXRpbWVvdXRfaW50ZXJ2YWxzID0gdGlt
ZW91dCAvICh3ZF90aW1lb3V0IC0gd2RfZXh0cmEpOwo+IC0JCQlpbnRlcnZhbHNfbGVmdCA9IHRp
bWVvdXRfaW50ZXJ2YWxzOwo+ICAJCQl0aW1lb3V0IC89IHRpbWVvdXRfaW50ZXJ2YWxzOwo+ICAK
PiAgCQkJaWYgKHNldHRpbmdzLT5sb2dfbGV2ZWwgPj0gTE9HX0xFVkVMX1ZFUkJPU0UpIHsKPiBA
QCAtNTA0LDYgKzUwMyw4IEBAIHN0YXRpYyBpbnQgbW9uaXRvcl9vdXRwdXQocGlkX3QgY2hpbGQs
Cj4gIAkJfQo+ICAJfQo+ICAKPiArCWludGVydmFsc19sZWZ0ID0gdGltZW91dF9pbnRlcnZhbHM7
Cj4gKwo+ICAJd2hpbGUgKG91dGZkID49IDAgfHwgZXJyZmQgPj0gMCB8fCBzaWdmZCA+PSAwKSB7
Cj4gIAkJc3RydWN0IHRpbWV2YWwgdHYgPSB7IC50dl9zZWMgPSB0aW1lb3V0IH07Cj4gIAo+IC0t
IAo+IDIuMjEuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
