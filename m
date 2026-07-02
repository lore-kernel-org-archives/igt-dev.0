Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D92FC43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 05:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B274C10E43D;
	Thu,  2 Jul 2026 05:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlJqLLvU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EF610E43D
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 05:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782970198; x=1814506198;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NVpEOQjj+FwqQiwtVOehFDqukD9iCQWRXQWE3vjnRb4=;
 b=TlJqLLvUC85pxWNJMitsaIuxea9+i/kSfQcMjsSbgej82SG4fgRPwXa0
 d8ptyRa1rGbQUb5TzZm6CZ+N5xho8MzDYi4G/5DCXkHODMK4eNRrAKNSn
 ArSKepubl3Cvk7/j/4zzKseDh7R8Tx6Kyai/MgKjxa41Kl3gpCa1vr5aJ
 RgnCVnEdldx40vrZbG685T5iOC26Q12wXz/xQLSItFxkJDBja7vIzHwbs
 mgCUjtJP4oBwWkxEa+V6aGH+FYqAYqJ0S7m8P2K+e2m0Tj1KKWGFJ2L6L
 SRRUoI21kGVjWbD4Q33OZZdqs1zzDv3n6HRKdJZDEDf1Nb192x7fOb8X8 w==;
X-CSE-ConnectionGUID: RKB9UCMFSbiyjiVwAZQLlw==
X-CSE-MsgGUID: hZWAVlo6Rw+ChT15eVuxuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94066710"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="94066710"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 22:29:57 -0700
X-CSE-ConnectionGUID: bAteloK/SBiCHeBDFCsnwA==
X-CSE-MsgGUID: Kk/PkmQPTfyu2sfgcRtWYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="277074449"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 22:29:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 22:29:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 1 Jul 2026 22:29:56 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 1 Jul 2026 22:29:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKyzrfmheAYEtY3I4zo0EkBJxBbSw+osx9wjCeClaDabGJODQrz0FoLva45ggFungo59WhAez0YBf+9eVL6mGiA7YTAotRvU3GkS0Tg22cOwttuQGCUoBC6s09cfuBUxXKfQ3i/+6GtJla0AAWA1o58jtPMO+xySC1qgO52tpj6iYCeVvzvZ53dxF8lBbNFhwLf9c8PhXhLm1AdAc4TcV4Qz4QtUoYqT1N+PNbjMUqDzlCtjWm+VwR9hykjiBptmPGzN0BYZbqQuezo9G7NpDQr/CS9yE8JZSz0va3FjyzNmcxUnFHXZuHQiUt29WWPsJPkhrWB4Wb5KbZdAy+xJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYEhuH31ykqKEqJa8ZvWeRDWvct2CgM8SBVAu9yFJzM=;
 b=V6IFSOgpmayge/qK+rYblYvz3FGUuvqPFyqDHo8v6b2xih6i3ctJmCK8lB14vtsVR3QB8dQstqgYx/qos8oQLmN1pu3lP3kTST+fEYi6AGwLoiOvtCkY/orCqXsCrYxYofBjmdYRc/Khe1t2g1nY2NGWOcRxO+ucwugY7vv6caXeBw9WnzqwJYMqPFix1czP1hDaz7RjwmOTMl/mVs1I9PcrMJ9kNuscHgH7krg/lmZ37iWN8atqXbzDvmotdQVpNrnWXeYaXEn3k8bE1PhEsDwwqg98THpCe231OZjGusrE6xOkH8amhiODU2fIvpad7uByduWj/wrfFEcsmHMQfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8600.namprd11.prod.outlook.com (2603:10b6:510:30a::18)
 by SA1PR11MB9876.namprd11.prod.outlook.com (2603:10b6:806:4d8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 05:29:48 +0000
Received: from PH7PR11MB8600.namprd11.prod.outlook.com
 ([fe80::b93:cb17:6e06:2580]) by PH7PR11MB8600.namprd11.prod.outlook.com
 ([fe80::b93:cb17:6e06:2580%6]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 05:29:48 +0000
Message-ID: <cc332bf0-5b42-4f13-a157-ba491ffca15b@intel.com>
Date: Thu, 2 Jul 2026 10:59:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xe-perf-recorder: Add mmio-trigger support
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20260619050217.2112851-1-shekhar.chauhan@intel.com>
 <87a4sckd9v.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <87a4sckd9v.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::10) To PH7PR11MB8600.namprd11.prod.outlook.com
 (2603:10b6:510:30a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8600:EE_|SA1PR11MB9876:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d2a0529-b333-4e38-8e1f-08ded7faeeea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|3023799007|6133799003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: N6U5AYESQP0+ZeiXkfr5JA1RxYnSGScYraBRdAr77dWBV+fL1zHvt4vSGDCMWAH6cUQbT2e0hmcj4NflIt3eyTHS0clp9H3rxQq3dLmn5BgIGyLIuRsG52XfHRtwv5RzmV1NxwxL3sbpFPySEqskqz/jRGNSflxdPQSugbdhdJ64yBb5sqieb7GHphpi6ZWW/5oAJ0eULtGsiJWdPTlW1G4Zaa664S+MYmcoRpeDW0JYuhsI9j6lDFPCpoYRmJ7kHAU5I6kI//bq24/epQZaLQJGkwhVMT27UVM50zLzofWta1OOrfNrrfVM+f6k7PQGizp7Iub4rnhM9f3z2F/HAKv+WaH58HTipYeI7M40ErMoKOcoUOkcIwe7E0OuRMjrBEgjbt3pDI035puJAFM5ZroOHasBh9C5rVF1N53CkgpH133SZH2RsPCjvFjJlr4Bl0q22DaBjgHBdP4a31IiGrzamfh/+9x7F40w+OQS1A7u2CQGAUZLIwGbhH7J7rjs21LTLnHwQ0PNADKvZJfX7b+WobNnPw96YLrdbi2o8AQm0RvUN0F2lzBM56xgcpUkqgT7zdAeFBj0kK7O4Vlah23jV7HysP3PBK9SP3rIv7yobzpciitdXYyXdPrxJyqAWIKByUpwm/5diFBJRD6r6m7EqF88qkrxEShQo2y3tiw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8600.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(3023799007)(6133799003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wms4Ym5lbXpNejhjM2lad0hIQ2RlUFZ2eHZKMkp3ZVN2d3FYa3UyQXliNnh6?=
 =?utf-8?B?SDF1Q213eXRQalVqT1Y5K2QxakdxY0RrSVR0RW1QZkU1L2piM2FNdUk3VmVh?=
 =?utf-8?B?RFQ4WG9COTZkR0FwbzR6bzFTc05JSENjYTMvUTYzQS96S2VQWjdVWExQN2J5?=
 =?utf-8?B?dFZsczRTYTh6cUhsbnNsM1FpcEdmWVY5UlpQTVRGbFg3bUt0dW1hYXRaWXhX?=
 =?utf-8?B?bGcweFFLdlhkNUZRYXR1czNmTm5LZVRVcU1sWmNLTHFWUFF2Y0tKL3cyKzd1?=
 =?utf-8?B?VDdLVFBjZThiRlo4bDhjeVUzNlVqYUJrNXRJMVFlMlI5cEtDOW03NHk2Q01a?=
 =?utf-8?B?WW02NkN2VkZPZ1Z6NnByUkVSWVdGbVpHUCtkNG5aYkFtT2NXaUdpQWIxOHFv?=
 =?utf-8?B?WmszNmVRNUhDUXg1S1ErMnE1SWsxRXZ6eC9kdWpBYTZtZ2lEZVNyWlhZQUVm?=
 =?utf-8?B?c1FQLzJ1REFnb25ieHpnay84Ulp2dXFCMGFvVDlOMThuK21SNmtTU1ZJVzhW?=
 =?utf-8?B?K1gwTW5IQzFjZHJldDR2WkcvcmlZV2FpN05BNHFObVRTQnlMR3lGc24xRDdu?=
 =?utf-8?B?c2dldzJBRCsyL1V2V2FJSDR6QmdnUlNEeDRiZHRGek1oNzA1Q3NINUdNT2M2?=
 =?utf-8?B?TzJ1T3J0dDEvWTRidnBsRjA0WWhnY0V1eE1ZbklsbmVHUFp5Tmc0RkZSYlUr?=
 =?utf-8?B?TS8zSUlMUkpSZk4zekZ1RW43L3VYcHhUVGFlV2NCU1VQMVh4YUV5OUtHUnJ6?=
 =?utf-8?B?Y1BaNDZkLzAwOXFJeTdENDNvL1VPN2VPYVNUZmw4VlNObmFiT2l4QXYxaWVM?=
 =?utf-8?B?aEtMVWFib2NKNEFqUnRFSEtRTkxHZTZvZGxHWW9WamU4QkxQdFI5NWQvR2xD?=
 =?utf-8?B?Zlh6T2dXK1hWWkhnMklSeU9IQk1RQWJCTWlRYWlGQWdxd2dRTzdqZ1lSS2Nw?=
 =?utf-8?B?V05XTmFWZEJjSmJ0R0hXTDJHenFJRSsyRU9JeDZXa0taN2RhR3BjUmgzcW1x?=
 =?utf-8?B?SjZwWTJmZ2NKYmtNemo5eHNaZnhDdHF4S0ZpOS9rWjNDT1B4TG9MVndnVHp0?=
 =?utf-8?B?OHVyaW1RcHJ6TVQyMk4zMnNObWdVdGQzcC84S0JEMHNrWVZBOTdIQkNwQ3FM?=
 =?utf-8?B?d3BETzFDWjdHZGZHZkoxZVRzK2JZUmpiWTJVUTMyeFBKeEpqcSt3RVc4aE1R?=
 =?utf-8?B?TGRhVEQzM1RGR25aMGU4bEEwOXpKd3ZoOW41aHlkTzNiYXNIQ0xJS25nd1Iw?=
 =?utf-8?B?NHF5NWc3QUQ5QzdaZ0ZrMGZZdGxraDJUK09oeWJiQXViK2xPT3FvN2ZnaTRX?=
 =?utf-8?B?TGZkaTdid3Bld2dxdU83Q3NhRlROWjdYVktDQWJ1SmZVdEJMd1RMRjNTbE11?=
 =?utf-8?B?eVl0dEh1NzFRaDdsb1hRN3M5ampSSXJpc09JSlNucWVKQVZUR2tKUWFlTzVI?=
 =?utf-8?B?a1hmNnJFaVNtdGhZd2NrbjVPT3dIZjZLZ0x6czNSWjkzYk5LRWlvL2Z6M0Vy?=
 =?utf-8?B?TndQVXFvMVQrZURmNlQ0WTJnTzBIVFYzMGllVC91d1NmZE9MTXhCWllYOC9H?=
 =?utf-8?B?dzBtcWhwQzhxbEVGTi9OVWRwTWw0OTZpeDhST2xlMlZrQWpDcC9wM2JHbm5Z?=
 =?utf-8?B?ZXQ0RUNMSmNTZHl2eFBNT2Q2OXZvZVRNbU1rVFhRQ2pBOSs5UXhtMU0vaXpt?=
 =?utf-8?B?WVA1QXRDa3Z2NFpnUzN2aXMyb3FWckIzMy9hWkVuOXh5TzRmZy91cXdoOW8r?=
 =?utf-8?B?d2tmMWpsZGZlb1pSZy92WU4rZVZ3VENwckxZbzhDSUNManBWeGFubm5qWE10?=
 =?utf-8?B?RWFGQVZUZER0OUYrSEpqOEpGN2JWbzZGT1BOM1RpemQrR2lGeit6bytTeDBS?=
 =?utf-8?B?eFF1cS9oWDNlMXlXbVJlUjR6UXpqTzZJQUtuZE1vVWh5VHU4SnhYcktMaGV3?=
 =?utf-8?B?Mjlyd09iTDZZS1B4UWZlT3Z6L1JUb2sxUEo4MU80SytLMkxrSzZmQlloVWpv?=
 =?utf-8?B?SmU1TXhLaEwzQmVCWXhDSjhYSDNjRUdrc29jaTlYMG41V0RrZ1FpWURBdmVC?=
 =?utf-8?B?cisxdVJPcWQ5dkNFUzlwR1pteVQ2c2ppT1lkUmJGYVVJeGZxZVg4a3hnTG54?=
 =?utf-8?B?bVVkOG5ZZ2I2NXBnWm5ZamZKVkwxeCtTNXN2dGhyR0d1K2wrT0h0VFR5T2F3?=
 =?utf-8?B?N2w2blAwNXMzSXJYa1FyYitNK1I5RHNJVWY5UDU1d0gxL0Y2Vy9odGYraUo0?=
 =?utf-8?B?SW1yazhKZ1BESVhGNmpkOWZxQzY2YktibzRWSDJkRWtCQmcyaWFVM0kwc3RG?=
 =?utf-8?B?ZFFqYS9EMnpPbkRGVEdnZWV0STBSeTIxNUtPVVhweEZsdXk5cXgrOUdWWVVz?=
 =?utf-8?Q?V70EFo+aF1i6RGQY=3D?=
X-Exchange-RoutingPolicyChecked: HfggwTD8Zz+GkLeNH5lN9KPyl2gVxdfqoiaQrXuRCS4fb6avsd7S780dCDeN/nbIlw3XkMf9EpBZnLCKE5Yj/HmfIBadI+dfCii3Gp5l7c5e3a7qq/R0WJ1Pp/vox1h6MQh8f1yEyk/Fn2k/o3dQjLLgc/TA8Jf55dc9uioWX7JZrHrY3hMUOu+gQc+R+pQPWv5IoBTt0NORBG66G17Dc2lM2i9xE6fIwnAyKClekTmnzuhIkKWt6gaAo1WrKOuPGqWJ30Ac5Qs3hZUasABAGzvpY2IKuHK146UG1ijrIrAhN9cZbtOyo86a+qkH+coZP81AkKFesr1kx+qJArUVSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2a0529-b333-4e38-8e1f-08ded7faeeea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8600.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 05:29:48.4959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuj1JVCkO8ZBP0DuEfha7YQMU0jZt1fIHOW0B0cz8SGdIWPnpyxD+KCIlAGMcY7uWhblNf8yr40+UtqNsee4XJtdohWhEdS9f04YIL+HczY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9876
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


On 6/30/2026 7:20, Dixit, Ashutosh wrote:
> On Thu, 18 Jun 2026 22:02:17 -0700, Shekhar Chauhan wrote:
>> Add mmio-trigger support to xe-perf-recorder, to justify the
>> whitelisting of OA MMIO Trigger Registers in XeKMD.
> Good description!
>
>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>> ---
>>   tools/xe-perf/xe_perf_recorder.c | 83 ++++++++++++++++++++++++++++++++
>>   1 file changed, 83 insertions(+)
>>
>> diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
>> index f200fe9c9..48a7d55d4 100644
>> --- a/tools/xe-perf/xe_perf_recorder.c
>> +++ b/tools/xe-perf/xe_perf_recorder.c
>> @@ -27,8 +27,11 @@
>>
>>   #include "igt_core.h"
>>   #include "intel_chipset.h"
>> +#include "intel_batchbuffer.h"
>> +#include "intel_reg.h"
>>   #include "ioctl_wrappers.h"
>>   #include "linux_scaffold.h"
>> +#include "xe/xe_ioctl.h"
>>   #include "xe/xe_oa.h"
>>   #include "xe/xe_oa_data.h"
>>   #include "xe/xe_query.h"
> Could you fix these includes (even previous includes) to be in alphabetical
> order, which is the convention we generally follow.
Fixed in the new revision.
>
>> @@ -39,6 +42,10 @@
>>   #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof((arr)[0]))
>>   #define MAX(a,b) ((a) > (b) ? (a) : (b))
>>   #define MIN(a,b) ((a) < (b) ? (a) : (b))
>> +#define OAG_MMIOTRIGGER 0xdb1c
>> +#define TRIGGER_BB_SIZE 4096
> Just use BATCH_SZ.
Fixed in the new revision.
>
>> +#define OAREPORT_REASON_MASK 0x3f
>> +#define OAREPORT_REASON_SHIFT 19
>>
>>   struct circular_buffer {
>> 	char   *data;
>> @@ -354,8 +361,21 @@ struct recording_context {
>> 	int oa_unit_id;
>> 	struct drm_xe_oa_unit *oa_unit;
>> 	struct drm_xe_engine_class_instance *hwe;
>> +
>> +	uint32_t vm;
>> +	uint32_t exec_queue;
>> +	struct intel_bb *ibb;
>>   };
>>
>> +static uint32_t oa_unit_mmio_trigger_reg(struct recording_context *ctx)
>> +{
>> +	switch (ctx->oa_unit->oa_unit_type) {
>> +	case DRM_XE_OA_UNIT_TYPE_OAG:
>> +	default:
>> +		return OAG_MMIOTRIGGER;
>> +	}
> This is not sufficient. The recorder currently supports all OA unit
> types. Can we do similar to:
>
> 	struct xe_oa_regs regs = oa_unit_regs(oau);
>
> as is done in __test_mmio_triggered_reports() in the IGT and initialize the
> register(s) in the beginning. Different is also ok, but at least let us try
> to cover all OA units.
>
> Also, please test these changes with OAG and one of the
> DRM_XE_OA_UNIT_TYPE_OAM OA unit.
Added this in the new revision. Borrowed some code from assign_oa_unit() 
and assign_hwe().
>
>> +}
>> +
>>   static void set_fd_flags(int fd, int flags)
>>   {
>> 	int old = fcntl(fd, F_GETFL, 0);
>> @@ -569,6 +589,23 @@ static bool write_stream_status(struct recording_context *ctx, FILE *output)
>> 	return true;
>>   }
>>
>> +static void
>> +check_mmio_trigger_report(struct recording_context *ctx, const void *report)
>> +{
>> +	const struct xe_oa_format *fmt = &oa_formats[ctx->metric_set->perf_oa_format];
>> +	const uint32_t *report_32 = report;
>> +	uint32_t reason = (report_32[0] >> OAREPORT_REASON_SHIFT) & OAREPORT_REASON_MASK;
> Let's copy report_reason() function from the IGT too.
Done.
>
>> +	uint64_t value;
>> +
>> +	if (reason)
>> +		return;
>> +
>> +	value = (fmt->header == HDR_64_BIT) ? ((const uint64_t *)report)[2] : report_32[2];
>> +
>> +	if (value == 0xc0ffee01  || value == 0xc0ffee02)
>> +		fprintf(stdout, "Received trigger report with value 0x%" PRIx64 "\n", value);
> When you test this, do you see both these values?

Yes, tried it on a PTL device with both OAG and OAM units. I opened two 
terminals, once for recording and other for sending a trigger, I could 
see that it was getting dumped. I also tried with a single terminal and 
then stopping it (via CTRL+C) and since the new revision is supposed to 
add a new trigger at the end, it showed me c0ffee02 when I stopped 
recording. Hence, I believe it works fine.

>
>> +}
>> +
>>   static bool write_stream_data(struct recording_context *ctx,
>> 			      char *data, ssize_t size, FILE *output)
>>   {
>> @@ -582,6 +619,8 @@ static bool write_stream_data(struct recording_context *ctx,
>> 			.size = sizeof(header) + format_size,
>> 		};
>>
>> +		check_mmio_trigger_report(ctx, data + i * format_size);
>> +
>> 		if (fwrite(&header, sizeof(header), 1, output) != 1)
>> 			return false;
>>
>> @@ -697,6 +736,22 @@ write_correlation_timestamps(struct recording_context *ctx, FILE *output)
>> 	return write_saved_correlation_timestamps(output, &corr);
>>   }
>>
>> +static void emit_mmio_triggered_report(struct intel_bb *ibb, uint32_t reg, uint32_t value)
>> +{
>> +	intel_bb_out(ibb, MI_LOAD_REGISTER_IMM(1));
>> +	intel_bb_out(ibb, reg);
>> +	intel_bb_out(ibb, value);
>> +}
>> +
>> +static void emit_oa_trigger(struct recording_context *ctx, uint32_t value)
>> +{
>> +	emit_mmio_triggered_report(ctx->ibb, oa_unit_mmio_trigger_reg(ctx), value);
>> +
>> +	intel_bb_flush_render(ctx->ibb);
>> +	intel_bb_sync(ctx->ibb);
>> +	intel_bb_reset(ctx->ibb, false);
>> +}
>> +
>>   static void
>>   read_command_file(struct recording_context *ctx)
>>   {
>> @@ -726,6 +781,9 @@ read_command_file(struct recording_context *ctx)
>> 		if (file) {
>> 			struct chunk chunks[2];
>>
>> +			emit_oa_trigger(ctx, 0xc0ffee02);
>> +			write_perf_data(ctx->output_stream, ctx);
>> +
> Looks correct to me, but I am still wondering if we should move these two
> lines slightly above, just before the line:
Done this as well, makes sense, dump/write the triggers as soon as we 
get it and not wait for any other process.
>
> 		while (offset < len &&
>
>> 			fflush(ctx->output_stream);
>> 			get_chunks(chunks, &ctx->circular_buffer,
>> 				   false, ctx->circular_buffer.size);
>> @@ -835,6 +893,13 @@ usage(const char *name)
>>   static void
>>   teardown_recording_context(struct recording_context *ctx)
>>   {
>> +	if (ctx->ibb)
>> +		intel_bb_destroy(ctx->ibb);
>> +	if (ctx->exec_queue)
>> +		xe_exec_queue_destroy(ctx->drm_fd, ctx->exec_queue);
>> +	if (ctx->vm)
>> +		xe_vm_destroy(ctx->drm_fd, ctx->vm);
>> +
>> 	if (ctx->topology)
>> 		free(ctx->topology);
>>
>> @@ -912,6 +977,18 @@ static int assign_oa_unit(int fd, struct recording_context *ctx)
>> 	return -1;
>>   }
>>
>> +static int init_trigger_ctx(struct recording_context *ctx)
>> +{
>> +	ctx->vm = xe_vm_create(ctx->drm_fd, 0, 0);
>> +	ctx->exec_queue = xe_exec_queue_create(ctx->drm_fd, ctx->vm, ctx->hwe, 0);
>> +	ctx->ibb = intel_bb_create_with_context(ctx->drm_fd, ctx->exec_queue, ctx->vm,
>> +				 NULL, TRIGGER_BB_SIZE);
>> +	if (!ctx->ibb)
>> +		return -1;
>> +
>> +	return 0;
>> +}
>> +
>>   int
>>   main(int argc, char *argv[])
>>   {
>> @@ -1180,6 +1257,12 @@ main(int argc, char *argv[])
>> 		goto fail;
>> 	}
>>
>> +	if (init_trigger_ctx(&ctx) < 0) {
>> +		fprintf(stderr, "Unable to initialize trigger context\n");
>> +		goto fail;
>> +	}
>> +	emit_oa_trigger(&ctx, 0xc0ffee01);
>> +
>> 	corr_period_ns = corr_period * 1000000000ul;
>> 	poll_time_ns = corr_period_ns;
> Also, I think we need another emit_oa_trigger() just before the following
> line:
>
> 	fprintf(stdout, "Exiting...\n");
>
> Because this is the other case where data is directly written to an output
> file, not to the circular buffer. For gpuvis we use the circular buffer, so
> that is why likely you don't see an issue.

Done this as well, explained this in the above comment on how it appears 
in testing.

-shekhar

>
>> --
>> 2.53.0
>>
> Thanks.
> --
> Ashutosh

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

