Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F54DC79FA0
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 06:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6208210E9C5;
	Tue,  8 Sep 2026 06:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJbUB2wk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEAB10E9C5
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 06:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788847760; x=1820383760;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AmDynlGF+6JLcRYZB5nQNEIH3rrNQptjZdRlZU23C74=;
 b=TJbUB2wkXqEUf8XGd2nl2x/Wd0KfHNzG56cABD6i9Z3WxnTeSSJKwCvI
 YMJUuQxdPhVfiHozwc9OhBOn8UtZE1li0uz/NwtBXOY98s6ocIwcX1/H7
 VpEoFnV0a1vodLBWcR6xwBzwRv5m3zZy3mWaLyThdOE2XVC7GEY53SGQf
 K8s9F939NsgdQT+u0IP7bkI907BnKL80N/WDqX/BSe8tN4LlrRsTrzWxi
 n81jplvPWc8cjqvO+S/W1TKiLF8LE8qWEXr1KsRMsFDl1ldY0rkwDSlhc
 w8qmNh8wzYPU+Dp7sJhzi/cod4bHco3Liack+hvW03PbVVyZwCbnfrzkL w==;
X-CSE-ConnectionGUID: QQtM/ZDbQtiyYQsm6VEijQ==
X-CSE-MsgGUID: iLCRjgMURVmLYxPFlow2wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106611666"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="106611666"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:09:20 -0700
X-CSE-ConnectionGUID: +QeLG8ilRIaXR3uo9JoP+A==
X-CSE-MsgGUID: 82u8fp7yS8izQ4BHkVk18g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="274676875"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:09:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:09:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 23:09:19 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:09:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5AxkeqL5CebNhXbaH0uU8f4XbImuZQKNJ10CIbkuKxkLoZtZRBjFtLOInwqpPDQYachWT0QTWQ4wvNja6tuePFbwup4TJqpO2+M0M7ykprFViCC8E4z0qznlUhqOJuDPi05G6IcmHJ06TwMfsomYGMz/FJUTNJnT1FMHHY+VOcX5aV/0gJQLBkJk5lx7dKRdtbl6Lx24+id8ha57KnSF0H1CTME3h+Yd+xg9UZPJ5N6YO/SLQn9WXxARIAoC/JJdQhvJg/80fmbj8TUbNiTC5CIZJUWjRzNc9Z6PyB6XMxaExlc0oEJkebWwT1TAMVnjh7hujbqyYqXnxrc8yhx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbnNebHYuU2Idutg69z+9LUh29wkItF+EqsZNn58Twk=;
 b=qERYXlabBNe3xlPYDnaTlN4xf/VLhqHYbITTdJ5Xx9Gjsaw/+nD6k9F9z3xItexJzyEVaYOi4kqyXrGXolN2+T1/BePEFtocOL02RCA2+hGGnVF8GiMT872USE6HnKYGweP+95XDKfs/xKa+cmGyaGYpl0WqsleEn2HONbqNdnGeCbrrCLiXSNAA8dG+qZmM2zXLZyIuTp/ctWPHAXmFzLlIbWNKqs1fsJImKBgvDxakMfd8I7aTD050UeDFrHdO+IPJ/J3ooOTEXKI1tTQySfyGM+7Tpk7YqyTCQhSV8un/ukC+5Z7S1AwVeHB8Y9HXjN7yQCE9rLHUBkTSwBzwkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by DS7PR11MB9500.namprd11.prod.outlook.com
 (2603:10b6:8:258::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 06:09:18 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b%4]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 06:09:18 +0000
Message-ID: <5deb564d-42cf-4cf1-acdc-d82f763481cf@intel.com>
Date: Tue, 8 Sep 2026 08:09:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/intel_pat: add intel_pat_has_wt()
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <zbigniew.kempczynski@intel.com>
References: <20260904085650.98553-1-sujaritha.sundaresan@intel.com>
 <20260904085650.98553-2-sujaritha.sundaresan@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260904085650.98553-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::6) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|DS7PR11MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d78cf9-a75e-4052-bbaa-08df0d6fb748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vcUrMK53aMRcDnGb+yo2ta7DvKSPHJvFscIcqK1QT8wjJDltkSLrFwHeojzXl6pjns+4/YZSJOADZJLQuuT3tqp+sTXqeFm1NWsO5ZIYV4sFN3gA7aJYLY75ZNS6UmE8EB2UeeBVVxMsqLmDU8XheGEjpwkFNpDEcCTkkNzNLwh9sF9yJKigiGF8JBxUc+0vi4QfZhEjET5QZk+46TdmkhYfr7dvgiTL62iBsZK5fbFQ0c2doUZ073ezGoaBw35/VLjxYjcYAIKCGj4tj0DG/KFc6TwXogY5eft4fwCWL9KiP6lJB+kuAisBBKGmiZ4/GucgJamcfa9E445LNRKHzV7N2tGovi0m11bT6Q30SwYnMhRinxdQbcQnUPXqgFzv6kdcHQmmO8fN9Cr3V+ltVA73kTIqPDwgTeTO/rU3G7CjM5dRndX0vLmVyi+sQs0/GYSURe19BVivZy6NrbYbbabI4RKZwuU7GI49Ms2sZAgYrSQAm29/dlOHy3lnaWl5uFDxdcGcTR3lq/B1W5tKX557P+U801RcNkz7JPnImyApl4BWbKx8cuqQOaqpTzdC6JXJkJaYqdmaPXpza/9oMoYGLwjoC4sRs6gRA1ZkMpzl9mz7SbwuaJMArHmfFKjEW0pmbU5e4irB+SsLYbGWk33SSWj2ay10tEVtGrWcLCU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDUzZWxVc2U4WGRyZ1VDMmZvTDMxeEJFbENadU10THRrVUxWNkF1NjZHUXc3?=
 =?utf-8?B?TS80RTRsR1orV25CSkhVNkVibFQvV05qWkp6bEk2RWVldGR1VUNaanVwNkFm?=
 =?utf-8?B?dlMyRVpXZXVXSExONU4vWVJzYTh3bUd1Mm1nR0tlLzJyZEVtL2xSVkdrNnlo?=
 =?utf-8?B?NTRnVVNFZmh3SytMaVJoekROYXlmMC8zL3hFcFY0K2k3bnVJVG5SL3NtWGw4?=
 =?utf-8?B?citRQm5Xc056czFCWnYrZU5JTm84TUl0dW5TMFBXRjB5a2FFVTlvTFc2Ynd1?=
 =?utf-8?B?RDF4WEhEU1MrOWRvY2FjL0VPZG1sZmZRS01BRkNBSkhvRGRmQ2E1blkrRVZG?=
 =?utf-8?B?bkh4R2QvYkt0alVwRFA2UnBHZzZPdUVJSmFsNHk3R0l0UVhzNTdxWDN6MjUv?=
 =?utf-8?B?TXNUOUdEUTJEYkZzaXNmL1BSNThRNFNQbmU5Mzk4WHhpKzJFcWZrOVV2ZnN6?=
 =?utf-8?B?bHBTRFdoVmpuMURpWWtyUDBwc3hlOEVQQlU2c0lLNGRXOVhhNm0xRFpLM2hN?=
 =?utf-8?B?SnhYekxlTmFHNlgyRFVnV1RFTmRPdWZDNEFmczMrdXZJQ1RMVC9qVXpjbUY5?=
 =?utf-8?B?T0FiekZobitsRGFJU0JUUmVvbEFpTUd2YXhrNnN0eENOcGRxNjlWWjVSVXB6?=
 =?utf-8?B?TWNXTEdaTUM5UGV3Q2VnWWpGOTM5Z3hiekkxMG4vRHVvSXd0S242NUpkWEhI?=
 =?utf-8?B?UGVOR1Q2UUlyNDFXSGt3WVAyS01CekFzckhHTVZoclA5SUdwUC9sWWs2KzBL?=
 =?utf-8?B?Nk5vRmtrUUZYb2ZkYWFuU0pScGhPNVVFV2JDcHdmSmdFR0JVVlNRQVVCYzV0?=
 =?utf-8?B?aGRQOXF3RkpFbHRhUERnZE5taVh1S2QwdkZhOXhsV1h5TUFRSjRXRTQ2Z1M0?=
 =?utf-8?B?bU1KekNSbnYxTUFITnFvaXo0dTFIcnpzSG02TWMxbHBxc2hqZ2hXcTFSMStm?=
 =?utf-8?B?eXpJV3pRQ0hockdGUEo1T3V1NG0wc1pXNTRIWmhqY0tlSml5Sm9qYkdxTGtu?=
 =?utf-8?B?bEprMFlsNE5qU0E5OERzc3VYblZ6UExvWXhqVVpKNTRyM1JRZytnRWZrdDdy?=
 =?utf-8?B?eTBzYUk1Y1E0ODRlQ080dUtmOStUSzh4K25iWUxEUjBYTEg4dy9JOGlxUUVo?=
 =?utf-8?B?M0lsd0Yxd1IrY2NXb1dUVkdMTXhldlI5dUUrNDZ4QUI2WW9STnJLMXdlSzho?=
 =?utf-8?B?YkVOdXJxYkh2dWlmTDh6OTUvWFl4SGpjTXBINmZiVW1UZHYwZmJPQXF1ZzN2?=
 =?utf-8?B?bjVPaG5yd2tiWDkvazVITjFKNStjb2Z0Sm9pVldlbE5nUVlZZWlOamhtNjEy?=
 =?utf-8?B?Z3kxYW02RWVTRlRRUHNldDAzeWV2bjAyVGpqZjd5WTVMT3cwczNXbkp2ME1T?=
 =?utf-8?B?cHFrdkV3TjBtbk1nVXVkYWRvUmJleFh2UzNSRnp3YXVWRmRwZW1sb3FIQmsw?=
 =?utf-8?B?ejZSLy9TbEF4bjJ0UkNWZllJWVh4djNBN2NXWUVrcVo5SS9LN2RSV0Z0aWJ1?=
 =?utf-8?B?UUovVDNKYzZoSnV2S1RySUY3OE1zMm1aWGI4Z1JSSWVweE01czdBZ2pzbkla?=
 =?utf-8?B?RHE5amhQM3ArcjhPUWo1ekxZNmQzdWhJcWE3WnVLSFNPY21GY01FVVpQZG1j?=
 =?utf-8?B?MExxTW8xblRoMjVOTit0ekM2SXNkLzBWVU44UHcrWUVQcllpYzJFeFM4Tjll?=
 =?utf-8?B?K2w2QkQwZVFiSUdacFR1NHVwQSsvZ0dxd0VaUTM3VEF5TFBiMDNreGhrQ1po?=
 =?utf-8?B?TWptMEUxZVJ0N3V4SkNMNjZzN0JmV2prUjNOQ0xzSUREV29hcXVUY1NXUDdw?=
 =?utf-8?B?NXZHbkZQaFFlaW9RUTc4UjB6cy9Sa3dNTThwQ3NwWkw1T0dmV2tESU1saTNv?=
 =?utf-8?B?YmFPTFd3bUpUYXM1WGxmVUxGeTFkWGJ2MFhzS2hOYkNpSE1zY29FUEJya0o1?=
 =?utf-8?B?UU55SFdCZ1VKZ3M1eFF1MFpldEIxdkJDV3d5NWxpSWQ0SnZPSHk0T25nSVJo?=
 =?utf-8?B?S05rOHlHVnExREZnNDVwMk5rc1ZiWEtORk1QYWNOdi82WEtGRDQ5bjU4QWpL?=
 =?utf-8?B?cHJVSUhJN0VvWEhHblRIOHkxUDNoTjBpR2FzdWpzeWo5WWpNZ3E2STlqYmNk?=
 =?utf-8?B?ZGpZOWFneUlnQXhuMGlvbmo1TlkyVldhWkg5Q1JDTUxKak8yb01LajJOQXZC?=
 =?utf-8?B?S3FocHViZlJRVDlYeUJ4ckkzdThIdzd5eEZIa05vMnBRRUk0T0Q4RnZieVll?=
 =?utf-8?B?Z2lrYUhEOFNLWWY5SGNjUHpFRUZja0ZuR1U1S2txalFSdTM1ekFySGpQODZD?=
 =?utf-8?B?RzdXSXYzQTRsd2dZTmxqSU5rdEpzMjNQZklFWThjZTR5UWFwWkpUUT09?=
X-Exchange-RoutingPolicyChecked: vr0uGSYF0KSjiqAaKPE+C8JF7ozGduWy2VGX9uKABDV6MJyvDb42J14tXDLFIeY5bL6hEjZ/p1Dn06OKdgWhx+soe7RDiYEJCk37f/1uGW81wX0mm0MErSUlxiSWgTqmTuiDp6BIOP5G2LR4GKhhCaD8aSCHYju/9eq6YFk8HUjlsGk4PUwz+AAdB8pSH0kHrnZTmmcsrDw7nFxT+sCrg61cQq9HcS8iM+HR7O/MsXhpKD5TOQmg5owbDkNbhLRaMPbyWXE9oiQbPpWHKwESZkcNG4WXHL6EamEQAuQLQMGrJ5MSwNq9m7Sbfd2hD/QwLGSrY2AgdtgakB2V3k7Vew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d78cf9-a75e-4052-bbaa-08df0d6fb748
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 06:09:18.0395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soWc62+0K7ohlLuNrTLLL7VvgfI+6MvgJP/fIeP/kfuOk+cFlJ20atQEdcOBLU5EpjP4NFL5JbXIpnqMB+f/dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9500
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

W dniu 4.09.2026 o 10:56, Sujaritha Sundaresan pisze:
> Not every platform has a write-through entry in its PAT table. Where
> there is none the KMD reports the UC index for XE_CACHE_WT, so a test
> which asks for write-through quietly gets uncached instead. Spotting
> that currently means enumerating IP versions in the test, which needs
> touching again for every platform added.
> 
> Add intel_pat_has_wt(), which answers the same question from the PAT
> config itself: a WT index which aliases UC means there is no distinct
> write-through entry to test. No functional change; the first user is
> the next patch.
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   lib/intel_pat.c | 22 ++++++++++++++++++++++
>   lib/intel_pat.h |  2 ++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 2f35bb772..782201029 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -284,6 +284,28 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
>   	return pat.uc_comp;
>   }
>   
> +/**
> + * intel_pat_has_wt - Check whether the platform has a write-through PAT index
> + *
> + * @fd: DRM device fd
> + *
> + * Platforms with no write-through entry in their PAT table report the UC
> + * index for XE_CACHE_WT, so a WT index which aliases UC means there is no
> + * write-through mode to exercise. Deriving this from the PAT config rather
> + * than from a list of IP versions keeps it working for platforms added
> + * later.
> + *
> + * Returns: true if the platform has a distinct write-through pat_index
> + */
> +bool intel_pat_has_wt(int fd)

For getters convention is intel_get_pat_idx_*
So maybe intel_has_pat_wt ?
Up to you.


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> +{
> +	struct intel_pat_cache pat = {};
> +
> +	intel_get_pat_idx(fd, &pat);
> +
> +	return pat.wt != pat.uc;
> +}
> +
>   uint8_t intel_get_pat_idx_wt(int fd)
>   {
>   	struct intel_pat_cache pat = {};
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> index a31b60e86..824f8931e 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -37,6 +37,8 @@ uint8_t intel_get_pat_idx_wb(int fd);
>   
>   uint8_t intel_get_pat_idx_uc_comp(int fd);
>   
> +bool intel_pat_has_wt(int fd);
> +
>   int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
>   int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
>   

