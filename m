Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E207C61DB2
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 18:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F2410E418;
	Mon,  9 Jun 2025 18:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UAXzzPCf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D5810E428
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 18:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749493357; x=1781029357;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P6AoHuW5xwjOGRrA7oEAZkSx13LZFmINv+GjuzBTtXc=;
 b=UAXzzPCfdWVs1AetG66VLP4SkUP5gOYPbue16oRjM+mAKiMjtJagDFzc
 0f0XVZqXOmRXmkhj1iSj06Q6OFiLFQqqpGgSvA1a4saBY5RY1A9Tl7CS2
 fDixBCDgfc2/NMQCNYWxsue31r2YAU1OZIoj/xUYxcSarRatm7iP/1Xtv
 WTEJanIxC8nEEiR12rBpufU08gSeaMFgI0qwtPztawq0Q8rEHnjpAW41z
 dVg5avnGalyj6S/SBEhW3mLEyc7SLt08+Ht2w9HpyTm/G/E+9pFrRNNzV
 n3iOm0wkZpu43oUJyj0xWRno6PY6mt8O0TEV+5If5tcXuqZvBG7WEdv8Y g==;
X-CSE-ConnectionGUID: bCGN1xDOR0SluonsAaYZrw==
X-CSE-MsgGUID: kc+6DBvBQGm8dZDVJMM+Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51574541"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="51574541"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 11:22:37 -0700
X-CSE-ConnectionGUID: x6fXl4TkQeiDUss81O2vxw==
X-CSE-MsgGUID: diZcLUVySdaupG//U+aKuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="147551534"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 11:22:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 11:22:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 11:22:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.53)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 11:22:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkOYEaJ6i9r59PD24u1i4vnQ9ICBx9yajO/qXfWYUwpnAvGpfpiBwas6StYDzvuorI0vCpGQpCqMIFdtNs8sIhgJ/EaA23s517WJ+BEJ6826RWqpMZ1LVBTaI17USosQQ8eRTTdN/3RgQ396tFBMYE+18vOgp3EO3rAgUIOBBf1LCvEat0cHxxJ2Z+JufCLewUMwraD+/vUQdD1/lpSzV6OQWXVY5JcJLFT1IjmpM+OVWWbqdELzH1iGHhd+/i6VI1FNNVOA4erHubBT4cAe6LnFfFuF5ti4o4Ko6VlriFuKg0qTlcLX3tWFb6/4Lupvk9A8R2k790opHSPJOpEW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIMm4uKf+mj0OTYOmp+URUEewWs084BROciCgh4SiaQ=;
 b=O1WJaClyUpJe3XKZOjdtBcUmK/rsEi0DZbL1ipnOrCQ6pJjynXsOfrzaTzQX6xPkgo0j/EigWJoeVjuyWR9JbqNsI1/5/GpoxjYLGDXRzlpT707ZcnjGe+SV6dwvlVFdqNKnEErnt9LTSQYLDtOQKASjCFq8fsNnfQOwFaAt6fIZUZ8y7Fzvb4dDmN/R8nu2LtApNEcIIjdajAQBzTNCdSmufrAq8W3YDkS+LTbmUksmM5XdRWm1V5pf/qKuFUGB8nnFaj/KVeEGSH/tHg/kFK6uj96v4NgtwiXsQzEMLW7yy/HDyMITsWzkzNctiTX6UIG+IuO4vJzC1zlvT2uOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Mon, 9 Jun
 2025 18:22:19 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 18:22:19 +0000
Message-ID: <76070095-aafe-4627-b400-80072a8b02f2@intel.com>
Date: Mon, 9 Jun 2025 11:22:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <satyanarayana.k.v.p@intel.com>, <michal.wajdeczko@intel.com>,
 <lucas.demarchi@intel.com>, <francois.dugast@intel.com>,
 <rodrigo.vivi@intel.com>, <john.c.harrison@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20250606183519.78736-1-jonathan.cavitt@intel.com>
 <20250606183519.78736-3-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250606183519.78736-3-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0206.namprd05.prod.outlook.com
 (2603:10b6:a03:330::31) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH3PR11MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: adcc0630-b8ea-46b7-38bf-08dda78291f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUVSL0FuQS8yeGhUMS82Mkd2Q2hLQmk0cEV5T2Z4L295Q3JhZGR1MENHZWtE?=
 =?utf-8?B?bmR4T0RvU2pVcUx2ZkJ5N0R0alZ1cmlsd2doYWZrUXk1ZzFLWlJLUlM0dVFX?=
 =?utf-8?B?bmI4eG5CYXFpMFZNanl2NFc0L3NRRjNhMVoremcrcGxDRDA5azBOYXY4TEUv?=
 =?utf-8?B?Qld5SEU4RnBQUERaQndXVVZXcVB0em9NeFh0UHdYN3VjeEN6bWxhbjQ0WVp5?=
 =?utf-8?B?Z1cxU1hBcmU3M085WGIyUXhNSC96eHo4MFQ5dU03TkZ5ZEhLWmJrNDd6STZB?=
 =?utf-8?B?SHNHU3BTZFJqblkrODJ4Mi9Hd055MGt1ZEFQakFTZ05QMWhwem9pSHpmcU5k?=
 =?utf-8?B?SXppRktRQWE4VlZrSnhwT1o3YzJoTGJCTWhMNzZsRTZveTBaQnVXMFJYazUv?=
 =?utf-8?B?SGFTVnZVUDJVYVNRajhNdFBHbVQxQWxjQjVlblppM1JZanR1M2JBK041RWRY?=
 =?utf-8?B?SkJrVlRYWnZMUldGTDY5eHV3eTExVWtwYUM0WW1TeVdJQkwxeXNuNHFUdkE1?=
 =?utf-8?B?QnlwZzlKemFENWh2Wm9EeUNNdERBYlB5cUdqSU9EL3g1czFJUmRscFgvRlpG?=
 =?utf-8?B?WW95b09jeWo5UjVKTE5jU2JXUlEwRUV6dXBESDBDeStMVlBxeWNZRi9UUStr?=
 =?utf-8?B?cDAzQndDMWppU1VxeGE3eFU2c3JYamVseDFLeXh4Y0JUM24xTjAxOHdLSUdS?=
 =?utf-8?B?U2hoczRWK04zeld4LzQ2TlRURlUzOFZXRCtLMWlUbHdiaGZCM1FUZTVGWGJt?=
 =?utf-8?B?L2g2NlNzNzdRWHNqQmZCZTJzUkpRMGo2UW5CZkcwQjNYSTlOSnM4TkFkNi8z?=
 =?utf-8?B?cGJKT3JtYlM5ejV4aVo2SjFZdkduTEFVa0tBcHluNGtCeVljLzFWM2d4dzBa?=
 =?utf-8?B?MU1sOVVRN2l4dDJqdFNzWmxwUndOLytqT3JkYnFJRUhkYmNSQkt0SlBJaFpI?=
 =?utf-8?B?d0hFaXhmQ1NlajFrSk9DRktYNmZOMFR4cWtlMFV0YUlLYVQ3SEpuR2J1cVd3?=
 =?utf-8?B?UmZqVFhuRjRFYVMxSFhOZUl4RGhoSFZuRFZZL0NFRkkycnhoS29qS3lxbjlY?=
 =?utf-8?B?RmFGWGlUWStscVF0d0dHRGJPbjhkY1BpYnV2am9JWUN1Z1BucUEyUWlOV0ti?=
 =?utf-8?B?MVdJbDVyTzBZcWdVdFZ1VUpGaXloWTExdkRzM1hXSXh3OW9mVGttblJlNjFk?=
 =?utf-8?B?L3NLTm9KdThaeDJaYWRobXA0czhNLzJUeER2OW55R2d3VmFLdERHM2ZPSkM3?=
 =?utf-8?B?bmJDK0lsaUdqRjJsQnBzeUhUWmZvSVRkVlBDTVY5NnhScnZHVlpnNTVQS3Rw?=
 =?utf-8?B?cEFmWGhMTWFiTW40bitXNFJ6M201dHMvZmd2Y0k5TnE4NmhFMHduVmNQRGhh?=
 =?utf-8?B?VVJnYmxSMnlWT1VDZ2w4aDlxSVhYdm8zQk1EWS8vclNEd2U1TW9JUWtMZ0lk?=
 =?utf-8?B?UjlrdjBxVU9yN0FBTXVTcmphR0tPUHNiVVl1dmIwWTZsNGVJYzFCSWIzUVVE?=
 =?utf-8?B?em0yU1VGeTYyclVSc3dzaGxaRVNNVVlqRDcyWDRoaVdidGhLWEhjVHhyQ2pU?=
 =?utf-8?B?SHBtZ3RGenVaOTRDN0Z4T1Y0akVkaWlOdEU0T1M0Z3JSY0t5azhuSDY4dStB?=
 =?utf-8?B?S1F1YjluS2xXVDdsaTZ5RjZaU0svdnI2TFU4K2E1cXNHelhXbXJuVHJubVdW?=
 =?utf-8?B?Nyt1WWEvQXA0QVNrOXk3L1JkZzd4bWI1NnNnTVFOb1orS2xYa01Ta3ZvNTB1?=
 =?utf-8?B?U3lSUmpHRkc2SHc0M1BkUlE3S25qZUJhUTdaZkU1MmljSTNRcjNTUjRzMjVq?=
 =?utf-8?B?Zm4yYlVNWDdUUkpKSlFwMXcydGV0WnlPVkM4bVAvbFdEVGdnNGJvNnh5SkNL?=
 =?utf-8?B?S05Fejk3a0lIWmlmR2lPMjdibGhIb0UwcXlHUGVPcjFMZVM0Y1NSVk5sUmJh?=
 =?utf-8?Q?whDt3/mda5Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFUyT0Zkbis5YUdKU2hlUVZHOEdaaWR1Q3FKR1pOUUxJanFlQjRNNDdGaU9l?=
 =?utf-8?B?RXF1VUZUZmRYanJhckRvdjNpcmwvcC9hc1E5WDZacXFqZGU1MlZRaW12Z244?=
 =?utf-8?B?cnJLTFluOXNORHoxU2hEMFYvMk1kVFpPMC9EQ284SWpReC85Z0RPNm5Ha0ha?=
 =?utf-8?B?VHVkSGpVZ1F4UElWQzdQOGI5U0NsZ01pNFFCbThGMktqNnBIbnV5Nml6ajFw?=
 =?utf-8?B?dEcvVFBSSS9qdWszbHRtdmdzUjJhYThteFduci94T2lzSW5JNVRZdDE3T2t5?=
 =?utf-8?B?N2RRT3g4cDUyQ1VNci9sTzNTdnpuamdFUUovYnBaUkNlNi9OYmJmMnEwbDZQ?=
 =?utf-8?B?ZmpCR2NOT1JIeDA0ZDBUUnkwdUJDS2duSEhuWllEN3g4VWFRSEtCL3VxY2JK?=
 =?utf-8?B?dU12TjJsUFRYOXpzNXBuTnA2SzZ2VDFyakVqb1lsYllEVnZ1OWxjYlBBZHVn?=
 =?utf-8?B?azgxTmxJRGFUU3grQWlKKzJSaW5CNzNnRWRqT0Y1MVJ6SnFjK3ZQSXJGRkFy?=
 =?utf-8?B?aHlwa3VKcE5sU1NlNkYveFhVanQzRHhaVlcxeDlkQnlNMy93VUpJWW5xS3I5?=
 =?utf-8?B?V1FsbjFjWjRIV2JSNFQ2M25BTFZObGxQMVVkd2ppRys2WG9kditFaXdGTkZX?=
 =?utf-8?B?cENENlBVODVjbmcxejJtc2tHWkhyR0Z1OC9rdHMvdkE1di9WcDF6KzlTMDFR?=
 =?utf-8?B?MTQ5aTZvV3pCWFFYNlBjY2kremdNOEd1YnlZdmlvSkVWays1RnllWHRwYVlz?=
 =?utf-8?B?ZWVYa0JBcWM3U3NwVXRuWUtES2kyL0NFcXA1RWtSTGZNTlVnTTJTOTZWdldH?=
 =?utf-8?B?dDJoa0FVK2piM2JmNzhIa3F5czNzVFo5eGdDdTd3OXlMTlI0V2YyRnJwaFQ4?=
 =?utf-8?B?R2ljdGxNb215ckxyRWo4dVdYLzFLZmRDUFl6MU5abzJKT2FxQy9VZGUxY0ts?=
 =?utf-8?B?L0thamlPK3dUNHdvWURUM2hMc01sMnJHN0p5OEQ2N0E5a1JxbDFWeDFaZ0g4?=
 =?utf-8?B?U1ExN1lIQmJnTVd6eXc1SHViQXlZNWRDbURkUVZRSEhhRERIU0ZFbU5uUGJt?=
 =?utf-8?B?NVdtN2VaWG9ady94dVFtVFlaVWFBUGFkLzZhRUtXRDJQVEdSN1ZveXJ2M0Uz?=
 =?utf-8?B?L3JHcjZIdldkb3JMVzU1cWRJNXR0NGVFSHZEKzh1YWgrNWsrdGY1c21ML0Vp?=
 =?utf-8?B?a3NGSXc3bWcxcmlIRHQ0UFp6aTJwL3VrbmVWN0FOZk5zTHRaZUlNc29jdjFR?=
 =?utf-8?B?OWtmM2V3eVRiZmY0ZS9hcG9VNlkreTViaDk5SThaR0xZYzRpTEF4eHFPNzNI?=
 =?utf-8?B?clFxdDRPbmhGUzVJaUlKYnhUaTRpL1M4YXBEWnNMSklBS0x6MHFHakgvVWg3?=
 =?utf-8?B?S3JyZVNFb0hZL2k1NVkwTmV1WXBrczJoWnkrbTc5YUlYOTY2MGJTOUdycVRR?=
 =?utf-8?B?RGhveGJvUnFzWlNDM2M2VWcxcWE1TWFwZjJ4UStsSWZrSjdkZnRyM2VuSnZm?=
 =?utf-8?B?ZmtjeHhYMDg0elp6ZUtDaytlMVlHYmNRZVBuejRkai9uNEpOL3BWdzYxeHk0?=
 =?utf-8?B?dUlrbHpheE5Oc0g3Ykx2V1NoenhFU1RMMEwyMVlOdG1HdEh0UndIUUYwaFZ5?=
 =?utf-8?B?VUxKSmpOVkpuMUhHb0dVQ3daYWx6TEVQdlBMcFM0ZCtxZUllUmxkRXZZU2Jn?=
 =?utf-8?B?azZ4ekg4Z3lqdzdxbjFwdnUxM2czbzVLVVB3SGw1OWprdUNNNkMzYnZNczFC?=
 =?utf-8?B?L3VtcFB6MXNrdzM0SG1lNHlzUCs3bTJCR2thV2k1dnYvaXFQNzJpa2RrbGF4?=
 =?utf-8?B?ZEVxekRBMHVkRE1xWDRLTVBpUTJyT1cxaGdoQ3lORVF3Y0hObVFTSmpoVC9s?=
 =?utf-8?B?SkdtWUt0ZmQ1TWp0WHVLbkVSMlJCWEE1eEpXalA3WDJTRTdCN3FaWWs3Yi96?=
 =?utf-8?B?QzR2UzFCVVo5clB4Sk83dy9wb0RBU0NnamZqNk5mRUU3clNvY2Q4SmdyNjds?=
 =?utf-8?B?S01YbU1yRGkvSkVUdmZUOXBqSWNQR3lRV0RzaDVBUWh3Z2VZMFc2Ymhhc3Nv?=
 =?utf-8?B?UTZBLzU1U3h3VUtmTjgvcm5aSWhmNkgrcUNEM2FqZTk2cHdSYTZPa3BpdUVr?=
 =?utf-8?B?R1Y4Y2pCMStTVXRiTlhGbVlBQWhISlZIWkpaMWpjTHdRYlJWR015U3hyR25C?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adcc0630-b8ea-46b7-38bf-08dda78291f5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 18:22:19.5122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSRYASp+SLJBxl8BO9DOBBgZt6qiqtBAwZI1esml2DE6afL27amjVrGS4g6zCZagDVr51DNTi3OhZhAdWm/qf906CXzOhVlutD9Tj4tnvnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
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



On 6/6/2025 11:35 AM, Jonathan Cavitt wrote:
> From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>
> Currently, numerous fault messages have been included in the dmesg
> ignore list, and this list continues to expand.  Each time a new fault
> injection point is introduced or a new feature is activated, additional
> fault messages appear, making it cumbersome to manage the dmesg ignore
> list.
>
> However, we can safely assert that all dmesg reports that contain
> *ERROR* in their message can be ignored, so add them to the dmesg ignore
> list.  This unfortunately does not include the device probe error
> itself, so that must be added separately.
>
> While we're here, we should also assert that any errors we see are only
> coming from the target PCI device.
>
> v2:
> - Only ignore error-level dmesg reports (or, at least, reports with
>    *ERROR* in them), and device probe failues
> - Add PCI data to regex (Michal)
>
> v3: (Michal)
> - Revert name change
> - Add change log
> - Remove fixes tag from commit
> - Rename ignore_faults_in_dmesg to igt_ignore_dmesg_errors_from_dut, and
>    move to lib/igt_core.c
> - Minor code fixes
>
> v4:
> - Return ignore_faults_in_dmesg to tests/intel/xe_fault_injection.c, but
>    keep it renamed to ignore_dmesg_errors_from_dut (Kamil)
>
> v5:
> - Pass preexisting pci name instead of attempting to regenerate it on
>    each run of ignore_dmesg_errors_from_dut (Daniele)
>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 60 ++++++++++++++------------------
>   1 file changed, 27 insertions(+), 33 deletions(-)
>
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 7a14ad1729..3166d95f55 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -64,28 +64,17 @@ static int fail_function_open(void)
>   	return debugfs_fail_function_dir_fd;
>   }
>   
> -static bool function_is_part_of_guc(const char function_name[])
> +static void ignore_dmesg_errors_from_dut(const char pci_slot[])
>   {
> -	return strstr(function_name, "_guc_") != NULL ||
> -	       strstr(function_name, "_uc_") != NULL ||
> -	       strstr(function_name, "_wopcm_") != NULL;
> -}
> -
> -static void ignore_faults_in_dmesg(const char function_name[])
> -{
> -	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
> -	char regex[1024] = "probe with driver xe failed with error -12";
> -
>   	/*
> -	 * If GuC module fault is injected, GuC is expected to fail,
> -	 * so also ignore GuC init failures in igt_runner.
> +	 * Driver probe is expected to fail in all cases, so ignore in igt_runner.
> +	 * Additionally, all error-level reports are expected, so ignore those as well.

I would remove the "all" in this sentence, to make it sound less like 
"we know all the errors that are happening and we're expecting them" and 
more like "some things are going to throw errors and that's acceptable".
With that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

No need to re-spin just for this change, you can do the change while 
merging if no one else has any comments.

Daniele

>   	 */
> -	if (function_is_part_of_guc(function_name)) {
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed: -ENOMEM");
> -	}
> +	static const char *store = "probe with driver xe failed with error|\\*ERROR\\*";
> +	char regex[1024];
> +
> +	/* Only block dmesg reports that target the pci slot of the given fd */
> +	snprintf(regex, sizeof(regex), "%s:.*(%s)", pci_slot, store);
>   
>   	igt_emit_ignore_dmesg_regex(regex);
>   }
> @@ -234,7 +223,7 @@ inject_fault_probe(int fd, const char pci_slot[], const char function_name[])
>   	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
>   		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
>   
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(pci_slot);
>   	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   
> @@ -291,7 +280,8 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
>    */
>   static void
>   exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
> -		const char function_name[], unsigned int flags)
> +		       const char pci_slot[], const char function_name[],
> +		       unsigned int flags)
>   {
>   	uint32_t exec_queue_id;
>   	uint32_t vm = xe_vm_create(fd, flags, 0);
> @@ -299,7 +289,7 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
>   	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
>   	xe_exec_queue_destroy(fd, exec_queue_id);
>   
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(pci_slot);
>   	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
> @@ -330,11 +320,12 @@ simple_vm_create(int fd, unsigned int flags)
>    * @xe_vm_create_scratch:	xe_vm_create_scratch
>    */
>   static void
> -vm_create_fail(int fd, const char function_name[], unsigned int flags)
> +vm_create_fail(int fd, const char pci_slot[],
> +	       const char function_name[], unsigned int flags)
>   {
>   	igt_assert_eq(simple_vm_create(fd, flags), 0);
>   
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(pci_slot);
>   	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	igt_assert(simple_vm_create(fd, flags) != 0);
> @@ -391,13 +382,13 @@ simple_vm_bind(int fd, uint32_t vm)
>    * @xe_sync_entry_parse:		xe_sync_entry_parse
>    */
>   static void
> -vm_bind_fail(int fd, const char function_name[])
> +vm_bind_fail(int fd, const char pci_slot[], const char function_name[])
>   {
>   	uint32_t vm = xe_vm_create(fd, 0, 0);
>   
>   	igt_assert_eq(simple_vm_bind(fd, vm), 0);
>   
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(pci_slot);
>   	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	igt_assert(simple_vm_bind(fd, vm) != 0);
> @@ -415,7 +406,8 @@ vm_bind_fail(int fd, const char function_name[])
>    * @xe_oa_alloc_regs:		xe_oa_alloc_regs
>    */
>   static void
> -oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
> +oa_add_config_fail(int fd, int sysfs, int devid,
> +		   const char pci_slot[], const char function_name[])
>   {
>   	char path[512];
>   	uint64_t config_id;
> @@ -445,7 +437,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
>   	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
>   	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
>   
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(pci_slot);
>   	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
> @@ -564,27 +556,29 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>   
>   	for (const struct section *s = vm_create_fail_functions; s->name; s++)
>   		igt_subtest_f("vm-create-fail-%s", s->name)
> -			vm_create_fail(fd, s->name, s->flags);
> +			vm_create_fail(fd, pci_slot, s->name, s->flags);
>   
>   	for (const struct section *s = vm_bind_fail_functions; s->name; s++)
>   		igt_subtest_f("vm-bind-fail-%s", s->name)
> -			vm_bind_fail(fd, s->name);
> +			vm_bind_fail(fd, pci_slot, s->name);
>   
>   	for (const struct section *s = exec_queue_create_fail_functions; s->name; s++)
>   		igt_subtest_f("exec-queue-create-fail-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				if (hwe->engine_class != DRM_XE_ENGINE_CLASS_VM_BIND)
> -					exec_queue_create_fail(fd, hwe, s->name, s->flags);
> +					exec_queue_create_fail(fd, hwe, pci_slot,
> +							       s->name, s->flags);
>   
>   	for (const struct section *s = exec_queue_create_vmbind_fail_functions; s->name; s++)
>   		igt_subtest_f("exec-queue-create-fail-%s", s->name)
>   			xe_for_each_engine(fd, hwe)
>   				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VM_BIND)
> -					exec_queue_create_fail(fd, hwe, s->name, s->flags);
> +					exec_queue_create_fail(fd, hwe, pci_slot,
> +							       s->name, s->flags);
>   
>   	for (const struct section *s = oa_add_config_fail_functions; s->name; s++)
>   		igt_subtest_f("oa-add-config-fail-%s", s->name)
> -			oa_add_config_fail(fd, sysfs, devid, s->name);
> +			oa_add_config_fail(fd, sysfs, devid, pci_slot, s->name);
>   
>   	igt_fixture {
>   		igt_kmod_unbind("xe", pci_slot);

