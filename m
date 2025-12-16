Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1ECD5C0C8
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 03:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8198010E29B;
	Tue, 16 Dec 2025 03:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GKDv5eoL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCE210E29B
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 03:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765855534; x=1797391534;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zKAgksqQnVRylUkvkL61AwWIzcwxR3fd+z5+OdFXbG0=;
 b=GKDv5eoLZTLuowT5K4mvhpHXJ79hD2iMq90xnaKwugnJCyZyGEdnVJ1V
 dpKuEyTWFOdP8qC47IcD7DPsue3xkXhHEX0ivPF26XLgejTazWroa85tj
 fnoY0vydj5smx6i7Gaid5zAloZCp4xr/DqhW+0U+DiiBXqjQZaNNlTZQX
 AkducUzUyhM8KFVOX/vLnlkzCcrrENDYohxl+PjIqsBCG6EqDA7lxw9dN
 v7FapPLX8YENSlfN3oIOZ7z/vFyKnS6naFT8q0O1vLDPe/GWdit/i7peG
 hPX/yM1SrQNyMN/8h01lYwkOsB3ZYsB0mUTJjAWpiF3fN6UhJNKlg9MPc g==;
X-CSE-ConnectionGUID: pYqzbwlMQ7GxkpZkOZn2Rg==
X-CSE-MsgGUID: K55V5tK1QDa7VervhDZ36w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93244709"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="93244709"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 19:25:33 -0800
X-CSE-ConnectionGUID: GfWM42P0Q6W5U/aPJndJFg==
X-CSE-MsgGUID: QQJKuo0qRGCKAoOmTR6gog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197791620"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 19:25:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 19:25:33 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 19:25:33 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 19:25:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzbKrRU69QsxtlZNnSoghaDmFwZrbob4lvG9t4wHE99/U2Qw7isNm9PlM7dluoI3yzXmbu9jcIjoPthAVvr1CfNpENZILYOh8hjaTde3vGCplXjrwK0aVS1k6MjRNC2RC+XlnEmKpFI1FHvsgx/yfjnRPFEY6IsGHbRAJ1HAjdfwT+ncCGdRzVH7PyVAbLUE/nZ1of49gLqbd3XH/6lsfZ5v8W5rLZvCXPOmBGQwVPhzHmId4lMqdGM8n3SotWSahueuG7CxCcaswrzkopatRJ7hHPYpaDNVTOoUHrrQ2JnHXgeM0WwR5o2lzODhGJrr0eLWeLmTsxwL5LYRi7svWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V50NDoKwHX1s5rVpDRhFdMila7lOY9NOr7f1FS9x6/U=;
 b=NBsLLgxa99OyB64q98HkjvgCdqcRAtvVLmyuoQuT8ZZERR0WREITHyeX7kh5EoruozB5DoJzTLfhxOMJkW2EwbaQBCORmMdEuNWTYIVzDYgTX7mvK7H7v4QR/2oqjMMUCuTeD/AWO3pUU7rZptcXTpQuVtbyUGmTaJixXdz6xX7c+SXW6/c48m7AcE5IgSMTJbRdG4D9bXXeoLxTi3agR1N8pQYoJJUm2Y/fll1jL3EIQjorRTrooY2J3csyfJxGjIQeacitUOhicc5WTODwjf30uQ8eUNfye8DrcjvVmb8TSEySkSKtlqEM5ly159h8wmgb9CiuYeQjtjCoIJZksA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 03:25:25 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 03:25:25 +0000
Message-ID: <221bd65f-c20a-4f20-8f12-76bf758c625d@intel.com>
Date: Tue, 16 Dec 2025 08:55:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/4] tests/prime_udl: Fix opening
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
 <20251215223639.117028-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251215223639.117028-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0161.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::12) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: a417d738-7717-4ffe-54fa-08de3c52c0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|42112799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amFSSmhLQ0JaNldXWGJUMERwUmk5ODNTWkVhOWlDdDdmQ0QvQjBaektwemx0?=
 =?utf-8?B?T2pMRXl2YkFPUElwUWpEMy9HTFZYV0ZBSnVFTlcveEZGRVhLWk91VFF6d0xR?=
 =?utf-8?B?eHdQcUNsRkhXQ2NWbXh6YTh5R0MyRDAzZmYwOHdPYWpVVEFrYmFxdXB2QlZM?=
 =?utf-8?B?UzB5KzhGVURGMEpPVFlyWGhsN1NzVjhITWdYQm81L28rM0NUeEpnRFUyNUp1?=
 =?utf-8?B?Q1dJZzVaL1N1aWg3WHpJQjRWQjFoUGFYYzc5ajJBOFNRc1JqSjR0bXROOS9W?=
 =?utf-8?B?MjdzTTVBWE14QllRN2RPVExNWGY5bW1NUytWVmtsYlFPdGlQd1hXVVRxVG94?=
 =?utf-8?B?blU1bjJNU3lJZ3BiZUxwY3dVNzVqcXNvczdEZTRMS1hBY3lFNktNOG5EQmJq?=
 =?utf-8?B?b2lYWUdZeDgyb3RsekFTekx4by8zQytkV0Zyak5mWVY0dEZNN256RGRTcG5H?=
 =?utf-8?B?REkyWUNseFVsSHMyY1ZJWmE0L3ZHekw0ZHh1dzRIU1NIQnhxc01LLzVtVzNJ?=
 =?utf-8?B?SDIzRHA2QXRvUmdzbkhJMUZpL0Y1UkphKzZTa01TVm1vL2hxRE1ja2VGU21j?=
 =?utf-8?B?TkRJY0t6U2NzRkpVOElKbktKR01jckJCSmJSWWxBZ2pNSzVtc0lqWkpyVGVz?=
 =?utf-8?B?MVlELzBpUHlheE1YY2FCaURiQ2dhYU1YZVk2QXliMXhuMVdiM1oySnFjVFpr?=
 =?utf-8?B?WVR6YVJvWG5MYmVSakNYWkc5K25BMWFHUFgvZklrZUdVWVByWnM3bXRDU0xk?=
 =?utf-8?B?MlZyaGxwZG9rTVJmNUpWSnZ6cXRtckJYTUFGcUd3My81L1g3SXpQM2xtaGs2?=
 =?utf-8?B?YXVqWEZ2am1YYjEyZE04L1lIQ0RGQkx1NXY3RTBISkRYTXdmMjhzV2V3RHdZ?=
 =?utf-8?B?U2VOMHA3UGNvMFhiRXJGT1VzSUJuSWI3ZEpvUUp1azlpc0s1Y2FMd3M1Y3RL?=
 =?utf-8?B?YVNqaDgzVUo0aFVMY0tuVWt1VE5yRGkyRW5Bam1sRWJlQkpGQ2lSYjZCM1Fn?=
 =?utf-8?B?bitZZDdwTnlnNGZzYVpkZFpJMUNXbjRNRnZvanVIRkswclNqdlRBbHRyOEZI?=
 =?utf-8?B?L1hhcmRocEluR3R3eUM5RkJYNktUOUx2MG9UUXpzU2J0dGcyMzU4a0V5OXhj?=
 =?utf-8?B?ZGVCaEVvbzkvU0hZeEJ2UlNESjBKV3RLdUl3eTJPV0VHc1oyV2FUaVB2L1Y3?=
 =?utf-8?B?M2pSb2IzVHRqcmtrRmlheldRblVaT3hDMjY1VTFJdkRNN2hFMzBFYVdhRGpY?=
 =?utf-8?B?ZTJCZGgzWURqQk8yb1Z2dmVzRkV0bmI2VEo1SVVRblp1UXVHeXgrZzlwbDZw?=
 =?utf-8?B?VlhvQncxbFNvczI0SldCOWNVbjNQOHRNSTNsMEdkMXVMZjh1c0x5VEJEUlFi?=
 =?utf-8?B?SkpXYVR3bENsc3MzeEd0bUNaR1cwQkVpNEl5VE1mOU40Wk01bHJNbnkwMGp6?=
 =?utf-8?B?dS9sMTZPZy9sNnhwN20ycVZ5ZDVzVmNrUTJPak03M2RnMExPa1RnVWJ4MGpK?=
 =?utf-8?B?MFU1Yy9GN2U1RjZVekVDY1JHVGpCMkliZVNRSUwzSFBPNGxCaHAyMWVxQ08w?=
 =?utf-8?B?VllHcC9TUWZuTW84RTc1ZHpubnpSNmowM2lGdUFmTk9kVEQrcnBmRGNNRFEv?=
 =?utf-8?B?Yjg2LzlDbm5TSHRaeDBhcDFRY2J0RktRUHppUS83dzZ5TGN4anFzb296bktw?=
 =?utf-8?B?VXBLL0gwb3BRMUxZNnlzb09tam1SQkZWb2FYOUdqalhxOHF0NkpQdnpEOHUr?=
 =?utf-8?B?L1hxc0JxSGpKTGNUclNOY0lwNUd3UU5DZ3E1ZEV3MzNzYnJpR25hTWtvTDBB?=
 =?utf-8?B?dVlTOHQ2MVR0anVoL0F4b2xwRlNvOHJYbEowWDM1N083U0s3OG5ac0U5cXdh?=
 =?utf-8?B?dnc4bzdVRHBoR2t5dTQ2VlNleS9HVDJGa01sZG90eGVDTVdVanBGbFpiNTdQ?=
 =?utf-8?Q?OrP5O1W2X+pc3Cc6kmU31TtCgCmL8EUz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjhBckZsaHB6U0lRRmgxRkdVeWcxMFVCQ2IyTGM3Sy81SStlck1yd2l5U0Rm?=
 =?utf-8?B?L3V5elppUkU2OEhrN2FvTExpRStWOCtmbVc3TVpOZ2lYVzdwb1d2N0tSQlk3?=
 =?utf-8?B?a0drV0Y0dXRXTEdNU1JLSmZzdW43Q1daYlY5aEN1QmN3VGhFQlhxTm9YWWUv?=
 =?utf-8?B?d0daYnNMK2ZaY0tXSnlkM3Y4WFVTMjVHcHpoM0c1TnBiMFRWOTFSbEdwV3Qv?=
 =?utf-8?B?Ym9LMWZwRml6TWtLUkF5ajlxRW11SGpydlBvUTlHNng4dVU3US9RczBzWFJZ?=
 =?utf-8?B?UWVidThqclMyRjZzc0VibEl5a0s4RGF5c3pwUUl1V2psRTBTRThqQ2R1SmJw?=
 =?utf-8?B?Q2FNRVV1V0xrRlozOEtrSFdWd1FoSGF5ak1UQmFXMFl0SmFTa1JkRHNwTlhO?=
 =?utf-8?B?YmRUSE5ZV2hvTzJHdFU1c2VQMVVvZjYxVDhQQy9QWTZSRnU4cUt5TFJ4MFo1?=
 =?utf-8?B?Y1RQZFZ0WElPVFB5ZzJBVi9kMkIvZ3cxT3JMNXBqdzhPRHd1ZmJ5SmRnMnlX?=
 =?utf-8?B?UGZNbmUyRmVDMHp5dUtCMGs1UHh6bE1FNTVlMlZaSzhGcm5vQ0lNaS9BY3B3?=
 =?utf-8?B?YkJjKzc4TFlMaGtjVXQ3blZ5dGpvMEJYMDNoWlM3VVErNU5TWHNXNUVlaDJx?=
 =?utf-8?B?U3VxQjRHRjY5TE9mTzFERGp4NHdUWktaWGVYdjJ3WHNrUlRxS1N0dytYOGZQ?=
 =?utf-8?B?Q1NoNU5OU010ZnpSSkwzRkRGc2FRcUhwV2NoQWl3cElUY0FkYU05Yys3TkRh?=
 =?utf-8?B?eitqY1FsNHd1RUovK1g3aFlYa0pIVTlCc0xRSWZoVzdlUFQ2ZGtPcUttU3F1?=
 =?utf-8?B?SXJoYldHaGEzNHBkQkllejEwcHFUdzNOZVRDM3E5VW1nVmNLY3J5Zk16V2hB?=
 =?utf-8?B?OURaZG94d0FlQTQwbDZIc21URExwblRWMG44NDJkbmpVNW50Vm5XK0FpQlRt?=
 =?utf-8?B?NWVTdXBLZDhsT3ZEd1Iza1lFdEV0VTVqS0s3R0tjVG9RNFNYaXJsa1IzNGVL?=
 =?utf-8?B?MVJCR1RBbTRSVE9abUhkTXVKTzlKRTFRVHM5Z1F6cVY3bG95UUVVWG0yUnUx?=
 =?utf-8?B?endOQnZLT2Z1WWxMY242UE5TaVdQcStUNytXaThuNWlVR3VUcnFHdldxKzFD?=
 =?utf-8?B?eFg2aGJ1N21GNjN4OXY5QnRnbzFuMlVXRlVrVW5RZ2xjWlEwRDRZSnR4REtI?=
 =?utf-8?B?eHlKQWhWMnR2UEhHZjc4aDgyNzM2dGY3MWJDbDJKSkRPNkFSU3lnU0xUbW9F?=
 =?utf-8?B?Ly9pS1AwQU5UenlRODh1blhuUTVicW1uTVJvMVJIcDErdmh3QXE0UUlJaTBT?=
 =?utf-8?B?WmFaWGROM2FBZWpJOGpON0tZajhCaFA2N3Zxemp6MjlVNzlGL1VHWHNvWEZY?=
 =?utf-8?B?NXR4dko3UTl2R1I2dVdFc0Vwc2Fady9CbkR0aGRmeXNDcHhubWhPZnBXTXJQ?=
 =?utf-8?B?T3J0MHY1R3R5amlvNllWanA1bm9WbUxYZXBKZHhjZFJSbFhuSE56emxuSTJI?=
 =?utf-8?B?NkJtcVBHa0wvblJqUjZmQVdrOEdGUnhkcEFzcUFEVGVrS3grSUd3em1iaGRL?=
 =?utf-8?B?SDhHa2ppcWFQbGJ6Z3lKd3lNMXplaWtzOEZCYTNtV1d4Sitlbk92SGNha2J5?=
 =?utf-8?B?c3NFWEVseXZ6aXJCZHI3RDkxNTlVYnZOeWtmWXFWdVN2QUlnS1RON0VlSGlo?=
 =?utf-8?B?Qm0zZkJuWGJ1b3VJTFAwdkZBc3V0YStwNWsveGRUNGdjNXlxa2VjU2FnWkpX?=
 =?utf-8?B?NXNkSkdJOTZxUXhiK0l4ZklPeVdDTnRNY3YyUGNGNnc1VWEyVWFUOW9xK3VW?=
 =?utf-8?B?dkttVzFuV3ZxdllHV2h3NHVRWGFod0krWHRwcU96QnFnL2tKbFZ3ekJFSVg4?=
 =?utf-8?B?Z0xmdWhVT1JNQlE4MUdwU3BmOTZaU1p4RlUzV1U1ald0ODRSaUV2cExsNnFr?=
 =?utf-8?B?TVd0T3ZQMS9RTGQwNGJTQUYwUXovUVV4RSsxNGh1aGlVYSs5YnIyd1J1dzA1?=
 =?utf-8?B?UWpaNlJEL1RVMkRhUnNEK2RaUWhhOExpRjExWDhtbjMzZ2NZYzV5aTJ0MEJS?=
 =?utf-8?B?WjAwTXhEK2JnejY5Qkpzc3VaS3pUUFpuT1poSWJUbXZvcWVIeDJPcGo3NCt2?=
 =?utf-8?Q?IZJU5vV0MCnThguI5onMoDNId?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a417d738-7717-4ffe-54fa-08de3c52c0db
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 03:25:25.7037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGRqRqhlwSJskKGGNLvJS3UjxNYHWT0RPtxOAXe4Wz+nOTZFgd7VDHpOzF6K1cU/SGnzVZstJbvpJ0w2GydrpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
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

Hi Kamil,

On 12/16/2025 4:06 AM, Kamil Konieczny wrote:
> Cards numbering can be non-squential so create a way to open them
> in such case.

Typo: non-sequential.

>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/prime_udl.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/prime_udl.c b/tests/prime_udl.c
> index 25950a09d..c3e92be1e 100644
> --- a/tests/prime_udl.c
> +++ b/tests/prime_udl.c
> @@ -27,13 +27,13 @@ static int find_and_open_devices(void)
>   	FILE *fl;
>   	char vendor_id[8];
>   	int venid;
> -	for (i = 0; i < 9; i++) {
> +	for (i = 0; i < 9 && intel_fd == -1 && udl_fd == -1; i++) {
>   		sprintf(path, "/sys/class/drm/card%d/device/vendor", i);
>   		if (stat(path, &buf)) {
>   			/* look for usb dev */
>   			sprintf(path, "/sys/class/drm/card%d/device/idVendor", i);
>   			if (stat(path, &buf))
> -				break;
> +				continue;
>   		}
>   
>   		fl = fopen(path, "r");
> @@ -45,11 +45,11 @@ static int find_and_open_devices(void)
>   
>   		venid = strtoul(vendor_id, NULL, 16);
>   		sprintf(path, "/dev/dri/card%d", i);
> -		if (venid == 0x8086) {
> +		if (venid == 0x8086 && intel_fd == -1) {
>   			intel_fd = open(path, O_RDWR);
>   			if (!intel_fd)
>   				return -1;
> -		} else if (venid == 0x17e9) {
> +		} else if (venid == 0x17e9 && udl_fd == -1) {
>   			udl_fd = open(path, O_RDWR);
>   			if (!udl_fd)
>   				return -1;
