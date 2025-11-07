Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64123CCFA13
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 00:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8E510EA15;
	Fri,  7 Nov 2025 00:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/b7cO7e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BF210EA15
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 00:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762475870; x=1794011870;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xpzTYYZvIeAdbEtCDhvTtwiwLPQqhw6cXgqh9raDYQs=;
 b=m/b7cO7eLZAzEhch5oVBKA/kMGcDbql3StqVPtv3R7aPnrGOZG5ZNaTx
 F3FbHS2gsZAzXAk1enG76ASA1W264lQOqpV9Hrkk94kTMr9oghqjuDLDi
 y2eE5D5nSUiAMm//CTSJTHdjcvVRcVVHUPY8coI5+26UvpqzX37g+m8mE
 WlygZPB+pIsxIDO3oO3ch8N5O28GMy1aKZ2LXuI3C45U5s6/vyygCSw5L
 0fbny9h0R7W93b+0xWrTrnJmAaGS3udwImKruEI+cKKqnTaumsTEkWqmq
 iGbu9XIH81r5MkcBvrJh4+a9vfVyQbr62ySr8NNgnCkIxPvkH/miDLY/+ w==;
X-CSE-ConnectionGUID: nba+5RkdQ7iN+hGNPVcxXQ==
X-CSE-MsgGUID: sZi7D5LtQ/2p4OoanfVV9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="87255987"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="87255987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 16:37:49 -0800
X-CSE-ConnectionGUID: ZAwJxIt4Ttenr0YJchdLkw==
X-CSE-MsgGUID: MOnGRHFvRLa5YjCfeULZGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="192940309"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 16:37:47 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 16:37:47 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 16:37:47 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 16:37:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1S88fiACZ9XuShKBBRdltVOH/Qe5mv9/cScchep0ylY1X4ZgGq37JNMLGjgFuaHRZhiWiqzxWyeoGOhau+QdlJFRhka4t3pUC0Nrpq5MEdm6dhWrTql2ZN8w7IaYqf64SWHCHgm3ZbGh+pokV/VHDaaeHRcogSbBNPqjQFcZkzSCGBAD/Vkv9uojeR7TUy9BtfuQ1Azn+66vJYEzvsbvqMDP4OLx5/MDiZAQVgnn0wqSq7pv2jTzqJ/3MdFPCGyJzSkNZBPFx4OZnXi2bKtQRVI+KuQBF4+gftddDKk2j4UHbHwuq43Xt/7hiwAJwAJbSQmQpXRstojDhwbwGaLbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGgK48VO8aEhbuiNM8/UQhUjSsoLVn8q0asBduBVAc8=;
 b=pcJD13c4DVLPk6KAoJ8hXXgthBFDBbqnbAA1WwC2A7MWQhOD/LBSy/KS1eN3lLOIef9lnBlfeCUFUZ1LOto8G/LoYtXh2XRw1+ExkZ6L6SIr5W1tYqg/V8e8ixNpC0Zis8q5+O1IvHO9eK4x2f1h/z2WrEYSp7CeePy2Ja8eXbe39iSe8RHmQChenieaReK+bCzCS6SqHxo3TjCDR+fWoQe+p72RDXWT4svIxDAHo3IonmnxP8LRsrj5lXJtDjcziN+q+wceMpGKB3Fg8DZYI6j0JKQljOuEEs/Om5mLiEDbgLQRxm1/ScrgsawQAgIv05pwlRyfDJF7VooYUOZrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6712.namprd11.prod.outlook.com (2603:10b6:806:25c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Fri, 7 Nov
 2025 00:37:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 00:37:44 +0000
Date: Thu, 6 Nov 2025 16:37:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <balasubramani.vivekanandan@intel.com>, <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 1/3] lib: Add NVL-S support
Message-ID: <20251107003741.GF3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251106153419.1741989-1-shekhar.chauhan@intel.com>
 <20251106153419.1741989-2-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251106153419.1741989-2-shekhar.chauhan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c58c2f9-0c2e-4da8-3664-08de1d95ddc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ysUpaQoxtil5UpCB0lDch241AL1EZ0wjqyUBE9er2UZG469pGbgEsmbsYlSR?=
 =?us-ascii?Q?JkD35AyG19xWnMyAOxZSll9agKV3ZN1YHP9szuRpvwk8AQ6Gu2iaR+NNPIIk?=
 =?us-ascii?Q?VnJu9MJc0zQOjcxx1DckX76mrw03Tnc3IklCo8f+CM6BiFkhhldzEFQGKoUB?=
 =?us-ascii?Q?Q5UtxMmJLaqRLn2weytks7TK1/G+XqMxdDrjgd03bMHVvfSP5OONGIWH3D8b?=
 =?us-ascii?Q?EovePOFroylMVRn6kePDkpW8bMzrjq0lbeREb13lPAM6aLLbaRFnDHozX0wG?=
 =?us-ascii?Q?c56ygSRICnPVHMcanHKGkdN0+QFRgQZ/anVKO7gv8BsHms8WWctQ4opE4JgJ?=
 =?us-ascii?Q?ipGola5jT6zXmXelS7rgDBiykzAc0JSU2QRvzKVsGslSzKownFXPT7R5VfRi?=
 =?us-ascii?Q?MalXvmke7u6mnCJmEWiq8y6HHygu+VCE/rpBtOi0dbnfcSnkGax+wj0GLvdW?=
 =?us-ascii?Q?sNTriImOHPW92BstKRH9Djuh1e+Sj6IeaPRIsBWBrMLz3CrTSZhijeXWbDUE?=
 =?us-ascii?Q?LtB+CRtYflfL8NabQnzgrSEEXgzQQ1V4VkCCQbygBvJ0LeQQRFNwkG6MqMsn?=
 =?us-ascii?Q?/1622D27+CkPSxSYhEtpNXbGjgmtTkbs2vs5a+qHePZPgR7JK+EF6G+mFLMT?=
 =?us-ascii?Q?nuhDiQDCbz6pZb5rpTjHrqPaEAJnY/2B75+fmezvcq9Sw1DFCkpOG7iAYhON?=
 =?us-ascii?Q?bXqtbEcPxHW6BCi8CNKOyD5fwFGsrp0bZ7s5RDUtteiHhnQkJcnGPlJgVLWo?=
 =?us-ascii?Q?Eixa07xYecFT53hrJFPBIpYxdHx3xkiFRyCF1/JY9pHjN7elVpgDEN8JeLro?=
 =?us-ascii?Q?dvz7JXAa1dkpMTulaMecPaf1AZof4Ez8IPBzkuw2KV9LlKtvGuIkmt0fGDO3?=
 =?us-ascii?Q?XlibJ+UT1y+vU3RTZrYoDbwYEVGgIZCGvtACY7qefKJap+e0SSrdlw71MWsx?=
 =?us-ascii?Q?NHZHLtGMXC4tXjFC9b2yLyKY8oSyo2bImrZYG0aVfSBcohwXFW9gzmnTgUyp?=
 =?us-ascii?Q?54gpt7kbMSm56k7vcvJVy7/u0MlB1njzLNe2Q7ngJUT1fB/H50lqV8Wbv+pR?=
 =?us-ascii?Q?cdYKB22Yz8zektZvyLKy/qWk1rTZqzs/ypAwaMi5FcEph4F8DXH6h1EaC2uU?=
 =?us-ascii?Q?2mfPSNifNRrHH9gGeo6oQmKbY/V82EGTtzg+TGEWPwMHdeMM/4nJqRvKRwaS?=
 =?us-ascii?Q?6IMY+ihq8GYP6Az6CUCzIuaK2hdcwTEuvZrFKbsmfa8+dO+m/kYVs69zSvYo?=
 =?us-ascii?Q?zUpzNI4cufDF6RaAu1DpH5VDrdfsLuKbfYmYgzYRwwpmQrtTLlXtoT942YMN?=
 =?us-ascii?Q?wbQnLoeC3ptlqwvnAPkK8Pd3JUuKYnX7IyY21MhSpQPJbKysvooSIalX2QBB?=
 =?us-ascii?Q?dhhO5RurmiFh5TVjlnyFHmKiCZGtybd5DJTnrPBQQVp2Pgag9PEk7xtoCU27?=
 =?us-ascii?Q?y71g85sQ78QWa3QLYHp1Taf0Znmj7DzB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yMla6JLmIc2sEML9LaILp5UvKXEzjnBr1Q9qEG/By6Epm9LbLQ2ld05x4tPK?=
 =?us-ascii?Q?pwTVX54fegwMQVwB7Cj4YBpYN5OwhaKm3pQucBrx8rC5a0J56XpnW5V8z1NN?=
 =?us-ascii?Q?pkf5DlS9La/OAIAHvREogOmhxER7cLTKHlW361nva+PiNH+DYNHhtzEPiMQs?=
 =?us-ascii?Q?BD4YtZKwDYhzDlovBeqAIuHV/R9hQ2VMbnAQMV3F1qCIXCs/AXLj4ROktGoL?=
 =?us-ascii?Q?au4PoNhAQjQnek2PWn3PDBr1OhoDUq4trrA0dB9/XmJiFxJAMT/e14F5/xxD?=
 =?us-ascii?Q?Ub4xoYFW8viB6zvhxBxLI2Q+PmrBRvm5qle2dfU+XPdt6TWPLpNIz+wEacJY?=
 =?us-ascii?Q?tyH5AEiyJPn6ulorwR5qR35hS8m/2ZEHcJGeJzSUf+gaE1IHzdDoZiL+aoZh?=
 =?us-ascii?Q?Mf/ecm9KE5p1fdKgTL8XNmf8xoIHMH7HXNMj4kaf8jZBW9QgjiTTg15MEQCB?=
 =?us-ascii?Q?U9R4IwWhtX5sjfYzDVYVx+mguggLBhEjCp7WxIgSHA8VB0uuVpfmedIbMriW?=
 =?us-ascii?Q?eUvM9O53cU0hV9LB7eNkhfcNNwSQU9MuI4YQOvPWYujogCcsnBr18wrTeGCt?=
 =?us-ascii?Q?UtxYAuGcIkyj610AOlLNV3dfPk4OgET3gFypsGKVJHK7V0b8da69l7PKXcQK?=
 =?us-ascii?Q?hCPbXWMUP0H+VAcW1SwuQrarBoCoMWQ3uW68TFJoWuQVE9RxlV6wVLS18ITv?=
 =?us-ascii?Q?2HKvkTs0pTxjkvAZyusKTtVAvDfScTziTsuDu/MdyblDNrJTMlBHV69z2KjC?=
 =?us-ascii?Q?JValrV6mJ5txwHsKpqLrv8JeqKrh8NesICK/pkteO1u7qtKRHtVCYYmQq/Mz?=
 =?us-ascii?Q?nHgd9a7HPIPnlAA9RxxhtAsAP+svFp423vW95/SbhdsFwb6uN/C5APMzfKHg?=
 =?us-ascii?Q?ZgvUlYK47X9o177GirtkndCdtJSVW8yn4yLCGM0wNTRDfoUoq5mNslwWp9qn?=
 =?us-ascii?Q?BA5jBYC/T9vL6WN0y/nvJOfq2yvtAWDi/HHIDhoCWiLU7uMdAMP3qT0fALCi?=
 =?us-ascii?Q?E9qguK8tyRgKwoAC7UHJpFkBzD9my496tlQ0UijK1jtZ5CL3T33d4/C5X2Ia?=
 =?us-ascii?Q?H9GPAAx5mxFi/NiTtoCdyHDlN71Me0vTKj8Uy5mDkfhY/uFrGyKCFy88yI6v?=
 =?us-ascii?Q?qGQJmXatcKHsJ52/2BqeZVb/XklNhsgZ01PYD7UFG0B5PEtiZFuf7emZb5QJ?=
 =?us-ascii?Q?mLm/MrTuyj03yAN9+2jl3HctXpkKhBs+GZ0lwNtc18wHLqheUYKz02UhwUfM?=
 =?us-ascii?Q?8xCmcugP8vcqzhkFJsGSmquOKp3NccAb/pDncnLHIdwR0M2jUQhpetwZ0L8b?=
 =?us-ascii?Q?geux2lduf8LClYQq8jKlBI5Egel98tVphmEzSzZ93FlAe69PpZQZaY8uw2tz?=
 =?us-ascii?Q?Bi4CK5tIegTZlvZfq6zzjot93AKdX0j0ONmNxqfo31KTqU1y+rP1YGTBxEFY?=
 =?us-ascii?Q?ZP9pvdR4u259G9ebrljJFKTWpGikN5CBxDChXwvaf/fFExpnK8+gyLnpcSvA?=
 =?us-ascii?Q?/ot2jnGo+I74JQRucu0brbrWS6ROVhnAQS2ZJ+H08bhRhbn6LZLWRWdxF46Z?=
 =?us-ascii?Q?KKWPyrcVE0cJ0DENkb1GhRStyOYMmuEGQv56tI1eVC2V6wVTT4dKjdvcRfoo?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c58c2f9-0c2e-4da8-3664-08de1d95ddc4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 00:37:44.3205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygp0VNKPo//MaZi7cl4f4NreKn2hGe2seKk/9wOygr9G38+2kvE9+DuwieP0Ef04uOY6rVAY506ostzCyz6kSdpKXKPfAzTySEwkXVwWYZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6712
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

On Thu, Nov 06, 2025 at 09:04:17PM +0530, Shekhar Chauhan wrote:
> Add NVL-S device info.
> 
> v2: Fix indentation/spacing for PantherLake and Novalake in
> lib/intel_chipset.h (Kamil)
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>  lib/intel_chipset.h     |  4 +++-
>  lib/intel_device_info.c | 12 ++++++++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 2f6bf788a..70ea78464 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -93,6 +93,7 @@ struct intel_device_info {
>  	bool is_lunarlake : 1;
>  	bool is_battlemage : 1;
>  	bool is_pantherlake : 1;
> +	bool is_novalake: 1;
>  
>  	const struct intel_cmds_info *cmds_info;
>  	const char *codename;
> @@ -209,7 +210,8 @@ void intel_check_pch(void);
>  #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
>  #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
>  #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
> -#define IS_PANTHERLAKE(devid)  (intel_get_device_info(devid)->is_pantherlake)
> +#define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
> +#define IS_NOVALAKE(devid)	(intel_get_device_info(devid)->is_novalake)
>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>  
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index a853f9ab4..fe452d50f 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -539,6 +539,16 @@ static const struct intel_device_info intel_pantherlake_info = {
>  	.cmds_info = &xe2_cmds_info,
>  };
>  
> +static const struct intel_device_info intel_novalake_info = {
> +	.graphics_ver = 30,
> +	.graphics_rel = 04,

It's not great that we keep on adding graphics version and release
numbers in IGT for new platforms.  That was supposed to stop with MTL,
but we keep making exceptions for "one more platform until we get around
to doing the cleanup."

I know Xin, Ravi, and possibly other people have been working on the
necessary cleanup to get proper version numbers without ugly hacks like
this.  Is there any chance that some of their work can land soon so that
we can handle versioning properly?


Matt

> +	.display_ver = 35,
> +	.has_4tile = true,
> +	.is_novalake = true,
> +	.codename = "novalake",
> +	.cmds_info = &xe2_cmds_info,
> +};
> +
>  #define INTEL_PCI_ID_INIT(_id, _info) { \
>  	.vendor_id = 0x8086, .device_id = (_id), \
>  	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
> @@ -657,6 +667,8 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
>  
> +	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_info),
> +
>  	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
>  };
>  
> -- 
> 2.51.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
