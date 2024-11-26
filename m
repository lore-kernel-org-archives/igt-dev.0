Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFD4D3B98F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 13:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6DE10E403;
	Tue, 26 Nov 2024 13:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKGqU7Oi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D4C10E403
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 13:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732628614; x=1764164614;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UXA3KfOAGsed5Jwp0VEedqwc+M/8CypscLAui6g4PJU=;
 b=NKGqU7OiPf7IpodyGx5vENMqyAeFwGMMrW08a4i2ECFGqgHuMaDMHi4l
 oKmfsuePNPlikKCxEoq7sLOuEGBTm7vH9Rv3/8kI4OHJNwMoECGgsP1mr
 W6aBh6Q6fdCqZCp5Ndf2s4QQyGKXf5aqMUIWBSbR+8IjnHd6n9/jimZUX
 H8Lq4/mhujDHdhINWX9VQVDuhWd91Kzf3OH7Zch6Neh8FfSpThONn9ly/
 H7mPcAmFZTrfyR5kI22WI1aT3+jEPSCcg2FdEquH3bRlzQD13IWxZ/7Ff
 KLBW2WZiln6c+txxX7GEBgpeFh655aB+hW8HyJ7aD4UmTT6BqjAuzsDFp g==;
X-CSE-ConnectionGUID: MeUP3nkuTjmDYI4Qk6CnOQ==
X-CSE-MsgGUID: gshp2AjfRr+I0Md6QE+XRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32531643"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32531643"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:43:33 -0800
X-CSE-ConnectionGUID: MDQCqCUMSIe9boY7RCrfKw==
X-CSE-MsgGUID: LhZtViQxSkW9/wKDPq9i6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="96673961"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 05:43:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 05:43:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 05:43:30 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 05:43:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXr7UzgRtFRuWu1L4b2S8MSb/eU1sy5iwp1TR4SDhsR92RJSO3T6Ru158VlhqVMlrkykB6G7066PGDnjEkeNXEQmZXCWxU4TeOaq6pwSGAJ54hi3aEHpBLm/fl8yUNSDimHiKf5wOzXSnJ6uqWDWzYswE5RzXtoM60gjXuyYvsjwagUctsa8sPxG+58JPFHUkmVY6POZawtjeAvwtwthfPfm8YbK0YyWk7nVVQkvqOOWIY924zIx4OLSuLGrJ42eyBonyjrkbiExYmKkV0OUj9wwC1FicagASMrjQwUd4eA9Etk+M+LvXmzLkHZTNGNfo6F/bGJVFpZWs1laOHSagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7puynXQtNu8jId4AmCYHb28UUUlltiLgfusddOSThM=;
 b=dwvawUpfjwj8QcQ+2qPl0f9pd/2yzeUXG9n7rL1d8ivvOmGfKlP39O0QEuUDayr7JqOmqltE1uuX27h/nlkMFccI0p86Wj15E4m8kVfhW34yi15E4Bw8MY3seJNxxd3F5IFasl/heA7FA9A1nKUq29u8BKLPXdmpuoaYmt0e1BaZ0lDv1fNQY1K4EQZTOjYRy6tH61co/+c/Yi7UsZw5C0jHB825k9cabYQ9qxgp5MP77e36Mx2+MSSjHKF5vKv70mSOTbog9Eli1P6N2J0I/246BjETgeEERHI9V9HaEfSOWifb0fYUAUGzLxwxPJOkxM7zV6UOzY0/YqB+Tfkb+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS7PR11MB6247.namprd11.prod.outlook.com (2603:10b6:8:98::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 12:11:34 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 12:11:33 +0000
Message-ID: <161fc58a-56ae-4cb4-9d6a-494bda671463@intel.com>
Date: Tue, 26 Nov 2024 17:41:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] tests/kms_async_flips: Skip async flips on joiner
 output
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>, Kunal Joshi
 <kunal1.joshi@intel.com>
References: <20241125163426.382975-1-jeevan.b@intel.com>
 <20241125163426.382975-3-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241125163426.382975-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PEPF000001AE.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::a) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS7PR11MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e05825-1e1e-4bd2-295b-08dd0e1377c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGhvWHQ5bWlhaHdRQmtqVEp4UElBQ0FaU0RHZGdPSm40U2NvZ3ViL1lNSENq?=
 =?utf-8?B?YjNaZ1ZCcElkNWZJZStVNnBFRmNHSklLV080MkFvc0RKNE1UZ0pGY1E5bjI5?=
 =?utf-8?B?WXZqa0dFZmRIZmRYaEM0UXFXbHZqKzUvbG9TblVCNjFkS0k1K2VWOVBFR01E?=
 =?utf-8?B?R2F0MU1QN2xsWXFnbUIrL2ZCZWpJa3I0UEVuK29FSVlIMHZQSjhoKzBoVHFS?=
 =?utf-8?B?eGwyTWZTNzByNTZXTmVwK2dYYkhHeUQwRjZHM2hpUXl6UkRzZHpVRURpTFhu?=
 =?utf-8?B?ZTJRWUhwU1Vyall6ZHovZDF3TGxHZ09TWUZaNk1kaWdDQzNXd2ZjU1d4czFL?=
 =?utf-8?B?Tk43VkZKNmdZTDVvZE9DdTdZeUQzbWRWT3hQSy9DMjJadnBWY00vRHRYYlYw?=
 =?utf-8?B?dFdPQTJoVmxSVEc0aFRhV3pNcDFvcEIwQ2lwcGtHdWVmb2sxMjRzdGlZSEdD?=
 =?utf-8?B?N1RneEM1cXN4b0ViVzVXcWRHdE5NeWh1K1hpOGkxNldNR3dXRHZCYWNzeHpW?=
 =?utf-8?B?cjVVUTAzRzRHSlNKQlJUNTR4NDE3UUt0ZjVFN3hwVGI1VDV4WEMydkFrUEtS?=
 =?utf-8?B?YzJyQXV2L29LMEVaWU9URlNWN3IxVkpnb0w2TUpaem15K052bHVKbDlSOXdZ?=
 =?utf-8?B?MThsZExzNFFqWSt4aTZOQ0kxQlFvRGpEK0U5eTZsTXNZUmZSYUJYbWEvdGlU?=
 =?utf-8?B?Z0QrRy9saEtEdFVxNkQrSjUySmtaR2JnaGg1dTdCQkZ5N1d1aC93dGEzMWZz?=
 =?utf-8?B?S1pwSTJKUjdCSWdTRFlRZzF2Vml5TWtBTEk1YWM3Q0FudXBDNyt4WDlCZC92?=
 =?utf-8?B?bjBTbUtSQTIwcHdGb28rYkFvNXhta3BMRU1qdWtDYjliQVIzYWxRMi8zWlk4?=
 =?utf-8?B?b0xZYXdnTmFoTkpmNTVIL1lyRWwvUGdtcHRweWhqRFUrZy9JWTJ2bUZoV04w?=
 =?utf-8?B?eHJaS3JudFFaK3V6bkZoc1FRZ2RPdUJtOTVqS1BlUjFoOEJtZCt6U0wxZmp6?=
 =?utf-8?B?dkYyMmxodU94Mk1MREMxNndaekhUT0o5blo3ck1uTldYVGZ5RDBSNGhYL3Yx?=
 =?utf-8?B?TmoyS3F3cmtQTXpEcFBTM2Myc0Y3RElTUkY2dW5xMmwvUWpBZG1qRWVOdHVE?=
 =?utf-8?B?NXloY3JVUHJZV3dkQlFic3E3M2JWd2lFQ3BiZDRoNXFldEE3bTkxaXAxcDFn?=
 =?utf-8?B?aFczMFExRnBGUDl6dzBSV0dUTmMrczh3eEJsKzQ3bm5tZ0E3WWwrcjMwRWov?=
 =?utf-8?B?a3d2SXorbnVQZGwwazRqbFcwOWYwMkUwRXpaQjhQcFJtWWxFb25MU1BRUEhq?=
 =?utf-8?B?cXhtTnhUYUNxdUtuOUQrc2FiWUVDY3BMZTFzbWkva29hRjNpNkF3YU9NL1ZZ?=
 =?utf-8?B?U0treFk5K3Vad1p5dXpCTUk1ekNNUVlRSDI2ZU1tenNzdWc2S2FzdDNzUTdY?=
 =?utf-8?B?a0lLWldTU0NHeTRhS3ZNL3dEWWJja1hFRm9nemk0S0I1ZWxGZTJzY0FlekI0?=
 =?utf-8?B?UlluRUpuMVFVOWticjA4VC9ualVVV0Z5MW1yQ0FTL1V0L0lDY1Vodm5aUG9H?=
 =?utf-8?B?cDMvUms3eVltVE8vbXMrU3d1am1SQnNSZVA4aXBjblNyWWhGRHBlQ0NsN25s?=
 =?utf-8?B?SmIxY2RYcWttbXhJbExNMDh6UXZuNUswY2V3TGNZM0JLd251Z2d4Z1NMWmxY?=
 =?utf-8?B?WW1hL0lpZElZeHlCVE5tbmtnWjVPOE9vdG9va0hOV1dUV1J0c1RsNnNnT2FE?=
 =?utf-8?B?MnIvRlEvM2pLZzRQWnVJQnN4MVBpRk15RHBLbSs2R2t3QWU2UW9JYnlxM2xs?=
 =?utf-8?B?UXpVSnozWllSQzdvVWhjUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlZJNXhQTW9CclF3cXEyRlJNREh6Uy9ISkNaUkZ4TDFjeXA0c283ek91SEVY?=
 =?utf-8?B?cngxSE1tMHZTUS9ud1loTEI5YTh0N1pzaThDL1pWWk1KK2J6RXZNTDFrT1Q5?=
 =?utf-8?B?Q01EaDFxUHNMY1MraHZOUER5bDRXTUlaeDFPTEpITzk3L3ZzR0E4bUlrcG95?=
 =?utf-8?B?U2ZiMkFwczNDU2NLcFRDQWFnL284aVVJS0Z1UTB0R3U2SVhEaEVQcENIZ0R3?=
 =?utf-8?B?NDd6TDZzSnU3aWJNejRVd0M0NUE0aXRmT1lySGZCaXN3dXJnaE1uRWQ3a1lB?=
 =?utf-8?B?Ym9pNm9oY3RicGU0YVFhN2thNkNqdkVGT1dWYkZsclhDU2ZVY0x6R21pN1Z0?=
 =?utf-8?B?cUV1R2xycW5uZDZ0Mzk0ZzJOcDloY21FSUtBNzFtOEpmZVN2ak5GeGZYdHVZ?=
 =?utf-8?B?RjVpM3JrTTQ2S2Z4akR6ejVnNXBESjhiLzgwREFpMStXS1VNTFVKOUZrUXFU?=
 =?utf-8?B?S3pQc2xwaGt3NDRyVndhbVh2cS9TTlBGYWMwS2R2ZDh3VDBWTkZXV3AycUZK?=
 =?utf-8?B?djNLdHd1ZWUvVEZkL0V6dXlCU016SnFkeG1nOVNhVkFBNzd0c200TVh1bk8r?=
 =?utf-8?B?dXNaY1NpRTlaWW1NSWJRNzVoTC9OVDlEdis3UEFOSHNmVXNqVW5YeGhtOFVm?=
 =?utf-8?B?TFZTd0Y2Zm1zSTJiZW1UbTYxbFBVVEVxMlFNMmhBWWFXTEk1d2tBcUpiWisv?=
 =?utf-8?B?VGpRWENkVWUrNCszVW85SG83Y3FXSkJXNHJVS3VqYnJGbFpTNUJtWVZMSnQz?=
 =?utf-8?B?MllWUFpiQ3pvSWxzTzEvMzBCc3d1blMza0RHOU80aGp5ei9FU0ZscjJJTTlk?=
 =?utf-8?B?RU5zR2F4bFZmb2o5ZWVvM3BnQVJQUWZWTFFHakdHOGdJYnFFRXNKaW90bXNP?=
 =?utf-8?B?RHM5K0NybFo2a2poUGJyQjJUQjdTY21DenkzbXFqY01lY1BOWmtWdjJJZVl0?=
 =?utf-8?B?cGMxb0ZzbnhKRVA0NStwdnhsdmRkUUxNcVZ1MEVYQjRwcHMrZ2xqaFlMZGJY?=
 =?utf-8?B?MHNJc24rdkVlZHhrNFgzWmx0UkNCV3k2QjgyWmc2cmhmQTJFUWxrcFptbzVY?=
 =?utf-8?B?dDcxNmVDMnJFWGQrVWdwRE9yR2ppVHI3Q0RQYzRVS0xDa3JQdXg2Z25RK0Vq?=
 =?utf-8?B?ZzFKOGFRb0dYdER0L1JKbllJQktKckR6WEtqUGg5K2Evc2E4bFBQcHI0bnBt?=
 =?utf-8?B?bktpQjJMYWlKclpSRGtVL1FyK2l0VnRxOWp0TTlPNExwL28yQUUrdVpUTnZl?=
 =?utf-8?B?NGFaREpJOXdWWWwrQnp0L1daOXI3SFAzQ2hSdkRuRWNyZjRGSEpvaW1TK3F1?=
 =?utf-8?B?NytBUUxGNURrM1FGeWVJSlV5THA1WktJTzRUWFlwN0xaMzZFYldJanZNK2J2?=
 =?utf-8?B?bGI4NzdjVGl3L25FWXplRWNZb0I3eHBGSFhNaTdyYmE1Q0V1d0p0cExCSFBZ?=
 =?utf-8?B?emwvK3VhRlBReDh1SHduZmdGeUFBdCtJWjJMSVRWMnV1alJDVkV3WEVvR2R2?=
 =?utf-8?B?Z0dtY3Z0enNITW5YdHdqVllDMFkrb0dqVEV3Wmhab0xWcEc4cHlDbkJsOVhi?=
 =?utf-8?B?alQ0YWVOZnhrWENYc3E1a3Q2SiticmhEQ05FUjZoWlZITVhNUGpoVXJpTXd2?=
 =?utf-8?B?VzFmVmlCU29ab2c5VGFuSGE3dGRqYTlhMXlKQ21Cc3I0YkFuZ0s1enpKWGdy?=
 =?utf-8?B?SnlYMWhjV3FqMTJ4L1UwOE5JVStneTVTZjNhcE96UjVYbzNud1hFZWFPcWpD?=
 =?utf-8?B?V1JwZlV0T25YcHZDcDhYUlZqd0p2a2YwaHlYUzA5L1p2N25nenVkWVVzODl2?=
 =?utf-8?B?ZFpsRkhQQjc3NW5UbTNEclNIV2FCQ0MxUCthcUlaRVRZNStSbkJnNDYwbEZM?=
 =?utf-8?B?L3JqRkpUZGp0QkRUcWQvbzBvVnc2bXpQWTRFVlZBemdNb2hla2xXNnRsS1M1?=
 =?utf-8?B?QUNGUW5ta1c5Qm90MzZsaFNReEx6dTlYNjBTNXcydkN2NklJYkdwTUVVd2ts?=
 =?utf-8?B?RUIybEtVcGZabDExRWtFdWtCL2NDbXlvTm5MMUtkbWxLNm1ocGt5Q0ZjLzZG?=
 =?utf-8?B?NXY2UktSbDVrcHdtL2RreWhBTVVJbFRuQzlIc0x3eHppWUc3dEtiNEVWcmtH?=
 =?utf-8?B?NWtPaXJXSUh3cjlmMVJMZEJVVlBPdlpGVWNJaGR0TFlFVGppbVA0dGVTYTJ5?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e05825-1e1e-4bd2-295b-08dd0e1377c1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 12:11:33.5789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHWknECarYs/RodhZKT0iWT/j6PpIdgbCNPRjcUfZJ/IRVG85RKvkaemeCDIrUyzBaeriicsKwn8Pz5g3oTRAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6247
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 25-11-2024 10:04 pm, Jeevan B wrote:
> From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>
> Async flips are disallowed with joiner, but the test commit still
> goes through and causes failures. Update the tests to skip on
> joiner outputs.
>
> V2: Skip tests only on joiner outputs (Kunal).
> V3: Add a todo to remove workaround when async flips with joiner is
>      supported in kernel.
> V4: Add proper FIXME, improve log message and
>      move igt_is_joiner mode to library (Swati).
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/kms_async_flips.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 5dec71291..3ce6e18d7 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -653,6 +653,12 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   		data->allow_fail = false;
>   		data->modifier = default_modifier(data);
>   		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
> +			/*
> +			 * FIXME: joiner+async flip is busted currently in KMD.
> +			 * Remove this check once the issues are fixed in KMD.
> +			 */
> +			igt_skip_on_f(is_joiner_mode(data->drm_fd, data->output),
> +				      "Skipping, async flip not supported on joiner mode\n");
>   			test_init_fbs(data);
>   			test(data);
>   		}
> @@ -674,8 +680,16 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
>   				      data->output->name,
>   				      igt_fb_modifier_name(data->modifier)) {
> -				test_init_fbs(data);
> -				test(data);
> +				      /*
> +				       * FIXME: joiner+async flip is busted currently in KMD.
> +				       * Remove this check once the issues are fixed in KMD.
> +				       */
> +				      igt_skip_on_f(is_joiner_mode(data->drm_fd,
> +								   data->output),
> +						    "Skipping, async flip not supported "
> +						    "on joiner mode\n");
> +				      test_init_fbs(data);
> +				      test(data);
>   			}
>   		}
>   	}
