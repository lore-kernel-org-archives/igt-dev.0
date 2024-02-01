Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2A2C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 14:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C7310EE71;
	Thu,  1 Feb 2024 14:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zw+5dyXo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C4210EE46
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 14:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706797090; x=1738333090;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ks3BhkH8MRT5bsAiuI9BAqgrZSANdanBVBNzGjoSWK8=;
 b=Zw+5dyXowihUhDD/VIYS6czY71a4xrz8z4GBVLDHHV5uLD6Zdgv19wcN
 EWVhuD6N6rO5lPcpN2BDv04Mdj+nht7AJ49VxidWp6NVJ3+dPScDDLVFS
 BtYdfG51ruWv4wRc5UnI2KsU8ZJSNtlXcyoSJAJJf0ukhHQSajAbxq5jQ
 K7D1tTzr6uHkk67mCI7Uk2wUkyIXBBVepFxO/7Xv4lWrMhh/UmbbueLgd
 84aAgAdqF9tVyqLNyXEreTVPV4i9oxdIZoEui5fWON/BCyokTMywZ3A3D
 G9soBQkperjEeu3WnHaEQnt4NgwrqNMBOHNJSF05stfydm6+xlqkGnS8p Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="435062178"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="435062178"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:18:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4417503"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 06:18:10 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:18:09 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:18:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 06:18:08 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 06:18:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7EDtbTs+Gf/oGkGszsTqmslathUpaYwiuqKy5blyglB83HXB05BouMsUWhkZVGEu/rkV3j/qVWSh3RmytfwQZoErpxrriqFIASIhm0hbGho4IypY8YTqVC2LeLxOKNj4k18QgTNVH6dWze2N/u988AGQvhpEmgCh4aU0e2qLmAVoJgAifZ8hlwMT3DAmViZgdfIk3TdOiCLWfFE/bVErlE8w2UokUAiC0CSqyaxJI+WfTz420myj8cuXkiUSexN/Yx8WfauCi9GRahAks8vkX+9j+59K1tewIfeVENae9TAEDhm5JEiNt3gN1cGYleiHd5G4pTxckonoJiSGFbGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLJLbmusfzHlCm/ZgxgxOwA9Sm/97Ly8RVJwYtzu0n8=;
 b=IbqD/6n7uICDwKyNmHrcpq1mjr3mM/WGYmUnYJ2+DyZFcPYjTYkEkaBRS1m+LUYPcLn7k0640l5HWLVrVG2jxgM7+0CllH/BSrXQsTSpuMeSpyUG12q+uP84lAg9no0NNixJoO4bg/wGHKYg6dcX87dR6g6emydcIcwR2RQRTLwrhbLRFnpTnauvCeA/y/Boef6QfWW08fFWp5uCu972+7Ok8JkPZHndmTrWBWHdK7Ve3sO41eVcxsaGOxoxJSn1O07csIsuuEmnbqHhavUnJlhOhQ1MxIV0qRCsHPaXeXgJ4jGkUeQTF0duQmAay76muTCwfAImrk8t/4kfkKTsdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by DM3PR11MB8671.namprd11.prod.outlook.com (2603:10b6:0:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.36; Thu, 1 Feb
 2024 14:18:06 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566%4]) with mapi id 15.20.7249.017; Thu, 1 Feb 2024
 14:18:06 +0000
Message-ID: <d4c9ad75-66b1-4959-a4f5-120ae7524453@intel.com>
Date: Thu, 1 Feb 2024 15:18:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 5/5] tests/xe_exercise_blt: Exercise small to
 large fast-copy blits
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Karolina Drobnik <karolina.drobnik@intel.com>
References: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
 <20240201100724.257845-6-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240201100724.257845-6-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|DM3PR11MB8671:EE_
X-MS-Office365-Filtering-Correlation-Id: 209a3cd7-cb0d-4db8-4739-08dc23309bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6hVCQsBA1/XlS8wNoLUFstEvP03KDipLW7IHzBzV7qsI3bD3WUcnATLJFB8IvmHsCmzOVeTclmlNeW6/NKTL5TVOtL2700HL1aD6U+QcwKVZRjhiji8qsd/aZLJH2zCIOyv+G6CLGYF1gluiUvYL8UnBbqorXd/yRa3cGeG/pmUu2veTSl2hz2PKZUIP3qzTvBYtTjST5aFVsuD4p1jvzkbEbPC/lpTCA6LML1KQvgetg7drzjR80gU/SqnrPsqvlxrw9CMJfzD7Dl/M9wg5ulSvzP2gNOlRWMGlzuoT5by+hJsaJKElGXUGWg7fz/ZHL9k5dBOCcAU2ofr3Ddf0nOW4eQ9IKNwEvHMYpx6QPXFvSwzT7BNLF3Nef6vUekp2zZ4FhbazBIPvthniOwffZGXxGcBAq4bXNaL4eJH2kFGBJz7PLVz2RhVPw+2g6Kbjkg3MafbS0bvuj7XWB9vgBFQYvYYp06cbaOiVfEG97DZVGX/TxK86dFFvdDdoUzMY326E5L35453u5yTbKwRW+/UZb9ZO6OOLFj+wRdU1Jvhv2kXo1+2xGhW/rVZ4WOqXYBM8P9sL4gVmw9CuX0DvGyScDBhuVikix3puMLvY4qaT8HfiENYgQdnrtb2ZnULsAkcurPN0jvxsl92B7GDheA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(39850400004)(396003)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(44832011)(66556008)(2906002)(5660300002)(8936002)(86362001)(82960400001)(36756003)(66946007)(38100700002)(478600001)(6486002)(6506007)(2616005)(107886003)(36916002)(83380400001)(41300700001)(66574015)(26005)(6512007)(53546011)(6666004)(316002)(31696002)(8676002)(4326008)(66476007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVdhaXh5UnBneUhDOWRYVyt2Tm1rVWFqR3dIZ0xnczVvYlNjY0liYzhqUWhl?=
 =?utf-8?B?eVNuQjkvdzNZdGIrOWg0Q3VFWDZxNFB0anN1MlJMc29KUGJNaUJwM0wzbW5m?=
 =?utf-8?B?QUZsVE9Sd2UvdEFEWG5aZU5OK1BSblZCU0IxZ1QyaExINStCTExTeFBWZkJy?=
 =?utf-8?B?UDFFTTAwdzdkbGRyZ2VKS3Z6TTJSTmJjZGNtVVZXQW41WGh5N3dROGNJRVdw?=
 =?utf-8?B?MVl0QVdJY0lTSW9hZ2RMTVk4NW53d3J0R3lRTGtIVURSK21FTExNbk1nTlVH?=
 =?utf-8?B?N2pEN2RaWHFZSi9aZTY4OElvamgrN0ZjRjlKOXlLT05hcTRha2tWU1FlcFcr?=
 =?utf-8?B?d2JQb05wTmg4QzVYTWxxL29ZWHNZT2pqUlRUbEluNVlBSUc0MnpicW5LdXF0?=
 =?utf-8?B?dkZWUlY4MkV0OHJHcTArL2dwNDJsR1lHV20rbVZNMEIvcTY4VDIxTHBBTFZo?=
 =?utf-8?B?S0VmU3BiSFlqcjhCaE5GQmM5TEI2K3hTckV0Yy9jb3paRDdOVW4zTlN3Rmpn?=
 =?utf-8?B?TEFqWFlFMGpvTkpDSFBOWlNNS05aTlJpK0R4SllxUis5SFVCOGswTlpBSEhJ?=
 =?utf-8?B?YVYzN3IweERadEQrMzJNN0tMNmJvc0xzcW5mUWxwamZQTDJMMVVWSDE0TVJY?=
 =?utf-8?B?dkNOYXhTSEFUcXV3dXZISEJDTE5sd2VaWWY3YWFaUU5Gb1pVa1EwRERrNkJo?=
 =?utf-8?B?VkthUlZhM09GR3NPV1A2UGN4MHJkUE94RFpVUE9SMjIwaG9LV3FnUzJHSlk1?=
 =?utf-8?B?elhSbnJHaUltbkd5OHV5b0pMT0NsOUVmMHVPQXU2QkFSSXBJSUp3UnlGMitJ?=
 =?utf-8?B?eWs2djJYeFBhK2VPRW1wREp2c1daZ2dIY05DYWlzY3BFWTRRbHVPZ0dPMzhP?=
 =?utf-8?B?c1UvVS9SVHc3VXFPeXN6aVY1SGFLSG9JdWNMRTF4RUY3UmFVMmJDWTJ1ajdP?=
 =?utf-8?B?b0FtTDNEc1g4eVVnSW0rZzdLS0FEZnY5RGIwK3ppZmdmN3dUaXBsVmovNGh4?=
 =?utf-8?B?Szdrcm5tb3NiTUFWK2FGMjl6USt2RXo2TFhWTldxNjVOU3RtVDFRTGZuOVEr?=
 =?utf-8?B?ZzJObm44UFFLZEFReTJ1dUlnYTNHQTlRa2ZoeWpDMWdKdGZ3RXJxSGF4YUVW?=
 =?utf-8?B?ODFpcnkvN1JzY2tlMDl2YmNEQmhzTCt0T1ZhOFBmQUp1K0h5azd4Unc4Nnhv?=
 =?utf-8?B?Wm5FVlBMMzVFemlwZEdvZ25FVU80c3Zic2xoWkZMUHNuV2xwQndjenNCeFVv?=
 =?utf-8?B?b1NKSFNodW1qZVVXQkJ2dTZtdTlhUGNwaVZtUHY4TWhHMUZaL21nK0FJeFdW?=
 =?utf-8?B?U3FVekRBQXk3SzVraTBYUnlpR2thUUdqQ1NTLzc1VVVwNVlSbGMvY1lHUW5p?=
 =?utf-8?B?dTNBdHdRbytZWWpPeWNkSHhkVUJPN3BONnBHYkxrTmMyZXAwNGRtY0FIa1dX?=
 =?utf-8?B?UEFldEJHcjdaU3Q4M0trd0owcXU2cVRuRmh3SHJBTDRKMXkzUDc0U0hLNHZk?=
 =?utf-8?B?c2RzRVJvZTMvNWRPdW1uQ0lSK1VZVGZyeGI5VFFXdG1kSnJnNzA5T0NXLzQv?=
 =?utf-8?B?YWZ6dzJndmZGQnNUTTN3M0xBUS8vaHVRSGRkM2NEem1TVTBYTjlwVG9yMGpH?=
 =?utf-8?B?bEl5TUk4NkhJTEpPazQxTHh2Zlhid2IwV2l3U01BQy9kYmlDM1IwMFNJd3RP?=
 =?utf-8?B?QzJQeXZZcjY3c29HZVlneU8rQnRObStLaHNLa1RpVytuWGFuZG4rcDk3enIw?=
 =?utf-8?B?WEkxTEszTzVTM2dteG1NaGFKTE9relluc1dsSmFoYWlySGJpajZTQTl1bEE1?=
 =?utf-8?B?UldrZm40bXNGbHc3OFJiT21pd2pKWkpYOFhKSkk5Wm5WMitHU1pmNTJlQndi?=
 =?utf-8?B?YjFxSlZkTTAxb1ZEM2JqdVFpZ01pQVV6MHZ4VG1YNi95YWQ1ZFhadFp5RVcy?=
 =?utf-8?B?Y0h3WENsOC9HRHlMSjVUcy9FV0FpelpsM0pmcFgydGxJcExPNnhwR1hvemE4?=
 =?utf-8?B?S1B0ZlBmYkYycW9CdEZuQ3BhU0dIVlBNNWp5dDRlbURKdFJyWEZRTmkzT3Jh?=
 =?utf-8?B?UjJyNGpZN0VsSnh2b3V6NHFUODhJckVyY1FDYUR4SnVHUWwwSU1pRmliSUNK?=
 =?utf-8?B?OU1HZmxPZ3FWWmd0SlZCYWpWUncwR2J0Vm12SHkvb1RLUVphUkwxanhGRlNL?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 209a3cd7-cb0d-4db8-4739-08dc23309bf0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 14:18:06.2637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4I4/yXuPqRE9LXDT/ecXYq7da8raFUlcXva7Je0QvE8oqGdtzYFD5F5TKgG5Vl9mXzQ2NEu+W0EWc8gpKXNhAP3AQ2aHf0j1q9VY0yFQK8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8671
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
> Testing blitter with large size like 512x512 may be not enough
> to verify small or unaligned blits works properly. Add subtest
> which spread fast-copy blits from small to large.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Drobnik <karolina.drobnik@intel.com>
> ---
>   tests/intel/xe_exercise_blt.c | 63 +++++++++++++++++++++++++++++------
>   1 file changed, 52 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> index ddf9d188a7..8b4bae282b 100644
> --- a/tests/intel/xe_exercise_blt.c
> +++ b/tests/intel/xe_exercise_blt.c
> @@ -25,6 +25,10 @@
>    *   Check fast-copy blit
>    *   blitter
>    *
> + * SUBTEST: fast-copy-inc-dimension
> + * Description:
> + *   Check fast-copy blit with sizes from small to large
> + *
>    * SUBTEST: fast-copy-emit
>    * Description:
>    *   Check multiple fast-copy in one batch
> @@ -40,6 +44,8 @@ static struct param {
>   	bool print_surface_info;
>   	int width;
>   	int height;
> +	int width_increment;
> +	int width_steps;
>   } param = {
>   	.tiling = -1,
>   	.write_png = false,
> @@ -111,6 +117,7 @@ static int fast_copy_one_bb(int xe,
>   }
>   
>   static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
> +			   uint32_t width, uint32_t height,
>   			   uint32_t region1, uint32_t region2,
>   			   enum blt_tiling_type mid_tiling)
>   {
> @@ -122,7 +129,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
>   	uint64_t ahnd = intel_allocator_open_full(xe, ctx->vm, 0, 0,
>   						  INTEL_ALLOCATOR_SIMPLE,
>   						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> -	uint32_t bb, width = param.width, height = param.height;
> +	uint32_t bb;
>   	int result;
>   
>   	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
> @@ -170,6 +177,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
>   }
>   
>   static void fast_copy(int xe, const intel_ctx_t *ctx,
> +		      uint32_t width, uint32_t height,
>   		      uint32_t region1, uint32_t region2,
>   		      enum blt_tiling_type mid_tiling)
>   {
> @@ -181,7 +189,6 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
>   						  INTEL_ALLOCATOR_SIMPLE,
>   						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
>   	uint32_t bb;
> -	uint32_t width = param.width, height = param.height;
>   	int result;
>   
>   	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
> @@ -241,14 +248,20 @@ enum fast_copy_func {
>   };
>   
>   static char
> -	*full_subtest_str(char *regtxt, enum blt_tiling_type tiling,
> +	*full_subtest_str(char *regtxt, uint32_t width, uint32_t height,
> +			  enum blt_tiling_type tiling,
>   			  enum fast_copy_func func)
>   {
>   	char *name;
>   	uint32_t len;
>   
> -	len = asprintf(&name, "%s-%s%s", blt_tiling_name(tiling), regtxt,
> -		       func == FAST_COPY_EMIT ? "-emit" : "");
> +	if (!width || !height)
> +		len = asprintf(&name, "%s-%s%s", blt_tiling_name(tiling), regtxt,
> +			       func == FAST_COPY_EMIT ? "-emit" : "");
> +	else
> +		len = asprintf(&name, "%s-%s%s-%ux%u", blt_tiling_name(tiling), regtxt,
> +			       func == FAST_COPY_EMIT ? "-emit" : "",
> +			       width, height);
>   
>   	igt_assert_f(len >= 0, "asprintf failed!\n");
>   
> @@ -264,6 +277,7 @@ static void fast_copy_test(int xe,
>   	};
>   	struct igt_collection *regions;
>   	void (*copy_func)(int xe, const intel_ctx_t *ctx,
> +			  uint32_t width, uint32_t height,
>   			  uint32_t r1, uint32_t r2, enum blt_tiling_type tiling);
>   	intel_ctx_t *ctx;
>   	int tiling;
> @@ -286,16 +300,32 @@ static void fast_copy_test(int xe,
>   
>   			copy_func = (func == FAST_COPY) ? fast_copy : fast_copy_emit;
>   			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
> -			test_name = full_subtest_str(regtxt, tiling, func);
>   
> -			igt_dynamic_f("%s", test_name) {
> -				copy_func(xe, ctx,
> -					  region1, region2,
> -					  tiling);
> +			if (!param.width_increment) {
> +				test_name = full_subtest_str(regtxt, 0, 0, tiling, func);

I'd simply pass param.width and param.height here and use the common
name for both width_increment and fixed size test cases. We don't have
to keep the same "%s-%s%s" format, extending it would be fine (and
helpful, I think).

All the best,
Karolina

> +				igt_dynamic_f("%s", test_name) {
> +					copy_func(xe, ctx,
> +						  param.width, param.height,
> +						  region1, region2,
> +						  tiling);
> +				}
> +				free(test_name);
> +			} else {
> +				for (int w = param.width;
> +				     w < param.width + param.width_steps;
> +				     w += param.width_increment) {
> +					test_name = full_subtest_str(regtxt, w, w, tiling, func);
> +					igt_dynamic_f("%s", test_name) {
> +						copy_func(xe, ctx,
> +							  w, w,
> +							  region1, region2,
> +							  tiling);
> +					}
> +					free(test_name);
> +				}
>   			}
>   
>   			free(regtxt);
> -			free(test_name);
>   			xe_exec_queue_destroy(xe, exec_queue);
>   			xe_vm_destroy(xe, vm);
>   			free(ctx);
> @@ -367,6 +397,17 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
>   		fast_copy_test(xe, set, FAST_COPY);
>   	}
>   
> +	igt_describe("Check fast-copy with increment width/height");
> +	igt_subtest_with_dynamic("fast-copy-inc-dimension") {
> +		param.width = 1;
> +		param.height = 1;
> +		param.width_increment = 15;
> +		param.width_steps = 512;
> +
> +		fast_copy_test(xe, set, FAST_COPY);
> +	}
> +
> +
>   	igt_describe("Check multiple fast-copy in one batch");
>   	igt_subtest_with_dynamic("fast-copy-emit") {
>   		fast_copy_test(xe, set, FAST_COPY_EMIT);
