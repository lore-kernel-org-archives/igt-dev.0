Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6BFC54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 06:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC73A10E129;
	Thu, 29 Feb 2024 06:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXvowpIN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E912210E129
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 06:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709188598; x=1740724598;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1rLX8dsOqzr3DAIm77aZwlIDIZPkO3VW9SuVJ8wikA8=;
 b=YXvowpINL32j3j9mogufack0l7K9jJ5k5fji08Vl2pq1RLb9KjTeM1Iy
 hixPcECb2vgijT0pMyTteZOTLzWYfEo0bR6QY8MP0BgPpfAHPNCEdc6RY
 Nm4OnQ0YQ60AJFNqf+YBLUB1KRL4zFPDtH/UE69A+gYjuR2+/lkhszAdm
 q1lebFmMdezx9ok2NsKM/TGm2UQE0Gfnq/WDDRRq50J0nLRetDO0M6jbz
 pZ9CswQw4Nhn6GlarZqUt3Luc0E1flOXPMgetxycq0kykYjW4bP8FYi/8
 aftwVFtCE3iMimk9f1EulZdJkZKuVqJjwej6CnqfZIAojvgrPg0VzHn2o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="21095614"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="21095614"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 22:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="7750743"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 22:36:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 22:36:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 22:36:36 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 22:36:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDx57Lt3o+4xZYmEV5+W535lPlquvQ05iv2MIpxvW0Qs2K1XSBi6svba9dRnKI38XX7GVKfc6l1XvCU6FWKsKk91SHqKuHaZ3niGASl2hGTieGDWEzJgPZKNQkB72HMrO4IbnC12n8rS6dnpS9vm8/w2IVqm6jKMb12mkZpPjGDO2Liu3lo2wo1Esi1XLkX5CV8wyWV1luFwpK2lqqGVe+ZnlAF0FZebkIqIcokiVim4zc/JjyXSevtFStI9BTPsMN1G9QuODtQO7KmzINSmmKcxU17P+9T9ho8d2fNEDTpthCfRm/RLOBtw5Rqz8Gh7N/S0tSWdBE2ofZEuL81TRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rLX8dsOqzr3DAIm77aZwlIDIZPkO3VW9SuVJ8wikA8=;
 b=OqmS53+9x8g/M+Zcgsq5YUO4+gcDcOETB6SLSw/jD74OBJma4h7Sz3stCg7X1ud1gMqdLFFfI51palp7qera4x4nt6Cx3WBDbQXFif84ZZbLR7v3z0en7QMNWKe+5oo3D48W55d/ctpT3hypdn1/cW2EEXGJQwVAHGgH6TNCH7yluHXMk8TVdbuEMVGXJhX6BBmHyPTGvHdFN2yHg6+ODkMs/QtCeLMn5hTrjopeF/7XOSpUyODf0+4PnRuAnTID/Y9z1y2U9EHaTLzovemvUE3OqzpQku05JiL8S74SawVDOHC5WWV+X3Ieij9chiiiD0wPrZVQDL1Gc90YJDI9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12; Thu, 29 Feb
 2024 06:36:35 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 06:36:35 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/intel/xe_compute_preempt: Add
 compute-preempt-many
Thread-Topic: [PATCH i-g-t v2] tests/intel/xe_compute_preempt: Add
 compute-preempt-many
Thread-Index: AQHaamQVuIjQ/xmROkW6MA0Lfi62aLEg3cKg
Date: Thu, 29 Feb 2024 06:36:35 +0000
Message-ID: <MW3PR11MB4748BE3ADCD3EDE3CE72FE9DAE5F2@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240228162118.14654-1-nirmoy.das@intel.com>
In-Reply-To: <20240228162118.14654-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|MW3PR11MB4587:EE_
x-ms-office365-filtering-correlation-id: b4cd2f2b-548b-43ce-366f-08dc38f0c691
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lDGBInC52nCTk+VVZNVOzo9zDkjMi+CykLt55Gz2XkNYWnp1F8lZhZVEyrhhx8BaoX4jzXlYp1LJAEhJoq8GxkdT5wl2+q/prhVjvt8rPRxksR83iBkifQ3bgTxHg5JAmh0sz9c6PkrxiZ3SMKsKbcSNo91tWW+Zk3pGfGOlaftLGc9OTe9cNQ/0iqVQhEbslwNiLL3T0Id26v3lLaWuucO8RI0S/QXQhwmu1xXkVCpLvT5EBw/c7+qWfXUQyoGjTsYYEXxzeBWzWAuxe5wbwYumK/gYrCh/rGSHJHmzkCKwSwZaB9dwJEkMqHvXqWL8MU44crsMWohMjQ3EgjciG8e2LDr5R7JnIMvxNHoyRRAqd43B/lj+mfNesnHeQynDw/qehN0K+LfTWuN586J9flaLDvhnzk2+sFdZ8GHXVebRSiPCI+kxlKXqDxhG9JFul4V2V4VAPzoV86l8Wn5Brga7xKvO4IAuCCg1Oti2LD7Dxaov6EGlmWXPLqPvRXgEwk96mPejGgxPjkoVwyCu/CDWH8CkKAPnJLv4du9E5Gnr0QugQQmlx9ZtcVt0a/J48IhhtMpu1oCnrOkg1/V4LzLddHk0LQOrA+ZZ/PttcRJ2hvr6kDk4jDB81Eg5QshfNka05Hw1bpcUVrgb9T2n+sSGzAMxTF1+BF1Az822HQdAPkqEP2CsmJ/PC+mCVVyQ4nR7wEsoMU09Ul6C0opNaQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWxXL2gvTThienFvelhpUnVVcjFaT0JMU0hOOXRnVURYTlBpSHN2WDVQdm90?=
 =?utf-8?B?REJXbXI2bGFKRFdoTnFwTjNjMWlwa1hYSFBEM0pVbGY4WFZFVUg0blArTGE3?=
 =?utf-8?B?Vlo5SllxTTZVMEV6Y2RMTWVOUVVsZk1PWmRiSExqOFhFc1N1c0QxRmJMZW1B?=
 =?utf-8?B?YkR2dUQxRmxEM0ZZbmJyVEZWOThtSXMzZUNBRy9vZEJKUHFYVTlxQnNOeitE?=
 =?utf-8?B?SUhpS2JYT1dyeU9tc3JHcGJKWnZXdWV2ZUNhekRvQjhESWRTVkhMOGsxamdP?=
 =?utf-8?B?YjJiYy9YZWJBMkcvN25QTkI3NWJUNW1ocit6RjNyQWdqWnBPTEF6ZE9ScHVm?=
 =?utf-8?B?QUxON1hMUEMvalBYM2wwNG1FVTlvdnE4Z2lxUExhdExSNklqZXoxMmdXNlVR?=
 =?utf-8?B?dDU1YmFNQm8rTm43c3JmWmw4MVZlUm1zZ0tUcERWS3ZVSHNOWTJvZ3JQK1JU?=
 =?utf-8?B?cEwyVkxhTXpaby9xNW5CYW5rSTRLUXk4WFBHWDBTNnZSaVVINDg1TmRmSG05?=
 =?utf-8?B?SW1IYTJqVEtkOGFJdEZVQy9OeTdacW1LaW43VWFQVW90VEE1OXM0dHo3dVNk?=
 =?utf-8?B?R09PV1VxdzRoK0lENDcvUDk0em5NaklPWndBQzIxZThhanJvZnRUanN5WVlp?=
 =?utf-8?B?RTMrM2Q2blIwYmc1SjJSdjlONjJabEw4dVBxRkErL0g2VGsyT1NLdVA5M216?=
 =?utf-8?B?THpWWkIrai9OakRZNjhuRE9lNEVzMSs2YWlQcFhOTGo4d3FJUWdtT0V6eFpI?=
 =?utf-8?B?ZGhueWpvMFVrRnRrOXc1amU4cDBlVFBXTzFhTW9WbHlUSXVkc1l1c0RPOU5x?=
 =?utf-8?B?SWtCMVBQKzA2b0dURktROVkvbnRBcTY5MmxzSDRlclA3OGxvallYY0ZxVlQz?=
 =?utf-8?B?Rm9TLzNkdHhLODBYVnZMNHBIZWJQU3Fxa3FnV0JYVG1vUC9QbnJBSGJhS0Ev?=
 =?utf-8?B?MWNXMldUTFlRZEYzK1ZSOEVBYStXd21PK2YzNE50YTdObXpHS2V0LzVOUGk4?=
 =?utf-8?B?OWE0b3VuWk5nMU8rTE1FeHZFOUwvVGszMGRCaWxvTWFPN2U2UzY1Y0ozMmw0?=
 =?utf-8?B?d3ZQbnV1ODkva1E3UDFyK0QyQlVmdmZzTkF5QmtEcnh1THNHVUN4TndLNUVY?=
 =?utf-8?B?a3RmaWFmdjBwYWtrNlJCQWp0bmRxeWhiUGdDdWRqR0x0SHYrOHRCUkRiNkFB?=
 =?utf-8?B?djBTMXJ3eVZyaHA3YW1FZ2d1bFRuRWpTbWJYR2VkL3lVbjY2ckRWSzJma2Zl?=
 =?utf-8?B?ZmxYQm1wVG9OT3lLZU9RRnhZeUlWVFpzam83NGxuUWJRYWp4OWpheUk5b1VQ?=
 =?utf-8?B?ZVpEWi9HT2RsbHV5eS9IeDlSU21VOVFjMnNiWnpvU21uY3IvS25OemJxZFA4?=
 =?utf-8?B?RWF1RnFJb3AvR3A4cXBVVFRQZS9qemtaY0hZSzRmSEkvaTUwQXRZT1hWVWp1?=
 =?utf-8?B?RzZrc2pmVWdackxWVHpPS0htTEhJeVFmd2lsK3hLVE9vQnVKTnFrZ0RoZEU4?=
 =?utf-8?B?OFdTbEF0SWxjcmxzd3ZMWVZDVlZOQmsrT1BHdGROUUFDN2JHNmhYOFN3dEZ0?=
 =?utf-8?B?OENIYXROYzIwaUdETmVlVFg3NFNhOGo4SEgreWdmem52cnpEayt5RzdQV0ht?=
 =?utf-8?B?NHp3aDRRUTFaVXVLTUNTeG12dTV1Nk5CeUxLQVlvZ3NoRWRNR2lrKzN0bUFx?=
 =?utf-8?B?ak44c3RWWGJZYnFxbmpTQVlKVGtZMjNYaXAzbTF5Uk01emsxVGxyR2R0UW1N?=
 =?utf-8?B?THpXY2hYdHloVTR3c1NsQ0lUQ25STE9PdTRzSUtHbGNURG1KWE9sTlB4eklX?=
 =?utf-8?B?TG9aWXVMbHFzcXZwOXpYRVRQeHMyYS9TRXZOMi9IV09KL3BTaEF6NVdYWDhq?=
 =?utf-8?B?QWRPR1IvOGZ5aWtpQ3pDeFhNQWFaNWZiVENCRVhLTWpGM3Z5ZWxFR3ZVMER6?=
 =?utf-8?B?cHlzKzRMU2g4UWJsOUFZOGR6amU0Zi9ubCtpc2JoYXd2L1NtRVNkVjlFbTJD?=
 =?utf-8?B?QU9PYWpyRGlGT0ZmbDd6WHdBUnBpRXo4bVhHaGh0L1VtNjlhTWtObCsrM29W?=
 =?utf-8?B?aU82Y3pwcmxZZll0ZlRIS3IwdDVhdGdOUlhyMUt6VlV6N09JVkxPd2RnMjly?=
 =?utf-8?Q?Kli3zbVUcT+pZKu/18PipERXt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4cd2f2b-548b-43ce-366f-08dc38f0c691
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 06:36:35.4300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x4HRaQFkldLZldDZKLo3kYUHPGhRuqCW9583HI7RQV7sSSZOZtgcR7bT3NSshLwp54NR0xA+S8fswR+kygdgrY34qNXZqhwRNO8CfOxOIp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFzLCBOaXJtb3kgPG5p
cm1veS5kYXNAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDI4LCAyMDI0
IDk6NTEgUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBEYXMs
IE5pcm1veSA8bmlybW95LmRhc0BpbnRlbC5jb20+OyBLdW1hciwgSmFuZ2EgUmFodWwNCj4gPGph
bmdhLnJhaHVsLmt1bWFyQGludGVsLmNvbT47IEtlbXBjenluc2tpLCBaYmlnbmlldw0KPiA8emJp
Z25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjJd
IHRlc3RzL2ludGVsL3hlX2NvbXB1dGVfcHJlZW1wdDogQWRkIGNvbXB1dGUtDQo+IHByZWVtcHQt
bWFueQ0KPiANCj4gQWRkIGNvbXB1dGUtcHJlZW1wdC1tYW55IHdoaWNoIHNob3VsZCBleGVyY2lz
ZSBtdWx0aXBsZSBtaWQtdGhyZWFkDQo+IHByZWVtcHRpb24gYXQgYSB0aW1lIGZvciBtdWx0aXBs
ZSBjb250ZXh0cy4NCj4gDQo+IHYyOiBtb3ZlIGlndF9mb3JrIHdpdGhpbiB0aGUgdGVzdChaYmln
bmlldykuDQo+IA0KPiBDYzogSmFuZ2EgUmFodWwgS3VtYXIgPGphbmdhLnJhaHVsLmt1bWFyQGlu
dGVsLmNvbT4NCj4gQ2M6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5z
a2lAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGlu
dGVsLmNvbT4NCkxHVE0sDQpSZXZpZXdlZC1ieTogSmFuZ2EgUmFodWwgS3VtYXIgPGphbmdhLnJh
aHVsLmt1bWFyQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL3hlX2NvbXB1dGVf
cHJlZW1wdC5jIHwgMTkgKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9jb21wdXRl
X3ByZWVtcHQuYw0KPiBiL3Rlc3RzL2ludGVsL3hlX2NvbXB1dGVfcHJlZW1wdC5jDQo+IGluZGV4
IGE0ZTBlMTQ1NC4uMGFlYjEwNTQ3IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9jb21w
dXRlX3ByZWVtcHQuYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9jb21wdXRlX3ByZWVtcHQuYw0K
PiBAQCAtMjIsNiArMjIsMTEgQEANCj4gICAqIERlc2NyaXB0aW9uOg0KPiAgICogICAgICBFeGVy
Y2lzZSBjb21wdXRlIHdhbGtlciBtaWQgdGhyZWFkIHByZWVtcHRpb24gc2NlbmFyaW8NCj4gICAq
IEZ1bmN0aW9uYWxpdHk6IGNvbXB1dGUgb3BlbkNMIGtlcm5lbA0KPiArICogU1VCVEVTVDogY29t
cHV0ZS1wcmVlbXB0LW1hbnkNCj4gKyAqIEdQVSByZXF1aXJlbWVudDogTE5MDQo+ICsgKiBEZXNj
cmlwdGlvbjoNCj4gKyAqICAgICAgRXhlcmNpc2UgbXVsdGlwbGUgd2Fsa2VyIG1pZCB0aHJlYWQg
cHJlZW1wdGlvbiBzY2VuYXJpbw0KPiArICogRnVuY3Rpb25hbGl0eTogY29tcHV0ZSBvcGVuQ0wg
a2VybmVsDQo+ICAgKi8NCj4gIHN0YXRpYyB2b2lkDQo+ICB0ZXN0X2NvbXB1dGVfcHJlZW1wdChp
bnQgZmQsIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2UpDQo+IEBAIC00
OCw2ICs1MywyMCBAQCBpZ3RfbWFpbg0KPiAgCQl9DQo+ICAJfQ0KPiANCj4gKwlpZ3Rfc3VidGVz
dF93aXRoX2R5bmFtaWMoImNvbXB1dGUtcHJlZW1wdC1tYW55Iikgew0KPiArCQl4ZV9mb3JfZWFj
aF9lbmdpbmUoeGUsIGh3ZSkgew0KPiArCQkJLyogVE9ETzogVGhpcyBzdWJ0ZXN0IGZhaWxzIG9u
IFJDUyBlbmdpbmUgKi8NCj4gKwkJCWlmIChod2UtPmVuZ2luZV9jbGFzcyAhPQ0KPiBEUk1fWEVf
RU5HSU5FX0NMQVNTX0NPTVBVVEUpDQo+ICsJCQkJY29udGludWU7DQo+ICsNCj4gKwkJCWlndF9k
eW5hbWljX2YoImVuZ2luZS0lcyIsDQo+IHhlX2VuZ2luZV9jbGFzc19zdHJpbmcoaHdlLT5lbmdp
bmVfY2xhc3MpKSB7DQo+ICsJCQkJaWd0X2ZvcmsoY2hpbGQsIDEwMCkNCj4gKwkJCQkJdGVzdF9j
b21wdXRlX3ByZWVtcHQoeGUsIGh3ZSk7DQo+ICsJCQkJaWd0X3dhaXRjaGlsZHJlbigpOw0KPiAr
CQkJfQ0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICAJaWd0X2ZpeHR1cmUNCj4gIAkJZHJtX2Nsb3Nl
X2RyaXZlcih4ZSk7DQo+IA0KPiAtLQ0KPiAyLjQyLjANCg0K
