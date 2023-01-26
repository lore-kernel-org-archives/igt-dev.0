Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from CO1PR02CU002-vft-obe.outbound.protection.outlook.com
 (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3C989EAE
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jan 2023 19:11:21 +0000 (UTC)
From: Zack Rusin <zackr@vmware.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Date: Thu, 26 Jan 2023 19:11:18 +0000
Message-ID: <3ea9b093fc7ff70788c035a74f065c1b6075c478.camel@vmware.com>
References: <20221129172718.151773-1-zack@kde.org>
 <20221129172718.151773-4-zack@kde.org>
 <20230126181733.5lgq2rq43gqy5qd2@kamilkon-desk1>
In-Reply-To: <20230126181733.5lgq2rq43gqy5qd2@kamilkon-desk1>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9582DAAA6C29FA4CA790ED3355E60EE5@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] igt: Switch warning to an info when
 not using i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Martin Krastev <krastevm@vmware.com>, Michael Banack <banackm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTAxLTI2IGF0IDE5OjE3ICswMTAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+ICEhIEV4dGVybmFsIEVtYWlsDQo+IA0KPiBIaSBaYWNrLA0KPiANCj4gT24gMjAyMi0xMS0y
OSBhdCAxMjoyNzoxOCAtMDUwMCwgWmFjayBSdXNpbiB3cm90ZToNCj4gPiBGcm9tOiBaYWNrIFJ1
c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPiA+IA0KPiA+IEJlY2F1c2UgaWd0IGFsd2F5cyB0cmll
cyB0byBsb2FkIGk5MTUgZHJpdmVyIGZpcnN0IGZvciBEUklWRVJfQU5ZIGV2ZXJ5DQo+ID4gdGVz
dCB1c2luZyBEUklWRVJfQU5ZIG9uIGFueXRoaW5nIGJ1dCBpOTE1IHN0YXJ0cyBieSBwcmludGlu
ZyBhIHdhcm5pbmcNCj4gPiB0aGF0IGk5MTUgY291bGRuJ3QgYmUgbG9hZGVkLg0KPiA+IExldHMg
c3dpdGNoIGl0IHRvIGEgZ2VuZXJhbCBpbmZvIGxpbmUgYmVjYXVzZSBpdCBtYWtlcyBpdCBoYXJk
IHRvIHNwb3QNCj4gPiBhY3R1YWwgd2FybmluZ3Mgd2hlbiBldmVyeSBzdWJ0ZXN0IHN0YXJ0cyBi
eSB3YXJuaW5nIGFib3V0IG5vdCBiZWluZw0KPiA+IGFibGUgdG8gbG9hZCBpOTE1Lg0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQo+ID4gLS0t
DQo+ID4gwqBsaWIvaWd0X2ttb2QuYyB8IDIgKy0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9saWIvaWd0
X2ttb2QuYyBiL2xpYi9pZ3Rfa21vZC5jDQo+ID4gaW5kZXggYmNmN2RmZWIuLjc0OTI0YjVmIDEw
MDY0NA0KPiA+IC0tLSBhL2xpYi9pZ3Rfa21vZC5jDQo+ID4gKysrIGIvbGliL2lndF9rbW9kLmMN
Cj4gPiBAQCAtMzg5LDcgKzM4OSw3IEBAIGlndF9pOTE1X2RyaXZlcl9sb2FkKGNvbnN0IGNoYXIg
Km9wdHMpDQo+IA0KPiBUaGlzIGlzIGk5MTUgZHJpdmVyIGxvYWQgc28gbWF5YmUgd2Ugc2hvdWxk
IGZpbmQgYSB3YXkgdG8gbm90DQo+IGNhbGwgdGhpcyBmdW5jdGlvbiA/DQoNClRoYXQnZCBiZSBm
aW5lLCBob3cgd291bGQgeW91IGRvIHRoYXQ/IElHVCBoYXMgYSBudW1iZXIgb2YgdGVzdHMgKHRo
ZSBjb3JlIG9uZXMpDQp0aGF0IHVzZSBEUklWRVJfQU5ZIGZvciBsb2FkIHRoZSBmaXJzdCBhdmFp
bGFibGUgZHJpdmVyLiBVbmxlc3Mgd2UgZXhwbGljaXRseQ0KZXhjbHVkZSBpOTE1IGZyb20gcnVu
bmluZyB0aG9zZSB0ZXN0cywgb3IgcmVvcmRlciB0aGUgZW51bSB0byB0cnkgaTkxNSBhZnRlciBh
bGwgdGhlDQpvdGhlciBvcHRpb25zIHRoZW4gaXQncyBub3QgYSB0cml2aWFsIGZpeC4gV2UnZCBu
ZWVkIHRvIGRvIGFkZCBwcm9wZXIgcGNpIGRldmljZSBpZA0KbWF0Y2hpbmcgdG8gYWx3YXlzIHVz
ZSB0aGUgY29ycmVjdCBkcml2ZXIsIHdoaWNoIHdvdWxkIGJlIGdyZWF0LCBidXQgaXMgcHJvYmFi
bHkgYQ0KbGl0dGxlIG91dCBvZiBzY29wZSBmb3IgdGhpcyBjaGFuZ2UuDQoNCnoNCg0K
