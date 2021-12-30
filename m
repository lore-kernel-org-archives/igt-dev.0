Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3B610E258
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Dec 2021 04:29:04 +0000 (UTC)
From: "Ye, Tony" <tony.ye@intel.com>
Date: Thu, 30 Dec 2021 04:29:00 +0000
Message-ID: <5AE2EA4F-8FBC-4692-9FE2-08D12500BE94@intel.com>
References: <20211230020914.3753273-1-mastanx.katragadda@intel.com>
In-Reply-To: <20211230020914.3753273-1-mastanx.katragadda@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/i915/gem_media_vme : skip on no media
 Samplers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Katragadda, MastanX" <mastanx.katragadda@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DQoNCj4g5ZyoIDIwMjHlubQxMuaciDMw5pel77yM5LiK5Y2IMTA6MDjvvIxNYXN0YW4gS2F0cmFn
YWRkYSA8bWFzdGFueC5rYXRyYWdhZGRhQGludGVsLmNvbT4g5YaZ6YGT77yaDQo+IA0KPiDvu79N
ZWRpYSBzYW1wbGVycyBhcmUgbm90IHByZXNlbnQgb24gc29tZSBvZiBHZW4xMSBwbGF0Zm9ybXMg
YWRkaW5nDQo+IHNraXAgb24gRUhMIGFuZCBKU0wgYXMgcGVyIEJzcGVjLg0KPiANCj4gQnNwZWM6
MjkxNTENCj4gDQo+IENoYW5nZXMgc2luY2UgVjEgOg0KPiAgICAgICAgTW92ZWQgdGhpcyBza2lw
IGNoZWNrIHRvIGlndF9nZXRfbWVkaWFfdm1lX2Z1bmMuW1RvbnkgWWVdDQo+IA0KPiBDQzogVG9u
eSBZZSA8dG9ueS55ZUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE1hc3RhbiBLYXRyYWdh
ZGRhIDxtYXN0YW54LmthdHJhZ2FkZGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gbGliL2ludGVsX2Jh
dGNoYnVmZmVyLmMgfCAzICsrLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMg
Yi9saWIvaW50ZWxfYmF0Y2hidWZmZXIuYw0KPiBpbmRleCA2ZmM4MTQwMC4uMTBkOGE2ZTAgMTAw
NjQ0DQo+IC0tLSBhL2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5jDQo+ICsrKyBiL2xpYi9pbnRlbF9i
YXRjaGJ1ZmZlci5jDQo+IEBAIC0xMTg3LDggKzExODcsOSBAQCBpZ3RfZmlsbGZ1bmNfdCBpZ3Rf
Z2V0X21lZGlhX2ZpbGxmdW5jKGludCBkZXZpZCkNCj4gaWd0X3ZtZV9mdW5jX3QgaWd0X2dldF9t
ZWRpYV92bWVfZnVuYyhpbnQgZGV2aWQpDQo+IHsNCj4gICAgaWd0X3ZtZV9mdW5jX3QgZmlsbCA9
IE5VTEw7DQo+ICsgICAgY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvICpkZXZpbmZvID0g
aW50ZWxfZ2V0X2RldmljZV9pbmZvKGRldmlkKTsNCj4gDQo+IC0gICAgaWYgKElTX0dFTjExKGRl
dmlkKSkNCj4gKyAgICBpZiAoSVNfR0VOMTEoZGV2aWQpICYmICFkZXZpbmZvLT5pc19lbGtoYXJ0
bGFrZSAmJiAhZGV2aW5mby0+aXNfamFzcGVybGFrZSkNCj4gICAgICAgIGZpbGwgPSBnZW4xMV9t
ZWRpYV92bWVfZnVuYzsNCg0KUmV2aWV3ZWQtYnk6IFRvbnkgWWUgPHRvbnkueWVAaW50ZWwuY29t
Pg0KDQpSZWdhcmRzLA0KVG9ueQ0KDQo+IA0KPiAgICByZXR1cm4gZmlsbDsNCj4gLS0gDQo+IDIu
MjUuMQ0KPiANCg==
