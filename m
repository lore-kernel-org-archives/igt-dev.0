Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EF4CC6B01
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 04:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291BC10EE09;
	Thu,  2 Apr 2026 04:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJ0U4nHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E2E10EE09
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 04:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775105679; x=1806641679;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2gwtLih10GeW/03j4Qeh5vHMqxfHYGM+kyWK3q6tsOM=;
 b=YJ0U4nHGTdZ1yZOzPIhs34t4Oq8HldCRm8G9L2o/ZcuwNOLKJIh59Rh6
 H5ICSCPrSDdbSV0BKi0215B0b42ac1qX78CyqCx0x9JqvaP+f/mAmfFU9
 hfsHGxXiDkShPiLQGszV33Z4qbVbQ/uDKzXik8Fxc0dnTC6NvkJnCS1bZ
 +2gOs/5XgBDp3dSIqeFbmWYEaHq2ngB0GrcOeauGJg3Mo7Zfwh3VFLxkk
 jiGZav0mohlnukKqrgweZZ7WYAtZyxh28hqOAIJ/IhiH1bAHHs4vpHflJ
 qclIoj5WS80LquDxDtcgFwQzESdXzecmK8smD3jKt3nb6F/qX//IjhAak A==;
X-CSE-ConnectionGUID: szy59WcZSCaMUF51IzQBYA==
X-CSE-MsgGUID: cCND21IxSzusRRDnFOoO9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="80044468"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="80044468"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 21:54:39 -0700
X-CSE-ConnectionGUID: 1wA5bWLTSZOlFxJfj5/ZXg==
X-CSE-MsgGUID: NxcHeOKmSgyGlAHWME6i0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="225866605"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 21:54:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 21:54:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 21:54:38 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 21:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbnmB1HTwM90ZhdYC62MIAZagHUOFknLRTopaObmd/9DAZxlpptu30O/mJls1n9D0k5d96uN//bNlOBe7Cpir5yxEp9+TVQq+0aVAeSBISzAw+t8xUlxN4/XunDyat2urm2v/9ubC1VfmnLMlwqdmFnAo5sM4MvKy6MBP54y9s8UDkovqsgdM2cZmUY3xemyiERyppnTspuk78MeiMWA1YDuIPHkB0O7Y15M4mu0B5/xw95RiGA81LI/5tlSQVsYRRVZdm0VRNUbmMvEshfTBF6PIPSfBgy+SacVRiM3qlxH4JKRNNl6hCdiQF1Zv1SKt6952iCBn0BcB2N5QkQpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gwtLih10GeW/03j4Qeh5vHMqxfHYGM+kyWK3q6tsOM=;
 b=P7SUSfRp81s360K1ypONAAkABisipE6LpghEKy1F0cKKGiBPZJAu/9KlPPKe4SOrl8KBkwaE/o/zT6orE5zKs6aqW7QfRteuhDdaQ7UcPwlkTWT1c9wkFXPdNHpyfbsi6v/Q2s483Ur6zlhwjEdQt2ONb/zeZkQSjg9ivQnZkkqdWGKagHPe2YRvbRBoF2S+v3p0gBLNmfKPvgR0VXSjzAczfay6wfNmVdr+ohp5f9rvcqFK5JQMdLyCLfX19DS9JcC0M3ZGavvUUVv2eusppcj/jHUtx5gLSNvlL5dBzgOk5edJ87kzhuah3o9DBuC9YQBiM+pkJcvsuLG/LyBkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20)
 by DS7PR11MB6173.namprd11.prod.outlook.com (2603:10b6:8:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 04:54:32 +0000
Received: from SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::25cd:c6ae:55e1:e6c0]) by SA1PR11MB8428.namprd11.prod.outlook.com
 ([fe80::25cd:c6ae:55e1:e6c0%3]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 04:54:32 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/3] lib/intel_compute: Print handle in list of
 bindings
Thread-Topic: [PATCH i-g-t 1/3] lib/intel_compute: Print handle in list of
 bindings
Thread-Index: AQHcwbdoqGY5a9e/skqkAFI07CrXlLXLNgcw
Date: Thu, 2 Apr 2026 04:54:32 +0000
Message-ID: <SA1PR11MB84280E19D0179EF86F839C898D51A@SA1PR11MB8428.namprd11.prod.outlook.com>
References: <20260401091017.2772519-5-zbigniew.kempczynski@intel.com>
 <20260401091017.2772519-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260401091017.2772519-6-zbigniew.kempczynski@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8428:EE_|DS7PR11MB6173:EE_
x-ms-office365-filtering-correlation-id: b3d68750-1ffc-4b4c-4cf9-08de9073ee20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: kqQ4qeleDu3Eu0f82MJJ0UNW3qePc3Ga91r/dfHl4vb1wkjk1r7xHLYY7/TFuLEfiKppU+W3YcREFR43dKTSfXKORd3oB5qhjA3ZR6SInfHeikZht4E1jIt4yIf9hyeddmUWX7Ns8ttuyc+iIhARDfRu4qeSEpyExyFh3eMuFTZ/warI1rEkTOGpgkDEUj+RwLQ/HNgm2Dw/u2flrHUnSwSLA3bl6Ofu1l9MuF+YzESyW+bMLKG5q+QfBeoSC/DEQ0RFru9SV6i4jvRUgruSZhfaPxKeFFDxokmLSzXDBU4oA4VEJyUC0EpoWygAcl65U9oyVNENJopVY7ZNO+fH0n07fbqrh/Vu5t+1P+KRE2H6TRE+V4QJdFelQb6xrZ1grSgOZaMbIG/dNysmbd5X0A3lWnncX8HM+V/tgIXUPses6G73iy8uNSID+WwaCAGpZ+wK3jl+fWYS9Qo15B18dKZKU2VQH3s5BL8UPbcXo+fXnz5QzbPlKVbSu7Xh01nOi8fsh/JNwzh9UStEdD6TtiP66ezi9+N86VXPXemOF9dqJj1okod+XdploZ5MOqakSY+ozREkuk/gmja8zqAwu4ooCvju6lzx98XwkgFx8w9SZAoKTSLk7KVYslHjDG/rP5QGYmYqe91Zcii6hWCizx/WzIH/99KHuh0X1p6y9Y0Zzau8347CdvnYMOo07X9GTzzMDysSc0nmSH3DsN9fbGsyCC1/0MKhehIrla3kn3OigT2rZenlWDR5YfPRq04PlkBeWnqtlAB2bjjuhkMTaUWjAyutfvh4LI+j+vwtMrE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8428.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUhYTitheGxrZ0tFS0hvUFhKblpOVzVSSHFEZlJGQ3ZtNUV5cXJzdFRWTExJ?=
 =?utf-8?B?ejJyUGpqcEJIelhrTzBZR255SnB6QmpaaVY1YThPb3ZzaWJKODhyZC9SeHY2?=
 =?utf-8?B?K2JnUVNDUnc0VU9oa1ZzY0Y4NzRLbDRFdVpKaWpJNCt4N2tZNlZZRkFtWXlw?=
 =?utf-8?B?ZEpqT3YwMGpoYnZDcGFlanR3RGJJcExqMXZoQTArYkwrTHBRaFJkY1g4elFx?=
 =?utf-8?B?RzdSeWlIWVg4bFFzNHNCdDVKcERJZm1OOGpVTE00OEVSbXU0TDMzTGZNbGtC?=
 =?utf-8?B?VUVyRExLb0tSSk90ZTZ5K1I2clBzOEJVamR0bmlNWE53RG5jbmlaOE12ZXZY?=
 =?utf-8?B?SnVVM2s3cTM5ejBIamRCalZFRjZJSnRudm9PVldLN1ZZMWQ4Yk03SmhlYk5q?=
 =?utf-8?B?NFp4Y1h5blRaK2JvdEFZcEMzVmtXOGlQcjhtenVpVW9Mb2xaeU1pQmczUmRh?=
 =?utf-8?B?dUdpUXMrZ0VIdkh6dHJoeEJzT2pJYWRKU0IxaFJscjJ3OEh2b0JhR3RTRjEv?=
 =?utf-8?B?U0hDeWE4OWQ2SitQbDJBU1NNRTZjVjZFUVI5RXZNRWk3ZHFhVnV1TkdxUW5V?=
 =?utf-8?B?N1ZuNHVNWUpveUZnUmg2cEkrcFptNmQzanZVcHdlc1dBYTJ4YkdTVXF5dGVP?=
 =?utf-8?B?R0cvOTVEakd0QUFmOUFxOXBIa21wRDVraWhNNjh0TmVMT2Y2NjV2K01XWnNT?=
 =?utf-8?B?MWtrMmhuWkFOYWFUNm5la0Jvb2dKNmNJNmlLVDJDOTdwMEtPN2VYY0xoRU1Z?=
 =?utf-8?B?UGE2MXJJeE5KK0VzY1ZHcmR5czBhdlNSQXl3YTFvQXVxOXdBbTREVFhlSWVV?=
 =?utf-8?B?aUErSmc2azRtRzBGYVlLazBpdlRiQXFZRkxWOWFtT1hKdmwramtiMHN6cUVp?=
 =?utf-8?B?dXJFZytyNWIwZzlMU3hVVUFTZmg3Zjl5SnBGRm10WFJNT2xJMUwvc09PeDBv?=
 =?utf-8?B?dGNkcmVZU0NFVFFhVlhiR2FFT3RuaExHZHBDTEo4c3MvNHU3cjlyOW55VDlz?=
 =?utf-8?B?QkJQS3N5UGlOQ0VYVUJqUEE0WE1jZXpZVlVFcFVqNzgrdm9za3JEdDlVWnhI?=
 =?utf-8?B?TjdyRUM0aHJJdmZ2cE8zcnNWY1k1L3cxbU51TSsxSHBISUtVVmI4V1VSRHh2?=
 =?utf-8?B?SC8wK1oyNUZhWEFOc2lnRUlUK09wdFM3RWJNUm83Q3JVTDM4U0hXMTNIY2VO?=
 =?utf-8?B?aEZuTHJ4R2ZyU2JmWTFKMFMzWTBsQnZOTE9NQXhMNDEwbDk1Skc1QUJncnZ5?=
 =?utf-8?B?azJHeGlxeFFaYVJ3dDhXR0xTeFRVMFpnQkIwd2dkY1dSQ1ZqSUgveEZWT1Zz?=
 =?utf-8?B?d3MwNmdJdHd3MzZBSVhDWjlVVHBqR01tc2hPRUoveElxUksvK2pkKyt2Qmxr?=
 =?utf-8?B?YUVsZmJ3RmJQNCtwa0ljVU9RMjVpeHV2OUlsZDFtUytKTzVzMW14ckFyeU5R?=
 =?utf-8?B?OFZ4Rm5nbzZITU5qbGRWMExXY04xak9ZWHB1M2J2c3B2QlhpRGM3aURraXFP?=
 =?utf-8?B?RWVTRjdHeHNTVXowU2ZJdTROZVhYNWl4R2lqWGZLZTg1aWh4eHJRc0Njb1NJ?=
 =?utf-8?B?cGFqTnJ0R3dldGZPVmZPbzdGeVRtZER0YWtIS2JYYnBCNDdsWkZXRTgzdFNV?=
 =?utf-8?B?RUd4RVMycWFlQkYyRDJiK0JpOURKSnRwcDlvenBVYnRDNkN3dFgvbHlacVZK?=
 =?utf-8?B?YzZyMU5iZnZYVGpEdTA1c3A0bkZVcktYMUN4TmVsUTA0VjZzWFNwM3RYeisr?=
 =?utf-8?B?K3g4R2ROV3pQbXN0TFI0U0xGYm4yV1JMSUF4NUVpL0xuaTViMlhVY1RMQjZH?=
 =?utf-8?B?S3RqaTdGRnZXNGh1YVkzQUwrMlBIS1dpb3I0Tm5qNlBUc0NQYUxoMnRiSCtE?=
 =?utf-8?B?VFZQakIrV2VWTlRwdjMvdytHMitrMkdxa0ViNnpjYjhXZXlNRXdHWW1YUHZV?=
 =?utf-8?B?WXFIaXBVRGZmNFpITjFiWFJiTXFvQnUwSzdkeHhIaGhwV0NMMllNRFUwUGRP?=
 =?utf-8?B?Z21Rd3MwKzdCR0MrWktnSjFIeVFGQ0tWUElaMU1pZ1Q2YUJJOHNTZkJ2Y1NT?=
 =?utf-8?B?bHRXWGwrZ2VyOG1tNXYxZ2wyMUxHOGJZc1RoblEvdUJ1dlJQMzYrUFYrS3hM?=
 =?utf-8?B?WXY0U0dHZVJTZ09CRjZpdjBVRGFTUGtIVU8xN0VKUlZIZ2lWTFNPZERyandG?=
 =?utf-8?B?NXJ0MTM0U3llell4VGJ3ZlMrQlJoVmlHVGN0NlEzS0JYMW9OSGNUaWVyVTl4?=
 =?utf-8?B?SWIwakNPZm02VWNqY0d5cnV0VmFIWUZ1cmtwUDU3M0ZLUjR2WU13c085TGEx?=
 =?utf-8?B?NDd4TDhCcnpqREM0UlduOG5EUGtJbC9GQ3pKdHZDV0NmNXEwS0hSS2pJZlJk?=
 =?utf-8?Q?M7UwiSDV01s3tzIOTnizAwwBMfZiwlbVXVBuM5Z2R0sFu?=
x-ms-exchange-antispam-messagedata-1: Gy5VteRUmBHY3V97lZ61El+XRC1FIJh+1ps=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: p17jE4xisp4/y74W6SihZAZEZ7WXwndFFHZS4lxcX/bJs0CEqoZ8qxy5ARZcSysWK8ExhoUBLFtgHGvDlsiOKspbhIoNUOyWhDltrdmNriW9kQ4CH0pBd1jGmvQ1oHqnfi/0e7SjOcSN70P+D5txBmoxz5NaIj5eifacUAh8qFmH4qhWAUPow9r5eF7k3DiQsqlEgQVz7XoqZmi+KxMWBCAbalH6poDDmVOx0ZfF3CZeJ00vS/3MxHlrc6sN/DOtjbx1QJ4uSC3QEc87AwFyQkS93fiEzo3b6lw+vf3Vcnny2l6RgDp6I5Oo84RKs7a1IG2EcK6TfQD9/kFG38FEEA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d68750-1ffc-4b4c-4cf9-08de9073ee20
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 04:54:32.3702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PKAH5Knh7r40kjz5ch2YvUYikquUguUkJHH3s4KMh2eFSHZO6A/cXoIYPTpD1oymJSykNP9q82oBzZTRUbFuBhSCvYM+/RKADq4UWCb44gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6173
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2VtcGN6eW5za2ksIFpi
aWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNlbnQ6IDAxIEFwcmls
IDIwMjYgMDI6NDAgUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47
IERhbmRhbXVkaSwNCj4gUHJpeWFua2EgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+
IFN1YmplY3Q6IFtQQVRDSCBpLWctdCAxLzNdIGxpYi9pbnRlbF9jb21wdXRlOiBQcmludCBoYW5k
bGUgaW4gbGlzdCBvZiBiaW5kaW5ncw0KPiANCj4gQWRkIGhhbmRsZSBkdXJpbmcgcHJpbnRpbmcg
Ym8gYmluZGluZ3MgaW4gY29tcHV0ZSBsaWJyYXJ5LiBJdCBpcyB1c2VmdWwgdG8NCj4gZGVidWcg
d2hhdCdzIHdyb25nIHdoZW4gdXNlciBwYXNzZXMgaXRzIG93biBlbnYuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVs
LmNvbT4NCj4gQ2M6IFByaXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVs
LmNvbT4NCj4gLS0tDQo+ICBsaWIvaW50ZWxfY29tcHV0ZS5jIHwgNCArKy0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2xpYi9pbnRlbF9jb21wdXRlLmMgYi9saWIvaW50ZWxfY29tcHV0ZS5jIGluZGV4DQo+IGIz
MzM2YTdiNWIuLjdkZGE0MjNjODAgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pbnRlbF9jb21wdXRlLmMN
Cj4gKysrIGIvbGliL2ludGVsX2NvbXB1dGUuYw0KPiBAQCAtMzUyLDggKzM1Miw4IEBAIHN0YXRp
YyB2b2lkIGJvX2V4ZWNlbnZfYmluZChzdHJ1Y3QgYm9fZXhlY2Vudg0KPiAqZXhlY2VudiwNCj4g
IAkJCQltZW1zZXQoYm9fZGljdFtpXS5kYXRhLCAwLCBib19kaWN0W2ldLnNpemUpOw0KPiAgCQkJ
fQ0KPiANCj4gLQkJCWlndF9kZWJ1ZygiW2k6ICUyZCBuYW1lOiAlMjBzXSBkYXRhOiAlcCwgYWRk
cjoNCj4gJTE2bGx4LCBzaXplOiAlbGx4XG4iLA0KPiAtCQkJCSAgaSwgYm9fZGljdFtpXS5uYW1l
LCBib19kaWN0W2ldLmRhdGEsDQo+ICsJCQlpZ3RfZGVidWcoIltpOiAlMmQgbmFtZTogJTIwc10g
ZGF0YTogJXAsIGhhbmRsZToNCj4gJXUsIGFkZHI6ICUxNmxseCwgc2l6ZTogJWxseFxuIiwNCj4g
KwkJCQkgIGksIGJvX2RpY3RbaV0ubmFtZSwgYm9fZGljdFtpXS5kYXRhLA0KPiBib19kaWN0W2ld
LmhhbmRsZSwNCj4gIAkJCQkgIChsb25nIGxvbmcpYm9fZGljdFtpXS5hZGRyLA0KPiAgCQkJCSAg
KGxvbmcgbG9uZylib19kaWN0W2ldLnNpemUpOw0KPiAgCQl9DQpMR1RNLA0KUmV2aWV3ZWQtYnk6
IFByaXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCj4gLS0N
Cj4gMi40My4wDQoNCg==
