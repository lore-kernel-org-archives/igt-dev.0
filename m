Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69511CA9ED5
	for <igt-dev@archiver.kernel.org>; Mon, 12 Oct 2026 06:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA79A10ED53;
	Mon, 12 Oct 2026 06:00:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E02410ED3D
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 05:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791784773; x=1823320773;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tc8rgCxd5s5CN98ltIMCwEh6mTsIOnKPnOSq1vhSSTU=;
 b=b/AnH1Bjy07IZlX1VL30gkSaDrB8VyJ3Kk4RQBNZjqTYAKUIF3k1uVSX
 X6jai8tccilowB1dHHoBAyvcJnBMCkDsO0/wj/IUtCQq/yyPbR+uSLgwr
 534BUIUhN7TAVRhJGYgL/psFPH4XTqCiDv7FWFRd/daW1xZOjCDA5Uu72
 tlvYmvC5m9MzfMmFpN8pyG18tYDq7kWBLd6WM7zGpMg5OBl6bWGT4IAj8
 5T0CnNnSgK75zMtelpG4CShnJmpRFQWvkSl+QbadO7v5u8C4cU5bDIX5z
 F4jaPnXkwMWpwFP8LaiogArWKW+xD2Q/cHdAHqPsA1pzljJqP6tzJzFmv Q==;
X-CSE-ConnectionGUID: FNm7GS9iSYyusUKDTEcynQ==
X-CSE-MsgGUID: KtUfaZsKR/GZ3uLueRl8JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="492170"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="492170"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:59:33 -0700
X-CSE-ConnectionGUID: rrvJxWcGS2+pmS8dRnaBzQ==
X-CSE-MsgGUID: w5R68JwyQHqU/Zvl+DNdWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="941903"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:59:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 22:59:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 11 Oct 2026 22:59:32 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 22:59:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xg3CP8DcczpaB55wvdprw7UbrHY+Hw5A1zNVrNFruYXuTsYyv+PIXrelTyxh2B8f7mO+a3PbLJ2HTPdtJYGxlQj1XDRbth6D7Gam67ENgSe4Ssyof6qaL0B2x09u+Ikzw24ufetkmn1ApNUV9Gg2rxQZwDUWLoMSM1tXwMrql1DV6qtq17Q6k4jk8nC/vn/oadoRbCcAMxNxPvpf+/KPJx029G7w2ZEHKwwOgf0BLJOPDYML0li52hGTQHSP/1Mym4CecEyN1n5iyRxPMyMB2G4vvfGLH8Kyatr1N0T/0kNEceaTcDsrZCt3kKtSBb828yG6vkiA7jrPO9N2UWnnnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuq1OAb7CBzKURYHsv+N6OFgVFJjDpunGWPbLK439GM=;
 b=E3+abKtL672UIS+EJX+pSf4d0i6gNdI6akfv/E4G5oKppBpsDeXlCiIgX+nkjJvXF1bg1BRMSMXqta9WtJtXAGstVvZEzw4Yb31rhrKvuT+sONc0jqbqVvS6adGWK/ywdqxY9+RJV1vabOzBbt7RlgWIDoJu7TU/n4qwvkF+ElMKFOKXwn6DakYHY7cGy9/llcSCrYdat5GSBN4n+1F/vXjHSdXS00xRhvfvzSssn4qj0LtzJZI6A2DBd9eyxP+NAi89ilonUr5Z64lP7U19hsW4X5P/+nPPqj7ME7CusVHNaQN7KtQ2qS3rBmMfLGt1P6wiypBrCKtJaiZMxP8Fhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by SJ0PR11MB4941.namprd11.prod.outlook.com (2603:10b6:a03:2d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 12 Oct
 2026 05:59:30 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 05:59:29 +0000
Message-ID: <fcbf40ff-fc1c-4fa3-8c8e-414614ef95f2@intel.com>
Date: Mon, 12 Oct 2026 11:29:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_vm: Validate host memory for
 overcommit tests
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>
References: <20261010134809.2844905-1-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20261010134809.2844905-1-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0242.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::9) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|SJ0PR11MB4941:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2cdfe1-6318-439f-297e-08df2825fa62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|10067099003|260925022911599003|22082099003|11063799006|260925021911599003|260925021311599003|56012099006|261009223027099003|5023799004;
X-Microsoft-Antispam-Message-Info: DJXyZD+pJMxcPkyOFVBZURoqpl0pYM1u8XafHiUc1qVFroK32wB+erRZP4aPaacx6L/brBs/agOWLT9GC0J2G8dAO+Yy9lGbkspKtb3++MnQeZYuqUh44RXkzYF7aVfPFJMw7mHo1C20bW9SCwuzxl7iFfuAtCnubHCPdLM2beNXf17C3LqnfZxtlWHg9Cu9cgYUwyKpollEcjmjZoqWsRDs/buzs8j22SzM5lUDrncuoD/oMDO7O3xzUTQPotCQ/yAwZTU7C2cEJe250LceNccjpaLQ/mekyVCqOlZx2sU6k+p4prhrkfENzzpIrkSTVJ117cNvbMYVbbqeDjamOcd7nuAeSni49FpisLHk1PTkQvyK1Ryy25xVjRiAzggFPY2zrq7MEj/grexcnb9N+nCfJlOivbPs/edMcXwMTd5Vw9k1cha0OaSRL8NHEGqjEGIiIxRzVIE+7lmRb80Bpui9eBuiyzE8vRjYjxDKnf+dAwl92m0ap6tv0/2VOZkZ+oPBeMJuEKoAwbzbJjx+9spQwLYmb3f2QHikM2A2vOn5DWiuv3ffAIbLWwrifzqnT7pg+O9KOSSJmQfkx5gUe4VaVHd+ey78s9l5nm6oqbEVhOPZ14QcnxMGsbi7k7TNp83VQXkdK6uEIkTJpGzx76U1eWuWJN8h9lYNtWDhYcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(10067099003)(260925022911599003)(22082099003)(11063799006)(260925021911599003)(260925021311599003)(56012099006)(261009223027099003)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VThkK0crOEFHbE5aMHBna1hQejhMMkQ2NTRBSURvdTYxZGZwbitUNE1NZDVq?=
 =?utf-8?B?eUl3ZWxaUUFYWU5PS0plSzRKbDVxaU9yajlJNFRsUnkyUVk4K01FMUZzNXFz?=
 =?utf-8?B?VmpzVXhQdE5SOXIrZlFLTUJzZTlnSHdJYzBNZkpLRmFURzE4VTZ2UDNORzY5?=
 =?utf-8?B?eXJMY1VWUnlCTXBqcjNJQUpXdjgyYTAxWGNYd2NnYzJ4R2h5V3NHa3dvbEF4?=
 =?utf-8?B?MWFuLzF0bmxZK2FiekhTSVJrbmVtbC9MZHBoMFgzOUZYdE41M0k1RTBoYlB6?=
 =?utf-8?B?WlBrZ0dQU3QyNWc0RHlHeCs2RUxwSVpoUGVYYnBIVXk0cEhVd05UQms2NTFi?=
 =?utf-8?B?NHhuS3p0ZWg4VTA2N1lDZVgyK010Q1pCNUdXV2h2ajZ2K2p2NGVFeGFvNDI0?=
 =?utf-8?B?ZkNhVVk1QkVKMFpwU1E4ci95bGZvQ3hwTHdzMkt1c1JVdURUYWltUkhJVWpN?=
 =?utf-8?B?RU1vNW5GeVgrZEZuZ1luNnhjcFkybk5QNk9NellQMVFpRWNHUlBHOXR0dGx5?=
 =?utf-8?B?bVZGcmJFTmJtYS9XT3E5Q3JNMnozWmh0dkhHV0RoS1F5K1lVUDl5SnRlZEJQ?=
 =?utf-8?B?Vk5RcEtOdzhyRmxmVHFhZHM0a1JUSFM2TjhlOEdGajZ5N0NIRHYzN1Jweklm?=
 =?utf-8?B?UEtJc0FENEN0WkJCTURZRHBrV0NpQm4xc3lmVDZsWStEbDNrWEJLNGpYVldi?=
 =?utf-8?B?aENmRmFDbTFEM1dGditEcHFIYkRQajZKVDRteEdsLzl1T2ZFWVJSWjBOQzJu?=
 =?utf-8?B?Z05QNkJUTXFmbzMzRDBBeU9qRDFoNXlmRUVBQlBPSTFjMGFvNk43bzJvZk1G?=
 =?utf-8?B?ZVZIRWhSeml4L2pFR0lMdlBneHR1eTZNeWl2VWUwK2tDWVRDYzVtSXY5bmpU?=
 =?utf-8?B?M1hYUmxPb0NmcDZkUmxkVGIwREdDb3lQUnNobllja25URnp2THYycERnSmVr?=
 =?utf-8?B?eGVzU2FHdDFkMkRFNTFzMlRsSkc4OUZjd0NXUzZMYnh3OFFPWE5yZlFxVUY0?=
 =?utf-8?B?YUpVY0VDZElxZnFEbml1R1p0T2R2N04rNmI2Vng3VmgvRVhTSVZaa0tSaEtv?=
 =?utf-8?B?U1FqY083dmtXWjlMQmgyUHNvZDNXUEN1VmhzQ3krUzIrMU1JUm4yZmtFcVlM?=
 =?utf-8?B?N3pOQzhhU0lWNk42cjBEb3J6SkxPSEdqYVlUcVRPZ0RlQXJ6YmJoQ0Z1S3du?=
 =?utf-8?B?NkpLQU16UnNORjFSN21RNzRpNFBpVHJWaWhJRVMwSExOYlQ4TnFPQ2lWWTlG?=
 =?utf-8?B?N05EZFJzZDAwMmExNUdTZTgyVnRmWld0UzlTTHpiS2dBVEF4TWNjVGI0QTNX?=
 =?utf-8?B?UTQ3bjU2aGhkOGNoMk5uam8xYjBvM1F1WHZRQldRUFB1QTRqaEh0M1R6ZDY2?=
 =?utf-8?B?c2YwS2tlei9NRjN2bDZwLzh6L2lNd2xWZUZRQjdSQjBERXFrVkJMZHhTdURR?=
 =?utf-8?B?bVBNOTRja20wS3Izc1BqOUNaR2lQcWV3Z1Q4eHpWTEVLZ0xUclpYeU1Taklh?=
 =?utf-8?B?NnFGSDY3Z2U3Tyt2cGsyUUJrcE9CMFJ1N3NWZ3hLbWpuMmNURWs1Z0lLcnQ2?=
 =?utf-8?B?cEQxSFVabWRMZnpMWXB3Vk9QT3U3L3c5MkIybUtHeDBGbGRrM1RrMXA5YVd0?=
 =?utf-8?B?cWJLZFdVUHd5ZXQ2QXdVdFBXOEk1SHhReER4dGNXV2dmYzAxaDA3TjdnbmhJ?=
 =?utf-8?B?eWtJVkFLNldnZTlNemdyTFo1QnM3eE9OaGdZKzNMWThBVFRWcnVUK2RYNFJF?=
 =?utf-8?B?aXhTUGtyQ1Y1UzJHN09YZmpRVEtzZUpqZUpqYVJxbGVFNGhhOUF1d2dLUGRu?=
 =?utf-8?B?QW1GQ0wvblVZSVpPeEdxT1p0SVlpZTFTNTZQZElmMnRWTWM0VTJJbmI5VGxY?=
 =?utf-8?B?MnU1bVBMZHYxNFZJclQxS3QyQ0FuckVQazI0cnh0NStLakJrZnZ3cWFEOGtq?=
 =?utf-8?B?N1d4KzN0VmM2K1IrYTNOaStkaDllNGNUaWdwS2IydU1yU3o0cUl5TUQwRmMw?=
 =?utf-8?B?Y2c1bzhBamszNlJmYk96SkpCclNMZ3JvYWtwU3JjU3UvQ1NvamI2MkdwenFN?=
 =?utf-8?B?WGhwNzZLUHExZHpHWExyZldHdlVlWno1RXJuRzh6VGR3cmNLOFBINnAwQ0xk?=
 =?utf-8?B?UUhSMWxWUU5xRUpJc05ua0JTSmZTc0dnL2hJbm43UWE4VzhIWklFMVJHUGlh?=
 =?utf-8?B?RnZYU3lKS2pxZ2M4N1Zwc2hVNXNRVkxvMkpNcHdKcUxoQ1NSRlZ5U1NYSVhM?=
 =?utf-8?B?cWNXQzliTlR5OHA2YWE0d0J2U0ZlTzlWNGVreE1ZajJvTXA1RzlVajlwakFY?=
 =?utf-8?B?eXowSlNKV1FOL0xlNzFXYnVRU0lybjhzT0dvZm1ZWGViNHVDR2Nqdz09?=
X-Exchange-RoutingPolicyChecked: sLPt9Dwz0BG7OdASZmdl90rI/ibIq/badEp12Set9Tmu3VvUn33dvjoTevLlIU8SzlNdFcnXsU7M6yyv2yYREdDp/A1dBQ36j/g9aIsZ42HRpsJRV98j9aGZ3fJSckNG8UUqlktIyUMoRmKe3ebEMe7wOXz325Qu4rCYySrsBHK1QFiGz0xIRqaI/fx7YZ7uBvqBC/GZZGNRdTiIfO6rhSA2AXDRFThSN1/R7KBw4QQ8LLw0+z6mm5SEosgpnyYL3vZzP6XykXfS+mFnQ4oeZ5cs/aVzva58D2DjvDuy74mHuKjF9Oh9Yyw1gT+rwRYgR9k/xvS7rAkuvy4u7BMQqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2cdfe1-6318-439f-297e-08df2825fa62
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 05:59:29.2892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQTHBBcISkdMJhnwpfmYith7CfH2XZQvuO4n/0lFrFS3Ka3JL9zKu17ilZGRBg++fGB6TgN4og9ypTXHwxhRLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4941
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


On 10/10/2026 7:18 PM, Sobin Thomas wrote:
> The amount of VRAM available for the overcommit tests varies
> across platforms. As a result the host RAM space required to
> support the overcommit workload also varies based on eviction.
>
> Query the platform RAM space and visible VRAM before running
> overcommit tests. Limit the overcommit working set to 50% of
> the currently available RAM.
>
> v2:
> - Base host-memory requirement based on the run time budget
> - Drop user_vram and SRAM Handling; all the cases are VRAM
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_vm.c | 48 ++++++++++++++++++++++++++++-----------------
>   1 file changed, 30 insertions(+), 18 deletions(-)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 1d109e783..5598c8ae7 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -2385,10 +2385,10 @@ static void invalid_vm_id(int fd)
>   }
>   
>   static enum overcommit_stage create_data_bos(int fd, uint32_t vm, uint32_t *bos, int num_bos,
> -					     uint64_t nf_bo_size, bool use_vram, uint64_t data_addr,
> +					     uint64_t nf_bo_size, uint64_t data_addr,
>   					     uint32_t bo_flags, int gt_id, int *num_bound_out)
>   {
> -	uint32_t placement = use_vram ? vram_memory(fd, gt_id) : system_memory(fd);
> +	uint32_t placement = vram_memory(fd, gt_id);
Here if vram is not available (iGPU) it'll return 0 and bo creating, 
cpu_caching will be happening using 0 placement which is wrong. 
vram_if_possible(fd, gt_id) should be used.
>   
>   	*num_bound_out = 0;
>   
> @@ -2497,7 +2497,6 @@ struct vm_overcommit_case {
>   	const char *name;
>   	uint32_t vm_flags;
>   	uint32_t bo_flags;
> -	bool use_vram;
>   	uint64_t data_addr;
>   	int overcommit_mult;
>   	enum overcommit_stage expected_stage;
> @@ -2510,7 +2509,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
>   		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
>   		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
>   			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> -		.use_vram = true,
>   		.data_addr = 0x1a0000,
>   		.overcommit_mult = 2,
>   		.expected_stage = EXPECT_BIND,
> @@ -2520,7 +2518,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
>   		.name = "vram-lr-external-nodefer",
>   		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
>   		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> -		.use_vram = true,
>   		.data_addr = 0x1a0000,
>   		.overcommit_mult = 2,
>   		.expected_stage = EXPECT_BIND,
> @@ -2531,7 +2528,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
>   		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
>   			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>   		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> -		.use_vram = true,
>   		.data_addr = 0x300000000,
>   		.overcommit_mult = 2,
>   		.expected_stage = EXPECT_NONE,
> @@ -2541,7 +2537,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
>   		.name = "vram-no-lr",
>   		.vm_flags = 0,
>   		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> -		.use_vram = true,
>   		.data_addr = 0x300000000,
>   		.overcommit_mult = 2,
>   		.expected_stage = EXPECT_EXEC,
> @@ -2553,7 +2548,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
>   			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>   		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
>   			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> -		.use_vram = true,
>   		.data_addr = 0x300000000,
>   		.overcommit_mult = 2,
>   		/*
> @@ -2568,15 +2562,14 @@ static const struct vm_overcommit_case overcommit_cases[] = {
>   
>   static void
>   test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
> -		   const struct vm_overcommit_case *c,
> -		   uint64_t system_size, uint64_t vram_size)
> +		   const struct vm_overcommit_case *c, uint64_t vram_size)
>   {
>   	uint32_t vm = 0, *bos, batch_bo = 0, exec_queue = 0, bind_exec_queue = 0;
>   	uint64_t sync_addr = 0x1000000000, batch_addr = 0x200000000;
>   	int i, num_bos, num_bound = 0, bind_err, create_ret, wait_ret;
>   	size_t sync_size, nf_bo_size = 64 * 1024 * 1024;
>   	enum overcommit_stage actual_stage = EXPECT_NONE;
> -	uint64_t stride = 1024 * 1024, base_size;
> +	uint64_t stride = 1024 * 1024;
>   	uint64_t overcommit_size, off, data_addr;
>   	int64_t timeout = 20 * NSEC_PER_SEC;
>   	struct drm_xe_sync bind_sync[1] = {
> @@ -2607,10 +2600,15 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
>   	uint64_t *user_fence_sync = NULL;
>   
>   	data_addr = c->data_addr;
> -	base_size = c->use_vram ? vram_size : system_size;
> -	overcommit_size = ALIGN((uint64_t)(base_size * c->overcommit_mult), 4096);
> +	overcommit_size = ALIGN((uint64_t)(vram_size * c->overcommit_mult), 4096);
>   
>   	num_bos = (overcommit_size / nf_bo_size) + 1;
> +	igt_debug("Overcommit sizing: case=%s multiplier=%d "
> +		  "vram_size=%" PRIu64
> +		  " MiB overcommit_size=%" PRIu64 " MiB "
> +		  "bo_size=%" PRIu64 " MiB num_bos=%d\n",
> +		  c->name, c->overcommit_mult, vram_size >> 20,
> +		  overcommit_size >> 20, nf_bo_size >> 20, num_bos);
>   	bos = calloc(num_bos, sizeof(*bos));
>   	igt_assert(bos);
>   
> @@ -2632,8 +2630,10 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
>   	exec_sync->addr = to_user_pointer(&user_fence_sync[0]);
>   
>   	/* Create and bind data BOs */
> -	actual_stage = create_data_bos(fd, vm, bos, num_bos, nf_bo_size, c->use_vram, data_addr,
> +	actual_stage = create_data_bos(fd, vm, bos, num_bos, nf_bo_size, data_addr,
>   				       c->bo_flags, eci->gt_id, &num_bound);
> +	igt_debug("Overcommit BO creation: case=%s actual_stage=%d num_bound=%d/%d\n",
> +		  c->name, actual_stage, num_bound, num_bos);
>   	/*
>   	 * On EXPECT_CREATE nothing was bound so bail out entirely.
>   	 * On EXPECT_BIND with no BOs bound there is nothing to execute either.
> @@ -3499,10 +3499,22 @@ int igt_main()
>   		const char *mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) ?
>   					"fault" : "nonfault";
>   		igt_subtest_f("overcommit-%s-%s", mode, c->name) {
> -			igt_require(xe_has_vram(fd));
> -			igt_require(xe_visible_vram_size(fd, 0));
> -			test_vm_overcommit(fd, hwe_non_copy, c, (igt_get_avail_ram_mb() << 20),
> -					   xe_visible_vram_size(fd, 0));
> +			uint64_t vram_mb = xe_visible_vram_size(fd, 0) >> 20;

VRAM-size query repeated. Called here and below in test_vm_overcommit(). 
use something like

uint64_t vram_size = xe_visible_vram_size(fd, 0);

uint64_t vram_mb = vram_size >> 20;


> +			uint64_t avail_ram_mb = igt_get_avail_ram_mb();
> +			uint64_t ram_mb = igt_get_total_ram_mb();
> +			uint64_t required_mb = 0, budget_mb = 0;
> +
> +			igt_require(vram_mb);
> +			igt_debug("Overcommit sizing: case=%s multi=%d ram=%" PRIu64 " MiB\n",
> +				  c->name, c->overcommit_mult, ram_mb);
> +			igt_debug("Overcommit sizing: mode=%s avail_ram=%" PRIu64 "MiB vram=%" PRIu64 "MiB\n",
> +				  mode, avail_ram_mb, vram_mb);
> +
> +			required_mb = ALIGN(vram_mb * (c->overcommit_mult - 1), 64) + 64;
> +			igt_require_f(required_mb <= avail_ram_mb * 50 / 100,
> +				      "Overcommit needs %" PRIu64 " MiB, over 50%% of RAM + swap %" PRIu64 " MiB)\n",
> +				       required_mb, avail_ram_mb);
> +			test_vm_overcommit(fd, hwe_non_copy, c, xe_visible_vram_size(fd, 0));

Target and BO count were being recomputed. It can be calculate BO count 
and Target once and pass them as argument in test_vm_overcommit. 
Something like

uint64_t overcommit_size, bo_size_count, require_MB; --> randomly used 
these variable names, change them

int number_bo;

#define OVERCOMMIT_BO_SIZE (64 * 1024 * 1024)

overcommit_size = ALIGN(vram_size * c->overcommit_mult, 4096);

number_bo = (overcommit_size / OVERCOMMIT_BO_SIZE) + 1;

total_bo_size = (uint64_t)number_bo * OVERCOMMIT_BO_SIZE;

igt_assert(total_bo_size, vram_size);

required_mb = ALIGN((total_bo_size - vram_size + ((1ull << 20) - 1)) >> 
20, 64) + 64;

test_vm_overcommit(fd, hwe_non_copy, c, vram_size, overcommit_size, 
number_bos);

overcommit_size and BO count computation can be removed from called function

>   		}
>   	}
>   
