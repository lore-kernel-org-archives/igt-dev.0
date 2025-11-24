Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A07CFA466
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 07:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD1C10E1D6;
	Mon, 24 Nov 2025 07:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WiFkHuG9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D62E10E1D4
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 07:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763969170; x=1795505170;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VcAnskwaERKYLmxyN3jR9pGyD7bzbDonQPWyBCBV2DI=;
 b=WiFkHuG9762B/kVeAj2xGgppGeRtllMoJYLXqDiogGOS8cuD2o4QtYIm
 1stnRCyrXNJlHrHLcbBoxTgbIKCBiYoXR17wdLzPkBBpVA8PECFg2wk43
 kwRUTeffjd0xd3snYvPEGKwfsBAxTMei0Oa1NMhE14Sho7SOt4wpTD6Sw
 Gj41hsQJbaqPWq505Pa098wZSd+wlo8/E2gP/C95CIgo3s0gFjNDyBYWe
 FdiPTAUplmroNZqU9/uDPmwnUS2npUKUEWM0J8kGXuwLk0EsDTOUpdVxL
 n6srWSlpk2nn9OldLm+iKJBrFwiQpJIRGSzAsq1iP2CekD1e488/+47te w==;
X-CSE-ConnectionGUID: VeDkb5+ZQ0COmbesndLRPg==
X-CSE-MsgGUID: bxbaMJ1jQPemdD+iiuMY6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76573642"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="76573642"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 23:26:09 -0800
X-CSE-ConnectionGUID: SK4PsejYSIWUv9WUKg/TZw==
X-CSE-MsgGUID: pXfq62HjQLGOBs+iuhfYUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="196714383"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 23:26:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 23 Nov 2025 23:26:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 23 Nov 2025 23:26:07 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 23 Nov 2025 23:26:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZEUisRUBHFwpTLQkQ9/CT7B6hawlHvzQfxicye2aTP3JMZUX9o5saW5dKQfeoEdTpxJBaHR2VWDiGRy7YnhJaTszVSlWz2hkvgb2rbZEEzb+bwO/n5wbS0pPImlYaoMBe9D8wjnYgXOx0rjBW30QRhtwT76FGCIJ1TkimYgnoWVBcSpNwxDrgBI/m1SY2psmnwyeDPuOTHihPUHqFRCCZvcNQ5WkFt2brF5VH/pRFOlUW6lcJ/NIZTUiuqIqG4mHiBP549MZOdtHANQ1HhW6IrgFAU1GoZH5U3EfJ/1xdrR1wyHNm0LB07sYz0u+C+v3a3hXHqdG8V9TAJbs8XBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6vb+zTPnj0iBlO1+eirnodnGjJhQKJgBNeGYDtEnrg=;
 b=CXD1fG5yS9qlLs71nSVAlW3wJuZxwFUlxi4cu4NPPLbqX2x6zKoDvlMjCSlKkuxQR992YZJQVDOS4f5BZMSQUmObEpmJQ/zeewTR+220M67PZuLcNVd7x8yk8tu77eNY9oTl14CO1QEnS+cpXFTythrnezVdIXLFugOZwC+t6/eDi23LbRUlKMkbHl3p9WMWl4cXzmBrbeS6W5xRLxbQLMfeuXhmQ8ygxXBgWLI8qDfhDLO04GPOYZmq4n5ynArZ+owO0s9ZAC3bsNw+lA7CIprTOBwd8yi/J6CPmyZkgq9WAw2Xua9t4M7KG9AgjIZ7faviP+WD0LYNeHPjrqCUwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SN7PR11MB8025.namprd11.prod.outlook.com (2603:10b6:806:2dc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 07:26:05 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9343.009; Mon, 24 Nov 2025
 07:26:05 +0000
Message-ID: <790c69ee-1224-482c-a4bc-17a824db7f24@intel.com>
Date: Mon, 24 Nov 2025 12:55:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/8] lib/kms: Nuke PIPE_ANY
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
 <20251121190633.24522-3-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20251121190633.24522-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::23) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SN7PR11MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: 747a5565-7d48-45eb-5f3b-08de2b2aba98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjdFY0FYWXJDM1plVVJhcDkvc0lNR1RPL0JwRm5ybnh1cE5Ya1YyeXFQcERq?=
 =?utf-8?B?OHNEeWJmQTJwN1lkeEpGMzg0NTA2SEJ2c3dpK2puTDFYaE5wcnpzWlRycUIw?=
 =?utf-8?B?QTJLcXVTQTY1S1dtb3d6KzI2eGtEQVRDTGlmQUc0QkxnRlNtNWJrSll0azR0?=
 =?utf-8?B?amd0QllyYzhQRUNxTDY0bkM1VjlJSStaRXBJeWNlcE1CZGdwM1g5SHdnb2ZN?=
 =?utf-8?B?UUU5Mk1OWFFvbm9HdnF3elRSZW1FRmdrVGhiY2ZhNFdWK2NoTHY2MFIzRWFY?=
 =?utf-8?B?aUVDSFBURU1IRlJzOGhLRTJEOUJGWUhXOW41M2VzYitXS3VMdW9wcWovc0xl?=
 =?utf-8?B?T2R0R0RBdlluS1BJT1FDWmVGZEdGTE9nTStVNldnbmt1RXUxTDd5M0dNQkx4?=
 =?utf-8?B?bDdsK2FSazNXaEk3TDdmSzVMeEFRWmNRdmZwczB5Yk9rSEtsZVFCZmt3aE90?=
 =?utf-8?B?TG02VWdvSWErNW01THJZS3JnRDkxMWkreGhZbit5aXhOeklDSURRSVUxRDVo?=
 =?utf-8?B?S0FrOS9YaGZXcWRzTXk5aUVJeitwb3FvZklzOGUweUU3bXViT1Z0dGpjZXNx?=
 =?utf-8?B?a1J6bCtnVDh5SGZwa2Rzemw1UU5sZW1yM2RDVEhMM0hqTVlKQUVlaXdzcEJB?=
 =?utf-8?B?MkliL016a2FmdmlET1ZpNlYzNG5HQzY0WVFkNUlrbi8vV2p1WGtJR1hiMG1w?=
 =?utf-8?B?dGVnWXUzUjNGMk0zbzBKd3JTUDVPVE1GZFBmb01UZ2hFQkdhcDZSYWhLejIv?=
 =?utf-8?B?MmZUMjd3bldvWmNmbWk1YjVyYjF2OFIxcURSS1ZGVk9vbmM2b2g1QzVraEd4?=
 =?utf-8?B?SGZVRTNWWjRORmFWS0hJdVVUVDhhYUlvNDloVEFrWE03dTlIVDk2RDV1UXZ5?=
 =?utf-8?B?aTZoYXBIN0hEbVNYZFpqZ1R3TCtuSUdMajRnR0JvZ3F3RUQxMXhCQmlsdzNJ?=
 =?utf-8?B?alhuUnhoa3BldlBpeTlLMnBRWmN6WFJVdlp1VGZMeWlMNmVweld5d3pGQmxJ?=
 =?utf-8?B?aFBYczlYZ1hEUS84T05HUzZCNVk5U1B1aTZUTjNRUXZXMXZQSzR0SktMV3pm?=
 =?utf-8?B?aUZrNUludXpHVno1bUQ1Z09YS29jK0NsblBPUDRnWVJlSVVkUDZMendqUndY?=
 =?utf-8?B?a29UNk1nbVB0Y0lZSE8wZkQ2SDV1dlVhbGt5UjRqajBpdTAwZkVMY3hQYlpS?=
 =?utf-8?B?ZUpFSVZoUk1YZXhFV3pXcGduQ1Vid2FqY2g5Y3RnclJOVTA2KzI2Q0RYdGQ2?=
 =?utf-8?B?bElwSHVzMFE3SVFUZ3ExUThRcHFUUklZYm1LdlQ2Y1VTWXNKZWsrelZoU3g5?=
 =?utf-8?B?elZBL2I4UFN0ZzZrVHhEejJ4U24wV0puc3Zkc2hLVzd6N2cvS0N3RjNVS1J1?=
 =?utf-8?B?eWRNU0tJT3VRdDVEaDZDTFB6RWw3QUZOYUg2czlEV2xKZnpJMFZyS1JMalU4?=
 =?utf-8?B?MlR1RlVaR1RaS3dreHpnL1dPZkoxc3RZNkJIYmZQbzFHbUlVTk0xZ3EzelhP?=
 =?utf-8?B?eWlxWWluVjNqUnJ4VXVaVVViWWhGeE5xMTRBSXZydE9ZZWRSUjViVVpBUC9q?=
 =?utf-8?B?SlhiYmh2VTkwK2FEYS95UGVUYkJkR0NIZURWL1lQVXdFMFlJV2xuZFlKTGpH?=
 =?utf-8?B?ZE5uYlVxTkpLMkpuYmg5eFlJbHNhVFpraGdldytOaGVUaDA0YVoyakN3dW84?=
 =?utf-8?B?ampzOUx4ckxTSGkzTHc1c0pHL1ZIbHQwWkd3cHlPMVhEa0ppTFZNLzBYSTAz?=
 =?utf-8?B?TDNUaDh4bkxqek9OV0tTcW1yK2pTUFk0akNId0dpN2NuL1o5MEpYYTMvSUFX?=
 =?utf-8?B?QnkxbzR0Y09QdmFXTlllZWg4bXI5WC8yQklXdnQ4UXdtNndoUTNSSDRhVEFI?=
 =?utf-8?B?c0ZwVjBoZldpWmZtZ2dBbDNrcHRGdzVFMEVOSi9IWmxDN1Vaa24rQnpocmU5?=
 =?utf-8?Q?AEPia0N/dGsJIF1AqfP8OPNuPDt7RwoL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WENtREQwcjZXbk5XYnhuNmxrOVlMelh3STdzeW1xb0JjRDIyby9iVzYyYUxm?=
 =?utf-8?B?d1VNV2pDVTFGelpWNVhQQm1sUzJCYnBrNTN6Vk1SVTJCMk5yWlhHNXFBU3Fa?=
 =?utf-8?B?OEgwUnM2VkpvbXY2VTcvem44bGk5TUVuZHgzNmhCaTFxUE96T2Z0cWtXN1FH?=
 =?utf-8?B?TDB1YU1QdXN0dFpDWTB0K01FenF4MzRPSTMvTDk3L0xYREpOWUhZTzdBTWt1?=
 =?utf-8?B?UC9FZlMxRTVtZDlkTmdKdnBRbzBsTk9PZnRibU9UeW01Y1YzRE16L3Z0Q3Zl?=
 =?utf-8?B?dWxzMHljaWdlNEtRMFU4ZzErb1RDNzFCbUNxYk1kRGViaHo2UmljY0N5RlV5?=
 =?utf-8?B?SHh4ZzRCV1pKQ2sraCtXcXEycURmMm1KcC9UYWxnZnlMQUFCV0x3QkF6elpa?=
 =?utf-8?B?S2pNdWROMTE1cjgzOHZHSTB3OEw0R09ZTUZaYStvaFNwRURhMUFSTm55MWFD?=
 =?utf-8?B?MXdvMmIyRWEzZWJhZGRVOVBuWjlvRXpoRGxpNGc5OXZjcnV1VXRObVFhNHFx?=
 =?utf-8?B?eGdORUwwazRFRFZ2N1A5Vjg3cUYyaWJ1aVNwY1NuUStML25aNW9TYmlENStJ?=
 =?utf-8?B?aDhvdFZZNkFlaU5ZZGZJQTdPakNwdCtueCtqUHA3RzZZejlLT0JVVE82Q0hN?=
 =?utf-8?B?c0xyQWs3bVVMWUU3SHlKSGlIeVBveTdNZ0xVamsvemk2QWhYc3dCUWNTVUZL?=
 =?utf-8?B?djlmdVo3dGpCSTVLY080NDdOcnN0RURpdk1wZnpoRzZHRFVqWjlVdDJmSWpy?=
 =?utf-8?B?ZlVFTDNkS2RlQzBSRm01OTlJODZpMGc1OVRvOWsweFMxeTIyM1ROc0VwcE5u?=
 =?utf-8?B?QXVhOEpNQjgreW85bTV5Z0Fmc1VFRzlJQWtsOWlkQkpNVml2Z2JKaVJLS0VB?=
 =?utf-8?B?T0ZobHhDMWJjS3NlaU0yUjVvNDBrS1BNTjdJZkZEUzNjd2pweWRkMUxsVUFO?=
 =?utf-8?B?M3VMNzczSTB4SVk5MnpBTzlpWGozQ3d5QXhQcGNBdHEyb2pOVWdlOGZYNTRM?=
 =?utf-8?B?dmxOWjAyaXJGaHhIcjVkVmRMaVExRW5FbVhVOWcweStvMHd2ZXZwYURZY2hq?=
 =?utf-8?B?THJMeStEVnQ0QzlLUlk0N0tlVDVBbXdwK203QWFBWUp6UEV3Zm5USXBzUHBW?=
 =?utf-8?B?VGp6V2IzZmhqT1ZOS1EwNTFJYkxqUUhGVnMzSUVycnp3M3h3K1NZdmRJRGJN?=
 =?utf-8?B?MFcvbjJ5WTFUYnVnR0tRSVVtRldPcmEyWWh5YktkNkZPVFUxaTBKRjZyQ0gv?=
 =?utf-8?B?a01QNnFvS2FTbWJKMDI0YnhvQmhFeExwWlRBTzNidW82b0FWTGhIMDNkZG91?=
 =?utf-8?B?ZXhZbm5ORklRMWNiZG0wcCt5Sm9iam9HT29CSW1ueHlENCtheFVpVjdjRW9x?=
 =?utf-8?B?c1RJaUxtYmhSVEJiMlN1SUxubW1hNFJWTmMvZUJMYTRIdVJKdUFRVTVycTM0?=
 =?utf-8?B?Zm4xL3g5dSt6QmlyQ1dXTXErbzg2NVNlVEtEWVVsa2tXRHhxcHFsT2dTb3NN?=
 =?utf-8?B?aUx2ek5qd3IvTmxnZFNNc3JmUEVNaTVSMXJBTXRNT2FRNDIzaUZMNW5mUkJL?=
 =?utf-8?B?NjBBOVM3T01zaDdmWnRPSlBzMGMyMDhwekdwVVdyVXNnbmd1NXJGcUllZ3lq?=
 =?utf-8?B?eXZHc09KR2dqMXkxMEY3dFBQc3VkZ00yT1k5WjZrK0thVm10T3o1M0hLbmhP?=
 =?utf-8?B?SWh4RDZCSU1WRm53dko2ZTZFMTc5b3V6a0ZzS2JtQmN0Ulhvby9Pd24xbzFZ?=
 =?utf-8?B?UXdkZU5Sem9DclRDbHlnTnFEdVdJYXVUTHh1OXZzMm13elNTUDREZ05DTkFt?=
 =?utf-8?B?cG1GbWxhTW12eVZVdmNJYjFkMytrbEVVckRsL2cvSzAwTFFkQ2JoMWxoRDM4?=
 =?utf-8?B?MW4za3IwSFhQeURSZXRaV2VMNWJMVms4ekVpd3BXeDF3dzJLdFFQdk5wcytR?=
 =?utf-8?B?c05iYnAyZDJlNWdNTXFrSFUwc21pSDN5Wk85RTRmVlZ1aURsMGM0NGZic1ly?=
 =?utf-8?B?WUQxRlhIemVXRXZVcXh1RjZ1RnJiZlo4Nkw5MDJObFlHTUJQbkZIOUVlREo4?=
 =?utf-8?B?aFRwY1l1SDlGR3JhbHVFY0Qza2IzMHpwdkp6T1lBWFM2L0twdWdvSXRzclNJ?=
 =?utf-8?B?RFExTWloZ3pscDI3aVZ0KzFCWDUvL0orUDM3WU5UMTV6clBncEtzNHozdWJv?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 747a5565-7d48-45eb-5f3b-08de2b2aba98
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 07:26:05.6038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlYW6VKjEtUdQev4yksNba+KnrXNdqOBaNbWKbCsVoat5uRppGnDvmlHsHF1lRB/s8ZBMUyNWb5gVoTvN4umlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8025
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

Hi Ville,

On 22-11-2025 12:36 am, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> For some reason we have two names for the same
> enum value (PIPE_NONE and PIPE_ANY). Get rid of
> the less used one.
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Done with cocci:
> @@
> @@
> enum pipe {
> ...,
> - PIPE_ANY = PIPE_NONE,
> ...
> };
>
> @@
> @@
> - PIPE_ANY
> + PIPE_NONE
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   lib/igt_kms.h                  | 1 -
>   tests/intel/kms_fb_coherency.c | 2 +-
>   tests/intel/kms_flip_tiling.c  | 2 +-
>   tests/intel/perf_pmu.c         | 2 +-
>   tests/intel/prime_mmap_kms.c   | 2 +-
>   tests/kms_flip_event_leak.c    | 2 +-
>   tests/kms_plane_multiple.c     | 2 +-
>   tests/vmwgfx/vmw_prime.c       | 2 +-
>   8 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index f7ff0b17eb02..e1241342a0c9 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -72,7 +72,6 @@
>    */
>   enum pipe {
>           PIPE_NONE = -1,
> -        PIPE_ANY = PIPE_NONE,
>           PIPE_A = 0,
>           PIPE_B,
>           PIPE_C,
> diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
> index 573037db1102..5f5bf7b8e9df 100644
> --- a/tests/intel/kms_fb_coherency.c
> +++ b/tests/intel/kms_fb_coherency.c
> @@ -144,7 +144,7 @@ static void cleanup_crtc(data_t *data)
>   
>   	igt_plane_set_fb(data->primary, NULL);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit(display);
>   
>   	igt_remove_fb(data->drm_fd, &data->fb[0]);
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index d078653e9d91..a6a162b94817 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -176,7 +176,7 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
>   	/* Clean up. */
>   	igt_plane_set_fb(primary, NULL);
>   	pipe_crc_free(data);
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   
>   	igt_remove_fb(data->drm_fd, &data->fb[0]);
>   	igt_remove_fb(data->drm_fd, &data->fb[1]);
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index bf43da8db57b..e06ddafaf4e6 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -1079,7 +1079,7 @@ static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, NULL);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit(display);
>   }
>   
> diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
> index c0c2f2fc0e00..a8d84f034d94 100644
> --- a/tests/intel/prime_mmap_kms.c
> +++ b/tests/intel/prime_mmap_kms.c
> @@ -161,7 +161,7 @@ static void cleanup_crtc(gpu_process_t *gpu)
>   
>   	igt_plane_set_fb(gpu->primary, NULL);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit(display);
>   
>   	igt_remove_fb(gpu->drm_fd, &gpu->fb);
> diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
> index 71b58b4dfe31..d88b08d16dbc 100644
> --- a/tests/kms_flip_event_leak.c
> +++ b/tests/kms_flip_event_leak.c
> @@ -97,7 +97,7 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
>   	igt_device_set_master(data->drm_fd);
>   
>   	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit(&data->display);
>   
>   	igt_remove_fb(data->drm_fd, &fb[0]);
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 4e6ca780a6ed..947a0e6bc591 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -120,7 +120,7 @@ static void test_init(data_t *data, enum pipe pipe, int n_planes)
>   static void test_fini(data_t *data, igt_output_t *output, int n_planes)
>   {
>   	/* reset the constraint on the pipe */
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   
>   	igt_pipe_crc_free(data->pipe_crc1);
>   	data->pipe_crc1 = NULL;
> diff --git a/tests/vmwgfx/vmw_prime.c b/tests/vmwgfx/vmw_prime.c
> index 5c39ff1a4d45..5f0556c0c6a8 100644
> --- a/tests/vmwgfx/vmw_prime.c
> +++ b/tests/vmwgfx/vmw_prime.c
> @@ -185,7 +185,7 @@ static void cleanup_crtc(struct gpu_process_t *gpu)
>   
>   	igt_plane_set_fb(gpu->primary, NULL);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit(display);
>   
>   	igt_remove_fb(gpu->mdevice.drm_fd, &gpu->fb);

