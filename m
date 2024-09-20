Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CB5CF9C5D
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 17:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F4C10E2F6;
	Fri, 20 Sep 2024 17:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTNbpPZb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8C710E2F6
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 17:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726852531; x=1758388531;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1ZzM4+0PF8HdPlI542pgcKGBiVZACd7sCMerI5/pjDY=;
 b=HTNbpPZb6h23Ba4ld//weBLWxDDf0ZiWroKpeimyiGKLe6IkyPIlRAhi
 q/dTci9QcuHGL9IpVz4fMZMga7Bnf+3Ca/HURptHa4ApeZ6jWFNrMIi22
 Dvysvg1uayryLZdXuzaDrNlhkG8Zyz0s01O9mGuN9bsgBQl9lUtNvWIVn
 rgJKF83NJblRPeiNsROFPJ/QIoqnrgRDMAuypUfbQAAuiPXoCNsiV9+qW
 R0wnRbcZhSYNiwPNcpUarGZbDziN019yMXapAka4sVDe3yaB3WuE2eklJ
 IRVeVrxPcfgWcHnRdK/+IgLeOMGSCX1/aiCeI4IuaEka3InLQOitBwp/4 A==;
X-CSE-ConnectionGUID: uilezyp6TdilbOoUfFh+wQ==
X-CSE-MsgGUID: X2Y08Bv1SM230ASeiAiJPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="26017367"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="26017367"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 10:15:20 -0700
X-CSE-ConnectionGUID: lbltJ3dcTzOndsxY1ddNRg==
X-CSE-MsgGUID: nOwEkl1jQaWsPkZ6rftWCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="75165377"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 10:15:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 10:15:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 10:15:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 10:15:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 10:15:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o90/q6N904gp8+PPfxnI7us5fEsbTnrL9dFfiNABY+szlgC6KPfvCgcn9Pv/BIhu5w3SVn5j1keaYVA9Pz2PII4zIau2xIGOT9HLk7WidpLUHCQliQmrXOuCfoMvsAoDM9mhVYIG3vlJGyUmrwLCuajvgJoyf2W+G6SM/nxAJyzmFw/yW2XqYQZAg/VAMGik8LgSY7uYmNdH7GYmGap+GktNYM1DPgl36jDasiaBcxXc/QdvD4uoTUd1Xtvzy1mux3vKTPG/We6/4GF4+YRqGyB6DRTQjgFNBD5orKFWNjfJl+mu75+qxzzWYr2Dd5zHQkoHS0KbM2CBoGGRJYAusQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zHKOsoynjQ3uD/QL6a6OYuP3IBr4ahNcB+AyZoMxQw=;
 b=FmFrrNIfGjxgTlBHXcVDQlAQR5N8BzpjNKYXxSq73pn1UFV4aZR4+I9Fg7y2Ps4Ncc8KQWiQEI4c64apHS+n5pKi2umk64hX0dedMPBaAMLgQETGGUaUZ/IV7YSe7xk0QGtQtDFXVXqHSFcV1kCxf5+hEqXutQL+h5JKbfPbBEpLVCF7z+1BcIFdPXxvLrFrz4wyTWzFR2Epe57lpv1vFijACuZvu79VR4TP1gnB8W7jNjjv46PikeSfjOMKWml8PUdcleCsKY34rcRg+KLEw2LQ3bAVd80btrIQVZIpvcKgwqp5tjx28rwGBw9GZtKjhU57vtKzemGdccONl/8vLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DM4PR11MB7255.namprd11.prod.outlook.com (2603:10b6:8:10d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Fri, 20 Sep
 2024 17:15:17 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 17:15:17 +0000
Date: Fri, 20 Sep 2024 10:15:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/6] lib/igt_gt: Document fd argument in
 igt_open_forcewake_handle()
Message-ID: <20240920171514.GN5774@mdroper-desk1.amr.corp.intel.com>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
 <20240918163629.1186314-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240918163629.1186314-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::9) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DM4PR11MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c7d70e-0257-4e4c-458f-08dcd997cc4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fUevuzKCUqjgnsMBNCI5W6x+z/mJE8KsR2q+Bi2v4/QddmjZiIOMrN7Ik8O0?=
 =?us-ascii?Q?h+udP4OvFIY4bDI9V3/EnZJjwhRB4EarIPdLR0gnSJzh3SEdLOY7NE1AbIl3?=
 =?us-ascii?Q?pycGmAE8r8LzZjEEaFQOE/XPw4WWKyG2PK/qIBTmF2jaGH2JiMAeJRw6Ye+s?=
 =?us-ascii?Q?8QwVdgexO0V3DrcwLRGpag1eN7pBgphuwezWdVrJlf4mKl07qLCZ9+UN/As+?=
 =?us-ascii?Q?ytrRlib/R16OcFEoLIEbaT9aUfeDLGx1jS0G8qRcc5Hu7HqLyFdsGAbtao2D?=
 =?us-ascii?Q?7BbqKuBM6sGRGY1pE/ccBevP1A+nf5iNzK0qjvVeuUXhFZ+Go+s4zke0ge6Z?=
 =?us-ascii?Q?LBi1yemBqyEkSKZmKGUhr6q1rcpYB6XBQs9GmTGCBYQCWZX6gdSx6MPQyNXt?=
 =?us-ascii?Q?E3RuyiOKXBzYUugAncwHGRiYXRQ3IDlUhdZ+cjPfr9HkgH0K+WGa1MKwuAxJ?=
 =?us-ascii?Q?iVq9VUbfRXHZ6E3JagHMOAviQJCV4ymbzMiwh/F8L0io5mx/FT5I0l7pu9Jb?=
 =?us-ascii?Q?ArGFuMldsF1IVKjNza0+Jnjx8zesaP5li6R5JtwI/tTpT5yk27ZJuubRPaja?=
 =?us-ascii?Q?fAa85b1d5LsoGBAUZJmCsatHu0WZCZiP14+a8fqx9H8xIanex6A3IlrvgJSs?=
 =?us-ascii?Q?5wYYPMBRLYXWQ6HBERnjdczSEmKIvu3PK2ZVAxPHHEhmGlWrX/ZevfKReAuC?=
 =?us-ascii?Q?8G41WPcy8ANR2N/0DjHNm6WugxcVWKtOqS/HFYfq7u2c+UdnQDoQKCa8zkTw?=
 =?us-ascii?Q?Nsg9Nk4dKcUpzBdQ6Dh85OXsqu2o5O9BejfDtsESsMIpc/EvUouldJMg6bqc?=
 =?us-ascii?Q?MgWrNyet9N5Aqb1u9Az2RHfWuj2wk6pEeel/kEQ125DAziI8hbR63SeDdC1z?=
 =?us-ascii?Q?nNb/QcNCYRW6nP7g/ZwdyLaTHBORJGXtkco5oI5wD42d2IBACRkdprTHIsb0?=
 =?us-ascii?Q?oZsNxCUcBWUvgXREJ/VQww5v4H9+W9XyLmfc8gz0whfkX9Iru8QmCWCry3Bg?=
 =?us-ascii?Q?Li4V6ORTARWtmLE0xKOftSueQJUBuBDoeFjifWviQDdOKAQUvtmdbies1UAv?=
 =?us-ascii?Q?qPRJ7lV2QDJTmFbCxvMxAj/RifF+Ga4dRIrre5JaMXKyNrbHNmRoOg9mFHhj?=
 =?us-ascii?Q?o7zEfW0IRZeFZ0hRNraVw1ot9ufXUITXrNUZwY/5wQl53vibotDLLNvEg1Dq?=
 =?us-ascii?Q?kgl5KBFrXtBeUDggiJgQcJbF68wOuPLVUBfWZS2w6kEo7JXk2HfiJOh5EA84?=
 =?us-ascii?Q?ducmwTK7BXA/wNNDn1KY8Mu09/iBQR3UzjjLzliodQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B0EHRlWd4lIffKGDy9/j1KlOJgqsyXijnnEtBlRk/95BH/vMC+0cvGJZI4OL?=
 =?us-ascii?Q?sq8+3WCi7rNBQMCh1iyTDhBTe06WBDa7/30MDE2XZG9q273cTx3Sn5Z9bUV8?=
 =?us-ascii?Q?Ts92VpdfAtg86cl3nqmOd8F6pHW8w9UEyOCOQBwK6szbm+0oRdvNiaxs2LZ4?=
 =?us-ascii?Q?aP21530O20QLMEQaXOvuSePaHF10xF8brY3uruV0+9dbIlAji2jBZRsHJdYc?=
 =?us-ascii?Q?2D9WOmvjyKgaZvmjKdV29qfv9B+GVJgDQMgcDVlwfDjVSOOCxKwAZLvTvIVQ?=
 =?us-ascii?Q?1XtYuDGTT+T/lM7KpFuZQEwNLHU2Yi/VypN/mlU/TFUqYYuBDuWgv1YUB+bz?=
 =?us-ascii?Q?udolORFcDxxQSBFsiK173XrsVR5WcXb20dn5iAXhDpxWyo192HCZZ7Rd1GYY?=
 =?us-ascii?Q?hoLy0wX5X4EYfe8xfAP550NjI+a7gWetRQNvBXGOVAbuiZ8/l+upxvLqZBIs?=
 =?us-ascii?Q?F9RcBK2tpEwCwZMCHhtx859amHa4QUAmb97hJbAt5vNoXByXkh8dkaUmnGQ6?=
 =?us-ascii?Q?iZWQa9GmtSaj1A2ebIb5/L6uSYwDdZHhfeMorYZRy6fx3LakUNO147nXivP2?=
 =?us-ascii?Q?J2mgRA5I7N+6VOLZ5jHLwWsTmK2U41Pe8jcSRAkkAPTG8KJ0pDwLMK+twmRQ?=
 =?us-ascii?Q?QLcV8iAcA/XgNm2gKNVNFMHQErHS2MQIgn3TiT+/So607FUQBERv3nRWQnES?=
 =?us-ascii?Q?E3iLliblyLW/o7AzXL00RYF2GgoKP7//dlk6vi2ha2txLoaVhJduWYsCBtKW?=
 =?us-ascii?Q?MvhBgwbqCj8cbii3DWRTpaAAHCrH0IGHul1T8Nhec6WAvkfrfyKLnjv571p0?=
 =?us-ascii?Q?YPW0p/WXkvNmJSz75HxL3Jh7ZBnvnIlJFbENHykGHaa5VoWGKI9gj4AN/ChA?=
 =?us-ascii?Q?9+CuGnxBlHZKCnKY3wVpUhE6rg9PKenzJv+yMIn+4ta/zcBIASvXZIhjUKhu?=
 =?us-ascii?Q?IqKKjoB9QFOPPGVEweIrYG7OZcbqvWzacF8CMZb+ASiweCPr6dqFvEDG1IWR?=
 =?us-ascii?Q?FMHXPg7it3+GHUIWII8yDHvbnZQ7kV6AYdwSywnFQH53eGbg4a/XbEcfGVFo?=
 =?us-ascii?Q?Sigl53H2vHndLle5PqfDd2Lt3OU0yjLMY6qFmIquSC9d9lr5AW+uwENtmMWv?=
 =?us-ascii?Q?h9WGHrPl5kNBs+H6MNfosMNdA+qo21MMn0Z2viUUl8n5g/kAs9tAhH+TwLjb?=
 =?us-ascii?Q?4TUKP9P3wSIy2ZyLbshzSO/tt6OaoNZ/ixSvEGeBPC7WtwQgiM1MEWc74Epk?=
 =?us-ascii?Q?wvIaAij+SVnF9AXfVUPt1COA9QFGtCMeYGGeEWfzqvmdth+P/ikdhO40Qr61?=
 =?us-ascii?Q?wV3ao4F2onjQClBzQ1yOoC6m0uQyKbDw8PtCFSwT2AD/44ltdu/BxyWJ8ATS?=
 =?us-ascii?Q?AMbZMDMSlBuW6ZOwZ1+UUCILLtktmVKsY3LS/3VZOJPqxgvzJaZvPrhbJ9NR?=
 =?us-ascii?Q?pFG9Gj+hZS+PuG136j0jjJPkMNihVVZDkH0SCfgp6wyoRtDAnLp/C9l+cHUj?=
 =?us-ascii?Q?ZvJRTYYxwutyvcCbiy64m0txAsWnabits7Z77dnPghLcHSBrFCdvr/OH8FtP?=
 =?us-ascii?Q?Jxl/f0aJCZ8WmtktwjgCZSnlEheuL5QApmFLl5rpAJ+AxALDaJsLf61fJWtg?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c7d70e-0257-4e4c-458f-08dcd997cc4b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 17:15:17.2601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Naqp94hwVh0jhGiVj0UiR4bMpBQNCwjl1XszYwXjlL1djZl7okIsmKIMDh8BqC2NfV4kJCfX5g0q0en63K8ZB8Ul7ZWoa+Gxt7ZH4ET6GSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7255
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

On Wed, Sep 18, 2024 at 09:36:25AM -0700, Lucas De Marchi wrote:
> Document the fd argument to make it clear what -1 means, which is
> usually not the desired behavior.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_gt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index b043e2d41..d831d2448 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -492,6 +492,7 @@ void igt_stop_hang_helper(void)
>  
>  /**
>   * igt_open_forcewake_handle:
> + * @fd: open i915 or xe drm file descriptor or -1 to use the first device found

Is it actually "first found" or is it just literally device 0 (which may
not even exist anymore)?  It looks like if -1 gets passed down to
igt_debugfs_path as the 'device' parameter, we just do a memset of the
stat structure to zero it, wind up setting idx = minor(0), and then use
the resulting idx (which should be 0) in the debugfs pathname.  Am I
missing something?

It looks like there are a few places in IGT passing -1 to debugfs
functions like this.  Maybe we should add a #define for it with a more
descriptive name to igt_debugfs.h?


Matt

>   *
>   * This functions opens the debugfs forcewake file and so prevents the GT from
>   * suspending. The reference is automatically dropped when the is closed.
> -- 
> 2.46.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
