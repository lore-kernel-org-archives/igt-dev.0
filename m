Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7B2D40D0D
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 23:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A5510E633;
	Tue,  5 Nov 2024 23:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4BQnVvg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA1B10E631
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 23:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730851161; x=1762387161;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Gecf3KQrGjviSSoTnMmw/6cqw0qXPnLDNRGl1QAyqUY=;
 b=M4BQnVvggxqowrhNK6gcoN+k+6MsOK6nShns9EVcNP/sEzZcCX0Q99P7
 +YI2KQFKGSeAlyLfLP3WicNG7tOJVrT6wnrS97HvGF8g83CN+dR2asAwx
 gsktKw0lsvyvUpUCydyYguJPQf+T6uvJSEm+azzWfGV15jwi1HK0vTJWF
 Rt9oZp3v6QZf4XFqh1fushAhRqUhU6TY2fPY7ubTjdGSn7iITUjY5tyV9
 M4nLZam/Qhd6dZ7CYMNiiDWjR0LsW2hgd4zjticdmTcu7vZ9YkNqV8kfv
 hRbP61A6uGYSg/OEuH2fl0U7tp5RScslN9EbNd6Fv0siPr+Pb7tn7I+XX Q==;
X-CSE-ConnectionGUID: V5qlHBWoRJyqpQmShoJtDA==
X-CSE-MsgGUID: fO2CwB3RSym7uD8AQUra9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41222796"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="41222796"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 15:59:21 -0800
X-CSE-ConnectionGUID: NWd2wICtT3yBgo5jUkVS3g==
X-CSE-MsgGUID: QeZKxIQQTH2Dt9S3LXj7Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="84548683"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 15:59:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 15:59:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 15:59:20 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 15:59:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NB+fgeJQOmRmgDLIJU4TuPxrtvKEZSMZ6dvFk9Clx5qBVxVFsKfMBYln6u1z2bXR2EDU+KswsX2LjHc34O9dreMZbgHin+LVqbcKmFuDm4dgHgzv2vnhszxb7+cbdWoD0tu1QgiXdm5gkZvggb9WgESXnotneKEpsOO7lE1poELQjPkAlC7fyZJSxi9VMcIDurgB4kGiBJrcB4MYmUNnoCFlIwQ7CehIHjeL4d96sJGjaLVEqVyIwKiNi7vWA5peLIM6afrYAw/2q2wTuUhtOZkPBQ1JBIucnd9RiXgXJwPT1QOPimgUVliFglaP6w7Xoqj8o98i8X4TMOV0NM+reQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLh1NZVxq8OZ/LQOUvWL7djsHhOpcZBL8vMk/t4+BUw=;
 b=b6fCif1Rgzu9ZXhYzg3QruDZLyg6tLfvjcrskm2diWbgvvED+ABmCx7T7P5POBKxdlUjwMiqCAKSqmDi0X5gR3hbdwbqowUtvsuU965FMGL4nD2VCfJJUydRpFiys1yU+/i5HykN3HjoExrHImF7xSN0jaoYxF3+wHyYDRcjpLFEagMTLA7MtbD0/mBHyw3LFeWBTlZHXgzUwZbQJZNLMbxquO9EiafSepter4VERj4D3B4KZ2mcl/CRL+rZCasyFtqfY9iLMBY+tAhly4T3X6Pp3WlX7eSUfDCJbzkJsjSgjLmyDXqXI+a53ySKXrpcU6kUW5CQsJQlop0KxJ21rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB7276.namprd11.prod.outlook.com (2603:10b6:610:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 23:59:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 23:59:18 +0000
Date: Tue, 5 Nov 2024 15:59:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t 2/4] tests/intel/xe_exec_threads: remove redundant wait
Message-ID: <20241105235915.GO4891@mdroper-desk1.amr.corp.intel.com>
References: <20241030230350.1681757-1-fei.yang@intel.com>
 <20241030230350.1681757-3-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241030230350.1681757-3-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0199.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f467901-0602-43f4-9061-08dcfdf5dc02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cwCKvI0s6CFvScQHjnT5xcogSjsDR/iHymgjrscbaqGXvVONLwV75eiFe1iZ?=
 =?us-ascii?Q?QmgSfjILG2JGHYmHXbd+s21sok/9vcCSHOxvLZPvcCCvYZaSX/CtT6N7Svwy?=
 =?us-ascii?Q?oHypCcU7k155lP/otjWzcZIJXURTXcFNMSaYaYuGcTEtUrRvUXjBH+q2B5x/?=
 =?us-ascii?Q?DHDEsNwo8b47zutaGYbltHO8zcMCy2ywAOdDYSmIWaRtc++Lti/10DX9GNWQ?=
 =?us-ascii?Q?UC2yLubwrntiWxZlrP3d7RIc2ys9Yb/afiBt2PMzT0i3cgjh0pGp8DSFG5Dr?=
 =?us-ascii?Q?Evq+fA8MjsWx1bPj+v4i0WoIEvLgqs3WjHfK/vOEyyHJOrdmW+lYe7wxLhiZ?=
 =?us-ascii?Q?f/QLusvb/sWykNxrvVjKWdtVUr4VFXndyxpjQ6Wtkib4FlRy0tqtJKVV5ejx?=
 =?us-ascii?Q?GL2AIUKLMQPnbiz375iHf08GLOgTIYfc3x8ykkGcqC/QW1naywDLwfcVm40q?=
 =?us-ascii?Q?2ZPekQs4kB1kFrNRn5xOuOVPe779Sfq9V+yPeYajn2AOAbyzS7eWPyMNVpgp?=
 =?us-ascii?Q?vsMqT3JBeX84t/WYv4wZ5Gkc05WX10E+nd3UAQK/SuwV8uyCVBgh6R0MWJXr?=
 =?us-ascii?Q?HIHz5IodHI+QgHLPTjXcwzCH01BH1J7aCnxIptiWDSGwXoyHtZK//vuO4ox7?=
 =?us-ascii?Q?xsqrxVybQ/WX1OHUrUo6UiZztrnP7lbZqwMiy3kM27v9FfNspR+L1KQ2QLdy?=
 =?us-ascii?Q?qHDCKdx6lE08Pu412O2oGT68LT+LJsFXaAVdM1pInlvtER0mghLtyqt55aM8?=
 =?us-ascii?Q?cX5U3zysNUJmtbhqqmCrIMA9TdMybKsXNXtfr2zhTrLn6TkYPYCB7hlQmk5B?=
 =?us-ascii?Q?93WK/llCZIFbzG8g5u+xxbmEVGj52jT6T+U3YxZdYI4Kusc7KRSb+EKxm9/v?=
 =?us-ascii?Q?LiBABm8hQohVBWf01B2ipLFuMtTlWjREG65T593MnvL2kJtlBOfEi7xUer7v?=
 =?us-ascii?Q?07hz+4ltV0KQ9BC2atCjlFwh56R4LQIJqjchDmiCZuYGY4jCvhViFDHocqXw?=
 =?us-ascii?Q?neTqHJLcKwmnMTF5JeAiDXY9KDUoBMBlId4eIyGkRoI1qD4XlGCCscHuCuZm?=
 =?us-ascii?Q?LJpczFh3LkhOKTjZT8MtUoGN4JDYqnlryOSRZxadlVAhwzoEDtJsCh9CaoNP?=
 =?us-ascii?Q?RTMHvWQCuLPodPM0xT90hVCcL5cKY9U09eTW+hJEBh/qbUUxs34HvUP8m9re?=
 =?us-ascii?Q?vhLyErN+0Cnt1XbLXvFc/kPHHZiTvnxH5+7PVyZAKNEcifgkrryXFrsIpHHl?=
 =?us-ascii?Q?sLFLAOWLmsDgMBX8f1lRa9qZipOHb07xvkyUjj/5fCoPf+kgAV+hrfytpTgR?=
 =?us-ascii?Q?vxp7E2Wxp6D8plNZqWKpGbQq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gcGnN6A4pyz5U9qs45goI1kPAjnOCnyV92U74/a5aLJQgZk14sLRgG9ePUMO?=
 =?us-ascii?Q?qsQcA8BoLEuKKoZQPi1ielXsUtL4OKzBD1dwEcANmbKmbWfqQVERkuJL3bDu?=
 =?us-ascii?Q?eIb6tk8xVKMjUl2V+fG8qvrUjhpj2nNboRujCB/tsQhOFZfmhDhUNaZsvlVt?=
 =?us-ascii?Q?P9/N6VYs4f7aPDbetv6xeRKH2Ikp8YmSwhrVy2BBuY81FcnqF0zZHe8dh/vW?=
 =?us-ascii?Q?BFZLMHC8za9mB+5rom0FSvsDzWrJST7uzjRfAxQtF9+PfNHqaZGAygHY/Lz3?=
 =?us-ascii?Q?oax+5Lrb7OiyNUhBVKB/qkRI3tvoEtLECsssa4rniGYDOL4byVFgN8Y+2132?=
 =?us-ascii?Q?41rJ2uGocOfYp/Yc4F53QZODrKFz9sViuloc1VcJFc/MW0YI768rDg2iv+lK?=
 =?us-ascii?Q?v/4fd4+6v+ZkjdnXKQ5dGEe1Uvq9dRkYksZBUEMAkdcCSy5zHJ03QgGdRcsh?=
 =?us-ascii?Q?Ma5hu1ejOp+J+qoybxIF/HvNkimNihv5muGO6PXVoT+qRqIZu8CCK5gXbEUG?=
 =?us-ascii?Q?MsLBleZEhX8f72I3g6jSAKL8wSk1mKxhSm53zwFrWN51uzImI2HOIoU4c7o5?=
 =?us-ascii?Q?OFDtrbnrwhkr6YcEC2mPXZc9w9Zu4Q72VhVo0XdIOdgEQI84Jow4HtQ6rsD5?=
 =?us-ascii?Q?C1HXW8GXv6/6AJQW6HpnIsLm3lZ/DoRjTIQvk6V+nZKTGjv42TlBDDVGrwZI?=
 =?us-ascii?Q?y+/pY3HdBW1QY1Y4ey7pVciwDu7CxIQvkW64blVdSpdsG9LT64qe+baBJ74k?=
 =?us-ascii?Q?0jnqEAvq4e8jTLgdVOrHggDj3kAK5/SN17qL4qQrFJHtqHw5cGt8jzNpoi83?=
 =?us-ascii?Q?xniWdzTvmaDZ/pqKm4qzHuVXsdwUqgwGer2TUrKJnggOoT3SnKZOEWTPFKrs?=
 =?us-ascii?Q?82btwRG3j+zlHBNsdpNgkIiW9cH2s7WNbBYAUPTIYvYwu+9pzEW9z8EGQqce?=
 =?us-ascii?Q?OIw7O4ZiSGJztIyadoFK8Oh3fHuvnwXsXy2vTwF2mTXnhANibRV6ep6g6+F7?=
 =?us-ascii?Q?gnA6Xz4xP4UC+BR6KszsG8ps4yY0lJbBLaaQYZcB5c2CejQDsQ23CSnc46bh?=
 =?us-ascii?Q?28ezZz4jvRGgI1OlqrOP1Ke5oA2IABHR2dG03Brzjd3VudqA8c/LuGl4E+lX?=
 =?us-ascii?Q?gXVUHk8RUupyIJPdVMHEqsMIKOSNy9+O3wKM+RVBHMrsP1ZvjrizaYqsmVEz?=
 =?us-ascii?Q?KB8wCSI/CHuTGDRmpr2f8+WIwhR1oTZ14lz8rexikWTYMoe2aAq+3QYlcG/P?=
 =?us-ascii?Q?31z5Zo7YAUl7QuXjomFPuZSDXScHNm5lYt16Jaoq9rkmogMcO7X/4iexPgic?=
 =?us-ascii?Q?qSfYQ2513eHSSHz9LRGAlDJJND2iR05BwwHP3lueX4QKReeabwOmYgHqOxUN?=
 =?us-ascii?Q?eaQNBH7DaROC8AQlOuxu6IabIS/ZNNmn6gyafpfwf1/aGkJTOVIjkntLTi8N?=
 =?us-ascii?Q?2Ntn9n2Hl+otFORiNrieSkWqdT8OzRMsFCXRFwUhG/571F+6hfhqbYOr5zWO?=
 =?us-ascii?Q?dbPw0zS0u2ndxt1XOyqxeW3HSfB8FvTvQfAIRRr9lZ0vi+zm18YjiNjEyQ0X?=
 =?us-ascii?Q?faKAzj2W7z47sk0liJYq9qOvaKh1BHCuImch8v4wmHb8qgYSZ+B7NSuMTZ6P?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f467901-0602-43f4-9061-08dcfdf5dc02
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 23:59:18.1463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiflLgy2+DPjQM00vFZZV3Brcd15kwd3shcAm9D/1EZ5bS12QquqEc4d6MVXjtcXZHMBiL456C8HRMLDvAyCRmzvj7Zuw7lKrRSkYJ8SbKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7276
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

On Wed, Oct 30, 2024 at 04:03:48PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> The for-loop for REBIND case accidentally wait twice for the execs of
> 0x20*n interations. Copyi paste the code from INVALIDATE case which is
> correct.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

I'm not super wild about the non-intuitive loop logic (even in the
INVALIDATE case that we're copying from), but this does solve the
unwanted overlap and also makes the two spots in the code consistent.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Maybe we can come back later and write these loops in a more clear
manner.


Matt

> ---
>  tests/intel/xe_exec_threads.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 413d6626b..962957cd7 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -340,7 +340,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		xe_exec(fd, &exec);
>  
>  		if (flags & REBIND && i && !(i & 0x1f)) {
> -			for (j = i - 0x20; j <= i; ++j)
> +			for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
>  				xe_wait_ufence(fd, &data[j].exec_sync,
>  					       USER_FENCE_VALUE,
>  					       exec_queues[e], fence_timeout);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
