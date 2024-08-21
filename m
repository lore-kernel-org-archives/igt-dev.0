Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31D8C52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 16:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D08E10E666;
	Wed, 21 Aug 2024 16:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETpfFZ1V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFE910E668
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 16:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724259024; x=1755795024;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LMc4cwE4+wpvgZ8tF3gBUlPUUcZfBM7N2CJlK/6aTz4=;
 b=ETpfFZ1VORs3+fU0gQRpjhnIJrTnppKOjQEdaV3SWsNhbaS7aPTr2RYa
 LUNE+H0+tuzw9BkR++TQdNS3R6xce/nOEqy69lh89g8lX49VcvFGvWVDX
 W6QU9V6GBNmGVmYJOiIVFdf2OZPnHajYkwCCNu1WKQePMYVn1Xq5xAmFg
 nEgOwx5VfkwYDS/LeSFx9Xl19UO/jX6u4oWVUkJaRS+OjnjhrKN7Tv0Yy
 FFrEuXeBqqKjl7LFoWi2h+5WO/l6FMhSC+bCDh+0rcbIt7fnydu9P3D3o
 vhGeSBO0wgd5XNEWExc8WCxq9dte9KcQMulAPCroe245wjNffDA8MA1HK A==;
X-CSE-ConnectionGUID: 3dABBQvoQuSx53N9v0lUCQ==
X-CSE-MsgGUID: qm9GFlRfQU6A0yAsCG/QAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="13136075"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="13136075"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 09:50:23 -0700
X-CSE-ConnectionGUID: G0QGAOVtR4SjR4Xo0WPrAg==
X-CSE-MsgGUID: dlaKEavWQNeyJGE9402+3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61453398"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 09:50:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 09:50:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 09:50:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 09:50:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 09:50:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fszGaXjnF5UNku6wB5dvtTznYGF1As9BW7c1R/RAhvomMgNKmwe2t42fQ7SWEmKaekLdpq+/gU7k0X6GvbxOaVvFM2pVbZabWuIiUoOR6KyuxxJmcAo0Bmz9joe/yz1xnqidc5bgm0OPBRJGj1p1psfg23cutHEZYShA+9cBTjH5PtFpjiHGQZNIUGr0e3DcYCcDzX1aK1i5uBODlS642F8UrqKXAsapS6zf0yl1r/m/xiqh0HhZj9bl96RC+1KhPIm5OjVyYyZstgAF0tploj47xa+lEEQMlaIFHbhJrvgOZgDTHbGrf9oQSci1uoKL+yXMPQ2K1gd7uAjr7TFyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pr/5RhjzKI5ZYmHutj7qn/leYPRRivJuErHQsW7tI08=;
 b=mNm8gMHeE18dFUf87g9betLYe6ubSTN0JfDCmGuBVl5oOvInKADTEO8EsdHhGOVErx1qGFQpb7iZ8MnQWpvD7rR6lXjm4wbjvEqpBJsVlLMJ6djh7kV3vdHgVnuntZz8qWSKoaIj17eUuYANeAMLTWnbgjGrFiVaVLusE9uTJooDavuL2eRiLdWbAGaC3wZgod08MEwDn/BGHozxvTqGBMRqNSLMFCMoyOPduVMdnYTII4two6W0k4vddxhA/1zUAc9y1VWwFPs2LBCtsB+c4NODAaKii3A7HVljy+MH7gwU6+LZQPrQRrF/z5Nm/abgSsOcq7OoGCWVeYeVMW2zrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 16:49:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 16:49:49 +0000
Date: Wed, 21 Aug 2024 09:49:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for Add
 support for hook script (rev4)
Message-ID: <20240821164944.GY5091@mdroper-desk1.amr.corp.intel.com>
References: <20240814204822.95283-1-gustavo.sousa@intel.com>
 <172378643015.652113.2776111260174230564@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172378643015.652113.2776111260174230564@2413ebb6fbb6>
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV2PR11MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 383ae2ad-d2ae-4360-930c-08dcc20144e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v0cw18KJI67XtWINWUKAYmB5DyJ2YXJUvwmgWNLELTlucZMegKRlgDwHc6Xm?=
 =?us-ascii?Q?PY3WIX3KrbA6FKRLdFlZXmF4qjMTBRbu4sZd7ZJVUPQUFn3n7ifCnlDE3YZd?=
 =?us-ascii?Q?0WUEN6zMXjZEbgwNtYZs85Dzsq/jjdkbEK7MWwjlpsUhsIiNjrd4Uvc1FOgK?=
 =?us-ascii?Q?SbbidczXQorGGIatfcLde3rHoujjPwTvTQLjbBDlfhgeMspWgQeCfGftGbXF?=
 =?us-ascii?Q?qUx9eCsUDdVClnSrrzb5mnWq2rYnw01gnJ2rU64xLb36654X+MEglpj8DIW/?=
 =?us-ascii?Q?MDOG5UIkyul3+SZlSg9YKnB8OFGbZ6Ti9lDd9c/sxj+IyNdA2uYtyC9iUJzR?=
 =?us-ascii?Q?7vBRqAWsqc9szdcbE7rSPu2Jyx4T8JebFGhVHQnJtgoyXf1tAfowj2/tGlc8?=
 =?us-ascii?Q?iJ9wxXm1/yrsobX9okPLsCJAtERJ8VBtGyQ6jK6Q4d6XvilPHovX368PvRAD?=
 =?us-ascii?Q?yTDsErBh5c+PmVIyXAmkyakkajoqHF3AMKIU4PdhBogvoniMcWhU0uJnI0lP?=
 =?us-ascii?Q?RQCbrijGfEMicK3SKSzkeQbvDPFvJzj7S1AfKxUEq3yFP3L3wB3HpPJ0TARR?=
 =?us-ascii?Q?vaTeTMagbjzTVwWPgZcuX2SZGhcOdpj+Xaaf1pLf/VXSOZjRuIcvlQrpYt2V?=
 =?us-ascii?Q?JXQHtdVyf1eO1PFCrhy6e0Y6Cn5vlVln4Sgr8Tk3o3blgwLSyabDO++9ix1X?=
 =?us-ascii?Q?QgrJJ/Hujbpl2hRJMmM5nuyut9zdAtfZ4wrlj8lEyP2/BzkGTE/Kq0nSbYMJ?=
 =?us-ascii?Q?Doqr0Xsa8LBsEMalW4LziVfpk53iwic9XMY1rb0jVPYIyR3/I+7uTtXgaBtq?=
 =?us-ascii?Q?KQaflO8/3F4tZm8wjWvLg7svj6DJ16iYXOOQ0iNHS9+yorqo2pIxuy+A7Anv?=
 =?us-ascii?Q?lv0Adpn6Ij2bnvMIxOAHy58EbO3g2YbMCGS9bKGhQShA+1A3QHmb6f6UqdO9?=
 =?us-ascii?Q?wX2za917wBwyF4K1y89ZmkAzWMS7OQ6Hx7qLaiNRqsVoOlLByeXNAGHkjJJ2?=
 =?us-ascii?Q?C3fanHMEjOv4R5EaaeWyG55KQgtjN2N5bXvh7LrrF/qiArns3hqkHHm7MVn+?=
 =?us-ascii?Q?HgRIpAVEW5GSJSOo1/yCaVtlafLsF0RJfmr6YntDOc+u02aYayB7mm2Oaf+R?=
 =?us-ascii?Q?1Np9FJwvEvCBwEgQ9jVBBfKQFy4iyHCaDO7yLsNwmRg/8T5fSYgNJWK54SIV?=
 =?us-ascii?Q?sfGZJBXGeD36ISEBCpP89uNHLqwnYLXvdzseefy5WhCDIF0EeI3pSaFRCUf2?=
 =?us-ascii?Q?C0GwnfOBwfr+zRMuoHRsvB/sDTkMi8Xll8dhVJ2j5nt1Z1bYt1FzH5vQYB78?=
 =?us-ascii?Q?iKA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IrzOarN3IQv69RbwS/MAjA0Qm2RnjJjbqVGavEU7rxj5kRWV2OK4IhDbYmg4?=
 =?us-ascii?Q?AdxHRSDl5nxGe/vlHpvAhrrUtVob5lZEfCijoJpsz/tcagZIgy+Pujl3A5Cs?=
 =?us-ascii?Q?UsRPEYWDuf3+BuWxaErjX5kbRP4ZwSMdr64/afUvAIiH8+joq/TznISBf0ls?=
 =?us-ascii?Q?tYLAUbHgcfQ5wTKXnKlyT4QB35vHketJj+HnTZK4tt/6SIZpBvEgyO/sKp2/?=
 =?us-ascii?Q?ISUetoX8vHk9LFEaAkcX7gZyHhLPFxSMzNRvtSQGHddt+GYhKSHFDM6uNgnA?=
 =?us-ascii?Q?saoO8Hof7HnnMb3OFqiDqwqat2QssMZDfUuaBu5mIzkCsvSNgAxLU8azKDYV?=
 =?us-ascii?Q?7tD0/KlTiA310oiLWG1+qDrhOy1WdBdYk+iofeNayv++i1nPASx7dfbwTTj8?=
 =?us-ascii?Q?Bxqu14VA9A0sXpwvp9o5qvGJWb+Vkh5i0otfEjafeT+oSUrsTtInQ02Cs9TO?=
 =?us-ascii?Q?mzbroyT+ixdQ0sTTLXiXHkp/PaBwgImqACMiWrrbWPiujRuY34qmsxFbvvJg?=
 =?us-ascii?Q?9mQvNBbSrf3ZLu5k9vHzisu9siNcZGKYIZPM3YQq32Mi7D1kEczTtGxA6Usi?=
 =?us-ascii?Q?rYfV84Swl/+Cm0N31puVwoPqOBNAsd5HeYu/9kEUL0D3mQzsmRSVyVjAn9kV?=
 =?us-ascii?Q?A6HuP6pen0oPVFIAz24QLUTg7qVK02DNXKXSgEhpwUDKF2EPyqYAjD/X5dCk?=
 =?us-ascii?Q?IxxkNtFVcyd+RkHVme+zu5kwF0MruEDxNETzNaLhrATl1Em4aPp0qLLsKdyh?=
 =?us-ascii?Q?0ca8MdCZB56euczxlnzycelNU4Iftj58EsdIjr2pxltvU4G8DtbRs9w+UXQW?=
 =?us-ascii?Q?U8OzB8pQkZVIR4D2mByBAiXupHsazD3bGIxOsQaOgRiD8n3DIGqNuNgAPcgx?=
 =?us-ascii?Q?LzfybsSkA/q7WGXZzjwysvtHwp1U/YzCwRUUVLlC+x4coIyyclpduVORmb1U?=
 =?us-ascii?Q?lNRXWEaLzE2LRicLyn3Ue3CQicNlfuyfmqNvl+jrGe6PPNzs/FDnqvlztV+U?=
 =?us-ascii?Q?D0WzKEQ2Yp31GoJv4s3ULukegTY5UGH+2AWWBvUK13wxQ87aWFA4/3+VFY+z?=
 =?us-ascii?Q?aLPMHso9xYSDhBiTO7WjVt4BvEhyU3ueTX6xi9en01Z4B+2IO99ouky/+ugG?=
 =?us-ascii?Q?FGm7TSNb1iF/lL2zkTEMT0a++zr2Xy3qrjmEGt8bh8cNcQKyH9Gco57iZc5L?=
 =?us-ascii?Q?sRUthRjrbOgXUtFwGmO79kF4s4w4urgnnamR30EdHgb1ETTES202LtCMWEzJ?=
 =?us-ascii?Q?0VmHEkwlSTEMD4k+ploIczTtrNBhI+5tklm1B/GAJp/JjIY3Ra+xjyJdjCCA?=
 =?us-ascii?Q?E67yIASbr3A9e7ftPI85eKO+WG3rsqgzunWegD8EwuvBuA3m3O6xRcs7LNLb?=
 =?us-ascii?Q?E+UNzvuBhDGtMTT2asJ5HHJdLIzjj5R2oE1w7P8S0+OnHDyMHdrzWdRhIH3x?=
 =?us-ascii?Q?Egy7v8e3ycAnCHWoz9jZcHlvSqXmaKhjofXI8wI3YKXlIAeyXu2+b6PfCUOC?=
 =?us-ascii?Q?KW+0j0BIyWb+aSk3a2j1oyf300OdijOnhpG/jYsNXXjQ/enDtmcuP/wgUlRO?=
 =?us-ascii?Q?mo0UedBrk63Igp2lYOAmAkTaoGeA2k9q+8747uTIKc3kWfSpoj0XAPZI61h0?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 383ae2ad-d2ae-4360-930c-08dcc20144e2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 16:49:49.1703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nR69ART+2Y+va3bEVSK37p3gB/9ZNnQ0g4A0ioMyx0Yl/lW6xfiit9hJ8ha9xauCHYjtQflS9RgYrqc7ORQDTPFyaVxJNzv7qHqVeQwgRH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6024
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

On Fri, Aug 16, 2024 at 05:33:50AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add support for hook script (rev4)
> URL   : https://patchwork.freedesktop.org/series/133391/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7970_full -> IGTPW_11582_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11582_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11582_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11582_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@sysfs_heartbeat_interval@mixed@vecs0:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk6/igt@sysfs_heartbeat_interval@mixed@vecs0.html

Not related to the runner hooks added in this series.

Series applied to master; thanks for the patches and review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11582_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][2] ([i915#8411])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#6230])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@api_intel_bb@crc32.html
>     - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#6230])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@api_intel_bb@crc32.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#11078])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-1/igt@device_reset@cold-reset-bound.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#11078])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@device_reset@unbind-cold-reset-rebind.html
>     - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#11078])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-1/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@drm_fdinfo@busy-check-all@ccs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#8414]) +13 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-5/igt@drm_fdinfo@busy-check-all@ccs0.html
> 
>   * igt@drm_fdinfo@busy-idle-check-all@vcs1:
>     - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8414]) +12 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@drm_fdinfo@busy-idle-check-all@vcs1.html
> 
>   * igt@drm_fdinfo@idle@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][10] ([i915#7742])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-6/igt@drm_fdinfo@idle@rcs0.html
> 
>   * igt@drm_fdinfo@virtual-busy-all:
>     - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8414]) +9 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@drm_fdinfo@virtual-busy-all.html
> 
>   * igt@drm_fdinfo@virtual-idle:
>     - shard-rkl:          [PASS][12] -> [FAIL][13] ([i915#11900] / [i915#7742])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@drm_fdinfo@virtual-idle.html
> 
>   * igt@gem_busy@semaphore:
>     - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#3936])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@gem_busy@semaphore.html
> 
>   * igt@gem_ccs@block-multicopy-inplace:
>     - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#3555] / [i915#9323])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html
>     - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@gem_ccs@block-multicopy-inplace.html
>     - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-5/igt@gem_ccs@block-multicopy-inplace.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#7697])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@gem_close_race@multigpu-basic-process.html
>     - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#7697])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8555])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-1/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hang:
>     - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#8555])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-hang.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hostile:
>     - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#8555])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-1/igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
>     - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#5882]) +6 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#280])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-1/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#280])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@gem_ctx_sseu@invalid-args.html
>     - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#280])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#280])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_eio@hibernate:
>     - shard-dg2:          NOTRUN -> [ABORT][28] ([i915#10030] / [i915#7975] / [i915#8213])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-5/igt@gem_eio@hibernate.html
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [PASS][29] -> [FAIL][30] ([i915#5784])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg1-14/igt@gem_eio@unwedge-stress.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_balancer@bonded-sync:
>     - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4771])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@gem_exec_balancer@bonded-sync.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#4812]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-1/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#4036])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@gem_exec_balancer@invalid-bonds.html
>     - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#4036])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_capture@capture-invisible@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#6334]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@gem_exec_capture@capture-invisible@lmem0.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-glk:          NOTRUN -> [SKIP][36] ([i915#6334])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk5/igt@gem_exec_capture@capture-invisible@smem0.html
>     - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#6334])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_capture@capture@vecs0-lmem0:
>     - shard-dg2:          NOTRUN -> [FAIL][38] ([i915#11965]) +3 other tests fail
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@gem_exec_capture@capture@vecs0-lmem0.html
>     - shard-dg1:          NOTRUN -> [FAIL][39] ([i915#11965]) +1 other test fail
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@gem_exec_capture@capture@vecs0-lmem0.html
> 
>   * igt@gem_exec_fair@basic-deadline:
>     - shard-glk:          NOTRUN -> [FAIL][40] ([i915#2846])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk8/igt@gem_exec_fair@basic-deadline.html
> 
>   * igt@gem_exec_fair@basic-none-rrul:
>     - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852]) +4 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@gem_exec_fair@basic-none-rrul.html
> 
>   * igt@gem_exec_fair@basic-none@vcs0:
>     - shard-rkl:          [PASS][42] -> [FAIL][43] ([i915#2842])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-rkl-4/igt@gem_exec_fair@basic-none@vcs0.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@gem_exec_fair@basic-none@vcs0.html
> 
>   * igt@gem_exec_fair@basic-pace:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3539])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-3/igt@gem_exec_fair@basic-pace.html
> 
>   * igt@gem_exec_fair@basic-throttle@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][45] ([i915#2842]) +5 other tests fail
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html
> 
>   * igt@gem_exec_fence@submit:
>     - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4812]) +4 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@gem_exec_fence@submit.html
> 
>   * igt@gem_exec_fence@submit3:
>     - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4812]) +4 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-7/igt@gem_exec_fence@submit3.html
> 
>   * igt@gem_exec_flush@basic-uc-pro-default:
>     - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3539] / [i915#4852]) +3 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-5/igt@gem_exec_flush@basic-uc-pro-default.html
> 
>   * igt@gem_exec_flush@basic-uc-prw-default:
>     - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3539])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@gem_exec_flush@basic-uc-prw-default.html
> 
>   * igt@gem_exec_reloc@basic-cpu-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3281]) +6 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-5/igt@gem_exec_reloc@basic-cpu-gtt.html
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>     - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#3281]) +8 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-wc-read:
>     - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3281]) +9 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@gem_exec_reloc@basic-wc-read.html
> 
>   * igt@gem_exec_reloc@basic-write-wc-noreloc:
>     - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#3281]) +4 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-5/igt@gem_exec_reloc@basic-write-wc-noreloc.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts:
>     - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4537] / [i915#4812])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@gem_exec_schedule@preempt-queue-contexts.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts-chain:
>     - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4537] / [i915#4812]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-threaded-none:
>     - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4860]) +2 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-y:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4860]) +2 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-3/igt@gem_fence_thrash@bo-write-verify-y.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences:
>     - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4860]) +3 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-2/igt@gem_fenced_exec_thrash@no-spare-fences.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#4613] / [i915#7582])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-6/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4613]) +3 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-3/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@parallel-random:
>     - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#4613]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@gem_lmem_swapping@parallel-random.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4565])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          [PASS][63] -> [DMESG-WARN][64] ([i915#1982] / [i915#4936] / [i915#5493])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][65] ([i915#4613]) +7 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk5/igt@gem_lmem_swapping@verify-ccs.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#4613])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-5/igt@gem_lmem_swapping@verify-random-ccs.html
> 
>   * igt@gem_mmap@bad-offset:
>     - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4083]) +4 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@gem_mmap@bad-offset.html
> 
>   * igt@gem_mmap@big-bo:
>     - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4083]) +4 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-1/igt@gem_mmap@big-bo.html
> 
>   * igt@gem_mmap_gtt@basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4077]) +11 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-7/igt@gem_mmap_gtt@basic.html
> 
>   * igt@gem_mmap_gtt@basic-small-bo:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4077]) +15 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-6/igt@gem_mmap_gtt@basic-small-bo.html
> 
>   * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
>     - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4077]) +11 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
> 
>   * igt@gem_mmap_wc@write-prefaulted:
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4083]) +6 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-3/igt@gem_mmap_wc@write-prefaulted.html
> 
>   * igt@gem_partial_pwrite_pread@write:
>     - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#3282]) +5 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-6/igt@gem_partial_pwrite_pread@write.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>     - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#3282]) +5 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
> 
>   * igt@gem_pread@display:
>     - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#3282]) +2 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-3/igt@gem_pread@display.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-glk:          NOTRUN -> [WARN][76] ([i915#2658])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk8/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#3282]) +2 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4270]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-on:
>     - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#4270]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html
>     - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4270]) +4 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@gem_pxp@reject-modify-context-protection-on.html
>     - shard-tglu:         NOTRUN -> [SKIP][81] ([i915#4270])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-3/igt@gem_pxp@reject-modify-context-protection-on.html
> 
>   * igt@gem_pxp@verify-pxp-stale-buf-execution:
>     - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4270]) +2 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@gem_pxp@verify-pxp-stale-buf-execution.html
> 
>   * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#5190] / [i915#8428]) +6 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
> 
>   * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#8428]) +6 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#8411]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
>     - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4079])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>   * igt@gem_set_tiling_vs_gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4079]) +3 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-14/igt@gem_set_tiling_vs_gtt.html
> 
>   * igt@gem_tiled_pread_basic:
>     - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4079]) +1 other test skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-10/igt@gem_tiled_pread_basic.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-glk:          NOTRUN -> [SKIP][89] ([i915#3323])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#3297]) +2 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-3/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_userptr_blits@forbidden-operations:
>     - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#3282] / [i915#3297])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@gem_userptr_blits@forbidden-operations.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-busy:
>     - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3297] / [i915#4880])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-10/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>     - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3297] / [i915#4880]) +1 other test skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#3297]) +4 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gem_userptr_blits@relocations:
>     - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#3281] / [i915#3297])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-11/igt@gem_userptr_blits@relocations.html
>     - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#3281] / [i915#3297])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-2/igt@gem_userptr_blits@relocations.html
>     - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#3281] / [i915#3297])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@gem_userptr_blits@relocations.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#3297]) +3 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-glk:          [PASS][99] -> [ABORT][100] ([i915#5566])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-glk9/igt@gen9_exec_parse@allowed-single.html
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk7/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@basic-rejected:
>     - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#2527] / [i915#2856]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-3/igt@gen9_exec_parse@basic-rejected.html
> 
>   * igt@gen9_exec_parse@bb-chained:
>     - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#2527]) +1 other test skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html
> 
>   * igt@gen9_exec_parse@bb-start-out:
>     - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#2527]) +3 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@gen9_exec_parse@bb-start-out.html
>     - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#2856]) +3 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-7/igt@gen9_exec_parse@bb-start-out.html
> 
>   * igt@gen9_exec_parse@unaligned-access:
>     - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#2856]) +4 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-1/igt@gen9_exec_parse@unaligned-access.html
> 
>   * igt@i915_module_load@load:
>     - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#6227])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@i915_module_load@load.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-rkl:          NOTRUN -> [ABORT][107] ([i915#9820])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-6/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-snb:          [PASS][108] -> [ABORT][109] ([i915#9820])
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-tglu:         NOTRUN -> [ABORT][110] ([i915#9820])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-glk:          [PASS][111] -> [ABORT][112] ([i915#9820])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-glk8/igt@i915_module_load@reload-with-fault-injection.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk6/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_freq_api@freq-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#8399])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-1/igt@i915_pm_freq_api@freq-suspend.html
> 
>   * igt@i915_pm_rc6_residency@rc6-fence@gt0:
>     - shard-tglu:         NOTRUN -> [WARN][114] ([i915#2681])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-fence@gt0.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#11681] / [i915#6621])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_pm_rps@min-max-config-loaded:
>     - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#11681] / [i915#6621])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-3/igt@i915_pm_rps@min-max-config-loaded.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          [PASS][117] -> [INCOMPLETE][118] ([i915#7790])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-snb2/igt@i915_pm_rps@reset.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-snb5/igt@i915_pm_rps@reset.html
> 
>   * igt@i915_pm_rps@thresholds:
>     - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#11681])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-1/igt@i915_pm_rps@thresholds.html
>     - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#11681])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@i915_pm_rps@thresholds.html
> 
>   * igt@i915_pm_rps@thresholds-park:
>     - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#11681])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-1/igt@i915_pm_rps@thresholds-park.html
> 
>   * igt@i915_pm_rps@waitboost:
>     - shard-mtlp:         NOTRUN -> [FAIL][122] ([i915#8346]) +1 other test fail
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-4/igt@i915_pm_rps@waitboost.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#8437])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-1/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][124] ([i915#9311])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-7/igt@i915_selftest@mock@memory_region.html
>     - shard-glk:          NOTRUN -> [DMESG-WARN][125] ([i915#9311])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk8/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#7707])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-5/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#4212])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-1/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#4215] / [i915#5190])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@tile-pitch-mismatch:
>     - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4212]) +2 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@kms_addfb_basic@tile-pitch-mismatch.html
>     - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#4212])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-1/igt@kms_addfb_basic@tile-pitch-mismatch.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#8709]) +7 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#8709]) +11 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#6228])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-1/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_async_flips@test-cursor:
>     - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#10333])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@kms_async_flips@test-cursor.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#9531])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#1769] / [i915#3555])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
>     - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#5286]) +3 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#5286])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#4538] / [i915#5286]) +4 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][140] +32 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-7/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#3638]) +2 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-1/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#3638]) +1 other test skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-14/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#5190]) +2 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-mtlp:         NOTRUN -> [SKIP][144] +22 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#4538] / [i915#5190]) +12 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#4538]) +6 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#10656])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-1/igt@kms_big_joiner@basic.html
>     - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#10656])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#10656])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-7/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_big_joiner@invalid-modeset-force-joiner:
>     - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#10656])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@kms_big_joiner@invalid-modeset-force-joiner.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#6095]) +35 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#6095]) +15 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#6095]) +57 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#10307] / [i915#6095]) +154 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#6095]) +83 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [SKIP][157] +487 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#3742])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#11616] / [i915#7213]) +3 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-a-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#4087]) +3 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#7828]) +9 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg1:          NOTRUN -> [SKIP][162] +51 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_edid@dp-mode-timings:
>     - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#7828]) +9 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@kms_chamelium_edid@dp-mode-timings.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#7828]) +3 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-3/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#7828]) +5 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7828]) +7 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
> 
>   * igt@kms_color@deep-color:
>     - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#3555]) +4 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-3/igt@kms_color@deep-color.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][168] ([i915#7173])
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-11/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#6944] / [i915#9424])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-7/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#3299])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-6/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3116])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#7118])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-8/igt@kms_content_protection@srm.html
>     - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#7116])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#3359])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#3555] / [i915#8814]) +3 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#11453] / [i915#3359])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html
>     - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#11453])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html
>     - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#11453]) +1 other test skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@kms_cursor_crc@cursor-random-512x170.html
>     - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#11453])
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-8/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#11453])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>     - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#8814]) +2 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#9809]) +4 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#4103] / [i915#4213])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#9067])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
>     - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#9067])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
>     - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#9067])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#4213])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-dg1:          [PASS][188] -> [DMESG-WARN][189] ([i915#10166])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg1-18/igt@kms_cursor_legacy@torture-bo@pipe-a.html
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-snb:          [PASS][190] -> [DMESG-WARN][191] ([i915#10166])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-snb2/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-snb6/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#9833])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#9723])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>     - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#9723])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>     - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#9723])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#3555]) +2 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-2/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#8588])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#3804])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#3840] / [i915#9688])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp.html
>     - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#3840])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@kms_dsc@dsc-fractional-bpp.html
>     - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#3840] / [i915#9688])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-2/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#3840])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#3555] / [i915#3840])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-5/igt@kms_dsc@dsc-with-formats.html
>     - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3555] / [i915#3840])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-8/igt@kms_dsc@dsc-with-formats.html
>     - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3555] / [i915#3840])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#3555] / [i915#3840])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-1/igt@kms_dsc@dsc-with-output-formats.html
>     - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#3555] / [i915#3840]) +1 other test skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#3840] / [i915#9053])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>     - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#3840] / [i915#9053])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3469])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#4854])
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@kms_feature_discovery@chamelium.html
>     - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#4854])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-2/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#9337])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-2/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#658])
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-7/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#3637]) +4 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#8381])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-13/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-rkl:          NOTRUN -> [SKIP][217] +18 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-6/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#9934]) +7 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][219] -> [FAIL][220] ([i915#2122])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#3637]) +1 other test skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-7/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip@flip-vs-fences-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#8381]) +1 other test skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-10/igt@kms_flip@flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#2672]) +1 other test skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#2587] / [i915#2672])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#2587] / [i915#2672]) +2 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#2672]) +3 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#2672] / [i915#3555]) +1 other test skip
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#8810])
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#2672]) +2 other tests skip
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#5354]) +35 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#8708]) +17 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-snb:          [PASS][232] -> [SKIP][233] +5 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
>     - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#1825]) +34 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#5439])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#3458]) +22 other tests skip
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#3023]) +11 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#8708]) +18 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#10055]) +1 other test skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#8708]) +11 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
>     - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#1825]) +24 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#3458]) +20 other tests skip
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#3555] / [i915#8228]) +2 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html
>     - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8228])
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#1839])
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#6301])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-5/igt@kms_panel_fitting@atomic-fastset.html
>     - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#6301])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-10/igt@kms_panel_fitting@atomic-fastset.html
>     - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#6301])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.html
>     - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#6301])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-14/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>     - shard-dg2:          NOTRUN -> [SKIP][250] +12 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-6/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#11614] / [i915#3582]) +3 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-1/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#3555] / [i915#8806])
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-2/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#9423]) +31 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#9423]) +7 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#5176]) +3 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#9423]) +3 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#5176] / [i915#9423]) +3 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#5235]) +2 other tests skip
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#9728]) +3 other tests skip
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#5235]) +2 other tests skip
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#3555] / [i915#5235])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#9728]) +4 other tests skip
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#5354])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#5354]) +1 other test skip
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-14/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#9292])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-tglu:         NOTRUN -> [FAIL][266] ([i915#9295])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#3361])
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#9340])
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_lpsp@screens-disabled:
>     - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#8430])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-2/igt@kms_pm_lpsp@screens-disabled.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg2:          [PASS][270] -> [SKIP][271] ([i915#9519])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#9519]) +2 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#9519])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
>     - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#9519]) +1 other test skip
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#9519]) +1 other test skip
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#6524] / [i915#6805]) +2 other tests skip
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#6524]) +1 other test skip
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@kms_prime@d3hot.html
>     - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#6524]) +1 other test skip
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>     - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#11520]) +5 other tests skip
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-14/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#11520]) +5 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#11520]) +4 other tests skip
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-3/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html
>     - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#11520])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-3/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#9683])
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#9683])
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-18/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#9683]) +1 other test skip
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr-primary-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#1072] / [i915#9732]) +23 other tests skip
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-7/igt@kms_psr@fbc-psr-primary-mmap-gtt.html
> 
>   * igt@kms_psr@fbc-psr2-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#1072] / [i915#9673] / [i915#9732])
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-11/igt@kms_psr@fbc-psr2-basic.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#1072] / [i915#9732]) +19 other tests skip
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html
> 
>   * igt@kms_psr@pr-primary-render:
>     - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#9688]) +12 other tests skip
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-5/igt@kms_psr@pr-primary-render.html
> 
>   * igt@kms_psr@pr-sprite-plane-move:
>     - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#9732]) +9 other tests skip
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-3/igt@kms_psr@pr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#4077] / [i915#9688])
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-7/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html
> 
>   * igt@kms_psr@psr2-cursor-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#1072] / [i915#9732]) +11 other tests skip
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-2/igt@kms_psr@psr2-cursor-mmap-gtt.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#9685])
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#4235])
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@kms_rotation_crc@bad-tiling.html
>     - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#11131])
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-3/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#5289])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
>     - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#5289])
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#5289])
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#11131] / [i915#5190])
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>     - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#5289]) +1 other test skip
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#3555]) +6 other tests skip
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full:
>     - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#3555]) +1 other test skip
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-full.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][303] ([i915#5030]) +2 other tests skip
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#5030] / [i915#9041])
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#3555] / [i915#8809] / [i915#8823])
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#8623])
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#8623])
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-16/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][308] ([i915#9196])
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-snb:          [PASS][309] -> [FAIL][310] ([i915#9196])
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#9906]) +1 other test skip
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-5/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-mtlp:         NOTRUN -> [SKIP][312] ([i915#3555] / [i915#8808])
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-mtlp:         NOTRUN -> [SKIP][313] ([i915#8808] / [i915#9906]) +1 other test skip
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-3/igt@kms_vrr@max-min.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#3555] / [i915#9906])
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-10/igt@kms_vrr@negative-basic.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#9906]) +2 other tests skip
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-virtual.html
>     - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#9906]) +1 other test skip
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#9906]) +1 other test skip
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#2437])
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-9/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-glk:          NOTRUN -> [SKIP][319] ([i915#2437])
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#2437] / [i915#9412])
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@gen8-unprivileged-single-ctx-counters:
>     - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#2436])
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-3/igt@perf@gen8-unprivileged-single-ctx-counters.html
> 
>   * igt@perf@non-zero-reason@0-rcs0:
>     - shard-dg2:          NOTRUN -> [FAIL][322] ([i915#9100])
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          NOTRUN -> [FAIL][323] ([i915#4349]) +3 other tests fail
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@cpu-hotplug:
>     - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#8850])
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-8/igt@perf_pmu@cpu-hotplug.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#3708]) +1 other test skip
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-14/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#3708] / [i915#4077])
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-7/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#3708])
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#9917])
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-6/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#9917])
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-11/igt@sriov_basic@enable-vfs-autoprobe-off.html
>     - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#9917])
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg1-15/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@syncobj_wait@invalid-wait-zero-handles:
>     - shard-mtlp:         NOTRUN -> [FAIL][331] ([i915#9781]) +1 other test fail
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-6/igt@syncobj_wait@invalid-wait-zero-handles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_eio@kms:
>     - shard-dg2:          [FAIL][332] ([i915#5784]) -> [PASS][333]
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg2-5/igt@gem_eio@kms.html
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-10/igt@gem_eio@kms.html
> 
>   * igt@gem_exec_fair@basic-none@bcs0:
>     - shard-rkl:          [FAIL][334] ([i915#2842]) -> [PASS][335] +2 other tests pass
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs:
>     - shard-glk:          [FAIL][336] ([i915#11859]) -> [PASS][337]
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk6/igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1:
>     - shard-snb:          [FAIL][338] ([i915#5956]) -> [PASS][339]
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-snb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-snb:          [SKIP][340] -> [PASS][341] +2 other tests pass
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2:          [SKIP][342] ([i915#1257]) -> [PASS][343]
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg2-1/igt@kms_dp_aux_dev.html
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-11/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:
>     - shard-snb:          [FAIL][344] ([i915#2122]) -> [PASS][345]
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3:
>     - shard-mtlp:         [ABORT][346] ([i915#10354]) -> [PASS][347]
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-mtlp-6/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-7/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-tglu:         [FAIL][348] ([i915#8292]) -> [PASS][349]
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-tglu-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-tglu-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-dg2:          [SKIP][350] ([i915#9519]) -> [PASS][351] +1 other test pass
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg2-1/igt@kms_pm_rpm@dpms-lpsp.html
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-rkl:          [SKIP][352] ([i915#9519]) -> [PASS][353]
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-snb:          [FAIL][354] ([i915#9196]) -> [PASS][355]
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@perf_pmu@render-node-busy-idle@vcs0:
>     - shard-dg2:          [FAIL][356] ([i915#4349]) -> [PASS][357] +4 other tests pass
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg2-11/igt@perf_pmu@render-node-busy-idle@vcs0.html
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@perf_pmu@render-node-busy-idle@vcs0.html
> 
>   * igt@perf_pmu@render-node-busy-idle@vcs1:
>     - shard-mtlp:         [FAIL][358] ([i915#4349]) -> [PASS][359] +3 other tests pass
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-mtlp-4/igt@perf_pmu@render-node-busy-idle@vcs1.html
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-mtlp-2/igt@perf_pmu@render-node-busy-idle@vcs1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-snb:          [INCOMPLETE][360] ([i915#8816]) -> [SKIP][361]
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-snb7/igt@kms_content_protection@content-type-change.html
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-snb4/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2:          [SKIP][362] ([i915#11453]) -> [SKIP][363] ([i915#11453] / [i915#3359]) +1 other test skip
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg2-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2:          [SKIP][364] ([i915#11453] / [i915#3359]) -> [SKIP][365] ([i915#11453])
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2:          [SKIP][366] ([i915#10433] / [i915#3458]) -> [SKIP][367] ([i915#3458])
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-mmap-cpu:
>     - shard-dg2:          [SKIP][368] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][369] ([i915#1072] / [i915#9732]) +10 other tests skip
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg2-11/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.html
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-2/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.html
> 
>   * igt@kms_psr@psr-cursor-blt:
>     - shard-dg2:          [SKIP][370] ([i915#1072] / [i915#9732]) -> [SKIP][371] ([i915#1072] / [i915#9673] / [i915#9732]) +8 other tests skip
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg2-4/igt@kms_psr@psr-cursor-blt.html
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-11/igt@kms_psr@psr-cursor-blt.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2:          [SKIP][372] ([i915#11131] / [i915#5190]) -> [SKIP][373] ([i915#11131] / [i915#4235] / [i915#5190])
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-glk:          [SKIP][374] -> [FAIL][375] ([i915#10959])
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7970/shard-glk8/igt@kms_tiled_display@basic-test-pattern.html
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html
> 
>   
>   [i915#10030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030
>   [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
>   [i915#10166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10333]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333
>   [i915#10354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10354
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
>   [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
>   [i915#11131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131
>   [i915#11453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
>   [i915#11616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#11859]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11859
>   [i915#11900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11900
>   [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
>   [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>   [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
>   [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
>   [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
>   [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842
>   [i915#2846]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
>   [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
>   [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
>   [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
>   [i915#4936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4936
>   [i915#5030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030
>   [i915#5176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
>   [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
>   [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
>   [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6227]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227
>   [i915#6228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228
>   [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
>   [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
>   [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>   [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
>   [i915#7213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213
>   [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#7742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742
>   [i915#7790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7790
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
>   [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292
>   [i915#8346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8346
>   [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
>   [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
>   [i915#8806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8806
>   [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
>   [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
>   [i915#8816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8816
>   [i915#8823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823
>   [i915#8850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850
>   [i915#9041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041
>   [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
>   [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
>   [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
>   [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
>   [i915#9292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9292
>   [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
>   [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
>   [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>   [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
>   [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>   [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>   [i915#9728]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781
>   [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
>   [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
>   [i915#9833]: https://gitlab.freedesktop.org/drm/i
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11582/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
