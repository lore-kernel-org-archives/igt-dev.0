Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A48AD65C44
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 06:04:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B9B10E175;
	Thu, 14 Nov 2024 06:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNY37aAq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2832410E175
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 06:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731564261; x=1763100261;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kSlOAeFAZzCmiBQBGbjac2D1Gp7IwKLmcybNf4eMfe8=;
 b=XNY37aAqJTPIAHPBsIF7wlPk5MkMyUIuJfhaxU4B3rLxGB66k/udCHpx
 1bpEKQomcZfGd/DwzkRj83eLZ0HbbSjzT216jGlNFjTbi2NeLkXO/kEeO
 2GT6SId1YJRphomdhHZ77CEupHHNGNG58Kv9PdHfo+rF7IjPccDdcQopq
 lwkaxnqQJYuOzNeCkIq8450+xLtEuc82fhPHMHZes1/XGd6ZaShbvCYtL
 bMTNRn07FfUy/L7xZde0DVGnRysnZXiLszIoKDsyqOFSfG6KbuiJ6g4HT
 mBF0fZUuH3YRxluPojpL3i5x/HGY3AwdR+7CNGb6Fner7bFOOPDVJoaHG A==;
X-CSE-ConnectionGUID: sBYvAoxQTNqfD9uEh52x1w==
X-CSE-MsgGUID: 6hb7CK0ASsqDOPX+Tdqpzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="35282241"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="35282241"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 22:04:19 -0800
X-CSE-ConnectionGUID: uT0imAzbSb+elai8RU/naQ==
X-CSE-MsgGUID: ICGHqH00Q/GSMh+GO81oBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="87650012"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 22:04:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 22:04:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 22:04:18 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 22:04:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaDp/Nil+JN8QsfoWv4cIOkyNizE8vEKfQ88tZdHMKzGZYtkkt8H9KHLZgUAfF0bxjxN4sRPh4k6NRD05utwjtI0qxXIJmHvNv7jfwPblG+RYeWQckk/LiDIY0PG6TjoT/bF/T2F9zx6zgN1kVsDsNs9zrTA+UwJHsYsPbZxRQCiMkXwygeezk/UlF/l20qGYiLxh/xFE7YqaOt8hiQ8/wKQydpoIKyNkUYrLSzvTNa1M3KSoIRQZjXWYA7z5Hybjvjv4iZD3Fb9Jl31Pu+N6EOE1Gr1AbyE9O3YqnAe1VztMRmB28RBDbJ85gfhCv7sV+zroBpmoYGlPPNoWUifgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rS2HDJLK7mZWtXRAKqv4LBPG9A6pbKRWMxyEpb0jJk=;
 b=Y2v6z71szJ9UL7bT7BrhHwuKPLkX03cSsVDKWU82zOVC9GGhqPifCo0fl9CPww6ux3mUZQDOmqdb1eh+GB+iIDZEfjLYJvY6JlefnwumsRtcsF/IV603YYA552C0ORg1ovcrkTrPPnK/q3hknJyXNqjWezRf3W/lAmYo/zmB4ag7CDEh7kNz1x6yKWkL8HdIs89iQN72//7Dzng64bZDiZ7SmXcFfgi/XdB0W2jw4/SLy4WA4SjwwWH/XxVY/aNCeu5+bg4MWe8uCYb7a3fIBN6/s/uJWtpNShAkPj979hGyhAQoB4VoDQplFEvxj0wf3xiK1Jk8d1kxcylBGoWVjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 06:04:15 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:04:15 +0000
Message-ID: <b96943f9-91da-4998-a0e1-4240e0ae4760@intel.com>
Date: Thu, 14 Nov 2024 11:34:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_async_flips: Skip Async flips on
 joiner output
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>
References: <20241023031620.3632362-1-santhosh.reddy.guddati@intel.com>
 <20241024111105.2261777-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241024111105.2261777-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::11) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CY8PR11MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f4b7d6-4145-45d7-127f-08dd04722b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RSttWkVMemQzb0psYVBaWFlSOW53dmRJUUhyRlRLRTE0VC83R1pCNzNiaEtP?=
 =?utf-8?B?MlBCTEV0V0gzNERVNisyMmgwTDYyRWQ1cC8vZjJlVTZBMkhpa2dwbjdFQWlL?=
 =?utf-8?B?bFBEQnRmaHdsU0cxZHpLYlhrTU90VHMvcHp3RHBMeUhvWXlvYk9WdEpUZlRN?=
 =?utf-8?B?d2UzR2xHQ25oTUgxdFMvb1M2Z3lGamRIS1ZpS01XSVdCVTc2NmZTLzA2VzFO?=
 =?utf-8?B?Mlk5aGFzVnp2bFdZQnZ2ekh2WHhJcUQvMkx5eFZJRUtSMldEM3RVWk1OWXh0?=
 =?utf-8?B?YnNwMVBiL0g4WXo4UkUxeDlHcUhhRHRUc2ZlQWxJQ08vMW9qZ1UxWlM2Uzho?=
 =?utf-8?B?ZDFVYnFYanZQNDR3NTZoU2ZMb1lPNHNYSkJrVTRBZGtuU09WSXFWOXQzV3dj?=
 =?utf-8?B?QU9zenhjNEtTbUh6TlhTNDZiYkxlVXZWZmZDdEZtMkV0SXo2WXpmczN2cG9P?=
 =?utf-8?B?bUZyRlptZDIvU0NmTGFpZFliV3lIWnNxS1l1TUJyNlVmWjR1RUNQbTJsdHFu?=
 =?utf-8?B?STJBQlJsM28rbE9rclRsV2VQaGN4V0ZiWjVqczcvRVlqOHQ5YjVmRXZvVWZm?=
 =?utf-8?B?UXIvTk5HQ1BYYndkT1QzMks4MWpweUFFeDB2TE5OQUdhNGJlM1FwMDJld3ht?=
 =?utf-8?B?bjNMSDNIbi9DbDhlRnEweE1ydm1QRzBkdWVFUmNxYkxOYStsTUhYdEdEUzd4?=
 =?utf-8?B?aUx4ZHR0Sk43UytDSTNFeXNFQ1BWWXRUdjFUZ3FycWVUVGJUMmVPYVpHQktR?=
 =?utf-8?B?eWpiUWs3Z0NIUzc4aStCVEhvaUFjV0MyTEFQUngrYmtnOHYybkhXeit4WWQ1?=
 =?utf-8?B?eFp5OGhsV3FlUUx2ZVBSMFJLdFp4VEp6QWNUTXl0V0JtUUhWZTFCQmFVNm42?=
 =?utf-8?B?dmh2WHBiQUxSNzlmMmdVSWRzaTVVQTVnUmFNdmh3YjNhT0NyUndleFVUeG05?=
 =?utf-8?B?b0xkQVdMQnk2djlwaWhBcFV2WHgxVGxDaWN5bld2R0luZnQwT2Z2NDduNnFp?=
 =?utf-8?B?QUVrS3lVNkN6VzgvcVhqSSsweWtHeXBsdVBpaFcvUVZtZFFxVGJFTGlyN2RM?=
 =?utf-8?B?eG1jWWlYU1VjRitGSW5Ia25vUllUNFIxOXBac2xkN0pSRUlTQ3U2VlRDWEVr?=
 =?utf-8?B?TUNEZ1JYNW4vL0RObHVWUWw5LzJ0OStoM2JzeGhFdjJoUGJQZDFtcVppWlRN?=
 =?utf-8?B?bXJrVW5QUmhyTmJrd1ROMlladWdDYm1Lcm5la2l6OHNuSm53RkNFRXNzbXlF?=
 =?utf-8?B?SnArdTZDUGUxa3lja3NYNW9ub29EUlJRck9RSHFUeE1oTHBpelNmQzdHSEJD?=
 =?utf-8?B?bVpvOVM5S2NLSlVjUnhKYzFKY0hPK3Z4ei85M01XVzFBbWYzT0tIa2Z3anY1?=
 =?utf-8?B?RWQyejVaOE4rVktFak13eHoxL2ZubDNVZjYwK2RUMTczVEZOQkRsVktmWDVG?=
 =?utf-8?B?emgrU1U0YlFwanF5UzZER0FBbm1ER0UwZHd4VjUwMjdFY05tcmt1YnA3eDI3?=
 =?utf-8?B?YnFvRTlIeERLaCtXVGxySFlMTUNqcXBubkFoUXZUNlFKMHBialRrQmVCc3pn?=
 =?utf-8?B?bUhkUHZzVDlFRXE2VXBGV0cwajAzTEVVYVhpd3h6UjM3eTFJRjR4Q0k3MUtZ?=
 =?utf-8?B?eURMZmxDOE9kWERXRFdUSzJ5cExOUXRxOE9BRG0xWlpvc0JLSDJBNWxQTXR1?=
 =?utf-8?B?RDZvOHQxSUx2VGtBaFRLT3owYVkya0ZlOXUyT2dkbEh6ZDByNWlQU1paUEI0?=
 =?utf-8?Q?K/z++OiydhCCGh9OQ6cAEuZCpsj9waBT/QmLBrI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2k1dGROMFZaSndIY3R6WDQ3UWh6NXBvaUE0eE1ZZnBkM2ErNENYQmo1bmg0?=
 =?utf-8?B?bW1uQUlKOFBYbm9tZVo0aFV6bk1Jc0hVaVpkb3dIVWhxQThTRGNZMkdCR0Js?=
 =?utf-8?B?b1E1eERDOXR3cUtiTnVoT1VMcWZDWXNoVzQyblA5a3YrMHpIN1ZKakpkMlBB?=
 =?utf-8?B?RjRDczU1OWFRYTBZdzZiMFNMcGtsRk8rZzhIQzA0OTBKSkhzUUV2SGpKSFJT?=
 =?utf-8?B?K2hOcmsrcVJUaE5leHpzZXl5SWwzcHJsWk0vOEpjLzFJam9TTnYxSHdtMlF0?=
 =?utf-8?B?YS9ZQlJKUkxMemlYSG5MYWg0Qy9TREgzMk5KdjhOcUlnd2R2ZWJ6MUZGMk14?=
 =?utf-8?B?NjdCZjdHNjI2QWRoMVF3SzBNb2h3KzhhZC80TmhqYXRyeEp3OUhCVEo1NDgy?=
 =?utf-8?B?WjF1V3BjTXpxMXVJenNnblQ5aDRNZ3dRaWFpSS9KbXlhQ01IY0xmYktoOUl5?=
 =?utf-8?B?eVZnOUV4Nk4xckZ2aUFnYkQ4eW1iSTU3a2J4Z202bjIrejdRRGNSa1VVU2FP?=
 =?utf-8?B?UjVBTDZTVE9kZ3dvdU9EMzFMVG12N2FpNk9oQjRFWXY0UnBmdkR4ekpzb1kv?=
 =?utf-8?B?ZnQ4MmM3RDRWM1FPMDh3YTBvVTF1ZU11TDk1bFk4RWRKMm1Hb2c3aE5BNU9a?=
 =?utf-8?B?M0w1R2IzUy83Q3Q0Sm1kNGZSeXRRTnJReU1wdUNKZHFMK3RlMHVIWGdaWjZD?=
 =?utf-8?B?ZXM2MHBaaGR2aUc5dEpHUmdGNHIxMnpteWQ5dXRCK3dxbTVpVGRSQ3JLV2FV?=
 =?utf-8?B?STNMRFFuRHQxalhhVjhhaERxeUNZRW9vREo0RFB1cEF0ZHJZbVRnVjRsZzFu?=
 =?utf-8?B?Rm00L2hVNkMwZjBlTWZYRW9JT0RxbEZBMkY4elJ3WGZFSXBHNXduc2dwektJ?=
 =?utf-8?B?NnBjWnFpaUh0cS9ZVFZ4Z2lQUTVvdU5JbnFzdTRtQzZ3Rm44eGFhaDZmbWpa?=
 =?utf-8?B?Qkt6azlLbnpwa3pOa1RxcGE4V2xpc1I0ZEltaEFHNkdsUFpNaGpTUWx3dm94?=
 =?utf-8?B?a21EOGZEV3pET0J2c0hleFVOemJ1emt4eXcxY1FNSUs5YW1qaFpnZDdja1J4?=
 =?utf-8?B?QktMV1B0UEZuZkl1TkY2T0t3SUlPcGtldU1vdVJiZFd2VmpHR1I4L0N1R1k1?=
 =?utf-8?B?SHVNTTBFa3NZZDFhZFRncnVYV2pHaTc0QUFNcXBJRXlPc09DOGIvWUtlamg5?=
 =?utf-8?B?KytXL0UzQTVkeFlicDM0bUFUNzQ2K0xScitXYVRpMm40ZEFjVHBLMDZHYW0y?=
 =?utf-8?B?anBDSjlvUkhYMEpHRlpjVXhEaTcwS1JrVGhFR1FldXN4dC8xTHZuQU41UUp2?=
 =?utf-8?B?ajZuR2hHYytGWWVOZ3FobkRBaEtzVyt4TGJRaW1QUjdJMHZ0TTU4SEswUGNV?=
 =?utf-8?B?aUlwVC93UG9sM3hTWGxhZjVmOTNVenJpT0JaR2JEeThPdkpzakJPTmR5YkRx?=
 =?utf-8?B?emtZWjZXNlZ0WUlEZHQvYkVQT3Vhbmx0clJ3SXRTVkxnTWh3YTdYT1B2UFp3?=
 =?utf-8?B?UENJRjJHZHArN2FZV3ZOMldaSDR2bW10eFpDQnRjN0wwazdaWUw1R2VHaWUx?=
 =?utf-8?B?bmticjV4UjlQbkQ1NUZVRDJJZEZ4VUVWeThTWEI1RVBQZ2FETWNqQzd1SFpi?=
 =?utf-8?B?L2ZTUHJTL0pDK0ZnVjBwS2Y0SVIydTZoOEdmRkNxRkRhWUJuam4rY0k2OFY5?=
 =?utf-8?B?d2RmRExpZVdjQ1R2akJlM29XLytkUytmRENBckluL3ZuanNlUW1qbGhZS3BZ?=
 =?utf-8?B?S2FPeFk1M2IrdWFZOEVUNHBqYStFK1FoZ3lDOHVGSHRRcmhTRHQ2ZzFyVVJ4?=
 =?utf-8?B?OVQzYnNDbUozVlFXNDQreGhJaDFkWW5UYkJsVXBjMVo0ZVBSV2NERjVBek9M?=
 =?utf-8?B?N3dxaFdUVzk3QlB5VHFMMytoc3ZOZDZjeGZiTkJvUHNCakFwUzl5OUFhc0hZ?=
 =?utf-8?B?NTVrbUQ1Z3AyUjQ2M3dXQy9ONHZiendLUTQ4NzJoK0Z5bWxkdllxK0JObmpZ?=
 =?utf-8?B?bVJNOGlHSDkzTTI2Ty8yS2YzOTRWRk5ManhLZW1jaEhKMjJJRnlZeTlJWm5T?=
 =?utf-8?B?TXB2MWMrOVBJNHpieC9HQ1NqYUlURktFYjExazBrMkxsaUtNb1o0RXA1M0RW?=
 =?utf-8?B?OTI4bkFTOW5kSzk0ZkNhWnFzT2RlY1VaSWRVSXJoNFpWeUoxL1JLa1MyNXo2?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f4b7d6-4145-45d7-127f-08dd04722b30
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:04:15.6957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdJuRiPGv5N/aXF1Hixr28vdTw3zi+thAC12QL81EmPoGkaHuTxeJoTswzpDvA5xfg1U+PApvEqdLDz7Pllnnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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

Hi Santosh,

Please fix subject.

s/Async/async

On 24-10-2024 04:41 pm, Santhosh Reddy Guddati wrote:
> Async flips are disallowed with joiner, but the test commit still
> goes through and causes failures. Update the tests to skip on
> joiner outputs.
>
> V2: Skip tests only on joiner outputs (Kunal).
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 5dec71291..77f68b773 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -638,6 +638,27 @@ static void test_crc(data_t *data)
>   	igt_assert_lt(data->frame_count * 2, data->flip_count);
>   }
>   
> +static bool is_joiner_mode(data_t *data)

Also, shall we have is_joiner_mode as a lib function? Other i-g-t can 
benefit from this if required.

> +{
> +	bool is_joiner = false;
> +	bool is_ultra_joiner = false;
> +	int max_dotclock;
> +	drmModeModeInfo mode;
> +
> +	max_dotclock = igt_get_max_dotclock(data->drm_fd);
> +	is_joiner = bigjoiner_mode_found(data->drm_fd,
> +					 data->output->config.connector,
> +					 max_dotclock, &mode);
> +	is_ultra_joiner = ultrajoiner_mode_found(data->drm_fd,
> +						 data->output->config.connector,
> +						 max_dotclock, &mode);
> +
> +	if (is_joiner || is_ultra_joiner)
> +		return true;
> +
> +	return false;
> +}
> +
>   static void run_test(data_t *data, void (*test)(data_t *))
>   {
>   	igt_display_t *display = &data->display;
> @@ -653,6 +674,8 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   		data->allow_fail = false;
>   		data->modifier = default_modifier(data);
>   		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
> +			igt_skip_on_f(is_joiner_mode(data),
> +				      "Joiner mode found, skipping the test\n");
>   			test_init_fbs(data);
>   			test(data);
>   		}
> @@ -674,6 +697,8 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
>   				      data->output->name,
>   				      igt_fb_modifier_name(data->modifier)) {
> +				      igt_skip_on_f(is_joiner_mode(data),
> +						     "Joiner mode found, skipping the test\n");
>   				test_init_fbs(data);
>   				test(data);
>   			}
