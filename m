Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9287C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 23:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB2210E1CD;
	Mon, 29 Jul 2024 23:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWuZkrH8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CB210E1CD
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 23:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722296577; x=1753832577;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4799qMykB948luPYYD18LkAYht7xYPQu8l9PAKyujBs=;
 b=RWuZkrH8ul8zLcabOBg37yD0owAIEHY3mgrOI4XMAzyzx4+Xcyc9K0Tf
 Rz11x6hlnjYvnRRFVjGIMSoOvZ9J13ZBot5W9OabKn4BdSnUkpnN0u7Hb
 aO5+Ik6J3ziiMbGvHW1M0anXw94uud5BDmfPx3Stwv2soGU//LQv+Sbf1
 bM5lp4sGfu98noogR9oMKTUNktooccVM4SHtDKLf0+PsJ8lo2Ov+Zec3p
 dUpotiTtTjy4GTJ8CsHtmOC7LcP5vuRzirQAJsI2BnFwe65LrYiHUNMJs
 nP+VXkx99jD+VLG9tfdE7w+UXAC40hGOTDKBRiMHvPhFQYo4pAemmBRcb w==;
X-CSE-ConnectionGUID: VeCnfScmTaSByKuzuHK+5Q==
X-CSE-MsgGUID: +CEmQQV2TG+nJQol9QbtKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31482266"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="31482266"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 16:42:56 -0700
X-CSE-ConnectionGUID: TyTKKL/oRhqvQ4PNQLVk9w==
X-CSE-MsgGUID: lG+dGo2CQvOybhWw35pmZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="77368811"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 16:42:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 16:42:41 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 16:42:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 16:42:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 16:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zG0dXgc/bM1slOKlKpjkiS84jsIiUWyO7H0tk5rRsAhikRVgLf9nZ2QOmTrsnawnvJwDrTImOeDbLQ8RrWGzf0Y00qe9bESikaCNECvzab77pwPPfWP5r9iv7gOdoGwV60qtKXVk3q/ot10H+gXrcUG1iv4qAcmwYcwFuhk29j93p1or9C7xqQMpzfsveaDMdWA8+xCw+sRES4dU6O36P7LLCvRmUbxPqZzGY7BcgqXy7VGig+GPSG2JoV1R241jF8y1Vv9aItDYS9AbVMzvxno3JrTaMCul0apZyuia0o8WRugelVe8WQBmeIgaDleYD/DQbC4n5A2JagMsnzRq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsrrqLyXPp6g96B7SKc8xd7zzIFrkwvDrMZ01sxlgDw=;
 b=mahxR9vXBEojaAI+dYmIao+YSqm8sdU3gvVDUIMOwCIYDLHEVL+ygzRgTVanROxIPfJSVtbJbXSuGHfbLciIxXvM1Tq/ak4vIl9uQuYPnnLklZ2BQtiijCEzCQZMHeAe03BMDVfP1XLNYQJMxv/hhzr4BFR0+zKeHBGl4ntowomESZ36nqx5/ywPb9M5mN1ohfOJeTfZ5/eL1OFxKphbLSJmOmmMFjPFdKFzX8rDxoNdQltGiP+BGOztPWpd/O1aO7EWKbtWFh33S4JKL7LluXZTikhcV2w28CiqtsIVFFLZTFDXcrTJCGRC4MMUuRs5nSTNw26qYNsC9QtD+fntyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6402.namprd11.prod.outlook.com (2603:10b6:510:1fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 23:42:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 23:42:38 +0000
Date: Mon, 29 Jul 2024 16:42:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Pallavi Mishra <pallavi.mishra@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v2] tests/intel/xe_exec_store: Modify test for Priority
 Mem Read feature
Message-ID: <20240729234235.GD2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240729222434.1643521-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240729222434.1643521-1-pallavi.mishra@intel.com>
X-ClientProxiedBy: BY5PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::40) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e5eff8-7fff-4959-7f62-08dcb02820fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ylMi//GqWT6R6J4qoA/tIusC18KyQyl9UOy45Kdp8SNorS5uxqkq0asC+rhG?=
 =?us-ascii?Q?OhdQva32E9x3d6ahc4sCqv9zFETFI3LMzrHGKzAzBWNXJSWvteYqkl3Vb4EF?=
 =?us-ascii?Q?Lr97b32RsN/8bRET/RmXLzyTpQ681M3MuAmSGJXTr97ECe0Zf5nymznZBOvJ?=
 =?us-ascii?Q?WsrI81INGQ7LrHRwqXTs/5TZSsiFKsTW5P2lcmQHdne8a+e5dbD+icNMGG6w?=
 =?us-ascii?Q?ZF6097gLW6KQjBjbn3DzvprCqQrX6pfHh4hYtrGapI6LTcadB7jnenoATVo9?=
 =?us-ascii?Q?Frpgo/mq1iOr5kbcPm1PZlB06M57iS4BZrBEr2phvgQZlnl4JRahNYg0MwnP?=
 =?us-ascii?Q?6KaFfUWGTtDgCsDFfQJsASkqJ8bFI+fHDqHq/Cw3+ubxriT1DpjkDK4B0ZXd?=
 =?us-ascii?Q?qml5bnyAHHUDKiPqpd+Zb/tB+QV8JzOuf+aO2Nk/2QYHgsqmrmYTC7HdN5Wj?=
 =?us-ascii?Q?cKft78qqte1aIJk72hdlD+LjEO3bb0SRObvYe+U48NirbJo0zYCkh3K1TKAW?=
 =?us-ascii?Q?Nn6NJdvX0K0bzWMC3tYU3Uev5mwAy71JrI4kAvIQyZU/HoQ2TCZ3ojrnkK79?=
 =?us-ascii?Q?F6zThEEZFut6Yp5dXjW4KaIfKL+Jo1gUx2D/bLYJAzsHHsuEdeG9h1nFtlKF?=
 =?us-ascii?Q?VhBt4EJ4k4vUulhe35s8ROgsYbxFE160lNJoR4a+6ymyJUN+V+tuIrFm9cYD?=
 =?us-ascii?Q?kP8PhrdxTwn20fXs8PBl0V2zu2DSnIAR179Tm+AnoifG70qNenaPtWNz7Mqm?=
 =?us-ascii?Q?ef2jB4K6Uuc0aLuL25RiylUi1ObArMI/eEOg0AGB9MzAmtnGj/xlkpMfjylX?=
 =?us-ascii?Q?ty2DX3neYOmDvSDpO9LVe9F2l7eAZXUzMDQzCU2rN2nwhNkjFlGov3y1DHs8?=
 =?us-ascii?Q?fMR09T7j4vGhxioSHQCccMDhOVrcGstv6mv9rGPRuxi7HBcHIpsqHRmt2JfF?=
 =?us-ascii?Q?dlFd6s0eTsOepKzVZE7DwHnBYWu6u5i/2S2JWQAbC56PKCMCXyyyCaes/gWO?=
 =?us-ascii?Q?XOyHnz8475w8LNEvkm0dIVBONyk53YyX8vt92kcMxVEAdsPlQbxLJtu9oMe2?=
 =?us-ascii?Q?Qw4rscswAnJ9us02D52vfIB+0cCF1l2vtjxl9IQg++o6xcPRq6R49kIb4qF6?=
 =?us-ascii?Q?lsxJ4U2dGQYePM0mmiUWb/vRqyYPNqUsCDiINmByYIB49c986Xndmi5zenh2?=
 =?us-ascii?Q?w1Cqsul2RPeUyH5Q9P8ZLTquHCLhVrjdmg2IeASCdZC1jNCNnNBqBBnOiS06?=
 =?us-ascii?Q?yzsBIuMReuRj8OWIdG9kMwPARmTBi+IbXXq6aYldg4mYz7ELtvTTdQFOAu5D?=
 =?us-ascii?Q?SJE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lkBUHPVysV8vfSaaOfqMMbfS5GzxJcxg2rgcxxmzV332XDDZzrP6sMRu6L2u?=
 =?us-ascii?Q?idrEoThKI62YOhtO61RKHogqh76KhQGfiGhainEcNOgxH4R/6usKCAOzSHwL?=
 =?us-ascii?Q?rrkL0nelP50JZ5xySa79Fi4t3+/MOlO6YpBrJbSMbVE7mzhzk6lQNGbB0Ali?=
 =?us-ascii?Q?uYlVAI16kcMjw8O7tlN3SQK6fDhhYt+u+poSXwc+26IXdEFLyJVIyhDwUG1Z?=
 =?us-ascii?Q?CXyDhmK6cWHLw2qWAL+brQVLgR9DxyV85acoOgh9G3CjUiUeh4gxaw5oCjPg?=
 =?us-ascii?Q?ENeK4JcxEdDwAfrg5HFMaijYrNCfQlkYPZ/6FeBrvb/yjt6oKASAIr+qss39?=
 =?us-ascii?Q?oSneglmUcji/tZCCDE+8fKt05L9I1fVyr8mBc791ewcGPj2swT49rBG/w+Nd?=
 =?us-ascii?Q?99+N9eHFErTR74px/iKAlFekxIoJ52eNSziB3rowl9Vg9tOOqL3U38n9XxAz?=
 =?us-ascii?Q?456/Z6GQ/n9+hF0U7k4uRDaHiRqXupUNV19zQoKvo1y32YPTjzk2iHWeF+73?=
 =?us-ascii?Q?nYJ5623ln+VhnhETU46OsvkvMWR8rZea4/sVTRV7MYl1kQBsy+k3VFqXT9Du?=
 =?us-ascii?Q?fIuU111CtC4i8lFhRXLTaGm5PPuU6uKZS+2lgWWbn2LO7TusWycdTiDZ09Xy?=
 =?us-ascii?Q?QFbkmHUh1h5FFlhvbrK4seFunDtg0auR3wQVGhHfExYI2aTnGCaxTDTjJLfL?=
 =?us-ascii?Q?2fGx5+Bczn1Pnbar5Skx6I6VcbuOxAGOVh8iZ3AxFCP7uHkvXdhde9NBzhCZ?=
 =?us-ascii?Q?7qjpCs/HzbwAh3ItdASU98j673y+FlXUIX6tMefGvc+7x2aTrxfjOpNcyzd2?=
 =?us-ascii?Q?MvccTP6eDyoefLGH8mXQHLs+9QnyNkNZ/sV6+q5XLXXxnZEPfkA2/N4ueVnU?=
 =?us-ascii?Q?koKoYFXJcQIHM8mIhuLRvHfLbFlF7MlbPGr2oHgKUcKRX8sxKmA3+SiI0cH7?=
 =?us-ascii?Q?FCBb4OqN3eMIjjYsAsU3dxsuiAmvANkO6ypPr2SQLLwpmCKCCUTY+RVjo8ks?=
 =?us-ascii?Q?1oHTu4E2r/hqj1kMsXco9yJCznOLoD3iiGmzYbua6w7TB9yldl/rTq7bihq0?=
 =?us-ascii?Q?hWyt33/BeSOfn7IZ+qqC5DXK6I+4I66PntFJeOkZCJQ/gwVB9+Ne/B0GBKuU?=
 =?us-ascii?Q?/slDGa/Sj9oEj6Q4UgERXeldbh7x7v/1YS9kHvC61v9Oc7+vcspRCKS0Tj94?=
 =?us-ascii?Q?IP7T60dWeKoiZGTW4hOIo+wgPl+RzK6Y2TvtO35x+ETjIm6cifE+d1snehGI?=
 =?us-ascii?Q?CR8AJc5QWwwZMOi2MKyQKzOvew4FEt8B3h5xbB8oki5wJgZWbzyR4tzMUgIY?=
 =?us-ascii?Q?hdjfFDaDqTAH0XpTCLvwWqmg6fWU7/cvdHC/nz6oczy4X9hA+oKMs/FLYQkg?=
 =?us-ascii?Q?LBBFbzd0vu4XnDqO8sO7msm1HoIoBKkGlSf948XqfbXuLktbvSoWrPL3uJlF?=
 =?us-ascii?Q?56hQ3yVX6k4sIiJH92Zw970F9nzV8SdLwgF+zdBh3bcCy8WaCf+WH/mb/ULo?=
 =?us-ascii?Q?7blIuc6fcdo+tQ3V9FOW0qYFWM8kn2/3Aa9f6tYABvdt82jkEWJz3csc/ETI?=
 =?us-ascii?Q?5uflfSnr5g9Wxif5cs+NNM3fwfvjEqKY4kWEN0Pg9I2/nZINf0dVNlGh6PTA?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e5eff8-7fff-4959-7f62-08dcb02820fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 23:42:37.9389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaPoIJDFGhYz5arThirqC9nP4DSHdDaGmri0EH+pAq0uC/w3Arf2kCt2Z16V345+ZRQEt/uVFjJ1bwXACFw6mgtzQEkFdCzYW7fAADimiAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6402
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

On Tue, Jul 30, 2024 at 03:54:34AM +0530, Pallavi Mishra wrote:
> Now that KMD supports Priority Mem Read feature, care needs to
> be taken to avoid RAW hazards which may get introduced due to
> unordered read and writes. Inorder to prevent this insert
> MI_MEM_FENCE which will ensure data coherency in such
> scenarios.
> 
> KMD patch to enable Priority Mem Read:
> https://patchwork.freedesktop.org/series/134038/
> 
> v2: Add graphics version check (Matt Roper)
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>  include/intel_gpu_commands.h |  2 ++
>  tests/intel/xe_exec_store.c  | 20 ++++++++++++++------
>  2 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
> index fe734c4bb..cd281ba89 100644
> --- a/include/intel_gpu_commands.h
> +++ b/include/intel_gpu_commands.h

I think the original intent was that this file would be directly copied
from the KMD header (similar to how we copy PCI ID headers and such),
but it looks like people have been adding new changes directly to the
IGT copy and causing it to diverge from the kernel.  So we can go ahead
and make the changes here for now, but someone will need to go back at
some point soon and do some extra work to get the kernel and IGT back in
sync again.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> @@ -89,6 +89,7 @@
>  #define   MI_DISPLAY_FLIP_SKL_PLANE_3_A	(7 << 8)
>  #define   MI_DISPLAY_FLIP_SKL_PLANE_3_B	(8 << 8)
>  #define   MI_DISPLAY_FLIP_SKL_PLANE_3_C	(9 << 8)
> +#define   MI_MEM_FENCE		MI_INSTR(0x09, 0)
>  #define MI_SEMAPHORE_MBOX	MI_INSTR(0x16, 1) /* gen6, gen7 */
>  #define   MI_SEMAPHORE_GLOBAL_GTT    (1<<22)
>  #define   MI_SEMAPHORE_UPDATE	    (1<<21)
> @@ -192,6 +193,7 @@
>  #define MI_OPCODE(x)		(((x) >> 23) & 0x3f)
>  #define IS_MI_LRI_CMD(x)	(MI_OPCODE(x) == MI_OPCODE(MI_INSTR(0x22, 0)))
>  #define MI_LRI_LEN(x)		(((x) & 0xff) + 1)
> +#define MI_WRITE_FENCE			(3 << 0)
>  
>  /*
>   * 3D instructions used by the kernel
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index c872c22d5..8e6ffee4a 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -51,7 +51,8 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
>  	data->addr = batch_addr;
>  }
>  
> -static void cond_batch(struct data *data, uint64_t addr, int value)
> +static void cond_batch(struct data *data, uint64_t addr, int value,
> +		       uint16_t dev_id)
>  {
>  	int b;
>  	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
> @@ -63,6 +64,10 @@ static void cond_batch(struct data *data, uint64_t addr, int value)
>  	data->batch[b++] = MI_ATOMIC | MI_ATOMIC_INC;
>  	data->batch[b++] = sdi_addr;
>  	data->batch[b++] = sdi_addr >> 32;
> +
> +	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0))
> +		data->batch[b++] = MI_MEM_FENCE | MI_WRITE_FENCE;
> +
>  	data->batch[b++] = MI_CONDITIONAL_BATCH_BUFFER_END | MI_DO_COMPARE | 5 << 12 | 2;
>  	data->batch[b++] = value;
>  	data->batch[b++] = sdi_addr;
> @@ -101,7 +106,8 @@ static void persistance_batch(struct data *data, uint64_t addr)
>   * SUBTEST: basic-all
>   * Description: Test to verify store dword on all available engines.
>   */
> -static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci)
> +static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci,
> +		       uint16_t dev_id)
>  {
>  	struct drm_xe_sync sync[2] = {
>  		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> @@ -144,7 +150,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>  	else if (inst_type == COND_BATCH) {
>  		/* A random value where it stops at the below value. */
>  		value = 20 + random() % 10;
> -		cond_batch(data, addr, value);
> +		cond_batch(data, addr, value, dev_id);
>  	}
>  	else
>  		igt_assert_f(inst_type < 2, "Entered wrong inst_type.\n");
> @@ -333,21 +339,23 @@ igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
>  	int fd;
> +	uint16_t dev_id;
>  	struct drm_xe_engine *engine;
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
>  		xe_device_get(fd);
> +		dev_id = intel_get_drm_devid(fd);
>  	}
>  
>  	igt_subtest("basic-store") {
>  		engine = xe_engine(fd, 1);
> -		basic_inst(fd, STORE, &engine->instance);
> +		basic_inst(fd, STORE, &engine->instance, dev_id);
>  	}
>  
>  	igt_subtest("basic-cond-batch") {
>  		engine = xe_engine(fd, 1);
> -		basic_inst(fd, COND_BATCH, &engine->instance);
> +		basic_inst(fd, COND_BATCH, &engine->instance, dev_id);
>  	}
>  
>  	igt_subtest_with_dynamic("basic-all") {
> @@ -356,7 +364,7 @@ igt_main
>  				      xe_engine_class_string(hwe->engine_class),
>  				      hwe->engine_instance,
>  				      hwe->gt_id);
> -			basic_inst(fd, STORE, hwe);
> +			basic_inst(fd, STORE, hwe, dev_id);
>  		}
>  	}
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
