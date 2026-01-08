Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B81CD148AF
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 06:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF7E10E20F;
	Thu,  8 Jan 2026 06:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEWAYN/6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD70710E20F
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 06:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767855449; x=1799391449;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ih8Pa+AVqta6ox22zXDwe0GKosQJJ4rBoLSM9oHERDE=;
 b=fEWAYN/6+7Rh3HcZtWyKo8+3WZY4IGmHPECWfXzR0TjXCVK0aJg6fnd3
 Kz5Xm7XTbQyCPoHTU9HgEj3/zgkhl9P4iIVeTSfp4/pZjPyhzVR/wjjbF
 fuHgQbevsx7uG3SMRweV3p39nimcKpPnkEmlAwPyTj/JabKQ67OtJUZd9
 mR2Qn46WQ3GCiei/SB93v0uoJUi0KsMHnk7wXUgkfF0ICfIJ77BlzNEe6
 KWPaYzIMAH5zPH/QsKfrli/+zYmJNLwd1kVC9LXEAnKmOjLN85sib/k4g
 QTEzI336tbBJmkx4oRzEdelREi16fub+1aYEQfNkHO7mdx8HacsDviED7 Q==;
X-CSE-ConnectionGUID: irL6ulTjSuKY1oDPJr06cw==
X-CSE-MsgGUID: 6AtW10wOTdC8eq5d+5ZQLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69389296"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="69389296"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:57:29 -0800
X-CSE-ConnectionGUID: CSrm8AYYT5+a0afZ4uI1kg==
X-CSE-MsgGUID: voYvHTbmSt+3ocC7UAWZeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="207660634"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:57:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 22:57:29 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 22:57:29 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 22:57:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhDXRtBsC2cFfeL3ozeSkpd7YCqBqqRzb8hPwaZujvOIZhKRE4L6Wq5yWWRc9JyEltvmR548fMBIwxdCia6/YZdA+rbIKQYBj28lUlEoQrQyVTHq7Ot+wXizPDp8sRjqAu33PymUfMRIxO0F38KIKS/99inX94OKqx/nt3nbgcKQP5Ll4lypmoRcdrG2PVB56yQA6jzg8E1Z65WB9n6hDKvgfPpTMlQ0Tt3MBMBnV0gxySQBrh/oCORATk7U4RN2lyKoxv2j6veKAFm65djT/kq9w91Dwsk3538Qmr4XOlcJ6f2OLKkU+Dqy0nnPrChTl2SgV1uDXAA4m+Fnt/k25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oT9Nll+JyM5gzGpmsWZxdXnNsf2wMh/T0TSQTUB63A8=;
 b=m/N61WKyUUPjOmKRSCHC+a44u7DCxnx3rcSDHLjHPapfHUTgvgbYz7vNjzfvcgO8zAKSezRiEN9mH8FXemntayr/IY1hMCuS0jVce6Z5xFjp4Gp0IC9SynU3GVdZWNC+FjjDm+WgJtuRGJoZw2nRX3iE9IiLsdmENmA3hHhETAaF1dievorv09cTwYIMltUK1/l3S7SH6gbFEst0xK2sLnaX+QckXYUEgGwAwsLRH+AGAF1+mIQyvW/p2yj9shTjDMAnVLDlJRFluDHBYzmC8BkJre0fWYtb0J4ku6EJJX/6+zb2xL98tr1yPgvw8dsP+FTf/kDYrfsPPVRI5cKu0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by BL4PR11MB8799.namprd11.prod.outlook.com (2603:10b6:208:5aa::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 06:57:26 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:57:26 +0000
Message-ID: <070cc1b5-b4f6-4138-b871-9003f3dab38f@intel.com>
Date: Wed, 7 Jan 2026 22:57:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tests/xe_pat: add bo-wb-comp-1way-bind PAT test
To: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260107052406.21678-1-x.wang@intel.com>
 <20260107052406.21678-4-x.wang@intel.com>
 <cacc459b-f946-4f8a-9c7a-4a152dc07284@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <cacc459b-f946-4f8a-9c7a-4a152dc07284@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:a03:255::11) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|BL4PR11MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d1537e-7cfe-40d8-f24c-08de4e832e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amJlN1VyRFpCeEtnR29zSHhnazJZZTh1UFpkN01yM3RYQmUxV3UrMnNtcmZM?=
 =?utf-8?B?ZXlGOXkrSitlY2h3djRpTE9uNCt2YmhmN0JqcVg5eXF4eUVRQkNwOG1ZZFhN?=
 =?utf-8?B?YUwwd2xBMkhXY2FjcDRtc2lkeTAwWlROeDJKMHZ5Rnd2U2tuZ3l2VUw2U3ky?=
 =?utf-8?B?ZXdFamJFL3pLaVdHUWs2L2VvcCtJdVJzUitycmZocWt3MEdaZ3lFa3AwOUwz?=
 =?utf-8?B?S1dyWUM2TXBpRzRjN1Z3SXUzQmNFYlFpYU9sS0xFKytVVWkzYnR4dzRKeE53?=
 =?utf-8?B?SEwvT3lDLzRYdUFqWkdqaFJDOHdyS2JXZFkrN0dibjlFeWo5bDg1YjB6VVNx?=
 =?utf-8?B?ZEVHb3QxVTZIUENSR0RXeGZ6YUwzc290clprcndtYlNlaHpKSElMYURhWWda?=
 =?utf-8?B?ZUlOTGU4S2s4cU15cGxVdS9PV1lhREdwWmNjR3QvSjlCdGJKQlZXK3pLL1Zs?=
 =?utf-8?B?V0Q3djVSQlpkeXFzRkRpeU5Dd01QWVo4TzE1eXkyWFFyYmswSndhN1FTcVpq?=
 =?utf-8?B?eFB6dnhrVFIyTVdMcmRBTDE2YjlHM2xrLzRwNERCaGJkbWRtNFZnS1plMzJh?=
 =?utf-8?B?Yjd1SldoQ21mM24zMmhtdW5lNE1tMk14bTRydVZWYnB3UzlocXh2dWpCWVJq?=
 =?utf-8?B?SVFjWHhEaHRVQmcwZCtiUm9xSDBxL0Fzdnlnb3hJSUpQK3R4dThSS1lIb3Vi?=
 =?utf-8?B?a0dGc1B2QXNTWnFmOFdqZE9ib3ZSQ1N3ZHZhbitBOEEvZ3RJcGpuZjhBSkIx?=
 =?utf-8?B?cmZFRjJLVzdtc1lJaWUwQk1wUEE0a1hteGVsV1VnNkRsSnlwRzBySStJZGND?=
 =?utf-8?B?bi9FYzVnVmVVb2NiZzU0MEtRN2VsdzdKZ21oT1N3MTN5cndWNUs2THBRKzFT?=
 =?utf-8?B?VzduRE0rVjVuZHp0SXh6ZU9lQjJuVFZoRmJIMUd6Y1ZHbmRvdE4vdG1oWUNI?=
 =?utf-8?B?WlBza2dlNi9uVlF4SXYrM1Y2VCtvYUljMEt2OWlkdkF3N1d3WU9hMmVPQlhw?=
 =?utf-8?B?YlArRTVNSENjTzNnVEtWaUFETXBEcTY1RzRlUitOYUNEUGZxZmxmaVpiRUlN?=
 =?utf-8?B?YjJpMThKVGRiai9KY25WQVNIOWxEVytySmFXZVFiYmorbzJtblB6QnVsandm?=
 =?utf-8?B?R0l4TlJOVXpML1ltYTBTcExieFhISHMxVXZIY0FjOGtFL0tlTVhXRWtlWVZX?=
 =?utf-8?B?SlhzS0pSVkRwSitXeHVzZk5FQWh1a25Yd3JkNU1ablN1a1dZR05zOGU0Q1N4?=
 =?utf-8?B?cTZOV1RsSkkyKzNoNmw3VEhkWkhIemdxeFFqVysvNGdhNW16QWtrTE5VKzBy?=
 =?utf-8?B?dVN1TjM2THlBNWltZkhpWllMaStWWjQ3U2xOTmpGckozUmgyRTNZczNFdnpP?=
 =?utf-8?B?eHVhMGVJbWpWSzN5dGppWWlVc3FsaTF2R3JlcG9LcHAvWkRkVEovblg0VE5K?=
 =?utf-8?B?dS9mTVlpdU9TTEJUR292Z29QcUhnM0k0T2tHQlZyaWxZZlBPdTJDbE4rZHV1?=
 =?utf-8?B?TEVaQ1FMU0RJdVBHdkdOUGpaVHV3aWxCaFU4K3QxZ0xpbnQ5TExnOWpQakNJ?=
 =?utf-8?B?N2tVWnVMTmFjanRXbk9KOFBYOUFyOUtaMU9zb1ZYTkZSODd1MzJCTlRyY1Nr?=
 =?utf-8?B?V3g2SklzTFFWWnMreTdFRHo5cTIwK09zWUZkVjhWY2dOaWdMUlBKaHA0MU9L?=
 =?utf-8?B?UjVESzc2anhQbGFYNzFXU2lDYVArKzVRK2c5ZGQ3TXdjUmFoVjVJTU9Va0tF?=
 =?utf-8?B?Z3M0ZHZqMWpKbnV2RUNSNUJ4V3V3dDA3RVBMS3RVTUVVNGZJR3ZrdklhamJC?=
 =?utf-8?B?bWx5c1J1WVpiVWZUQjB2UVY3MXphNmNsYm51Q3NnekRqd0ZOWEkvOVFSQjc1?=
 =?utf-8?B?ekdNL2VWQXpBYlJlcWNXS1NPSS9tR2ZXZFAvbnk3U283Sk85blpFZkU5YWlE?=
 =?utf-8?Q?DMhr2H/igURzORNFJnNEx6SUJ/QSpGIg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk5SeUNTejcreFRlNWV6bFV3dkRUY1V1ZElXSVF6V2V0YUh3eHM5QkRUWUkw?=
 =?utf-8?B?TGhQdnY4UDVBQStlV1lSQW1YemRpN25LN21vcSt5WFVGa0cxRTk5bEtiUUcz?=
 =?utf-8?B?MCtHcVVBemU3cHFIM1NBd1RBSC8rWUVjb1pwdTJiVFE3NEtOZGVXT3IxOWdQ?=
 =?utf-8?B?dDdwRUNsKzhrdFQxOEFXQkJ2Sm9JeFYyUUpNb1RONWlnbzQ0WXRKb3ExTXli?=
 =?utf-8?B?OXNNOW9OSlhDRU5FYnN6NUNDK21EWkNVVFVlNThNcnY0NTFWZkkySWYrYnFt?=
 =?utf-8?B?WDJod05MREpvMHlydFpMOHM3SzU5STNUelI5b1IxWlNOckYvYVJSSGtiTi9n?=
 =?utf-8?B?aW5Ta2lPdVRsbjJUTHJWMFBNWXRCR1pwbU9kZU0wV1BZQ2F4dWc3UmlBNUhR?=
 =?utf-8?B?RWpMY1p3QnVic252djdhMEcvMEF1WlV0eGdQZWE0OGhlNVgvNkxBN1ZHUWFp?=
 =?utf-8?B?ZGtkQnBhTjErRER1Y3pzQzNRR1dpOUhMQWFZSFNUUUxkVmJTUEMreFlBVU0x?=
 =?utf-8?B?dUNMZVFDVXF1M0hQYzUvZVI2bVpLeWFCKzhPZFBNbWNzZWdhS0lBY016bWYv?=
 =?utf-8?B?eVVFa2h5MHJxMGM1R1RodXhyVXJNNUlaUHF6SndPM3VaWGJaV1dYNFJLUTRk?=
 =?utf-8?B?L3RmQzAvaEozYStUbFBVRXg0UmhYY3NsdFNzNVFhUXhUbzhmVHhhbGNpNElJ?=
 =?utf-8?B?QmFDdTRxUXdNOG9YTlNOTzZ2OGRSSEd6VVFUNkRMSXBZWHR0Rm9QT2NGdGhI?=
 =?utf-8?B?RGpTUkYvRlAyektxWHVweGRGMk5qY29sSkgvZXNtVGZKaFljYm1TOFR0UXhD?=
 =?utf-8?B?ZGNqOTloYUR1eWY5M0tjTmEwRGE5c2JIWUhHckVFVStpWjhJSUNacTd5KzNX?=
 =?utf-8?B?N0M1MFh3cGhOc0l5SzNLWnVsSlVRTmw3UnE4cXExSUhiaWhZYTRqbjB1a0pi?=
 =?utf-8?B?dkVCZUt3RE1KRmhyUzFadXRLM3NYOU5HS3JycStuYUN2REdaRFpsMy80NzR6?=
 =?utf-8?B?UEhyUHUzUXRYbVh4TkE3S214WHlCZ09XMFdyU1BVdWZCbThybHVXbUNCMWxC?=
 =?utf-8?B?QXZYRWJIalRObkkxY2paWXgwTWZvYkFEalpsSlA5S3o2d0dKOStpQm5kbFRM?=
 =?utf-8?B?QVhMU1lENG5lbkF6b0cvbnZ1VjdUZnJEdzU1dFdnWUJjYmxCaThuTE5zRjVT?=
 =?utf-8?B?U0duaW8zdWUrTSs4VkY5N2haV3JmQ1F3ekN2R1pOSzhvM2VTU01oMURqZlVl?=
 =?utf-8?B?UkJKV09oV00zZnB4WVJKQU9PdmtBM2RPM0d5QUM4MWZTTk5Qem9YeHhDV1k2?=
 =?utf-8?B?V3BXdlRRb0U4UUdPSzdUa1I3ZHhwb050eVpnYU1mdUxpdlFRanVEeUUzSVhj?=
 =?utf-8?B?cFpaOENNa3M0QkthcHBkOHVUYytUMGcyNFhhK0k0ME5Zb0dMbXRvM0FyRUo0?=
 =?utf-8?B?Ly9MRzVlY2llcVdUb3NDU01WQ3hWaUp3KzlXMk9jVmhLSlU4OUdpdHI3M2lX?=
 =?utf-8?B?YWdINm1nTjg4OERvTlNvaGhqdWNCMTMwS2lqbmpSKzZGcEFxdzFoeEtsMFRF?=
 =?utf-8?B?bWdxMm0wS1AreFhPeWZJdVZqZW5ialpVb0w5U0NIdmNCMXJHY0JRUzIrcWtX?=
 =?utf-8?B?a05xbzczbG9CU3BGV2ZOREtqRHdROTJXcUllL0QvUmRQUmRWcWJId1pZSFpl?=
 =?utf-8?B?NEhKWXY3SGg4Y2JnNXZvSzEzbG5jZEpES3Z0eG5HZHFMRTlrWFhFaTZIMndX?=
 =?utf-8?B?aGRjL1dKODVXUDZkUUdNUGtONExLNHEvMGRxTERtMzlRbEliR0dYdjVSN3RJ?=
 =?utf-8?B?VmJpZDc4N1VIUUFsOFc0elNQK1pUeE1FS1F6VlNnamVOU0loemdrdDlERWxT?=
 =?utf-8?B?dzZrVFRHNkx2NUNOT1RkekFoVVplcmVuUi9Jem4vNVc0c3FJcDlZclU2dEFs?=
 =?utf-8?B?R25JRy9zTWozVUtyZ0lKc0w1eDNpTkVzbXM5Wk1RMWw1RXc2L2NHNGoxdnVo?=
 =?utf-8?B?ZmluS2lYMlZmYmcvRnRiTE80N3VZSjZHYkN1dkwvK2R0RWlXMkhBSGpvWi9w?=
 =?utf-8?B?YU45R3k5bm42bTQ2Q1NoQTRVNzE5b2ZMdWFUL1hmTWxzNm4wT3ZFb0xyNTk3?=
 =?utf-8?B?aEJaYlUxYWw3M1YwZWUyRWhNNHZiV1ZBSWtkMy9WYnhIYmRYY092NUZjdWtN?=
 =?utf-8?B?YlNSc295cnFxMXNDeXJNVjdoWDlLMHFrVDNtRkdvNmlhRkZYOGhNTEZsZHJH?=
 =?utf-8?B?TmlTMGVNQ3ZEdlNBUCtneVZGcHU2TEVsRGFUWFNqbHZLMjFYNnVkWUhTZTN5?=
 =?utf-8?B?aFhZM3d0TS96SjZxS1ZjK0lrNzA3d2NEVTlNU3BMQzFZUGdqZTFZZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d1537e-7cfe-40d8-f24c-08de4e832e8e
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:57:26.3884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EaeJZzDcI32NjfTcS6SAytjM2UmV7lLYrFsnEVC1XhSVeqPZBzrxBI3z/g4iM8ukkRPmJv7K2uE5cnbBjextgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8799
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



On 1/7/2026 02:17, Matthew Auld wrote:
> On 07/01/2026 05:24, Xin Wang wrote:
>> Add a xe_pat subtest that looks up a WB+compression+1way PAT entry
>> from the debugfs PAT table and validates that binding a WB-cached
>> BO with that PAT index succeeds on Xe3+.
>>
>> Skip the test when the platform doesn't expose a suitable PAT entry.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> ---
>>   tests/intel/xe_pat.c | 76 ++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 76 insertions(+)
>>
>> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
>> index 8af6ad174..2c98acd2c 100644
>> --- a/tests/intel/xe_pat.c
>> +++ b/tests/intel/xe_pat.c
>> @@ -112,6 +112,43 @@ static int xe_fetch_pat_sw_config(int fd, struct 
>> intel_pat_cache *pat_sw_config)
>>       return parsed;
>>   }
>>   +static bool find_wb_comp_1way_pat_index(int fd, uint8_t 
>> *pat_index_out)
>> +{
>> +    struct intel_pat_cache pat_sw_config = {};
>> +    int32_t parsed;
>> +    int i;
>> +
>> +    parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
>> +
>> +    for (i = 0; i < parsed; i++) {
>> +        uint32_t pat = pat_sw_config.entries[i].pat;
>> +
>> +        if (pat_sw_config.entries[i].rsvd)
>> +            continue;
>> +
>> +        if (!(pat & XE2_COMP_EN))
>> +            continue;
>> +
>> +        if (REG_FIELD_GET(XE2_COH_MODE, pat) != COH_MODE_1WAY)
>> +            continue;
>> +
>> +        if (REG_FIELD_GET(XE2_L3_POLICY, pat) != L3_CACHE_POLICY_WB)
>> +            continue;
>> +
>> +        /*
>> +         * Matches Xe3 compressed+coherent entry (see kernel 
>> xe3_lpg_pat_table[16]).
>> +         * Note: L4 policy is UC in that entry.
>> +         */
>> +        if (REG_FIELD_GET(XE2_L4_POLICY, pat) != L4_CACHE_POLICY_UC)
>> +            continue;
>> +
>> +        *pat_index_out = i;
>> +        return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>>   /**
>>    * SUBTEST: pat-sanity
>>    * Test category: functionality test
>> @@ -958,6 +995,42 @@ static void bo_comp_disable_bind(int fd)
>>       xe_vm_destroy(fd, vm);
>>   }
>>   +/**
>> + * SUBTEST: bo-wb-comp-1way-bind
>> + * Test category: functionality test
>> + * Description: Validate binding a WB-cached BO using a 
>> WB+compression+1way PAT
>> + * index (as advertised by the debugfs PAT table) succeeds. Skip if the
>> + * platform doesn't expose such a PAT entry.
>> + */
>> +static void bo_wb_comp_1way_bind(int fd)
>> +{
>> +    size_t size = xe_get_default_alignment(fd);
>> +    uint16_t dev_id = intel_get_drm_devid(fd);
>> +    uint8_t wb_comp_pat_index;
>> +    bool supported;
>> +    uint32_t vm, bo;
>> +    int ret;
>> +
>> +    igt_require(intel_get_device_info(dev_id)->graphics_ver >= 30);
>> +
>> +    supported = find_wb_comp_1way_pat_index(fd, &wb_comp_pat_index);
>> +    igt_require_f(supported, "No WB+compression+1way PAT index 
>> found, skipping.\n");
>> +
>> +    vm = xe_vm_create(fd, 0, 0);
>> +    bo = xe_bo_create_caching(fd, 0, size, system_memory(fd), 0,
>> +                  DRM_XE_GEM_CPU_CACHING_WB);
>> +
>> +    ret = __xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
>> +              size, 0, 0, NULL, 0,
>> +              0, wb_comp_pat_index, 0);
>
> I think we also need something that actually uses and validates 
> compression with cpu:wb from hw pov (which is a significant change), 
> similar to what we do with other interesting PAT modes and adding them 
> to pat_index_modes[], and then hitting them with blit, render-copy 
> etc. Otherwise only testing the software bind interface is big test 
> coverage gap IMO.
>
> I think you were reworking the pat_index_modes stuff somewhere else, 
> so it might change a bit but in the meantime I think we really need to 
> have at least something trigger the hw flow with this new mode in this 
> series. Or does that already exist and I missed it? What are your 
> thoughts here?
>
I do plan to refactor the pat_index_modes[] table. By reading the 
complete PAT table, I can automatically generate random test lists for 
each platform, thus automatically including the newly added case with 
pat_index = 16. However, I intend to move that modification to a 
separate patch. Currently, I plan to add a new test table for xe3_lpg.
>> +
>> +    igt_assert_eq(ret, 0);
>> +    xe_vm_unbind_sync(fd, vm, 0, 0x100000, size);
>> +
>> +    gem_close(fd, bo);
>> +    xe_vm_destroy(fd, vm);
>> +}
>> +
>>   /**
>>    * SUBTEST: userptr-comp
>>    * Test category: functionality test
>> @@ -1461,6 +1534,9 @@ int igt_main_args("V", NULL, help_str, 
>> opt_handler, NULL)
>>       igt_subtest("bo-comp-disable-bind")
>>           bo_comp_disable_bind(fd);
>>   +    igt_subtest("bo-wb-comp-1way-bind")
>> +        bo_wb_comp_1way_bind(fd);
>> +
>>       igt_subtest_with_dynamic("pat-index-xelp") {
>>           igt_require(intel_graphics_ver(dev_id) <= IP_VER(12, 55));
>>           subtest_pat_index_modes_with_regions(fd, xelp_pat_index_modes,
>

