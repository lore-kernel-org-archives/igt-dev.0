Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137A3F99C74
	for <igt-dev@archiver.kernel.org>; Sat, 18 Apr 2026 04:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA8F10E039;
	Sat, 18 Apr 2026 04:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAhZSsBg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFB710E039
 for <igt-dev@lists.freedesktop.org>; Sat, 18 Apr 2026 04:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776486376; x=1808022376;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=6G1uGAO62ZqOyByAozUm1kQnZLbkJoNU12xTYUdaTJQ=;
 b=XAhZSsBgRk7rx7vkmKtV1eVFJQj4FyfKi0GKJ5Jk4QJ69VhWYRNkpBlw
 Eu2gKYrNhmt6nXl62gyw38dVNm3GK0O/+xeN+Own3X7RxLtLwOTx7lyx+
 /gRzxdzCfLTbu24ICWyQfW5n5TvKe2twUojv1wxkqf5PCoAwqK2JVYNys
 aXnAW+vC94kTBQ6SDDZY9i13QlyuVjFd8oxaH+trz7/sYHJgEOJPedpfl
 78qEQ/v9zKH2mfLPLPcWUgKVSForyCS/ju0DOWo7SWjD5ZEQ4zL+tL0B5
 oTcnlHf71yrs5cyIymiAVMpm2rQ5nBtukvqzxvsQA1qzvlFyuIYWpbsCW w==;
X-CSE-ConnectionGUID: Hu3ZqxZLQeSlDUjx20KBKw==
X-CSE-MsgGUID: 0D2XecuaQS+/ctcpHmNJlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77408046"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; d="scan'208,217";a="77408046"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 21:26:14 -0700
X-CSE-ConnectionGUID: vOck4l5LT3iSGS7HPTwaww==
X-CSE-MsgGUID: cST7Dg7yTNqjcLpdeWIZlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
 d="scan'208,217";a="254422119"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 21:26:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 21:26:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 21:26:13 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 21:26:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKe3Pek9ZDhTzaBySF+SC6cccjJ+i8Jmj61ta/KHvDNVzD92g1d/ZJjUNOBUBYqBjIfpiI/vANYu0knRH96F86UeQ4iwKKXG2Lv1wuwoQkLqIQ0MiVKVe6QDCHyJn42LJpRnyVa4uEIT1SDY9EVXqMuoe6WrO1tskz/GwJrIwqNM2eCPsL+a42W9VXWebW5Me/dsAtp1sMGtsEJK81ALOYktx0W+TKu6sTOcnXJBhj8iG5vAejLg5AhBKG06IuETB2i7a0hO9visdjq9apPZm1LBDUxIKa0Tzqf97nv7c6rkQ0LG9VFulfYxh0jrDSyH/UxJVH61z+LZU55sk0iP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmUU/yQAk0kweE8g8ZCzC0rgEt3o214N7X0IBWKDwUw=;
 b=STbyqc7xhXxRDnS2iWBAXrp9uE5ZPnW/1Ni8S8TJxocrw4+zWhNim3B9PBvY+oPi3D6Y54Isr7MFIMFlRdHjAtY1mi7dMCrM6fgDCe+RR2FPhJTqPEtzQpCXvuriycppJ6/SOcq56QGijbJuk0nYCgMrbpvZuNFfQgjea12kYcPt61VjISyZ49shC/7o1o7cN0VJ0D36N0vI942sohAKkUwnkGSFIZSnL6nLtbHSIrXSBWLtjQHlBdzxaa9AsSRYQSqX/Mxg2M0Id9a44G6gqZrgwdJIS6LhIpzTz64o1MYwmyCqP7fSmY5AJKtQU/64f5L7wkHcouyPjpNRPK7a9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by SJ0PR11MB5135.namprd11.prod.outlook.com (2603:10b6:a03:2db::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Sat, 18 Apr
 2026 04:26:11 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9818.023; Sat, 18 Apr 2026
 04:26:11 +0000
Content-Type: multipart/alternative;
 boundary="------------r0k0tnPLz0bJ2M0hQ6DLo0yx"
Message-ID: <3ad90035-1f0e-4084-9042-ccbd00cbb644@intel.com>
Date: Sat, 18 Apr 2026 09:56:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/8] lib/intel_batchbuffer: make __intel_bb_create
 gt aware
To: <igt-dev@lists.freedesktop.org>
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
 <20260323162911.1912755-3-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260323162911.1912755-3-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MAXPR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::28) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|SJ0PR11MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: cea14899-5808-4982-6c26-08de9d029e99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: FARIe/Pa+9sZB0SZEUqIeWNtFj5RANWPL8saFUtlmHVE35BT2Bo3TiRGuGkbOSGT1qX1qDSslgW4zLF3K7mEU2mefxC5CtqzBAnIKkq4JJ8yUGtxfFLGeYOp6fwyx6iGBn37/YwnbWYDr3kn6MOZgUTc8V9Vb0aq/V/vPfJpJ3ZxosxLyZogKdCwPS5sn3eMYE910kD0Nki/LsiPGP2SGL/a8k02XGwEjgBc86Mr3nLcCaD4KR8Nn8fIq1vO78InakIJhcx2LM4zN+94hDSSICfifGNEfyU2GSfKMTR7z5Am4ogfbbBuhosVykil8uamD0iwwzHPrXc3s1jXPWk4HXvSTOz9QVltABzPhhBCS2oh0TGkMZDnbeIzwdO72SDHm6TDLSr22qVBEcVdMePxLsGLCrf+IDBf4zX5ojzJTuluJl/hS5cz7JJCTCpJXl9yu47LPqeficzIgzpLfD84Ecb411xAGH7OWo8T61YPmnA6HJY6OBaZ2ke7TKsUQUejnM3xRZ+ultWvDBlyqzDNgH+Hr3kDLnzzWlgNhPteG0u1ZWt8DbjrScUcQTN5T4bKpEUjHXDTQbaluZ3hGQqymQ31w65Vxsxdqe2zimJZBi9U+HXrfjbBPi4JZ4CnnOA9AkEQFuchjh8r8CoJb9sTUPRheWLmXKO/K9KwNyjAL+iAAK7ZknyI9MA1iGucv0o+UYdlA+SFzlvI23bOQry5hHQ5MacNMmrUBGySqExTK9M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjBmR25uODhFU3Z3bHJEZHh2Tk9kdUh2MXh3V203UllsNHozTUlFeUlZcXBz?=
 =?utf-8?B?Y1ZwQy9BOEV6QkpHVmE1azN6eGFQbk5lTThFSUZqZC94a1Z1cGVGL1Y4dEtX?=
 =?utf-8?B?dTNsVVBwekFyRFc5a2hMY1lUMUY3REpHSG8zVkJnM2xvY2lIcE41bTgxUXJP?=
 =?utf-8?B?eUZyRU5xaWxOZ1V5NHl5NEhGelZaeE5UR3g4TUQ0S2NXeXNuNTAzT3NRTHFL?=
 =?utf-8?B?S3JCYzcyUzVWTktLS3NhNExxQVpRc3lyWU81WW52R3g1M3h6T2tVTTdGSXIw?=
 =?utf-8?B?VytEOUtwODhXdG51eXJaaFBFL0VyOWduWkhNdHJCekdPaWhnT20rWnFTRzUr?=
 =?utf-8?B?TGlKNS9ua3M0QTg4NTZ2bFhJMFNlVHNOdHhNUjQvaGUvNERmME55YUJVSWda?=
 =?utf-8?B?V2huOTVocjE1dDV0RmdvdUZraVo1RENDZEtKcVBQR2pEeUtySWJzREtCd2FK?=
 =?utf-8?B?azRBUWo5MkVId1FzdlEwTUFiUUJubEFLUEx4OUllc1dIUEFaam02WkNhdkU2?=
 =?utf-8?B?bU1BaUUvbG54cG9XZnJ5NEhiTkgwT2FvUXdkMTlybGxscFVueHNvdU1MUWt6?=
 =?utf-8?B?Zng5VGVaQVRTeTc5ai9zU1JSTkc2ZGptZGVtMmRtQXJleHNBa2k4amFkeXlL?=
 =?utf-8?B?NGJQRzFUNGlHdk1PNmoyMC9pNXArZUpzQWM3a28yZC9Zd1haQzhWUEF1R0Yr?=
 =?utf-8?B?cVNXOHM5cHdWaFByR0htM0l0UTVnMkhtcXdUUFllRlB2YjJRR09TKys4VlEx?=
 =?utf-8?B?ZEtpY1ljZ0tCWmFRV1hlUXUvSHAvNm1sTWNkR01jRWtra3hKOFloYVNTSUhz?=
 =?utf-8?B?Q2tndWtKZDQyb29uOGhOZGhoMG9HMjB3T1hkU2hidlQ3S1NZQVprbnZUV2Nn?=
 =?utf-8?B?TkR2NlR1WENIRFpJcXFYRExyQjFYY0l6TGxya0VTUTZaekdnejl1UGRrVS9E?=
 =?utf-8?B?Z2poRURCMjFoNkxsSjV3S2RCazZpTWVwTk5VMHZRWjkyVStvSzk5cnJOdEFC?=
 =?utf-8?B?aDJ4ZUo5T2Y1TDFNMm5kOFJwRHRKVFpqT29PaWRYNTdVaFFLTVZ1U1FKMzh3?=
 =?utf-8?B?Sjc0QXdZdXZYYzJMSnlGcysvSjlzczkxRC96Szc2RmhvOU1IN3pwTnZBSjU4?=
 =?utf-8?B?aExyTlNVSk1kaVdqK2x0NXovdVVuMzl3dTFWei9pOEJkTGVXVWZzV3dkdmdI?=
 =?utf-8?B?VlZtM1RFU2pjL2ZoWThjeFJ5dE1GNzVueHRHaXdQTHhTZHVqSE90cU5hNXRL?=
 =?utf-8?B?dHdmZ3d0QXVkVHhkLzlxRENpd1lmNGxUT2daK1AybVJWU2wwSy9QWXk5REVJ?=
 =?utf-8?B?N05kSXRjTUpxN3FwRUpjeXBVb3EwQzN3emZUaFRSalM3VVNUU2dMa0h3Z3M4?=
 =?utf-8?B?L0JBYnVsdzFRMWtPR2ViWTdtTEUyd2M5TFFqamtFR0tyUW1KUlExdTNhRmJp?=
 =?utf-8?B?bmpaQzhtc21ZRUg5WGc3Z014cjJUVVZhTG01MTRwUFJYaTBpbHZBUWtGWFZT?=
 =?utf-8?B?aTRtVnEwOUJvN1FxWEVlSHBNRzBobTRXa21wU0ZNWnhQVjRycklmV09yLzg1?=
 =?utf-8?B?V0ErWnVkNERrVVgzdjJIaGdDbzV5QVlvd21xeWtXUHA3MW1TNTBlcUtBWE1L?=
 =?utf-8?B?ay95emRvYlpYVzNYVEF3TUcxcGhOOWl1SWtnZGd3aGVnRGRtZ1d1L1BWU3hU?=
 =?utf-8?B?NFhvdXBVSFQyOHp1YWk1ZUExT3NWSytKeHBrUSttakNweG01R2ZPOFZqOEda?=
 =?utf-8?B?S2lycUdLRHo3SThrMUtZeVFCeGJoL3ZLY3EzeTFmSTgwajY3UkI0Ry9rVTkr?=
 =?utf-8?B?NnRIM01oMDBSZCtqdS9JaG9wajlaVkpSVUsyQ1k3RTFCQjdPMDcyS2hCQUVZ?=
 =?utf-8?B?L25IOTdhT3E2RUQzUS83WGhscVFtMDlPaG5ncmdyZElDRER3OEtDeXBlUXlx?=
 =?utf-8?B?VlVxUGFTTERueHhjRWNKSzM3ZEphcWxlaVIwQm9mME56UytsaGdPaGdRalRR?=
 =?utf-8?B?NzE1RlhhKzlmMGY2QjRsdUpJQ0N1M3V1Q3haaGE1R1dTbmJLVG1uRmJUd0cy?=
 =?utf-8?B?OUJTTFYrcGhGSDV3T0ZBUEE0UFBqSGhXYzg3M0FzaERUOXRDMTgzZlppUXFh?=
 =?utf-8?B?VzljajNLa1VFekdSRVdYYkVwbzdudDFvMkhWSSt3SkVpNW1yMk5DNWdnUjlB?=
 =?utf-8?B?QmM0VXc5RWxpcThHcXJtOS9UcE1XdEJmbm1DdmNkUDFFR0hrdFRpSWYxbDNx?=
 =?utf-8?B?eUMvSkVkV0grZC93RXQrNEMwMVFlYjZlTCtFeWlWelVWWmJpbHVuYm5tcGRq?=
 =?utf-8?B?VExUSkwrb2F6OWdqSEdyUDBaVTVRbHpqZWNWY2RXcElOdG1uRXk5MmxmZTZn?=
 =?utf-8?Q?TTl6VkYJdh2w2I2Q=3D?=
X-Exchange-RoutingPolicyChecked: tM/aQhgGBAuB513PV/SPxfnL8QVTqEQ36D713mv+HTm/tCMGkxAutbi4H2DhnwI2tlIBpPGdxojqTKl9IGYSs9ZEm+54hO8gITuqiFrI8+SJG7CACLrbED86jkH8cor5Qpvf8g4mqvckAcHZQW3vu7eOH7psgJK0qZCUS4fS//l4GM7yFEiHMlDnp26NAQAgq6Zu7+PVKqg308Z0B97WG+/SVgaGL+Wj5yaQZB1VQx+Jpe8Ekz8AiCJAK5OnlcDwEBGhIwP6+ntgrfF3QQCPe23rRcD+9U2QLy4CjOiD9BUiRXP++hLmhKsFzrMJBr686ySIYVuOu2MbvZkIWbbDCQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cea14899-5808-4982-6c26-08de9d029e99
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2026 04:26:11.2920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQCEDeVga/nbd5tvVYgw8Y8e1oY4fZE8FXDneyY7a/53BgIA/PdusWIAo4ANA3WjxN7m4gpiWs/rcRIxDhB0f2+zV6PiWa39TQTgJiCvxsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5135
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

--------------r0k0tnPLz0bJ2M0hQ6DLo0yx
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi JP,

On 3/23/2026 9:59 PM, Juha-Pekka Heikkila wrote:
> add possibility to use gt id in __intel_bb_create
>
> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_batchbuffer.c | 20 +++++++++++---------
>   lib/intel_batchbuffer.h |  1 +
>   2 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index b09506574..802e771a4 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -905,7 +905,8 @@ static struct intel_bb *
>   __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>   		  uint32_t size, bool do_relocs,
>   		  uint64_t start, uint64_t end, uint64_t alignment,
> -		  uint8_t allocator_type, enum allocator_strategy strategy, uint64_t region)
> +		  uint8_t allocator_type, enum allocator_strategy strategy,
> +		  uint64_t region, uint16_t gt_id)
Update the function document with new argument.
>   {
>   	struct drm_i915_gem_exec_object2 *object;
>   	struct intel_bb *ibb = calloc(1, sizeof(*ibb));
> @@ -915,6 +916,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>   	ibb->devid = intel_get_drm_devid(fd);
>   	ibb->gen = intel_gen(ibb->devid);
>   	ibb->ctx = ctx;
> +	ibb->gt_id = gt_id;
>   
>   	ibb->fd = fd;
>   	ibb->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
> @@ -1059,7 +1061,7 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
>   				      enum allocator_strategy strategy, uint64_t region)
>   {
>   	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
> -				 alignment, allocator_type, strategy, region);
> +				 alignment, allocator_type, strategy, region, 0);
>   }
The code always uses the magic number |0| for |gt_id|. Since |gt_id| is 
passed explicitly to support multi-tile dGPU configurations, could we 
read and assign |gt_id| dynamically instead of assuming |GT 0|?
>   
>   /**
> @@ -1086,7 +1088,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
>   {
>   	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
>   				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
> -				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
> +				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>   }
>   
>   static bool aux_needs_softpin(int fd)
> @@ -1128,7 +1130,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
>   				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>   				 INTEL_ALLOCATOR_SIMPLE,
>   				 ALLOC_STRATEGY_HIGH_TO_LOW,
> -				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>   }
>   
>   /**
> @@ -1157,7 +1159,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
>   				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>   				 INTEL_ALLOCATOR_SIMPLE,
>   				 ALLOC_STRATEGY_HIGH_TO_LOW,
> -				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>   }
>   
>   /**
> @@ -1184,7 +1186,7 @@ intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
>   	return __intel_bb_create(fd, ctx, vm, cfg, size,
>   				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>   				 INTEL_ALLOCATOR_SIMPLE,
> -				 ALLOC_STRATEGY_HIGH_TO_LOW, region);
> +				 ALLOC_STRATEGY_HIGH_TO_LOW, region, 0);
>   }
>   
>   /**
> @@ -1205,7 +1207,7 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
>   
>   	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
>   				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
> -				 REGION_SMEM);
> +				 REGION_SMEM, 0);
>   }
>   
>   /**
> @@ -1231,7 +1233,7 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
>   
>   	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
>   				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
> -				 REGION_SMEM);
> +				 REGION_SMEM, 0);
>   }
>   
>   /**
> @@ -1256,7 +1258,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
>   	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
>   				 INTEL_ALLOCATOR_SIMPLE,
>   				 ALLOC_STRATEGY_HIGH_TO_LOW,
> -				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>   }
>   
>   static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index d0a7c8dc7..7049dd2d0 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -269,6 +269,7 @@ struct intel_bb {
>   	struct igt_pxp pxp;
>   	uint32_t ctx;
>   	uint32_t vm_id;
> +	uint16_t gt_id;
>   
>   	bool xe_bound;
>   	uint32_t engine_syncobj;
--------------r0k0tnPLz0bJ2M0hQ6DLo0yx
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi JP,</p>
    <div class="moz-cite-prefix">On 3/23/2026 9:59 PM, Juha-Pekka
      Heikkila wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260323162911.1912755-3-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">add possibility to use gt id in __intel_bb_create

Signed-off-by: Juha-Pekka Heikkila <a class="moz-txt-link-rfc2396E" href="mailto:juhapekka.heikkila@gmail.com">&lt;juhapekka.heikkila@gmail.com&gt;</a>
---
 lib/intel_batchbuffer.c | 20 +++++++++++---------
 lib/intel_batchbuffer.h |  1 +
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index b09506574..802e771a4 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -905,7 +905,8 @@ static struct intel_bb *
 __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 		  uint32_t size, bool do_relocs,
 		  uint64_t start, uint64_t end, uint64_t alignment,
-		  uint8_t allocator_type, enum allocator_strategy strategy, uint64_t region)
+		  uint8_t allocator_type, enum allocator_strategy strategy,
+		  uint64_t region, uint16_t gt_id)</pre>
    </blockquote>
    Update the function document with new argument.&nbsp;
    <blockquote type="cite" cite="mid:20260323162911.1912755-3-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">
 {
 	struct drm_i915_gem_exec_object2 *object;
 	struct intel_bb *ibb = calloc(1, sizeof(*ibb));
@@ -915,6 +916,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 	ibb-&gt;devid = intel_get_drm_devid(fd);
 	ibb-&gt;gen = intel_gen(ibb-&gt;devid);
 	ibb-&gt;ctx = ctx;
+	ibb-&gt;gt_id = gt_id;
 
 	ibb-&gt;fd = fd;
 	ibb-&gt;driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
@@ -1059,7 +1061,7 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
 				      enum allocator_strategy strategy, uint64_t region)
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
-				 alignment, allocator_type, strategy, region);
+				 alignment, allocator_type, strategy, region, 0);
 }</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">The
      code always uses the magic number <code>0</code> for <code>gt_id</code>.
      Since <code>gt_id</code> is passed explicitly to support
      multi-tile dGPU configurations, could we read and assign <code>gt_id</code>
      dynamically instead of assuming <code>GT 0</code>?</div>
    <blockquote type="cite" cite="mid:20260323162911.1912755-3-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">
 
 /**
@@ -1086,7 +1088,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
 				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 static bool aux_needs_softpin(int fd)
@@ -1128,7 +1130,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
 				 relocs &amp;&amp; !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 /**
@@ -1157,7 +1159,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 relocs &amp;&amp; !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 /**
@@ -1184,7 +1186,7 @@ intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
 	return __intel_bb_create(fd, ctx, vm, cfg, size,
 				 relocs &amp;&amp; !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-				 ALLOC_STRATEGY_HIGH_TO_LOW, region);
+				 ALLOC_STRATEGY_HIGH_TO_LOW, region, 0);
 }
 
 /**
@@ -1205,7 +1207,7 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
 
 	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
-				 REGION_SMEM);
+				 REGION_SMEM, 0);
 }
 
 /**
@@ -1231,7 +1233,7 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
 
 	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
-				 REGION_SMEM);
+				 REGION_SMEM, 0);
 }
 
 /**
@@ -1256,7 +1258,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
 	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index d0a7c8dc7..7049dd2d0 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -269,6 +269,7 @@ struct intel_bb {
 	struct igt_pxp pxp;
 	uint32_t ctx;
 	uint32_t vm_id;
+	uint16_t gt_id;
 
 	bool xe_bound;
 	uint32_t engine_syncobj;
</pre>
    </blockquote>
  </body>
</html>

--------------r0k0tnPLz0bJ2M0hQ6DLo0yx--
