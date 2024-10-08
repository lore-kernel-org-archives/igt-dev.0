Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBFDCEF17D
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 14:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620E310E242;
	Tue,  8 Oct 2024 14:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmN+hxI4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAD710E242
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728397739; x=1759933739;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=UifYmEfENncvxHQUEo0t3VqX1rF2ovk3HwjABiW0/ec=;
 b=fmN+hxI41Kj6h+AEEKRq1tPrXCD7HTD7mB8jxtdB3oPuOhLEKmoLOBea
 zeP663U5qvuZxMqMc40UeA9e9r0MZndiYkKWIJM/a9L6vPxFzW3OrLLRt
 05Z+3a+UWTGDk/CiA+Epg9MzeJJqxlBkg9pQXgjv00qQ66TtqI0VKN7Jv
 CG1ORyul5C1iIOFQTPN1FwApqOGz0ditIwXszc0SJ1tMDjFyWl/0vXClE
 kX6a2KVAqztWolS9hgcFVTYcz+2altjxdWM7wHrvzNHEruNXouIfuPJdx
 rFFCQsk/w2KLzAmMQLnOl6JC8eitHt99oC9IvY1PcWktmC8UkFgKEbxBS Q==;
X-CSE-ConnectionGUID: XY/h0KYkT5OtYcYrTVrTGA==
X-CSE-MsgGUID: tczQv1ZZTSOuYVVqFRG8BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27054624"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208,217";a="27054624"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 07:27:39 -0700
X-CSE-ConnectionGUID: 8uEInLh9QzWitaVB27Tpww==
X-CSE-MsgGUID: nJlxWklMThGTb9XThDQt/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208,217";a="76116822"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 07:27:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:27:37 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:27:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 07:27:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 07:27:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkuNquCbA/VwUp5vrvXTk+cEZa6FojlyUEWJW8LQ8WVlVuCq5LH4/B2KHeU+fj//4ahgEbxjnEsqR7Go+uPfezhmL9NmhJFpEu0M6Rfwvr107FwX9+ugMMJuynp3m1+sxQWhpybkmzyySkGFLVhP6nhBeI4y0iH3zq3GdHWAEOCZMQqPjOqgsvzvL+Wn/XxAoAd7Jd+y++B1Vpm/LAKhQ2MBfCDSrfsTWVgFNFC9sXll/csMWU938QqgUd1BVdfVkMZBzWw/scrdEXdtqNFM9QEvy5hDnOEZGu822LIsO7VdHd0LnatjD/1TNDPnzDp/e9a98hM4pJb3wlt0soUR5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADOI1GRRfkz2czZwgbzG8I9VC2lKEaOGM+oc+9UC9ak=;
 b=uDDOexXuqje7qRxPRzTHoEnG9kh11WypcflWtyqy0vyKfJu0E5d6RdXJIkBbE2fMS5VfCr21dX0drpAPn8jOxqFMrAiB9N8GTnkcaC4vdAA/wKSicAEhQRweW6SmAN2fsVuxIL52IxzVF0RURE5DwxDC5UBEnmNiwUWcPOQymR4pJEMOMLzRdzEgle9OysAjzJI3OnWCBbcaQ6HWv9D8gRAKFACSsa/prdssOFbva9lxSsytOtiL8CtnosR/cC0PalZPaRN9th8NEOyalznS3WFYrzmKhmkxOtTnDxUDVzrmLnXPLY5Fqwkka/E2jkylj/4Nu85Z7ybFoNE0Z4UvLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 14:27:26 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%3]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 14:27:26 +0000
Content-Type: multipart/alternative;
 boundary="------------9bPJZFql9EbYnrzrdACps8AN"
Message-ID: <cbed3d5b-dbc4-496d-8fe9-7b9fb423941f@intel.com>
Date: Tue, 8 Oct 2024 19:57:19 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIHRlc3RzL2ttc19q?=
 =?UTF-8?Q?oiner=3A_Reset_the_force=5Fjoiner=5Fsupported_variable_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20241002002045.6828-1-karthik.b.s@intel.com>
 <172838296333.1202999.14775732445681921296@2413ebb6fbb6>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <172838296333.1202999.14775732445681921296@2413ebb6fbb6>
X-ClientProxiedBy: MAXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CO1PR11MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f62708-d427-4d1d-b152-08dce7a55440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjQrdEhQQ2VuSGVRT1RUUUFtaFdmeEwxcTd3akowMDNIc0M1R3lnQUM4VVp5?=
 =?utf-8?B?SUxXK0R2dnczSW90MlBzZVVSVTZ0WWgzUWEyb3FTZis1Y2plQXpVcWl6Q3lB?=
 =?utf-8?B?cUYva2tsR1ViU1Z6T1YvRm5LTlRGZ3lOcXlKbWFCUXZ1NnlJZGhZOVlBanpH?=
 =?utf-8?B?Wk1Vdmg5UDVYVEhScWF2V25EQ3NMamMrRWJBQVJCV01lY1hIR2F0SHpNMWFu?=
 =?utf-8?B?TThpcVo3dmJNSWIvdHMwV1JjYTZYYXkyTnR1S2lJbEdaV1NNVzBZcHdBb3g1?=
 =?utf-8?B?cnpVSWFyeWdlNUpXLzlqV2NIZlQvcnlNYlI0ZVpoakFIbldHVjZhcTBMelcy?=
 =?utf-8?B?MGVxN1hZT1BRZzNmdU55MDkvNHpPTnJKNHpPY0x4MzhhT0JWd29OQlYyNzlX?=
 =?utf-8?B?c3QrbEdrS3ptTUppOFFrdndpR25FUXFoRUhaSGRUa3RYM3hFdmgzQWl6YzdF?=
 =?utf-8?B?SWpnQk5SSkE4WUI2dUF0cytWMHg4Q013YkRGcXB2SUlmVDhVUDMxOEgxMERu?=
 =?utf-8?B?eWhaR3RTUEVnV2txblAwcEYrSGtFVldJSGRBRDRZVWhZeFk5TUt5dVBPOUcz?=
 =?utf-8?B?QmlWS2g5a2VTTm1zeWM2RUpsbm81ZnlwUTFWYVlPTVpvdFR6elpzVFdDbURq?=
 =?utf-8?B?a1UyWU11ZldwRGRkQWVyRUhrN2lCTDM0Q1U5dlpKaG8wMVRjbUxQRzg4aFhB?=
 =?utf-8?B?clA3dVF1WFlEcitEYWZtUUE4Y2dvcXRHYWQ2dXN5eVpKMEhXRGZsL0NuZXhx?=
 =?utf-8?B?TVRUOGRRMTIvSkR2bkMzSkJmemVDbHRzVzMzTGRWd2I3bHNsejErVlFlUHFh?=
 =?utf-8?B?d3ZUc0ZsbEJOaTVTSzNHaEVNNWFWallrTFBpUVRnT0dlK1Bnc2xSVEJwcGpH?=
 =?utf-8?B?ME1mQkRzTnBXdUJpOXhJWitSWmErall0dmdVYTR6V21IUGxRdHM5NWRKQnFL?=
 =?utf-8?B?bDRMMi9NWEhUVmluZU9Bd0FKVUNCaktwYVU1aS9sZVF3SngyN0V1TkFUdU8v?=
 =?utf-8?B?cHJjcFFaMXIwell5OWM2RlFBeHJYM1ZRbSs3WFBxVFM4VlpTVlhVZ0JFdFN5?=
 =?utf-8?B?VWE4TVorc0gxTnY3N0xROTRYYWxyemVwM1FabUd2clZ5UkxIR241ZHV6YjF5?=
 =?utf-8?B?VE5oeE5XMlc5YVhZTUFjRklJTUlXSHJhZnNZcm94VGs5SHZnZzB1U3AvMXNU?=
 =?utf-8?B?dFJ2bGU2Y0JtUTZtK09WZDVnb1N2YXpVYXJvNGI2V2ZVYzlsVXNnS1I3M01I?=
 =?utf-8?B?dmNzQzRsaVNYYy9RcHpXem5LT1NiRmUyNkg2ZnNJTnlXZHFDMm9jb1FqTHQ4?=
 =?utf-8?B?ajdqeGRQRzhTc09zKy8rS2JTbkkrc0dFRUJSVlFwSVFjQkkyS2tONnRDRWg5?=
 =?utf-8?B?NmtYV2RaL20wQW0rTWFlTjBpUnRDRmNQNU83ZkFmSHdDaGtHK3hxTUhlN1Jm?=
 =?utf-8?B?bVVtSnlVOEdtbGJFcGZSMnR5ZVFJcGhETXJERUpEWmFiRVRIQldWWC9ZN3RI?=
 =?utf-8?B?eUYwYTRMSmJUaXFGOFU0elFFNnJhK1JFU2UzaTNQVFZqVDlsdGpwUmNJVzhN?=
 =?utf-8?B?dXBuL29Xb1hDM1ZDT0hQS3ZETjB1M3NmNnh1eEpZdXNyeWFIVkorTlBQSERy?=
 =?utf-8?Q?uIRG0a+rvHY6E5wrZDzKqECnY3lv6SZiyRp5Xo6uET6s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlpMQXNHN3pHTTVYVGN0TkNYd2p3MUZ6NUE0enI2bWZFcmRtSVo1eWhvTmNt?=
 =?utf-8?B?L3BsYytXZUhrYnZEdUd3dFNRUXFkSWd4RFc3ZFcrdm9XNmNic0hycGlPMzJl?=
 =?utf-8?B?RjZWdXNDSEVEb0NLalFGRXFWcExEc2czZ2RIeXNadU5HaHVMcjhKcUtiU0RL?=
 =?utf-8?B?bjh0OGpOR1RubUwvejZqd2U0eXdBU2lMOXpDT3B0OUQrNTdKdVNzakRnK2c4?=
 =?utf-8?B?QXg1d1g3NThwQlAzSnJsbzFsWDBnWFRqaU5DQTgvcm52dWtFbEZleGJsZFZj?=
 =?utf-8?B?b09wYjMyQlorZitYbjljR05mcWd5ZG5sOGVlVjVXalFpZnRndVBTQ0FRZytC?=
 =?utf-8?B?UkYwaDQrWnVEYWJDS2trTDBvdUJuL0NJb1A3clh0eEVNeTA3Mm1vNVhEcFM0?=
 =?utf-8?B?eG80RDkwVGl6N2UvRXY4dVE2QkwyMDlidTk0aHp1YjlQR1pia0Q1akhIOUdu?=
 =?utf-8?B?blI1b2hXa1c4eW1VQnlxZjFVNUlSTFZKMUh6eHE5aThBajl5RjVTM0tSYnM5?=
 =?utf-8?B?V0xTcjhZcVZlZzlUL1ZUV1JyeVo1UVBPMGtLN0ZJbGM2OTArRlI3U0RXTE5H?=
 =?utf-8?B?NzlqV1N2K1ZlN0ZXcVB3UVhmc2I2Y2luLzlKMDQwYnJGQlRidk02QTNsb0V4?=
 =?utf-8?B?c0hJa1hoRU15ZkVYS0dHdEhBZmFwSzQ0bGNzeGh3Z1J2bFFUbDFMc0F5VE1N?=
 =?utf-8?B?ZG9sOFZ0eVJzVjNJOTEzaTY3UGRhOU5EVzk4MmJINWI3amQ5S0tRZVVsakh3?=
 =?utf-8?B?R3dnbkNJMXNFYVh3aGFOcXRWbnNmbUs1UWZNOFRvdnhSbHB5R0p6OE5jQ0lS?=
 =?utf-8?B?dXNBcHlmMG1od2c4UVBrNmVncXRNN1R3bXlVQTdmYitrZldhcVJIbGRSU3Z1?=
 =?utf-8?B?SmI5YXBRd0V6aUVsQVdtQ1JLdVJzY1lSOEZYa3AwbE8zS0FlSjlNamFvTmdX?=
 =?utf-8?B?T1AyeUxaS0Q0OWFrRDk3QjVTVlp0U2FvRHQzU3g1d3NGOGJTQmNTOWVMRkFC?=
 =?utf-8?B?KzBNZ3RTZlNWRjIrV2s2akJKbGZXcUlTYlU4SkZGemJwV2xtRENEVEVwbHdV?=
 =?utf-8?B?bituYisyTllMTEgvenlheFV4TU42anlydnVyV3lDZFJaUzByajR6SzhoYVlt?=
 =?utf-8?B?OEthMWNCaytYZWhsR2ZxYW9PNHNMUFpadWw0SFBTTTRna3lqNjI1ZWpJakFP?=
 =?utf-8?B?SDNyZXdxbHZBczh1VzhCbFRRN2RlLzBjTUw0anVwcXVyWWFvUlp6cEdGeHNJ?=
 =?utf-8?B?N0hOY2E0OW0rZ1ladE41dG5BS0NsdmVkUWRoYjNBNkttbnF2a0tzUFdIN25v?=
 =?utf-8?B?Nk9nSCtSL0ZzMHF1eDVvdGZ3OHhKdlRPMlBVcytyaElEMU51NHZYTnVHWGNl?=
 =?utf-8?B?dXlreStiRzZtSVZKMmJwd293RzZQdTJRZnMwWk5oVk1SMWlaSXBHQm5tQ293?=
 =?utf-8?B?NmpTQlY3SE9acElCVXdyOWJ2K2dGWXE4K0J2NnpRaEF6WURPRGFhMk5xNVd4?=
 =?utf-8?B?QkEvRC9SVmV6SFBvOG1yS0tPWU9yVXBjK202SEVmajdxUTd4NVBldTNubkRC?=
 =?utf-8?B?Wk5FdVNUeGVLK0ZHTFhWT2dVS043MUQvQVhuSitNSEE1QVJmeHh2Y2kxY0t6?=
 =?utf-8?B?Q3RvQXUwNHFEbWFYZzhCV2JsQkhtS2YwZEVUNDFRdzd0QjM1N0RpeWdyZm44?=
 =?utf-8?B?aTMvbDZpSUpzb29lRjBLUDNUZG1GUGFVcXB3RS9ORExFUEpFb1hINTRadVZr?=
 =?utf-8?B?R1lQS2tkSkZ5SGR0WnhyemkwQnUxYmQwTVYrWmN3TmgzS0dTVnlsOGFvU2FD?=
 =?utf-8?B?SElUNXBZUE5VMzc1YytBRi9kUlY5dWFlNkh0Nzl2T0JNWE5NMHBYUmROZEQr?=
 =?utf-8?B?OWx3MVArMFh5VEZFNlhWUnN3blBsTE5WdjUvVXBSdHp3clJuVC84eUMvdWw0?=
 =?utf-8?B?aGpDS1U0WkVDRnlDTDBHaEs3NWZWQ0R2UG9BL1FFZWI2TUlxWnFZdVFKZTZ5?=
 =?utf-8?B?U2o1bnBWRVVxZE1nekZzQXRGQkgzbkJUNlEyajJwclpZdjIxSDNHTUFPVUtV?=
 =?utf-8?B?dVF3WVB0bllWY3FHcm9hY250enlaVk45bGpodUtzWGpOU1o2RlF0VEQzMmpk?=
 =?utf-8?Q?189hvxBAXxWzN7pmEZcapMc2Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f62708-d427-4d1d-b152-08dce7a55440
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 14:27:26.0993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJb9AgWDGKbfoCvy1DPkrjKv8zRRU7hu7RfAtA64UZUZOTxuVB7wuK2XA8o38XbDSYgT64gar5LHHPmjHTEzwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
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

--------------9bPJZFql9EbYnrzrdACps8AN
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/8/2024 3:52 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_joiner: Reset the force_joiner_supported variable 
> (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/139376/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/index.html
>
>
>   CI Bug Log - changes from CI_DRM_15469_full -> IGTPW_11853_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_11853_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11853_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/index.html
>
>
>     Participating hosts (10 -> 8)
>
> Missing (2): shard-dg2-set2 shard-glk
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_11853_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-7/igt@kms_joiner@basic-force-big-joiner.html>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html>
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-2/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html>
>         +4 other tests fail
>  *
>
>     igt@perf_pmu@busy-idle-check-all:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-18/igt@perf_pmu@busy-idle-check-all.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@perf_pmu@busy-idle-check-all.html>
>  *
>
>     igt@perf_pmu@busy-idle-check-all@vecs1:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@perf_pmu@busy-idle-check-all@vecs1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@perf_pmu@busy-idle-check-all@vecs1.html>
>         +1 other test fail
>  *
>
>     igt@prime_busy@hang-wait@rcs0:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-4/igt@prime_busy@hang-wait@rcs0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-7/igt@prime_busy@hang-wait@rcs0.html>
>         +1 other test incomplete
>

Hi,

The failures other than on kms_joiner are unrelated. On dg2 the skip is 
seen sporadically even before this patch so that is unrelated.

This patch is expected to fix the failure seen on shard-bmg, and this is 
passing as expected.

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11853/shards-all.html?testfilter=kms_joiner@.*force-big-joiner

Thanks,
Karthik.B.S
>
>  *
>
>
>         Warnings
>
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-tglu-2/igt@kms_joiner@basic-force-big-joiner.html>
>         ([i915#10656]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-6/igt@kms_joiner@basic-force-big-joiner.html>
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-16/igt@kms_joiner@basic-force-ultra-joiner.html>
>         ([i915#10656]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-19/igt@kms_joiner@basic-force-ultra-joiner.html>
>         +2 other tests skip
>  *
>
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         ([i915#10656]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         ([i915#10656]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         +2 other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-mmap-gtt:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-4/igt@kms_psr@psr2-primary-mmap-gtt.html>
>         ([i915#4077] / [i915#9688]) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@kms_psr@psr2-primary-mmap-gtt.html>
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_15469_full and 
> IGTPW_11853_full:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@kms_plane_multiple@tiling-none@pipe-a-vga-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.69] s
>  *
>
>     igt@kms_plane_multiple@tiling-none@pipe-b-vga-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.67] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_11853_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@api_intel_bb@crc32:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@api_intel_bb@crc32.html>
>         ([i915#6230])
>  *
>
>     igt@debugfs_test@basic-hwmon:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@debugfs_test@basic-hwmon.html>
>         ([i915#9318])
>  *
>
>     igt@device_reset@cold-reset-bound:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-4/igt@device_reset@cold-reset-bound.html>
>         ([i915#11078])
>  *
>
>     igt@device_reset@unbind-reset-rebind:
>
>       o shard-dg1: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html>
>         ([i915#11814] / [i915#11815])
>  *
>
>     igt@drm_fdinfo@most-busy-check-all:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@drm_fdinfo@most-busy-check-all.html>
>         ([i915#8414]) +7 other tests skip
>  *
>
>     igt@drm_fdinfo@most-busy-check-all@bcs0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@drm_fdinfo@most-busy-check-all@bcs0.html>
>         ([i915#8414]) +25 other tests skip
>  *
>
>     igt@drm_fdinfo@virtual-busy-idle:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@drm_fdinfo@virtual-busy-idle.html>
>         ([i915#8414])
>  *
>
>     igt@drm_read@short-buffer-block:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@drm_read@short-buffer-block.html>
>         ([i915#9197]) +10 other tests skip
>  *
>
>     igt@gem_ccs@block-multicopy-compressed:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html>
>         ([i915#9323])
>  *
>
>     igt@gem_ccs@block-multicopy-inplace:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-5/igt@gem_ccs@block-multicopy-inplace.html>
>         ([i915#3555] / [i915#9323])
>  *
>
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         ([i915#9323])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         ([i915#9323])
>  *
>
>     igt@gem_close_race@multigpu-basic-process:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@gem_close_race@multigpu-basic-process.html>
>         ([i915#7697])
>  *
>
>     igt@gem_ctx_engines@invalid-engines:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-7/igt@gem_ctx_engines@invalid-engines.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@gem_ctx_engines@invalid-engines.html>
>         ([i915#12027])
>  *
>
>     igt@gem_ctx_persistence@heartbeat-close:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-close.html>
>         ([i915#8555])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@gem_ctx_persistence@heartbeat-close.html>
>         ([i915#8555])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-close.html>
>         ([i915#8555])
>  *
>
>     igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html>
>         ([i915#1099]) +3 other tests skip
>  *
>
>     igt@gem_ctx_sseu@invalid-args:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-7/igt@gem_ctx_sseu@invalid-args.html>
>         ([i915#280])
>  *
>
>     igt@gem_ctx_sseu@mmap-args:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-3/igt@gem_ctx_sseu@mmap-args.html>
>         ([i915#280])
>  *
>
>     igt@gem_eio@hibernate:
>
>       o shard-rkl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-3/igt@gem_eio@hibernate.html>
>         ([i915#7975] / [i915#8213])
>  *
>
>     igt@gem_exec_balancer@bonded-pair:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@gem_exec_balancer@bonded-pair.html>
>         ([i915#4771])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-3/igt@gem_exec_balancer@bonded-pair.html>
>         ([i915#4771])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@gem_exec_balancer@bonded-pair.html>
>         ([i915#4771])
>  *
>
>     igt@gem_exec_balancer@parallel-keep-submit-fence:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>         ([i915#4525]) +1 other test skip
>  *
>
>     igt@gem_exec_capture@capture:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@gem_exec_capture@capture.html>
>         ([i915#11965]) +1 other test fail
>  *
>
>     igt@gem_exec_capture@capture-recoverable:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html>
>         ([i915#6344])
>  *
>
>     igt@gem_exec_fair@basic-deadline:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html>
>         ([i915#2846])
>  *
>
>     igt@gem_exec_fair@basic-none-solo:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@gem_exec_fair@basic-none-solo.html>
>         ([i915#2842]) +1 other test fail
>  *
>
>     igt@gem_exec_fair@basic-none-vip:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-5/igt@gem_exec_fair@basic-none-vip.html>
>         ([i915#2842]) +3 other tests fail
>  *
>
>     igt@gem_exec_fair@basic-pace:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@gem_exec_fair@basic-pace.html>
>         ([i915#4473] / [i915#4771])
>  *
>
>     igt@gem_exec_fair@basic-sync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@gem_exec_fair@basic-sync.html>
>         ([i915#3539]) +1 other test skip
>  *
>
>     igt@gem_exec_flush@basic-uc-ro-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@gem_exec_flush@basic-uc-ro-default.html>
>         ([i915#3539] / [i915#4852]) +4 other tests skip
>  *
>
>     igt@gem_exec_flush@basic-uc-rw-default:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@gem_exec_flush@basic-uc-rw-default.html>
>         ([i915#3539] / [i915#4852]) +3 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-7/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html>
>         ([i915#3281]) +12 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-noreloc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-noreloc.html>
>         ([i915#3281]) +7 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-read-noreloc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html>
>         ([i915#3281]) +15 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-gtt-active:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@gem_exec_reloc@basic-write-gtt-active.html>
>         ([i915#3281]) +8 other tests skip
>  *
>
>     igt@gem_exec_schedule@pi-common@vcs0:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@gem_exec_schedule@pi-common@vcs0.html>
>         ([i915#12296]) +4 other tests fail
>  *
>
>     igt@gem_exec_schedule@preempt-queue-contexts:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@gem_exec_schedule@preempt-queue-contexts.html>
>         ([i915#4537] / [i915#4812])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts.html>
>         ([i915#4537] / [i915#4812])
>  *
>
>     igt@gem_exec_suspend@basic-s4-devices:
>
>       o shard-dg2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@gem_exec_suspend@basic-s4-devices.html>
>         ([i915#7975] / [i915#8213]) +1 other test abort
>  *
>
>     igt@gem_exec_suspend@basic-s4-devices@lmem0:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-12/igt@gem_exec_suspend@basic-s4-devices@lmem0.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html>
>         ([i915#7975] / [i915#8213]) +1 other test abort
>  *
>
>     igt@gem_fenced_exec_thrash@no-spare-fences-busy:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html>
>         ([i915#4860])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html>
>         ([i915#4860])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html>
>         ([i915#4860])
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         ([i915#4613]) +3 other tests skip
>  *
>
>     igt@gem_lmem_swapping@verify-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@gem_lmem_swapping@verify-ccs.html>
>         ([i915#4613]) +3 other tests skip
>  *
>
>     igt@gem_lmem_swapping@verify-random:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@gem_lmem_swapping@verify-random.html>
>         ([i915#4613])
>  *
>
>     igt@gem_mmap_gtt@cpuset-big-copy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@gem_mmap_gtt@cpuset-big-copy.html>
>         ([i915#4077]) +9 other tests skip
>  *
>
>     igt@gem_mmap_gtt@cpuset-medium-copy:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@gem_mmap_gtt@cpuset-medium-copy.html>
>         ([i915#4077]) +3 other tests skip
>  *
>
>     igt@gem_mmap_wc@bad-object:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@gem_mmap_wc@bad-object.html>
>         ([i915#4083]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-13/igt@gem_mmap_wc@bad-object.html>
>         ([i915#4083]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@gem_mmap_wc@bad-object.html>
>         ([i915#4083])
>  *
>
>     igt@gem_pread@exhaustion:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@gem_pread@exhaustion.html>
>         ([i915#3282]) +4 other tests skip
>       o shard-snb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb1/igt@gem_pread@exhaustion.html>
>         ([i915#2658])
>       o shard-tglu: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-3/igt@gem_pread@exhaustion.html>
>         ([i915#2658])
>  *
>
>     igt@gem_pread@snoop:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@gem_pread@snoop.html>
>         ([i915#3282]) +3 other tests skip
>  *
>
>     igt@gem_pwrite@basic-self:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@gem_pwrite@basic-self.html>
>         ([i915#3282]) +2 other tests skip
>  *
>
>     igt@gem_pxp@fail-invalid-protected-context:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-18/igt@gem_pxp@fail-invalid-protected-context.html>
>         ([i915#4270])
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-off-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@gem_pxp@reject-modify-context-protection-off-1.html>
>         ([i915#4270]) +1 other test skip
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-on:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html>
>         ([i915#4270]) +2 other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html>
>         ([i915#5190] / [i915#8428]) +6 other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html>
>         ([i915#8428]) +3 other tests skip
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html>
>         ([i915#8411]) +2 other tests skip
>  *
>
>     igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html>
>         ([i915#4079])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html>
>         ([i915#4079])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html>
>         ([i915#4079])
>  *
>
>     igt@gem_set_tiling_vs_pwrite:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-3/igt@gem_set_tiling_vs_pwrite.html>
>         ([i915#3282]) +9 other tests skip
>  *
>
>     igt@gem_softpin@evict-snoop:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-16/igt@gem_softpin@evict-snoop.html>
>         ([i915#4885])
>  *
>
>     igt@gem_userptr_blits@access-control:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-4/igt@gem_userptr_blits@access-control.html>
>         ([i915#3297])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@gem_userptr_blits@access-control.html>
>         ([i915#3297])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-13/igt@gem_userptr_blits@access-control.html>
>         ([i915#3297])
>  *
>
>     igt@gem_userptr_blits@forbidden-operations:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@gem_userptr_blits@forbidden-operations.html>
>         ([i915#3282] / [i915#3297])
>  *
>
>     igt@gem_userptr_blits@relocations:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@gem_userptr_blits@relocations.html>
>         ([i915#3281] / [i915#3297])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-3/igt@gem_userptr_blits@relocations.html>
>         ([i915#3281] / [i915#3297])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@gem_userptr_blits@relocations.html>
>         ([i915#3281] / [i915#3297])
>  *
>
>     igt@gem_userptr_blits@unsync-overlap:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@gem_userptr_blits@unsync-overlap.html>
>         ([i915#3297]) +1 other test skip
>  *
>
>     igt@gem_userptr_blits@unsync-unmap:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@gem_userptr_blits@unsync-unmap.html>
>         ([i915#3297]) +1 other test skip
>  *
>
>     igt@gen9_exec_parse@allowed-all:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@gen9_exec_parse@allowed-all.html>
>         ([i915#2527]) +2 other tests skip
>  *
>
>     igt@gen9_exec_parse@basic-rejected-ctx-param:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html>
>         ([i915#2527] / [i915#2856]) +1 other test skip
>  *
>
>     igt@gen9_exec_parse@bb-start-cmd:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@gen9_exec_parse@bb-start-cmd.html>
>         ([i915#2856])
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#10131] / [i915#9697])
>  *
>
>     igt@i915_module_load@resize-bar:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@i915_module_load@resize-bar.html>
>         ([i915#6412])
>  *
>
>     igt@i915_pm_freq_api@freq-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html>
>         ([i915#8399])
>  *
>
>     igt@i915_pm_rps@reset:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-tglu-2/igt@i915_pm_rps@reset.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-9/igt@i915_pm_rps@reset.html>
>         ([i915#12309])
>  *
>
>     igt@i915_pm_rps@thresholds-idle-park:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@i915_pm_rps@thresholds-idle-park.html>
>         ([i915#11681])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@i915_pm_rps@thresholds-idle-park.html>
>         ([i915#11681])
>  *
>
>     igt@i915_pm_sseu@full-enable:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-6/igt@i915_pm_sseu@full-enable.html>
>         ([i915#4387])
>  *
>
>     igt@i915_power@sanity:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@i915_power@sanity.html>
>         ([i915#7984])
>  *
>
>     igt@i915_query@query-topology-coherent-slice-mask:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@i915_query@query-topology-coherent-slice-mask.html>
>         ([i915#6188])
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@intel_hwmon@hwmon-write.html>
>         ([i915#7707])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@intel_hwmon@hwmon-write.html>
>         ([i915#7707]) +1 other test skip
>  *
>
>     igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html>
>         ([i915#4212])
>  *
>
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>         ([i915#3826])
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html>
>         ([i915#8709]) +7 other tests skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html>
>         ([i915#8709]) +11 other tests skip
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         ([i915#1769] / [i915#3555])
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         ([i915#1769] / [i915#3555])
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         ([i915#4538] / [i915#5286]) +3 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         ([i915#5286]) +8 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>         ([i915#5286]) +6 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         ([i915#5138]) +1 other test fail
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         ([i915#3638]) +5 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-180:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html>
>         ([i915#10354])
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         +11 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html>
>         ([i915#3638]) +2 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         ([i915#5190]) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         ([i915#6187])
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html>
>         +42 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>         ([i915#4538] / [i915#5190]) +10 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html>
>         ([i915#4538]) +4 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         ([i915#5190] / [i915#9197])
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         ([i915#12313]) +3 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         ([i915#12313]) +1 other test skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-19/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-4.html>
>         ([i915#4423] / [i915#6095])
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html>
>         +147 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html>
>         ([i915#6095]) +39 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html>
>         ([i915#10307] / [i915#6095]) +184 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         ([i915#12313]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         ([i915#12313]) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         ([i915#12313]) +1 other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html>
>         ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html>
>         ([i915#6095]) +4 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html>
>         ([i915#6095]) +115 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html>
>         ([i915#6095]) +97 other tests skip
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html>
>         ([i915#4087]) +4 other tests skip
>  *
>
>     igt@kms_chamelium_edid@vga-edid-read:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@kms_chamelium_edid@vga-edid-read.html>
>         ([i915#7828]) +2 other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-multiple:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_chamelium_frames@hdmi-crc-multiple.html>
>         ([i915#7828]) +5 other tests skip
>  *
>
>     igt@kms_chamelium_frames@vga-frame-dump:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@kms_chamelium_frames@vga-frame-dump.html>
>         ([i915#7828]) +3 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd.html>
>         ([i915#7828]) +11 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html>
>         ([i915#7828]) +4 other tests skip
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_content_protection@atomic-dpms.html>
>         ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-16/igt@kms_content_protection@atomic-dpms.html>
>         ([i915#7116] / [i915#9424]) +1 other test skip
>  *
>
>     igt@kms_content_protection@content-type-change:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-16/igt@kms_content_protection@content-type-change.html>
>         ([i915#9424])
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         ([i915#3299])
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_content_protection@dp-mst-type-1.html>
>         ([i915#3116] / [i915#3299]) +1 other test skip
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@kms_content_protection@lic-type-0.html>
>         ([i915#6944] / [i915#9424]) +3 other tests skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_content_protection@lic-type-0.html>
>         ([i915#9424])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-4/igt@kms_content_protection@lic-type-0.html>
>         ([i915#9424])
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-3/igt@kms_content_protection@type1.html>
>         ([i915#7118] / [i915#9424]) +1 other test skip
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_content_protection@uevent.html>
>         ([i915#7118] / [i915#9424])
>  *
>
>     igt@kms_cursor_crc@cursor-alpha-opaque:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-10/igt@kms_cursor_crc@cursor-alpha-opaque.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_cursor_crc@cursor-alpha-opaque.html>
>         ([i915#9197]) +22 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-32x32:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_cursor_crc@cursor-random-32x32.html>
>         ([i915#3555]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-3/igt@kms_cursor_crc@cursor-random-32x32.html>
>         ([i915#3555]) +4 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-32x32.html>
>         ([i915#3555] / [i915#8814])
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html>
>         ([i915#11453]) +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html>
>         ([i915#3555]) +5 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html>
>         ([i915#8814])
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         ([i915#3555]) +3 other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         ([i915#4103]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         ([i915#4103] / [i915#4213])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         ([i915#4103]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         ([i915#4103] / [i915#4213])
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         ([i915#9809]) +3 other tests skip
>  *
>
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html>
>         ([i915#9067])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html>
>         ([i915#9067])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html>
>         ([i915#9067])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html>
>         ([i915#9067])
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         ([i915#9723])
>  *
>
>     igt@kms_display_modes@mst-extended-mode-negative:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_display_modes@mst-extended-mode-negative.html>
>         ([i915#8588])
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-5/igt@kms_dsc@dsc-basic.html>
>         ([i915#3555] / [i915#3840])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_dsc@dsc-basic.html>
>         ([i915#3555] / [i915#3840]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-4/igt@kms_dsc@dsc-basic.html>
>         ([i915#3555] / [i915#3840] / [i915#9159])
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp.html>
>         ([i915#3840])
>  *
>
>     igt@kms_dsc@dsc-with-formats:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@kms_dsc@dsc-with-formats.html>
>         ([i915#3555] / [i915#3840])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html>
>         ([i915#3555] / [i915#3840])
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_dsc@dsc-with-output-formats.html>
>         ([i915#3555] / [i915#3840])
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         ([i915#3840] / [i915#9053])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         ([i915#3840] / [i915#9053])
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_feature_discovery@chamelium.html>
>         ([i915#4854])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-19/igt@kms_feature_discovery@chamelium.html>
>         ([i915#4854])
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_feature_discovery@display-2x.html>
>         ([i915#1839])
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_feature_discovery@display-4x.html>
>         ([i915#1839]) +1 other test skip
>  *
>
>     igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb4/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html>
>         ([i915#2122]) +5 other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html>
>         ([i915#3637]) +1 other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-fences-interruptible:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>         ([i915#8381])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>         ([i915#8381])
>  *
>
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         +10 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-16/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         ([i915#9934]) +2 other tests skip
>  *
>
>     igt@kms_flip@2x-modeset-vs-vblank-race:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-3/igt@kms_flip@2x-modeset-vs-vblank-race.html>
>         ([i915#3637]) +4 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-fences-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_flip@flip-vs-fences-interruptible.html>
>         ([i915#8381]) +1 other test skip
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
>
>       o shard-dg1: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html>
>         ([i915#4423])
>  *
>
>     igt@kms_flip@flip-vs-suspend@c-edp1:
>
>       o shard-mtlp: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@kms_flip@flip-vs-suspend@c-edp1.html>
>         ([i915#6113]) +1 other test incomplete
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-7/igt@kms_flip@plain-flip-fb-recreate.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_flip@plain-flip-fb-recreate.html>
>         ([i915#2122]) +4 other tests fail
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate.html>
>         ([i915#2122])
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1:
>
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1.html>
>         ([i915#2122]) +1 other test fail
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2.html>
>         ([i915#2122])
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2.html>
>         ([i915#11989])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html>
>         ([i915#2672] / [i915#3555]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html>
>         ([i915#2672] / [i915#3555])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html>
>         ([i915#2672] / [i915#3555]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         ([i915#2672] / [i915#3555]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +8 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html>
>         ([i915#2672])
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html>
>         ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html>
>         ([i915#2672] / [i915#3555]) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html>
>         ([i915#5354]) +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html>
>         ([i915#5354]) +29 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html>
>         +62 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html>
>         ([i915#8708]) +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         ([i915#5439])
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html>
>         ([i915#3458]) +17 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html>
>         ([i915#10433] / [i915#3458])
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         +24 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html>
>         ([i915#8708]) +7 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         ([i915#8708]) +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html>
>         ([i915#3458]) +7 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite.html>
>         ([i915#1825]) +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html>
>         ([i915#1825]) +44 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html>
>         ([i915#3023]) +31 other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-5/igt@kms_hdr@bpc-switch.html>
>         ([i915#3555] / [i915#8228])
>  *
>
>     igt@kms_hdr@bpc-switch-suspend:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html>
>         ([i915#3555] / [i915#8228])
>  *
>
>     igt@kms_hdr@static-swap:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_hdr@static-swap.html>
>         ([i915#3555] / [i915#8228])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_hdr@static-swap.html>
>         ([i915#3555] / [i915#8228])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_hdr@static-swap.html>
>         ([i915#3555] / [i915#8228])
>  *
>
>     igt@kms_invalid_mode@bad-hsync-end:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-6/igt@kms_invalid_mode@bad-hsync-end.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_invalid_mode@bad-hsync-end.html>
>         ([i915#3555]) +1 other test skip
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@kms_joiner@basic-big-joiner.html>
>         ([i915#10656]) +1 other test skip
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         ([i915#10656])
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         ([i915#12339])
>  *
>
>     igt@kms_plane@pixel-format:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-1/igt@kms_plane@pixel-format.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane@pixel-format.html>
>         ([i915#8825])
>  *
>
>     igt@kms_plane@plane-panning-bottom-right:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane@plane-panning-bottom-right.html>
>         ([i915#8825])
>  *
>
>     igt@kms_plane_lowres@tiling-none:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_plane_lowres@tiling-none.html>
>         ([i915#3582])
>  *
>
>     igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html>
>         ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
>  *
>
>     igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html>
>         ([i915#11614] / [i915#3582])
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         ([i915#5354] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size.html>
>         ([i915#8292]) +1 other test fail
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html>
>         ([i915#8292])
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html>
>         ([i915#12247]) +15 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html>
>         ([i915#12247] / [i915#8152] / [i915#9423])
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html>
>         ([i915#12247]) +5 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html>
>         ([i915#12247] / [i915#8152])
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-13/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html>
>         ([i915#12247]) +8 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html>
>         ([i915#8152] / [i915#9423]) +1 other test skip
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html>
>         ([i915#8152])
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25.html>
>         ([i915#12247] / [i915#6953])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html>
>         ([i915#12247] / [i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html>
>         ([i915#12247]) +7 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html>
>         ([i915#12247] / [i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html>
>         ([i915#6953] / [i915#8152] / [i915#9423])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html>
>         ([i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html>
>         ([i915#12247]) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d.html>
>         ([i915#12247] / [i915#8152])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html>
>         ([i915#12247] / [i915#3555])
>  *
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_pm_backlight@fade-with-dpms.html>
>         ([i915#5354])
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         ([i915#9685])
>  *
>
>     igt@kms_pm_lpsp@screens-disabled:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-7/igt@kms_pm_lpsp@screens-disabled.html>
>         ([i915#8430])
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         ([i915#9519]) +1 other test skip
>  *
>
>     igt@kms_pm_rpm@dpms-non-lpsp:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_pm_rpm@dpms-non-lpsp.html>
>         ([i915#9519])
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         ([i915#9519]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         ([i915#9519])
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         ([i915#9519])
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         ([i915#9519])
>  *
>
>     igt@kms_pm_rpm@pm-caching:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_pm_rpm@pm-caching.html>
>         ([i915#4077]) +4 other tests skip
>  *
>
>     igt@kms_pm_rpm@system-suspend-modeset:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-5/igt@kms_pm_rpm@system-suspend-modeset.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_pm_rpm@system-suspend-modeset.html>
>         ([i915#3547])
>  *
>
>     igt@kms_prime@basic-crc-hybrid:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html>
>         ([i915#6524])
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html>
>         ([i915#11520]) +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html>
>         ([i915#11520]) +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         ([i915#11520]) +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html>
>         ([i915#9808])
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html>
>         ([i915#12316]) +1 other test skip
>  *
>
>     igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html>
>         ([i915#11520]) +4 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html>
>         ([i915#11520]) +11 other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_psr2_su@page_flip-p010.html>
>         ([i915#9683])
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         ([i915#4348])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         ([i915#9683])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         ([i915#9683])
>  *
>
>     igt@kms_psr@fbc-pr-sprite-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_psr@fbc-pr-sprite-blt.html>
>         ([i915#1072] / [i915#9732]) +14 other tests skip
>  *
>
>     igt@kms_psr@pr-sprite-blt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_psr@pr-sprite-blt.html>
>         ([i915#9688]) +2 other tests skip
>  *
>
>     igt@kms_psr@pr-sprite-mmap-cpu:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-7/igt@kms_psr@pr-sprite-mmap-cpu.html>
>         ([i915#9732]) +15 other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html>
>         ([i915#1072] / [i915#9732]) +32 other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-mmap-cpu:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_psr@psr2-primary-mmap-cpu.html>
>         ([i915#1072] / [i915#9732]) +5 other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         ([i915#9685]) +2 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-rotation-90:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@kms_rotation_crc@primary-rotation-90.html>
>         ([i915#11131]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-90.html>
>         ([i915#11131])
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         ([i915#5289]) +1 other test skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         ([i915#11131] / [i915#5190])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         ([i915#5289])
>  *
>
>     igt@kms_selftest@drm_framebuffer:
>
>       o shard-rkl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_selftest@drm_framebuffer.html>
>         ([i915#12231]) +1 other test abort
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-16/igt@kms_tiled_display@basic-test-pattern.html>
>         ([i915#8623])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-9/igt@kms_tiled_display@basic-test-pattern.html>
>         ([i915#8623])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern.html>
>         ([i915#8623])
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-3/igt@kms_vrr@lobf.html>
>         ([i915#11920])
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_vrr@negative-basic.html>
>         ([i915#3555] / [i915#9906])
>  *
>
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         ([i915#2437] / [i915#9412]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         ([i915#2437] / [i915#9412])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-13/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         ([i915#2437] / [i915#9412])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         ([i915#2437] / [i915#9412])
>  *
>
>     igt@kms_writeback@writeback-invalid-parameters:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_writeback@writeback-invalid-parameters.html>
>         ([i915#2437])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_writeback@writeback-invalid-parameters.html>
>         ([i915#2437])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_writeback@writeback-invalid-parameters.html>
>         ([i915#2437])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_writeback@writeback-invalid-parameters.html>
>         ([i915#2437])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_writeback@writeback-invalid-parameters.html>
>         ([i915#2437])
>  *
>
>     igt@perf@per-context-mode-unprivileged:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html>
>         ([i915#2435])
>  *
>
>     igt@perf_pmu@busy-idle-check-all@ccs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-1/igt@perf_pmu@busy-idle-check-all@ccs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all@ccs0.html>
>         ([i915#4349]) +3 other tests fail
>  *
>
>     igt@perf_pmu@busy-idle-check-all@vcs0:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@perf_pmu@busy-idle-check-all@vcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@perf_pmu@busy-idle-check-all@vcs0.html>
>         ([i915#4349]) +8 other tests fail
>  *
>
>     igt@perf_pmu@busy-idle-check-all@vecs0:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-18/igt@perf_pmu@busy-idle-check-all@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@perf_pmu@busy-idle-check-all@vecs0.html>
>         ([i915#4349]) +2 other tests fail
>  *
>
>     igt@perf_pmu@rc6-all-gts:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html>
>         ([i915#8516])
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-on:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@sriov_basic@enable-vfs-autoprobe-on.html>
>         ([i915#9917])
>
>
>         Possible fixes
>
>  *
>
>     igt@fbdev@nullptr:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@fbdev@nullptr.html>
>         ([i915#2582]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@fbdev@nullptr.html>
>         +1 other test pass
>  *
>
>     igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-10/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html>
>         ([i915#7297]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html>
>         +1 other test pass
>  *
>
>     igt@gem_ctx_engines@invalid-engines:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-1/igt@gem_ctx_engines@invalid-engines.html>
>         ([i915#12027]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@gem_ctx_engines@invalid-engines.html>
>  *
>
>     igt@gem_eio@hibernate:
>
>       o shard-dg2: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-3/igt@gem_eio@hibernate.html>
>         ([i915#10030] / [i915#7975] / [i915#8213]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@gem_eio@hibernate.html>
>  *
>
>     igt@gem_exec_fair@basic-pace@rcs0:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-5/igt@gem_exec_fair@basic-pace@rcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html>
>         +3 other tests pass
>  *
>
>     igt@i915_module_load@reload-no-display:
>
>       o shard-snb: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-snb5/igt@i915_module_load@reload-no-display.html>
>         ([i915#11703]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb2/igt@i915_module_load@reload-no-display.html>
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-rkl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#9820]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html>
>       o shard-snb: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#9820]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html>
>       o shard-dg1: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#9820]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html>
>  *
>
>     igt@i915_selftest@live@workarounds:
>
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-3/igt@i915_selftest@live@workarounds.html>
>         ([i915#12216]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@i915_selftest@live@workarounds.html>
>         +1 other test pass
>  *
>
>     igt@i915_suspend@basic-s3-without-i915:
>
>       o shard-rkl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html>
>         ([i915#4817]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html>
>  *
>
>     igt@kms_color@ctm-max:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_color@ctm-max.html>
>         ([i915#5354]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_color@ctm-max.html>
>         +15 other tests pass
>  *
>
>     igt@kms_fbcon_fbt@fbc:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_fbcon_fbt@fbc.html>
>         ([i915#1849]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_fbcon_fbt@fbc.html>
>  *
>
>     igt@kms_flip@blocking-wf_vblank:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-7/igt@kms_flip@blocking-wf_vblank.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@kms_flip@blocking-wf_vblank.html>
>         +7 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         +1 other test pass
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-13/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         +4 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html>
>         ([i915#12138]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html>
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:
>
>       o shard-dg1: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html>
>         ([i915#4839] / [i915#6113]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html>
>  *
>
>     igt@kms_flip@plain-flip-ts-check-interruptible:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-6/igt@kms_flip@plain-flip-ts-check-interruptible.html>
>         ([i915#11989] / [i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-4/igt@kms_flip@plain-flip-ts-check-interruptible.html>
>  *
>
>     igt@kms_flip@wf_vblank-ts-check:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-2/igt@kms_flip@wf_vblank-ts-check.html>
>         ([i915#11989] / [i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check.html>
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html>
>         ([i915#11961]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
>
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-snb6/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb6/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html>
>         +7 other tests pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-tglu-6/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html>
>         ([i915#2122]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html>
>         ([i915#3555]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html>
>         +2 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
>
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html>
>         +4 other tests pass
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-6/igt@kms_hdr@static-toggle.html>
>         ([i915#3555] / [i915#8228]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_hdr@static-toggle.html>
>  *
>
>     igt@kms_plane@plane-panning-top-left:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane@plane-panning-top-left.html>
>         ([i915#8825]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_plane@plane-panning-top-left.html>
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html>
>         ([i915#8152] / [i915#9423]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html>
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c.html>
>         ([i915#12247]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c.html>
>         +11 other tests pass
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html>
>         ([i915#8152]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html>
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html>
>         ([i915#12247] / [i915#8152] / [i915#9423]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html>
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html>
>         ([i915#12247] / [i915#8152]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html>
>         +2 other tests pass
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html>
>         ([i915#6953] / [i915#8152] / [i915#9423]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_dc@dc5-dpms-negative:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_pm_dc@dc5-dpms-negative.html>
>         ([i915#9293]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html>
>  *
>
>     igt@kms_pm_rpm@dpms-non-lpsp:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_pm_rpm@dpms-non-lpsp.html>
>         ([i915#9519]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-5/igt@kms_pm_rpm@dpms-non-lpsp.html>
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         ([i915#9519]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>  *
>
>     igt@kms_properties@plane-properties-legacy:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_properties@plane-properties-legacy.html>
>         ([i915#11521]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_properties@plane-properties-legacy.html>
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-18/igt@kms_setmode@basic.html>
>         ([i915#5465]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-18/igt@kms_setmode@basic.html>
>         +2 other tests pass
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-tglu-9/igt@kms_setmode@basic.html>
>         ([i915#5465]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-6/igt@kms_setmode@basic.html>
>         +2 other tests pass
>  *
>
>     igt@kms_setmode@basic@pipe-b-edp-1:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-1/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         ([i915#5465]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         +2 other tests pass
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_vblank@ts-continuation-dpms-suspend.html>
>         ([i915#9197]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-7/igt@kms_vblank@ts-continuation-dpms-suspend.html>
>         +37 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>
>         ([i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>
>         ([i915#7091])
>  *
>
>     igt@i915_selftest@mock:
>
>       o shard-dg2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-11/igt@i915_selftest@mock.html>
>         ([i915#1982] / [i915#9311]) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@i915_selftest@mock.html>
>         ([i915#9311])
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_async_flips@invalid-async-flip.html>
>         ([i915#9197]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html>
>         ([i915#6228])
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         ([i915#9531]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         ([i915#9197])
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-90:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-10/igt@kms_bi>
>         -> [SKIP][446] ([i915#9197]) +1 other test skip
>
--------------9bPJZFql9EbYnrzrdACps8AN
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <div class="moz-cite-prefix">On 10/8/2024 3:52 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172838296333.1202999.14775732445681921296@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/kms_joiner: Reset the force_joiner_supported
              variable (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/139376/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/139376/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_15469_full -&gt;
        IGTPW_11853_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_11853_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_11853_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/index.html</a></p>
      <h2>Participating hosts (10 -&gt; 8)</h2>
      <p>Missing (2): shard-dg2-set2 shard-glk </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_11853_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-7/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a></li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a></li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-2/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">FAIL</a> +4 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-idle-check-all:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-18/igt@perf_pmu@busy-idle-check-all.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@perf_pmu@busy-idle-check-all.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-idle-check-all@vecs1:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@perf_pmu@busy-idle-check-all@vecs1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@perf_pmu@busy-idle-check-all@vecs1.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_busy@hang-wait@rcs0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-4/igt@prime_busy@hang-wait@rcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-7/igt@prime_busy@hang-wait@rcs0.html" moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <br>
    <p>Hi,</p>
    <p>The failures other than on kms_joiner are unrelated. On dg2 the
      skip is seen sporadically even before this patch so that is
      unrelated.</p>
    <p>This patch is expected to fix the failure seen on shard-bmg, and
      this is passing as expected.</p>
    <p><a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11853/shards-all.html?testfilter=kms_joiner@.*force-big-joiner">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11853/shards-all.html?testfilter=kms_joiner@.*force-big-joiner</a></p>
    Thanks,<br>
    Karthik.B.S<br>
    <blockquote type="cite" cite="mid:172838296333.1202999.14775732445681921296@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-tglu-2/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#10656]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-6/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-16/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#10656]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-19/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#10656]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#10656]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-4/igt@kms_psr@psr2-primary-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#4077] /
              [i915#9688]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@kms_psr@psr2-primary-mmap-gtt.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between CI_DRM_15469_full and
        IGTPW_11853_full:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@kms_plane_multiple@tiling-none@pipe-a-vga-1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.69] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-none@pipe-b-vga-1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.67] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_11853_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@crc32:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@api_intel_bb@crc32.html" moz-do-not-send="true">SKIP</a> ([i915#6230])</li>
          </ul>
        </li>
        <li>
          <p>igt@debugfs_test@basic-hwmon:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@debugfs_test@basic-hwmon.html" moz-do-not-send="true">SKIP</a> ([i915#9318])</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@cold-reset-bound:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-4/igt@device_reset@cold-reset-bound.html" moz-do-not-send="true">SKIP</a> ([i915#11078])</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@unbind-reset-rebind:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html" moz-do-not-send="true">ABORT</a> ([i915#11814] /
              [i915#11815])</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-check-all:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@drm_fdinfo@most-busy-check-all.html" moz-do-not-send="true">SKIP</a> ([i915#8414]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@drm_fdinfo@most-busy-check-all@bcs0.html" moz-do-not-send="true">SKIP</a> ([i915#8414]) +25 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@virtual-busy-idle:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@drm_fdinfo@virtual-busy-idle.html" moz-do-not-send="true">SKIP</a> ([i915#8414])</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_read@short-buffer-block:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@drm_read@short-buffer-block.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-multicopy-compressed:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html" moz-do-not-send="true">SKIP</a> ([i915#9323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-multicopy-inplace:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-5/igt@gem_ccs@block-multicopy-inplace.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#9323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html" moz-do-not-send="true">SKIP</a> ([i915#9323])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@gem_ccs@ctrl-surf-copy-new-ctx.html" moz-do-not-send="true">SKIP</a> ([i915#9323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_close_race@multigpu-basic-process:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@gem_close_race@multigpu-basic-process.html" moz-do-not-send="true">SKIP</a> ([i915#7697])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_engines@invalid-engines:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-7/igt@gem_ctx_engines@invalid-engines.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@gem_ctx_engines@invalid-engines.html" moz-do-not-send="true">FAIL</a> ([i915#12027])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-close:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-close.html" moz-do-not-send="true">SKIP</a> ([i915#8555])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@gem_ctx_persistence@heartbeat-close.html" moz-do-not-send="true">SKIP</a> ([i915#8555])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-close.html" moz-do-not-send="true">SKIP</a> ([i915#8555])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html" moz-do-not-send="true">SKIP</a> ([i915#1099]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@invalid-args:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-7/igt@gem_ctx_sseu@invalid-args.html" moz-do-not-send="true">SKIP</a> ([i915#280])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@mmap-args:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-3/igt@gem_ctx_sseu@mmap-args.html" moz-do-not-send="true">SKIP</a> ([i915#280])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@hibernate:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-3/igt@gem_eio@hibernate.html" moz-do-not-send="true">ABORT</a> ([i915#7975] /
              [i915#8213])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-pair:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@gem_exec_balancer@bonded-pair.html" moz-do-not-send="true">SKIP</a> ([i915#4771])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-3/igt@gem_exec_balancer@bonded-pair.html" moz-do-not-send="true">SKIP</a> ([i915#4771])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@gem_exec_balancer@bonded-pair.html" moz-do-not-send="true">SKIP</a> ([i915#4771])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-submit-fence.html" moz-do-not-send="true">SKIP</a> ([i915#4525]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@gem_exec_capture@capture.html" moz-do-not-send="true">FAIL</a> ([i915#11965]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-recoverable:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html" moz-do-not-send="true">SKIP</a> ([i915#6344])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-deadline:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html" moz-do-not-send="true">FAIL</a> ([i915#2846])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-solo:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@gem_exec_fair@basic-none-solo.html" moz-do-not-send="true">FAIL</a> ([i915#2842]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-vip:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-5/igt@gem_exec_fair@basic-none-vip.html" moz-do-not-send="true">FAIL</a> ([i915#2842]) +3 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@gem_exec_fair@basic-pace.html" moz-do-not-send="true">SKIP</a> ([i915#4473] /
              [i915#4771])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-sync:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@gem_exec_fair@basic-sync.html" moz-do-not-send="true">SKIP</a> ([i915#3539]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-ro-default:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@gem_exec_flush@basic-uc-ro-default.html" moz-do-not-send="true">SKIP</a> ([i915#3539] /
              [i915#4852]) +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-rw-default:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@gem_exec_flush@basic-uc-rw-default.html" moz-do-not-send="true">SKIP</a> ([i915#3539] /
              [i915#4852]) +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-7/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-noreloc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-noreloc.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@gem_exec_reloc@basic-write-gtt-active.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@pi-common@vcs0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@gem_exec_schedule@pi-common@vcs0.html" moz-do-not-send="true">FAIL</a> ([i915#12296]) +4 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@gem_exec_schedule@preempt-queue-contexts.html" moz-do-not-send="true">SKIP</a> ([i915#4537] /
              [i915#4812])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts.html" moz-do-not-send="true">SKIP</a> ([i915#4537] /
              [i915#4812])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_suspend@basic-s4-devices:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@gem_exec_suspend@basic-s4-devices.html" moz-do-not-send="true">ABORT</a> ([i915#7975] /
              [i915#8213]) +1 other test abort</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-12/igt@gem_exec_suspend@basic-s4-devices@lmem0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html" moz-do-not-send="true">ABORT</a> ([i915#7975] /
              [i915#8213]) +1 other test abort</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html" moz-do-not-send="true">SKIP</a> ([i915#4860])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html" moz-do-not-send="true">SKIP</a> ([i915#4860])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html" moz-do-not-send="true">SKIP</a> ([i915#4860])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@gem_lmem_swapping@verify-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@gem_lmem_swapping@verify-random.html" moz-do-not-send="true">SKIP</a> ([i915#4613])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@gem_mmap_gtt@cpuset-big-copy.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +9 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@gem_mmap_gtt@cpuset-medium-copy.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@bad-object:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@gem_mmap_wc@bad-object.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +1 other
              test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-13/igt@gem_mmap_wc@bad-object.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +1 other
              test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@gem_mmap_wc@bad-object.html" moz-do-not-send="true">SKIP</a> ([i915#4083])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@exhaustion:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@gem_pread@exhaustion.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +4 other
              tests skip</li>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb1/igt@gem_pread@exhaustion.html" moz-do-not-send="true">WARN</a> ([i915#2658])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-3/igt@gem_pread@exhaustion.html" moz-do-not-send="true">WARN</a> ([i915#2658])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@snoop:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@gem_pread@snoop.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pwrite@basic-self:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@gem_pwrite@basic-self.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@fail-invalid-protected-context:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-18/igt@gem_pxp@fail-invalid-protected-context.html" moz-do-not-send="true">SKIP</a> ([i915#4270])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@gem_pxp@reject-modify-context-protection-off-1.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-on:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html" moz-do-not-send="true">SKIP</a> ([i915#5190] /
              [i915#8428]) +6 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html" moz-do-not-send="true">SKIP</a> ([i915#8428]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html" moz-do-not-send="true">SKIP</a> ([i915#8411]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html" moz-do-not-send="true">SKIP</a> ([i915#4079])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html" moz-do-not-send="true">SKIP</a> ([i915#4079])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html" moz-do-not-send="true">SKIP</a> ([i915#4079])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_pwrite:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-3/igt@gem_set_tiling_vs_pwrite.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +9 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@evict-snoop:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-16/igt@gem_softpin@evict-snoop.html" moz-do-not-send="true">SKIP</a> ([i915#4885])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@access-control:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-4/igt@gem_userptr_blits@access-control.html" moz-do-not-send="true">SKIP</a> ([i915#3297])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@gem_userptr_blits@access-control.html" moz-do-not-send="true">SKIP</a> ([i915#3297])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-13/igt@gem_userptr_blits@access-control.html" moz-do-not-send="true">SKIP</a> ([i915#3297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@forbidden-operations:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@gem_userptr_blits@forbidden-operations.html" moz-do-not-send="true">SKIP</a> ([i915#3282] /
              [i915#3297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@relocations:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@gem_userptr_blits@relocations.html" moz-do-not-send="true">SKIP</a> ([i915#3281] /
              [i915#3297])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-3/igt@gem_userptr_blits@relocations.html" moz-do-not-send="true">SKIP</a> ([i915#3281] /
              [i915#3297])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@gem_userptr_blits@relocations.html" moz-do-not-send="true">SKIP</a> ([i915#3281] /
              [i915#3297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-overlap:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@gem_userptr_blits@unsync-overlap.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@gem_userptr_blits@unsync-unmap.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-all:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@gen9_exec_parse@allowed-all.html" moz-do-not-send="true">SKIP</a> ([i915#2527]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html" moz-do-not-send="true">SKIP</a> ([i915#2527] /
              [i915#2856]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-cmd:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@gen9_exec_parse@bb-start-cmd.html" moz-do-not-send="true">SKIP</a> ([i915#2856])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-with-fault-injection:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">ABORT</a> ([i915#10131] /
              [i915#9697])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@resize-bar:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@i915_module_load@resize-bar.html" moz-do-not-send="true">SKIP</a> ([i915#6412])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-suspend:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#8399])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@reset:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-tglu-2/igt@i915_pm_rps@reset.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-9/igt@i915_pm_rps@reset.html" moz-do-not-send="true">ABORT</a> ([i915#12309])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-idle-park:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@i915_pm_rps@thresholds-idle-park.html" moz-do-not-send="true">SKIP</a> ([i915#11681])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@i915_pm_rps@thresholds-idle-park.html" moz-do-not-send="true">SKIP</a> ([i915#11681])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_sseu@full-enable:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-6/igt@i915_pm_sseu@full-enable.html" moz-do-not-send="true">SKIP</a> ([i915#4387])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_power@sanity:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@i915_power@sanity.html" moz-do-not-send="true">SKIP</a> ([i915#7984])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@query-topology-coherent-slice-mask:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@i915_query@query-topology-coherent-slice-mask.html" moz-do-not-send="true">SKIP</a> ([i915#6188])</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> ([i915#7707])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> ([i915#7707]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html" moz-do-not-send="true">SKIP</a> ([i915#4212])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html" moz-do-not-send="true">SKIP</a> ([i915#3826])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#8709]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#8709]) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html" moz-do-not-send="true">SKIP</a> ([i915#1769] /
              [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html" moz-do-not-send="true">SKIP</a> ([i915#1769] /
              [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> ([i915#4538] /
              [i915#5286]) +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">FAIL</a> ([i915#5138]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> ([i915#3638]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html" moz-do-not-send="true">ABORT</a> ([i915#10354])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> +11 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> ([i915#3638]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> ([i915#5190]) +2 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> ([i915#6187])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> +42 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> ([i915#4538] /
              [i915#5190]) +10 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> ([i915#4538]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> ([i915#5190] /
              [i915#9197])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313]) +3 other
              tests skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-19/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-4.html" moz-do-not-send="true">SKIP</a> ([i915#4423] /
              [i915#6095])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> +147 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +39 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> ([i915#10307] /
              [i915#6095]) +184 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313]) +2 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#10307] /
              [i915#10434] / [i915#6095]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +115 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +97 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#4087]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@vga-edid-read:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@kms_chamelium_edid@vga-edid-read.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_chamelium_frames@hdmi-crc-multiple.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@vga-frame-dump:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@kms_chamelium_frames@vga-frame-dump.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html" moz-do-not-send="true">SKIP</a> ([i915#7828]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#6944] /
              [i915#7116] / [i915#7118] / [i915#9424])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-16/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#7116] /
              [i915#9424]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@content-type-change:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-16/igt@kms_content_protection@content-type-change.html" moz-do-not-send="true">SKIP</a> ([i915#9424])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_content_protection@dp-mst-lic-type-0.html" moz-do-not-send="true">SKIP</a> ([i915#3299])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_content_protection@dp-mst-type-1.html" moz-do-not-send="true">SKIP</a> ([i915#3116] /
              [i915#3299]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> ([i915#6944] /
              [i915#9424]) +3 other tests skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> ([i915#9424])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-4/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> ([i915#9424])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-3/igt@kms_content_protection@type1.html" moz-do-not-send="true">SKIP</a> ([i915#7118] /
              [i915#9424]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> ([i915#7118] /
              [i915#9424])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-alpha-opaque:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-10/igt@kms_cursor_crc@cursor-alpha-opaque.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_cursor_crc@cursor-alpha-opaque.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) +22 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-32x32:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_cursor_crc@cursor-random-32x32.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-3/igt@kms_cursor_crc@cursor-random-32x32.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +4 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-32x32.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8814])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x512:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send="true">SKIP</a> ([i915#11453]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html" moz-do-not-send="true">SKIP</a> ([i915#8814])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-32x10.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> ([i915#4103]) +1 other
              test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> ([i915#4103] /
              [i915#4213])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> ([i915#4103]) +1 other
              test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html" moz-do-not-send="true">SKIP</a> ([i915#4103] /
              [i915#4213])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#9809]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html" moz-do-not-send="true">SKIP</a> ([i915#9067])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html" moz-do-not-send="true">SKIP</a> ([i915#9067])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html" moz-do-not-send="true">SKIP</a> ([i915#9067])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html" moz-do-not-send="true">SKIP</a> ([i915#9067])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9723])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@mst-extended-mode-negative:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_display_modes@mst-extended-mode-negative.html" moz-do-not-send="true">SKIP</a> ([i915#8588])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-5/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840]) +1 other test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-4/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840] / [i915#9159])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> ([i915#3840])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-formats:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@kms_dsc@dsc-with-formats.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3840] /
              [i915#9053])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3840] /
              [i915#9053])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> ([i915#4854])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-19/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> ([i915#4854])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_feature_discovery@display-2x.html" moz-do-not-send="true">SKIP</a> ([i915#1839])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> ([i915#1839]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb4/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) +5 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html" moz-do-not-send="true">SKIP</a> ([i915#3637]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#8381])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@kms_flip@2x-flip-vs-fences-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#8381])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz-do-not-send="true">SKIP</a> +10 other tests skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-16/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz-do-not-send="true">SKIP</a> ([i915#9934]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-3/igt@kms_flip@2x-modeset-vs-vblank-race.html" moz-do-not-send="true">SKIP</a> ([i915#3637]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-fences-interruptible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_flip@flip-vs-fences-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#8381]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#4423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@kms_flip@flip-vs-suspend@c-edp1.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#6113]) +1
              other test incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-7/igt@kms_flip@plain-flip-fb-recreate.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_flip@plain-flip-fb-recreate.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) +4 other
              tests fail</li>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate.html" moz-do-not-send="true">FAIL</a> ([i915#2122])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2.html" moz-do-not-send="true">FAIL</a> ([i915#2122])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2.html" moz-do-not-send="true">FAIL</a> ([i915#11989])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555] / [i915#5190]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555] / [i915#8813]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) +29 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> +62 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#8708]) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html" moz-do-not-send="true">SKIP</a> ([i915#5439])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> ([i915#3458]) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> ([i915#10433] /
              [i915#3458])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> +24 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#8708]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> ([i915#8708]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> ([i915#3458]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> ([i915#1825]) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> ([i915#1825]) +44 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html" moz-do-not-send="true">SKIP</a> ([i915#3023]) +31 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-5/igt@kms_hdr@bpc-switch.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-suspend:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-swap:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_hdr@static-swap.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_hdr@static-swap.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_hdr@static-swap.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-hsync-end:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-6/igt@kms_invalid_mode@bad-hsync-end.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_invalid_mode@bad-hsync-end.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#10656]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#10656])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#12339])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-1/igt@kms_plane@pixel-format.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane@pixel-format.html" moz-do-not-send="true">SKIP</a> ([i915#8825])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane@plane-panning-bottom-right.html" moz-do-not-send="true">SKIP</a> ([i915#8825])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-none:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_plane_lowres@tiling-none.html" moz-do-not-send="true">SKIP</a> ([i915#3582])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#10226] /
              [i915#11614] / [i915#3582]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#11614] /
              [i915#3582])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_plane_scaling@2x-scaler-multi-pipe.html" moz-do-not-send="true">SKIP</a> ([i915#5354] /
              [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">FAIL</a> ([i915#8292]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-15/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html" moz-do-not-send="true">FAIL</a> ([i915#8292])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#8152] / [i915#9423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#8152])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-13/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html" moz-do-not-send="true">SKIP</a> ([i915#8152] /
              [i915#9423]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-11/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#8152])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html" moz-do-not-send="true">SKIP</a> ([i915#6953] /
              [i915#8152] / [i915#9423])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html" moz-do-not-send="true">SKIP</a> ([i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#8152])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-dpms:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_pm_backlight@fade-with-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#5354])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> ([i915#9685])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@screens-disabled:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-7/igt@kms_pm_lpsp@screens-disabled.html" moz-do-not-send="true">SKIP</a> ([i915#8430])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9519]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_pm_rpm@dpms-non-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">SKIP</a> ([i915#9519]) +1 other
              test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@pm-caching:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_pm_rpm@pm-caching.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@system-suspend-modeset:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-5/igt@kms_pm_rpm@system-suspend-modeset.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_pm_rpm@system-suspend-modeset.html" moz-do-not-send="true">SKIP</a> ([i915#3547])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc-hybrid:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#9808])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#12316]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_psr2_su@page_flip-p010.html" moz-do-not-send="true">SKIP</a> ([i915#9683])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_psr2_su@page_flip-xrgb8888.html" moz-do-not-send="true">SKIP</a> ([i915#4348])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_psr2_su@page_flip-xrgb8888.html" moz-do-not-send="true">SKIP</a> ([i915#9683])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_psr2_su@page_flip-xrgb8888.html" moz-do-not-send="true">SKIP</a> ([i915#9683])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-sprite-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_psr@fbc-pr-sprite-blt.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +14 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-sprite-blt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@kms_psr@pr-sprite-blt.html" moz-do-not-send="true">SKIP</a> ([i915#9688]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-sprite-mmap-cpu:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-7/igt@kms_psr@pr-sprite-mmap-cpu.html" moz-do-not-send="true">SKIP</a> ([i915#9732]) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +32 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-mmap-cpu:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_psr@psr2-primary-mmap-cpu.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +5 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> ([i915#9685]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-90:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-5/igt@kms_rotation_crc@primary-rotation-90.html" moz-do-not-send="true">SKIP</a> ([i915#11131]) +1 other
              test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-90.html" moz-do-not-send="true">SKIP</a> ([i915#11131])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> ([i915#5289]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> ([i915#11131] /
              [i915#5190])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> ([i915#5289])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_selftest@drm_framebuffer:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_selftest@drm_framebuffer.html" moz-do-not-send="true">ABORT</a> ([i915#12231]) +1 other
              test abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-16/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> ([i915#8623])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-9/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> ([i915#8623])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> ([i915#8623])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@lobf:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-3/igt@kms_vrr@lobf.html" moz-do-not-send="true">SKIP</a> ([i915#11920])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@negative-basic:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_vrr@negative-basic.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#9906])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html" moz-do-not-send="true">SKIP</a> ([i915#2437] /
              [i915#9412]) +1 other test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html" moz-do-not-send="true">SKIP</a> ([i915#2437] /
              [i915#9412])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-13/igt@kms_writeback@writeback-check-output-xrgb2101010.html" moz-do-not-send="true">SKIP</a> ([i915#2437] /
              [i915#9412])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html" moz-do-not-send="true">SKIP</a> ([i915#2437] /
              [i915#9412])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-invalid-parameters:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> ([i915#2437])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> ([i915#2437])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-3/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> ([i915#2437])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> ([i915#2437])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-7/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> ([i915#2437])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@per-context-mode-unprivileged:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html" moz-do-not-send="true">SKIP</a> ([i915#2435])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-idle-check-all@ccs0:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-1/igt@perf_pmu@busy-idle-check-all@ccs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all@ccs0.html" moz-do-not-send="true">FAIL</a> ([i915#4349]) +3 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-idle-check-all@vcs0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@perf_pmu@busy-idle-check-all@vcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@perf_pmu@busy-idle-check-all@vcs0.html" moz-do-not-send="true">FAIL</a> ([i915#4349]) +8 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-18/igt@perf_pmu@busy-idle-check-all@vecs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@perf_pmu@busy-idle-check-all@vecs0.html" moz-do-not-send="true">FAIL</a> ([i915#4349]) +2 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6-all-gts:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html" moz-do-not-send="true">SKIP</a> ([i915#8516])</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@sriov_basic@enable-vfs-autoprobe-on.html" moz-do-not-send="true">SKIP</a> ([i915#9917])</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@fbdev@nullptr:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@fbdev@nullptr.html" moz-do-not-send="true">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@fbdev@nullptr.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-10/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#7297])
              -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_engines@invalid-engines:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-1/igt@gem_ctx_engines@invalid-engines.html" moz-do-not-send="true">FAIL</a> ([i915#12027]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-2/igt@gem_ctx_engines@invalid-engines.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@hibernate:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-3/igt@gem_eio@hibernate.html" moz-do-not-send="true">ABORT</a> ([i915#10030] /
              [i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@gem_eio@hibernate.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@rcs0:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-5/igt@gem_exec_fair@basic-pace@rcs0.html" moz-do-not-send="true">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-no-display:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-snb5/igt@i915_module_load@reload-no-display.html" moz-do-not-send="true">ABORT</a> ([i915#11703]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb2/igt@i915_module_load@reload-no-display.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-with-fault-injection:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">PASS</a></li>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">PASS</a></li>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@workarounds:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-3/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">ABORT</a> ([i915#12216]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-7/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@basic-s3-without-i915:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#4817])
              -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-max:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_color@ctm-max.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_color@ctm-max.html" moz-do-not-send="true">PASS</a> +15 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_fbcon_fbt@fbc.html" moz-do-not-send="true">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_fbcon_fbt@fbc.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-7/igt@kms_flip@blocking-wf_vblank.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@kms_flip@blocking-wf_vblank.html" moz-do-not-send="true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-13/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html" moz-do-not-send="true">FAIL</a> ([i915#12138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#4839] /
              [i915#6113]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-6/igt@kms_flip@plain-flip-ts-check-interruptible.html" moz-do-not-send="true">FAIL</a> ([i915#11989] /
              [i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-4/igt@kms_flip@plain-flip-ts-check-interruptible.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-2/igt@kms_flip@wf_vblank-ts-check.html" moz-do-not-send="true">FAIL</a> ([i915#11989] /
              [i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html" moz-do-not-send="true">FAIL</a> ([i915#11961]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-snb6/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb6/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html" moz-do-not-send="true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-tglu-6/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html" moz-do-not-send="true">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html" moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-6/igt@kms_hdr@static-toggle.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-10/igt@kms_hdr@static-toggle.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-top-left:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane@plane-panning-top-left.html" moz-do-not-send="true">SKIP</a> ([i915#8825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_plane@plane-panning-top-left.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html" moz-do-not-send="true">SKIP</a> ([i915#8152] /
              [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c.html" moz-do-not-send="true">PASS</a> +11 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#6953] /
              [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms-negative:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_pm_dc@dc5-dpms-negative.html" moz-do-not-send="true">SKIP</a> ([i915#9293]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_pm_rpm@dpms-non-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-5/igt@kms_pm_rpm@dpms-non-lpsp.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_properties@plane-properties-legacy:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_properties@plane-properties-legacy.html" moz-do-not-send="true">SKIP</a> ([i915#11521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-1/igt@kms_properties@plane-properties-legacy.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg1-18/igt@kms_setmode@basic.html" moz-do-not-send="true">FAIL</a> ([i915#5465]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg1-18/igt@kms_setmode@basic.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-tglu-9/igt@kms_setmode@basic.html" moz-do-not-send="true">FAIL</a> ([i915#5465]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-tglu-6/igt@kms_setmode@basic.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-mtlp-1/igt@kms_setmode@basic@pipe-b-edp-1.html" moz-do-not-send="true">FAIL</a> ([i915#5465]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-mtlp-1/igt@kms_setmode@basic@pipe-b-edp-1.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_vblank@ts-continuation-dpms-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-7/igt@kms_vblank@ts-continuation-dpms-suspend.html" moz-do-not-send="true">PASS</a> +37 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html" moz-do-not-send="true">SKIP</a> ([i915#7091])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@mock:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-11/igt@i915_selftest@mock.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#1982] /
              [i915#9311]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-4/igt@i915_selftest@mock.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#9311])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-2/igt@kms_async_flips@invalid-async-flip.html" moz-do-not-send="true">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html" moz-do-not-send="true">SKIP</a> ([i915#6228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> ([i915#9531]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11853/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> ([i915#9197])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15469/shard-dg2-10/igt@kms_bi" moz-do-not-send="true">SKIP</a> -&gt; [SKIP][446]
              ([i915#9197]) +1 other test skip</li>
          </ul>
        </li>
      </ul>
    </blockquote>
  </body>
</html>

--------------9bPJZFql9EbYnrzrdACps8AN--
