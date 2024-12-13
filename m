Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6997BE7717F
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 11:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120CA10EFE4;
	Fri, 13 Dec 2024 11:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsvbyX6/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3A110EFE4
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734090621; x=1765626621;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=uCLvuRrorS+n7dQizNTycCzV+TWdjDnsvtTGoW2DmpM=;
 b=WsvbyX6/8uDWhsh/QijTBiAd4y+sZNRXLOyc49vvj70yKNilTn9EGaf6
 Weo9EMMFVuyh3uRSloRxvrhJd+XPp2gNDXSIEgaierCnnkECjLQ46Nziz
 H3FaTkGShs3tPl66N2FW0Z5F7C5QyV8g4v3zPCx3BGZ6ojXS2hTkrLHUo
 rmCpMGb/frAPvJOLVkaFzfz234nqFDTaJoPVnoSdG+P5paksilSy7Avsg
 9t+p83IlvyNCODtjqU9C4ja6P0NcGnadgRJHCSUGKKf2rIv8dlf8VGYoW
 OH57eG6EuV0ygsooG6y8GwLLldhL2E57jG1+Zn6/y7BxYy4zB2aaiLa5h A==;
X-CSE-ConnectionGUID: HYKjWHJ4RJa1l7h8yS96pA==
X-CSE-MsgGUID: LE6HAf9gTZ6SknTzCgstZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="45149066"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="45149066"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 03:50:20 -0800
X-CSE-ConnectionGUID: VKI7e9eCS2aN8FuaiFNk9g==
X-CSE-MsgGUID: DWX00UHgQ8yq3esn10u/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="96284382"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 03:50:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 03:50:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 03:50:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 03:50:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbKYXt6zW8G/6wPGpjh0oNR8Mu1tr+BZV7WuntgO9Zl77c7u5f4DR4AYDx3TQhbSDMDJL0NHJTFRhX9LxcelChwREsqBGBs3ui3ZgqrlpMhXiOde9pwOtjiGa4wa1hUuZpA88+IVj5LwGlZkfwFQRgXyiRJNY0nZuKbupDERrQyJcF2IfpHqlw7qOAveqZU8lnoDbfsJt/C738PSe9+DWyqYyDWLopptXw2jXONicmffMuYuUs/kNGzBE+3Qa93pPrlOMuicPJYoDRxYjihavyRmJLsPBhX20WXGA61FGplf8ELayNyhImJ0docNcHYnd6qSbg+mr9KvJOh/zS+84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLe39Di+6rnT1M8T5yDH7E8dfry7y8jlthgr4TWqnaE=;
 b=Fc/rI6OEjwUf6r4QtC6SN9CGLXE6pJIa8jfGmN3XgFCgfsbkynLfEtFnoy2KC95fw5oPCjXbL96f/1DaLcXYhxxdqXKCrfsV/I3RoKKwRYFi0i3BAGfMKuvNgj4n6NZRos8JRM2EJyuro9psZ+ZLmM+nKFsGxTNW0K74A0hKaQigP6G/keMQF3k00+ahb7+AjqEhQFRpELSYF/c+9LnYS48dWY/no0rshyYCnuQhw/82KOFg6PlxnkToRaKQtau1dbstd6YAl2ACQDC2wURqfBw5teAtBrOObCOPzQMBpFYYNW1RZJUkM3tNk/cridUPTxTc9pLumJ4YCwl0JK2geA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 11:49:47 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::c7d3:72da:ccae:68dd]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::c7d3:72da:ccae:68dd%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 11:49:47 +0000
Date: Fri, 13 Dec 2024 11:49:37 +0000
From: Jan Maslak <jan.maslak@intel.com>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] xe_eudebug_online: Add default threads_per_eu
 value for platforms without hwconfig.
Message-ID: <Z1wfUQFgfnQVyMmy@ART-DEV-395>
References: <20241213092339.18038-1-dominik.grzegorzek@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241213092339.18038-1-dominik.grzegorzek@intel.com>
X-ClientProxiedBy: ZR2P278CA0060.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::20) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|PH0PR11MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: d151d75e-71ad-4ed1-eb8b-08dd1b6c3e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gBnO6APLJuAdPxgwYUnH07FPQhbxVbeQVEhoM7EjRZbultEtFXsecYg1LNf0?=
 =?us-ascii?Q?lBxmNsw6HL6vtBcz9KAdCcVsna0GlvkHa/dUhi7qHxE254q/TMs54syUxvwJ?=
 =?us-ascii?Q?zg8Btt7WDYv2hxcWtkF9OpKNVyPTQFtETXGdEHHdgI0WjhR+/XsHvlx5L93m?=
 =?us-ascii?Q?wFCoDTIw/3qRo234/GVtgEL3keuUfxUHdq81Gw9ndzY7R7F5Lu67ORiAOaBF?=
 =?us-ascii?Q?5Y5jfOBxmAW2OgjVodGhkV2fv1uiOIzH4QAvvARnnC4wlKR5ddh8RtrVbSt9?=
 =?us-ascii?Q?QNuaixnfh6phcLZqk4jYTGcbE2Ib6tYZUG8afGi/h8FH+5VMsf1ZOF4WSLI7?=
 =?us-ascii?Q?70IE8tmofxny+Qe2YvTbJ85miVfT+es4po/nBKh6G2mV5WOfQZB54rfSb0+9?=
 =?us-ascii?Q?S9/i7eDUZZN6U7nabQU9fOFp3kVgTm1Upy+IVe6dC4javDReSvhn2rivaNag?=
 =?us-ascii?Q?tTNbZmjRd2Kp3zZxZlRHSrciamCmVBY5fu/Ak6DcytUpHY4qFl9/FAFygvEt?=
 =?us-ascii?Q?zIlWpn8Tim0Kb6Jg11SfkFCF5vuKKrMtaivQvfmRYvrK+qE+kHDIQRRbA6pD?=
 =?us-ascii?Q?DaqGmCmWv4UUYgNM8HtmtFyJ3ycVxJRwDtQNiVXG0ixiHQMTdz18YMV5FdIj?=
 =?us-ascii?Q?GtfT/En8SEOcLIC8SNwCfxNnLo6vUHk4sXwpEttt8Na1CE9y+nXowGBbS8Um?=
 =?us-ascii?Q?a+a6fVhvJVfT8vC2zT+xbeoM1WfmWYtMbHjcQSibb4rxhr/5hHR0rPak6bAn?=
 =?us-ascii?Q?QBE2zheYO6mt74VYWNyXd65WR218YLKw4r0QScbxMbTPxmYNLyvxerrwS+eM?=
 =?us-ascii?Q?XTRmP1kLtQ17GomJXX42H5CrvComWtHHwhRDAvs0L/Cyg4GGqyhYjWH+YGdf?=
 =?us-ascii?Q?VdvABAXoQhEzwSADUz7rlgOw6F04sd6Zd7GBi1d7X6aXEFQtJ5JlJP8Wvcfo?=
 =?us-ascii?Q?RF/VgwlXKuq+ppwIAoTH0EFhUVipjR3bniGz6kcrFI3GVBFFEese+fyzfHI2?=
 =?us-ascii?Q?kxAE6KH+Y7J8c3ZmetElB0fTdz9W0AEjib2kNHbXIrRVx7aHRj2R9Y6ILQQM?=
 =?us-ascii?Q?GlpgXHEVRJWtp89wGqZnDagHrdlAeaUGkdKtheCons+NwgzY9yiVqOJBYbs1?=
 =?us-ascii?Q?bbVYj9/4ldZvA7La9rMJ3avu+Ta9hWvXqXMEwiXnF85s2TH885eM7ef2aD3y?=
 =?us-ascii?Q?eDUtlHc7tac2zN5TKV551Fv6yizwkwz7d3ZZ6dRU32RAYh9qvYIE0cdANimQ?=
 =?us-ascii?Q?tIfsBwgzmdYTJt0Sv6kWhd4OunsPrjNT7+c8/H1Imw51wTKyjCia87aFjt5F?=
 =?us-ascii?Q?ZrY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lZKW8AmZUdKTVfQxhhM2KCT3dKJTurknrc181o6udBazl0dRJUpnBVeqhSBV?=
 =?us-ascii?Q?6u+hXMJIlMKmsViCQURA0E7ZJOZ7ATkOlH1sE/xcq7+jokp8qkDRT5/1uvHG?=
 =?us-ascii?Q?rMTQZLtboMR6R99zAntisk+qwDAuEbuRgpUN3va5jTi/0N0hO3Ns3hUYIeDL?=
 =?us-ascii?Q?tn41pOjgYo3IoHYQt/xaqBKhnwQGe84stIyqbhdoAzEiRdK6M+w+PGLBP3uq?=
 =?us-ascii?Q?6fyswxWt1aPKl1T6wjdSClQiymVaWsm49mqcGRUsOcIrsX7qfEy66jF45Ktu?=
 =?us-ascii?Q?te3WdzRUj9wCyMPTV7RabVh/QtFvob7rFDVxXGFAoZMCwuSED11G3+FRRaxs?=
 =?us-ascii?Q?+qATBz5w1xPJlsX0rA0KRB2hGFKoq4FM3KzRKPSkOZRLBGgOdfHc1cbPOITJ?=
 =?us-ascii?Q?JUqy6E0p++JIbvJilNwfTWhIkIM1n6D3f5mGgAPZMwvmB4d71uYYMop8TYgA?=
 =?us-ascii?Q?JtRETRdr0GC9LPv1is35zJqTtCdojFUBpWs2GJrw31MdBvRaRwDqmGeJtXQj?=
 =?us-ascii?Q?NausCukziiixMuoUR1GTegIQfr3wG8TkquPQYSFs+Gb9KQ+Ea/8p1I5Myy4K?=
 =?us-ascii?Q?H6BrXSEOmUnswBM19mknQarFPlYBr7MXqvT8lB0spk1H+anyUPmqK1blPaXL?=
 =?us-ascii?Q?uO4pNUMQsggsRgF2G7IYLpswK7UvKaLtiu0+tG6T9aZvnDB6jFRxxCGCNeg1?=
 =?us-ascii?Q?sXluNgPisNdJpPZP23awS1c4yXhIJ6TGyxiDNckvsUjPqorRkAcreprkt1qV?=
 =?us-ascii?Q?SN+wtahYI2Fybu7JP+Kt+jmU/E6mF8tV/tOHGruVqcEF53AhqasZZO/TX2Ja?=
 =?us-ascii?Q?x75teLovp6TrP+Bk6gULpLhFy7sNdo3UJ0XFQ3KWT65wQ7n4DEqAXZ/DSIja?=
 =?us-ascii?Q?TiAkQRAnnIcT+egsKZZdJudwVsjg2RKG8k6CMdKQS+mrePpua6bzEHkT4HF1?=
 =?us-ascii?Q?SMg/eiefNBVN7Y53psvqTOZMeakjYLCA1q5WZwHWsXwX0QvLWdnm486wWHN+?=
 =?us-ascii?Q?7Z40oeGZ1GDousIQfD9ZTg7uF07uyNhCFb7OJWNazM323WGzRbF6SaTiqcG7?=
 =?us-ascii?Q?gVLCp9k7ZnchmqqIyrPzFyOQdpnuUiUgynAEt5+AgY4mbAO9ZBfxPlXjfLr9?=
 =?us-ascii?Q?RmcxVjVYuuB5Z0opnfIt0pyjhQNXo0MaiFjhUOH9sbnl34D4ATsxedqTmh8F?=
 =?us-ascii?Q?K95s6omkyYx6BKdsZfXVZxm1YqhXnzX1mAQTmTABLQGD3/3lX32iTt0WRnBA?=
 =?us-ascii?Q?o2PL3YiPKVZt99Yda+Ij4vU48Et/5QDLx1gPZ7FtjZ4201D3GZGTtSoeCZhd?=
 =?us-ascii?Q?AmEOiE6wFe4ifp+jjC0I/SpxHElP/60wVtJPe1fwAVWXIItrWaNZd1lv1a+g?=
 =?us-ascii?Q?YJoICdOGKVxyXBMV+ZtNgvtkkC8FUMyixQF1yLMliuykKFo7adwnCLGqGSVE?=
 =?us-ascii?Q?U5J19qY3lUTg3vkmy6ZmM23qhH0cvtfvHn6RXjEqf6atU75u44nesIW2AmCL?=
 =?us-ascii?Q?p+xsf/+EMMm7ARTmTJAbnmjbG6H3BYA1jF987KvzvoZvKevE7zUlSS44zdnq?=
 =?us-ascii?Q?slxDnZXzc2a36Vp/Owws9QhKEyIJ7HURpsWpr59L?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d151d75e-71ad-4ed1-eb8b-08dd1b6c3e32
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 11:49:47.1796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svPzH4+hRDoZL49aQp3T21g5HY12CDTo1HgoD4wBj8v2yae5Qm8B5GfTu2m4U+FRiq/c8zO6bqJLeK2/VDqzAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7636
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

On Fri, Dec 13, 2024 at 10:23:39AM +0100, Dominik Grzegorzek wrote:
> There are hardware platforms which are not supporting
> hwconfig table, for example ADLS. Since [1] queried number of threads per eu
> can be NULL, accept it and use 8 as default.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

LGTM,
Reviewed-by: Jan Maslak <jan.maslak@intel.com>

> 
> [1] https://patchwork.freedesktop.org/series/142282/
> 
> ---
>  tests/intel/xe_eudebug_online.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index bf53b44ce..8fdd071a5 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1155,7 +1155,7 @@ static int query_attention_bitmask_size(int fd, int gt)
>  {
>  	uint32_t thread_count_len;
>  	uint32_t *thread_count_ptr;
> -	uint32_t thread_count;
> +	uint32_t threads_per_eu = 8;
>  	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
>  	struct drm_xe_query_topology_mask *topology;
>  	struct drm_xe_device_query query = {
> @@ -1169,9 +1169,10 @@ static int query_attention_bitmask_size(int fd, int gt)
>  
>  	thread_count_ptr = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU,
>  						    &thread_count_len);
> -	igt_assert(thread_count_ptr);
> -	igt_assert(thread_count_len == 1);
> -	thread_count = *thread_count_ptr;
> +	if (thread_count_ptr) {
> +		igt_assert(thread_count_len == 1);
> +		threads_per_eu = *thread_count_ptr;
> +	}
>  
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>  	igt_assert_neq(query.size, 0);
> @@ -1222,7 +1223,7 @@ static int query_attention_bitmask_size(int fd, int gt)
>  	free(any_dss);
>  	free(topology);
>  
> -	return eus * DIV_ROUND_UP(thread_count, 8);
> +	return eus * DIV_ROUND_UP(threads_per_eu, 8);
>  }
>  
>  static struct drm_xe_eudebug_event_exec_queue *
> -- 
> 2.34.1
> 
