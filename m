Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D366E10B
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2020 18:27:44 +0000 (UTC)
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Date: Mon, 13 Apr 2020 18:27:42 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663FFFE2240@FMSMSX108.amr.corp.intel.com>
References: <20200413182525.1581-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200413182525.1581-1-ashutosh.dixit@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] igt/gem_shrink: Fix reversed logic when
 mmap fails
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRGl4aXQsIEFzaHV0b3NoIDxhc2h1
dG9zaC5kaXhpdEBpbnRlbC5jb20+DQo+U2VudDogTW9uZGF5LCBBcHJpbCAxMywgMjAyMCAyOjI1
IFBNDQo+VG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Q2M6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPjsgUnVobCwgTWljaGFlbCBKDQo+PG1pY2hhZWwu
ai5ydWhsQGludGVsLmNvbT4NCj5TdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIGlndC9nZW1fc2hyaW5r
OiBGaXggcmV2ZXJzZWQgbG9naWMgd2hlbiBtbWFwIGZhaWxzDQo+DQo+Q2FuJ3QgdG91Y2ggdGhl
IG1lbW9yeSBpZiBtbWFwIHJldHVybnMgTUFQX0ZBSUxFRC4NCj4NCj52Mjogcy8oY2hhciAqKS0x
KS9NQVBfRkFJTEVELyAoTWlrZSBSdWhsKQ0KDQrwn5iKDQoNClJldmlld2VkLWJ5OiBNaWNoYWVs
IEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCg0KPkZpeGVzOiA5Y2ZmM2JlMTI3
KCJpZ3QvZ2VtX3NocmluazogUmVkdWNlIG9vbSBzcGFtIikNCj5TaWduZWQtb2ZmLWJ5OiBBc2h1
dG9zaCBEaXhpdCA8YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPg0KPi0tLQ0KPiB0ZXN0cy9pOTE1
L2dlbV9zaHJpbmsuYyB8IDIgKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX3Nocmluay5jIGIv
dGVzdHMvaTkxNS9nZW1fc2hyaW5rLmMNCj5pbmRleCAxMWFhOWVmYzEuLmU0MzQ2MTNlYiAxMDA2
NDQNCj4tLS0gYS90ZXN0cy9pOTE1L2dlbV9zaHJpbmsuYw0KPisrKyBiL3Rlc3RzL2k5MTUvZ2Vt
X3Nocmluay5jDQo+QEAgLTI3NCw3ICsyNzQsNyBAQCBzdGF0aWMgdm9pZCBsZWFrKGludCBmZCwg
dWludDY0X3QgYWxsb2MpDQo+IAlwdHIgPSBtbWFwKE5VTEwsIGFsbG9jLCBQUk9UX1JFQUQgfCBQ
Uk9UX1dSSVRFLA0KPiAJCSAgIE1BUF9BTk9OIHwgTUFQX1BSSVZBVEUgfCBNQVBfUE9QVUxBVEUs
DQo+IAkJICAgLTEsIDApOw0KPi0JaWYgKHB0ciAhPSAoY2hhciAqKS0xKQ0KPisJaWYgKHB0ciA9
PSBNQVBfRkFJTEVEKQ0KPiAJCXJldHVybjsNCj4NCj4gCXdoaWxlIChhbGxvYykgew0KPi0tDQo+
Mi4yNi4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
