Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C3CC25B79
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 16:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD2210E4A9;
	Wed, 22 May 2024 16:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZF7fCi/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA02A10E4A9
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394251; x=1747930251;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=voD01kYpANCVLT/ykb0LS+tQ8BcsAiz2F0g4swvTwhE=;
 b=aZF7fCi/LfLWoi/O/BIcrPY9Z1P/sucaYcENfThqBYn8onNa+sRoJlCk
 BHetwJsaKHABtMRwen3/XKnXJmm2+Lhk5rUoCMjSHP2uHXCOoveLhKdsy
 rXz+lUGQY+5BmMtLKSi5oCXpjeMRBQ74TsZlWW5f7BjpcyM1/sBq2zx5i
 8glQyovZFdABsfRixxlIYdL9i6aQVlD0huchmzpXEJvzR1/4ixy5kbAka
 wT9kWXrZXNPJFTTINU9awrKVP2nfFe9Feb8bKguQZNtKfR9k50ARi/B8m
 DYZJ2uBaSg02Dz7oElBb4i4C9bOs0v0jp017BuphfV2V1toSyelmh7iZe Q==;
X-CSE-ConnectionGUID: Q7DuSzXDQbK2nJmnuQlZmQ==
X-CSE-MsgGUID: y40rVN8/Q2mKVetZ9Txslg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12598653"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12598653"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:10:51 -0700
X-CSE-ConnectionGUID: Be0oq/SrT9GQnWeefKn6UA==
X-CSE-MsgGUID: /+V5vIK7RZe0A+jfZhsItQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="38313219"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:10:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:10:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:10:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:10:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:09:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3+o8AvUTEmwRaErPPlOq1CDqFkQkC5KwXgSTkCXT5k+HsI/psSW+KznwHq0CXpMAuLpVfjM7BA0u0qyVr0cg1nIWQ4Fme6t3vAaf+ezDMQtiT+UtgN0+8c5AB00Punv+5OGaPCf9bVz948vQf1Za6ip1DRZZFDdjpXuxufb0WgnDX7GwkY0jtSc+8QT1QWsEZSn+tfe5HCY9Ti1RONV1LEKHcwYo7Y3ES2TbN1dOXOeulTQK+LHpsH7Q9+WEN85zluH92XNv8XU5H7fxQn+t0FQpchULVAU4D90HxRzoZVGrNzh8ENUCClnz8A/koySWTTRTQ1coDrVbvd6U7K3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=os3d4J7YvWlf+ElbPH6twW2D6O0lPoBHT3GSKbK9s0s=;
 b=fqS+Hfctl4yduutKA58JUf97h1cgW/GG/5z3maSHVBUhY3W74QoQ+G71dUAyDVFc/X0pYX1SWmVZ68boo7rNA0cfpK2KLycyRvV3Fgc4hXvM2MrCOZnom9aR9w/xNHkE7qICvpKTFpcoH+O0VNir3Agk5hKMpR5mjXS2QxQFj+7jB6HsXgfRHkDb7jJVMTQEZ5Foo8ZywZmUb4jrypaFL6G8syymXL12TxNyZ5ot/V8GnhLIZKDXlAptoWV9jV1Z0P1IVgpGuyp+KCtaRbkQt1cdpgncfL1TRr1E10VZBsDk+46yUfvPCPuOcPD4rFlyFvqB5Z7tKjssxYBDGNsG5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB7737.namprd11.prod.outlook.com (2603:10b6:8:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 16:09:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:09:38 +0000
Date: Wed, 22 May 2024 12:09:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 03/10] lib: sync i915_pciids.h with kernel commit
 7b43a37348b7
Message-ID: <Zk4YvleCltwEwvch@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
 <819bd797a173eb001ce98deb3d9cd721d60d6eaf.1716373923.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <819bd797a173eb001ce98deb3d9cd721d60d6eaf.1716373923.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR02CA0039.namprd02.prod.outlook.com
 (2603:10b6:a03:54::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 478cf7cb-288d-4bf6-7d1b-08dc7a799485
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ySDMqi0pRXS5qXk5vgoiEY2QEte0TOLU7WrOokRGkkQVPG/kw9zbZB6smWNg?=
 =?us-ascii?Q?tF58nRV58iRvbNRO1H8aYSnSiqcOngUYuxOObDJVRpmqDf1mxauWm4w/VXmt?=
 =?us-ascii?Q?zyWoTKX/mMh+s6xBUI+xR6S4AB6/tlWgUZ+BXH0lSfFOM+OfPu5PojAxioWr?=
 =?us-ascii?Q?KfnktDZm5fuiUgLCmwh1/O2c3SZVO8pkatxjMI9n0Uu0UGgDn8FTvaVbkePs?=
 =?us-ascii?Q?ByKwwkZOVs+ENBKpohA7CBaCe36gjNQxI7UnWlbg54htvWiEDSLlCjOUo4Nw?=
 =?us-ascii?Q?mbi3+wMRaGEXyzklkNQ6WFNHj+JJr2HqbhogJWUOkNTgLfTOCfl7f7DvejAn?=
 =?us-ascii?Q?r0i4Lq/JqF3UY33e/fCHezJEoL1rePrt3ZrNYXAnWqBgrLfEWXAWagnwQ1Km?=
 =?us-ascii?Q?45hFc/t1AYNPG5z2cHc9ogl3RzaUU99/R+JQuwvS/nZebANkkVt+zxygotEW?=
 =?us-ascii?Q?rQ1H1FKGJjuPMaizIKoJc+Uujd+OAzIAzdTjoM1WNh5qAXvNp3Mg58hOCpas?=
 =?us-ascii?Q?97spjRABlP4x9wSlk7xfOrYslP95gPPgq17CzUpZc0w3u6w8+GC/gLiKnmKH?=
 =?us-ascii?Q?WPD10+EONx8I59+cT0j/hvpL1d60/bBmR2q/kuk3l9hlvIPY7miqitquKTWI?=
 =?us-ascii?Q?yDxvTRNcjGBXLUtnzVYNSnzMOcrUB/XUOYcy72CGh1YbwHAJFyK8F2wX2526?=
 =?us-ascii?Q?r1+VWr8Plcdu7KqcP31qgyysrJdTXwYCbJV4m2sNoK1cx1hOhgqMT7dupHXd?=
 =?us-ascii?Q?K3KyP0sbW91sVo7peH8LJWSIMNIb/UNmu59hBACjYbgpoM6uyaW9izJJD2wH?=
 =?us-ascii?Q?1BqtNl7JfjvxiIaCSoMQ+qu2I9hpuNB8VlfC/UPUMUIe0O8osKIB2IvFlQbu?=
 =?us-ascii?Q?96rcubE125l3oGQyQZL8Lx0F1tszrMkdzxBmcf9L5xZek5gb0bQ5hWrahof0?=
 =?us-ascii?Q?yfmQGRSzKTdAn8J8cXLopXTS0ufPEYIhV6CUB6Kzv/932slqAMwfgAF0SxuJ?=
 =?us-ascii?Q?r/+k82Qve5AxkVlW8TSjjV66tWhD6+bnbr69lU9ykGhNdBvLWlC+FBix0QuQ?=
 =?us-ascii?Q?vnEgFoYLORcpcSWIj+pBhC/0RCP8NeTuA1OMzwjY7yLDfmH2fgPt7/aosq6i?=
 =?us-ascii?Q?/uaYV4viQ8QrHW+ARynNCM9Qk0HAWtzYsolBCWmGz7zKqrHMzCIRWe8ENhzx?=
 =?us-ascii?Q?nO3bVhOBmv/r7dTuczuWo1Wq7exyBicL9854t3oICaoQzSnCMa5/lJsczXdT?=
 =?us-ascii?Q?BdZifsW+cp3ZNaajnUgq3vCHfICNU/xBGKH+uQxgHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pIt5H05lvO7BwvOnJ0S1cDDghoz+4/50JFyd+X2m4IW/oyblZR9R1xFDWjWT?=
 =?us-ascii?Q?ox0GTaLlKClYyLG5khlfdl29gKTKep64QSc4yzCBP8r98LPrl77gSIc0CeJU?=
 =?us-ascii?Q?uS6R9FONnOX2pSvywb/WBZhPZF8gEiuml/O9CRLLnz1ptJa+DRasCUCXFB7X?=
 =?us-ascii?Q?B4XCqqT8FDNTE4yEdSB4hay+cvMr22Kt7MGNHL7mVO7SuLroxmf5/QZmYEVG?=
 =?us-ascii?Q?2MKY8n3gvAgi4yk7aToVpIfpCm4cSzN3qUbNTf7h1e+DImuf/FY9jlxv98ZJ?=
 =?us-ascii?Q?0ADc5vBi/Cd/f+2a1UBcLR3SX3Cf7j4XfYxCmFnrwuKnSze+vPVDTy0gtLB9?=
 =?us-ascii?Q?3fu1sN5YfCznTU4hPBC//eXWSDa1VQCCQxN6rlbft0CGZDkl/Aod5yX6T0Gv?=
 =?us-ascii?Q?EsmmE1kYR/pGcrZulqyaQV70rENPJjsCyefu7JTm+a7VztQb5bvFXCZGEcbu?=
 =?us-ascii?Q?3wOJQx918hT5KqT2laR1thqwDw5DLHoVDw+WtXpWG+T28w3xHvNiyWSohX3k?=
 =?us-ascii?Q?/v0yii/PWCg2IuY7s7sAzedetRlJdrb3XhhJEa9qPMnYYPjdC6Hf5g/eE4ya?=
 =?us-ascii?Q?Orn4XgJhnpmQDa1/ZaN5qCIFKd2qJE/qhVqbNpVPau12TcUUXsmpDS+fsGgk?=
 =?us-ascii?Q?ioI6JunLpl7hH1bHIMX3m+PRK2xZVLe8LY/Y0soRgEGbo/3nRlPxT1k09/23?=
 =?us-ascii?Q?Wnd4a0ve0MnWGdymVKu6VvU2LCZsnpnAXgFXvhMZ7tQ6HUcr0NF0LchuCwiu?=
 =?us-ascii?Q?lIk62TJljuSa4y6IlDBUZKs3k7nUTiyGmVqw2ggUSs8QURLgv/aYOC9OnwL8?=
 =?us-ascii?Q?sTcR4vkNaHtKI1kp4yZ9uG8I4E8OGmZ7VODhSzfhl4CN9Pj29Qw6Gn8p9udh?=
 =?us-ascii?Q?RFrLVyBsruQSR8RPxRHZ/KojG0LcaGjnOZseyAcanbFgOIMD1fat+vpy5ncG?=
 =?us-ascii?Q?f5Ok4vULBSRuJDVVTvpW3501x/+x3v+KhTKW0XZDxh2GLRS4q1SXN9GLBEOh?=
 =?us-ascii?Q?svC785Geti1pzUjWlbVcUvp+NFXuuCMHJ9CvFLA/bxCpHwOR78NYivY2GYI9?=
 =?us-ascii?Q?BxzeuIf09ckguKGOa3nGZpPgEOVWnskUeuQ1+Nq+WXyZtnswOdupMno/IhOX?=
 =?us-ascii?Q?lIN3H0XblZCOT0dihm3ljhOnpLa0EAyUFqIJvrbbk+5YicIFTWrZsM9z3Bpm?=
 =?us-ascii?Q?Uv5AXd1Bhazm0zEIIlzCIx8PCFEPc/ke3RZohscg8lI0wt5nX8NFPUqp2NdT?=
 =?us-ascii?Q?FTKD/xsNPXXElWCmGcLhH3AKAlCUn7FnMTudJ82ieW8aVTI5vIkeNvsM5dN2?=
 =?us-ascii?Q?vxUTV/VBEPYJFvVFYmwrv/+hZRQiAmfI5JxdMnvCXebMaLmu+3XoBeDE+2Yk?=
 =?us-ascii?Q?J5lFPrsGj80FzluUpVzj6oalveDJjWkXrRbWs7u73rdApMphHlNjIE550ELU?=
 =?us-ascii?Q?B98QkeuDKf4gc9fD9YkkOAAdc8FlqeK2zqpxPIP0X24GiSoY53uwSXNVMOKG?=
 =?us-ascii?Q?kAIgUIg3rC6cDzen4Fq6o/4chVi0GrlVmYMxmzRoUx1Ol/muYG19wCXludSz?=
 =?us-ascii?Q?Xrogf5ucgZ8iQrp+3FNnGPOSGlDhFMq5Bk9LJe0WSUt46A9l4DiVeu9Uo8qH?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 478cf7cb-288d-4bf6-7d1b-08dc7a799485
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:09:38.3955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjG03C/NbiESpiPtwl1rdxwLWAwYGv4P+7fkNN9SNSOXcROLIBuF2B8q7GbjiujXJ7bNMmf7iUpZ1DQfCsdGyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
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

On Wed, May 22, 2024 at 01:35:16PM +0300, Jani Nikula wrote:
> Synchronize i915_pciids.h with kernel commit:
> 
> 7b43a37348b7 ("drm/i915/pciids: add INTEL_SNB_IDS()")
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/i915_pciids.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 05f466ca8ce2..0d48c493dcce 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -151,6 +151,10 @@
>  	INTEL_SNB_M_GT1_IDS(info), \
>  	INTEL_SNB_M_GT2_IDS(info)
>  
> +#define INTEL_SNB_IDS(info) \
> +	INTEL_SNB_D_IDS(info), \
> +	INTEL_SNB_M_IDS(info)
> +

I thought we were missing the change in lib/intel_device_info.c,
but then I noticed they use 2 different structs for these platforms.

But a good thing to fully align the header itself

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  #define INTEL_IVB_M_GT1_IDS(info) \
>  	INTEL_VGA_DEVICE(0x0156, info) /* GT1 mobile */
>  
> -- 
> 2.39.2
> 
