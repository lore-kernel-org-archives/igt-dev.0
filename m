Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433ADC54FCD
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 22:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00B410E07A;
	Wed, 29 Jul 2026 22:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZ1o6D3v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBD510E07A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 22:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785363610; x=1816899610;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ifZO5aiKStuNXSjvV0g8bBzGQ21pgWGB0bWy3WpFooY=;
 b=YZ1o6D3vjvPZ7rtzLLgOI26zOmEI3+7rqWqYPZF6BfWNUARZvFPtWlkm
 LxvqEandfgFjy5OalGMQH8RXg72KkpNuxQ5kqT++eW88/OHmx4k5Ow3oL
 m2ISwYnv5X9oReJwgXeCxUR3vElS8kZl9iTW0SDnR2smJJ8h5guRFIfWd
 bJmhpsqbS8G8rbN1GViQOKliC31LN3QcHY701nSvMTLXdkJQnPF1brN5n
 8VXbcEd59EW7/7pOY2md9rVvG7KvHjP7RxBlkRzC5lNPu1N9SQyN3yBqW
 ziZeBdjS4QOnv/h4IfD91yoTyCHN7NyJ6sOA3piptUki60K4u2fH0CEw9 Q==;
X-CSE-ConnectionGUID: 2syuD9FiT4KbRDlF5IhcpA==
X-CSE-MsgGUID: kVV16gtKQrKuitoddkQi5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86058880"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="86058880"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:20:10 -0700
X-CSE-ConnectionGUID: 08VR/7WDRC63zfpco/w8rw==
X-CSE-MsgGUID: WJEDMNqQTvCvHMvPXkpywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="259548487"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:20:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 15:20:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 15:20:09 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 15:20:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMkBJUsmx22xcTBxQ9s2E8X4N3zI0/Hlqa2Uqrb1SUvF5Sk6BvXHns8rElcnPzD/0503q+PV64+3kQBQ05MvGdo4ZOQxobIbRMdTMLd8ADK7/zTXZoVgiI9R6i/pBxxpTivbdMsJ2FYMgJ4KBhyQuWb+M7/hpsSA+ic9ONOivYzAotP4TcTfImboDZT97p4A8cpwZxGvW3CrS3U5lF2Cxh810bvYB6EIPY5sbbeHauJT85mZTA+gTsPXkbX6B1kXfHNQ3zhiuNA8rK3vznc2lIbiTbnGdCgOee9RMeVZ48GSCZRv3IMiivkMPEmEn4UWleObf+iRsUfoHrKnwF+oCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTmam+VrDMS3/Ezwg7Zsj6kFx6hn/ybTr/6RJJnfHEs=;
 b=bmJNPvJ2zH26AhOm1qR5dI1wWg0Nt2qFUFQOg+z/WsQJi20Tc7suSvR00zzxwaYbER7IPy0zx47ksEM0zm30akl7wTsW7RqnjCxLlNuch/LKsGlfqY62EjuML4C3t/JzbPT3PXKwMlsHkV8cTtdGQ8+vgQy7AiYWfQXTZFGk7pAzQNVd7SiiEUvyfOcik5Fukmu5Abacq0W2LvAS40hTRtowK0IgUNCnOjReG5kq6Cb2IR6cpNIo6ZNRJ6eG6p+1Mz7Mwc7NWWdLxZBaEbfC2ZGx5JFPVxZSkrysket+DBYBtTDiC1u2HepCEHP2mYHkIr/ueDzR4mqOIeFDcXp8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS4PPF9E4E1C227.namprd11.prod.outlook.com (2603:10b6:f:fc02::3e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 22:20:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 22:20:06 +0000
Date: Wed, 29 Jul 2026 15:20:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 07/10] lib/xe: Add xe_wa_from_cache()
Message-ID: <20260729222005.GG7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-7-0c147eeefefa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260721-wa_14026539277-v1-7-0c147eeefefa@intel.com>
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS4PPF9E4E1C227:EE_
X-MS-Office365-Filtering-Correlation-Id: 829fbd4f-441b-48a2-712e-08deedbf8b43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|4143699003|10067099003|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /Uidj/qJG3rp8OL0UVR/0hjhgVDFXR/OjZK6Faiuhxv1p8SCvd+SPwda61m40Ul4oQfs8u+GHQnm0G8jwZfOSDr/ZJ6uPduTyfchjFcpBMBZCUbfm7KMiksS0HWL1lxeLT9QGWOhol25TqyGR8Am7ohwCKDh04McubAgXmDyyG0XtSjCTdY/AdjRPND1EWS6U8fPe8bDs6rG/2FdCFDdsOKnqfLrUTRyxB1sgvDh6/U9STnOdEYtTiprraDC2jrPnA+16huEv8jGMAHlq3yUVI4d7BDxTXKOgoG2/6Rw/gIl5Bs57ehrz9FI5sCdvMy81m25Jdy0wdb+kCoLZwBwGFUVK+EWwShj0i30ncmZD8Hj/+3sIMRTX6C5ZGKT2XcAUJI7eyjHumrOdMF7WGDz0ezgclNTVqZ80aAPYt6+q5tOnq6Il1Sfo3w7H93xtxZ4e2t9i0gdl5i3FIMEaJugbFYY2AMYdI0Fr6AAMWQuO2hzRuOMMF6HAu1aLMhKEE3jBO2CA8PztG9NHLp9donXFYcbdj21WyYC39H6Aw2eJ0S+p13D4W9cTjtD2AiB7BI8w2xUpMXOqsjo4lZS8/gWjHzd50O1YLYU/KbCCLOwJD/W4vK/2+mU0440I2pCrXWUB53XQAsb2KO74KJhHsqXv1mpuJiiY4ymfiyRAkTvdWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(4143699003)(10067099003)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gu6Rv05Wp3RA8uA5YN5HYZ8eDWOLzX2c6DjQzbjR+4kgoPDsQ/rjfqM/8xie?=
 =?us-ascii?Q?XiZOAZR8g3etCmMkgn6UvImedS6um82ESfNrsOX/AEp73vjUse/xfT+EYv69?=
 =?us-ascii?Q?LIX3xhb75w0ihxKgLmbAwm0wv2Z4GPfDKShGCYut+qjzDfOw+LDbqiDwKa3K?=
 =?us-ascii?Q?vPO6fKwmx2WXfzUnqPQTAHEsqi5ap4sLus0VCNj3iTBs6+P/EKnYITB8EoYy?=
 =?us-ascii?Q?UyZTB0suHGRKueQaTlmB5qkEJuyA9eAeBS4C61IzGa0Aj5zy+SwV7fcoUvYJ?=
 =?us-ascii?Q?Pa28j1nBDCdk6SSCZkWdhLx4QjD9BfVFogr1kszw0Hh2at06rN8TRjJ4ukJh?=
 =?us-ascii?Q?wEfEsGF/aVWfWlFD8oCXgNV3sEEKo93KTVL8ktLPA7WsjHH3V4buZbmNqvgh?=
 =?us-ascii?Q?qAmtglqhIyg+hSDYEkFpjj9vNCoiRvrg8RRMVFruyaUjBjW++wzaraMgL9aK?=
 =?us-ascii?Q?qXdZrHBPADybcnrbKfnoypb8BTs3fKMk7Waf/3WNqQI0pRE4sECxCPS2F+5b?=
 =?us-ascii?Q?6G0UHys/9j8uKpPfjZxI4rayHjGoRTSFtYWiv6SkZFz3Tm65ZLpTJ/7qjFB9?=
 =?us-ascii?Q?7QwKK3/tsUEQ5n7cs6355CqWU+j+KE2uL/d/n6UZG/5R133D6RuuDsNF2htw?=
 =?us-ascii?Q?fPkQ9XTnr2WaGWR0ixso/0U2piv3A4bNRmA08NFwonIlC+RGA/ZG8uOtL08s?=
 =?us-ascii?Q?jpBqtYM1ETOLXsy+ehR3dK2MQxF3GYPn7MMGmC3lpGouIBHby1E7Pvd9r7ke?=
 =?us-ascii?Q?XtTa7Php1KsayvHm9VuZRShWeL1IUlNyq5cRFVtA7gWpzQo1F10vKrVyXo3A?=
 =?us-ascii?Q?uJt/RsuWcqKt5A1Ax1ruJjefSwWXwSBVl1Kp20WvAPakBV3GSskaz9z48SKJ?=
 =?us-ascii?Q?nz8ttvZ7EiXuMCgKe19IFoRPcEYe2lIIF7rSnSMQ20TLfAU/b06R5fcPWN7C?=
 =?us-ascii?Q?wmHdUK14eI8Xf8UVnEOkkE6ykbpTNKm4l2ds9H00oC52Tw39wuRqmznc3XKT?=
 =?us-ascii?Q?+2kQpzVoa6SMt3r0IKDvIRLznULal4UxwfVjiy13b+41MdWlBBQ8CAJ9Xtjk?=
 =?us-ascii?Q?oQgOwfxnOhy51mRAk7Q7WSh92Q4t3MlMTIKEbzVv+0wTVWjudz84dKCVp2X3?=
 =?us-ascii?Q?LzpLZ5OF7HeYKQH66+mzfhNu8wfuiuL+DPXnWBIZxpbIDFCkMCbx7HF7iSbw?=
 =?us-ascii?Q?e/IXTx95l33PrLtiL/iPyWLWODPipGp9wVBUFld3laeyAnQXFqN/0hRIFojs?=
 =?us-ascii?Q?AVmOtvkfx0n9VsMWYtEoYdHPGo61+b+6smrcfD005FTpQ/5HO1Vs/BGDPw0M?=
 =?us-ascii?Q?hUGTT4SDWuzywAgMyDXxEVpfCFn+zaD3diziC5tpqvfo9BQLVbuXl6IvpuBg?=
 =?us-ascii?Q?8MgjJSxa3GUBOXLlRWTsoR8O29kfIixV8WAKZe/sC6wcB2Un5Y+YTJj0xQBg?=
 =?us-ascii?Q?rYj7ASeNVqjQ8uUx1kjeC1VqQC50xSgsGTar9Ea2u4NvBdDmgqk5Pp0hMLbT?=
 =?us-ascii?Q?0LupTcvwZ5JX9/Dqf17ZQQan/hmPJAnaREiLGIk9nlmk7LFDeA1VTTyMylD8?=
 =?us-ascii?Q?VNmU8MMx0+JKmR7kFldwUK/dz2ivDnkOuEJpuX6z0uPrbzcmp0h1uCprsFAn?=
 =?us-ascii?Q?F5tgNYenz5kapf4QCOadB2LKGwEXM3qjirfY7TrPrcYdE6F1WdjhNbA8+rsN?=
 =?us-ascii?Q?1ec2iERm238T5sZJf4RFw6qQbb3rigWJk39L2jSPLatupRLkSWdSNbjtjjgU?=
 =?us-ascii?Q?UPKBewit6zMqwxOJvrqWvjF1s5PR10k=3D?=
X-Exchange-RoutingPolicyChecked: HfEyPmQ+6xRmh304+2NczV+cmwoUP5ddId+q/xt9jnabaHa5dOlYKtbToXM+ixy4t22i5jBySYviFu6UzI7uu3PqhiPNZocLNu8eHwb68dEvUiUccUSibNsDE8/HIOmbS2CNETwBsteU9R0F2L73eZKAC0vJHo7++ny8wdr9yMACI+KTcMRjh5LQuh5b6kKFISl43rxvCz/P0PprsBkCUYFia3MJedHW1/QendX9eC6KVj7Q9AzWJKgnUdZVcksuStdKtklgabjpZrtYCCtAnHTtdoNzRTYAetmgKo7M0oGNQtABGvWLKLt1kpCYDYM8JkTmmEQsM+mzC0hMsla4Tw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 829fbd4f-441b-48a2-712e-08deedbf8b43
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:20:06.5872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OWcv4ai38mXf8334tN6l8uND/HRHFSJNN88BuYelqtxYkcYczI1nyBidtDHDvAN+kkUtHtcYHwCGY0LLKVUfzyBPNUgN1mwMYLsZHXs/os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF9E4E1C227
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

On Tue, Jul 21, 2026 at 04:00:00PM -0300, Gustavo Sousa wrote:
> An upcoming change will need to check if a workaround is enabled
> during the creation of the xe_device struct, i.e., during the
> execution of xe_device_get().  It is not possible to call xe_wa() in
> that context because the struct is not yet cached and xe_wa() calling
> xe_device_get() will cause an infinite recursion.
> 
> Add the function xe_wa_from_cache() to allow checking for workarounds
> in that specific scenario and make a note in the function's
> documentation about its purpose.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  lib/xe/xe_wa.c | 34 ++++++++++++++++++++++++++++------
>  lib/xe/xe_wa.h |  1 +
>  2 files changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> index 8c8f7156c21f..ac3dcf6ef1c1 100644
> --- a/lib/xe/xe_wa.c
> +++ b/lib/xe/xe_wa.c
> @@ -105,19 +105,28 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
>  
>  /**
>   * xe_wa: Check if a workaround is enabled for the device.

The function name needs to be updated in this comment.

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> - * @fd: A drm file descriptor.
> + * @xe_dev: Xe device where the cached data is stashed.
>   * @wa: Name of the workaround to be checked.
>   *
> - * Return a boolean indicating whether the workaround is enabled.
> - * On error, returns false and a warning is printed.
> + * This function is like xe_wa(), but it receives the "incomplete"
> + * (see next paragraph) xe_device struct directly instead of a drm
> + * file descriptor.
> + *
> + * This function is only expected to be used in specific paths during
> + * the initialization of a xe_device struct (i.e. during execution of
> + * xe_device_get()), where the workaround cache is ready
> + * (i.e. xe_wa_build_cache()), but the xe_device struct is not yet
> + * fully built and cached (which is a requirement for xe_wa()).
>   */
> -bool xe_wa(int fd, const char *wa)
> +bool xe_wa_from_cache(struct xe_device *xe_dev, const char *wa)
>  {
> -	char **dumps = xe_device_get(fd)->wa_cache;
> +	char **dumps;
>  
> -	if (igt_warn_on(!dumps))
> +	if (igt_warn_on(!xe_dev->wa_cache))
>  		return false;
>  
> +	dumps = xe_dev->wa_cache;
> +
>  	for (char **dump = dumps; *dump; dump++)
>  		if (debugfs_dump_has_wa(*dump, wa))
>  			return true;
> @@ -125,6 +134,19 @@ bool xe_wa(int fd, const char *wa)
>  	return false;
>  }
>  
> +/**
> + * xe_wa: Check if a workaround is enabled for the device.
> + * @fd: A drm file descriptor.
> + * @wa: Name of the workaround to be checked.
> + *
> + * Return a boolean indicating whether the workaround is enabled.
> + * On error, returns false and a warning is printed.
> + */
> +bool xe_wa(int fd, const char *wa)
> +{
> +	return xe_wa_from_cache(xe_device_get(fd), wa);
> +}
> +
>  /**
>   * xe_wa_build_cache: Build cached data for xe_wa().
>   * @xe_dev: Xe device where the cache will be stashed.
> diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
> index aa1c50c0f9c9..2f141ae15016 100644
> --- a/lib/xe/xe_wa.h
> +++ b/lib/xe/xe_wa.h
> @@ -14,5 +14,6 @@ bool xe_wa(int fd, const char *wa);
>  
>  void xe_wa_build_cache(struct xe_device *xe_dev);
>  void xe_wa_free_cache(struct xe_device *xe_dev);
> +bool xe_wa_from_cache(struct xe_device *xe_dev, const char *wa);
>  
>  #endif /* XE_WA_H */
> 
> -- 
> 2.55.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
