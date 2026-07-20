Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35ACC44515
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 05:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8E510E105;
	Mon, 20 Jul 2026 05:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGo/Xrzj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDE710E105
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 05:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784524778; x=1816060778;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=la4iOfy9HsaHnJ2P9Y1qXzlaJoMn9ZxgdubttR7ceec=;
 b=VGo/Xrzj+CwAaYkYwX4KXGQ6qxzwEmcgOYoyqg+3xDisxjDiHVFRSSzf
 PnYv1CsIQm1NkOKpezNYhwq/G5uFYG64956UW5f0Ir1nyTdOfOSkuTAa6
 26YffqVYVSrix7bZfh6CcGiHp455qn85zVp4frkn1kwyUbYI1o2tQFYzV
 JJpPJrnpWeYzjIL8jxgr760xF3/kWx/BMMJM4YEHE8hE4XsCBeI0YTrvx
 BbrXjEWs05xlkC6TVRp/CfEwGj8CKT0Q1MJQAvtdQgeh9z9pWjmPUyZcg
 W/6hJsJFJBku5WimTBrnVDrTlgjbN0pSgQHarD3h04FHkvN2lsQnvgUuq w==;
X-CSE-ConnectionGUID: xHfPF1ZuSuyTmFhO9xy1VQ==
X-CSE-MsgGUID: 9bdGypGBQFSvjGzQZMEjTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="84083586"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="84083586"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 22:19:38 -0700
X-CSE-ConnectionGUID: Z1O0jCdPRTqWqgUZ3aI37g==
X-CSE-MsgGUID: RicxCOBORvqCzB9lbYS7fw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 22:19:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 22:19:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 19 Jul 2026 22:19:36 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 22:19:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKb7vh/t5cS6ULRryBwWFpKYo7gpBqxZIth3FpfVx4nf9V119E+U1McteFNYZfdAa0zUas1+d1lo7b1dnj3TqVgSUDp5V4QhgAD9OgfDIpDir5IytrZuZ15ftaNkgKKBiVPH6qQmVGyLtTMKwQ04SskVXNokl6Zc0vq2v/wWfdb6KMZeeaCXEjJnDYoF5rWBHfLWubf1t+ynyV0djsq90OfuG1YrbguKQvp/5ZrUyiA3OCw4OLPpt9w3i83pj4FrkV37+DVsDwE3G+ONdDqj7lGWx7q76SZPVAUmHkECwcaxRPY9y9+s+lRd/9w/6GK+I+p6iQ24+xYDeJwTldwOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCfLI7wXJrtGMELFuOzS6c3mDLP/yu8A5TZ1saKXraM=;
 b=OEFuVCMmsFq8LgK4YE56qlOPBpBvliNIeYDkSHIgzeRLt/aglkVllJINPxu/eUivkImcxr+QJ/rDFG7dGlBRLSnXZR4Cj1rdn0V/aL6HVZqMFuUPi/xUCO+NYQDhPsv5dT/EcL54y9HKebkVhQiOEYywpnIj8KjTlK5a2nEfPmWOBGUUOKExscVOjOdThOKrzknREvBoWtYnvUocv+0fxAGi0PK4aK091pvlvYf3yXK/vwjeR++SoXOChKquIKy8I3aGsWZ4YWc3jCkVNuNWkhnYISkxhlvTeTidrDPF5v545Dhae4nbt2f2y2kP1uMMNM2JqlT/Zcojafjeb2WRtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by SA2PR11MB4777.namprd11.prod.outlook.com (2603:10b6:806:115::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 05:19:34 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%5]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 05:19:34 +0000
Message-ID: <db573a55-2f2b-46d3-a020-22c81d6bed10@intel.com>
Date: Mon, 20 Jul 2026 10:49:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Detect frame drops via
 page-flip events
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ramanaidu.naladala@intel.com>
References: <20260709050905.4077066-1-jeevan.b@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260709050905.4077066-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0329.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::16) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|SA2PR11MB4777:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e38951-9288-4c25-25fd-08dee61e7be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: nW8fR+Ay2waTYdkdgRh8JamHRGm1pPUPgNANMKneo5wyDbVEdwpKXzqhQckSWsyzwHlsJAI98/H2zyy1ziH6B1V/9y75KFK6LfwWSumHIfGVSWoDGR9z8bJrLjHtQRypzpzFZ968+DU6wweuZSIEzd3NZAJTcYta5FOF90jtqWhfC992qwL0ajEiPiRERRi+kpyaHWnIYd+pkJ2g5NM/RHrLbUnshSfIvStAnZS0Rl9cEAwdIYx0/y+ynYhzY1LyDnKFEqlYA3v5HFVYislfS8NIwPDyVo4Co/95H2PMXVThC52ywux2UjAauUf9DwdB0osqE/Rp5c7/k2tH18ADX/t1PJjA/D8rABwusB0z3VYgxMx5bimXMSZt3UjG1LP+klIhCyqVFFkb8+ElQV3V5V+5Ygkcs47Nt7dTU96Cbxu1ua/nrBvAV1HjvQaMJfFecMdQoqrVeuer6er9OuJWygb7chQT75kr53M1/kZOMaej7T9q0Byd4pnkkw2MGagHGcoNsUaNI0OCe5dLEH5L85TqarhanOGWEGD4IOSvzqvK620YGehdoYSfr91Hk2n7TRPEhvInaLPhSh8an9XZYcYGp+5CpfaDa/EdD/HJOP0R+m8T6SNFj9M2JOSJJCGw9XVgQDcMCW/1iO7nvjWcPTqPb7HpxhNLWQEj5GRTBns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmR1WHZTVG9UVUNkbllsem9BN0JTcVQwZk9PaXYvdEpCQlU5dEN1c1JOVUJz?=
 =?utf-8?B?c3MzbHdJRG1Edis0eHpVRFJwdWFFdCtJdks3eTdMQS80dWdYWHJNMjJkYzBN?=
 =?utf-8?B?MCtiUkc1aDZKY2JQb2xEaWx1L05nSlFMUWhRWnZJbEhYSS9EOXFVSHdrVExj?=
 =?utf-8?B?c2ZVWnRFbW52enZQMXkzajRJNUtHRUYzZkNOYzk3TkhRdEphNlRKN1lEWjVT?=
 =?utf-8?B?eE1CbWNBVkhEeUdML1RPYzFzdThzZkc1VENEU3JSc1dVdTBJQTUvSHNObEtz?=
 =?utf-8?B?TU1JeHFHc2F5R3NLTnVBd1VyWkhabDlSWlAwZEwzRnBRM2JOZlg3M1ZsaldX?=
 =?utf-8?B?SlhsK05BM2s3N0FNdEdoUmFNSXJVSzhreVhSbkU1YjRHczBRZm5GZTBWcTYw?=
 =?utf-8?B?bkNURis4WWd5Nnk5dUtzN1ExSWhxTEtoN2lvcUc4T21OQXUvM21UOTd3VU9p?=
 =?utf-8?B?Y2ViY2o0VFlnTUlJRFozU283Nm4vN2t5ZHZnM3JWV3Qxci9Na2VmMlNha3dn?=
 =?utf-8?B?eGp1anNnaEV0aVhnOHFWaGI2bERMQXVKdzAvdVV4UlZvWS9IT3ZNOXUydFJC?=
 =?utf-8?B?a0Q4MVRhS3VMRVhtWE9RSlU0TmIwZGd1UGFQaTQzTWtMdnJ3bTl3V2ExZDdC?=
 =?utf-8?B?b3U1QUlkUWQvVGc5YXNXSWh0YkFzMEhWcFVnenIyMkxEd3RHaEx3RGRZbHpT?=
 =?utf-8?B?TXIrWi82RjR5NFZvcnFxUXluNjd3SWF2OXg3YU1MUmE2NDdEYlYzQTg0UmlW?=
 =?utf-8?B?ckdXd0tyVWFQTkVHejVjYm5mRUgzSEVFOTBWMWRxcHVaTVhXUzc0SEJ5OEJv?=
 =?utf-8?B?TnRVbE13MFRpeDRSM2JWcURWSi9tQzVjODhzNWJmOForMjJGNjJaVEcwQndT?=
 =?utf-8?B?MVVCR1FlNW5wemNKZkdXQk9GdHRWSEZrcmlxWitQRjJpVnQzZ2NyVzJCMFBP?=
 =?utf-8?B?RklFR25RbVV2L1Z6aHBSV0p2TDlyWVk2V3k4cnRzRWxIOEVDZTJnRTh4R0JJ?=
 =?utf-8?B?VzJFL1QvVllkRkZMelhRby9KV0lPQ0xJQkR3Q2trc1lsRWlORlF1MHozTTFC?=
 =?utf-8?B?bll6NjBBUnQ3R1gvNWRJSFA5anQwaHpQNDBxTGZiR2tJb0F4VEJoTk84alZI?=
 =?utf-8?B?MFZ2QSt5ZG5CUDJxSGJSdTR1SEhyN0hlMkZFVUNLTHZTREhCWVlBN3NOaHM2?=
 =?utf-8?B?V2U0Y1VIalNzOVNrdFhmbGVRS284TTI3SzUrbGpWRE8vQjl1TVBPOUd0YWxO?=
 =?utf-8?B?L05NM3NkNE5NeXNCL095ZHR4RmxhVi9tYzg0RlgzSW5qcmVhVWRDdWZYNlo4?=
 =?utf-8?B?ZFZuV1JVSFA3MU50S1p4cUdLdHFrS2E3WndtZm9wYTRyemlwMmdUNnVGS0M1?=
 =?utf-8?B?djNnWlM0aS9iT1dyYUp5dCtsSGJSMUFPbk1OQndxbVVVMzdHWFhaOVJEZnor?=
 =?utf-8?B?Nk4xV3ZoVGNtaXF1VzZuK2c0SzErMDhVVFVHQXQxcWgvb2dPYUd0UFhUeU51?=
 =?utf-8?B?K2MwM0RBb0FyV2hPS09iQTdCZXVUTVp6WGZuVnNlTEVJQ0VsN0I0ak1Cejk1?=
 =?utf-8?B?VXBjeUJUajdWeDJMSVlWUjlOSmFhMnp2VG43d1lZZldEeTVZdGE2TFJGMDhN?=
 =?utf-8?B?MEU1TFRWNzV6NFc4ZW5rMjhNQ3h2YWo5UTJvVWR2cS9zVEJ1YTVhZ0g0bVdw?=
 =?utf-8?B?K0JZbXVncWFOdnhWTFlTQU92WHhUOUFEelVDVUlCOWc2UUx5VnBad1BWUWtK?=
 =?utf-8?B?K2RkMXY5OUdEZktPQ0NRampYTnowZmxvcDRMV1cybVI4aTVmTXd6Z1F6Z1Yz?=
 =?utf-8?B?bHZnQVlYeFZ3SGlPNEFlL3NTamV2cFFSNmI1U01EdUZUZVVqbTQ4RHlXOGNn?=
 =?utf-8?B?NTdpSmFLREorZk9MRTNRdDNObnhYUmRlbzNSNGJWNEJ4ZHNqTjA1ZlBPM1JS?=
 =?utf-8?B?bUg5Umg1WmZwMnVSZzFsZ1RhVXkreDlodzduVWY2cVJnMU8rSHFNQjlKaXdX?=
 =?utf-8?B?MFhBUktDWXRpMC8rc3ZCTkZUbGU5TEdhQkVkcWZKYnlsOE1vc3lTUzBHdjV6?=
 =?utf-8?B?RWpDUk1vUm8xTWRxTXl2Y081amdhcmJzeFlhVlBJdWlkMm5ET2JGdmZLSFNo?=
 =?utf-8?B?bkFPRkVrUzIzK3RRZGFHQUxOVk9PR2pPaXpnaFovcWFkeTV6dENTbXk1bFpT?=
 =?utf-8?B?RjBvdWFkMEEwcDJhbGdkcE5hemtTOS9PMlY0WkRWQWJZdWhrb2lHcGlwdEYz?=
 =?utf-8?B?QXdsdC9EVzg2Y2I4N2dLT0NneEVIUDV3R3hCUjNoV1pqNWFZTjl3TFM0OUUr?=
 =?utf-8?B?SWlLUktVRkNNWG5pMjRkQ3dkN0tYL3RXWmRQdWxwYXdVeHE3eE9oaFpRN2tn?=
 =?utf-8?Q?Ohy1FRPmxQIjiegWG30Cf74DFXwQnXn0EDJNt?=
X-Exchange-RoutingPolicyChecked: ar0X+AJdkkhydHTtDEHUGhi8T5TI9/UhXtSedFj6Ftsx/ev+PLsmKcR5jOZjp2taYoXnn/TU77qmz/p+eU3V7BSInOkL3POgaOAX1puZv4wj7E/M4zza9Ypyp3Nkrv0n0td5hDstSnjCQGJHY9bZbuiHNo5b/Mx8++mNBhFw0zgenv0EFmjPyq3Htb8ZvSKiwOz9j+OqhR3p0NBGO4c5QhB/RnXeGOQ6EhsvUz/cY3Jag2r1xvJKqDqGaiw6VwPaL35bEye+3nOhjP6yWYSIZJ7+nxHIQVnF8VTrk4eoBlYxPVbW/lP5rY7ZH86gFqTQVYMyrt7T/wPyfJz1aAJYCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e38951-9288-4c25-25fd-08dee61e7be0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 05:19:34.0792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIIEJdLnNykawxbPNdCRW6Dbfv7+K09ag6IGNwPHPCcyDyPPrgsKKrldlGQDTlcyaouQhbZ+W9Mxvtcrun3VcgONZeMzYy0sWpQ+dkz21iLn6CVycfaANQ/mdi9gSY14
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4777
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

On 7/9/2026 10:39 AM, Jeevan B wrote:
> The DC3CO frame-drop test currently waits for a vblank after committing
> a new framebuffer, which does not guarantee that the frame was actually
> presented.
>
> Switch to page flips and wait for the corresponding completion event,
> which confirms that the frame reached scanout. The test now alternates
> between two framebuffers using page flips, preserving the playback-like
> cadence needed to exercise DC3CO entry/exit transitions.
>
> Keep the existing vblank-gap validation, but derive the sequence number
> from the completed page flip instead of an independently waited vblank.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 69 +++++++++++++++++++++++++++++++----------
>   1 file changed, 52 insertions(+), 17 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index ef53c5f96..da077a2dc 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -362,30 +362,60 @@ static void test_dc3co_vpb_simulation(data_t *data)
>   	cleanup_dc3co_fbs(data);
>   }
>   
> -static uint32_t wait_for_next_vblank_seq(data_t *data)
> +struct dc3co_flip {
> +	bool done;
> +	unsigned int seq;
> +};
> +
> +static void dc3co_flip_handler(int fd, unsigned int seq, unsigned int tv_sec,
> +			       unsigned int tv_usec, void *user_data)
>   {
> -	drmVBlank wait = {};
> -	igt_crtc_t *crtc = data->output->pending_crtc;
> +	struct dc3co_flip *flip = user_data;
>   
> -	igt_assert_f(crtc, "No CRTC bound to output for vblank wait\n");
> +	flip->seq = seq;
> +	flip->done = true;
> +}
>   
> -	wait.request.type = kmstest_get_vbl_flag(crtc->crtc_index) |
> -						 DRM_VBLANK_RELATIVE |
> -						 DRM_VBLANK_NEXTONMISS;
> -	wait.request.sequence = 1;
> -	igt_assert_eq(drmWaitVBlank(data->drm_fd, &wait), 0);
> +static unsigned int dc3co_flip_and_wait(data_t *data, uint32_t crtc_id,
> +					uint32_t fb_id, int frame_time_us)
> +{
> +	drmEventContext evctx = {
> +		.version = 2,
> +		.page_flip_handler = dc3co_flip_handler,
> +	};
> +	struct dc3co_flip flip = {};
> +	struct pollfd pfd = {
> +		.fd = data->drm_fd,
> +		.events = POLLIN,
> +	};
> +	int timeout_ms = (DC3CO_MAX_VBLANK_GAP + 2) * frame_time_us / 1000;
> +
> +	if (timeout_ms < 50)
> +		timeout_ms = 50;
>   
> -	return wait.reply.sequence;
> +	igt_assert_eq(drmModePageFlip(data->drm_fd, crtc_id, fb_id,
> +				      DRM_MODE_PAGE_FLIP_EVENT, &flip), 0);
> +
> +	while (!flip.done) {
> +		igt_assert_f(poll(&pfd, 1, timeout_ms) > 0,
> +			     "Frame dropped: no page flip completion within %d ms "
> +			     "during DC3CO entry/exit\n", timeout_ms);
> +		igt_assert_eq(drmHandleEvent(data->drm_fd, &evctx), 0);
> +	}
> +
> +	return flip.seq;
>   }
>   
>   static void detect_dc3co_framedrop(data_t *data)
>   {
>   	igt_plane_t *primary;
> +	igt_crtc_t *crtc;
>   	uint32_t dc3co_prev_cnt;
>   	uint32_t dc3co_cur_cnt;
>   	uint32_t prev_vblank_seq = 0;
>   	uint32_t vblank_seq;
>   	uint32_t vblank_gap;
> +	int frame_time_us;
>   	int delay;
>   	int committed = 0;
>   	bool dc3co_after_target = false;
> @@ -393,25 +423,30 @@ static void detect_dc3co_framedrop(data_t *data)
>   
>   	igt_require_f(data->mode->vrefresh != 0, "Invalid vrefresh rate of 0\n");
>   
> +	crtc = data->output->pending_crtc;
> +	igt_assert_f(crtc, "No CRTC bound to output\n");
> +
>   	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_plane_set_fb(primary, NULL);
> +
> +	igt_plane_set_fb(primary, &data->fb_rgb);
>   	igt_display_commit(&data->display);
>   
>   	dc3co_prev_cnt = igt_read_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
>   
> -	delay = (int)(DC3CO_FRAME_DELAY_FACTOR * (1000000 / data->mode->vrefresh));
> +	frame_time_us = 1000000 / data->mode->vrefresh;
> +	delay = (int)(DC3CO_FRAME_DELAY_FACTOR * frame_time_us);
>   
>   	while (committed < DC3CO_VERIFY_COMMITS) {
>   		front = !front;
> -		igt_plane_set_fb(primary, front ? &data->fb_rgr : &data->fb_rgb);
> -		igt_display_commit(&data->display);
> -
> -		vblank_seq = wait_for_next_vblank_seq(data);
> +		vblank_seq = dc3co_flip_and_wait(data, crtc->crtc_id,
> +						 front ? data->fb_rgr.fb_id :
> +							 data->fb_rgb.fb_id,
> +						 frame_time_us);
>   		if (prev_vblank_seq) {
>   			vblank_gap = vblank_seq - prev_vblank_seq;
>   			igt_assert_f(igt_vblank_after(vblank_seq, prev_vblank_seq) &&
>   				     vblank_gap <= DC3CO_MAX_VBLANK_GAP,
> -				     "Unexpected vblank gap %u after commit %d (prev=%u, cur=%u)\n",
> +				     "Frame drop: unexpected vblank gap %u after commit %d (prev=%u, cur=%u)\n",
>   				     vblank_gap, committed + 1, prev_vblank_seq, vblank_seq);
>   		}
>   		prev_vblank_seq = vblank_seq;

Page flips fit video-playback simulation better than the vblank wait.
LGTM.
Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>

