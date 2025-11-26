Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8F0D10399
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 09:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7876710E57F;
	Wed, 26 Nov 2025 09:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOZ3KYHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B5A10E57E;
 Wed, 26 Nov 2025 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764148570; x=1795684570;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=i7n3KlH0D9SHqMxl55xT5dEKrMY3//U0OZ0jh4wMgmU=;
 b=WOZ3KYHlOeeEPdelXg8eRVeB7A9O8GvqDXT4lINoYWEv+YRtGqd1B/kz
 Si2CBO+F44tqtwW8pU/lkmeqPTQl+iJbzJy3xsFmQdB6Fz1uj5vFtYHZ1
 deNP0IjOr/qOpB9YGQ1SfgPFogBNntVAgiwcCvw3KDs2YXdCz0LzmGsxf
 l4Ij81hbtCOvO6yM4ic6VteY1l0WFTWsDDGCYtJogLXFecP74uTtRUKtN
 xoRml29OQCsFG5aPpFuFo42A7kddvoNSWb66znA3qdKwf+C/+y2G5nU8F
 vhSccKzjf5+iOvhfAA2nJgAhTXWQjmiP/qK3qKWFzM17iLPu7PqstA/5j w==;
X-CSE-ConnectionGUID: dJj5Hhy3S0uxky8LMYIwOw==
X-CSE-MsgGUID: j0HNYZvVQrOandItQ7GlUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66137665"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66137665"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:16:09 -0800
X-CSE-ConnectionGUID: uON7FW42Q6aFG+C/MQqg6w==
X-CSE-MsgGUID: +309eWUxQvi5Os1XZSnY3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="223605430"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:16:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 01:16:06 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 01:16:06 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 01:16:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yE4mQORBDrIDJscZ4+27MihxCEFkB2D9IqQrZx/RgfQBUzLbXk43YLiY5yExzFg9rn0fKp2nYsx+m+uwf8HcB3bmOesqnJw0zMOCI874YAdI5k5rcVsV7CMp1J5HB9E3A0VXDgxQ1mWtE/Z8ZunDssi4teUc2gpW9eSLE0NUvObnqUKAuksVGkGYZwbTWS64oj3HNezPZCMeNiMKrYOffu5UUG7l4heqDdfuCEu4wPHwkhlyhdERKMXIWEvlnWjRuIhO4wbKkaInniD6hmeJzzPuSzMYFEWgNseSnLwXz8rl2U+QOA/mbPI5+tTke+iAaabDvc3r+0T4dBHkVJqEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JCj0edP2OnV+rew0e484CYvIWzs6vZD3mUHJ9QO/EQ=;
 b=Oqx6asG1IrnhskMWgPo3GFtpYQCHaWr3IsgFvoLNVRHky5FKwOT1SUsrzYwl37Yl+R7I3v11yO4Ue9KXjge5QLjPjCd2foRa+fxxIyHl2D5qlHqF1luQGcaeRZ4ORGVtFH5sWFQ182P3Y0O2whWPCrVThsntViuxYvxIb14CX9nB8Oy9AWUN//j+vCRgVex/hWpOAltyepM2QzVfkjICGT89xlCes2w+PRrUtx+ExsDSIETx+aS6tsMm9ffD4h9ugomFJpO8kwp27S3I+W7ByqXM8Og8R9MAKvwuWxmSMQ0frsgJe+xfvrSoP773SZ3npYr1ft0mjesUD9V4JNYGHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by DS4PPF3FCD980E2.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 09:15:58 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6%3]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 09:15:58 +0000
Message-ID: <e13d5649-715f-4c3a-824b-ea5f110080fd@intel.com>
Date: Wed, 26 Nov 2025 10:15:53 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=C3=A2_Xe=2ECI=2EFull=3A_failure_for_lib/xe/xe=5Fqu?=
 =?UTF-8?Q?ery=3A_implement_few_query_helpers_=28rev6=29?=
To: <igt-dev@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20251125-xe_query_helpers-v6-0-97686fac1b77@intel.com>
 <176409504004.26717.13174808773106383531@a3b018990fe9>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176409504004.26717.13174808773106383531@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0007.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::17) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|DS4PPF3FCD980E2:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d102393-1441-4285-7a01-08de2ccc68d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXZ5UzhZZFVnRE92SStBalMyL1JQQkRTQ05jLytWZytVdWNYazBZbmZtZUt5?=
 =?utf-8?B?bTZ4WDRuSWhuY1hOUVNiSjhGMzN6YWVMRDE3T3ZJVGtRRTBhcDc3bmFzWlVr?=
 =?utf-8?B?bE4vd1VnVk9GUFJNMWFPMldRcGlWcmNGaUEzQ3FORmdITldGV24xazdRUVdK?=
 =?utf-8?B?dGJNRGNHQzRlUkE5TnRzM0xkYm5KS2ZTK0Z0a1VFT01ZeDhJUnZQYURKWkpH?=
 =?utf-8?B?UHVjREI2NTVia05LT3Z1WlZDV3lWMHBwcTIvaEV4ekFlYVJ0ZEtQVUVweUYv?=
 =?utf-8?B?WnI0YXpRS1hjaDdzU0lacEJVSlE2aXZ1SGFsZlI1VEVmUWpYYmpWdlNKcU4z?=
 =?utf-8?B?cDdsbWVZMXBsaXdJdXVHNFQ5WDhBNE9qQW9ZWi9RYmlSa2h4M0lSM0V6MDVN?=
 =?utf-8?B?SXRGRm9vcTlucXJKeEhSWkhGK0VRcmJEazlDc3dOYUE5UCsrZ1JtK0tseEty?=
 =?utf-8?B?V2J6dXJOeU1WbUt4Z2owZ1hlLzJ6am0yK1A3QXFuYjIwNW5QdDZmaUw2TkpR?=
 =?utf-8?B?OGU3N2JTRXFmZFVIOXFmUDBmVkFaZjU3TXUvREc3bkF3RFRraHQ0WWRyV3Bw?=
 =?utf-8?B?QzE3MC9tY0tRUW9TQnFOa0psdE1TT245V242MGJoYmRMUmN5TE9PSXRiU2s5?=
 =?utf-8?B?ZE9pOXl6ZitTKzJXK0NLN0RvTkE5bUxnS2JWenVNYWFkR1NPMk5UbDFwL25q?=
 =?utf-8?B?dm94VUgraEdEK0xzSGhDLzlnaHArZTRLSWlORFlJQmlKUU5ObWJzNWRtRHc5?=
 =?utf-8?B?OWYzM1JFbnhHRlFLOUtCR25iWVFVV2poNHVVajl5Yzh5ckVBekc5MTRyQ2lF?=
 =?utf-8?B?OHVmWVZobiswQ1A4UmY3dUpISUNkYmZ0MkpZSVpLbGRSRHZNSnNNQ3NHTEEv?=
 =?utf-8?B?cEhJRHBWRnBHYmRXSmxhdjAvdmFiNWFHaHAwTm9sbkUrb3lxRVhybFF1OE9W?=
 =?utf-8?B?ZWJIa3JON3crUFowcFphaExDdjNKU0JNbk9uWUxhSFJwQ2x0ZHRWOUxjZE1J?=
 =?utf-8?B?ZnJvRjBPemJaaEVCQU9SS2QrTXVYWEJDVDYzZjBXa3dPNDBSV2NVZlp1ektr?=
 =?utf-8?B?OWJlOTc5WU5tRTJGZXF4aUxCOGx5M3FGMi8zYVorUHlwdzU1Sk8zK1RLekQ3?=
 =?utf-8?B?eDlLSWFYS3lqakYza3M1SjNlVkEwejBpczhpVkhIckRWcjkweU14cnZDSGVY?=
 =?utf-8?B?RVZHUFc0N21BOEdjYjFjSlZGZTd2NklmYzUyUW1mc0ZWVkE2Rmo3WFVWbzhQ?=
 =?utf-8?B?aUJ3NzFDYTdrOGYzMlh2d2VFeE9VdC9SL3NSVWJyREIvWjVWNjFuM1h6S1Jo?=
 =?utf-8?B?bzFpeUZUY0VLN2FhM29zYTFNZit3T0NDdGQxQTZuK3MzcW5JSStzYk5EZFEv?=
 =?utf-8?B?eUNnbkp0LzVKWEgzd0JoSTViS1NlMzNnYWJwdE1JbDZTV1NvTmhlY3pLRWpT?=
 =?utf-8?B?QStHYVgwdmNmQkNBbkEvT25XTXk4WFVlbldsSGFMdG1ncFp2cGhRMkhKV1k2?=
 =?utf-8?B?UmRGZi8yTXduUWRTUE1tVlkzb3Zpc0xRQ0NmQWVIVGMvUjRyemE1eUdRSkZW?=
 =?utf-8?B?cHVDb05HdUVhNkdtaTdPWEhPeWZURUt0V2FJUm5qUStyLzFkWlJlMUhBY1FX?=
 =?utf-8?B?WXpOallsT3lRMkFMRjR5SzZtVHpjZW45L1VscE43TTB5L3o0VGpSUUtIYUth?=
 =?utf-8?B?S0U2Qk15ZHNlcnBtWW9iMHFsRUdEdGxuSm8xSzNDeWo1MWNXb3N0K0ZJMkRE?=
 =?utf-8?B?VWs5WkdoZ0VYT00zWUwxTmVaL1pSQ1R3ZGJlKzQvTmxOVHRsQnhWWmFjRXRI?=
 =?utf-8?B?MTgzMEZtVGt4dUxqLzZTS1hDeEdlZy9CaDZ1UUhna1V5VTlSb1YrUU1VOUo3?=
 =?utf-8?B?SWU3TnVoZXNmOVE5eDVMZnJWWU9GME9ZRHFDekVFY29PWnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0M3R0ZQUUtBSzZtZFVLZGtDbkR5UE55U0ltd1RBOG1hbVltcldSVExUQnF0?=
 =?utf-8?B?TzNSTWtLamVqbXZJMXN0aVJVZmFuNWRDN3pwbWM3QkFLSGtOYklCbkFnZCs0?=
 =?utf-8?B?SmlyVUhKWllabVJMNFpITlZ5Y1lORWdETElld1gzUnRNOGtPYjVaWVVDaHpp?=
 =?utf-8?B?dmc1b3k4SkJmVFNUWVl5VmhuSjkvRW5ybTBOSHBIV2J1QUxtQlh5NWNlSTVR?=
 =?utf-8?B?b21wTUtoS3hhdnV2bUE1UldCVE42elJHaW5IL1hmcFppY2dxZWxHZWpEK09s?=
 =?utf-8?B?UnhPUlF3bG5lMUgrZzNwdG9MMmt2U0JVZEhYUDRxWGdTWDFjdUMrK09EVng0?=
 =?utf-8?B?NTUrQVFGVHJWTE4vQzYrcy9uRWt2bGJ0STVqYVEydFFEcUhwc3hiUkM4TmlG?=
 =?utf-8?B?L0NMditxR2VWYzlmWUpnUFpFbGNuYklvNTFnaTFuNFNZSVVBUXVYaTFWbzBa?=
 =?utf-8?B?Ti95dzF1Y1lhajhIVzVXNGVqRm9jTS9sT1ExbThJRUVIeTR6aTV1TXY2KzFP?=
 =?utf-8?B?ODFDVjRHcHpaNDBSMm4wNmNIS1R3bkY1a09qVjFZSlNDN2hwWWxVZEppREJ3?=
 =?utf-8?B?V2txMzQ3a055cXRZUWpUUTJpWEdKQWQzVVJya2p4RUdMT3JpTG5qb0tud0xl?=
 =?utf-8?B?NldXOWxLY0ZsUlo4VVJFVmNoSEZTUEgvK0p3eXkzWTdBd216T3ZxTlI5NmZh?=
 =?utf-8?B?TGF6enVPWm5LQ1E0MlhiZzJ5RGloVFVyNjVjS1FzN0tzT040Mm1oSU90Z3dt?=
 =?utf-8?B?VGxmUjgyZnlNd0xMT1RtNTVCK0hDd0R4QkVYS0tBOEhxVHRpMXV0NGpMdE41?=
 =?utf-8?B?cmZoM2I0amVOODVpUkZ2cnhrYjZHOUFZTEk2UVdNTXNDajd4Wkc2ZGdDalFk?=
 =?utf-8?B?b1BpdzZMbjV5djd6WDh2S0FZQURERTExYmxham5qbjlyWFV4b2tsanJzM2la?=
 =?utf-8?B?QzVRakdBTVRnQWpSRGdhQ0F2VjYrOE8rODVqSHNDRUZ2SWJ6cm5YV0ZpOHRw?=
 =?utf-8?B?ZmIvZ2lPVzJaTTJhd2hUOWwzWUMyZmMwRE1RSTRPdnRsTzBDMTcvSDRKcUlN?=
 =?utf-8?B?S3A2dzdPRk1iMEFKY2dRWWk0TUczMGlMbHh5KzRhcTdZb2ZUeG5Ydy9Bdy9o?=
 =?utf-8?B?cTBvd0NSRVN0SGJDMys1Y0lFY3d1N1BJQThMOGoxd1pGUEpmTHhwTHgrTnJI?=
 =?utf-8?B?WTJKZ1M3LzhZVDBPcmh4b2lic2hHVEc2bEk0VE8zcUV5Ukc2dzVUTnhnZWZu?=
 =?utf-8?B?TzIyWDZkdlRtVmRwK1p6VDNhMzdYZmFMUnRRSUxHZjF0MTM4SnRRNEh1cTlG?=
 =?utf-8?B?Z2tEQnFQeHRHYytKamFOOGdIeXpnQ2lOVHhHNjhXdmc2Qm9uWnMrcmhGWFVB?=
 =?utf-8?B?Q0pTeFc5cm1USlFqS05PbllyMjhuajRuL2VJOXR4Q0NYaVJTcVpqeWE1YkJo?=
 =?utf-8?B?MWZLdldFaGRjdk5EMVFJN0c2RkNPUTRnTnJIY3IvU0Q2RXhVUXA3ZjBmdkN3?=
 =?utf-8?B?QXB2L0hYS0UrK3p0NGRWVFR0K3pEU3hMTU40MU90cnFEbHpjcHUvOXFzSFF0?=
 =?utf-8?B?ZWFrR0l0YmlWN3BVTEJ5VUxGT1NFcFQ4UWwxOEdUVEFhNjAwYy8zL3JYc2xY?=
 =?utf-8?B?RWdiQ09YT2lHUmsxays1Skg4MGxVNWFXTm5lNkYrR0dEQUZlSFE5SThQaWJD?=
 =?utf-8?B?V04yM2NHbkpHcGx0TEFRV2Y3bUpIbWZ5cWhuR0dTY0JIQXIrZW8zYWVZWUtx?=
 =?utf-8?B?SDdxbFBlZzBHRlFtdGZwb2JONnh2Y2NtVzVJQjAvZG56TEJEc2JaNy8rekdu?=
 =?utf-8?B?ZzV0N29LbllDQnZydllIVXh5REZKWDk2MXBjclM2S3Jpdmljb0JYbGw2SjZT?=
 =?utf-8?B?aDhYRkJTZFpMNnNvaTA3bHZvQklFMTB0MFFZVkRXeEZxSkt3eHhRU3drV3di?=
 =?utf-8?B?THA0OSs0V0pTTmJtM1U4eTdKZ0tsUHpqU2pSMHEzWWt5UUlNT2dYY3pGdUFY?=
 =?utf-8?B?K1JPd3RWTUN0TTk5NU85Q0NWdmVNYmFrMlFzSXc4ZEsyOVV3WkhLdVA4aDdF?=
 =?utf-8?B?dW5QQWM3TmRFWGQyenlWa0g3dGlkKy9RcU9JMFlSYW1OM1UxWElhS3ZabWc3?=
 =?utf-8?Q?rsusoJ7rtSvabag2ephS3kds0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d102393-1441-4285-7a01-08de2ccc68d6
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:15:58.1758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuGX/qx7jqnwuyag9fiN2Pm3NfyocjV9AHdGv2NZsSmWDl39I6qEAkJ8cpBDP2BUUEXfYYQQxUxrDDg07XJWTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF3FCD980E2
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

W dniu 25.11.2025 o 19:24, Patchwork pisze:
> *Patch Details*
> *Series:*	lib/xe/xe_query: implement few query helpers (rev6)
> *URL:*	https://patchwork.freedesktop.org/series/157140/ <https:// 
> patchwork.freedesktop.org/series/157140/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14110/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14110/ 
> index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_8637_FULL -> XEIGTPW_14110_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_14110_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14110_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 3)
> 
> Missing (1): shard-adlp
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14110_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-
>     edp-1:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-3/igt@kms_async_flips@async-flip-
>         with-page-flip-events-linear@pipe-b-edp-1.html> +1 other test fail
>   *
> 
>     igt@kms_content_protection@dp-mst-suspend-resume:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/igt@kms_content_protection@dp-
>         mst-suspend-resume.html>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-464/
>         igt@kms_content_protection@dp-mst-suspend-resume.html>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-3/igt@kms_content_protection@dp-
>         mst-suspend-resume.html>
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-lnl-3/igt@xe_fault_injection@inject-fault-probe-
>         function-xe_device_create.html> -> DMESG-WARN <https://intel-
>         gfx-ci.01.org/tree/intel-xe/IGTPW_14110/shard-lnl-4/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_device_create.html>
>       o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-6/igt@xe_fault_injection@inject-
>         fault-probe-function-xe_device_create.html>

Nothing related.

Regards
Andrzej

> 
> 
>     New tests
> 
> New tests have been introduced between XEIGT_8637_FULL and 
> XEIGTPW_14110_FULL:
> 
> 
>       New IGT tests (1)
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>       o Statuses : 1 fail(s)
>       o Exec time: [111.74] s
> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_14110_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-1/igt@kms_async_flips@async-flip-
>         with-page-flip-events-linear-atomic.html> (Intel XE#6054
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054> /
>         Intel XE#6676 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6676>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-
>     atomic@pipe-c-edp-1:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-1/igt@kms_async_flips@async-flip-
>         with-page-flip-events-linear-atomic@pipe-c-edp-1.html> (Intel
>         XE#6054 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-
>     edp-1:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-3/igt@kms_async_flips@async-flip-
>         with-page-flip-events-linear@pipe-c-edp-1.html> (Intel XE#5993
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993>) +1
>         other test fail
>   *
> 
>     igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-
>     edp-1-linear-rgb565:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-2/igt@kms_async_flips@basic-
>         modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-
>         rgb565.html> (Intel XE#6676 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/6676>) +38 other tests fail
>   *
> 
>     igt@kms_async_flips@test-cursor:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@kms_async_flips@test-
>         cursor.html> (Intel XE#664 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/664>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-1/
>         igt@kms_atomic_transition@plane-all-modeset-transition.html>
>         (Intel XE#3279 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3279>)
>   *
> 
>     igt@kms_big_fb@4-tiled-16bpp-rotate-270:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-4/igt@kms_big_fb@4-tiled-16bpp-
>         rotate-270.html> (Intel XE#1407 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1407>) +5 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-433/igt@kms_big_fb@4-
>         tiled-32bpp-rotate-270.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-
>         stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#3658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658>)
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-5/igt@kms_big_fb@linear-8bpp-
>         rotate-90.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2327>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-32bpp-rotate-180:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-
>         rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) +9 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-432/igt@kms_big_fb@y-tiled-
>         max-hw-stride-32bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +10 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-4/igt@kms_big_fb@yf-tiled-
>         addfb.html> (Intel XE#2328 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2328>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-
>         size-overflow.html> (Intel XE#610 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-464/igt@kms_big_fb@yf-tiled-
>         addfb-size-overflow.html> (Intel XE#610 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-
>         stride-64bpp-rotate-0-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +12 other
>         tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-5/igt@kms_bw@connected-linear-
>         tiling-2-displays-2160x1440p.html> (Intel XE#2191 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +2 other
>         tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/igt@kms_bw@connected-linear-
>         tiling-2-displays-2560x1440p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2894>) +1 other test skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@kms_bw@connected-linear-
>         tiling-4-displays-2160x1440p.html> (Intel XE#1512 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-2160x1440p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-3/igt@kms_bw@linear-tiling-1-
>         displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2 other tests
>         skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-7/igt@kms_bw@linear-tiling-3-
>         displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2 other tests
>         skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-436/igt@kms_bw@linear-
>         tiling-3-displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2 other tests
>         skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-
>         tiled-dg2-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +17 other
>         tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-463/igt@kms_ccs@bad-
>         rotation-90-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-5/igt@kms_ccs@crc-primary-
>         basic-4-tiled-bmg-ccs@pipe-c-edp-1.html> (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +11
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-2/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-mtl-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +12 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-4/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-dg2-mc-ccs.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +8 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-464/igt@kms_ccs@crc-sprite-
>         planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +27 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-464/igt@kms_ccs@crc-sprite-
>         planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-6.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +97
>         other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-25:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-4/
>         igt@kms_chamelium_color@ctm-0-25.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) +1 other test
>         skip
>   *
> 
>     igt@kms_chamelium_color@ctm-limited-range:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-436/
>         igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2
>         other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-negative:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-4/igt@kms_chamelium_color@ctm-
>         negative.html> (Intel XE#306 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/306>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-
>         change-during-hibernate.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +13 other
>         tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-432/
>         igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html>
>         (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) +10 other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-
>         change-during-hibernate.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_sharpness_filter@filter-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-3/
>         igt@kms_chamelium_sharpness_filter@filter-basic.html> (Intel
>         XE#6507 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-7/
>         igt@kms_chamelium_sharpness_filter@filter-basic.html> (Intel
>         XE#6507 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-435/
>         igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@kms_content_protection@dp-
>         mst-lic-type-0.html> (Intel XE#307 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +2 other tests
>         skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-0:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-4/igt@kms_content_protection@dp-
>         mst-type-0.html> (Intel XE#2390 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2390>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@kms_content_protection@lic-
>         type-0.html> (Intel XE#3278 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3278>) +2 other tests skip
>   *
> 
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-8/igt@kms_content_protection@lic-
>         type-0@pipe-a-dp-2.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +3 other
>         tests fail
>   *
> 
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-434/
>         igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html> (Intel
>         XE#3304 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304>)
>   *
> 
>     igt@kms_content_protection@mei-interface:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-2/igt@kms_content_protection@mei-
>         interface.html> (Intel XE#1468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1468>)
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-6/
>         igt@kms_content_protection@srm.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_content_protection@srm@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-433/
>         igt@kms_content_protection@srm@pipe-a-dp-4.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +4
>         other tests fail
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-7/igt@kms_cursor_crc@cursor-
>         onscreen-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-3/igt@kms_cursor_crc@cursor-
>         onscreen-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-32x32:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/igt@kms_cursor_crc@cursor-
>         random-32x32.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +8 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-4/igt@kms_cursor_crc@cursor-
>         sliding-max-size.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +5 other
>         tests skip
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-
>         vs-cursor-legacy.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +2 other
>         tests skip
>   *
> 
>     igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@kms_cursor_legacy@2x-
>         nonblocking-modeset-vs-cursor-atomic.html> (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +3
>         other tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-
>         atomic-transitions-varying-size.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-6/
>         igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-7/igt@kms_cursor_legacy@short-
>         busy-flip-before-cursor-atomic-transitions.html> (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>     transitions-varying-size:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-463/
>         igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>         transitions-varying-size.html> (Intel XE#323 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-3/igt@kms_cursor_legacy@short-
>         busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#2286 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2286>) +1 other test skip
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-
>         panel-6bpc.html> (Intel XE#1340 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1340>) +1 other test skip
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-436/igt@kms_dither@fb-8bpc-
>         vs-panel-6bpc@pipe-a-hdmi-a-6.html> (Intel XE#4494 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4494> / i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>   *
> 
>     igt@kms_dp_link_training@non-uhbr-sst:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-4/igt@kms_dp_link_training@non-
>         uhbr-sst.html> (Intel XE#4354 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4354>)
>   *
> 
>     igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/
>         igt@kms_dp_linktrain_fallback@dp-fallback.html> (Intel XE#4294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-3/
>         igt@kms_dp_linktrain_fallback@dp-fallback.html> (Intel XE#4294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294>)
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-
>         with-bpc.html> (Intel XE#2244 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2244>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-466/igt@kms_dsc@dsc-with-
>         bpc-formats.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) +20 other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-
>         formats.html> (Intel XE#2244 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2244>) +2 other tests skip
>   *
> 
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@kms_fbc_dirty_rect@fbc-
>         dirty-rectangle-different-formats.html> (Intel XE#4422 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>   *
> 
>     igt@kms_fbcon_fbt@fbc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html>
>         (Intel XE#4156 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4156>)
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/igt@kms_fbcon_fbt@psr-
>         suspend.html> (Intel XE#776 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/776>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-434/igt@kms_fbcon_fbt@psr-
>         suspend.html> (Intel XE#776 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/776>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-8/
>         igt@kms_feature_discovery@psr2.html> (Intel XE#2374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2374>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-432/
>         igt@kms_feature_discovery@psr2.html> (Intel XE#1135 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-
>         on-nop-interruptible.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +6 other
>         tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-4/igt@kms_flip@2x-flip-vs-
>         expired-vblank.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +9 other
>         tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-
>         interruptible.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-
>         check-interruptible.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-4/
>         igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-
>         downscaling.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1745>) +3 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +3 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-3/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-
>         downscaling.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293> / Intel
>         XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2380>) +8 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-2/
>         igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-
>         downscaling.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1745>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/
>         igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-
>         upscaling.html> (Intel XE#4683 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4683>) +1 other test fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +8
>         other tests skip
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-7/
>         igt@kms_force_connector_basic@prune-stale-modes.html> (Intel
>         XE#352 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-7/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-
>         render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +15 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html>
>         (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2311>) +42 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4141>) +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +49 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-linear:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@fbc-tiling-linear.html> (Intel
>         XE#3970 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-
>         draw-render.html> (Intel XE#6312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +1 other test
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +40 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +37
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-
>         render.html> (Intel XE#6312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/6312>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +36 other tests skip
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-432/igt@kms_hdr@bpc-switch-
>         suspend.html> (Intel XE#6675 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6675>) +12 other tests abort
>   *
> 
>     igt@kms_joiner@basic-ultra-joiner:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@kms_joiner@basic-ultra-
>         joiner.html> (Intel XE#2925 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2925> / Intel XE#2927 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/igt@kms_joiner@invalid-modeset-
>         force-big-joiner.html> (Intel XE#3012 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3012>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-6/igt@kms_joiner@invalid-modeset-
>         force-ultra-joiner.html> (Intel XE#2934 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-436/igt@kms_joiner@invalid-
>         modeset-force-ultra-joiner.html> (Intel XE#2925 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-4/igt@kms_joiner@invalid-modeset-
>         force-ultra-joiner.html> (Intel XE#2925 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/
>         igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel
>         XE#2501 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-434/
>         igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel
>         XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>   *
> 
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/igt@kms_pipe_stress@stress-
>         xrgb8888-yftiled.html> (Intel XE#5624 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5624>)
>   *
> 
>     igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-3/igt@kms_pipe_stress@stress-
>         xrgb8888-ytiled.html> (Intel XE#4329 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4329>)
>   *
> 
>     igt@kms_plane_lowres@tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/igt@kms_plane_lowres@tiling-
>         y.html> (Intel XE#2393 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2393>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-none:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-4/igt@kms_plane_multiple@2x-
>         tiling-none.html> (Intel XE#4596 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4596>) +3 other
>         tests skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-6/igt@kms_plane_multiple@2x-
>         tiling-none.html> (Intel XE#4596 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>   *
> 
>     igt@kms_plane_multiple@tiling-yf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/igt@kms_plane_multiple@tiling-
>         yf.html> (Intel XE#5020 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5020>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-2/igt@kms_plane_scaling@intel-
>         max-src-size.html> (Intel XE#3307 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3307>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-5/igt@kms_plane_scaling@planes-
>         downscale-factor-0-5-upscale-factor-0-25.html> (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +11
>         other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-4/igt@kms_plane_scaling@planes-
>         upscale-factor-0-25-downscale-factor-0-5.html> (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +4
>         other tests skip
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/870>) +1 other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-464/
>         igt@kms_pm_backlight@fade.html> (Intel XE#870 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@dc5-retention-flops:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-464/igt@kms_pm_dc@dc5-
>         retention-flops.html> (Intel XE#3309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3309>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-5/igt@kms_pm_dc@dc5-retention-
>         flops.html> (Intel XE#3309 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3309>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-466/igt@kms_pm_dc@dc6-
>         dpms.html> (Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/908>)
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-
>         lpsp.html> (Intel XE#1439 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1439> / Intel XE#836 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-
>         stress-no-wait.html> (Intel XE#1439 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1439> / Intel
>         XE#3141 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3141> / Intel XE#836 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/836>)
>   *
> 
>     igt@kms_pm_rpm@system-suspend-idle:
> 
>       o shard-lnl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-7/igt@kms_pm_rpm@system-suspend-
>         idle.html> (Intel XE#6675 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/6675>) +8 other tests abort
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-
>         plane-move-sf-dmg-area.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +5 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-plane-
>         move-sf-dmg-area.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2893 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2893> / Intel XE#4608 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4608>) +1 other test skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-plane-
>         move-sf-dmg-area@pipe-b-edp-1.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#4608 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4608>) +3 other tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-
>         plane-move-continuous-sf.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2893 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2893>) +4 other tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-
>         plane-move-continuous-exceed-fully-sf.html> (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +8 other tests skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@kms_psr2_su@frontbuffer-
>         xrgb8888.html> (Intel XE#1128 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1128> / Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +1 other test
>         skip
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-
>         page-flip@edp-1.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#4609 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4609>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-464/igt@kms_psr@fbc-psr2-
>         sprite-plane-move.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) +16 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-onoff:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-
>         plane-onoff.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +7 other
>         tests skip
>   *
> 
>     igt@kms_psr@psr-primary-page-flip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-7/igt@kms_psr@psr-primary-page-
>         flip.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406> / Intel XE#2234 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850>) +16 other tests skip
>   *
> 
>     igt@kms_psr@psr-suspend@edp-1:
> 
>       o shard-lnl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-7/igt@kms_psr@psr-
>         suspend@edp-1.html> (Intel XE#2625 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2625> / Intel
>         XE#6675 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6675>) +1 other test abort
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-6/igt@kms_psr_stress_test@flip-
>         primary-invalidate-overlay.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414>)
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-5/igt@kms_rotation_crc@primary-
>         rotation-90.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414> / Intel
>         XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3904>) +4 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@kms_rotation_crc@primary-x-
>         tiled-reflect-x-0.html> (Intel XE#4689 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4689>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@kms_rotation_crc@primary-y-
>         tiled-reflect-x-90.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414> / Intel
>         XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3904>) +5 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-2/igt@kms_rotation_crc@primary-
>         yf-tiled-reflect-x-0.html> (Intel XE#1127 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-5/igt@kms_rotation_crc@primary-
>         yf-tiled-reflect-x-180.html> (Intel XE#2330 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2330>) +1 other test
>         skip
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-464/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1127>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-433/
>         igt@kms_rotation_crc@sprite-rotation-270.html> (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) +4
>         other tests skip
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-center:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-3/igt@kms_scaling_modes@scaling-
>         mode-center.html> (Intel XE#2413 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/igt@kms_setmode@basic-clone-
>         single-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-3/igt@kms_setmode@basic-clone-
>         single-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@kms_sharpness_filter@filter-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-5/
>         igt@kms_sharpness_filter@filter-basic.html> (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) +1
>         other test skip
>   *
> 
>     igt@kms_vrr@cmrr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-3/igt@kms_vrr@cmrr.html> (Intel
>         XE#2168 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-466/igt@kms_vrr@cmrr.html>
>         (Intel XE#2168 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2168>)
>   *
> 
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-
>         edp-1.html> (Intel XE#4459 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4459>) +1 other test fail
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-vrr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-
>         vrr.html> (Intel XE#1499 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1499>)
>   *
> 
>     igt@xe_compute@ccs-mode-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-5/igt@xe_compute@ccs-mode-
>         basic.html> (Intel XE#6599 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/6599>) +1 other test skip
>   *
> 
>     igt@xe_compute@eu-busy-10s:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-466/igt@xe_compute@eu-
>         busy-10s.html> (Intel XE#6598 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6598>)
>   *
> 
>     igt@xe_compute_preempt@compute-preempt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-436/
>         igt@xe_compute_preempt@compute-preempt.html> (Intel XE#6360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360>) +1
>         other test skip
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many-vram:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-7/igt@xe_compute_preempt@compute-
>         preempt-many-vram.html> (Intel XE#5191 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5191>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0x3fff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-466/igt@xe_copy_basic@mem-
>         copy-linear-0x3fff.html> (Intel XE#1123 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-433/igt@xe_copy_basic@mem-
>         set-linear-0xfffe.html> (Intel XE#1126 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>   *
> 
>     igt@xe_eu_stall@invalid-gt-id:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-436/igt@xe_eu_stall@invalid-
>         gt-id.html> (Intel XE#5626 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5626>) +1 other test skip
>   *
> 
>     igt@xe_eudebug@basic-close:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-464/igt@xe_eudebug@basic-
>         close.html> (Intel XE#4837 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4837>) +17 other tests skip
>   *
> 
>     igt@xe_eudebug@vm-bind-clear-faultable:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@xe_eudebug@vm-bind-clear-
>         faultable.html> (Intel XE#4837 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4837>) +17 other tests skip
>   *
> 
>     igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/igt@xe_eudebug_online@set-
>         breakpoint-sigint-debugger.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +17 other
>         tests skip
>   *
> 
>     igt@xe_eudebug_sriov@deny-sriov:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-3/igt@xe_eudebug_sriov@deny-
>         sriov.html> (Intel XE#5793 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5793>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-466/
>         igt@xe_eudebug_sriov@deny-sriov.html> (Intel XE#4518 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4518>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-1/igt@xe_eudebug_sriov@deny-
>         sriov.html> (Intel XE#4518 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4518>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-
>         small.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-4/igt@xe_evict@evict-beng-mixed-
>         many-threads-small.html> (Intel XE#6321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6321> / Intel
>         XE#6606 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6606>)
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-5/igt@xe_evict_ccs@evict-
>         overcommit-standalone-instantfree-samefd.html> (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +12
>         other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-
>     userptr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-3/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-bindexecqueue-userptr.html> (Intel
>         XE#2322 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2322>) +14 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-1/igt@xe_exec_basic@multigpu-no-
>         exec-userptr-invalidate.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +8 other
>         tests skip
>   *
> 
>     igt@xe_exec_fault_mode@once-invalid-userptr-fault:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-435/
>         igt@xe_exec_fault_mode@once-invalid-userptr-fault.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +33 other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-464/
>         igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html> (Intel
>         XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2360>) +1 other test skip
>   *
> 
>     igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-464/
>         igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-
>         threads.html> (Intel XE#6299 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6299>)
>   *
> 
>     igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/
>         igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html>
>         (Intel XE#5007 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5007>) +3 other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-3/
>         igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html>
>         (Intel XE#5007 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5007>) +2 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-436/
>         igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset.html>
>         (Intel XE#4915 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4915>) +405 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@many-large-malloc-prefetch-madvise:
> 
>       o shard-lnl: NOTRUN -> WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-3/
>         igt@xe_exec_system_allocator@many-large-malloc-prefetch-
>         madvise.html> (Intel XE#5786 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5786>) +1 other test warn
>   *
> 
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-
>         madvise-pat-idx-uc-single-vma.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-lnl-1/
>         igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-
>         single-vma.html> (Intel XE#5625 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5625>)
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-
>     new-huge:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-
>         mmap-new-huge.html> (Intel XE#4943 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +32 other
>         tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-
>     huge-nomemset:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-5/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-
>         new-huge-nomemset.html> (Intel XE#4943 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +28 other
>         tests skip
>   *
> 
>     igt@xe_gt_freq@freq_suspend:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-1/
>         igt@xe_gt_freq@freq_suspend.html> (Intel XE#584 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-5/
>         igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html> (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-4/
>         igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html> (Intel
>         XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>   *
> 
>     igt@xe_live_ktest@xe_eudebug:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-5/
>         igt@xe_live_ktest@xe_eudebug.html> (Intel XE#2833 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2833>)
>   *
> 
>     igt@xe_media_fill@media-fill:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/igt@xe_media_fill@media-
>         fill.html> (Intel XE#2459 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2459> / Intel XE#2596 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2596>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-464/igt@xe_media_fill@media-
>         fill.html> (Intel XE#560 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/560>)
>   *
> 
>     igt@xe_mmap@pci-membarrier:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@xe_mmap@pci-
>         membarrier.html> (Intel XE#5100 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5100>)
>   *
> 
>     igt@xe_mmap@small-bar:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-8/igt@xe_mmap@small-bar.html>
>         (Intel XE#586 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/586>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-432/igt@xe_mmap@small-
>         bar.html> (Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/512>)
>   *
> 
>     igt@xe_oa@closed-fd-and-unmapped-access:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-466/igt@xe_oa@closed-fd-and-
>         unmapped-access.html> (Intel XE#3573 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +13 other
>         tests skip
>   *
> 
>     igt@xe_oa@mmio-triggered-reports-read:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-434/igt@xe_oa@mmio-
>         triggered-reports-read.html> (Intel XE#6032 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6032>)
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/igt@xe_pat@pat-index-
>         xehpc.html> (Intel XE#1420 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1420>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-463/igt@xe_pat@pat-index-
>         xehpc.html> (Intel XE#2838 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2838> / Intel XE#979 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-7/igt@xe_pat@pat-index-
>         xehpc.html> (Intel XE#1420 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1420> / Intel XE#2838 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2838>)
>   *
> 
>     igt@xe_peer2peer@write:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-6/igt@xe_peer2peer@write.html>
>         (Intel XE#2427 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2427>)
>   *
> 
>     igt@xe_pm@d3cold-i2c:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-464/igt@xe_pm@d3cold-
>         i2c.html> (Intel XE#5694 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5694>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-2/igt@xe_pm@d3cold-i2c.html>
>         (Intel XE#5694 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5694>)
>   *
> 
>     igt@xe_pm@d3cold-mocs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-464/igt@xe_pm@d3cold-
>         mocs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284>)
>   *
> 
>     igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-
>         exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284>) +1 other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-463/igt@xe_pm@s2idle-d3cold-
>         basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-2/igt@xe_pm@s2idle-d3cold-basic-
>         exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1 other test skip
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-userptr:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-userptr.html> ->
>         ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14110/
>         shard-lnl-5/igt@xe_pm@s2idle-vm-bind-userptr.html> (Intel
>         XE#6675 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>)
>   *
> 
>     igt@xe_pm_residency@gt-c6-freeze@gt0:
> 
>       o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-4/igt@xe_pm_residency@gt-c6-
>         freeze@gt0.html> (Intel XE#6675 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6675>) +14 other tests abort
>   *
> 
>     igt@xe_pm_residency@idle-residency:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-466/
>         igt@xe_pm_residency@idle-residency.html> (Intel XE#6362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6362>) +1
>         other test fail
>   *
> 
>     igt@xe_pmu@fn-engine-activity-sched-if-idle:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@xe_pmu@fn-engine-activity-
>         sched-if-idle.html> (Intel XE#4650 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4650>)
>   *
> 
>     igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-bind-
>         post-rpm.html> (Intel XE#4733 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4733>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-7/igt@xe_query@multigpu-query-
>         invalid-size.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +4 other tests
>         skip
>   *
> 
>     igt@xe_query@multigpu-query-mem-usage:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-bmg-1/igt@xe_query@multigpu-query-
>         mem-usage.html> (Intel XE#944 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/944>) +4 other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-434/igt@xe_query@multigpu-
>         query-mem-usage.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_render_copy@render-stress-4-copies:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-432/
>         igt@xe_render_copy@render-stress-4-copies.html> (Intel XE#4814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814>) +1
>         other test skip
>   *
> 
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-466/
>         igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-
>         numvfs.html> (Intel XE#4130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4130>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-3/
>         igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-
>         numvfs.html> (Intel XE#4130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4130>)
>   *
> 
>     igt@xe_sriov_flr@flr-each-isolation:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-436/igt@xe_sriov_flr@flr-
>         each-isolation.html> (Intel XE#3342 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3342>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-4/igt@xe_sriov_flr@flr-each-
>         isolation.html> (Intel XE#3342 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3342>)
>   *
> 
>     igt@xe_sriov_flr@flr-twice:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-1/igt@xe_sriov_flr@flr-
>         twice.html> (Intel XE#4273 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4273>)
>   *
> 
>     igt@xe_sriov_flr@flr-vfs-parallel:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-434/igt@xe_sriov_flr@flr-
>         vfs-parallel.html> (Intel XE#4273 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4273>) +1 other test
>         skip
>   *
> 
>     igt@xe_sriov_scheduling@nonpreempt-engine-resets:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-4/
>         igt@xe_sriov_scheduling@nonpreempt-engine-resets.html> (Intel
>         XE#4351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351>)
>   *
> 
>     igt@xe_sriov_vram@vf-access-after-resize-down:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-433/igt@xe_sriov_vram@vf-
>         access-after-resize-down.html> (Intel XE#6318 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6318>)
>   *
> 
>     igt@xe_sriov_vram@vf-access-after-resize-up:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14110/shard-lnl-8/igt@xe_sriov_vram@vf-access-
>         after-resize-up.html> (Intel XE#6376 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6376>) +1 other test
>         skip
>   *
> 
>     igt@xe_survivability@runtime-survivability:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14110/shard-dg2-463/
>         igt@xe_survivability@runtime-survivability.html> (Intel XE#6529
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-bmg: (PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-bmg-8/igt@xe_module_load@load.html>, PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-7/
>         igt@xe_module_load@load.html>, SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-bmg-2/
>         igt@xe_module_load@load.html>) (Intel XE#2457 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2457>) -> (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14110/shard-
>         bmg-5/igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-bmg-5/
>         igt@xe_module_load@load.html>)
>       o shard-dg2-set2: (PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8637/shard-dg2-466/igt@xe_module_load@load.html>, SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8637/shard-
>         dg2-466/igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-466/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-466/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-463/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-463/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-463/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-434/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-434/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-432/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-432/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-432/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8637/shard-dg2-436/
>         igt@xe_module_load@load.html>) (Intel XE#378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/378>) -> (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14110/shard-
>         dg2-434/igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-434/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-463/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-463/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-463/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-463/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-466/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-466/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-466/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-466/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-432/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-432/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-432/
>         igt@xe_module_load@load.html>)
>   *
> 
>     igt@xe_pm@s3-mocs:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8637/shard-dg2-432/igt@xe_pm@s3-mocs.html> (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14110/
>         shard-dg2-466/igt@xe_pm@s3-mocs.html>
>   *
> 
>     igt@xe_pm@s4-vm-bind-prefetch:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html> (Intel
>         XE#6675 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6675>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_14110/shard-lnl-8/igt@xe_pm@s4-vm-bind-prefetch.html>
>   *
> 
>     igt@xe_pmu@engine-activity-accuracy-50:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-lnl-5/igt@xe_pmu@engine-activity-
>         accuracy-50.html> (Intel XE#6251 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14110/shard-
>         lnl-1/igt@xe_pmu@engine-activity-accuracy-50.html> +1 other test
>         pass
>   *
> 
>     igt@xe_pmu@gt-frequency:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-dg2-435/igt@xe_pmu@gt-frequency.html> (Intel
>         XE#4819 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4819>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_14110/shard-dg2-435/igt@xe_pmu@gt-frequency.html> +1
>         other test pass
>   *
> 
>     igt@xe_vm@bind-array-enobufs:
> 
>       o shard-dg2-set2: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8637/shard-dg2-435/igt@xe_vm@bind-array-
>         enobufs.html> (Intel XE#3876 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3876>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14110/shard-dg2-432/
>         igt@xe_vm@bind-array-enobufs.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-
>         scndscrn-cur-indfb-move.html> (Intel XE#2311 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14110/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-
>         move.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-
>         scndscrn-spr-indfb-move.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14110/shard-
>         bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-
>         move.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2311>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-pri-indfb-draw-render.html> (Intel XE#4141 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14110/shard-
>         bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-
>         draw-render.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-
>         scndscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14110/shard-
>         bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-
>         draw-mmap-wc.html> (Intel XE#2313 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +2 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8637/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-
>         scndscrn-spr-indfb-draw-blt.html> (Intel XE#2313 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14110/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-
>         draw-blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +2 other tests skip
> 
> 
>     Build changes
> 
>   * IGT: IGT_8637 -> IGTPW_14110
>   * Linux: xe-4141-c701e79730169fab373fba7e759497d755fac592 -> xe-4143-
>     c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8
> 
> IGTPW_14110: 67de2e85c9c25ad5217620caf5abdfd643cf33a8 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8637: 730ee3dfb26f8d7891fc240b0132a08c5bc7b949 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4141-c701e79730169fab373fba7e759497d755fac592: 
> c701e79730169fab373fba7e759497d755fac592
> xe-4143-c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8: 
> c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8
> 

