Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A645C02187
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 11:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA1510E576;
	Thu, 16 Jan 2025 11:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSLyEsfR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914A610E1E4
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 11:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737026545; x=1768562545;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=D/ig9ekHdQcO0UmfhSoaeyhoWJnT8zeIgk7Njf4CUts=;
 b=lSLyEsfRFk5lJdQNHGXgFULVRpSoxLBL4lfgkGARyZMPigH/25Sbutr5
 o4XAr944wcMGXzMyj+89OgWYvMC0aYpgR/HJESucEDZckXzgiq6P/Rzpa
 TjXyWliboctIATaWA1wzYPI7jXzXf/LIxuhldfzUPrYWEofNU+mkwmcBv
 SDwyO5wQ/IVk6VGJJEyuCQ9sgkFh13geXvE3cxV2W29yZhGCxn/SFuyYK
 rld0Bn1sZlyMHQYksNqAJNniG/Qv5Fd+DotINzXt7lXLI/B49Rczq5hm7
 pK4Hxlwz2DN5qDoNiHKdTE6OHbeah5LQr06A+9e/OM54AveZj+wjKf0Ti g==;
X-CSE-ConnectionGUID: RibZp8zgR7aVeEIjRZcygw==
X-CSE-MsgGUID: AdHuabRETja/aS5rc3w5eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="48409447"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="48409447"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 03:22:24 -0800
X-CSE-ConnectionGUID: jnTa1NNWRXigNNTbnLyMdQ==
X-CSE-MsgGUID: idNuAFWEQBaR/1ehOg1usA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="110442998"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 03:22:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 03:22:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 03:22:23 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 03:22:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lz3I9h059BJ+iNJk3NViCMIyp1OrPBdw4jH20AxttTFt0Yet8oGcDSyMDk89yHM0WDhyOmOLg7k/0/2OHIT9N+BGbax5LZWZCE6NaezSYUae9jOwkx+oxeTeTMOEaeMcnnnIQcHXVxQX/MS1aTfcElzzvCXCB/gqZjo22UodRTHs1H9fkd+lEltfoA4WoN8dRXgoTZfT1lL0kkkzGCMjCfwTLPaWvFBPqOXxnNxLMA3Oxohw+N32fnfm0rZ6ofYlQWwlOexbfdTUuJOb5IJ9XGxX/pJ3mON/PZUdYYo0TnFwy9nQn4UBA2MeHbD17rg9St3W18n7mJ4ZPXcHOqxLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cq9qtKHGMcafyVKpJZO0H7vF1TcvrQVJ/ELh4MFv50I=;
 b=vipx7GNRjM3kSSMfaSZpwsRuD8toohr6obnH8+Ab5ZrQMgDOWyi0IpuE/n8YsfiQ2d9mCCg6maCnXPU5kimbcUejY2Vb945uuF3G5TCvvQzGsFCKNix1dv3FU7f7vdL1UUHSYQFeTGDPggAN8B5S+xurm0L1p/8JYz88ttvm5xFSWr3zeagx561nR+yuKd0RqzWmFX68Etg6Zzkql8dTp78Mu/gDBuzgb/62PV28kFy5XClmYEKYMUwp2f0PIL1EQ2Z4ln6jb8/wXY7f8Q/DiFZrNpx5ZUdZHGb2QZU39KOq4aPf1aR45BDKqg4AoNiBGWTrKkaaa172+XqZA3gU+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS0PR11MB8051.namprd11.prod.outlook.com (2603:10b6:8:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 11:22:21 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8356.014; Thu, 16 Jan 2025
 11:22:20 +0000
Message-ID: <c04bb131-49a1-4ae4-a464-8b8b4c1e832e@intel.com>
Date: Thu, 16 Jan 2025 16:52:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/chamelium/kms_chamelium_color: force connector
 reprobe after plugging ports
From: "Sharma, Swati2" <swati2.sharma@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250115151507.2023293-1-kunal1.joshi@intel.com>
 <0dfb0496-b46c-4bca-ab6a-3d11afbd1ac6@intel.com>
Content-Language: en-US
In-Reply-To: <0dfb0496-b46c-4bca-ab6a-3d11afbd1ac6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::19) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS0PR11MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: d969b954-b5f9-4a75-4cff-08dd36200ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVBGbFVkYXRnSkRneHRORjdjeEQrUVVwOE1BbUhRdHZRSnBrbk8xZHdKdUE3?=
 =?utf-8?B?WTAyREFjQmFSQ0FQbzFvTUtVUEM4Nm01NHB4SmszMDBwYnhkcjZjM21qOElK?=
 =?utf-8?B?OXRBVlorYzRVaVZPZzFPZnpIQjU4K2tSOE9Ea2dqeWdrSU9YVVpBNzFOUGlH?=
 =?utf-8?B?Nks5Z1NKUDRTeXUvVEpNWk9pOUpFWFBxOWthNjhvb1QrNTBGdFgvYmJncVM2?=
 =?utf-8?B?TTVOSkFwVkNZOFo5OTh6aG5EclRzbFpoQ1lzbXdvSE5tODVod2ExS3ZxUDBy?=
 =?utf-8?B?bVJNblZqOWpmWjB1ZVRqQlFORDhDbTdZWnpEY0hIa2cySXJlaWJnS3NhYmUv?=
 =?utf-8?B?K1AxYWpSM0NKSUpKNG9OZm5NbktHSWliK3lmMjZ4eUp2NlhYcktkMmFQdnlF?=
 =?utf-8?B?dk1QcGlqY2g4dzZ1TlY2clJuL3pEV0JrS3IvZUMwSzZTeEF3U2kyemJ3RWdq?=
 =?utf-8?B?ZXh1YmdpNFVudzEvbkkxWDdPRGFaVjdTSWhuUzgxRWdLWldxTEo4RHNmMUtS?=
 =?utf-8?B?Z1BXcVV2M1hGMGZ4a2YvZlFPWS9yejdQMURhVlRsM1pCQktkZ2xtNDhzZ2p0?=
 =?utf-8?B?Wm93eVYzQzV0cTVUSVNJeW9aZTNaeFRuZEFnbXNVVVlPT1krd2xxRzlaL1ZM?=
 =?utf-8?B?b1pEZ1ZvVzB3cjk2dExjekRkMXMvZWk2ZWZPeWVHd0lFQVhrbXdIZDdFc3g1?=
 =?utf-8?B?Q3JpQmIrTmdhdy9xQ0dybFZJZlp3NHZmN2ZZTWl2UVpkV2l4akRMQTJWNVVE?=
 =?utf-8?B?Tm85dnAwTDZleVdiTXJrOG9IZXJxSktZUGord2tWZ3JSdit5SjVVMkRQbS8x?=
 =?utf-8?B?YzF5b21OeUNNK1ZlZkZPY3RZdUFPOWRhRjFkclpUbkk5MkpZUGg2Rm4wTFVn?=
 =?utf-8?B?NlRvYnNCSTBLZmNPbk5oa2V1a3VOUE9wbGt2azJTeDFmYnhkcHhMWm9rRDhI?=
 =?utf-8?B?VWQwUGlXNDYzZEd2TmpTbk1vWVpyWjFhNlBSb256QTU2WWR1V1owTDJYcXFm?=
 =?utf-8?B?WmxMNEx0MjNOc2tYQWRGQk5yUEExZVM2TzIrei83b2NWTys5V25kN1J4RkM2?=
 =?utf-8?B?M2pCNTJGeDI4S0lXaGhmUFE5YzRtOGI4Sm52TmVXSFc0L0QrSEpsaXVTcDJn?=
 =?utf-8?B?cmRBZHpzMmh5SE9lOThHZ3Z6cVBVQzFBWDU2SU12a3VxNjBoWlNFTVIybkU3?=
 =?utf-8?B?Szk0ZTNSM1liUTl4bGozQTEvZ2xVTDJxS1VBVjB1eFdwWkFEeXVIa0IzNkFK?=
 =?utf-8?B?eWduYWFVODl3UWttMWMxaFF1SUhsemM0Y1UvZnVYdHBKNXF5U2poOGN5Y1F0?=
 =?utf-8?B?RGlPVzJLb1RwNHQrdzVlSmppbUsyTy84ZHFmQjk2endxcHZkUWRjcmpLaWdH?=
 =?utf-8?B?K2dka3Z3MVVNSEFnaUdNZUZsRDFLU2tKRi85VmJoSUUwUUhZN2lVSThOTUQ2?=
 =?utf-8?B?TGNRQXJjYWV3cDR6eWlNYU1qK3hsdkxEdkFodHVvTUZ2TmFkL3poQTFON0N0?=
 =?utf-8?B?VW94Z2ZETW5Nc3dPZVdtY3lnQzFIbXdjUnVGcnNYSlBPSjNlSXhHcjZyQlkw?=
 =?utf-8?B?SDNJN2R1d0w1Qi82bnJOUHNmRkNvcEhGNVNyV2dmbURDREdFa2Zwd0t6TWc4?=
 =?utf-8?B?Ym5oZlRHamJ3dzZieW9UY0hhOUFuVjdnLzRlcmc1SURaOWFuZ1FBTUdvTHk1?=
 =?utf-8?B?TEVYWkdRbzNQZ2VUSit5ZHk2NGJJMTdoKzRFQUVxWHlLNGhuU0pZeXJtbkUx?=
 =?utf-8?B?cHVwWDFFZllVaWh0YXlsc2w1c1FneVZtOFE3dm1vR2RSaWJ4Y3hiU0QzUGJS?=
 =?utf-8?B?OUo2ZC9FS1ZEaWdpTHJhQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVE2Zm1VdHJlLzN0V0ZSUDZ6S3NsaGlFQVFTZGE5K0N4MmI0L0txNzVRYmJK?=
 =?utf-8?B?QUlXc1hyUUxCbkJKUzRyMjBaYjVaT3hOSVl5SW92M2lzUERLYXRIWndTQWdy?=
 =?utf-8?B?NTJTYUVDOFFLUWl3aWtnbTZ4a2FjUDY0TElnTTIvdUlXaUtHUGo0a2ptYmhU?=
 =?utf-8?B?cWYyU3l6Zk1KZVFJVU9ITlB6Z0RwZmM5RlZTcnMySkJCK2tqL3FRbUFhYTU0?=
 =?utf-8?B?THNQTk9yL0wvN24wY3FBRkVLS3plMkRabTQwUjYxTHhXSXZSdDFFOEc5L3NP?=
 =?utf-8?B?N1UxTkN5N1E1MnIyb1g3RXhFQUVUdEwvZ3pwZ2dkTVoxb2UyMHFtT1lXMFVV?=
 =?utf-8?B?cktVa3JOTEFUeUhGeDFuaEx3cG9kR3RDUUNvUkFnVUJQNGlnNnFib3V5VkFM?=
 =?utf-8?B?LzFnTUZDNWpTQ05md1JPSWVxenlEOTQ4emZ0RWxpOGRsVWErcEdNR2U0RVV0?=
 =?utf-8?B?SVV1RGIzV3pObXVZZUxZb1RpWG9BMjI4OUFqdkhudVRURkR6RlFEZFJLa2FH?=
 =?utf-8?B?MWQ0Vmd0Z2JvYVBjNFhtQTc3N3JqUkt1dnpoVHA2cmtnUzVYVWI2ZFVhYmlm?=
 =?utf-8?B?QTA3RHk1b1pkY1pFRGU4NFhKaEtMbHlZMW1PVFJ5d1hYZldnTWh6K3BFTy9M?=
 =?utf-8?B?OUIzb0RCU1hOZ1pmdU4wY1I3ZEpwbUJEdHorT29SS21nZU5NOEFCY0VLZ1VD?=
 =?utf-8?B?MzFMYXhXVW1ZcVE5blBrL1JJK0lDcWhLT2hBVHdJTnltMURaZWVFSW51dTBh?=
 =?utf-8?B?YnBpWmdMSHIrSXRGQ0phNERQZlNnZHV1KzEvNm50bjJvY2tQU3pDdnpkT1g4?=
 =?utf-8?B?dGZXbzRKL1JQdjJ3eUZrTThQUWtuR3lWSi9jYmpPV2RQSWU5SmlGK01LVGVB?=
 =?utf-8?B?NE4wMmdZa2QxRzE0MVdIUkJ1VzJCbEtLakVLM2J0dU1jc0JUMElQSHY3V2hT?=
 =?utf-8?B?NkVNUkdpc0lkNkJPU21OY3NFTUtmbG9NVTF0VmV2d01MaGtkWFBrVkwxekFv?=
 =?utf-8?B?VVMvTGY0eGF6V1lOU2NsR3pXaUlydUZtazhoY3lmdnV0TDFYczZ0SlNHa1VG?=
 =?utf-8?B?Y3d4SVZOQmtIQlo0MGpKYSs3Zzh4eUlEWmFadkhiUUZKRnZRaGVRcG9idzdP?=
 =?utf-8?B?aSthemE2T2Q5Mzk3NElZY1VFOHdaYjQyeTMzNFZ0aHJXTi9YZENrSUpVTnMy?=
 =?utf-8?B?bTBCcGphbkZvQWxYamxPZ09zcDFmSjNDRjhKRnJKUkJwbm9GL0MzbURUd21n?=
 =?utf-8?B?Qnk1VVNpOEtScnBROWlrK2JuZFIzYlIybXVXM1VwWnBVRE5ya0U4ZFJ4UlJV?=
 =?utf-8?B?aWtmR2pHMVRQYTVJdWZUZDU4cWhOQUhveXM4TDgvTStuTmI2YmlMeTJMRWwx?=
 =?utf-8?B?MEZ5UlBMVE44QjYzLzFkNzZsRy9nWjVBQ3IwK2VKQ29ZVWlkZnBBd3gzeURU?=
 =?utf-8?B?RVlOY2g1VzIwRUdpVWs1UU5JTXYvY3JmQmdIMUZPWlkyYkRlZkRYN0x1UUUv?=
 =?utf-8?B?SkdaeDI2d2Y5cVZFZDlESVhjbW9mQTVXLzFvWDNNbUQxbHllTG9FQUNuK3k0?=
 =?utf-8?B?dWFnb3dIMFBxTGtjcFpwTjRVM1orMmJOT09jY0p4eUhmQ3Q5S2UyRVkyUUov?=
 =?utf-8?B?ajEvWWFHSkRScmllVUxxTWJjMzd5WFdMaDN5YVRpcGxvQSsxYklmZGp2eTQ1?=
 =?utf-8?B?ejdldWJ4bHlRcnJFaTBtbUNlclRPWnN6R3dCZWtPam5LSUxLdWZSdElDS2xL?=
 =?utf-8?B?N1gzcmdqUnVxT1hKdVFTaGlhek9ncVJ6R0gyajZaUEo2N21kd3I2UFNwQ01H?=
 =?utf-8?B?aFpCenhoT0piRGhJczEyTzlneWs1U2IyTmxvMEk3bGd1aXVTKzB5OGZKNlpZ?=
 =?utf-8?B?eFFOS2NTeHZ2VkFxeTlERmdxdXZZTVg1YUdBdUYxejJjWkJHcFJtYVNtMldl?=
 =?utf-8?B?VHc0NmVhcm5XbERSbE9maTBZdHB3TThJcXY5Y013UWNTcVlydWVrblMzYUo1?=
 =?utf-8?B?RFlBWk55RkFIclpPa01SOVVFRmFZcmtMUFF6ZklIeVpUUGpjTGdCNHpob0Ja?=
 =?utf-8?B?OTVEajVNVC9qb3dIUzhMeFY5WUowZEdzSysyV0NiRWFGbExqMlRpaUJvTWJ1?=
 =?utf-8?B?ZG5pMy81ajJNM2RSc1d6eUt5UEJVaFVrK2RRbHQxY3lPZ0pTbUh1M3ZySVVW?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d969b954-b5f9-4a75-4cff-08dd36200ae3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 11:22:20.8669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BDQfjtirHi0hcJDxH6ZzcZmWKSmVHQofAlYgVmY//U7+UOaUDR08iqsmSupXJ8mW/0RFuqBEXF55ltCOkvpXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8051
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

Sorry missed one comment.

On 16-01-2025 04:09 pm, Sharma, Swati2 wrote:
> Hi Kunal,
>
> On 15-01-2025 08:45 pm, Kunal Joshi wrote:
>> Force reprobe connector status after plugging to assure
>> we always have DRM_MODE_CONNECTED status for the connector
>> before proceding with the test.
>>
>> Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2371
Use "Closes" tag.
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   tests/chamelium/kms_chamelium_color.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/chamelium/kms_chamelium_color.c 
>> b/tests/chamelium/kms_chamelium_color.c
>> index 5550cec22..7c88c022c 100644
>> --- a/tests/chamelium/kms_chamelium_color.c
>> +++ b/tests/chamelium/kms_chamelium_color.c
>> @@ -749,8 +749,13 @@ igt_main
>>            * discovered ports, just incase they are not plugged
>>            * we currently skip in test_setup
>>            */
>> -        for( i = 0; i < data.port_count; i++)
>> +        for (i = 0; i < data.port_count; i++) {
>>               chamelium_plug(data.chamelium, data.ports[i]);
>> + igt_assert_f(chamelium_reprobe_connector(&data.display,
>> +                                 data.chamelium,
>> +                                 data.ports[i]) == DRM_MODE_CONNECTED,
>> +                                 "Output not connected\n");
>
> Please add output name in print message. With this fixed.
>
> Patch LGTM
>
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>
>> +        }
>>             kmstest_set_vt_graphics_mode();
>>       }
