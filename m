Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC476C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 16:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B2E10E411;
	Wed, 22 May 2024 16:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhnnukBT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8A910E411
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394003; x=1747930003;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7g1iN0haeMAJ8UfC42nB1jETv3cGX6tamporQ95pEyg=;
 b=XhnnukBT209ZjYAi8dogNzUtGqePHBuuAPAt2qsQa805zt2OIA+GkFEG
 DJoTOrmjoD3b14M8YtWoM7GDD1+KUUywpI4pwMqK7H4ApLdBngXuo/BGg
 b8GpZp5sF4qYDCTAam6/nXd7rW5QSTvSshR4zFDKsfTC3+ONyXZF+oyLV
 sWzDZDO+3G64sYrE3JWJj/aZ/P4gqOZ7HbJq4MqLHVRW7cIiu/G72T7mW
 6UaCxshRDK3jTu6HScQCqm96IyUeI4SGy9CUuPqf3oDv14kglFjOxUHpE
 N0/T9OkjyC3DULEOOZY5Swi6LUMz/WXDt7JP5JALrkQ/4Ff33pcO6fF5r w==;
X-CSE-ConnectionGUID: 84B+1DMQSWuwSCBAoC3xEA==
X-CSE-MsgGUID: 6lmeZG2cTnG9uK93P5QI1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12534967"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12534967"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:06:42 -0700
X-CSE-ConnectionGUID: AWQXBq9jSPmBX+NHGTuRow==
X-CSE-MsgGUID: FoRuH5u2Q0mHCRQTIdwZzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="56581899"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:06:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:06:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:06:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:06:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:06:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeLDjwM89PgqxA+HWPpBKlxQIBMers4XFQ+M3NP8lwfLlRKto4j95Sf0urfLX2y/9dZ7ahC5NMFK8MuIq0VE7YNRlg14P9hKEI0qkG+YA5P153yzdDW5il87PFWXgsihRmDMxxL7vtPoOJmPspFtMGr7DPM7BvUdEv7isgGZGl7B+altCeWtGA0skow9vW6EBaghAfTBgJjVU1PVhsnUgDBrSTBt6NZsgEwtGKt1UKlFU8fqf8a2woYgMbMEIW3XmgbkdugA6qpxL1TS4sEaNtST0hWw8DxzMygngDeOg4phbY/oHlLULWDBkR0fSPzNYzznXNOM2ZnPZEUBhE6P1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPN/k/gOTKo3S+OHJ1+K7pwfUchdNGzJBg2IPz83aIk=;
 b=LVZhJBiWSaPhr6ex7BaFVSRGQSZaeK20S7j+6xSY3DzK+5gliycWK8k++0wY3bwSeph37ad5Vu0gFPcx1AtuGmEJJu8OUKDT4IoyCcpPeP+rwqsME7ZjPayPFjyYUvoL9GNQzZFnHG82ErxbryE7O1KD9w3BlsuIxBoknxCvYMKG0RP9HWgwP5WAN/WVp3tunYn113cHCHfpI3kB5Npe4TAH00gC0mwLrOpShE7w0JeDqLD+S22LERwlg2a0eImjPoLiY5RrTRuovJwlwFjK88DCsdWiqB5k1BMEN/eyRhmtyq17D5LK/HJhSSC4Dq8pJ5NpR2bGB3UdtD3sSfVM3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 16:06:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:06:37 +0000
Date: Wed, 22 May 2024 12:06:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 01/10] lib: sync i915_pciids.h with kernel commit
 432ed92bfb55
Message-ID: <Zk4YCfSS6ua-yGae@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
 <71037598d3aefaf5f86d197e9556e606b3717664.1716373923.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <71037598d3aefaf5f86d197e9556e606b3717664.1716373923.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: d548b762-de80-49ad-9aa7-08dc7a79283b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u0XaBo17/m9D9L2QbtjZ8XReoFQxAcc3UXW6a5Eu5GEopaimvaTuX97iGGQy?=
 =?us-ascii?Q?yqyOqwNwHmViiAS8N9+PIGp2A0HGeyjG0L9N17Ylc2ngtQYBVn6RjX82EAEF?=
 =?us-ascii?Q?C5Rqz3/lMJKr24eA+hAvcGy/OyiG+cFVGzxdJyHMeB26R2G+7ikLMe6UI4QM?=
 =?us-ascii?Q?go86jY1dzfLK3qApBBjWO+m/7RjkJAUkvWRCpxsRKQ8swHxQ1V1mcpaxF5Wj?=
 =?us-ascii?Q?Hp2OXwYyC/SRJYHGM3RqmDuPapVH4SXCugEnWaXJpEZQ/k+mUIRidhgLbLdC?=
 =?us-ascii?Q?ia+hjKQOLBlkFamwFqCfzj3LY6VIwq9GSSaiG7MlIrvljNz/lIXmjQmOFQh5?=
 =?us-ascii?Q?OoBc3RKMLqHGChmGAi5iRt1mUTZ6ZGjf0xIJE2IC09ay50dzxNOz7+w4+OWn?=
 =?us-ascii?Q?epj+SUOhBRHiK8xCXvAoyj4QDPwxWXKwTh6KMJ3MwnsXkSBxvAAcAnndTUeD?=
 =?us-ascii?Q?mrAnEwmvmlfT50K3IBVlppHPnXKm0CrJk5M7rCz6jsyYeZB8+J2lJ/zCo7Mz?=
 =?us-ascii?Q?jA8pxZICfAZWJwgG6dy8laT9JGKStBy12duXCmoEkSLhmmy0OdszQlM2Gatl?=
 =?us-ascii?Q?Dt2Q1jOOv14ov7nVWXxkbuBKkfzwqJUFemITzBBGV8UOiOus6e8+ReCB7dt7?=
 =?us-ascii?Q?rQ6MQyf80tHecV/gmsUc+gj9WwRsSR0YY61T5/rN/OgOUJiVrJsu7DSIUVNO?=
 =?us-ascii?Q?bQz7B0O4tBuDgDlrIxapL7WXeYpkjq4Qf1QtAC/iyBaAdRmsRmGZK1Z+pDu4?=
 =?us-ascii?Q?pGgnPRnXX6xLMKIvCGqHsm4ACHVy3DWut9nnTgU9VpBOkfsRz4dRikiiyyDo?=
 =?us-ascii?Q?azfqqMTBSWTMk+k2Ztf3G1MuJMY+TBaAUGuxlAcrzQ6oWDp/UPQH1zdkRpgs?=
 =?us-ascii?Q?cixTi1dOgfl0RsSuueSuQAuG8ElLhLW/74vuf0HWu+GT4rkLSbp7xkVEg8tk?=
 =?us-ascii?Q?nn/PtQnJzci2592Fz5HDEpZgINsFmepEJiqXQ0tHvw1AyuywWB+t5JWIW/Th?=
 =?us-ascii?Q?qUaMrAK8MpMGIxqDWbT+ZFmz0VcNigd9mcgh820IfmT2IRoCVejcuLCScmzL?=
 =?us-ascii?Q?YpkIMJWgGTBXbsjRJFVY1q15GogQRkpRYSyi0mSU5+trAHNi139XdLBXwucg?=
 =?us-ascii?Q?jBHPxbRs15E8qwE4II/cUIZdQ9AQpnVTunmwusavQy4INZNFLwz8KGZklC4s?=
 =?us-ascii?Q?3EEcUGYuktvvn0+sW6g1o4Ptz4Ro2Xh4tuLydLrlYFUbi3X0OKPisFR8OdSw?=
 =?us-ascii?Q?7rb+o5LTjRlHr92WojY/G2vlRee0nA0wIyJj2/gi8g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VDZg4LubbT+EIH0CqWm/zFsDb+UUaqhftio8oyy/ic97nKU5shZNOsDpEHmw?=
 =?us-ascii?Q?nEbWB1nuhgL8CUIxXT/dHi1QNNhTdobFgpS4nnWKpu6OzIAAqVTHhdDRkrkm?=
 =?us-ascii?Q?lKk1j5bXX0tIcJJyk72I1XHz0vIJdzx4eiazpisS3Hiy0jYRpVLc5+zia6Tz?=
 =?us-ascii?Q?AmsjyIKpjVuKgrLAhh7JGuBtR5JEUixcMsRM/FGqIFT+p0pWCViCk7fdNwB4?=
 =?us-ascii?Q?pk3VmpwMEjI95Y6H5CvW6u8KNBFavUOIoLwPYp0TPjr93QMpPQOL1uEn6XkG?=
 =?us-ascii?Q?hvhM6HWhyO/m4mH2nHrxH+IAKENziZEyFQWwIxahGP1oi+7iEexi7n/R0Db9?=
 =?us-ascii?Q?8KEVlq2kCyKECmp55Nzhg91aB/Yk69qjJhEQFSg+Bldiiflmy7AwQOfT35iT?=
 =?us-ascii?Q?bbhBuFYc7LxVW7T1yYgwrEfcYGMICSi4NcLg7Yuku2m/DUo5MbvB2aZPGcsO?=
 =?us-ascii?Q?eQ3AiqJug26cJ+dnr4036dWU7b3fspQAtl0djF45go9KM7gq+AyLKNDKjtQq?=
 =?us-ascii?Q?jbpIfbBiSD7t228H7gQEq1qA9HWgsC8yBjGfELPQS/c5+5fRMX5Ax6LskLkq?=
 =?us-ascii?Q?j/nka3q6am4BaR1vuxbYYYzxDZD0ZSkxetXS0PPX9AdQmZUCMWNp+Ijiv38q?=
 =?us-ascii?Q?k3LBsaQj1sRskz0tsWQ5nruYUQw1lqyhTYPW1n+09IAz9PpnoS8IrecU0UPd?=
 =?us-ascii?Q?ngAOEImPbs58GBIEfLMSeB3MCrZvg9hNLOfRMpiXS/5/FKs/NRBmO40UUx9x?=
 =?us-ascii?Q?GOCFP9wkQouCn09mUj2l6VpR78nq+puYr9ph6SADtMBACv4cHURd+vGMHMER?=
 =?us-ascii?Q?wzuChH5xp8xnRmLU8uD/MqdA4lVDcpAXdPDkZVMV+WBIOXaOS8ozw8mzIyZb?=
 =?us-ascii?Q?kwtiDdgn9ay03c9Gc+bwGXB61jy0hhV78xZz3YZKZWUEjYTfzdscpleyW+HJ?=
 =?us-ascii?Q?D3JlDE0QRgDyMMqOqIlf1f0k4cGjAj6pXXnSuY6oyP7YjzfP5kstjGowbCAz?=
 =?us-ascii?Q?R9kH5wAWJ78hAiCShyLep7ittaEw2AcUJPm81HW49uZ6OtCM78tZTdq1nhgq?=
 =?us-ascii?Q?pWXytWHyculayEbINLzylGFfHA8riv3XkJeius5CzBF7Dh+9CjpO0XUOgtoF?=
 =?us-ascii?Q?upHz07wN7mlE3Kmn3Qo6nOXRd4eyY7d1Wel43/oInIBvbGqk9DWCr2IybXhf?=
 =?us-ascii?Q?Abn51nPbwtYQU4cQuu0ARJwp08JvRaoiQo3+mUeqdmcrBSsaM0zpny+7tmTM?=
 =?us-ascii?Q?MLoHcdzQU9jhU6MG/NUp859maIO8Gj1W9j1hIjq6uN6030Pz/36LePWEi/xx?=
 =?us-ascii?Q?LyuNLCjd19DHGI7IQx+0oLPELPfhd2l5n7HGM5nTWgDNwWVHX05UaJmMIAtC?=
 =?us-ascii?Q?WyPY62muDGzYLmkDE5CNOX53AHxVU7zQyADOZZSgaRqtybku2bIhJwYdxvc3?=
 =?us-ascii?Q?uBDdQ8POBUwDK9LWrPOie2v2rY/rQd9edh+xtNJtlYCgEZ4kWB09UVwum5W+?=
 =?us-ascii?Q?kKObsyGmiIvscwe0nfuqxsAHrt6a/Jbr9zvCUu/6wakNCwaSy5l7FdgswkNJ?=
 =?us-ascii?Q?033AuEUGVkSZ0fZOE3iilKGQHjsuFsBfGDxbsIhnoIXen4EdhFGyao7DluSh?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d548b762-de80-49ad-9aa7-08dc7a79283b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:06:37.1127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RegDcs5lIxWyFhKuBr1nivY/445oi3+8V7RlYTWDZKChmyFn0jX4LvwyoczL5lV/Pg6Td21cN1mObOGNmyCunA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
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

On Wed, May 22, 2024 at 01:35:14PM +0300, Jani Nikula wrote:
> Synchronize i915_pciids.h with kernel commit:
> 
> 432ed92bfb55 ("drm/i915/pciids: add INTEL_PNV_IDS(), use acronym")
> 
> and update the references in intel_device_info.c.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/i915_pciids.h       | 8 ++++++--
>  lib/intel_device_info.c | 4 ++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 85ce33ad6e26..21942a3c823b 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -108,12 +108,16 @@
>  	INTEL_VGA_DEVICE(0x2e42, info), /* B43_G */ \
>  	INTEL_VGA_DEVICE(0x2e92, info)	/* B43_G.1 */
>  
> -#define INTEL_PINEVIEW_G_IDS(info) \
> +#define INTEL_PNV_G_IDS(info) \
>  	INTEL_VGA_DEVICE(0xa001, info)
>  
> -#define INTEL_PINEVIEW_M_IDS(info) \
> +#define INTEL_PNV_M_IDS(info) \
>  	INTEL_VGA_DEVICE(0xa011, info)
>  
> +#define INTEL_PNV_IDS(info) \
> +	INTEL_PNV_G_IDS(info), \
> +	INTEL_PNV_M_IDS(info)
> +
>  #define INTEL_IRONLAKE_D_IDS(info) \
>  	INTEL_VGA_DEVICE(0x0042, info)
>  
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 64b5246b7783..88b160ae2d69 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -530,8 +530,8 @@ static const struct pci_id_match intel_device_match[] = {
>  	INTEL_I945GM_IDS(&intel_i945m_info),
>  
>  	INTEL_G33_IDS(&intel_g33_info),
> -	INTEL_PINEVIEW_G_IDS(&intel_pineview_g_info),
> -	INTEL_PINEVIEW_M_IDS(&intel_pineview_m_info),
> +	INTEL_PNV_G_IDS(&intel_pineview_g_info),
> +	INTEL_PNV_M_IDS(&intel_pineview_m_info),

when I saw this series my first thought was it would be good
to squash them all with a single shot, but when I got here
I understood why... it is not just the header...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  
>  	INTEL_I965G_IDS(&intel_i965_info),
>  	INTEL_I965GM_IDS(&intel_i965m_info),
> -- 
> 2.39.2
> 
