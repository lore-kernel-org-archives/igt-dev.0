Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F92310E632
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Aug 2023 23:48:35 +0000 (UTC)
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 30 Aug 2023 23:48:29 +0000
Message-ID: <SJ2PR11MB77158DFD848475DC3051005BF8E6A@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-4-lucas.demarchi@intel.com>
In-Reply-To: <20230829141107.1505705-4-lucas.demarchi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH igt 3/4] lib/intel_device_info: Add blitter
 cmd info for Lunar Lake
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFudXNoYSBTcml2YXRzYSA8YW51c2hhLnNyaXZhdHNhQGludGVsLmNvbT4N
Cg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGlndC1kZXYgPGlndC1k
ZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBMdWNhcyBEZQ0K
PiBNYXJjaGkNCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDI5LCAyMDIzIDc6MTEgQU0NCj4gVG86
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBEZSBNYXJjaGksIEx1Y2FzIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IFN1YmplY3Q6IFtpZ3QtZGV2XSBbUEFUQ0ggaWd0IDMvNF0gbGliL2ludGVsX2Rldmlj
ZV9pbmZvOiBBZGQgYmxpdHRlciBjbWQgaW5mbyBmb3INCj4gTHVuYXIgTGFrZQ0KPiANCj4gRnJv
bTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+
DQo+IA0KPiBBZGQgc2VwYXJhdGUgY21kIGluZm8gZm9yIEx1bmFyTGFrZS4gVGhpcyByZS11c2Vz
IHRoZSBjb21tYW5kcyBmb3IgUFZDIHNpbmNlIGFsbA0KPiB0aGUgY29tbWFuZHMgYmVpbmcgdXNl
ZCBpbiBJR1QgbWF0Y2ggdGhlIG9uZXMgZm9yIFBWQy4NCj4gDQo+IENjOiBTd2F0aSBTaGFybWEg
PHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1w
Y3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAg
bGliL2ludGVsX2RldmljZV9pbmZvLmMgfCAzICsrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9k
ZXZpY2VfaW5mby5jIGIvbGliL2ludGVsX2RldmljZV9pbmZvLmMgaW5kZXgNCj4gODZhOGIzNjUw
Li5kMWMyNjg0ODIgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5jDQo+ICsr
KyBiL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5jDQo+IEBAIC01MTEsNyArNTExLDggQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbyBpbnRlbF9sdW5hcmxha2VfaW5mbw0KPiA9
IHsNCj4gIAkuaGFzXzR0aWxlID0gdHJ1ZSwNCj4gIAkuaGFzX2dtZGlkID0gdHJ1ZSwNCj4gIAku
aXNfbHVuYXJsYWtlID0gdHJ1ZSwNCj4gLQkuY29kZW5hbWUgPSAibHVuYXJsYWtlIg0KPiArCS5j
b2RlbmFtZSA9ICJsdW5hcmxha2UiLA0KPiArCS5jbWRzX2luZm8gPSAmZ2VuMTJfcHZjX2NtZHNf
aW5mbywNCj4gIH07DQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfaWRfbWF0Y2ggaW50
ZWxfZGV2aWNlX21hdGNoW10gPSB7DQo+IC0tDQo+IDIuNDAuMQ0KDQo=
