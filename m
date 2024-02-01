Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DB5C4828C
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 13:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECBE10EDEE;
	Thu,  1 Feb 2024 13:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsufmktQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D38C10EDEE
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706795539; x=1738331539;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NyGNJt4gn3kyouWbI4/FsAJToo+EoRs5OlYZmEh+Sm8=;
 b=VsufmktQ47DcT8JauE4gOYGWW0gFfJZg0og7Mw7Ssw8jzh01T1UfvrWH
 Uc69mT5QYw+6LCK8xJElvamoNZtCQY7K1n127DnuA/yqcenDzo4VM+JH4
 +w2dCB9hOCGXxsUYsskxrbSQ+1wlXBe70KLOgIArT9dGgar9aWPS0/dYZ
 Mmw2U7+UPZ57gWn426xNkoMBY3HLhxp32FeZqH5VrS8Q5L0o+TKBMnhmU
 9ua+73qotG53J/YJBoDHFD08kE1JHnQKfA5IH64p5banV7obaJZJkCVRa
 1J80/anWoreaTDh7ofS6EbXtOvq+g7XgNUwk8kpaq/5LEp+7FN2aH98qI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="114678"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="114678"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 05:45:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4387988"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 05:45:03 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 05:45:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 05:45:02 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 05:45:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/9EE3W5VWdnY+eYqz9vmckz4f1b02rqpUTZYs9tPmT/HgXwbvoyFZ3ZIRw4PNHqcyManSlIvt8DupPQ7zDDbezJKKQSbRZA1ipddz1ve8r0ByGsB7CgKEURrsAAoJoNoC408IXATo98xapEC2hFTw5ns7kkDtx4EAqbGCakC7BiiBgN3/54jSThoFyMjvUXVtc2VVk9TWTZ4PVSupTUaPiGdTJo5jfZ7xWsMkiZaipUgelwzI7jKYGXeLcQbjOijR4sOAJh8dyLkuzQts3w46DLjcw4VbB4HrMEG7xBynTbffkMY/nNuIYXFc3DDsyS5tvpR/QzRfBSz1z/ll89wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgcWJFnuhixcjcpPoldf5pE6/I2lMVstikVXvJ7lfTY=;
 b=jGikXLyjL7fC2zZ63jg9hk7EuZX9IU0sr6zioXiESjaHigFEYdZyFEZuljhbweWbz87eZ2ii6zQje+jZoe3tZIi1ED+6v5o4dJQzb7rk/6/uG6JArIg17ltjQI9pYmfOgBng5eJw/ZNQySLSQXI6BQ5hT3+U4WDKLJHDAef6kqDBwnEgMi+HHI+z8s1tAEMWKg4/jBMC4cZ6lRUH8fF6jcF6ymdS4GBzhoJwV4q30Ir3B00Blz6Ht5usb3+XG18RDuTEqjlO5cGZXh5fXutCUmYkyXn2kKhUIpQsy0fGYgpiPssFyfLWSeDbBuET74MxPpZkJDfVVUfatH44Q1wE5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by SA0PR11MB4542.namprd11.prod.outlook.com (2603:10b6:806:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Thu, 1 Feb
 2024 13:45:00 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566%4]) with mapi id 15.20.7249.017; Thu, 1 Feb 2024
 13:45:00 +0000
Message-ID: <4fcf8c7a-5e30-4274-9565-2973b30f154b@intel.com>
Date: Thu, 1 Feb 2024 14:44:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/5] lib/intel_blt: Change surface size
 calculation
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Karolina Drobnik <karolina.drobnik@intel.com>
References: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
 <20240201100724.257845-3-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240201100724.257845-3-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0226.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::14) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|SA0PR11MB4542:EE_
X-MS-Office365-Filtering-Correlation-Id: 7920be06-178f-4739-474f-08dc232bfc36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZEFJbQB5FqdwJY2RvHvCTgW2Vjpxr/TiYvjBvrkjjemSWV/HoYzR8neFMrepWPp61cHawOQYzyGnpttTdYhY45NjuXfnVKQy+E02SOru+fGYPVBUtLqFdlsuG1IYi1L6DZNAslBNcwW/OnBYzutoslfjidyA6SmFUz9+ThdhYEqYPf5xnhXdrJBrae9EKgTvkNL1RW3m9fNryrijboCKAH5VywXWNiRmdoiL5kdNUIqNjRL1TZztDSPoifq9g9xoQPKPm7laUTfgeXYRfhM2rGfVToNQZBXhkAJa0kDZJFI67T9jhpYEpPchk+OELS8c9lIQwd4NQnVL8EnCtUVGgFJBZeFS1CY5Y+cmz88mceP+YQHjaVqAVHpArGWwkzEqcoXx61cRAaz+z9LowLrFavvBbY5m5GdDp4V050QCjcXM1lYcNbeFlMpTCdr4KO8aIe/ucV8Q8ntt03ACpMuTPfdQFrdItm6CVKzvnI2sXwUNFdLN8ZbzpJVNWiRVM9kIMTs17m0dQq+V5C04cIV7RcXaWxFgsQ9Tz+Dp7YcPLJq3k0+m+UjakAVg0tmXy50bj8D1XxhWF6EuJ6eTdqSm7Vp+lqKkKEEFHAY7fcIlDfaZpP4k7pFryVUu+DSaqohFthrxGr4DTWolyGAhcv2ReA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(346002)(136003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(36916002)(6512007)(53546011)(6486002)(86362001)(31696002)(478600001)(36756003)(2616005)(41300700001)(82960400001)(107886003)(26005)(83380400001)(5660300002)(2906002)(66556008)(4326008)(316002)(66476007)(6666004)(6506007)(44832011)(8936002)(38100700002)(8676002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGFNM2NsRzg2aDNPZ1BBVFRtbTVrTkM2RWh3d1FiWUp5L1lGVXhjWDdEMEE4?=
 =?utf-8?B?ZDdFSzhCWnVPZmlTeVpRRjRhTVU3RU5MM2tvMk5NTkNnTjA5Umo4Nmg2cHBh?=
 =?utf-8?B?SVhMWFBUakFPZnk3SGhDR2lMTE42ZUVkejN5T0lEcER3RnhCbG9YbzN5NVcy?=
 =?utf-8?B?L050czZFNlRESDZjQlIvL2xEWTVCUVg5NVd0YzNMMjNEaG5GcFZnT05Bc0hv?=
 =?utf-8?B?dWwwbVE2bnpJRHdOTzVWcWR4cHhyQWNvMEVzRTV5TVJIL1ppQUFiNUl5UElV?=
 =?utf-8?B?eWdyMkR6YlZ6VDJKeTEwMndWS3M0YjlEM211WjZqU2x3L0lWSjdHS0pYdmNp?=
 =?utf-8?B?WDhNWXRVQWRTYldGblpVVGRPNGhEaFBvV0UvRmZuYjJBOEZJQW93eTVuRjJI?=
 =?utf-8?B?dWRudGtGbE1aZGl0NzZhT1kwbUJMbmtzQ1NPZkJRV0hudDZjTVJoR3ZSSGZi?=
 =?utf-8?B?em5wNnRZWVUyVTRCczBZVTkrTEcyeEFNWUtVdEgxSlhQUndYemhwNU8zSUN3?=
 =?utf-8?B?MVJLRnF0dnROZ1VtRk40SzZ1MWUrVkljU0dURnczNzRCMEEvWGZPS0NSSDJt?=
 =?utf-8?B?V2ZzT3haLzMwRFhiYVFSUVIrYUZsL3dZNktPRDRLZmNqKzh6N3ExT2lZV2dO?=
 =?utf-8?B?SlcvNjBtZjhOZzM4TmxJeGk1RERXQkNHbVBDTWp6c0tWUkltVVB6UG1KbVhF?=
 =?utf-8?B?ZDZzSDNwWEhyeWk4c2hvNk5PQkIrWmxJempGdklmTjBFMXExcWdWMFJaYklk?=
 =?utf-8?B?enFFSGpXUUtRMGhpTm9FK0x2Y0hKOXYxTW9VYm9jWmkzLzdPUFRFV3BsL3pH?=
 =?utf-8?B?NU0wbHpIcnVOY0h3b3lld2orWDF4cUNQbHdKdWdwcGV4bk9PejRuWTBITnN6?=
 =?utf-8?B?dzFDZm43TUR3bzlQeGhhZlRmZW03MzlpeE5VK2xlL3U4V3cyd1lkQXlicXpz?=
 =?utf-8?B?RnErTlVjN0VaL1Z5Ri9NbGg5RC9YOEpoN2ZBemU2U3RCckR1SjduR1Bab3Rp?=
 =?utf-8?B?c2N0cVRIeUtvb1N0NjkzSnRDMVJ3YUF4NTBkdXk0dVY2N1U1RDhORGhOcjdV?=
 =?utf-8?B?emJSOHRBUXY3OFRsZllmeEdwbEVUOVo0Nmx4ajBhOWdWU2tZckQyMjh5NUhr?=
 =?utf-8?B?T3RmMVJ1V25VVmM5L1plbk9ISWdGV2N2NGUvSlllcmhUYlNuSnpGUExSaGlI?=
 =?utf-8?B?WkpRNk9RUE1IcmVlWVovMTk5RTRrMStQb2RQamE1RmxUNTRMZlBySE5qK3M0?=
 =?utf-8?B?TmVyTGtMdDVrTGZHMmFuTnFUQkFhdEtpRE15bURHclBkcW1WWjBsTEw5SUli?=
 =?utf-8?B?ZkppSEV6U2hvelArT3VyaW56LzFIOCtJSHd0cTJYNjROSEZhWDJHeVNPYVNP?=
 =?utf-8?B?MjNaSlFFMnA1OUwvRHdtbE5UUXBvL0xMTnpnL29nbW9OMHlmd3BYRXRwRzM5?=
 =?utf-8?B?NHg5S0hDbVFJejJmaS9xL3haRlkweEVudTJZMjcxM0ZMZ0FQSjNxbmRVNGhz?=
 =?utf-8?B?eHJqcHNlRmNRZnZra0dXekxUeTdnSmdHMEJYbUhJQVNmTmVqY3ZpNHdJRW1T?=
 =?utf-8?B?aHhZRGV0NkFLNTRCcGxoWlBHL21HNkxqOEdyVFVFTmFTcXZmUEIwdW9leDl1?=
 =?utf-8?B?Q1FiRUdyTC9xc05FM2ZocVZqa0JWTURpSlcvTE81b2RxbnI4K3dqckdMM3Ba?=
 =?utf-8?B?ZUplSFppNDhyakovUmZnOHlhUjJwQXFUeTlMRFFMcG5CUWVqRGczWGxlZ00w?=
 =?utf-8?B?RmZtRFVMenp4NUVIQUViVWxZN2o5cklhcVRzWnBnWXJ0NGViVVh2d2dUQTRS?=
 =?utf-8?B?czhYYktTbGRRRks0b2xYaTFDekpWN3VleURrZHZBVmlSYkdsQ1l5SUlMMUVQ?=
 =?utf-8?B?VmlRczYwTnlUYWtxS3lCdnMrcFY3K0k2VnovWTkwbE1UOVprSXltYzNNQlBa?=
 =?utf-8?B?eVhUS3lDOXBpZlMvamJvcUNudEZDSXZtNFhjTU45eVhuYWllMFcyK09iSUVa?=
 =?utf-8?B?SDB1TkN6UkJEU1VIcjM4NFltRXY0cC9aL0ZpN2srcWNjTFhVQ1ZBWjdPbkNS?=
 =?utf-8?B?bUVmam40MGE1UWt3UjJZbkNQaFpjMmM3Q1dvREJmZFFSWTN5NS9Tck85RnMx?=
 =?utf-8?B?eHVDQlZyM1BLdmVPVWU0WFdjSzM1UnNObFhqRDRmamJuSHpuTStDU3dwaTF1?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7920be06-178f-4739-474f-08dc232bfc36
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 13:45:00.3202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVt5miWHxc7yfFzQjAXALwiQ8snSsG4Vg4rannaY574rITN1JwXJ1+yyGGYAqslZnvVMriIUb//ALc1RJwrjYjjShvsqfMaxMvyjcuqC/yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4542
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


On 1.02.2024 11:07, Zbigniew Kempczyński wrote:
> For tiled surfaces we need to ensure stride and height are valid
> from the blit operation perspective. Calculate required surface
> size according to tiling constraints.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Drobnik <karolina.drobnik@intel.com>

I'm looking at blt_set_geom() function. We still pass normal height and
width to it. Is this correct? Or should we change height to
aligned_height? Because if we should, this patch should be updated to
reflect that.

If that's not a problem, then:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> ---
>   lib/intel_blt.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 13b1dbba4f..00208fc243 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1858,13 +1858,21 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
>   		  bool create_mapping)
>   {
>   	struct blt_copy_object *obj;
> -	uint64_t size = width * height * bpp / 8;
> -	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
> +	uint32_t stride, aligned_height;
> +	uint64_t size;
>   	uint32_t handle;
>   	uint8_t pat_index = DEFAULT_PAT_INDEX;
>   
>   	igt_assert_f(blt->driver, "Driver isn't set, have you called blt_copy_init()?\n");
>   
> +	stride = blt_get_min_stride(width, bpp, tiling);
> +	aligned_height = blt_get_aligned_height(height, bpp, tiling);
> +	size = stride * aligned_height;
> +
> +	/* blitter command expects stride in dwords on tiled surfaces */
> +	if (tiling)
> +		stride /= 4;
> +
>   	obj = calloc(1, sizeof(*obj));
>   
>   	obj->size = size;
