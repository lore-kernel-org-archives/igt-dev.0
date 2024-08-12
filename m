Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B896C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 23:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4F310E194;
	Mon, 12 Aug 2024 23:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmgV0i03";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B3310E194
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 23:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723504243; x=1755040243;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F78GpH8cyUxdPuweUsHfRIMTNySaaGTfZ85MVRd4y74=;
 b=KmgV0i03k0Lche/V7jJxZQ1BYdjvyB/Gl6wmHGW9tmR9la1FhsKdVLSt
 IGJKqRmjYPMSXmdPxdIevMDtpyrtTIFkw4WXRV8Qw1kHbT8WC7340COpR
 PxAApYVWAs6+UQfu5Oqbqw4FylHOtCuo9vguxr3YpCbCd3CqmB7bn9O8O
 tsy8lpfI4Kco7bsTD9Y+1+jwlrnbnUXxVXyTycDkduTe/J33zprPfcx9b
 XQevntnbze5zJXLi88OsP3WOhQytSZh9/NXSEgVKXj2tV5gBLm50EWiR9
 oGltoPB3pu54r05uifVbMVny5lCse1MmKPpBpva+Tl6jXFD3nn4pH7hke w==;
X-CSE-ConnectionGUID: KJ3pzskJREiQdbQt94jtIg==
X-CSE-MsgGUID: AXk9DIxcT/KuiY+wRHOKoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="24547706"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="24547706"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 16:10:43 -0700
X-CSE-ConnectionGUID: SMOMYVyBQ0m/I8cvOBKtTw==
X-CSE-MsgGUID: lIKF2hicRUSktDSm/Q9m0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="63342130"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 16:10:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 16:10:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 16:10:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 16:10:41 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 16:10:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mebtkNeCBl6ZOMBmMJ8zb8cvWq/yVipUtmxGpjOIv6imGnBin4X6RZi+AkMrQQ44smUP5pGEbTr5VD7r9y2kbvvocQXqJ58RCSqmrups7nJ+tXmD12S01ote6cduTOO9USURD5qTtfWlbFmPZBCiV982uMUrgbYQuYd7OBx9eMO+mwWRoMCItIPZ3e3uuTSoOsZ8C3hX86zQgarjMwYzuhWmj442w4ulpol+Wd9Erzl2ecBgZYGSrUC0cwIPOgGsx6Z+Gut1DNiPe56ae0dAObuidESm84T4FHo2ygBk9MwE41wHNY4pWd5q+Bc2Z4Ut6lU1i7MyQsRWDHt0mA/qKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKBWRpnxYEyd3BJjIJn9/CX40QgwgH02/FJYizeanjo=;
 b=vhZNFMPezdNOCVccYzpT+7KnBRzaVw8UP55APeosX0RxTKnzYCCwneSWkbGUWKtH8IYBTwnoWYCdhRXtvdNz6vmS3iFEGTqkRClVSSoMOFC9a5ltnPZDwJ3IYMED68B3/wJmYqI09t7xRzxXM6qXxrQ96NbI2J/LMw8ZFlQ1xJ+bl/yC/j52T7WiB9rn8K37/PQ4BMtG7zuiRhoFzxTy4E5HrTf/Byr62nIeBF9XJMmXth+BUOS1GUY1X+y4IuI6uv6qf7D3cEBGP4kewCLFJP/tSTfF5QzOckG9QG3qGmR35GbsU0kNP0ECSQ9ftoZDeXsuwCLtOqfxwnyKd1WVrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 12 Aug
 2024 23:10:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 23:10:36 +0000
Date: Mon, 12 Aug 2024 16:10:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_module_load: Rename enable_display
 module param
Message-ID: <20240812231034.GH5774@mdroper-desk1.amr.corp.intel.com>
References: <20240809172936.2718506-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240809172936.2718506-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 951db10c-d53f-4af0-0d49-08dcbb23f9ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cWeOf+c1I/fOYUwwBbh0PVnrirpitZwKG9UzuhW5hV44LIHiBj+L56t5lUbj?=
 =?us-ascii?Q?gwGoIJgfycbi7yYfymLPCN/WOGa0YiG05xp46PghWH24Ken7L8GOPuEp+c5O?=
 =?us-ascii?Q?Z4+NXVmMe1KuI39/RXxzN/c6kreQsJ3tiRVJN5chD1q8GFKea8qCIXTeHg5H?=
 =?us-ascii?Q?/tJwJKIvxlxtlb+7hZ/3vuMF4ilLWEDZAIA6oV8ErQkTb9Cjv5dpDSimNSvQ?=
 =?us-ascii?Q?0Gp4H/brTtTgK3RINvGsqImhmfwnFgEBvoXsv1Th3cBHa2sbKWRppuffOCz9?=
 =?us-ascii?Q?or2VQxqIBQyD/YHD+erubLdrExrjdMU7IB78J8rfhTMVQm5jn+quMXUt/q49?=
 =?us-ascii?Q?dFY1NZ+DofcxmMI8eCU8BETSLdlnaprHvhbKnL8Wo54WEX95PO0kohTMX4JX?=
 =?us-ascii?Q?wV9E4qPdL29Z4B/SRFIYU+kVRrwpseTU5HC0aA6BvJOdc69hQsSN5MbmKncO?=
 =?us-ascii?Q?nAAbgPYKDrdhcICNuqc813gNf6hqLux3Msz5We5YBAYh3X7149filP1Um3Xe?=
 =?us-ascii?Q?XPwvoNO0gWmwRv58UcPxUwoZqJ2HILm8F9ps8ULOEizU4V+L30pKyS2s0Jgg?=
 =?us-ascii?Q?DAJ87+f/EE8NwUKliRkJgQfJAcJ1bbv7JI+M0wV8se/Q7XFPC76i/EB3Kmu0?=
 =?us-ascii?Q?H2ZvjzpN1HNyaVNkDsU+N/+zgrpntFtiRk7sk1MLuCp/moVg6yLrq3YGMy21?=
 =?us-ascii?Q?GossVrNu8IoISCpRbS9Scrbm/pNAZxqkzRGnuPG32wkMOtYOlqYEvImxB5j8?=
 =?us-ascii?Q?l28ciMNpxJ8BYNjvOYIINwwciHkjKaagOLUXfTTnQF3MtRljFVz+aTrN1UcM?=
 =?us-ascii?Q?6Y3aeafIU9aCd74zLyW+rjch6sS2N2eVGgotgmJfuwCP4E/gDf9pBkZqHFR3?=
 =?us-ascii?Q?o87nM7Qh8pVjx5RbT/vQiA8+0ntuEcYYvdHCu+hi/JS6qlTZS9jrh7jAh3Uz?=
 =?us-ascii?Q?kgCmQeEaEuiCo9m9koyYq1bLefekqutg6Tn+9zKZNyMmy4BHNbOvaMYmc6Ia?=
 =?us-ascii?Q?YWV6+W9ZYFyCWuLkbgvwEnwf9Allc6vyHIMMOw0mmlHeuhvm64RdO+2lKRM3?=
 =?us-ascii?Q?USgLhNTC3oGS0W33d0BYhovcc3G8BBQ7uvvQejvjDU+JeG8MJAdBxjWjE+vz?=
 =?us-ascii?Q?aDmBFnzQ5DR18SjvFsacmx6jOu3h1jfeOOKtncqNcBBV1MTCoj3SpxlxYqvY?=
 =?us-ascii?Q?yvPqqGSSx7pIf1P173fsZ7R/qEXsG3rINYhnY2UHEhUt9sotn2/P/44GtLzx?=
 =?us-ascii?Q?FfYKP8HXDQjODQ5Y5Ye0aVaFKEjp8aComwU2jCGV/mJPeY0c+H8CAaUkL45x?=
 =?us-ascii?Q?w3M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HefB6paFjqu0O2wpnA4hSqfj9Wp757QwS8xf/SOubpl/mow/YC+b+m2nrt4C?=
 =?us-ascii?Q?HryrVhRHc8JJi/eaCsMe8S3UHfPkaEMmwrIsYYbjCLc26efV9OzePZOv2Cot?=
 =?us-ascii?Q?BbQwms43g7J55upbqfjjIA5rKEHlNavZ6p7YhCNz1Oa6asTwcyF3V7U65/cL?=
 =?us-ascii?Q?cKMgVGOoTpeKz816z5E5Kai+6UelDgUo6tFwxi8LPZQXoAYG82NBTQR0EyHK?=
 =?us-ascii?Q?pq7HXNMrhPeXJSXlIFtrLcdr8RNfvp2w1x3x/V9XpPWSHnOTHX1Vl/18BxYR?=
 =?us-ascii?Q?dY+mvsiW9RJFYTQVbVax0rpiI1zvG06QawMF7Py/n+spshhqPKDJ9pnswf/s?=
 =?us-ascii?Q?wXorOz/rzvouURikgQuJYr2zCEro0HdO4Y2V0+NY0WMyklRCkNHzDJwOhs7X?=
 =?us-ascii?Q?DKCV9oVdlb4QpdImXLddhTcDsHOoOhBqGqonzDAIaVY0XXUNXL1du5FwwuMX?=
 =?us-ascii?Q?nkBiiSGI3mW3e+oi7ucG2A/MEEAcb9DqZmYV5HpSqbIIEdWhgFZ3aDb9iFC/?=
 =?us-ascii?Q?ms7gjpDoCXkcuX1AsnbMOQoQcEOl6btEDkXyjYTaUZdMvNiS9A07twRcTXr9?=
 =?us-ascii?Q?EDs2Klxh/9KxN1t1f705GqbqVmjbY7UeXWBZ4qcyS6A67cpsvnVmTZ/gm9/G?=
 =?us-ascii?Q?cNz9ROLFu/0hZUHpGzbdGgtHuZY9hca2AnqNHet2wKAHdxBJyPpgLIs/FdpH?=
 =?us-ascii?Q?TbQMOS2HZLK7wYWra0ofMr6XizCdfS9iWq7y3ZmBTzvPP4draXbI+8FtgiqO?=
 =?us-ascii?Q?XvKMJoTZNFMTdpQODhyUPd2M6FAvcWSHzfQ/E8JPDTJH4LVWfLkcnkADuoLG?=
 =?us-ascii?Q?Wc7I4h/D37ekgAlpSnWb+QMnv2yxGYWimklU7Mn1ZIWQCxs7Qsjx7yIXBvl3?=
 =?us-ascii?Q?2t4TQPBkyMdFU+x8pNLKowtPDVXgOyFTDpmGyHsi16EcD5D6cL7UqckvjOy+?=
 =?us-ascii?Q?yl2CZ0ZigWnhIJNS8d0tA4nFHgISQIIBaMdnDq4e7Q6ByVdecyNJB6fZ0Y/t?=
 =?us-ascii?Q?JllH6jfg/vCVKaYwx7Pk/WHoH41IA1+EKFuVpeOC23n5rmHQ9IWozAmiURUq?=
 =?us-ascii?Q?S+T9yfrssU/8rj4Zv3RoEDWz8DRYlaUlmNMS+BVEgABBjzPuolO4TyO671up?=
 =?us-ascii?Q?ERbFS6CUtXveLwV9p3fWPBGAEgkADW/9AQaqEGNfz95b/5nGX/ZR6HwALid7?=
 =?us-ascii?Q?6Aea525Ve2pO8WuYlrI6vEXf9hKzLblViDY3jKgiIHrOr4tIt/FXy9qh9vA4?=
 =?us-ascii?Q?7xRyqYI4rCCSVP2nXfZOOHvKFuAjtqIzCeuaSCsHsswG1KjXA5tUIZunf9lI?=
 =?us-ascii?Q?ndPPYn67yviTSPUrM8yew2qv0w8yyCSmyVJLppLi//h7pLKMFoqByVOyZUZQ?=
 =?us-ascii?Q?/ZlKrAJP/1AL3djxrHkrwvSGqpgj7OXxxbaX6pJf1PX+kW4C4lHssbT9K7CO?=
 =?us-ascii?Q?Brn5PAWNBxRsEciSIjh42n5TLpGVCEirg3Y8+Pd4Yuz1Gag7OFD0ckIf4awU?=
 =?us-ascii?Q?poa8++2l+9F1O8WJGcSzU9p49ATrTV5xps0JtN5ajSLxuHCH48zuRKPYDOpT?=
 =?us-ascii?Q?9njpDSIFKcIz1+yrnX7JPQGr5PeOXqjmiO4E+se8CNJGMhKPz2DGa0PBAk1P?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 951db10c-d53f-4af0-0d49-08dcbb23f9ba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 23:10:36.8739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98U6DFgMcTZJjZftljjhndRflczUgDJ4GhTm5rgixlg3NYjqDtFMc8ULV1mWFe2hRfm7pzo/ruHUah11xCpnbuOqCm8QyR7bTG6jmQAwESc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
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

On Fri, Aug 09, 2024 at 10:27:28AM -0700, Lucas De Marchi wrote:
> enable_display is being renamed in the kernel since it's ambiguous:
> https://lore.kernel.org/all/20240808180154.2495634-1-lucas.demarchi@intel.com/
> 
> Prepare for that renaming it in igt.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> After doing this I'm wondering if it would break anything in CI if
> either
> 
> a) igt started passing both for some time
> b) the kernel to have one additional enable_display module param,
>    documented as deprecated,  that we keep for a couple of releases

I don't see a pressing need for either of these if we get CI's kernel
and IGT updated together.  But between the two, (a) sounds better to me
than (b) if we want to allow mismatched versions for a while.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> 
>  tests/intel/xe_module_load.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
> index 0856a57c8..30259fc26 100644
> --- a/tests/intel/xe_module_load.c
> +++ b/tests/intel/xe_module_load.c
> @@ -112,7 +112,7 @@ static const char * const unwanted_drivers[] = {
>   * Description: Reload the Xe driver
>   *
>   * SUBTEST: reload-no-display
> - * Description: Reload the Xe driver passing ``enable_display=0`` parameter
> + * Description: Reload the Xe driver passing ``probe_display=0`` parameter
>   *
>   * SUBTEST: many-reload
>   * Description: Reload the Xe driver many times
> @@ -145,7 +145,7 @@ igt_main
>  
>  	igt_subtest("reload-no-display") {
>  		igt_xe_driver_unload();
> -		load_and_check_xe("enable_display=0");
> +		load_and_check_xe("probe_display=0");
>  		igt_xe_driver_unload();
>  	}
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
