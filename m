Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C53DC55184
	for <igt-dev@archiver.kernel.org>; Mon,  3 Aug 2026 10:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96DC10E594;
	Mon,  3 Aug 2026 10:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2dROWOK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D7010E5A1
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2026 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785751638; x=1817287638;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jsFiUaBEBcgLOESkpQG3v3etuF8V+2ShpEeeF5V2P5c=;
 b=g2dROWOKXM7l6i6sP0v6YL1jQJc8xgnMi1Q2JYqdMZ9CmY2H5DI0IMzP
 8jQwrJvVAdUXfdZrwxaoZ5snI2caEvyNCmaenIWlogXgm5QQaHOao++As
 2LLLXZaKYCAVRJuRChaf6t8wuCzpDFk7oZvxJB4TK7Mi/6fCZJD6yX7Ek
 gmIVJo4UmRhyuB+4fX/WAawZwDMs3jzkC/yMp6BUWG5KiHOEQlHzWjMTA
 Ff3gwWLSqz9i2o7YxIi6hyv0WFQERLA/EHCScxKD90ChS+sU9NYcC5/0p
 cSGQaaAty3vD5+YhmxvVfw1s0HEh3Id0YVYYjQwPZRye9fd7sgDV+7ByX A==;
X-CSE-ConnectionGUID: JYn18+gpSxOohnf+K2fpMQ==
X-CSE-MsgGUID: 98erRbZOQ8q35mVczvgZig==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="90169593"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="90169593"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 03:07:18 -0700
X-CSE-ConnectionGUID: 8XsDAqAcQGmgaRcyhIKvCw==
X-CSE-MsgGUID: 02UZv0Y3T3G3T0W6lRoKCQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 03:07:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 03:07:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 03:07:16 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 03:07:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyLOliEiwADZoK8v3IzsUgPUNWYoVw8zQinrlJOz5F/OredDP5zgXK6eVreUvKb8RQmFvCVzmxn0ToGe/KJyHPvyTAtH14C5yBpirgvgsyaWD5NCD09fyy1uoxqZgOHQKP7ompWKVGMPAH2omOcH3V4hEkXqqJ4tLBuD8N36x+bb6EuIxEBLyyasHdNAh/vF+UQUH2rBSfJVx56tINrcqxjJ3DvWQQPfyl9QtRtjeIeuNdyl9HAFW22Pme+4SwG9toCLfZhvCAtI+iz0cAtVRHyyS2Wf0Uc2d260emlz8r6RwymI5x/0JuM/1B4iIuedGVCE647vsQbgZY1glS3COg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsFiUaBEBcgLOESkpQG3v3etuF8V+2ShpEeeF5V2P5c=;
 b=bu0PSJokpMONcIQ2JSBz3XTY52WgrwMlwwE1xUwbYCHaxZY6muTqENFyODAZZqe1vT7cHCZAlHQ0x/uDnArb/mJj+BPOtYzE2fc+K+iLFSdnO3pyhRKzYaxIh3xp+0NAo7KlkLfrYV5Q6NmCkv/O3HmxdIL0SRCSWOEWOWRdqj2+UgfaJfsEhrTzJHFt5lBJnzAUOiYDATJYvhvsofW5Lcb+gjBaIscvZbvqrp9jUUhWAYp1vKAxsxhzZ0rO2Svxf0FhWqaRCQhhDzKLX+jcd2AFRJn+6T2z7ecFr7Rk6l/rAc7bKBP6dXQhYCqpJ7nkxxkeyftnHmu/ZN+WAegroQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB7907.namprd11.prod.outlook.com (2603:10b6:8:db::13) by
 IA0PR11MB7749.namprd11.prod.outlook.com (2603:10b6:208:442::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.17; Mon, 3 Aug 2026 10:07:14 +0000
Received: from DS7PR11MB7907.namprd11.prod.outlook.com
 ([fe80::12f4:5e22:c1b2:3809]) by DS7PR11MB7907.namprd11.prod.outlook.com
 ([fe80::12f4:5e22:c1b2:3809%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 10:07:14 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2 1/2] lib/gpgpu_fill: Rename variable to reflect
 function purpose
Thread-Topic: [PATCH i-g-t v2 1/2] lib/gpgpu_fill: Rename variable to reflect
 function purpose
Thread-Index: AQHdIwc/EiotCflId0esHsQzxyBkxbaMGYAw
Date: Mon, 3 Aug 2026 10:07:14 +0000
Message-ID: <DS7PR11MB7907AE87DEB734626A0B875AD9D52@DS7PR11MB7907.namprd11.prod.outlook.com>
References: <20260803051608.61167-4-zbigniew.kempczynski@intel.com>
 <20260803051608.61167-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260803051608.61167-5-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB7907:EE_|IA0PR11MB7749:EE_
x-ms-office365-filtering-correlation-id: 79f94456-115a-43d5-dac1-08def146fe0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|4143699003|38070700021|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: QzAC9Rc8KuGoUt85ei51AjgMJwWPw9290OUGFRVq8HEHE+0hv4J/pJH7DYpO/FIzFT6i7joNR5N+06QzwzYi0kTS/qfpowWdfR+0f7T1anwir1AFvnvD+NWJpMHsiav/stLTzm9AB2anC1CsFhNY+TTw19f3BMun0yc+Dgd3hipytNOvow3h2Qap+iTKBgccbZ6OIk5UXkfzgHs1igqwZhSt73iPjB/ljCDwOLuhuSwrKnlFXzEtd6KHptpTNDxvnWiQjtjxAJDOP3o3AkrwwBk1Jqjt/GlrfaMfDC2cbB1/gxrgDPeyrEP3xMpxPVA22tqUWpCjVqcrj9Q4OXaTB8Axg84A4hIbkaPN4TeI+M9uZp5DsCPwn+3C51XciCjBE6QN0a3L2ixpOfuAzTfsRVr2FvbO6AwfgeJLNg6C1eGHkJJ6mbI4HaoCM/HGY22oVZvYCja/kiFdWoYLUwEwab/lyQVl089a9e0x5ckdkhElfdiIQuLNZ9JMh3mEAk3y9k7bU8l4GetVb2bTnCyk6C0wZyF1m6SHNrsAx43LUjn0wd8VvY85bDF4wE0Nn63MghlI979ZCsintQ+jdKsjRjavi22+NP17z9pBADr8SLYT1ykykTzsmXswIq+wFQydvB54ks6FBveHFY4Q6uUTUGeAuGylePOXnxh3oxxR6sMBQTfsroaW0FqNh0K2IY/zs4CYidC9xiH1y7osypr27feMUpHmqtsC73Dp7Qv8Blc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7907.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(4143699003)(38070700021)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmJ2TjJ4L0ZiZ2lwZUF5V0RhSHlBREVFODhpUXBETWtoMWtubjRURHZRaGor?=
 =?utf-8?B?S3luZnV3NFVId2pyMm1lS1Q3V1U3aGFnQ0xVeDk3dUpsQU83S3pTOHdUaEZR?=
 =?utf-8?B?N2FlRjVNaHVoRzhPM2tTQnFZSUk3bGFTdjg3K1pUbFFEMWx5KzFuVis0SkFa?=
 =?utf-8?B?emg5K3NhV1J0VEpkUEJxM3hDQnlVQzlZbXNRNk1VZ0tvVE8wWDBnTGEySnln?=
 =?utf-8?B?THIraGJaU0wrK0NqeUNaVjgwb0RYNStSbU1mcmhHcnRxVUZPdWt1YjRKL3N3?=
 =?utf-8?B?a05PR3BkK1pzeU5wbzlMSzhLS2UxQTUyakZrTTlFSlhRcmtuMlRic253V0Np?=
 =?utf-8?B?L3pnMmJkOW1hdHZwOENabGZMMEkxS0V4Q3g2TCttN05yMy9EZVJETktGZmR6?=
 =?utf-8?B?ZThpT0psQUdZYUE5L0tNMXVLS0Q4Tjg3clMxMGo3ZVZ3MTFtYXhTVWlnUXNR?=
 =?utf-8?B?dFJHcjdRSi9GTlM2LzIzQ3hMVXRIQVhyOU9uWXk2YWdLc2o1aHlFRFlMaGFt?=
 =?utf-8?B?WmNoNWcrdnkvQWthRGc0UnB6NFJWTG1GUEsyeHdsZzMrWkoxTDE2ZnZLZ3hl?=
 =?utf-8?B?VndpdVVsNW5FMWE1eW5GOW1rSVFKdVZhTEpuUFJHTERlaURoRUxDdERFZENI?=
 =?utf-8?B?Q0FPWnVnVk52amhaNGNYVkFPVHU3UXFXSTljS29WbnVpU3ROa2E0UE0rQmNR?=
 =?utf-8?B?NmJETWVxYkp1bHUvK01FWVhnMy9GZkdBWDQwY3ozcGZuVEk3TFkyeE9tbnFP?=
 =?utf-8?B?SlB6VjhvbmJLV3BubTh2RmlEYzZuLzhZbW1BL3RWams0blVya1ZTUFdJZnIw?=
 =?utf-8?B?K3ViUGY4NDVjak5CWlNoa2xqTmpZRHR3M3VJcUludWRidzYzUzFWdmJFRXJs?=
 =?utf-8?B?Q0tGWHlvTDBoM1hTYTdlWnRXTXlPSUxhK2VMRllDVThUY0tMeTVPbHFwNUtk?=
 =?utf-8?B?UUc5NDhaRSt1Y05LeWlOY1hrbG55MDFLOGVWOERCN0RpWjlqREdaYWZHakF2?=
 =?utf-8?B?ZTY0RzFjTXF4MGkvK1JSWG93UUJYSnFaREpsejVMMllIUDlqb1kvVGp4Q2xY?=
 =?utf-8?B?bGlERlA5eW41SXpTanRDY245V1NLVWo5M3dMWkZPTXg1UTZsRkpqZCt1SS9t?=
 =?utf-8?B?cjFFQ2tIRWVTdm1lcWw3cWhyZkQvUmYzQUZ2cVE1bHhMUVNzamZCQlVjQkZh?=
 =?utf-8?B?ZE51ZXBxczBzcHp2R3VPYVBuZ0wvVlpORDk5WVVEdm50TWpUaFkwTVVyNEs0?=
 =?utf-8?B?VXJPOStVRndEVFU5MFBzOHo2WVJSZnZEcjV5R2hmTUxYMzk3VlpVamgzSXI4?=
 =?utf-8?B?TjkzUmFtT1pjeG9CVXcxZ0h0NzRjNXFrcFRBV1JIVU1ScnFyamlQdGYzUjZa?=
 =?utf-8?B?V084Y25RbDNIbHVsczk2MWM2NE5aQWxOMlNJbjl5ZWUrSVh2OFkrby9jMzNh?=
 =?utf-8?B?NEptSWJ2VytOS2h4QU92a2hYd1dKdjF6cEkrZStLczlneGYwNUEyak1oN01Q?=
 =?utf-8?B?YUVqdTJQbkpBekhMbklCdlpNRnhqRHdOVGxVczdRYkEzU3FlLyt5aFFEQW5k?=
 =?utf-8?B?b1l4TGZNSXF3ZG1rNHVPRzBUM3QrZVpkc2lGZ2J5QW1sMmp6K1poaDhVMlJ4?=
 =?utf-8?B?RVVKWEFuRXd5aUhUd2RQQ2tqcDZQUEdHc3BsdnBGczdyV2kzN2lRV0ZBdThk?=
 =?utf-8?B?R1ByWWVQZklTaWZYUEJJVU1yb1NRS2NzK3FjQ1NtaGR2UzRlQW5mYnNjQ0xL?=
 =?utf-8?B?aHVqYkp4MDNlVEV5TVJhb2ZIanBvUjZxTVBad1FsVUt5MGpmM0QzV2VtQlNm?=
 =?utf-8?B?V0taRmR4Q05HSVlBTjNZOEVaZUhwRTB5elVWSG9ZQVBSd3E0ZCtjV1pENnFL?=
 =?utf-8?B?RjJVaFZ3b1FJaXVpSHRrUEg3d3d5UjFxZFV2VWlDZE96Tm5OVEUwU2t1UHVj?=
 =?utf-8?B?YjBvZ2tISnZBRmNRTlNCVGlJSUd0MVFKTlNrRjJpcWFuZmZCMWZFZWoyN0Er?=
 =?utf-8?B?b3ZCaktFK2xXWUJIQ1ArY2Y5SnhWL3B2YU1QbVk4QkZMN3FRaEw5SDR0d2Rr?=
 =?utf-8?B?dGd3Q0NUZzg5Nlp5aE5JYU41bWtQaW1IbUpTYnBKRllDbmM0M0pNWmpscjgr?=
 =?utf-8?B?LzhIK3JOdkpjdGJ4eE1iOU1TU3JJRE1jeFk5MnNjNzlhTDBFblZVWUhTd0RX?=
 =?utf-8?B?ZUtkZUVySjVXL3hBeHo4TnliaFhUVFpPSkhGbXdCLzZsaUh1K3QxcUNkbnAz?=
 =?utf-8?B?ZU1HNkNuY1VHKzZVa2hra3FVdm1QRW1hVlVqT2FtQUZkQ2xpUENIazZCbEh5?=
 =?utf-8?B?WmY4QUxxdEMzS0paTnJobjJGMEt1dEYvT05IRDlLNC9tdXpWMUwwU2ZtUkha?=
 =?utf-8?Q?9vwahbDPFnDrnOl8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dL1C5fl8+k78RtOhgCaliPdtonRI7gTMFAIO47d5WocS83QKPPJAhyoqx/wHg3q0N2Q3CU4ZKPoxrXXIV0PHm03E5cgO/pH5KbX5A+xt6tlN1BxW1fPqSbWNcgM8SiVDH8N0mv5qKhaCW50hKx2cVBr6J2qWZwKNVT6XnGiuVw9kq8c7e336kHjDrMZOKFrfQogxDImlU1LqXkABHGwpunDC54v280SUqxWCIa3fuG0rrxBliEeV3yZmWHxiFQO8HzPeMhq/fnENm6F9PgSmhZZA5TFQKlvpE2koj+C7nqhdefFFBuktgjundaPF1EauimW4gR1K+naytNk55k+VAA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7907.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f94456-115a-43d5-dac1-08def146fe0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 10:07:14.5259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VLvF8tyCnz0W0E+XW9b2pSP7/9sIfYJTGHTtI95bTctEM6wS16TFbupmhS3g/WnFFW+F+1alv0KBqPVgOoFCmsUBTiP7QZtoM5pgGmzH288A6ZEt+g6SAIVp/L7FrjnL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7749
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

UmV2aWV3ZWQtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlh
dGtvd3NraUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogS2VtcGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+
DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDMsIDIwMjYgNzoxNiBBTQ0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsgUGlhdGtvd3NraSwNCj4gRG9taW5payBLYXJvbCA8
ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGkt
Zy10IHYyIDEvMl0gbGliL2dwZ3B1X2ZpbGw6IFJlbmFtZSB2YXJpYWJsZSB0byByZWZsZWN0DQo+
IGZ1bmN0aW9uIHB1cnBvc2UNCj4gDQo+IFByb3ZlZCBncGdwdSBrZXJuZWwgZm9yIHhlaHAgd29y
a3MgYm90aCBmb3IgaTkxNSBhbmQgeGUuIFJlbmFtZSBpOTE1DQo+IHRvIGF2b2lkIG5hbWUgY29u
ZnVzaW9uIGFzIHVwY29taW5nIGNoYW5nZSBhbHRlcnMgc2hhZGVyIHByb2Nlc3NpbmcNCj4gKGNh
bm9uaWNhbGl6aW5nIG9mZnNldCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1w
Y3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gQ2M6IERvbWluaWsg
S2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQo+
IC0tLQ0KPiAgbGliL2dwZ3B1X2ZpbGwuYyB8IDEwICsrKysrLS0tLS0NCj4gIGxpYi9ncGdwdV9m
aWxsLmggfCAgMiArLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2dwZ3B1X2ZpbGwuYyBiL2xpYi9ncGdw
dV9maWxsLmMNCj4gaW5kZXggMmM0NzE2OWQyYy4uZTdjOWMzY2QyMSAxMDA2NDQNCj4gLS0tIGEv
bGliL2dwZ3B1X2ZpbGwuYw0KPiArKysgYi9saWIvZ3BncHVfZmlsbC5jDQo+IEBAIC0yODIsOSAr
MjgyLDkgQEAgX19nZW45X2dwZ3B1X2ZpbGxmdW5jKGludCBpOTE1LA0KPiAgCWludGVsX2JiX2Rl
c3Ryb3koaWJiKTsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgc3RydWN0IGdwZ3B1X3NoYWRlciAqX194
ZWhwX2dwZ3B1X2tlcm5lbChpbnQgaTkxNSkNCj4gK3N0YXRpYyBzdHJ1Y3QgZ3BncHVfc2hhZGVy
ICpfX3hlaHBfZ3BncHVfa2VybmVsKGludCBmZCkNCj4gIHsNCj4gLQlzdHJ1Y3QgZ3BncHVfc2hh
ZGVyICprZXJuZWwgPSBncGdwdV9zaGFkZXJfY3JlYXRlKGk5MTUpOw0KPiArCXN0cnVjdCBncGdw
dV9zaGFkZXIgKmtlcm5lbCA9IGdwZ3B1X3NoYWRlcl9jcmVhdGUoZmQpOw0KPiANCj4gIAllbWl0
X2lnYTY0X2NvZGUoa2VybmVsLCBncGdwdV9maWxsLCBSIigNCj4gIC8vIGZpbGwgdXAgcjEgd2l0
aCB0YXJnZXQgY29sb3VyDQo+IEBAIC00MDcsNyArNDA3LDcgQEAgc3RhdGljIHN0cnVjdCBncGdw
dV9zaGFkZXIgKl9feGUzcF9ncGdwdV9rZXJuZWwoaW50DQo+IHhlKQ0KPiAgCXJldHVybiBrZXJu
ZWw7DQo+ICB9DQo+IA0KPiAtdm9pZCB4ZWhwX2dwZ3B1X2ZpbGxmdW5jKGludCBpOTE1LA0KPiAr
dm9pZCB4ZWhwX2dwZ3B1X2ZpbGxmdW5jKGludCBmZCwNCj4gIAkJCSBzdHJ1Y3QgaW50ZWxfYnVm
ICpidWYsDQo+ICAJCQkgdW5zaWduZWQgaW50IHgsIHVuc2lnbmVkIGludCB5LA0KPiAgCQkJIHVu
c2lnbmVkIGludCB3aWR0aCwgdW5zaWduZWQgaW50IGhlaWdodCwNCj4gQEAgLTQxNywxMiArNDE3
LDEyIEBAIHZvaWQgeGVocF9ncGdwdV9maWxsZnVuYyhpbnQgaTkxNSwNCj4gIAlzdHJ1Y3QgZ3Bn
cHVfc2hhZGVyICprZXJuZWw7DQo+ICAJc3RydWN0IHhlaHBfaW50ZXJmYWNlX2Rlc2NyaXB0b3Jf
ZGF0YSBpZGQ7DQo+IA0KPiAtCWliYiA9IGludGVsX2JiX2NyZWF0ZShpOTE1LCBQQUdFX1NJWkUp
Ow0KPiArCWliYiA9IGludGVsX2JiX2NyZWF0ZShmZCwgUEFHRV9TSVpFKTsNCj4gIAlpbnRlbF9i
Yl9hZGRfaW50ZWxfYnVmKGliYiwgYnVmLCB0cnVlKTsNCj4gDQo+ICAJaW50ZWxfYmJfcHRyX3Nl
dChpYmIsIEJBVENIX1NUQVRFX1NQTElUKTsNCj4gDQo+IC0Ja2VybmVsID0gX194ZWhwX2dwZ3B1
X2tlcm5lbChpOTE1KTsNCj4gKwlrZXJuZWwgPSBfX3hlaHBfZ3BncHVfa2VybmVsKGZkKTsNCj4g
IAl4ZWhwX2ZpbGxfaW50ZXJmYWNlX2Rlc2NyaXB0b3IoaWJiLCBidWYsIGtlcm5lbC0+aW5zdHIs
DQo+ICAJCQkJICAgICAgIGtlcm5lbC0+c2l6ZSAqIDQsICZpZGQpOw0KPiAgCWdwZ3B1X3NoYWRl
cl9kZXN0cm95KGtlcm5lbCk7DQo+IGRpZmYgLS1naXQgYS9saWIvZ3BncHVfZmlsbC5oIGIvbGli
L2dwZ3B1X2ZpbGwuaA0KPiBpbmRleCA5NmQyOTFjOTg3Li42ZjJkNzRkNzBkIDEwMDY0NA0KPiAt
LS0gYS9saWIvZ3BncHVfZmlsbC5oDQo+ICsrKyBiL2xpYi9ncGdwdV9maWxsLmgNCj4gQEAgLTYy
LDcgKzYyLDcgQEAgdm9pZCBnZW4xMl9ncGdwdV9maWxsZnVuYyhpbnQgaTkxNSwNCj4gIAkJCSAg
dWludDhfdCBjb2xvcik7DQo+IA0KPiAgdm9pZA0KPiAteGVocF9ncGdwdV9maWxsZnVuYyhpbnQg
aTkxNSwNCj4gK3hlaHBfZ3BncHVfZmlsbGZ1bmMoaW50IGZkLA0KPiAgCQkgICAgc3RydWN0IGlu
dGVsX2J1ZiAqZHN0LA0KPiAgCQkgICAgdW5zaWduZWQgaW50IHgsIHVuc2lnbmVkIGludCB5LA0K
PiAgCQkgICAgdW5zaWduZWQgaW50IHdpZHRoLCB1bnNpZ25lZCBpbnQgaGVpZ2h0LA0KPiAtLQ0K
PiAyLjU0LjANCg0K
