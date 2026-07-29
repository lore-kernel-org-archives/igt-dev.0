Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CDAC54FCD
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 21:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC55892ED;
	Wed, 29 Jul 2026 21:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVqu35FL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE95892ED
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 21:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785361173; x=1816897173;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jMiJ2eSxeT/bWGSlwErnrVemJzylcMZh+Nj3Bb9Gyhc=;
 b=gVqu35FLPqDGzNthqZ33sL0LM7OHWHnadtvJf9NvJiAtsxQqmVMd3XVC
 Ni0gDdBQnEvndKt8hAxogivW5cDle+m2pFe3aOwaN+Jm+qwl9LyRl4U1D
 C7Mtev8w3+laZQ/HIIgf6A5veiRPqjRr3olHLXOx611fPu5julBUqnXJ7
 3iCPdcJTjCNUQbhxKwilkdY9d51Moq2271rTBGEnTUkkDwtm87KP2db+a
 irZquOLldfYYUSHiCW9Iz95XAjw0EE5o3Ziadbe0DCaQk5D+rxNWhR/1n
 KipG0v2Zh0ouLKTTxUZS0rABURx1IUWKaf4W0Lnrs0QxbZ634Ntyi/Oub A==;
X-CSE-ConnectionGUID: E/Tdal/7RpiwHj9KdomQ3g==
X-CSE-MsgGUID: 7cNHpCjQQvqomgbCfamBxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86168324"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="86168324"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:39:32 -0700
X-CSE-ConnectionGUID: Rm3x9y8zRMmC4xphTPcO4A==
X-CSE-MsgGUID: /mzgVLWDQqWUdykAhmWGMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="264391786"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 14:39:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 14:39:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 14:39:30 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 14:39:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iv8v6+4rHOc1e2L58nz6aHpsFerdPQce0c0pv9f0j1doaJc74/NY0D6mCN5OKU4ALhWiIhV69/51Q6vnQKNkZLsFvd5+E0xnZP9XwfbSit3BWnMztcqQEq8BWeujWuLhD3Lfj41DBHBIrtFGs8ogvXxWYIh0cECpiQCq3EA+bEwS74DlZYO8ZA+ZcaEYqyZ27logyH6raCfMLHHD3Mo6Oh9Q/xguZ6mtQjbF6f4hpK82mbq54Y239bT5TBpuE0sz33EEo5Eewn+cVSCz/QXWeEqm6dzQsNp/EX58NZ6egJVHrzXG/onN4XxgXyQxFxDCkCotYaH+KI6Wei0ZW38U+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a93yCmp/s3XtV9q0O9hpLoDr2yGRCUpLdi0jBRU7VO4=;
 b=w/NvCsiez4SMqRmcKaTacqgvcN96kJSpv+in69IUSlhryBTN3tc2OpX26b1qqMqzckjY1iNuJ92L0fN4m3DEyB50/eJgwgcZWYbcuWSrTuy8iML5uKZCL09JPJa6CQ31+YKautcxyxya7rNqKSCGGKDcDtaqqkpiYeJtw2pMROXNku3dqKqB7nCy5lAX88qIwq5kOpOW6nQ4n0MvJybv57rHUyHD36UCfTn/Zc3pyv/IYJBvpvhLMAI0yH0WuD0qOfzUNActTlIDxyoROCNPd/GvLf6/BAhv8EAMcGzKWLBBIJ7OwsDOPBuIg+ZyrTrV8EjDH4lBz3fyE7et5OodMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH3PPFD9C09B4A7.namprd11.prod.outlook.com (2603:10b6:518:1::d54) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 21:39:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:39:28 +0000
Date: Wed, 29 Jul 2026 14:39:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 03/10] lib/xe: Gather workarounds debugfs dumps
Message-ID: <20260729213926.GC7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-3-0c147eeefefa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260721-wa_14026539277-v1-3-0c147eeefefa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH3PPFD9C09B4A7:EE_
X-MS-Office365-Filtering-Correlation-Id: 485d588d-9d73-4761-7d8b-08deedb9de1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: b78gcqZzAByKPLC/vSgjRUmtMDGy4+OpnpxAtuG8RyaiKMCAHYf5poM/EJKA4VXu/vo9Pr0dLjkBVZt3qKc3T6lZpNe+2Ktu01c0rxthUuJeGWbmr70caWtzAZwC2/Z1h2kGcLt07KIbZIBFt9JIa3BgqxvJWZBSzWTHvFVoIPaJK5Ro20YtG7MEeFb4FBRJoRORmxTEjlFaET86Wr6gUWmnjcJWKBUx8LjIJo6OIu9MI/hyzEwwxSlj/zpw7SEtQ7pYRs4hGYokhsDlGOIMOMDhXuRsYpbwfVkQ2EWObhN8hSApaaOWDLuL5mqqL8GS5rHEn3AQV2nTmoFHdmRAeKPLVD5sepE7KyNn6qUJGGce3zJNy8zeXBvphOdNIbbHvt3vgqJiIXwkfcoeGqmd1y+3b6RAntlsoK1YoHfZhrt1+EYxBGQ+qeNYa5K/YkXSg+la+OhjUa1TQ6xxitL/ljr7H7w7ILx7TQBr9qu+KuFeAetDeyOrSICpLJdYFPGjciVf10IAXiRiRs0kVFH6UYD1HQ2UVL73mKXHCQB/QWcRWNhulbEsMzOsIUIlugzJnraewWlc6VSTplPXBbHkXvlVMscRAZqnbcp6wk4FiDN0mvJSyEzKTR6Q+f52d5SOXCbMqyfC/spppU0E/xu1xqoS8U0PFr1HVhWhz8ZyCIY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xONvLoG1Apu2m46D3HcXe+a3FYriFoMjH0pmrU7+4F8dHqKUtNnOnaBvEtvy?=
 =?us-ascii?Q?kqHDOC/k1UC60+a+QMFUO3h0Cs3GGxJ+Ejz9fRHwbtIHRpSpfWcmQYEa1WDU?=
 =?us-ascii?Q?1Kh4XC9kLVdenDj/SN4oALIpMyuPqSXFaePpfa/rwMQee2FdZS29PcIuAH/O?=
 =?us-ascii?Q?ce8ZQDHWQttfpRzgyd2etICET3+4clY5idiXFGwDYEoNKoiX4sFbp5pwpdSe?=
 =?us-ascii?Q?nXoc6tlxOgE3oPbn6vZzb3DPKQjJ2cNYhvKS7SwHE8P7qmvjAbGS+i6zAiX4?=
 =?us-ascii?Q?NvD3sIl7X3nXr4rPrOAgGJzNhwTpFn78+7X6+eFnGTRnoosvFaxG0ugqJsmx?=
 =?us-ascii?Q?9kUqndtG84dmae8ONGrZdk9kPEtiQL0+DIkUFx3LWLl1k7aqESgFA79UKwMs?=
 =?us-ascii?Q?LwM577MEBe0pT44oP+pbhC2IgtukMsa7fcW+vCSkKp7+OnK+47u+5lMocrNj?=
 =?us-ascii?Q?PLt/BYCMYZu5ybOehk8GtcH9YzTUIrhbZDRkb0MuRPynStCLyYQPnyGf1qDd?=
 =?us-ascii?Q?+9ygPKMi6FjwVagriqiZV3BrWQfXxb5WieBMgJebqY2TKbeqiI2lvJMQj9VS?=
 =?us-ascii?Q?w/GlJGEh82qXAhuYcZUnW433zoy92fyiiK7aoPxLrxgdDX1VbXr3lJmoZ92k?=
 =?us-ascii?Q?fG92XXina5Ra0ZW7eATIFP4Wci2TrCb2WlvtwmLDjgp2ZcKLcIckFK/0cHy9?=
 =?us-ascii?Q?2RqVIAu56gBmpFV8EOJl3I+cyHlRWTW2CddMexprNHPTJjFnBG/focfPOeoV?=
 =?us-ascii?Q?vT14PSlVEZKkUWyMBHEm9qC8HuKceQdG6DSEdbZR4zp6Tlc6iFswGP0l8sIz?=
 =?us-ascii?Q?mTLlLQkWwWU7+YeV5zJg+EzJDVwKZ7OU6ybm1CYnfqHi1zXlshWQsgJHm80q?=
 =?us-ascii?Q?mv7piUpmdVFjLFiD+66OsI+1Zm3vdOm+bm1GktPFl+o+C42VFXnz9Ypvasbf?=
 =?us-ascii?Q?OKx3VGVOE1NI7zlNLVb5BtqbaOmjQYxr0LUv7i5+iBRPy4a1SPOF5410A8is?=
 =?us-ascii?Q?U2g2yKf/WA+NKidBUv16ZHQOGLlWfq4DC5VFthI1scXovHLmScb9FYDTveUy?=
 =?us-ascii?Q?i0GObFzMxSg/lSPdKAtHuYfPgEw2R8nMM9rUG+BOhciZlBiL3o5CFM9TBHrN?=
 =?us-ascii?Q?9qmiGiibxDWXhqL5QG7q741qtlmhhK1uZlyN42g/pdvskBy+3cDlk8tZ2ytW?=
 =?us-ascii?Q?ie+R5RMTl+P+r+R6ybRaQblLsfCdxACrr6qn6symSDw7A2Rrjpobc3fFNYWf?=
 =?us-ascii?Q?+9WjoEYngzrK9x5JF7BWgzL8Nefveuh6W6j8FwFshoK10NgvYyY2616r51+u?=
 =?us-ascii?Q?FKMsxupXetsrtIPP6A/MlOIpdJW+72JFYGlAiG+eQzZRDl3HxdDa4rCG37x6?=
 =?us-ascii?Q?HEtuZjVqgKpw6DLWTeMWdrLV3Bjhh0o5sZT/dFr9/xQdj+ZIA68WY0HCvynU?=
 =?us-ascii?Q?uGQWoaiFPZDEKtDy3uHdjGOsfoZFQl+pdD6+Z+h5koHKHup50rJPbioxQ8Vv?=
 =?us-ascii?Q?OozUOKq+NwXka4pOTzzWGhasX1d/faSULleatksxjWtgDxZ0fr/hoK3hyqi2?=
 =?us-ascii?Q?efUYkzg7n+c6OMG7/mAnK57RbQceI8SIuOxz5Pq4FWcBo7ARkMkkwkC2sAp1?=
 =?us-ascii?Q?PDJf0nszC2/8RGDwDn1MDht8FjIXdIRkyfCaw1W2RTnMvWWxpeHfWt3mIO2U?=
 =?us-ascii?Q?PQr9y3RI0JnxvNHKuVX9Si0aFsg0n9zpGO2kpOwud59FTzKFcbhajKY+APdR?=
 =?us-ascii?Q?6gEUZ2BEBxlpdhC4soMjV7LZUwefG/c=3D?=
X-Exchange-RoutingPolicyChecked: Uxkx2i5qB1Ro8+EhQ5t+0yRiqLyniJ4Nuat88qFsMcuchzsk6Yp8AvgtzweqbPqKI8avqBq+8IN3gWcsxUekUApUEUxeJpV0YzSeUNDJ3fnkSwDWQIiv0O+O294xp2NyLWF7XqoczYVang8NNLgGyYE0FbeUgOESgyI7jUd4TZ6uSZ/9EscGjZJ/HRxZ+D0PAvpNvPqY95aqtTmSXmHAaP8tkNk5nrHMAnfTnUq+8jIJ67AIfe/4KwK/OQXYKJvmJtw/am2zVrv1/+Apnf5qd3KBySTBBsePB1lAOKWs6dKFV27Jxe/5oI60Dl+jm/kCdgsbsGdhFn69aIU0jueEvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 485d588d-9d73-4761-7d8b-08deedb9de1c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:39:28.5914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DERaItHZ7zvqj8/Y1LE1RhNvNHOwDtruE16G+8gX3U4ZhnUER8nMFoHf3I9FzZoqk5Z+EXhUymseJr3FSUhbmhhwGn1AtEumKokjXN4cCts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD9C09B4A7
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

On Tue, Jul 21, 2026 at 03:59:56PM -0300, Gustavo Sousa wrote:
> In an upcoming change, we will cache workaround information in struct
> xe_device.  As a preparation for that, add the logic to gather the
> dumps of workaround debugfs files into a single array, which will be
> used as the cached information in the future.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/xe/xe_wa.c | 92 ++++++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 58 insertions(+), 34 deletions(-)
> 
> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> index d44431e7e61f..e4e1b0bb7972 100644
> --- a/lib/xe/xe_wa.c
> +++ b/lib/xe/xe_wa.c
> @@ -7,12 +7,65 @@
>  #include <stdint.h>
>  #include <stdio.h>
>  
> +#include "igt_core.h"
>  #include "igt_debugfs.h"
>  #include "igt_sysfs.h"
>  
>  #include "xe/xe_wa.h"
>  #include "xe/xe_query.h"
>  
> +static void free_wa_debugfs_dumps(char **dumps)
> +{
> +	for (char **dump = dumps; *dump; dump++)
> +		free(*dump);
> +
> +	free(dumps);
> +}
> +
> +static char **get_wa_debugfs_dumps(int fd)
> +{
> +	char **dumps;
> +	int gt;
> +	int debugfs_fd;
> +	int count = 1; /* Device workarounds */
> +
> +	xe_for_each_gt(fd, gt)
> +		count++;
> +
> +	dumps = calloc(count + 1, sizeof(*dumps));
> +	if (!dumps)
> +		return NULL;
> +
> +	debugfs_fd = igt_debugfs_dir(fd);
> +	if (debugfs_fd == -1)
> +		goto err;
> +
> +	count = 0;
> +
> +	if (!(dumps[count++] = igt_sysfs_get(debugfs_fd, "workarounds")))
> +		goto err;
> +
> +	xe_for_each_gt(fd, gt) {
> +		char name[32];
> +
> +		snprintf(name, sizeof(name), "gt%d/workarounds", gt);
> +
> +		if (!(dumps[count++] = igt_sysfs_get(debugfs_fd, name)))
> +			goto err;
> +	}
> +
> +	goto out;
> +
> +err:
> +	free_wa_debugfs_dumps(dumps);
> +	dumps = NULL;
> +
> +out:
> +	close(debugfs_fd);
> +
> +	return dumps;
> +}
> +
>  static bool debugfs_dump_has_wa(char *dump, const char *wa)
>  {
>  	char *a = dump;
> @@ -50,27 +103,6 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
>  	return false;
>  }
>  
> -static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
> -			       const char *debugfs_name, const char *wa)
> -{
> -	char *debugfs_dump;
> -
> -	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
> -		return -1;
> -
> -	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
> -	if (debugfs_dump) {
> -		bool has_wa = debugfs_dump_has_wa(debugfs_dump, wa);
> -
> -		free(debugfs_dump);
> -
> -		if (has_wa)
> -			return 1;
> -	}
> -
> -	return 0;
> -}
> -
>  /**
>   * xe_wa: Check if a workaround is enabled for the device.
>   * @fd: A drm file descriptor.
> @@ -80,25 +112,17 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>   */
>  int xe_wa(int fd, const char *wa)
>  {
> +	char **dumps = get_wa_debugfs_dumps(fd);
>  	int ret = 0;
> -	int debugfs_fd;
> -	unsigned int xe;
> -	char name[256];
>  
> -	debugfs_fd = igt_debugfs_dir(fd);
> -	if (debugfs_fd == -1)
> +	if (igt_warn_on(!dumps))
>  		return -1;
>  
> -	xe_for_each_gt(fd, xe) {
> -		sprintf(name, "gt%d/workarounds", xe);
> -		ret = debugfs_file_has_wa(fd, debugfs_fd, name, wa);
> -		if (ret)
> +	for (char **dump = dumps; *dump; dump++)
> +		if ((ret = debugfs_dump_has_wa(*dump, wa)))
>  			break;
> -	}
>  
> -	if (!ret)
> -		ret = debugfs_file_has_wa(fd, debugfs_fd, "workarounds", wa);
> +	free_wa_debugfs_dumps(dumps);
>  
> -	close(debugfs_fd);
>  	return ret;
>  }
> 
> -- 
> 2.55.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
