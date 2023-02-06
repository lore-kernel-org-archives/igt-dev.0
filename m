Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC07E10E16B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Feb 2023 08:13:04 +0000 (UTC)
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 6 Feb 2023 08:12:40 +0000
Message-ID: <fa9a1e7f9c3ef25ee417a912d294f796e20ef00a.camel@intel.com>
References: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <44DB3A34695DEE4999D2F0580309A6C4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 01/10] tools/intel_watermark: Add
 missing intel_register_access_fini() for skl+
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTAxLTI1IGF0IDA2OjU1ICswMjAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiANCj4gVGhlIHNrbCsgY29kZSBmb3Jnb3QgdG8gY2FsbCBpbnRlbF9yZWdpc3Rlcl9hY2Nlc3Nf
ZmluaSgpLiBNYWtlDQo+IGl0IGRvIHNvLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFZp
bm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0KDQo+IC0t
LQ0KPiDCoHRvb2xzL2ludGVsX3dhdGVybWFyay5jIHwgMiArKw0KPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9pbnRlbF93YXRlcm1h
cmsuYyBiL3Rvb2xzL2ludGVsX3dhdGVybWFyay5jDQo+IGluZGV4IDFlMjM1ZWQzMGE2My4uMTgx
OGQ3OWQwYmVlIDEwMDY0NA0KPiAtLS0gYS90b29scy9pbnRlbF93YXRlcm1hcmsuYw0KPiArKysg
Yi90b29scy9pbnRlbF93YXRlcm1hcmsuYw0KPiBAQCAtNTkwLDYgKzU5MCw4IEBAIHN0YXRpYyB2
b2lkIHNrbF93bV9kdW1wKHZvaWQpDQo+IMKgwqDCoMKgwqDCoMKgwqBwcmludGYoIlxuIik7DQo+
IMKgwqDCoMKgwqDCoMKgwqAvKiBjbGVhciB0aGUgc3RpY2t5IGJpdHMgKi8NCj4gwqDCoMKgwqDC
oMKgwqDCoHdyaXRlX3JlZygweDQ1MjgwLCB3bV9kYmcpOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDC
oGludGVsX3JlZ2lzdGVyX2FjY2Vzc19maW5pKCZtbWlvX2RhdGEpOw0KPiDCoH0NCj4gwqANCj4g
wqBzdGF0aWMgdm9pZCBpbGtfd21fZHVtcCh2b2lkKQ0KDQo=
