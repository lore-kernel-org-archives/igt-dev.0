Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB4AD7877B
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 15:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147C210E98D;
	Thu, 21 Nov 2024 15:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyL1DiC+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A6F10E98D
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732202129; x=1763738129;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=NrB0f4qXQoBeuqUXrZp/C0qiq/ogKBamOdPoTsX6jy8=;
 b=cyL1DiC+Qrgs+7KuC/MdcMyATrXzT0RVqULC+UV9wh9XLKgDMwoYClZb
 O43BYlJiXXOVCLog1k/AMoQXbnKahXQUpd1UHgiCUhz80rQTfuAHi9Wax
 d/+v86LYJ7AOo3fHKiG9rMuY8jdzQntbsEr4V9Vj3k4VXNbyc9fFIaTp0
 552mbrG4v6P9ztNvSNCX2jCTp5iIFBcTpxJuP2ZNASgpHe8SXM5J/aeqS
 SaO0FInt2JDEHpozsPX7c0opHbBNL0jgSqjrho3Q9c6Qbt7cdlrgkcKUx
 g/TjYUN3sO8DwM9uMsuZBjozDcKs98GC0ajqkGuwfRFrnQ4QdeV1uUp3q w==;
X-CSE-ConnectionGUID: MqmeH+SoQru9w/B7nlNcfw==
X-CSE-MsgGUID: sbBj0KI8QUucMXjZCRvKtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32067622"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32067622"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 07:15:29 -0800
X-CSE-ConnectionGUID: J5iEgw5LTC6QV4+CEd3Gtg==
X-CSE-MsgGUID: Y20nohIZQISYoztNwj/MKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="121147152"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 07:15:28 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 07:15:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 07:15:28 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 07:15:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yU8AfzzgChhluj+4oiQX1OuUeVS/Ebwt7TwW9N1NxRZXj26ggJPTIBFIxu70IFuZM89Lvb5iemRohHw3/7jT2ZjkJcYRpzGwpAYi6MQ9uzWOmGavdNwPgOnX/hPGht7DgUc2OpwbomY8imfeYj/D3zAj9c8il4aBa3f/10Lk512/DKmklvqMqKdytqrgUK++RUAK4fpToHrGYY7te8Z3z2lCoNtMeVDpa39yy9gYFckv5a/cvLA7gyx8+BoJYkJEezMJZ01WEnE0GwJaXyQ/deKT5B/G39zauFjlo9Vu/kFYWvTxeLKoVI12zN/8qpolUBniGerfAp4gHpgGeGmefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrB0f4qXQoBeuqUXrZp/C0qiq/ogKBamOdPoTsX6jy8=;
 b=JvIU7dMOdoHo8hB3jGiDOa7SzGjWk2FjSc/0K20xIqd6X+7zx3GRd2Q1Ug74WM9jZGXj73tSAR+w37pw0ONqnWoBMUotr0rZDz/f0AXWJD6HwMUzg7wMZZhT6+vuEejm2eH0ZWZ45TncuaOtpNqrZZSPCXUdQLVTMXivKk/sj9ZjFu2a3yVMIJf1x0bPGN7qHacz4OJNcI1AAULCtMcczXcoEmTvpOPB/UYxmKDgqfIXRNw8NxmPZtdY1DjZSW8MP7m7ZY4fTaNEpQhGITs0+CHMBgqLp2lt1FlSwxvaRO/6UFKmrgiPJNyTye5b/YGheBMcsfvIjJGT7nCw2OjcZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by DS0PR11MB6496.namprd11.prod.outlook.com (2603:10b6:8:c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 15:15:20 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8158.024; Thu, 21 Nov 2024
 15:15:18 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 5/6] tests/gem_gpgpu_fill: Add width/height/x/y
 command line args
Thread-Topic: [PATCH i-g-t v4 5/6] tests/gem_gpgpu_fill: Add width/height/x/y
 command line args
Thread-Index: AQHbPBGhOWH/cUOjykCZxD0/35sTzLLB2DMA
Date: Thu, 21 Nov 2024 15:15:18 +0000
Message-ID: <404baf919685f2984cfaed17772af4c3b5b2f1b1.camel@intel.com>
References: <20241121123308.98158-1-zbigniew.kempczynski@intel.com>
 <20241121123308.98158-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241121123308.98158-6-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|DS0PR11MB6496:EE_
x-ms-office365-filtering-correlation-id: 7240cc09-5baf-4a6c-1a14-08dd0a3f4f44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dmg2VkdXN2p6YVJtdHhyUnVoa2VkSkpaWDVnclRsMWNHWkhLWm5waEFKWXMy?=
 =?utf-8?B?QXNUZmcxUTMvc3ZZMk9WUlZmZ3JzY0paT0ppeUN0QnhYdXF2a2VTUmEzWjcx?=
 =?utf-8?B?V2o1ZUM3OVU4bUszWlhuVzlBY09GQjRyREtuakNybmhzNFFneDBsZTBNV0p1?=
 =?utf-8?B?VXN6OXdyZ0RWelZBYmpDNXI3WUxuTEl2SWtsVDlteC9ScnFXaVFyME5EVnhz?=
 =?utf-8?B?Q1owdUlWRVpFOXBwTWt6QXJUUTIrRWorcDlmMURNNG9uWXphZ1FuQ21CSUdP?=
 =?utf-8?B?VFJRQ1hsTWV4YXIyS1o3MVdFdkg5bWgyamxialJKTDkwd0s2Q0xaSWpKcDdE?=
 =?utf-8?B?S0tma1VJeldFRVhXbThlZm1SaWVhU0R5OUhvRWtQZlRvNGRjeTAwSHJMeVk0?=
 =?utf-8?B?dWFDUkFHUEEzeDY4UFJsWXRIVkxQTHRvRXd5VkdKL1lUaXZ4NmpoYldYRmR0?=
 =?utf-8?B?WWtYT2ZoNEEzUzVaVDl4U2piQkljVmVMMW91dWgrVitwWjVndURsMVRacHBH?=
 =?utf-8?B?dm1ISGk4K0FtVzVTdFFoMWt0NGdJWTRZNmlseWlkcy9Yc1lUejF2K3hDa3dX?=
 =?utf-8?B?Q2NNOUE3SzJDRjJmcFU0MklTMzRoZHk2aGJCalptWVRFdkpqNVdtQ0I2SzRZ?=
 =?utf-8?B?NFJDR2FZQlltWmt5V2ptRlRVU3BYZ3R4VXdkWEptWkdmTlVaTlNLanF6K0tZ?=
 =?utf-8?B?ajhqQjJFQWV6VWkvMFd3SzlsbFJENFQvVnQrdDQyY25RZWFrc3B2RmpKOTJ0?=
 =?utf-8?B?cU8wcXBmVEZmNmlWbFBsVElyTmZBMThtU3VvMnhwdnhpYy9WUnBxc0VzcURE?=
 =?utf-8?B?ZnVFQnlFd1RONWlGUHNIUEphamVHeG5pdnhJM0cvVkFINVJXTXZTQ1dOQ3h6?=
 =?utf-8?B?UTVIN0JEa0F1TFNpa0dheHdDa0NKZFRNaC85b1RDd01YMUZlbTdZenl6M1A1?=
 =?utf-8?B?QmwraTAvNWxsdFUxMmVqcU5RYzVRNUJFa25jWVBQRDNBVlNqT3FObWlqSUdG?=
 =?utf-8?B?eHNYY0gwV2V1cEdXY2orVHpZQllIMmFYdnVzZmNOMEZjOFNmc242Nms3anJ6?=
 =?utf-8?B?bHQxU1N5OTd4SndkL3lUaWorWUszaXk4b3UwTDBuNWY3MTRXUU8zQ1VadmJE?=
 =?utf-8?B?K3Q1UUE4aVRkSURlT0U2WTVIbjlTNUdHRUtaUHAzTEE3SXlRVkYrS1ZzRktF?=
 =?utf-8?B?ZWp4ZWRub3NTNkRTd1Rsa2kwYjVsOUR2VFJ1a2NHcW1ENlZZMU1TTm1NK3FJ?=
 =?utf-8?B?WGJSL2txT0hyQlhEVHZDWG9Vd29QeWtHMWNRZm9CemZoNG0zRmhWWjhYWlJK?=
 =?utf-8?B?N1JqR3NFMWROMDNiVmxNTG16NURySDlnNTFuMTBlQjZBNUszd2NFZXVUS0RQ?=
 =?utf-8?B?VW1nLzRIY0lxT0ZsOC81MkJwaTB5N0h4M1pqaDNGQzY5TGtkR1UvdGxLT092?=
 =?utf-8?B?a2puOXVLNUdVN2hSK1lmMTZQMjc0clQzQXhoWjQ4NE9RZi9TU0lZVVU0cFhx?=
 =?utf-8?B?VWwwZkNGWTQ3aXQwSGllMzd1anRqWlZtS2Fua3YxeVlRK1plcWpXZHVjdFFZ?=
 =?utf-8?B?ajVpdDJ3bEVqaW5FSlQwMXcyMm53R0dIcnYvYmlWZktXakdhZzRjcHpTYUVX?=
 =?utf-8?B?TDNod3dKSGZzb1BCdGU2cHZaQi9kMmJlME5ndjVBN1g2NitteDM3bWVkK2tL?=
 =?utf-8?B?VlU3S2wzbjFRQUJaZHd3MGlpeDlYWDVvRXA1V0EzSE81SkVJS282VFZGV2JO?=
 =?utf-8?B?S1MyNmpSNEVoUDhqMk14K2s3Q05MWjMzbGtQbjEwVTd0aXgwdzg4RHpSbzFZ?=
 =?utf-8?Q?JDQz8HvoYPmfzoBD1/O8+hfoWBOZ5fo7hWJoU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjhhakZBNVVjZ1IzNERPWXFkamlFMjZ1a294MGRicUhUMEYveVlBQlJDczhP?=
 =?utf-8?B?d2ZKZHJnb0tpeDdEVjE4Wk9lSmFNWGdGT3Y0VXBralR0WERzMkQwRHMzZjBY?=
 =?utf-8?B?K1VqY2VSNnZ3Zkh3ZFFqMGdmczVSMmxLTTlGMWRCRWRWcy9aakxSdGJnQUla?=
 =?utf-8?B?UjJObGYrZU5KdVVqWHR2VDVtTjlpNkg1ZzFDd1NJamRYQmZOV05Fbk5wSFNC?=
 =?utf-8?B?RUlzYzR2djJOZlAzMzhzN3lSeU1iNEJQc0pVc3Y4bWNNTFVETjV2U1YzTFZv?=
 =?utf-8?B?MDk5WDlsRVc1L0dpRng4Ni9hQkZRSkk2MWFzMUZUNzRWOVFJOEZGVVhLWjh5?=
 =?utf-8?B?Ykpsb1FXWVhCT3c3UVlPbE1mT3VGK2Y0dEtudWlMTEt6dnVOa2FKRFg2R2N3?=
 =?utf-8?B?TnVvM0YvMGxmVXFKR0M1eDVSSEUxQnhDQzgrZnFhTisvK2ZjTFNIeDZZZkdt?=
 =?utf-8?B?TzlHb3B1QnE5cGFTTzN0RXpXci9SZnhUT3V1U0lEQlFuSXdPYnJ4N2d3d2xV?=
 =?utf-8?B?Wmp5a3hUaWIxeXdJSEt4TDkwVytiZnpFWld4S09tY2JWc1pwYno4cjNseW9W?=
 =?utf-8?B?UWdvSkp1S2k4V25aSW9FM1ZLTjlqTkNqQllRWk5nSCtCeGlnd2hoYnY3VTI0?=
 =?utf-8?B?R0Zwb0JiSmthckVsWUViUnNwaHUzVnN2NGVlbmVHMGlaMkVyYlZ2K1A3UEtC?=
 =?utf-8?B?TGdrWUZUTkZjK1l3TVZPNFhHT0ExcVgrS2FTb0p4L3MzVUhtL3Z4V0p5WTR3?=
 =?utf-8?B?ZmVMUFZBbkFmRTVwU2prK3dlOHErNXVEM3VwSUZ0UnlrYnl4dGhqYjRGUm1o?=
 =?utf-8?B?VTJxa0I2bks1aDhOZU0zMkltNkxGT0U2QStxNkFNTGZXOXR3ajhxaE8rSzZJ?=
 =?utf-8?B?d214L3RLQnJHQlJjcDdPUkJ1RXZudjI1YnhwVUdkYUJzL1Y0NCtYK2VFZTZM?=
 =?utf-8?B?OFFpMFBIYXByQVJGaFhiSXBjRWVGUDlxc0poaUFDOWFHS3Z5Q0NLYVkva1A4?=
 =?utf-8?B?TC92TkdwbmtzQUpFbXI0RWxvdkRyV01GbFNFS0JTWXh0S3pqRUhvMWZ3REtQ?=
 =?utf-8?B?My9qa2c2UGZQRTFkSEViY3BUeTZYbHB1VWtZVXZjZE9IUHlTbEI3MWtodnQx?=
 =?utf-8?B?cmNkVU9FVzFheGtSNWI1UzcvT0lHVFo0ZzRYRC9jR2NNWFAxSmw3VjJTU1Bn?=
 =?utf-8?B?V0lCbG4wOEhOZ2cxTzBZVkVSanpiOWJMTGJ5elVCRzE1ZlB2TmNnYjhCWXVW?=
 =?utf-8?B?eVhJUDNGTEZiQmRWdVd2Vzc4a0JwekcrZFIxL1VIOTVkWVVaWUN4SEtoMEdy?=
 =?utf-8?B?RVh3RXJTR2lJYkQwMElwTFpnR3hscVR1S3hsNFVOcDVaZnFyK0FSeURVdDBW?=
 =?utf-8?B?ajdPMXVmcHNMc2dCTCtlTVRzd1pTaVBUTXFVaG5uSGJNazM5akNxUXlmeXYr?=
 =?utf-8?B?TFlleXd2WGJ1czc3c3Z1aHVwUkk3eDVTRUxQb3RFVXBzTGViWTBGT1l0R3dl?=
 =?utf-8?B?OG1HdzZKOE1YNThpaWhMMnNnSE8rbWEwUURrQXF4ZmJLQWxBYjVQek45dENl?=
 =?utf-8?B?UGdXL0k3MGFMb1pVMm5UbW50R2J4b1UwTlgvVHFWOTVhMFl6dmRtZWsxY0gv?=
 =?utf-8?B?Y2NkTVFCSlo3QlhkRkdpRUxmNVE1aGRtYk9WZ2x6RUtWUWVGTitKRHZ0b3Fz?=
 =?utf-8?B?SnZpYXordHBCaDhmQXk4QzV3dlBRc2l0ZkpBMEIzOXZHdG5SNzRVa0xKaGY4?=
 =?utf-8?B?ekNHNFRjSXZVdmxDWFRDMVZycGpDOGdrVDlsY0lwWHpYNzJFZUhNOVdYdnQ2?=
 =?utf-8?B?TEl3Nm1mT3ZoWkJnbUxwaVNZc01sL3NUUmo0aHQvYnhZaXROSkhEUE1nRmtu?=
 =?utf-8?B?NnBaSXZrZmdrMHRScThwbSsrNXFEVFhNUFA2WmNzQ1ZyaUZraXFIVy95V09x?=
 =?utf-8?B?YmpPWU4zY1BFMkN1bURFemVMaFNFRnFKRXJOTDNQODlhc3A4ZERyU3NiYVA1?=
 =?utf-8?B?ZzJDNjd0MnFXWTlvNEZDM2Y2VStucWtZcXNJZkd0NmlzWERTYTRMQzI2MXhT?=
 =?utf-8?B?YnhJeUlxajFxM1kwMnV4Y0ZpSDBCWFp2RHlhZDJFaFlhcmdiQzhJMFFRQ0xj?=
 =?utf-8?B?TDRBam9NUVhQUFR4eVZnWlU1ZnRmaGJTNmZZU2c2ZDdFaTk4N1lsNVFUcnlR?=
 =?utf-8?Q?rqNfiK7CujsxjD8g69J7CzM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70EC7A644E8C574D90EB3C1A8841472B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7240cc09-5baf-4a6c-1a14-08dd0a3f4f44
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 15:15:18.5417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sxSNNpG3k2HngaXKPz0BNFS6YQMhViP8166eazvj/uvC7SEdpBLktrH/Tu6R0zSxZOH7hpmtntq2Zh72aH88o2aI4YeH4Zk0b7uFCrcyduY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6496
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

T24gVGh1LCAyMDI0LTExLTIxIGF0IDEzOjMzICswMTAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IEkndmUgbm90aWNlZCBzaGFkZXJzL3BpcGVsaW5lcyBoYXZlIGxpbWl0YXRpb24g
dG8gd29yayBvbiAxNkINCj4gYm91bmRhcmllcyAoZHVlIHRvIFNJTUQxNikuIFNvIHRvIHBsYXkg
d2l0aCBkaWZmZXJlbnQgc3VyZmFjZSBzaXplcw0KPiBhbmQgb2Zmc2V0cyBhZGQgVy9IL1gvWSBz
d2l0Y2hlcy4NCj4gDQo+IFRoZXJlJ3Mgbm8gcHJvYmxlbSBhdCBhbGwgbm90IGFsbCBzaXplcy9v
ZmZzZXRzIGFyZSBzdXBwb3J0ZWQgYXMgd2UNCj4gd291bGQgbGlrZSB0byBoYXZlLCB3ZSB1c2Ug
Z3BncHUgZmlsbCB0byB2ZXJpZnkgY29tcHV0ZSB3b3JrbG9hZCBzbw0KPiBpZiB3ZSB3b24ndCBu
b3RpY2UgZ3B1IGhhbmcgdGhhdCdzIGZpbmUuDQoNClRoaXMgc2VudGVuY2Ugc291bmRzIGEgYml0
IHVuY2xlYXIgdG8gbWUuIE1heSBJIGFzayB5b3UgdG8gcmVwaHJhc2UgdGhhdA0KdGhhdCBwYXJh
Z3JhcGggaW4gYm90aCB4ZSBhbmQgZ2VtIHBhdGNoZXMuDQoNCkFueXdheSBpdCBpczoNClJldmll
d2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3Lmtl
bXBjenluc2tpQGludGVsLmNvbT4NCj4gQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5n
cnplZ29yemVrQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC9nZW1fZ3BncHVfZmls
bC5jIHwgNjIgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaW50ZWwvZ2VtX2dwZ3B1X2ZpbGwuYyBiL3Rlc3RzL2ludGVsL2dlbV9ncGdw
dV9maWxsLmMNCj4gaW5kZXggMzZjNjBlNzVmMC4uZWMzNGU5NTg0NCAxMDA2NDQNCj4gLS0tIGEv
dGVzdHMvaW50ZWwvZ2VtX2dwZ3B1X2ZpbGwuYw0KPiArKysgYi90ZXN0cy9pbnRlbC9nZW1fZ3Bn
cHVfZmlsbC5jDQo+IEBAIC02OCw2ICs2OCwxMCBAQA0KPiAgI2RlZmluZSBDT0xPUl80QwkweDRj
DQo+ICANCj4gIHN0YXRpYyBib29sIGR1bXBfc3VyZmFjZTsNCj4gK3N0YXRpYyB1aW50MzJfdCBz
dXJmd2lkdGggPSBXSURUSDsNCj4gK3N0YXRpYyB1aW50MzJfdCBzdXJmaGVpZ2h0ID0gSEVJR0hU
Ow0KPiArc3RhdGljIHVpbnQzMl90IHN0YXJ0X3g7DQo+ICtzdGF0aWMgdWludDMyX3Qgc3RhcnRf
eTsNCj4gIA0KPiAgdHlwZWRlZiBzdHJ1Y3Qgew0KPiAgCWludCBkcm1fZmQ7DQo+IEBAIC0xMDMs
MTcgKzEwNywyMCBAQCBjcmVhdGVfYnVmKGRhdGFfdCAqZGF0YSwgaW50IHdpZHRoLCBpbnQgaGVp
Z2h0LCB1aW50OF90IGNvbG9yLCB1aW50MzJfdCByZWdpb24pDQo+ICAJcmV0dXJuIGJ1ZjsNCj4g
IH0NCj4gIA0KPiAtc3RhdGljIHZvaWQgYnVmX2NoZWNrKHVpbnQ4X3QgKnB0ciwgaW50IHgsIGlu
dCB5LCB1aW50OF90IGNvbG9yKQ0KPiArc3RhdGljIHZvaWQgYnVmX2NoZWNrKHVpbnQ4X3QgKnB0
ciwgaW50IHdpZHRoLCBpbnQgeCwgaW50IHksIHVpbnQ4X3QgY29sb3IpDQo+ICB7DQo+ICAJdWlu
dDhfdCB2YWw7DQo+ICANCj4gLQl2YWwgPSBwdHJbeSAqIFdJRFRIICsgeF07DQo+ICsJdmFsID0g
cHRyW3kgKiB3aWR0aCArIHhdOw0KPiAgCWlndF9hc3NlcnRfZih2YWwgPT0gY29sb3IsDQo+ICAJ
CSAgICAgIkV4cGVjdGVkIDB4JTAyeCwgZm91bmQgMHglMDJ4IGF0ICglZCwlZClcbiIsDQo+ICAJ
CSAgICAgY29sb3IsIHZhbCwgeCwgeSk7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyB2b2lkIGdwZ3B1
X2ZpbGwoZGF0YV90ICpkYXRhLCBpZ3RfZmlsbGZ1bmNfdCBmaWxsLCB1aW50MzJfdCByZWdpb24p
DQo+ICtzdGF0aWMgdm9pZCBncGdwdV9maWxsKGRhdGFfdCAqZGF0YSwgaWd0X2ZpbGxmdW5jX3Qg
ZmlsbCwgdWludDMyX3QgcmVnaW9uLA0KPiArCQkgICAgICAgdWludDMyX3Qgc3VyZl93aWR0aCwg
dWludDMyX3Qgc3VyZl9oZWlnaHQsDQo+ICsJCSAgICAgICB1aW50MzJfdCB4LCB1aW50MzJfdCB5
LA0KPiArCQkgICAgICAgdWludDMyX3Qgd2lkdGgsIHVpbnQzMl90IGhlaWdodCkNCj4gIHsNCj4g
IAlzdHJ1Y3QgaW50ZWxfYnVmICpidWY7DQo+ICAJdWludDhfdCAqcHRyOw0KPiBAQCAtMTIzLDE3
ICsxMzAsMTcgQEAgc3RhdGljIHZvaWQgZ3BncHVfZmlsbChkYXRhX3QgKmRhdGEsIGlndF9maWxs
ZnVuY190IGZpbGwsIHVpbnQzMl90IHJlZ2lvbikNCj4gIAlwdHIgPSBnZW1fbW1hcF9fZGV2aWNl
X2NvaGVyZW50KGRhdGEtPmRybV9mZCwgYnVmLT5oYW5kbGUsIDAsDQo+ICAJCQkJCWJ1Zi0+c3Vy
ZmFjZVswXS5zaXplLCBQUk9UX1JFQUQpOw0KPiAgDQo+IC0JZm9yIChpID0gMDsgaSA8IFdJRFRI
OyBpKyspDQo+IC0JCWZvciAoaiA9IDA7IGogPCBIRUlHSFQ7IGorKykNCj4gLQkJCWJ1Zl9jaGVj
ayhwdHIsIGksIGosIENPTE9SXzg4KTsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgc3VyZl93aWR0aDsg
aSsrKQ0KPiArCQlmb3IgKGogPSAwOyBqIDwgc3VyZl9oZWlnaHQ7IGorKykNCj4gKwkJCWJ1Zl9j
aGVjayhwdHIsIHN1cmZfd2lkdGgsIGksIGosIENPTE9SXzg4KTsNCj4gIA0KPiAgCWZpbGwoZGF0
YS0+ZHJtX2ZkLCBidWYsIDAsIDAsIFdJRFRIIC8gMiwgSEVJR0hUIC8gMiwgQ09MT1JfNEMpOw0K
PiAgDQo+ICAJaWYgKGR1bXBfc3VyZmFjZSkgew0KPiAtCQlmb3IgKGogPSAwOyBqIDwgSEVJR0hU
OyBqKyspIHsNCj4gKwkJZm9yIChqID0gMDsgaiA8IHN1cmZfaGVpZ2h0OyBqKyspIHsNCj4gIAkJ
CWlndF9pbmZvKCJbJTA0eF0gIiwgaik7DQo+IC0JCQlmb3IgKGkgPSAwOyBpIDwgV0lEVEg7IGkr
Kykgew0KPiAtCQkJCWlndF9pbmZvKCIlMDJ4IiwgcHRyW2ogKiBIRUlHSFQgKyBpXSk7DQo+ICsJ
CQlmb3IgKGkgPSAwOyBpIDwgc3VyZl93aWR0aDsgaSsrKSB7DQo+ICsJCQkJaWd0X2luZm8oIiUw
MngiLCBwdHJbaiAqIHN1cmZfaGVpZ2h0ICsgaV0pOw0KPiAgCQkJCWlmIChpICUgNCA9PSAzKQ0K
PiAgCQkJCQlpZ3RfaW5mbygiICIpOw0KPiAgCQkJfQ0KPiBAQCAtMTQxLDEyICsxNDgsMTMgQEAg
c3RhdGljIHZvaWQgZ3BncHVfZmlsbChkYXRhX3QgKmRhdGEsIGlndF9maWxsZnVuY190IGZpbGws
IHVpbnQzMl90IHJlZ2lvbikNCj4gIAkJfQ0KPiAgCX0NCj4gIA0KPiAtCWZvciAoaSA9IDA7IGkg
PCBXSURUSDsgaSsrKQ0KPiAtCQlmb3IgKGogPSAwOyBqIDwgSEVJR0hUOyBqKyspDQo+IC0JCQlp
ZiAoaSA8IFdJRFRIIC8gMiAmJiBqIDwgSEVJR0hUIC8gMikNCj4gLQkJCQlidWZfY2hlY2socHRy
LCBpLCBqLCBDT0xPUl80Qyk7DQo+ICsJZm9yIChpID0gMDsgaSA8IHN1cmZfd2lkdGg7IGkrKykN
Cj4gKwkJZm9yIChqID0gMDsgaiA8IHN1cmZfaGVpZ2h0OyBqKyspDQo+ICsJCQlpZiAoaSA+PSB4
ICYmIGkgPCB3aWR0aCArIHggJiYNCj4gKwkJCSAgICBqID49IHkgJiYgaiA8IGhlaWdodCArIHkp
DQo+ICsJCQkJYnVmX2NoZWNrKHB0ciwgc3VyZl93aWR0aCwgaSwgaiwgQ09MT1JfNEMpOw0KPiAg
CQkJZWxzZQ0KPiAtCQkJCWJ1Zl9jaGVjayhwdHIsIGksIGosIENPTE9SXzg4KTsNCj4gKwkJCQli
dWZfY2hlY2socHRyLCBzdXJmX2hlaWdodCwgaSwgaiwgQ09MT1JfODgpOw0KPiAgDQo+ICAJbXVu
bWFwKHB0ciwgYnVmLT5zdXJmYWNlWzBdLnNpemUpOw0KPiAgfQ0KPiBAQCAtMTU3LDYgKzE2NSwx
OCBAQCBzdGF0aWMgaW50IG9wdF9oYW5kbGVyKGludCBvcHQsIGludCBvcHRfaW5kZXgsIHZvaWQg
KmRhdGEpDQo+ICAJY2FzZSAnZCc6DQo+ICAJCWR1bXBfc3VyZmFjZSA9IHRydWU7DQo+ICAJCWJy
ZWFrOw0KPiArCWNhc2UgJ1cnOg0KPiArCQlzdXJmd2lkdGggPSBhdG9pKG9wdGFyZyk7DQo+ICsJ
CWJyZWFrOw0KPiArCWNhc2UgJ0gnOg0KPiArCQlzdXJmaGVpZ2h0ID0gYXRvaShvcHRhcmcpOw0K
PiArCQlicmVhazsNCj4gKwljYXNlICdYJzoNCj4gKwkJc3RhcnRfeCA9IGF0b2kob3B0YXJnKTsN
Cj4gKwkJYnJlYWs7DQo+ICsJY2FzZSAnWSc6DQo+ICsJCXN0YXJ0X3kgPSBhdG9pKG9wdGFyZyk7
DQo+ICsJCWJyZWFrOw0KPiAgCWRlZmF1bHQ6DQo+ICAJCXJldHVybiBJR1RfT1BUX0hBTkRMRVJf
RVJST1I7DQo+ICAJfQ0KPiBAQCAtMTY3LDEwICsxODcsMTQgQEAgc3RhdGljIGludCBvcHRfaGFu
ZGxlcihpbnQgb3B0LCBpbnQgb3B0X2luZGV4LCB2b2lkICpkYXRhKQ0KPiAgDQo+ICBjb25zdCBj
aGFyICpoZWxwX3N0ciA9DQo+ICAJIiAgLWRcdER1bXAgc3VyZmFjZVxuIg0KPiArCSIgIC1XXHRX
aWR0aCAoZGVmYXVsdCA2NClcbiINCj4gKwkiICAtSFx0SGVpZ2h0IChkZWZhdWx0IDY0KVxuIg0K
PiArCSIgIC1YXHRYIHN0YXJ0IChhbGlnbmVkIHRvIDQpXG4iDQo+ICsJIiAgLVlcdFkgc3RhcnQg
KGFsaWduZWQgdG8gMSlcbiINCj4gIAk7DQo+ICANCj4gIA0KPiAtaWd0X21haW5fYXJncygiZCIs
IE5VTEwsIGhlbHBfc3RyLCBvcHRfaGFuZGxlciwgTlVMTCkNCj4gK2lndF9tYWluX2FyZ3MoImRX
Okg6WDpZOiIsIE5VTEwsIGhlbHBfc3RyLCBvcHRfaGFuZGxlciwgTlVMTCkNCj4gIHsNCj4gIAlk
YXRhX3QgZGF0YSA9IHswLCB9Ow0KPiAgCWlndF9maWxsZnVuY190IGZpbGxfZm4gPSBOVUxMOw0K
PiBAQCAtMTkzLDYgKzIxNyw4IEBAIGlndF9tYWluX2FyZ3MoImQiLCBOVUxMLCBoZWxwX3N0ciwg
b3B0X2hhbmRsZXIsIE5VTEwpDQo+ICAJCXJlZ2lvbl9zZXQgPSBnZXRfbWVtb3J5X3JlZ2lvbl9z
ZXQocmVnaW9uX2luZm8sDQo+ICAJCQkJCQkgICBJOTE1X1NZU1RFTV9NRU1PUlksDQo+ICAJCQkJ
CQkgICBJOTE1X0RFVklDRV9NRU1PUlkpOw0KPiArDQo+ICsJCXN0YXJ0X3ggPSBBTElHTihzdGFy
dF94LCAxNik7DQo+ICAJfQ0KPiAgDQo+ICAJaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljKCJiYXNp
YyIpIHsNCj4gQEAgLTIwMyw3ICsyMjksMTEgQEAgaWd0X21haW5fYXJncygiZCIsIE5VTEwsIGhl
bHBfc3RyLCBvcHRfaGFuZGxlciwgTlVMTCkNCj4gIAkJCXVpbnQzMl90IGlkID0gaWd0X2NvbGxl
Y3Rpb25fZ2V0X3ZhbHVlKHJlZ2lvbiwgMCk7DQo+ICANCj4gIAkJCWlndF9keW5hbWljKG5hbWUp
DQo+IC0JCQkJZ3BncHVfZmlsbCgmZGF0YSwgZmlsbF9mbiwgaWQpOw0KPiArCQkJCWdwZ3B1X2Zp
bGwoJmRhdGEsIGZpbGxfZm4sIGlkLA0KPiArCQkJCQkgICBzdXJmd2lkdGgsIHN1cmZoZWlnaHQs
DQo+ICsJCQkJCSAgIHN0YXJ0X3gsIHN0YXJ0X3ksDQo+ICsJCQkJCSAgIHN1cmZ3aWR0aCAvIDIs
DQo+ICsJCQkJCSAgIHN1cmZoZWlnaHQgLyAyKTsNCj4gIA0KPiAgCQkJZnJlZShuYW1lKTsNCj4g
IAkJfQ0KDQo=
