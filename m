Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBCFC25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 16:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CA510E2E4;
	Wed, 22 May 2024 16:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUXGZVLt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D101310E2E4
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394246; x=1747930246;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TBspoVGppT9oqZuxYnuvnzGNTG0jRTs2ZAJwiXtKOX4=;
 b=eUXGZVLtBwVmTWgrmnaTNz3oP1yD2Ls+7P0Z9UAC+G5M0xW6781tvS4n
 mKF198V5POBOe3hxWBL6nVSr6O3UMbJQOJzV4Ga1snw24rMYyBNTXpG+q
 ibrzE1jQ61oe4E2YPWEx+6oRyE2ZIYODvY86/o2rzKZeXoRB+67rU65Da
 RubtB7iqTxE7G3qo/MJiP0cIHqwiJCqDVUE/n7s1m6WeRlCS/NFSrbnJ3
 93pV7H5YHLcUXCr60pgtFOJFOb7BhAhzj5M79c4s5OJbFfv6x3+Y0pIe3
 l1/BDREx0YTIlDLpMCnVGKhQDZcM3ySHejo4hWlkYWhtg/+wNKmx0m6kI g==;
X-CSE-ConnectionGUID: 2cAZKjHFS0muxtyl+ndctA==
X-CSE-MsgGUID: OH8tbXTiSOG8NT1G7FDacA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="30189725"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="30189725"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:10:45 -0700
X-CSE-ConnectionGUID: rEEExdf8Rc6NMMf0Fhtspg==
X-CSE-MsgGUID: Oy7CjiqJT/io4V7fFXom+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="38191739"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:10:45 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:10:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:10:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:10:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yc2dOMTlVCGDK0Q9pWXFwUPYkWBkmmtluxlL4L8EWBFc9uRpHuvboe0c/rwzoVeHiSFp/TEa0xVBLWdpnhbZt3Kz0TTnHD8LZ+iSJSUhUFP0q3p0CVuE3Rz6DZYEHjV3JYJrtrv7XrX3WCYo3EZ3deH504aaj8jABQ6ZCNMQU9SHy1PdFaYO+W7ivrY8sdpK8NISom962rrWKOFNotONMkvZqVOIJI9yXHZHnvRWETVszQVm048UsYRr9UWUADTnAFcVIxOwEb5T+KueV0rIM5YGthqCKaWn0ZUyjSSqOkHgi08RUvBbK7WBqnb5uASDeEnIauJx9fo4/QHT+XYc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/UBNW65VTcCHGjJYECdC3sJJ5n95KPHSLSS/4fR4VQ=;
 b=m1nqcZ4aZ58i3jTqHxzR26ZgAVu0sKuAvmFIwYnup3A+25KI1pgBRTwtquLqs45g0FM0xtcZD/gO0XaqtpOSRyERXGYC1qCuL797AODklafaC94cDvl6ycAtR/mGJFy9bBD2HVj1SK4RqVi/A5gUpfqv0Pr25+1Szq/GIhF5nEDbv8O1G60cxcYKmt7g8mW8I0L93YMmwU8YLUkYHV7ddFBtwwJP8OrlD1+03g6S/IUfLpE685SxPyuax+yvHNVycvd0x4qtPvnUer/OAAlVOhuH80c1Gv1atKhrWI8ALN4CEyfse2qyMfCm00IahsY4oEEpZ8bDKb9+0eUvU5bFNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB7737.namprd11.prod.outlook.com (2603:10b6:8:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 16:10:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:10:09 +0000
Date: Wed, 22 May 2024 12:10:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 04/10] lib: sync i915_pciids.h with kernel commit
 5c8c22adc802
Message-ID: <Zk4Y3bwI8bufyxV6@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
 <ffbd687019c672d50ea5857780623149aadbbff1.1716373923.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ffbd687019c672d50ea5857780623149aadbbff1.1716373923.git.jani.nikula@intel.com>
X-ClientProxiedBy: BY5PR16CA0004.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 462065d8-25da-43b3-14ca-08dc7a79a724
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tDetjjBcK5Bs4xrNClVNX5mY4sO39ERsDNpHd27g9e/Z6NxtViHqJ3r/PuBN?=
 =?us-ascii?Q?OsyQkBkMF/t8oZ4fnWH/buE2jxe2+nZfECNRgUkplg+Z5jnNOutsHTRV1xQf?=
 =?us-ascii?Q?+rqKvPeoUwaFCR+fz78Z5RcXjgdCS0w96LLP885h32jzH1BtFw0nTSbiOl1y?=
 =?us-ascii?Q?IoisO5G70IQs1a+RtrNymWltQ7dRPPkvhR8bidcfPDkHCrZCWtOd6/WaBOei?=
 =?us-ascii?Q?9pP7ZUFSnRZEh6eEujDYclNDK9S3h0RfBjAphNiNDXUaoeOk0rC7evVp6LMa?=
 =?us-ascii?Q?enoP3eguZlulLuIFNid1L2XCZ9+o/oF0VwF/L06OXUW8LYXztR1cMosamE/q?=
 =?us-ascii?Q?9a7htIqWkOs5NQXzykP8nV4BjZVVQlp32VIaiyn1ThhG9X5edw5ANkP4ZfPO?=
 =?us-ascii?Q?jAMe4Rn1KDWYRYsn7mW+Jfnmmrk83tRyr7zWJ9jGrMQ5GcxRmEEPxA3Hj+UA?=
 =?us-ascii?Q?dKzRaH2qcHtX7X1KEVQ9U6HeXxtl786cfy+AAXaBDv08ewsJZha9lQyuv/Ny?=
 =?us-ascii?Q?mAQ96hAOZKwNG49LlxrriYrUlz8r7d5Mwj9om3L25xqwouIb3LQxsl0QucrT?=
 =?us-ascii?Q?Eh8n5FfGu6ygYmKIUBTDNqgykCEJGQhdwDUSl5zivfQH74LHZN0IqwfCxuOa?=
 =?us-ascii?Q?OduBIdQrB4w3/KGK2trszqupK81ateyjDv24vQ+qneqgKFOMrzLw6P+69RDl?=
 =?us-ascii?Q?wJOPRSZppkVbdc9oxJslj7d0sTTgpGwR0mAFrtJGnZNpoTG6iw9v1xXwN0L3?=
 =?us-ascii?Q?DSwIlYjEpL7bf4y00G/N9qI5yduRIVafIWsmpFrpRwLiQTaxpQtaa/lCyRSQ?=
 =?us-ascii?Q?H5FX4vTB0/mVidYJ7cXAhHEZCVdynGHuLSaIdTj3Yq+JU8rc6IpN4eQ8T5gz?=
 =?us-ascii?Q?bCgPaacjSIdfCJS4k+2i7sn4WxrXc07c1TWtQgAef2TnjKgzOkOkh3QfukJx?=
 =?us-ascii?Q?WWo9JTIephBuIIviSEQSHL8Pw6aSVLha0OboALLKH971QZ/Ckt68mb8rbhnM?=
 =?us-ascii?Q?0Ifpa69XOm9WfBDJEZzu2GgTM+5ADa1tVp0adorOarjzjlOm8UJQwRCMzpw2?=
 =?us-ascii?Q?T3E0lWOA71zbek4G3JjJOw6iq7UKUJF6iOPZHRCjM6Ez343k67B92lx1hg/7?=
 =?us-ascii?Q?18z+nRshIC8boUGDl7J++XXjKH0UBikrZBfQinqBt/OgZDsykMGulaExV4yb?=
 =?us-ascii?Q?9w8V2tP3ItmzFmFclTU/5Plc37CdVXiHac5W8JW58zBYdkudGDuagLTNH0IQ?=
 =?us-ascii?Q?fC8BF1Am7vZCGZSzrURfhySin9+ZP4BfMAa5E/8zCg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rU+46kN1nZgylyy63edH5yrSw9G+sDWNfXDTPeSkMvyUsulJ77Xlxex3fHQ6?=
 =?us-ascii?Q?yv6xPr9dutsQ/iYW9KajlvmtReRnUNi/uoWQX1Kpi9/MEA2hvMBukXX6/2+l?=
 =?us-ascii?Q?vGmbIJn/3GHrSAHpbUEJ564PSWukDsqLBO0IIKG9XUPMMx3q1aMU0nHzMMJx?=
 =?us-ascii?Q?NU3/6TMNEJDbCGIfB4gaYH0qMQl6DxWeU0hEnq1k4ggRlE9/4QXmcXhRb+f7?=
 =?us-ascii?Q?XNxX5KWqtCbmFAyR99rowySnU9QNkEOpZohWFx0Z4LlNOgTud3nvtsZo0wXB?=
 =?us-ascii?Q?/xIC7CkwhFB3aobTlLVyYTUjkyqmDlAcEqDkPWWRq5PbsrTWjen5FmsKsrjU?=
 =?us-ascii?Q?ZomZekr42mkCc9SM0qzenCkPI1z1RPUDvw8zRaXwOrnvI5ycktkNLoQiE0yC?=
 =?us-ascii?Q?E9sS2SxHlaHwZXON5OEADjp2b0KgUY4WfGg6bF2eid216bpNiVhy033jj2kY?=
 =?us-ascii?Q?6qhLvEeMNqVSL93hvZPcsACAhGm46AorEeDWC28lwdGjsU650wtoQnXeazYE?=
 =?us-ascii?Q?RMUv2FsQUPYB+mKYA1R+gTUavCzmfpytDYDnWBxR7B8pv1KMgXjuEHo3J5A5?=
 =?us-ascii?Q?lHqb7Jq5fi5mY3+cbNPvZM0sXPCb90YzNI78ipPO7TpWoM89d1SfbRsdYZfV?=
 =?us-ascii?Q?R7kT6K0gGxzr9frEYN+WSTe44Xfv8Dw+1yg6X+8/RkrToxe3NYtI/7kenSm8?=
 =?us-ascii?Q?Ks1rG6eaLU/L02n2P11nso75nRn+hchXnz8rl/Fh3Go0q577Rg/XJrOE6utK?=
 =?us-ascii?Q?aRES+/UzEV9BA7cFhfI1ge1zcT6KHHT5CpeWyCripon74XUe5NEv5OSUcV4k?=
 =?us-ascii?Q?/WxpUffeqgwkqRXkvcCFNK6SmUdhFk2cd6xfSppFOfVRaInchCJFNlnjTrJd?=
 =?us-ascii?Q?/RNQVPVE2MmBEHAt2gkfJyXaeZ/UdTGLOexzxwTe/8iX5882SO4NTY1SE8DC?=
 =?us-ascii?Q?P3CTOYMlfIOZp8LjD/Mz7l7urhOGHVIbcJHqUZEyo5rcC/BXF2RAhOqjpX4s?=
 =?us-ascii?Q?SKin90gt5GYIjzzFSh1+2/WyHCMP0hCIss+s3rLfshE4Glp9NxtgRcL4MvbM?=
 =?us-ascii?Q?al3GqOb+zritVKA7rre9QHLiAfjiJiOMxyBbGjVhvfWb9XxxZZA4UTadANxX?=
 =?us-ascii?Q?31QRtlycdIf1iGiMUp4NgsZRVv8+7xjlCN8QN/srfA6/+rftbz5LWixTV+Mb?=
 =?us-ascii?Q?ogOWnsZ0L4/1x5AIN/kVGySW5k4+hdojMD76d+ASCVk4lc6fB9zaKkXNi/Pw?=
 =?us-ascii?Q?6zylpDFgbgKXlT8U3iWgIzrALBEMK4PGc1hzDCGCizvgaFC9u63ThJByZaNh?=
 =?us-ascii?Q?vRo9UxU0bX2yKUWt7VALCz8ByZ2LcFdsdVGvEVU66E+q8yggcIo41PXxxFwp?=
 =?us-ascii?Q?Z+8u9YO6QiRutcmRxBTtu4hGqnIofhfOYvqYb+pMZDAzgAU+qL35UfjZZ8v2?=
 =?us-ascii?Q?UFSkjSc08iHYYbp9A/iIYuFbCyJyxAr3ISOYW0HBAFPM2sY7r+wuJ84Q4Pvi?=
 =?us-ascii?Q?QRlCxdmLR4fhHng/60dbxL3S5QNAO9DN713PF4nT+uXILtpFCp4JgHJweg5H?=
 =?us-ascii?Q?txEWMi09oHqi5xvXKeIADHSZlACf6vQdDt7MRa+9vk8+NiJtWicl89ATe4OT?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 462065d8-25da-43b3-14ca-08dc7a79a724
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:10:09.5778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9uBcyf+A1BNh0x/qlzVaI5zwEZv9oMO3Q7jqKvuf8AYe6o0dmueMl0U1meYMtcXHTVjWsnrp2GRhVw3zfPW7EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
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

On Wed, May 22, 2024 at 01:35:17PM +0300, Jani Nikula wrote:
> Synchronize i915_pciids.h with kernel commit:
> 
> 5c8c22adc802 ("drm/i915/pciids: add INTEL_IVB_IDS()")

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/i915_pciids.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 0d48c493dcce..16778d92346b 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -177,6 +177,10 @@
>  	INTEL_IVB_D_GT1_IDS(info), \
>  	INTEL_IVB_D_GT2_IDS(info)
>  
> +#define INTEL_IVB_IDS(info) \
> +	INTEL_IVB_M_IDS(info), \
> +	INTEL_IVB_D_IDS(info)
> +
>  #define INTEL_IVB_Q_IDS(info) \
>  	INTEL_QUANTA_VGA_DEVICE(info) /* Quanta transcode */
>  
> -- 
> 2.39.2
> 
