Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36B0CD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 14:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3DE1133D3;
	Wed, 10 Apr 2024 14:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJv3JbUh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5A81133D4
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 14:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712759820; x=1744295820;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7OLzc36+jtIVQthvlgZFdpCXLyHlzuz9+gnILxl54Kc=;
 b=eJv3JbUhJNewEXbQ+ZCe0B7DzullJqsMq2Xg3KllvWdN5Mg/nX+mtCnR
 /Fj43G0NJeNr97+krbACyBIxPd02Q0xJRbIz8hwKfDtmEMWFtUWFE1jqf
 knBlrPjajJXc0FQ7PF3BtiL2m1MwMgMmmd+66ld/GTSWCyFfiDm+Avsoi
 F19ZhULqanus5zfeFxo46rufPM+sd9IEKIdIQQgSpqF1FQqUXjswrDvWJ
 ZigUDfKq9zFdM7kff2jqi8Z9ZYMrWRdODoyzj3mDNs4D748rdRdH6U/AM
 B5FFd9aMvJU52u7DHWcT68vCCP+dn860cdl94m9mAt4VU1OYs7kyr314Z g==;
X-CSE-ConnectionGUID: U2p4HJzYS5yE5iicg/4Leg==
X-CSE-MsgGUID: yapJR2TpTzuu0HIg+JpxoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8694123"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8694123"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:36:59 -0700
X-CSE-ConnectionGUID: wabdpPawSPa1KYL6xnYMyg==
X-CSE-MsgGUID: Z9+QkP9GQWKkYeWl28KWFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25347169"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 07:36:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 07:36:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 07:36:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 07:36:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oR+B2+GiGadvAfsAXnTB0c4i7ipQovmNlc8LhvBoKMwiAkzyaimqvDcOey1kT0B6buONbL75KXFsElzM+RyJ5BvJmB2KVY1hUXCNRxUC5jFXdXSZbqAW+gVYTXkTjp9jODQuZ4CN8+XYvSkqeRYo56IIMvzE79lJF3EzZgYw/Kf146NKm00q6hHsxGGNx76sAkKVzjXM5GeoIPikMniFsi9cSxhzmuTHUNrp/Dt3wtgbjTPPI7d+f3hzBDsY63RN4KiFEwYCqukGWlpJPKWjI9uESUgK6Fi59VAOS3ZpOJNuvcIJ5Gn4D/5s1IBxCX4wb9p1l2fB1AmyEs7o0ZnBeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10v8Z1yG82fajHmifEu2FDmADs1AgHlgb1xX0Sj/xBg=;
 b=UXlbAzT942ty1KUEGJa2JQKH5v5PN1dI2xBMPv40UtXLVHupucQf3/wWQmw89eyYYWTa8yv+NAsFIGSvAHG1aD7aLaG+vsAEiZyZwndEDBjnoLlx0tq0riTkzK+NED4uWmpFil/RzeGY88kEYUxi9UPiVedyExwEcKL0NZBNlj+6n4ZUINSWfvvNDHUExWJhykBkZruj0Vm2G+C0qSYETPHuvoqd3HcRgQfuUfraXX62r5DujZ8y4o161/H7o9MNOcHImy4Tz2Te1H18wXZUxN9i+SwOzJ29P86DtOxNgM+it5/zTJdWp5zh7qeNG2VbiaofGfo+2Txhp0bU5I1XyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by PH0PR11MB5062.namprd11.prod.outlook.com (2603:10b6:510:3e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 10 Apr
 2024 14:36:56 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d%4]) with mapi id 15.20.7409.031; Wed, 10 Apr 2024
 14:36:56 +0000
Message-ID: <b0ca33e8-7207-4af7-8842-ce94eac1b4e2@intel.com>
Date: Wed, 10 Apr 2024 07:36:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] lib/intel_blt: Add functions which extract
 and check object ccs data
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Karolina Stolarek <karolina.stolarek@intel.com>
References: <20240410100915.48541-1-zbigniew.kempczynski@intel.com>
 <20240410100915.48541-2-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240410100915.48541-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:303:b8::22) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|PH0PR11MB5062:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eFE2sobiXLPWTcyBtHVYX+dusOMHoX2Uqn9LCKtRIWaJt3nS3NJPtvqQoYSIoFrdI/DdQdj8+nMe3xzgXiauAxlz4rGp0Tw1/Tr+DUf5FKBmliyfjHzQkhCuIYY+TRg0njGDNDL+EBq1gQ6W3OhZT6ns9G4uCOJdD6AC+Nlb8aSPGdo47Vc+zbun8ufV4c48e3DgoXp3YWUM//ZOgepkn4cofDBSeByzeK1npzfuFa+94A11k3eaOm73btFRjXL9nLgArpk+zNQjfHtic0mg0EL1R0ii6AEQ0j4ykJcWfYJO6NyodyfwVOqaWcAwMDe1+TAA2UBg9B2Otr1eXiAChnDh7eP69pXgClLztXnctiazR4IllgaKqcKqLRjw+jBxiVumASBpzpsjHqK3WhGhbhFm613OTAWsX5a4be+PMgTZZ6g7uva3Xyy47yRBjwUCNCG07iFtqJDDi54MGNoR37Ya0x0s3RcETwdb53DBlk+VeRxh4bLB9AObxCqcAtv3j2hAFeHQyAYGwmO4dXhLGQshAwWhVUQ4XOu8uo41fZnbIoxcQDuZ9G4+ewgHcN+VJQ/ZC2IRP7cj8MECGy28+HWlXWbv6Syp2zXdhaFOSWJNYCUy6ZrYwz4dmNd48PixO7rjNxB9a1eC8vYSA3DR8zfPA+62DNR40/tPVXXpZlE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OCtpWXNDSW5uNmh5YmRWUTN2TmM1MjYzdVY1VjEvaGpNZXZ2SmZtNm1Zc09E?=
 =?utf-8?B?Q3lzMXdvdHEyaWI4b28vclJqSWN6aGFMbUQyNEZGajNuTUFIbXJYQXFVK3dG?=
 =?utf-8?B?aHNDd1hFZm5jY1F2YlBDL2dJMHZzZDF1bW11Uk9FdklLNExmZ0kvQVBlM2ZB?=
 =?utf-8?B?WW9wUlhIUlZOTnk2UGRrR1ZqUC9tNHJLYmZTTXVkR09mL3N6ZVI4ZVJRb0Jo?=
 =?utf-8?B?S1VjU3R2dERJYXVoNko3d0F4Z2N5K0VZYXVtVXhsSHBFU3hCM1BsSDhSRVlR?=
 =?utf-8?B?c0NORmx4U0hQaUlPU3dxZ05oVU14am14UkZVUDNJVFUxR3drMnhYTFNPdGVs?=
 =?utf-8?B?ZWppVThOZ1RlTVVMT1ZJci9uTVVJRHJxNXg1Wkk3cUg4bDZPcDFZQ2pDRWFS?=
 =?utf-8?B?N0Vhc3ExclBmaXFFdkZhWVZGdG80TGFRdW5leDhuOWdscU1MaGdXdjdMK2lH?=
 =?utf-8?B?UFNnVVU2aHN2MGJRNTl1OXlDVjNGQ2duTTVEZHU0U25NWGJ0d2NVaW4yOHZq?=
 =?utf-8?B?Q24yRVFORzRRWDFFeW1FZ1JRMUh1MlpDOW1SSVhtaHpDVStFekUvYXM1eW5j?=
 =?utf-8?B?cFU5c01SUTAweW1IUDJoY1M0OXpVRW5iM2I5V2x3NlpiK2FQZ01iRHF2ck1F?=
 =?utf-8?B?Z211TlN3RTF6WHMyK2tCWlMwVXFacFJOMmhTdW02dCtlMDVOdUZYa2FZM1RC?=
 =?utf-8?B?WnRwdi9FWTVZOVRhbHRzcllralNXYUpPY1lvWG1FZ0dHUUhwaDZudGJtZ1Zt?=
 =?utf-8?B?WFJpaHhQUE1zUytiT3BwYS83b3RJRHI3cVp3ektoUm02NkY1Z1JXTWkyc1FC?=
 =?utf-8?B?TnNxa3NZRkllck4wY2lYVDM3SGFBVURNenNrbzlLUjdVUW9aQjBuVmFwSFRD?=
 =?utf-8?B?bnBKTVdkUnFtUTcrUlhQVE1hemEzNWl6UzFISEN6M013VjJVdlNVZzRnK3lU?=
 =?utf-8?B?SW15VXBJMlIvVXhQc0Rldjl2SFVQNmFsRWpXL1JRUGJPUnJ2dlZ4QTNRWFNN?=
 =?utf-8?B?WmxWRXg0QjloV1lxUVIvREl0bElOVnBkV3gzUitHSEtJVS9NSmtxVU5oWkFC?=
 =?utf-8?B?Q2xkeHkzVW02alB3cXdsZ2FjTzNWa1dxcnB3SGRYQnRvSHdmcUk1RGxWOHNm?=
 =?utf-8?B?ZTlvSnY1Z2t6RHJIci8xUXRRcmdrK2twMng4RnpkamdXdXY5L2hVamlhd0JF?=
 =?utf-8?B?WVA3Q1JEOXlFVzNqY2svd3RTYkNLVzJUSlIrcGhtVHJHSkxyM3pJRDZnaFVC?=
 =?utf-8?B?ODVsMmxMZDBzUlRraysrZEtSVzdRTCs5d252R1VIbUxiejVGRWtsL2hiVUM1?=
 =?utf-8?B?cVV4anAzQkhLM1AvOGVCVWp4U0Z1amVVNVphR3VtRGtrbm41SG4wM0UxVXpD?=
 =?utf-8?B?bmJTOVA2cjkvZklibWZVU0VxMVlGVk1VcEpLRGw3L3Azc2FSQTl4eTB2ZXRz?=
 =?utf-8?B?eldEUzhtSFpXb3JqN0RUcmZvcStQQmJGaG1vRGdUSHZteGZEV0gwWXFtNzln?=
 =?utf-8?B?Nk1Kekt4R0tNeXlpVEdqMU5vT2ZsdDZGL29TbUpQUUV0RlJ2anYrUnpiZmpz?=
 =?utf-8?B?Z01VZkR1NzM4ditqb0l4YVBaZGlESFJKWTBzQUw3b0Z5N2JsWjV5REhOR3dX?=
 =?utf-8?B?SlRiQU1MUWxyTGZXWitHcmxwNmUzbjk0WGFkeFhqQVh0Qng4NzlOY3N2N3JQ?=
 =?utf-8?B?SGRYQmNRVGkxK2htZlhydXZLQkNhcEQzQksvRUtxNXBnVXpLWGtMQVQ0UEpR?=
 =?utf-8?B?Q2lqSW9BZ2I2R2IxekJUQlUxdTJKM1VudXZNc0xEUGpTa3hXbFdvemMxVUtS?=
 =?utf-8?B?ekRDQUpUWTg1VmR1alJnMjJRSHFSL3NxQlp0YjY5YmFuYVI2amVWUmp2Y2lt?=
 =?utf-8?B?Mkh3aDdaenplK1JlQ3ZxR1lQcis5RlhDdkpWM1VjQ0p0N3JjVzY5NkJOTG9M?=
 =?utf-8?B?M09wRGhYQVk2MkI5Sm9wMlBVaWppTHh0M0tSVnIrMXJPaFI2a0phWm5nQ2FZ?=
 =?utf-8?B?eGhuNkxucGVWYVRVTC9XYmROclVIL0cvcy8rQTVRM2M5K3FkZTFOcWJ3SFdQ?=
 =?utf-8?B?ajZ4T0pTTTFkZURxODROczA4Nk5ZZG9EM1BSYTlyTFBOMUlNYVhId0lJcnE4?=
 =?utf-8?B?eUNpME4yVTFCSkxHUFh5Q3pYc0owYW1LT1dvTndWMGZaakwvM2xZb0lOOUl3?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d155a8-0375-42c3-e378-08dc596bac07
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 14:36:56.3134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/dIQ0fmcMBbNN/aCeGaCFCTARlGFc4Rb26Mlct7Wbjr/ZlAJADxZbOg3aCrMHP1+OnTkZNiu9hzwH1EdMUJDu/pwkfmkrNTCEO5/wpYkxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5062
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

Looks good to me.

Reviewed-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

Best,
Akshata

On 4/10/2024 3:09 AM, Zbigniew Kempczyński wrote:
> In tests which use compression we did very naive check in which we
> compare source and destination surface. For linear we could expect
> differences are related to compression, unfortunately for tiled data
> this attitude is not appropriate due to natural data layout difference.
>
> Lets add helpers to extract surface ccs data and check if such
> surface is compressed. Function which extracts ccs data is defined
> as public to dump such data to png in the future.
>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>
> ---
> v2: fix use-before-init variable + addressing minor nits (Karolina)
> ---
>   lib/intel_blt.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/intel_blt.h |  11 +++++
>   2 files changed, 133 insertions(+)
>
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index fe0a45cb8e..dc6669889a 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -2094,6 +2094,128 @@ void blt_surface_info(const char *info, const struct blt_copy_object *obj)
>   		 obj->x1, obj->y1, obj->x2, obj->y2);
>   }
>   
> +/**
> + * blt_surface_get_flatccs_data:
> + * @fd: drm fd
> + * @ctx: intel_ctx_t context
> + * @e: blitter engine for @ctx
> + * @ahnd: allocator handle
> + * @obj: object from which flatccs data will be extracted
> + *
> + * Function executes ctrl-surf-copy to extract object ccs data from flatccs
> + * area. Memory for the result ccs data are allocated in the function and must
> + * be freed by the caller.
> + */
> +void blt_surface_get_flatccs_data(int fd,
> +				  intel_ctx_t *ctx,
> +				  const struct intel_execution_engine2 *e,
> +				  uint64_t ahnd,
> +				  const struct blt_copy_object *obj,
> +				  uint32_t **ccsptr, uint64_t *sizeptr)
> +{
> +	struct blt_ctrl_surf_copy_data surf = {};
> +	uint32_t bb, ccs, *ccsmap;
> +	uint64_t bb_size, ccssize = obj->size / CCS_RATIO(fd);
> +	uint32_t *ccscopy;
> +	uint32_t sysmem;
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
> +	uint8_t comp_pat_index = DEFAULT_PAT_INDEX;
> +
> +	igt_assert(ccsptr);
> +	igt_assert(sizeptr);
> +
> +	blt_ctrl_surf_copy_init(fd, &surf);
> +
> +	ccscopy = (uint32_t *)malloc(ccssize);
> +	igt_assert(ccscopy);
> +
> +	if (surf.driver == INTEL_DRIVER_XE) {
> +		uint16_t cpu_caching;
> +		uint64_t ccs_bo_size;
> +
> +		sysmem = system_memory(fd);
> +		cpu_caching = __xe_default_cpu_caching(fd, sysmem, 0);
> +		ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(fd));
> +
> +		if (AT_LEAST_GEN(intel_get_drm_devid(fd), 20) && obj->compression) {
> +			comp_pat_index  = intel_get_pat_idx_uc_comp(fd);
> +			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
> +		}
> +
> +		ccs = xe_bo_create_caching(fd, 0, ccs_bo_size, sysmem, 0, cpu_caching);
> +		bb_size = xe_bb_size(fd, SZ_4K);
> +		bb = xe_bo_create(fd, 0, bb_size, sysmem, 0);
> +	} else {
> +		sysmem = REGION_SMEM;
> +		ccs = gem_create(fd, ccssize);
> +		bb_size = 4096;
> +		igt_assert_eq(__gem_create(fd, &bb_size, &bb), 0);
> +	}
> +
> +	blt_set_ctrl_surf_object(&surf.src, obj->handle, obj->region, obj->size,
> +				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
> +	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
> +				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
> +	blt_set_batch(&surf.bb, bb, bb_size, sysmem);
> +	blt_ctrl_surf_copy(fd, ctx, e, ahnd, &surf);
> +
> +	if (surf.driver == INTEL_DRIVER_XE) {
> +		intel_ctx_xe_sync(ctx, true);
> +		ccsmap = xe_bo_map(fd, ccs, surf.dst.size);
> +	} else {
> +		gem_sync(fd, surf.dst.handle);
> +		ccsmap = gem_mmap__device_coherent(fd, ccs, 0, surf.dst.size,
> +						   PROT_READ | PROT_WRITE);
> +	}
> +
> +	memcpy(ccscopy, ccsmap, ccssize);
> +	munmap(ccsmap, surf.dst.size);
> +
> +	gem_close(fd, ccs);
> +	gem_close(fd, bb);
> +	put_offset(ahnd, ccs);
> +	put_offset(ahnd, bb);
> +	if (surf.driver == INTEL_DRIVER_XE)
> +		intel_allocator_bind(ahnd, 0, 0);
> +
> +	*ccsptr = ccscopy;
> +	*sizeptr = ccssize;
> +}
> +
> +/**
> + * blt_surface_is_compressed:
> + * @fd: drm fd
> + * @ctx: intel_ctx_t context
> + * @e: blitter engine for @ctx
> + * @ahnd: allocator handle
> + * @obj: object to check
> + *
> + * Function extracts object ccs data and check it contains any non-zero
> + * value what means surface is compressed. Returns true if it is, otherwise
> + * false.
> + */
> +bool blt_surface_is_compressed(int fd,
> +			       intel_ctx_t *ctx,
> +			       const struct intel_execution_engine2 *e,
> +			       uint64_t ahnd,
> +			       const struct blt_copy_object *obj)
> +{
> +	uint64_t size;
> +	uint32_t *ptr;
> +	bool is_compressed = false;
> +
> +	blt_surface_get_flatccs_data(fd, ctx, e, ahnd, obj, &ptr, &size);
> +	for (int i = 0; i < size / sizeof(*ptr); i++) {
> +		if (ptr[i] != 0) {
> +			is_compressed = true;
> +			break;
> +		}
> +	}
> +	free(ptr);
> +
> +	return is_compressed;
> +}
> +
>   /**
>    * blt_surface_to_png:
>    * @fd: drm fd
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 1f6c713596..d9c4d107f1 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -311,6 +311,17 @@ void blt_set_ctrl_surf_object(struct blt_ctrl_surf_copy_object *obj,
>   			      uint8_t mocs_index, uint8_t pat_index,
>   			      enum blt_access_type access_type);
>   
> +void blt_surface_get_flatccs_data(int fd,
> +				  intel_ctx_t *ctx,
> +				  const struct intel_execution_engine2 *e,
> +				  uint64_t ahnd,
> +				  const struct blt_copy_object *obj,
> +				  uint32_t **ccsptr, uint64_t *sizeptr);
> +bool blt_surface_is_compressed(int fd,
> +			       intel_ctx_t *ctx,
> +			       const struct intel_execution_engine2 *e,
> +			       uint64_t ahnd,
> +			       const struct blt_copy_object *obj);
>   void blt_surface_info(const char *info,
>   		      const struct blt_copy_object *obj);
>   void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
