Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA96CEF17C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 14:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBC010E132;
	Tue,  8 Oct 2024 14:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPqMAAx4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E50210E132
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728396615; x=1759932615;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=SFZcazMpI19COJ5twUeT185LbxtCR55bKTtNBvsi2Bk=;
 b=HPqMAAx4PBFGpScbKxHeEE+NAMlAo7BtdsalxEki8t55e4lV1md+UsKO
 I1ewSEEzYjrUe2SqNQIu8f4zSvwB6PQ9oDQu4G+jSJUPlAhKkY1VeqDS2
 jySY8t6FW56+U+ho0LYYPg4V0o0lsuFUKDeg+82yt2+1Ds/qRRQIWPTJf
 pDreV2E38dsvlatZo1Z9gVCcTs4ZC/VCINzXRKKAOynDB1sZ779HXWFBM
 /tSna/gz+PsJkLEFjBMBq73ktOD34YgSX1rb2/B7n1BSjaqQ6HcnwaSX/
 bkGXPry/Rf4BF4Qnn+o2E+d7pzkcZ/Yn4Mv2WOGwzpUX4fvR1/gwtbq0I A==;
X-CSE-ConnectionGUID: qAiLubcVT+eb5IRc/inPgQ==
X-CSE-MsgGUID: 6FIQLLS7SnGqYpLYT82O/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31297864"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="31297864"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 07:10:14 -0700
X-CSE-ConnectionGUID: X7ZnYxXLSv2rHGakAcYlIg==
X-CSE-MsgGUID: OvEFlBECQU++YgVJMkAdmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80860395"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 07:10:14 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:10:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:10:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:10:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 07:10:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 07:10:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wd1VFCTfyc6+ATbKHtJ+L+Lrr914cFKoVVXe0Wcfni+kG+ojIpCRZYwhzkpczkfdbIjxlbGQjq0w/GoP6WHk89tAHU+mnSB0T6WrbKpywYaWVnKnGkD4sEj9fCpoyV3kx71lFu+9Unqqmuw+heonlNmVKtuBlWQ44APCPr93/s2bGPctnHs8SSLQS8GaYJi4EE4mTePpHKZHXdfVUa9oIaax7BuhSFR56wao5naAaol7WHv42aR2aWX3JcxfaSxtRvV2c+oSX8JiLWggrnuddBOMYrdGC7v7PDXV2mEBNi9oFiRnF1qvGq5GgH56R2qwYfrfA/XnV9dwbO0QZAMkYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dVD9r7MHyiJodyzieX1oaKc5rMirb4Ic01klLyoUdI=;
 b=Pm3tWEiJLTpBiRLx8ygomCVLHQ8SFcUp4cpjyAMIeSAPxnkMlOeOAx4rWxDKhX9LLA8EBFWid1iK5J7xI67IRKOom5nX+WEhcT1MZqWCyJs4Uqewe/tGO4UB0J3aBfR4uCgWAzYXU3L5zcb8y5MlrXZJ3MdcliY3cgqWnhb4Na/CpGyGIDoAs6hVeN4kbN7ueeYLh7jotamuC5iRPOeVquZ86d537sQQDrlHrBAuGa5+RkdUuyoRpwYNOWzArBw/0NgBrlfIxWkgPfYIYBluktxOwLEd8CM48Ff2R6eJxGi1e8PvJmumCmTp2l2SIJg/E39wVc0GO5u4WqjIndpzNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 14:09:59 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 14:09:59 +0000
Date: Tue, 8 Oct 2024 07:09:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_wedged: Avoid racy cleanup (rev2)
Message-ID: <20241008140956.GF4891@mdroper-desk1.amr.corp.intel.com>
References: <20241007174747.2031623-1-matthew.d.roper@intel.com>
 <172837960234.1202812.14257834957626510247@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172837960234.1202812.14257834957626510247@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: ff566195-26bd-4d03-e560-08dce7a2e4d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oNBpMzIoKR7s39zY9DYTjqWebDksRrZFgum0nOymOd4Bq0kDd0se03+mwoEQ?=
 =?us-ascii?Q?4y05/GXZsUMZ5gO7oSiF3U7UOPH2hNhhvGMZlVvagxWxP1S3jWLYmgZGcaaE?=
 =?us-ascii?Q?mence/g73s5WDrrzX3Tf/XVlNl0hsgL9J2Apy3oixZTUIa+HPxy1S8jsissq?=
 =?us-ascii?Q?JA0dAbkI3l+OFRNhzobk71D1DxSpl3oV18h9KSps88bmHaNAg2wxldpVODxX?=
 =?us-ascii?Q?siIzwIvTBEEhbkUJQ0qeaPpSKrM6Vr6itg8aA+1FwVAh0bzyWTjA16fKfN44?=
 =?us-ascii?Q?OBcUDCNhyCzRFyGd5K+Ky8vjnFrol7rCvqaAf0YZveZq1VhlF3PpBbRGx8h2?=
 =?us-ascii?Q?QEYFp7b9vPVf6L08qce8qK5kdos2sCZlb7UydOo0bUEspIlvHLOKQV8TMM7T?=
 =?us-ascii?Q?M00umuElGZB+sKojsxA/16x5Uh42UbS9UotaU0n8eWHGez2chpQ2Epakv/0R?=
 =?us-ascii?Q?Cr7+H9hhuZUD5HcwsY1K8GWF4m62sojgOtKXWAzk0ZUIltb5YtLMdRzhmDY3?=
 =?us-ascii?Q?7f0w/7AJRPzL6VUx10GBNSsrqjvrKCsI0tUPhRvbrKrzYSMcv668yNFx16Th?=
 =?us-ascii?Q?30LumkGVQpe8NwA2iWBUaKdJOwD9NrH9bzMiCNAyHYuKg3DVvQDknw1Opf4Z?=
 =?us-ascii?Q?RhP9TlqIWkx1mhYmXyGRGpKnG3KsuhzY1oeOwXNaZZsINZpvpXh60pxtY0Uw?=
 =?us-ascii?Q?nm5QCCoNdUWKQtqHsehPHjyz/4F1otWTcWTvuwNJQ6Pmjhk+/iERciOFW0ww?=
 =?us-ascii?Q?y44OYha1xGWRbEXo9V+wEgfKmdPdrDccrcg7fVEH5x7nCnV0w4Em1N88/7/+?=
 =?us-ascii?Q?B9G2wliPe42xcJv00faKSx7qYugdN6KVS+1SLiAUfL+yt5J/Eyn+wRMACGhn?=
 =?us-ascii?Q?MC0WYCNyFQSJRyo/+/IMzpRiAhc60W1eSlaD4ez14hwdV4cYE30hQ7JUtL78?=
 =?us-ascii?Q?MmfRp9ZoKG5WGMEdbVip6kRcaeYvBnDiVO+xLRaD5qKR2H/ukc5k8EwSxYUd?=
 =?us-ascii?Q?4HrZ6wpSqBscdGAK3dDYfM4h4/TvF3kEOzOOHkx7E+G/mXRc775RSqROCnrQ?=
 =?us-ascii?Q?yOmOGG4oztB53wtUe/YIDcvwNuzPcAPRzXLDxSNEOvSQ2dVp1GGEJkklyCR6?=
 =?us-ascii?Q?Y+MeaBne/I/tfqilATkJY99AfqFLX68BDz7u52uSW9MkIpjBA1FPKKK6RfRy?=
 =?us-ascii?Q?iJYhIwLYOgUTLB5+NguwImiUCwRdw35u5HLtszUy3UETWTvdhIDhqAcYRc4?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YyFs4WjZw+xuYkHjkGPnbGQDpIobz75rcH0D6tCgcni/FstKlyKD620NmgHO?=
 =?us-ascii?Q?+l0da5lHG9JdAMkiY1eKIB2FmT4C1PgRZzJWvvmyO7ohEqqk+97kUjiHiEqN?=
 =?us-ascii?Q?Hi084yTRJTPBNdxIgqKiLObKJgMCtUEiS2mrne9hZ+7pYIKXTLPPhi9T/37x?=
 =?us-ascii?Q?obO5vCCVWV1Hh+sf+/dkbfJuwx+xNi66lA2h6xGWKYd6SZJRrg0Rf+5mFNwo?=
 =?us-ascii?Q?XaTOsuQh2j/NAmgD07JUdLWyAoQCaBlZXEEH871II4JuPmxRyGDj9rsMNNWq?=
 =?us-ascii?Q?Ly7vlQ9AIsSdXZ44GV0lWdl3zdmej64FhqoCZ8zTKdOmY5YDb5zEc4fYP/Cz?=
 =?us-ascii?Q?aKThfp2qBNI4tmFysxTxi6hPmbE1HcvKPvq2UipJBM9DJiPd4OcIKLfITvPO?=
 =?us-ascii?Q?0iNjfD4eOVy5c5NdvNTKrgmL44pK0A77+P2gVrVfIRo7gFRh8cnukNQ1Fo8e?=
 =?us-ascii?Q?LFn/WJWOKFKwxJafzan5edRAkuuYgYK2TzHQrJw2RyJwZzFHlRjJlFGu/sPT?=
 =?us-ascii?Q?Z8IUcoWalok8fVdKkrr7BEZot27LJBDeZ2zbes3cGFuL8VHW7SQVM2CxoXVv?=
 =?us-ascii?Q?8wJu6oE5Yg2lDueDQ4mDIeRFF1CbcdO8MAW38yYLBrXPbKuGh3rKCJJvOHZJ?=
 =?us-ascii?Q?9JWuDws0Mfva7MTM22M162zumwoGtHUowD1Tw74ELemQIOCSaLbQ3NvFwPcG?=
 =?us-ascii?Q?M4m4xLcpzr5hkeh/riUzLmCyL+cdXzre5203uEhbgeR6Nhh7Kn+p6tO3C6Lo?=
 =?us-ascii?Q?5gAcXHnNsBENQtyb+GcQ9YCuG6EE2zFeSH2U2Oh5cukHfyvL5u6+t81Gt5eU?=
 =?us-ascii?Q?Uz/FmCcrozdgIv73UGy8P2gbv7XDc3+kQhoqOAGuwJVZsPYld3sJQmWYlRiP?=
 =?us-ascii?Q?sKq4+odjjVsx70QAPU+2JIcxKJwq0MyGqf6kacSuFF5j3i1lLI9sMaeaznXb?=
 =?us-ascii?Q?XeThWiA5y0edL/JX16ZPo/7qDLCyILMZcRHhOQGZh+fFP4PwOvoi4Z2m4MnN?=
 =?us-ascii?Q?ZoCU/+iEd+2LFpt/uoRc7yvfnwkJGPkTwqf9L9LVYtjAFvgVhxXbrAeyGMai?=
 =?us-ascii?Q?dhBgbnEMfScua57POgWP/O0LUJdhtBLCj37qM0y1RfcHsO3eRohRK+foEhtJ?=
 =?us-ascii?Q?+FIjrXMCo/mcyl+4Prun9L1Eep47K85TbBYW+qeaHnlJN/49ciE9X8MjgZFO?=
 =?us-ascii?Q?jxc9dORgxY83YDMyhPWlpZgL0/F+OidRCS6yBS4nfuEkVzNM95atWP4qThqD?=
 =?us-ascii?Q?mqXGhSO5UTVcS/lxw6P9vbhh8yhoARe/V271TNn3otAhBM+x/VPVbNkcliLO?=
 =?us-ascii?Q?2I843ksW2RrDZL6n60Cfj4mxmz/69TZJKHsLpTiytoCL7f8f+u82DrEhhbwm?=
 =?us-ascii?Q?4uPwHyURPgqWk2LokUaPxbmUYrxnanuzRbgaEmYw2DYFoJJfl7e7lGomLjIo?=
 =?us-ascii?Q?mS4ccIlA/ADWXkcQJqSeZghLImMjZ1pUEM+VYYvO52CgabCFq3n7Gk8KQyIv?=
 =?us-ascii?Q?+tgv+PnNdV3KX+LmpjHaFjOh/MJPhMRj08jlbMTByg1OpFcDiLue7eZDx7yC?=
 =?us-ascii?Q?xb5an1xyv1y+W9oDE7l+w3G0SZDsbiSnUHIKp+sHrNWN7S0kDSl11zqA+Syh?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff566195-26bd-4d03-e560-08dce7a2e4d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 14:09:59.1499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwuzSTkmc5kM9g9DnqIpTHpCU2GuLiSGykUruPESsLzFybhrDUCyNh7lLrcDmX8/IoR/5rfz7kDYKnTsltiGS4FDsoN5hqVY8t9PV25rImQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7192
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

On Tue, Oct 08, 2024 at 09:26:42AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_wedged: Avoid racy cleanup (rev2)
> URL   : https://patchwork.freedesktop.org/series/139537/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8054_full -> XEIGTPW_11882_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11882_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11882_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11882_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_setmaster@master-drop-set-user:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-463/igt@core_setmaster@master-drop-set-user.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@core_setmaster@master-drop-set-user.html
>     - shard-lnl:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-7/igt@core_setmaster@master-drop-set-user.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-4/igt@core_setmaster@master-drop-set-user.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] +7 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [PASS][6] -> [SKIP][7] +7 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-lnl:          NOTRUN -> [FAIL][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system:
>     - shard-lnl:          [PASS][9] -> [DMESG-WARN][10] +1 other test dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-3/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-4/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html

None of the failures above are related to the test being updated.

> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-dg2-set2:     [PASS][11] -> [DMESG-WARN][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html

This is separate issue
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2310

The failure here is kernel warning during device removal:

        XE_WARN_ON(!list_empty(&irq->pending))

Nothing userspace (IGT) does should be able to trigger a bug like this,
so the problem lies in the kernel.  It's possible that the change of
sequence of operations in this test (skipping userspace cleanup) might
make this issue _easier_ to hit, but it's still a pre-existing kernel
issue that will need to be investigated separately.


Patch applied to master.  Thanks Jonathan for the review.


Matt

> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][13] ([Intel XE#1124]) -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][15] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][16] +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-dg2-set2:     [SKIP][17] ([Intel XE#455]) -> [SKIP][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][19] ([Intel XE#651]) -> [SKIP][20] +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
>     - shard-dg2-set2:     [SKIP][21] ([Intel XE#653]) -> [SKIP][22] +3 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-dg2-set2:     [SKIP][23] ([Intel XE#2927]) -> [SKIP][24]
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][25] ([Intel XE#1489]) -> [SKIP][26] +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@psr2-primary-page-flip:
>     - shard-dg2-set2:     [SKIP][27] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][28]
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-435/igt@kms_psr@psr2-primary-page-flip.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_psr@psr2-primary-page-flip.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-lnl:          [SKIP][29] ([Intel XE#2833]) -> [SKIP][30]
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-5/igt@xe_live_ktest@xe_eudebug.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11882_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1466])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1407])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#316]) +3 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1124]) +8 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1124]) +15 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#2351]) +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#2191])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1512]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#367]) +6 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#787]) +90 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#616]) +7 other tests fail
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#2887]) +9 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1152]) +3 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#306]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-1/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#306]) +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-463/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#373]) +9 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-fast:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#373]) +5 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#307])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#599]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-1/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][52] ([Intel XE#1188]) +1 other test fail
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-463/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2321]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#308]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1424]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#309]) +2 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>     - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#1475])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#1541])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([i915#3804])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#776]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#703])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1138])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#301])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#1204])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1421]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          NOTRUN -> [FAIL][68] ([Intel XE#886]) +4 other tests fail
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
>     - shard-lnl:          [PASS][69] -> [FAIL][70] ([Intel XE#2957])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
>     - shard-dg2-set2:     [PASS][71] -> [FAIL][72] ([Intel XE#301])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
>     - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#886]) +7 other tests fail
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1397]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([i915#5274])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#651]) +6 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
>     - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#2351]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#658])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#656]) +24 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#651]) +33 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#653]) +36 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1158])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_getfb@getfb-handle-protection:
>     - shard-dg2-set2:     [PASS][86] -> [SKIP][87] ([Intel XE#2423] / [i915#2575]) +13 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-463/igt@kms_getfb@getfb-handle-protection.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_getfb@getfb-handle-protection.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1470] / [Intel XE#2853])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#356])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
>     - shard-lnl:          [PASS][90] -> [DMESG-WARN][91] ([Intel XE#324]) +2 other tests dmesg-warn
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [PASS][92] -> [FAIL][93] ([Intel XE#616]) +1 other test fail
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-433/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-463/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][94] ([Intel XE#361]) +1 other test fail
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2763]) +11 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2763]) +5 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1131])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#908])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2-set2:     [PASS][100] -> [SKIP][101] ([Intel XE#2446])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1489]) +10 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2893]) +2 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1128])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2850] / [Intel XE#929]) +17 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_psr@pr-cursor-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1406]) +1 other test skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-6/igt@kms_psr@pr-cursor-plane-move.html
> 
>   * igt@kms_psr@psr2-cursor-blt@edp-1:
>     - shard-lnl:          [PASS][107] -> [FAIL][108] ([Intel XE#2948]) +3 other tests fail
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-8/igt@kms_psr@psr2-cursor-blt@edp-1.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_psr@psr2-cursor-blt@edp-1.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-lnl:          [PASS][109] -> [FAIL][110] ([Intel XE#1649]) +1 other test fail
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-8/igt@kms_psr@psr2-primary-render.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-8/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#327]) +1 other test skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1127]) +1 other test skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1127])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1437]) +1 other test skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>     - shard-lnl:          [PASS][115] -> [FAIL][116] ([Intel XE#899])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
> 
>   * igt@kms_vblank@accuracy-idle@pipe-c-edp-1:
>     - shard-lnl:          [PASS][117] -> [FAIL][118] ([Intel XE#1523])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-3/igt@kms_vblank@accuracy-idle@pipe-c-edp-1.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-1/igt@kms_vblank@accuracy-idle@pipe-c-edp-1.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][119] -> [FAIL][120] ([Intel XE#2159]) +1 other test fail
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-lnl:          [PASS][121] -> [FAIL][122] ([Intel XE#2443]) +3 other tests fail
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-7/igt@kms_vrr@flip-basic.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-8/igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#455]) +25 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-434/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#756])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1091] / [Intel XE#2849])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1123])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_eudebug@read-metadata:
>     - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2905]) +4 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@xe_eudebug@read-metadata.html
> 
>   * igt@xe_eudebug_online@basic-breakpoint:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2905]) +8 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-436/igt@xe_eudebug_online@basic-breakpoint.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][129] ([Intel XE#1473])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][130] -> [TIMEOUT][131] ([Intel XE#1473])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][132] ([Intel XE#1600])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>     - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#688]) +5 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1392])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#288]) +25 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_reset@cm-close-execqueues-close-fd:
>     - shard-lnl:          [PASS][136] -> [DMESG-WARN][137] ([Intel XE#2687])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-8/igt@xe_exec_reset@cm-close-execqueues-close-fd.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-1/igt@xe_exec_reset@cm-close-execqueues-close-fd.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#2229])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_oa@invalid-oa-metric-set-id:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#2541]) +5 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-463/igt@xe_oa@invalid-oa-metric-set-id.html
> 
>   * igt@xe_oa@unprivileged-single-ctx-counters:
>     - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#2248])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-4/igt@xe_oa@unprivileged-single-ctx-counters.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#977])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-464/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#2838] / [Intel XE#979])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#979])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][144] ([Intel XE#1173]) +1 other test fail
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-436/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-lnl:          [PASS][145] -> [ABORT][146] ([Intel XE#1358] / [Intel XE#1607]) +1 other test abort
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#579])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#1130]) +8 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#944]) +3 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#944])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-1/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_vm@large-split-binds-1073741824:
>     - shard-dg2-set2:     [PASS][151] -> [SKIP][152] ([Intel XE#1130]) +25 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-463/igt@xe_vm@large-split-binds-1073741824.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@xe_vm@large-split-binds-1073741824.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
>     - shard-lnl:          [FAIL][153] ([Intel XE#1701]) -> [PASS][154] +1 other test pass
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-lnl:          [FAIL][155] ([Intel XE#1475]) -> [PASS][156] +1 other test pass
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][157] ([Intel XE#301]) -> [PASS][158] +1 other test pass
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][159] ([Intel XE#1204]) -> [PASS][160]
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
>     - {shard-bmg}:        [FAIL][161] ([Intel XE#301]) -> [PASS][162] +2 other tests pass
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][163] ([Intel XE#301]) -> [PASS][164] +5 other tests pass
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-lnl:          [INCOMPLETE][165] ([Intel XE#2049]) -> [PASS][166] +1 other test pass
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate@b-edp1:
>     - shard-lnl:          [FAIL][167] ([Intel XE#886]) -> [PASS][168] +1 other test pass
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-lnl:          [DMESG-WARN][169] -> [PASS][170] +1 other test pass
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-3:
>     - shard-lnl:          [DMESG-WARN][171] ([Intel XE#324]) -> [PASS][172] +5 other tests pass
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
> 
>   * igt@kms_plane@plane-position-hole:
>     - shard-lnl:          [DMESG-FAIL][173] ([Intel XE#324]) -> [PASS][174] +1 other test pass
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-3/igt@kms_plane@plane-position-hole.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_plane@plane-position-hole.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-lnl:          [FAIL][175] ([Intel XE#718]) -> [PASS][176]
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_rpm@legacy-planes:
>     - shard-lnl:          [INCOMPLETE][177] ([Intel XE#1620] / [Intel XE#2864]) -> [PASS][178]
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html
> 
>   * igt@kms_pm_rpm@legacy-planes@plane-41:
>     - shard-lnl:          [DMESG-FAIL][179] ([Intel XE#1620]) -> [PASS][180]
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-41.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_pm_rpm@legacy-planes@plane-41.html
> 
>   * igt@kms_psr@psr2-cursor-plane-move:
>     - shard-lnl:          [FAIL][181] ([Intel XE#2948]) -> [PASS][182] +3 other tests pass
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-move.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-1/igt@kms_psr@psr2-cursor-plane-move.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][183] ([Intel XE#899]) -> [PASS][184]
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][185] ([Intel XE#2443]) -> [PASS][186] +3 other tests pass
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-6/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
>     - shard-lnl:          [ABORT][187] -> [PASS][188]
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-3/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
> 
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     [FAIL][189] ([Intel XE#2136]) -> [PASS][190]
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-464/igt@xe_module_load@reload.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-435/igt@xe_module_load@reload.html
>     - {shard-bmg}:        [FAIL][191] ([Intel XE#2136]) -> [PASS][192]
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-bmg-4/igt@xe_module_load@reload.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-bmg-5/igt@xe_module_load@reload.html
> 
>   * igt@xe_pm@s2idle-d3hot-basic-exec:
>     - shard-lnl:          [INCOMPLETE][193] ([Intel XE#1358] / [Intel XE#1616]) -> [PASS][194]
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-6/igt@xe_pm@s2idle-d3hot-basic-exec.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-4/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-lnl:          [ABORT][195] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][196]
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-3/igt@xe_pm@s4-basic-exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#873]) -> [SKIP][198] ([Intel XE#2423] / [i915#2575])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#1124]) -> [SKIP][200] ([Intel XE#2351])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][202] ([Intel XE#2351])
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_edid@hdmi-mode-timings:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#373]) -> [SKIP][204] ([Intel XE#2423] / [i915#2575])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-463/igt@kms_chamelium_edid@hdmi-mode-timings.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_chamelium_edid@hdmi-mode-timings.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#455]) -> [SKIP][206] ([Intel XE#2423] / [i915#2575])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-32x10.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#651]) -> [SKIP][208] ([Intel XE#2351])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#653]) -> [SKIP][210] ([Intel XE#2351])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-dg2-set2:     [FAIL][211] ([Intel XE#616]) -> [SKIP][212] ([Intel XE#2423] / [i915#2575])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-464/igt@kms_plane_cursor@primary.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@kms_plane_cursor@primary.html
> 
>   * igt@kms_vblank@accuracy-idle:
>     - shard-lnl:          [DMESG-WARN][213] -> [FAIL][214] ([Intel XE#1523])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-lnl-1/igt@kms_vblank@accuracy-idle.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#1126]) -> [SKIP][216] ([Intel XE#1130])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_eudebug@basic-vm-access-parameters:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#2905]) -> [SKIP][218] ([Intel XE#1130])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#288]) -> [SKIP][220] ([Intel XE#1130]) +2 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-466/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>     - shard-dg2-set2:     [INCOMPLETE][221] ([Intel XE#1195]) -> [TIMEOUT][222] ([Intel XE#2961]) +1 other test timeout
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-435/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
> 
>   * igt@xe_oa@mmio-triggered-reports:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#2541]) -> [SKIP][224] ([Intel XE#1130])
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-463/igt@xe_oa@mmio-triggered-reports.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@xe_oa@mmio-triggered-reports.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-dg2-set2:     [ABORT][225] ([Intel XE#1358]) -> [SKIP][226] ([Intel XE#1130])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8054/shard-dg2-433/igt@xe_pm@s2idle-basic-exec.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/shard-dg2-433/igt@xe_pm@s2idle-basic-exec.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
>   [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
>   [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
>   [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
>   [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
>   [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
>   [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2931
>   [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
>   [Intel XE#2957]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2957
>   [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8054 -> IGTPW_11882
>   * Linux: xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965 -> xe-2019-d6a4624817a46144a4dbc125c9371439edc82295
> 
>   IGTPW_11882: e2ff5b9a11ca6c9f9e857779acc380eca73a93ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2016-92d12099cc768f36cf676ee1b014442a5c5ba965: 92d12099cc768f36cf676ee1b014442a5c5ba965
>   xe-2019-d6a4624817a46144a4dbc125c9371439edc82295: d6a4624817a46144a4dbc125c9371439edc82295
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11882/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
