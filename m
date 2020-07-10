Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867786EC84
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2020 16:29:11 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 10 Jul 2020 16:29:06 +0000
Message-ID: <c5cebd9cbe572088c7e2357617014f1c427f0603.camel@intel.com>
References: <20200710140048.646121-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200710140048.646121-1-gwan-gyeong.mun@intel.com>
Content-Language: en-US
Content-ID: <16CD093476BA2248AFAB79E26855A69D@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr2_su: Add igt_assert when
 the failing of PSR2 enabling
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
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDIwLTA3LTEwIGF0IDE3OjAwICswMzAwLCBHd2FuLWd5ZW9uZyBNdW4gd3JvdGU6
DQo+IFRoZSBwc3JfcHJpbnRfZGVidWdmcygpIGZ1bmN0aW9uIHVzZXMgaWd0X2RlYnVnKCkgZm9y
IGxvZ2dpbmcuDQo+IEFzIGlndF9yZXF1aXJlKCkgZG9lcyBub3QgcmFpc2UgcHJpbnRpbmcgb3V0
IG9mIElHVF9MT0dfREVCVUcgbGV2ZWwuDQo+IEl0IGNoYW5nZXMgaWd0X2RlYnVnKCkgdG8gaWd0
X2Fzc2VydCgpIGZvciBnZXR0aW5nIGRlYnVnIGxvZyBvbg0KPiBza2lwcGluZyB0ZXN0IGNhc2Ug
b2Yga21zX3BzcjJfc3UuDQo+IA0KPiBDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5z
b3V6YUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEd3YW4tZ3llb25nIE11biA8Z3dhbi1n
eWVvbmcubXVuQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9rbXNfcHNyMl9zdS5jIHwgMiAr
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BzcjJfc3UuYyBiL3Rlc3RzL2ttc19wc3IyX3N1LmMN
Cj4gaW5kZXggZDU0OWQ5YTMuLmU4MjE5M2NiIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9rbXNfcHNy
Ml9zdS5jDQo+ICsrKyBiL3Rlc3RzL2ttc19wc3IyX3N1LmMNCj4gQEAgLTI2Myw3ICsyNjMsNyBA
QCBpZ3RfbWFpbg0KPiAgCQljbGVhbnVwKCZkYXRhKTsNCj4gIAkJaWYgKCFyKQ0KPiAgCQkJcHNy
X3ByaW50X2RlYnVnZnMoZGF0YS5kZWJ1Z2ZzX2ZkKTsNCj4gLQkJaWd0X3JlcXVpcmVfZihyLCAi
UFNSMiBjYW4gbm90IGJlIGVuYWJsZWRcbiIpOw0KPiArCQlpZ3RfYXNzZXJ0X2YociwgIlBTUjIg
Y2FuIG5vdCBiZSBlbmFibGVkXG4iKTsNCg0KVGhpcyB3aWxsIGNhdXNlIHRlc3RzIHRvIGZhaWwg
d2hlbiBQU1IyIGNhbiBub3QgYmUgZW5hYmxlZCBmb3IgcmlnaHQgcmVhc29ucywgd2h5IG5vdCBj
aGFuZ2UgdGhlIG1lc3NhZ2VzIGluIHBzcl9wcmludF9kZWJ1Z2ZzIHRvIGlndF9pbmZvPw0KDQo+
ICANCj4gIAkJLyogYmxvY2tpbmcgdGltZXJmZCAqLw0KPiAgCQlkYXRhLmNoYW5nZV9zY3JlZW5f
dGltZXJmZCA9IHRpbWVyZmRfY3JlYXRlKENMT0NLX01PTk9UT05JQywgMCk7DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
