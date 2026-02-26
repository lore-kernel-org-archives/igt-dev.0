Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E41FD4611
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 03:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B55710E0C7;
	Thu, 26 Feb 2026 03:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbWOVpFo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4AC10E0C7
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 03:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772077724; x=1803613724;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YLFQgETfcnZH1fwSeiw/QRAwI+x5UQvUC/oDhqEar7U=;
 b=GbWOVpFoiQpUxUbKJskq2iZJ4ph4+4q7fzjlpE8Jkv8daFYILKr3VrlO
 gKMMAsQmFCP8vExImxQm1g/pZmzZAL0Y17OXz1pnXym8sMFIsdRT9LBWc
 8PaK4q8zGQ8PEuzyeTTDCzqucIj3J8QKrwRSs5XqtAXQof75EvGrfB08I
 peg5pWcU+2CzzWyhKTGfN112S4sD9hmfETLpnRE+sTEKNJWwpaFOEiKWE
 It3fBmxgKKaIDSGKDJoc3OGaqMnBQavcF9MO3LDJCF5TiE1U3KADTQulO
 kVSwVYIsdp4EZLPTgp9fQXXi/32l7T7XcpyTc9kvPXm+K5NgVZmP9xzOR w==;
X-CSE-ConnectionGUID: nJ6xNLUqQO2mXFGTZAtMlQ==
X-CSE-MsgGUID: FLvPqRGzSPm5sgYDN5KbOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73040054"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73040054"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 19:48:43 -0800
X-CSE-ConnectionGUID: THsq2eieREyQjulk2QnN8g==
X-CSE-MsgGUID: J5M/8wE4RG20SjY5pijFog==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 19:48:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 19:48:42 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 19:48:42 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 19:48:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ud2u8MXoR6ZeOgbVnIgqkMpHDAv8ymlEh0irm4oqnwO6wntqGYMzGUiypa3QQD47HJenwQ8J0Aj8A1gCDTmf9ia9RSgmgCvl538aklaRSS6kPcm0Knwwy/0ErJx6jG1b5l232wPn+yDW1ooOcwNEMENDmsd4GjpC7g2IOmrkQNDBP6GWy5vHgPnt6SjMC1yBLC9y7GqnHoe64kQdir3LyIwYqEfl+JTSkOSTmfuEK7BUmclmP/V3SEKiLdoLcEgh29klRY7c5EKwujgHpLylK+A9MUBJUxeeAJnWiPk2h+AO4Tzv891gXCoUBVrSkA9XH6Og4uIwzTS6Xw6gXVY1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLFQgETfcnZH1fwSeiw/QRAwI+x5UQvUC/oDhqEar7U=;
 b=A89S3f+kaBWnkpr0fOwanCVYOsEAiDqSa87s1MclOKDDA0J0UpfI8c2S/n2TXS4lDBMdUE7C6D33WzCZjQeUtatKenAbvcAF/5Wv+TFvnWw9/Q9UoLpQ7iveB2t1xDEBeAd3v6/9H++ZiFWTvDOggkp1DTd+I/j+bMLH2MGmgN/HA1wFDawSqXfOC/nXVwLKOsNuaYhRpPVm/MjmRJ4xrANl5nEnZStP4VuoZyWuJflbXDpGzEqwxnPp+26fzSQnIqzoWSYorygia3J0jWrrJdqwTMTmRmvOIli0Asmat+ISQUcshRyrEiOUMkfu1/E+Zwn2TciFGlM0ACyiy+g0Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DS0PR11MB7851.namprd11.prod.outlook.com (2603:10b6:8:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 03:48:39 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%5]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 03:48:38 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Restructure
 modifier validation into per-modifier subtests
Thread-Topic: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Restructure
 modifier validation into per-modifier subtests
Thread-Index: AQHcn+6lz6dZlqU7wEWgaQJDITuK8LWUWJwAgAAMLlA=
Date: Thu, 26 Feb 2026 03:48:38 +0000
Message-ID: <PH7PR11MB60537C6C2CBBC601447731ADE772A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260217093048.1597495-1-pranay.samala@intel.com>
 <b404d769-698a-4aba-8e92-ddedfd602ff6@intel.com>
In-Reply-To: <b404d769-698a-4aba-8e92-ddedfd602ff6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DS0PR11MB7851:EE_
x-ms-office365-filtering-correlation-id: e9834c13-cac9-4084-e61c-08de74e9ed2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: 5xA20Gu7SZ+DrdwB/fLZ9CCeAIiKI4BwoGyHPFT9TEpo6GD+CEZnQq9VBy4JJoX+ZO5qC9ExpTiAq0FY3RJq4PVzddXXFiEhwQNIb6gCTvlt5Kqaf37hJPVirs7RVU8i3lzBzJIpanUo6fGuNkF6djUCPXaec7OHKIJ6myf5p0kVxBmuQx1cBiIruD2XRZfrgxuQBuL4CWjFNaV7cVqbk5Fu7t6s6shEo7sTRPPmzQZHZWchd7FXhNmW571uwayS4m7zaozFOTw3zCfd6aTlzOT7QUbXy92SZ7mSdlZwnCuvUAhRyZnO24TUemoIeQ9Yqmt3hT+Ij3mYaWAUg5or8MzgW/c1npKnPAdxstwXn2yO1682j3RHL6z7KV254/I0DliYUToKdnywPFid+r1guzjV0pk8G9KSQWInk1TXh4gmzL3iBXAkAkP/xy8bFAFWnPXO7tCYVhxPOcKaTTS1lNXABbrrQ5s9Hka4DuJXCJNBwvHz0hok9vbFCpRYZ9pIzDJEajLU1w0s8w20ag9PIcnwk2jOuV68smJLHpKVCvj8Ss66lzLQ69kaQFBBsoclwaei9zyE+k+Vcbrxn+pwfSYdunmr0YAeVKGSSzfefvAqYduzJhKnlD6uhXXW/K6Jzpns/c541aGpvDz7M8n6gCQQcyMWGAwrwOb2k3ZcGMko2OcBtL4P1TISvHeY9IDAP4/gB2xwZXa/X72+UUSLVhTtkeotFjecC3XFrZXvEYo0l5Jl0XuEPZvECNHR7/boo2Da/MBwgLpB1wsarR1011eGCWJN9bxNdoimlGivw0c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUpucWo1MjdXYmtOZUJaRjdFa3dJa1ZHVS9TNDl1OGllN3I2YisrU29tWWVR?=
 =?utf-8?B?M2JERGxhckZwQ25FK1VrNjBaVGR5SXhSbEszZHhpWkdYeHpZRFQ3U2VHYW1N?=
 =?utf-8?B?OFM5djRpc2oxRGpFaWRKRlY3S1lQbEpHTklFa2Q1ck9yWU9KbDZKNUJNTUti?=
 =?utf-8?B?WkdWUlYxdllnWUtWNW80ZkpHczFIZU80WStveG5EUFJLRnNSTCtyR2paZmRk?=
 =?utf-8?B?MEFiVW16YkY0ajdST3Brd3dER3NYeXNhZVRlV1lJUnNMazg5SXdQb0dxSWNw?=
 =?utf-8?B?a3YrcmFzcUNTRGRKR1JHSGZQTXpnY2lRY08xWjNzQ3M5NmpZSkFWem1qZVdL?=
 =?utf-8?B?TElsMDdzZGRzY0ZaTmtaYTBrN0I2NWlKSWx5dUJmbTlWTTJjZVEyNFlLdmU5?=
 =?utf-8?B?TzFvSW1sa2Jva2pWdGRxMlNFWWZYVEk2R2szdFNnZFNSNmFYZEc0Vi9zYy9v?=
 =?utf-8?B?MjdzMjhJdmdmb1d6b29SMVlZbzBRU1gwTW4vTDVqcmdqSnUxd2hzaG0xNUlP?=
 =?utf-8?B?WGNuR01DTXV2Wm4vbWFHWFVFRHVLQWx3Y1MrbnNPejZjNzNGL2FWeHlJT2cz?=
 =?utf-8?B?ZGZCdldQaEc0UGVLQ3VJU2NJSEhmdzA0MTRSaVE0b2FVQks4dllJMHgzd2FO?=
 =?utf-8?B?L0NuVnE3ejFHeTBpRCt4OW5veDUyY21MdmpDRjk4eUcxTnl6QXhxbWxxYUpj?=
 =?utf-8?B?RitvRjFwZU5IVzZHSHgxRTJzZWRBZ3ZIK2FlVUQ5QSt5L1ZKTTVzV2ZyUTlW?=
 =?utf-8?B?SGNhclpoTHF1UDROT0hvaE0wL1ZSQStlR0NzQk9ZejBaNXF3Wm9xcDYzUCtH?=
 =?utf-8?B?cG1tSDNsVnpMQlgzZUtZSjVWMG9vaFNubUtQT2dNVUk0eFNJTHhnSTBza1VC?=
 =?utf-8?B?RlBwcjFBVGlpSzNHT3VCaDFYbjBSbjhlc3B4c1g3UWZFTnJGV1F3SldTN2s0?=
 =?utf-8?B?a3hUaHZ4L3hiTUh0bUVKR3VQem0ydHFiZ3NDRFhrNHBoTFlVOHVKTWV3S2Fa?=
 =?utf-8?B?WG1FaVlsbmJhcHU4YWZQMS84djUwWEliaHFFYm9qeStKblJlc21odTZld1Vi?=
 =?utf-8?B?cHJSUE5aRVo5bVErdXFodWxBdUNnZEwvSGRNTzNFbEppRGVNdjAyLzZ5bjBk?=
 =?utf-8?B?b3N6cGNyaUdJaGdqcG80MTBJWldnYWtpSmpiVnBWQXE1SEljTzRlNzl1R05W?=
 =?utf-8?B?RU5lS2UxUGorcnloS1VzWHozYURWOCs4d25sWEt5WUlmZ3pWY0RZQkwzYzF1?=
 =?utf-8?B?VHdaaUpLejVSTk5TNFoyR08rUnpZb0pmbXA1UnJUOWh3bzI3Z0tVSXk4THY4?=
 =?utf-8?B?V3RsQTJWR084d2FCcXA5L0ZjOXN0VnZZZ2RROHpDYXVlUm1qc29NVEtWZWJs?=
 =?utf-8?B?YzVTUklZditZUUppMFRtQkpIaEowa0NTV3czRTVUeWZuSkRwQmxnRnpuOHRF?=
 =?utf-8?B?QkZzbEVBcXg0QjZuYUhDbnY3L0Z3M1luV1JEeFpwYVVoMytqYS9KQkx3b1py?=
 =?utf-8?B?SU02SWJmcWFjU28zVkkyZEJZc2hlUTViWFhDaWZYbHUwUWFhbDgySVluQ1Bz?=
 =?utf-8?B?QnY2anYrdDZjaERoQWNVdjhaM04zTGhjVit3dEtRNHpDZ1B0MExBUjVKT3FF?=
 =?utf-8?B?MzRtSVZWU3A4SWx1Mnl4cnY2SHlPbjl4L2tpS3Z6U2t2Q1IwNG55OEg0Q1ZQ?=
 =?utf-8?B?Y25seGliMHhVa1lncGRtMlBROWQva1krLzdVcENkd1djMFRSdTVCcnhLZEtw?=
 =?utf-8?B?WDdocXlXYlUyZXhENkNleWJrKzFqN2J4OGQwNVM5eXBCZUUyWEJDMEFsWGpu?=
 =?utf-8?B?a2JrWnRpUUVUT0NCSW0xRHp4Ri84QnZvSGM0d2M2K3FTN2VPOW8rcEgvSnVy?=
 =?utf-8?B?dGRTRlUxYk5KdnlQcUdGQVJpQ1BCSlh2U1VFK1R4czBWQ051SlFHVHhLUXJs?=
 =?utf-8?B?R0w1d1Fza21SNW1pNldmNm5LR1FsVmRIQ0NVSFV6S1NDZFR5dElNbGZSdlZF?=
 =?utf-8?B?c2RiYk9YYzBJYlhGMmJlNXNhVWxoYTBvalM4S2JWQVA0UVZsODJMSW8rZklO?=
 =?utf-8?B?cmdUc2xQS0xBL05BempIdEhqdWt4VlZvUkVWNDU5dUFWa2grdjAxdWhmaUlp?=
 =?utf-8?B?NkNBbk9xUmR1S1UwdkJpTG44eWlqN09pTkpHTlZnaE5PeHRmYTBNS2x5aXhW?=
 =?utf-8?B?VWNKYmxSNVJ6d29WZUtZbmJ1Rml4TzVPdjU1WEh4VitSa1ROQlg3TFF6MWhh?=
 =?utf-8?B?RjFsLzE2bk9BekpYM1lydXNMYkYvSHlnZElIeXZPd2xmMzZIaEM4Q1FDQjRM?=
 =?utf-8?B?akd4cisyV0dFVitwOVZEQjhGM2NRTEY4OW1QbkhTb3F4TE5ZbUFjZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9834c13-cac9-4084-e61c-08de74e9ed2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 03:48:38.8241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mbQ95O0keOEEZL/fgVd1Df+KHC28p1a7UDP1nFfpxdgZfxVwRnRIRSxfcL/DSq3Wud2VX2bWJf9F6iDTMNTCMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7851
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGlndC1kZXYgPGlndC1kZXYt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBOYWxhZGFsYSwg
UmFtYW5haWR1DQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAyNiwgMjAyNiA4OjMyIEFNDQo+
IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IGktZy10XSB0ZXN0cy9pbnRlbC9rbXNfc2hhcnBuZXNzX2ZpbHRlcjogUmVzdHJ1Y3R1cmUNCj4g
bW9kaWZpZXIgdmFsaWRhdGlvbiBpbnRvIHBlci1tb2RpZmllciBzdWJ0ZXN0cw0KPiANCj4gSGkg
UHJhbmF5LA0KPiANCj4gT24gMi8xNy8yMDI2IDM6MDAgUE0sIFByYW5heSBTYW1hbGEgd3JvdGU6
DQo+ID4gUHJldmlvdXNseSwgYWxsIG1vZGlmaWVycyB3ZXJlIGV4ZXJjaXNlZCB3aXRoaW4gYSBz
aW5nbGUgc3VidGVzdCwNCj4gPiBtYWtpbmcgZmFpbHVyZXMvc2tpcHMgaGFyZCB0byBpc29sYXRl
IGFuZCBkZWJ1Zy4NCj4gPiBUaGlzIG5ldyBmbG93IGdlbmVyYXRlcyBleHBsaWNpdCBzdWJ0ZXN0
IG5hbWVzIChmaWx0ZXItbW9kaWZpZXItJXMpDQo+ID4gZm9yIGVhY2ggbW9kaWZpZXIsIGltcHJv
dmluZyBjbGFyaXR5IGFuZCBDSSByZXBvcnRpbmcuDQo+ID4NCj4gPiBFYWNoIHN1YnRlc3Qgbm93
IHZhbGlkYXRlcyBvbmx5IHRoZSBzZWxlY3RlZCBtb2RpZmllciwgYW5kIHVuc3VwcG9ydGVkDQo+
ID4gZm9ybWF0L21vZGlmaWVyIGNvbWJpbmF0aW9ucyBhcmUgY2xlYW5seSBza2lwcGVkLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogUHJhbmF5IFNhbWFsYSA8cHJhbmF5LnNhbWFsYUBpbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gICB0ZXN0cy9pbnRlbC9rbXNfc2hhcnBuZXNzX2ZpbHRlci5jIHwg
MzQgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwg
MjQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
dGVzdHMvaW50ZWwva21zX3NoYXJwbmVzc19maWx0ZXIuYw0KPiA+IGIvdGVzdHMvaW50ZWwva21z
X3NoYXJwbmVzc19maWx0ZXIuYw0KPiA+IGluZGV4IGVkZGZhZDZiOS4uMDE0MDM2M2JjIDEwMDY0
NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19zaGFycG5lc3NfZmlsdGVyLmMNCj4gPiArKysg
Yi90ZXN0cy9pbnRlbC9rbXNfc2hhcnBuZXNzX2ZpbHRlci5jDQo+ID4gQEAgLTIxLDkgKzIxLDYg
QEANCj4gPiAgICAqIFNVQlRFU1Q6IGZpbHRlci1zdHJlbmd0aA0KPiA+ICAgICogRGVzY3JpcHRp
b246IFZlcmlmeSB0aGF0IHZhcnlpbmcgc3RyZW5ndGggKDAtMjU1KSwgYWZmZWN0cyB0aGUgZGVn
cmVlIG9mDQo+IHNoYXJwZW5lc3MgYXBwbGllZC4NCj4gPiAgICAqDQo+ID4gLSAqIFNVQlRFU1Q6
IGZpbHRlci1tb2RpZmllcnMNCj4gPiAtICogRGVzY3JpcHRpb246IFZlcmlmeSBjb250ZW50IGFk
YXB0aXZlIHNoYXJwbmVzcyBmaWx0ZXIgd2l0aCB2YXJ5aW5nDQo+IG1vZGlmaWVycy4NCj4gPiAt
ICoNCj4gPiAgICAqIFNVQlRFU1Q6IGZpbHRlci1yb3RhdGlvbnMNCj4gPiAgICAqIERlc2NyaXB0
aW9uOiBWZXJpZnkgY29udGVudCBhZGFwdGl2ZSBzaGFycG5lc3MgZmlsdGVyIHdpdGggdmFyeWlu
Zw0KPiByb3RhdGlvbnMuDQo+ID4gICAgKg0KPiA+IEBAIC03MCw2ICs2NywxNyBAQA0KPiA+ICAg
ICogICAgICAgICAgICAgIHNoYXJwbmVzcyBmaWx0ZXIuDQo+ID4gICAqLw0KPiA+DQo+ID4gKy8q
Kg0KPiA+ICsgKiBTVUJURVNUOiBmaWx0ZXItbW9kaWZpZXItJXMNCj4gPiArICogRGVzY3JpcHRp
b246IFZlcmlmeSBjb250ZW50IGFkYXB0aXZlIHNoYXJwbmVzcyBmaWx0ZXIgd2l0aCB2YXJ5aW5n
DQo+IG1vZGlmaWVycy4NCj4gPiArICoNCj4gPiArICogYXJnWzFdOg0KPiA+ICsgKg0KPiA+ICsg
KiBAbGluZWFyOglsaW5lYXINCj4gPiArICogQHgtdGlsZWQ6CXgtdGlsZWQNCj4gPiArICogQDQt
dGlsZWQ6CTQtdGlsZWQNCj4gPiArICovDQo+ID4gKw0KPiA+ICAgSUdUX1RFU1RfREVTQ1JJUFRJ
T04oIlRlc3QgdG8gdmFsaWRhdGUgY29udGVudCBhZGFwdGl2ZSBzaGFycG5lc3MNCj4gPiBmaWx0
ZXIiKTsNCj4gPg0KPiA+ICAgLyoNCj4gPiBAQCAtNTk2LDE2ICs2MDQsMjIgQEAgaW50IGlndF9t
YWluX2FyZ3MoImwiLCBOVUxMLCBoZWxwX3N0ciwNCj4gb3B0X2hhbmRsZXIsICZkYXRhKQ0KPiA+
ICAgCQl9DQo+ID4gICAJfQ0KPiA+DQo+ID4gLQlpZ3RfZGVzY3JpYmUoIlZlcmlmeSBjb250ZW50
IGFkYXB0aXZlIHNoYXJwbmVzcyBmaWx0ZXIgd2l0aCAiDQo+ID4gLQkJICAgICAidmFyeWluZyBt
b2RpZmllcnMuIik7DQo+ID4gLQlpZ3Rfc3VidGVzdF93aXRoX2R5bmFtaWMoImZpbHRlci1tb2Rp
ZmllcnMiKSB7DQo+ID4gKwlmb3IgKGludCBpID0gMDsgaSA8IEFSUkFZX1NJWkUobW9kaWZpZXJz
KTsgaSsrKSB7DQo+ID4gICAJCWRhdGEucm90YXRpb24gPSBJR1RfUk9UQVRJT05fMDsNCj4gPiAg
IAkJZGF0YS5mb3JtYXQgPSBEUk1fRk9STUFUX1hSR0I4ODg4Ow0KPiA+ICAgCQlkYXRhLmZpbHRl
cl9zdHJlbmd0aCA9IE1JRF9GSUxURVJfU1RSRU5HVEg7DQo+ID4gLQ0KPiA+IC0JCWZvciAoaW50
IGkgPSAwOyBpIDwgQVJSQVlfU0laRShtb2RpZmllcnMpOyBpKyspIHsNCj4gPiAtCQkJZGF0YS5t
b2RpZmllciA9IG1vZGlmaWVyc1tpXS5tb2RpZmllcjsNCj4gPiAtCQkJZGF0YS5tb2RpZmllcl9u
YW1lID0gbW9kaWZpZXJzW2ldLm5hbWU7DQo+ID4gKwkJZGF0YS5tb2RpZmllciA9IG1vZGlmaWVy
c1tpXS5tb2RpZmllcjsNCj4gPiArCQlkYXRhLm1vZGlmaWVyX25hbWUgPSBtb2RpZmllcnNbaV0u
bmFtZTsNCj4gPiArDQo+ID4gKwkJaWd0X2Rlc2NyaWJlKCJWZXJpZnkgY29udGVudCBhZGFwdGl2
ZSBzaGFycG5lc3MgZmlsdGVyIHdpdGggIg0KPiA+ICsJCQkgICAgICJ2YXJ5aW5nIG1vZGlmaWVy
cy4iKTsNCj4gPiArCQlpZ3Rfc3VidGVzdF93aXRoX2R5bmFtaWNfZigiZmlsdGVyLW1vZGlmaWVy
LSVzIiwNCj4gZGF0YS5tb2RpZmllcl9uYW1lKSB7DQo+ID4gKw0KPiAJaWd0X3NraXBfb25fZigo
IWlndF9kaXNwbGF5X2hhc19mb3JtYXRfbW9kKCZkYXRhLmRpc3BsYXksDQo+ID4gKw0KPiBEUk1f
Rk9STUFUX1hCR1I4ODg4LA0KPiA+ICsNCj4gZGF0YS5tb2RpZmllcikpLA0KPiA+ICsJCQkJICAg
ICAgICJTa2lwcGluZzogTW9kaWZpZXIgIiBJR1RfTU9ESUZJRVJfRk1UDQo+ID4gKwkJCQkgICAg
ICAgIiBpcyBub3Qgc3VwcG9ydGVkIG9uIHRoaXMgcGxhdGZvcm1cbiIsDQo+ID4gKwkJCQkgICAg
ICAgSUdUX01PRElGSUVSX0FSR1MoZGF0YS5tb2RpZmllcikpOw0KPiA+DQo+ID4gICAJCQlydW5f
c2hhcnBuZXNzX2ZpbHRlcl90ZXN0KCZkYXRhLA0KPiBURVNUX0ZJTFRFUl9NT0RJRklFUlMpOw0K
PiBJTUhPLCBJIG9ic2VydmVkIHRoYXQga21zX3NoYXJwbmVzc19maWx0ZXIuYyBjb250YWlucyB0
d28gc2VwYXJhdGUgc2V0cyBvZg0KPiBzdWJ0ZXN0cyBmb3IgcGl4ZWwgZm9ybWF0cyBhbmQgbW9k
aWZpZXJzLiBEdWUgdG8gdGhpcyBzZXBhcmF0aW9uLCBjb3ZlcmFnZSBpcw0KPiBtaXNzaW5nIGZv
ciBvdGhlciBwaXhlbCBmb3JtYXRzIHdoZW4gY29tYmluZWQgd2l0aCBtb2RpZmllcnMuIEN1cnJl
bnRseSwgdGhlDQo+IHRlc3QgY2hlY2tzIG1vZGlmaWVycyBvbmx5IHdpdGggRFJNX0ZPUk1BVF9Y
UkdCODg4OC4NCj4gDQo+IEluc3RlYWQsIHdlIGNhbiBjcmVhdGUgYSBjb21iaW5lZCBzdWJ0ZXN0
IHVzaW5nDQo+IGlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pY19mKCJmaWx0ZXItcGl4ZWwtZm9ybWF0
LSVzLW1vZGlmaWVyLSVzIikuDQo+IA0KPiBUaGlzIHdvdWxkIGFsbG93IHRoZSBzaGFycG5lc3Mg
ZmlsdGVyIHRvIGJlIHRlc3RlZCBhY3Jvc3MgYWxsIHBpeGVsIGZvcm1hdHMgd2l0aA0KPiBhbGwg
bW9kaWZpZXJzLg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcgUmFtYW5haWR1Lg0KV2lsbCBtYWtl
IGEgc3VidGVzdCB3aGljaCBjYW4gY292ZXIgYm90aCBmb3JtYXRzIGFuZCBtb2RpZmllciBjb21i
aW5lZCBpbiBzaW5nbGUgdGVzdC4NCg0KUmVnYXJkcywNClByYW5heQ0KPiANCj4gDQo+ID4gICAJ
CX0NCg==
