Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E462C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 22:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD4110E07A;
	Wed, 29 Jul 2026 22:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfBHLUu5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B348810E07A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 22:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785364728; x=1816900728;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OggP4nIBh7cU+IMlIQemvrPCkmijG32bOtGAJ8cTrUk=;
 b=cfBHLUu5ApFaeW5TiPgGMXm9JlMIcxuyfqwqD7YsH9Zp4p1bkInoP8VZ
 /I378KlJIx+7tsklH46QrbCfagvn1fhg9o7K+M9SxQnyEPgo1SH8f/cgA
 BY5f9L8l9vXKx0avCNmlKPCHcdQAi93pMM2j1wAVtV/lxcM1rWkN8Vekb
 Z9ZmtWIBdIHJ2rVKsq8Suh0fnN1pcagj7LuYhlV0+vGjklz5Piousw+tX
 GYG79YaVcjuZiriYUu4xNbrKJnfA6zdXrsKDZtaYTKRPBQmE/AG9GNgGt
 LSFZeHhb97yFiNcgi4VZMvM9IPcvR7e6/FmFxII8ZojHoSZTyTse3loHs A==;
X-CSE-ConnectionGUID: jAiFkxKzQtSThxxC08oC2A==
X-CSE-MsgGUID: pkFuQmNOTjWYJ0mody0rgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84959447"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="84959447"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:38:48 -0700
X-CSE-ConnectionGUID: EsrOuMMvQVS/lfxO8VJuYw==
X-CSE-MsgGUID: 2smIza8xS/ChjQmQyGh7yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="284706399"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:38:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 15:38:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 15:38:47 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 15:38:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KARaRwJqlbQ4P9jscL2uebZrEqK6JM3qzWctqtQ3JWmCmgNVlJ3hLhOmXam2HuZ3OcOnoAxDEnDN/ib9K8ZLbx93vAAeOvo0rBadoda09TC072vEMR/dBpbQA+4NZNFk20X+3xAtpj5Q8meJCAXp3Ot3qWrwRarz2wB8hukx36OCua/61xHeE9ISpghcsOeTxbJodkuiqxkI2RqFk9k2DT4GtnCwmCtLfM2h7voFza897iCPK3GV7lScRCZjRzJ6TUP8T1LGaRdasl7gXoMotCb9mGz2CogkRF/sPULzpM7Lt9UJZXS6WB9qb7QnxBDWWgNZB7d8N7v7sdlMSeyIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZeReUrovdqS0kyuBGfd3YpyvW6DldqRNNlT48Qfp5E=;
 b=JcvtjcfwzTtSTy1fGRLI3S+cc0nBs59WVe7aLIZpv3MqtKE337aIpHQkHPM3Ef7ys+qeIH8mfySPZUcAh/EonQmB9+xhlfW1BVQ6hWRbYJOf+5cP0Q38rJKiaAc/CFmk/zsuSacX0NlbVson8ODa8EFR7aorLIhkQ9wG5zrHwLbkcYWjaUQiA0KEIjfm/JQdZiOGu8D+JN27hyYmx5n6r3JWU6JvM3DS/fYBvlDo+Gg7VRRAajBBzExh6XGnTfe6bTkJ+7RSIYw/sjDrvLsoZO8gsY5rr/qJ/ZQBi/l3yLi1WjlsoY0UX0RuX0Nd0PPsty4Xied4oLXi2qkFYbQ6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6473.namprd11.prod.outlook.com (2603:10b6:510:1f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 22:38:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 22:38:45 +0000
Date: Wed, 29 Jul 2026 15:38:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 09/10] lib/intel_pat: Pass xe_device to
 xe_get_pat_config()
Message-ID: <20260729223843.GI7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-9-0c147eeefefa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260721-wa_14026539277-v1-9-0c147eeefefa@intel.com>
X-ClientProxiedBy: BY5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e9046c-772d-443f-7668-08deedc225ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7Oh2tIPFmydGT64CkPNAL18izRKKm/kKKnFcWwlzesUQ9MUIdEEKMCWLEtg2j/ApPaLH5P7ZjZoq6d7Pg0OJHTSa+qpa7hN5p2jNBzIaqcje+PgKboHTj2P5D6kz2tqwDdFOpjT6EdTjsbW/eyhN/3ZcMdjOa/C7DpzLItZessL3lykir9S/4ATnNU8ls+/0y53/zj/wvMN0LpwHzugt2eZ0V0xmESMo9tGCAr1m6SkDzhqjKmvFbenNVTIhMJa8VeCkIYkU3xAprPVzsNJvVTMV42NZVzrex+2dMTHn0FIM3jsNTISiZKIVlQm/rpEv4jtW4jIaGKOtJ++cARXmaNNpZw91xhZnWmSyBc9QvzYlUrBtrgqs4yZ+oj77SNphzl2EXYIuQxAX4FVf5w951ZkJjM+MzWGZBv/E5qIdMsQQDTyO+PE6Fzh1vBqQAUQVEYPPfzrvzjQHNNXrMsG2YeDRScjKk3mROH70tzgTvaHfVwZNPPOhNDQoeSMYrpoQyx11VSmYvKoPDgy9UbJ0X/naTdLoOu8jcAdBaPhkzKCUgS4AFN2C/EPZATaRJJ5gU8c4HzBiWM7kaJwaZS6dWzpg1Zwls2CVxQy5HABl9MbeQXSIIDoHHQekohC5loc6k3pQENUC1pxrV3BFe4EFOjvMUDpB3hYxa7RJyOKr/F0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pC69MEXS/i98R8S2JXNXJzLCEKSFppGJYk+GVq3Z12GQx86Vo8BVswOKpONm?=
 =?us-ascii?Q?P6dmK2VKgODg8DanMiulzURhbkbflrcA+SWaUQMqA1c0kHKDOCinlmqPPuj1?=
 =?us-ascii?Q?V9XenE8W4IY1B7E8/TV+G/FMBQsfz7eL2KC5Su12RVQdVEiiGN+8ZiN3efS+?=
 =?us-ascii?Q?svZSmZTC6HMClr6mtOD3cr0XanPgcItFdZRVueP+tO7DwVwTNPxJEkLSafHv?=
 =?us-ascii?Q?LD5uPcscbX9KSmRtwuBYNEP92u+5TiFAdye6WOtdpJ31jh5lkoKlFtwiCrt9?=
 =?us-ascii?Q?8CRaJjaOQnzmwqlbsxCHTleFnj/KCmNg2eAabzfJYxDNfh8DUkzayRLa7y98?=
 =?us-ascii?Q?SxNrYbTod0IIFeOLxR2Mo/Zd3QNT2DI5qpJmuR19xVa25hicLlL9MWua9T80?=
 =?us-ascii?Q?S/zGuKrv8KD3qQ/8uUvJYZR5DKThpEDoRRQEOmjRBFUCq7rOPFxdUftQm2ve?=
 =?us-ascii?Q?xl0rPju9yKGBdpYCMBEZU0mRgk8jodtqjHeN56HODZ9CPjhCVVmyXgPPtYLc?=
 =?us-ascii?Q?o4ERFSDHiQVHI4VXbHSwVRMsKPpDFPvdH/pRtitGfi+nquooJEQI0qBLOpvi?=
 =?us-ascii?Q?d8YI8voMnIKdbP+ZET/ZtZHlSTWefWDxwisCvH2DNVLBZ+/iZ/etc9R3FHxd?=
 =?us-ascii?Q?K63FLr3aZb1qs/KAPRDsEtGZJE1D4sjs2yXx+RV7lISHSzBeJUofGW80+P/M?=
 =?us-ascii?Q?sI0IZQleggbxSZJr2/At/D+lA5QfxnWJSrhd8j07rrcYSJZj4e6joxu9a4C8?=
 =?us-ascii?Q?9dL/H11ZF8FVwGWmcIGm1YguLPuCyQ2UpjLgd82EpFuYlRGL854gLuOroemP?=
 =?us-ascii?Q?X26+RA1Cvt8bWVEuUYoIFG1hwQoWNfmPT6tfv8UWVTmLeiFosFlPWxglM7Bm?=
 =?us-ascii?Q?SGONkEt8tfDOKz4/G8uQW5CB9YvFHhLQJdu/Vmr61nhIIU84PPRxEyCuahg4?=
 =?us-ascii?Q?EcJGiqQGBF9QlzKuy4BAxHpEEr3sLIY+6jEMZLDuqEcRI459oypKsmCwUBGI?=
 =?us-ascii?Q?yr5JvB9A3Gbqv365igmTEomUFsJ5xnwtSnPBgi9WAMPMyBTv2XuVcUbhGH9R?=
 =?us-ascii?Q?tzmvSFPW0xnDxFbXbm9mRk7tG+mOB9B69UHA4vvLPRCbTyt7+TOsk6jqKj9M?=
 =?us-ascii?Q?HldHFZ1U7/XLMq3DlF8Hb7xkRI2WrceWWAl1HBZ5mnyzPREskBbQXUm2jweC?=
 =?us-ascii?Q?W1/BAIECEhS2FrFbDWnsl5oIyENxDB60I9mVN5iiEUR6vgJ0uz4NpvrgtZVv?=
 =?us-ascii?Q?dpT3UIdtXtQFNO5HYF+aWVWgJKnM02oH2M/67EJpuGqSw6WrUlXrUFmA5c0l?=
 =?us-ascii?Q?D0Zv8eYoezzKSrBmpECTRr3XYe6cyl2SdJP8WxhXEtQKLrqSraJtvQS+I2Av?=
 =?us-ascii?Q?2vBDd4jJQU11in1LeXbogVjxNzXxIxl/lau+1YpPK40Gqe/2qNQ5yM7UkLZF?=
 =?us-ascii?Q?xOBoGPap63Zoz/BhjwM8zc8wZRFTsMtsCQqpgU/DB7atAGSjxu1ioSeDoszL?=
 =?us-ascii?Q?+yQDGEHHF4BK/TdBE5uDTJHxstCn5KnRCCKRTHhzFKnTONPntUDz2HydV2MB?=
 =?us-ascii?Q?TXrES7OCYxkvtm5ZmG1+SH9q7QqEdVlWBYo8rsRMd7MWelY4O3o/SYIRgm7o?=
 =?us-ascii?Q?9r3HTza8oYyp/91hxuEycaN4dZsusnCQ8INoox+D6aYXJiGT+iqJjsTttKO5?=
 =?us-ascii?Q?6IzuGLAcD52wmvKd+1dLlUDQCYb8sa/YCA7UFj09hav8ofbPe2So+izInPOR?=
 =?us-ascii?Q?4yZ9fSRp4KHgogROoT/YsqnCVyDxcb8=3D?=
X-Exchange-RoutingPolicyChecked: Qf0FMuPoajkob29Rnkz4GXj/eR6xe3A+P7fYADIq/cJIkZWnboSI8ApDx07BEZG9ENold2vVBjstFIm/cmh+R1VwhVCP7LhvWxXKOS20EmRhK6ts95kqn6P9UmiTjXzF/PtDS2knYA9BtF5hS3pmip3FRgPH5Pj2ISIyqAMfJ/aQ9dDjK7wa+oNgX58HQRCIGuBZel9ZP/gQd1OkcwWbWaYv3z+LwBUOwHqwzEhjpBgqEmmZ0hLTJqeLBu1PXocjzvndUzwBAB1dRA3PG66yA88XXo7TYdFuszzqPjz5DM6axP1HIQWwEegosd69fKe5lKn4ZLH8emzbBZzOSXA0vQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e9046c-772d-443f-7668-08deedc225ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:38:45.0117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94RQ3Ap+H0Gd9OjLRT/vOmvryfA+US4YFNwhBk+G6hlDqHxIVYAxqqzbVUhYVJyzioYP/lNvXbknRop+IhxgOir2BSkGUv269idvJzmXOlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6473
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

On Tue, Jul 21, 2026 at 04:00:02PM -0300, Gustavo Sousa wrote:
> In an upcoming change, we will need to check for a workaround as part
> of xe_get_pat_config().  Since xe_get_pat_config() also gets called
> during xe_device_get(), we will need to use xe_wa_from_cache() instead
> of the regular xe_wa() function.  In preparation for that, make sure
> that xe_get_pat_config() gets called with the xe_device struct instead
> of the drm file descriptor.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/intel_pat.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 14935e3c4692..ebf5cd428c68 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -24,7 +24,7 @@ enum xe_pat_config {
>   * Returns: The number of PAT entries successfully read on success, or a negative error
>   *          code on failure
>   */
> -static int32_t xe_get_pat_config(int drm_fd, struct intel_pat_cache *xe_pat_cache,
> +static int32_t xe_get_pat_config(struct xe_device *xe_dev, struct intel_pat_cache *xe_pat_cache,
>  				 int gt, enum xe_pat_config pat_config)
>  {
>  	char *line = NULL;
> @@ -40,7 +40,7 @@ static int32_t xe_get_pat_config(int drm_fd, struct intel_pat_cache *xe_pat_cach
>  	else
>  		snprintf(config, sizeof(config), "gt%d/pat", gt);
>  
> -	dbgfs_fd = igt_debugfs_open(drm_fd, config, O_RDONLY);
> +	dbgfs_fd = igt_debugfs_open(xe_dev->fd, config, O_RDONLY);
>  	if (dbgfs_fd < 0)
>  		return dbgfs_fd;
>  	dbgfs_file = fdopen(dbgfs_fd, "r");
> @@ -125,7 +125,9 @@ static int32_t xe_get_pat_config(int drm_fd, struct intel_pat_cache *xe_pat_cach
>   */
>  int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt)
>  {
> -	return xe_get_pat_config(drm_fd, xe_pat_cache, gt, PAT_SW_CONFIG);
> +	struct xe_device *xe_dev = xe_device_get(drm_fd);
> +
> +	return xe_get_pat_config(xe_dev, xe_pat_cache, gt, PAT_SW_CONFIG);
>  }
>  
>  /**
> @@ -141,7 +143,9 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, i
>   */
>  int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt)
>  {
> -	return xe_get_pat_config(drm_fd, xe_pat_cache, gt, PAT_HW_CONFIG);
> +	struct xe_device *xe_dev = xe_device_get(drm_fd);
> +
> +	return xe_get_pat_config(xe_dev, xe_pat_cache, gt, PAT_HW_CONFIG);
>  }
>  
>  void intel_pat_build_xe_cache(struct xe_device *xe_dev)
> @@ -151,7 +155,7 @@ void intel_pat_build_xe_cache(struct xe_device *xe_dev)
>  	pat_cache = calloc(1, sizeof(*pat_cache));
>  	igt_assert(pat_cache);
>  
> -	if (igt_debug_on(xe_get_pat_sw_config(xe_dev->fd, pat_cache, 0) <= 0)) {
> +	if (igt_debug_on(xe_get_pat_config(xe_dev, pat_cache, 0, PAT_SW_CONFIG) <= 0)) {
>  		free(pat_cache);
>  		return;
>  	}
> 
> -- 
> 2.55.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
