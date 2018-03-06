Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615B56E64C
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Mar 2018 10:39:07 +0000 (UTC)
From: "Lofstedt, Marta" <marta.lofstedt@intel.com>
Date: Tue, 6 Mar 2018 10:39:04 +0000
Message-ID: <CA5F6A4B62957246A95956419746064382B453BC@IRSMSX106.ger.corp.intel.com>
References: <20180306092457.25550-1-marta.lofstedt@intel.com>
 <152032872712.17960.5379830358967088465@mail.alporthouse.com>
In-Reply-To: <152032872712.17960.5379830358967088465@mail.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] igt/kms_frontbuffer_tracking: Skip
 tests if FBC was disabled
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXMgV2lsc29uIFtt
YWlsdG86Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrXQ0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCA2
LCAyMDE4IDExOjMyIEFNDQo+IFRvOiBMb2ZzdGVkdCwgTWFydGEgPG1hcnRhLmxvZnN0ZWR0QGlu
dGVsLmNvbT47IGlndC0NCj4gZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW2lndC1kZXZdIFtQQVRDSCBpLWctdF0gaWd0L2ttc19mcm9udGJ1ZmZlcl90cmFja2luZzog
U2tpcCB0ZXN0cyBpZg0KPiBGQkMgd2FzIGRpc2FibGVkDQo+IA0KPiBRdW90aW5nIE1hcnRhIExv
ZnN0ZWR0ICgyMDE4LTAzLTA2IDA5OjI0OjU3KQ0KPiA+IElmIEZCQyBoYXMgYmVlbiBkaXNhYmxl
ZCBpbiB0aGUgc3lzdGVtIGR1ZSB0byBwcmV2aW91cyBtYWxmdWN0aW9uLCB3ZQ0KPiA+IHdvdWxk
IHNhdmUgdGltZSBvbiBDSSBpZiB3ZSBiYWlsIG91dCBlYXJseS4NCj4gPg0KPiA+IEJ1Z3ppbGxh
OiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDUzNTkNCj4g
PiBTaWduZWQtb2ZmLWJ5OiBNYXJ0YSBMb2ZzdGVkdCA8bWFydGEubG9mc3RlZHRAaW50ZWwuY29t
Pg0KPiANCj4gSG1tLCBGQkMgc3RhcnRzIGluYWN0aXZlIG9uIGEgc3lzdGVtLCBzbyB3ZSB3b3Vs
ZCBuZWVkIHRvIGVuc3VyZSB0aGF0IHdlDQo+IGVuYWJsZWQgRkJDIGFuZCBkaWQgYSBwcm9wZXIg
bW9kZXNldCBmaXJzdCBhbmQgd2FpdCBmb3IgRkJDIHRvIGJlIGVuYWJsZWQNCj4gZmlyc3QuDQoN
Ck9uIHRoZSBTS0wgTlVDaTUgc3lzdGVtIEkgaGF2ZSBiZWVuIHJ1bm5pbmcgdGhpcyBvbiwgdGhl
IEZCQyBkaXNhYmxlZCBzeXNmcywgaXNuJ3QgcmUtc2V0IGFmdGVyIGEgbW9kZXNldC4gTWF5YmUg
dGhpcyBpcyBhIGRyaXZlciBlcnJvciB0aGF0IHNob3VsZCBub3QgYmUgaGlkZGVuIGJ5IG1lIHN1
Z2dlc3RpbmcgdG8gc2tpcCB0aGUgdGVzdHMuIA0KDQpPbiB0aGUgb3RoZXIgaGFuZCwgdGhlIGtt
c19mcm9udGJ1ZmZlcl90cmFja2luZyB0ZXN0IHNob3VsZCBnaXZlIGRpZmZlcmVudCByZXN1bHRz
IGlmIEZCQyBpcyBkaXNhYmxlZCBjb21wYXJlZCB0byB0aW1lb3V0IGluIHRoZSBmYmNfd2FpdF91
bnRpbF9lbmFibGVkKCkgd2hpY2ggdXAgdW50aWwgc29tZSB0aW1lIGFnbyB3YXMgdGhlIG1vc3Qg
Y29tbW9uIHdheSB0byBmYWlsIHRoaXMgdGVzdC4gDQoNCj4gDQo+IE90aGVyd2lzZSwgaXQgc2Vl
bXMgdmVyeSByZWFzb25hYmxlIHRoYXQgaW4gdGhpcyB0ZXN0IHdlIGFzc3VtZSB0aGF0IEZCQw0K
PiB3b3JrcyBiZWZvcmUgd2UgYmVnaW4uIFdlIHNob3VsZCBoYXZlIG90aGVyIHRlc3RzIHRoYXQg
Y2hlY2sgdGhhdCBGQkMNCj4gd29ya3MgdW5kZXIgdmFyaW91cyBkaWZmZXJlbnQgY29uZmlndXJh
dGlvbnMsIGhlcmUgd2UgYXJlIGNoZWNraW5nIHRoYXQgdGhlDQo+IGludmFsaWRhdGUvZmx1c2gg
ZG8gdGhlaXIgam9icy4NCj4gLUNocmlzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
