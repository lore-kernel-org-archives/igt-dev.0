Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32B910E1B1
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 16:42:54 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Date: Mon, 11 Sep 2023 16:42:49 +0000
Message-ID: <cec02447c393313f14a5c3d335af2a94ab4a027b.camel@intel.com>
References: <20230825183759.1762528-1-alan.previn.teres.alexis@intel.com>
 <20230828112309.pgkge7axxoeqhafy@kamilkon-desk.igk.intel.com>
In-Reply-To: <20230828112309.pgkge7axxoeqhafy@kamilkon-desk.igk.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9A6C70820F5C54B951F9B7DE8093BF3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/i915: Add a helper to read mmio
 registers via ioctl
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgS2FtaWwsDQoNCkFwb2xvZ2llcyBmb3IgdGhlIHRhcmR5IHJlc3BvbnNlLg0KVGhhbmtzIGFn
YWluIGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gcmV2aWV3Lg0KSSB3aWxsIGZpeCBldmVyeXRoaW5n
IGJlbG93IGFzIHBlciB5b3VyIHJlY29tbWVuZGF0aW9uLg0KbWlnaHQgbmVlZCBzb21lIHRyaXZp
YWwgbW9kcyB0byBjYWxsZXJzLg0KDQphbGFuOnNuaXANCg0KSSBkbyB3YW5uYSBleHBsYWluIHRo
ZSBiZWxvdyBodW5rIHNwZWNpZmljYWxseSB0aG91Z2gsIGJ1dCBpIHByZWZlciB5b3VyIHJlY29t
bWVuZGF0aW9uOg0KT24gb25lIG9mIG15IGZpcnN0IHVwc3RyZWFtIHBhdGNoIHJldmlld3MsIGkg
d2FzIGFza2VkIHRvIHJlLWFycmFuZ2UgdGhlIGhlYWRlcnMgb2YgYSBodW5rDQp0byBiZSBhbHBo
YWJldGljYWwgZXZlbnRob3VnaCBteSBjaGFuZ2Ugd2FzIGp1c3QgYWRkaW5nIDEgaGVhZGVyLg0K
SSdsbCBmaXggYmVsb3cgdG8gYWRkIGp1c3QgdGhlIG5lZWRlZC4gOikNCg0KPiA+IC0tLSBhL3Rv
b2xzL2k5MTUtcGVyZi9pOTE1X3BlcmZfcmVjb3JkZXIuYw0KPiA+ICsrKyBiL3Rvb2xzL2k5MTUt
cGVyZi9pOTE1X3BlcmZfcmVjb3JkZXIuYw0KPiA+IEBAIC00NCwxNCArNDQsMTUgQEANCj4gPiAg
DQo+ID4gICNpbmNsdWRlIDxpOTE1X2RybS5oPg0KPiA+ICANCj4gPiAtI2luY2x1ZGUgImk5MTUv
aTkxNV9kcm1fbG9jYWwuaCINCj4gPiAtDQo+ID4gKyNpbmNsdWRlICJpOTE1X3BlcmZfcmVjb3Jk
ZXJfY29tbWFuZHMuaCINCj4gDQo+IFdoeSBkbyB5b3UgdG91Y2ggdW5yZWxhdGVkIGhlYWRlcnM/
DQo+IA0KPiA+ICAjaW5jbHVkZSAiaWd0X2NvcmUuaCINCj4gPiAgI2luY2x1ZGUgImludGVsX2No
aXBzZXQuaCINCj4gPiArDQo+ID4gKyNpbmNsdWRlICJpOTE1L2k5MTVfZHJtX2xvY2FsLmgiDQo+
ID4gICNpbmNsdWRlICJpOTE1L3BlcmYuaCINCj4gPiAgI2luY2x1ZGUgImk5MTUvcGVyZl9kYXRh
LmgiDQo+ID4gIA0KPiA+IC0jaW5jbHVkZSAiaTkxNV9wZXJmX3JlY29yZGVyX2NvbW1hbmRzLmgi
DQo+ID4gKyNpbmNsdWRlICJsaWIvaW50ZWxfcmVnLmgiDQo+IC0tLS0tLS0tLS0tLSBeXl5eXl5e
Xl5eXl5eXl4NCj4gWW91IG5lZWQgb25seSB0aGlzIGhlcmUuDQoNCg0K
