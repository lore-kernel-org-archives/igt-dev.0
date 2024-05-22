Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78212C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 16:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DC710E2E4;
	Wed, 22 May 2024 16:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdRhme/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C76B10E2E4
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 16:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394326; x=1747930326;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FMWvLrvGJcUFZcbry87ciIHrpakoc6VLeYQ4hg6F6cQ=;
 b=fdRhme/rbw8CIzCXiN+X+0NOXVIvjnBKdsTa6MN5YEDR++kcpXpbJItJ
 /r29xY1erHTkv6gAmxc9k5pbqnrFfl4+H5f0SNcJ16m+EHucvjQBgEPWG
 Ta/3q5G2MLESw3IlyRX0Z2ZZHoSMNh148+X/MVdBuc8rWzRa9CI3mwnEW
 xPjv8L5vgVzggqVMQTrLdPu9h2X+nJOLtmx4z9/1lbhbOipjsL8h1MCAq
 hH13RhlnRhAjGCM5mHmyO4nntA5YO+j0lfk6B3tpbo9JPK6TC4eQplpiz
 Ys8kjT/K2mCXsd+4R0e3BjpERFF9zOwVyQdaBt4wc/Co/aQHbdvZdmKIk Q==;
X-CSE-ConnectionGUID: RkLjHUiHSlaYJTfxfAa8HQ==
X-CSE-MsgGUID: WLqPufXuQ8iO22CcvSPA7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="24063516"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="24063516"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:12:05 -0700
X-CSE-ConnectionGUID: 7uVwC8z1QP2RGA/7Rs4Cvg==
X-CSE-MsgGUID: Xe6QNurKQEylxGtUFlEaew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33334987"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:12:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:12:04 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:12:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:12:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:12:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ww2fAmjRWSS1CL5cNnUjm9+eANKx+uCXcZQsa8CvJ0sO5MThv47Fo3hW98AACTrisBl2fFdtg34YNrMCCRWJpxwIOH9Fl7Eo6UDcxRxLd0o4WW8bTP/7KpElyNTYWW5gu2iCM0SjkLY4S7pzMHvh59cUhM9dep7E/bU4xqnxP4k/TIRP2jEKWKqxVlEQhEH5eznMNyn5l8tegIpH3VP/mDSCpMk+mfTSAfVLEJlWzhreEmEEIbIueSB87N6CQ8tzTzP8Ft9wh4CdRZItVP28sq0HhI1a26ddKGS+HDvH1fb3/Xfdy7KriyAWavVv635myn5ThaGuQkaphVhLB+08mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDppeTS3p+5wSuGZT30jC5bCVe0eKSw57JwEg/kaJ+M=;
 b=QN6AQn80K+2iZUqqY6EHF17FQDYzrlrHdXFkuvICuxzWW43TMCU906Avp4regDXNAwRKygd8i/Yz6ZK4EZx1Zooc0/myCtIOqnpXEoLRXZmrKeCrmDTUZXCrOZ0IRkY6FvBIyfGfPspd6W1IwJ47w9aLZqk+ZBIYpKDvm4p/zPYOwbaXX7hYLxqGluR2Bp97ZyiqBVQbmel612KpWcB0YHJfyRkpAjUTNObJkE0Pys8XXsYEqSFf2pweL5s2nAxWkWd+oKzJ6l4d2dUCf2bJmds12keYHa1Bg64eTtQYx3ekx7TYsIZI6Uam1ZnBSvHKQdnoKx+wxB/uRWqc4nR45A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8474.namprd11.prod.outlook.com (2603:10b6:806:3ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 16:12:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:12:02 +0000
Date: Wed, 22 May 2024 12:11:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 06/10] lib: sync i915_pciids.h with kernel commit
 bfbda4722767
Message-ID: <Zk4ZTz7l8rhNBD-K@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
 <c4db2d04b9f09a2221a7beb472d6cf0253fbfecc.1716373923.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c4db2d04b9f09a2221a7beb472d6cf0253fbfecc.1716373923.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:40::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b2de741-5bf2-4c0f-c36a-08dc7a79ea72
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h/xpkLNkI8zuoz34V1Ezl8iQ4JBtIhL2TG1oE56DhF29aPpKYjN1elG/6cF1?=
 =?us-ascii?Q?7AHPXN+V9F1ZOn96LgIG73QiG3XjhuC2SRob4cR75FIJ28rVw2UnCoUMuC2h?=
 =?us-ascii?Q?2XNo14WwYrkVPa/ykZXtgXf1rAUunYmuHHOlJtb/AGrshnhk59F6+rdXCwe1?=
 =?us-ascii?Q?YQw5woNVjWuZzfYAZP8mG7ku7iRF5AQ83r4nX3zVX8PG078IPbSLgRy8FGMQ?=
 =?us-ascii?Q?vo0yQ4IS0IQ/7H1PJZlSFDEDGSoQYH51Rw4EVIo6Y1mMU+j57j+uWrveod+d?=
 =?us-ascii?Q?v3pxN+Xi5QQn9CetbEguXKMbsckOYlUk/LQLIKlGl5qdEXknS39qdKtlDcLs?=
 =?us-ascii?Q?GjaDWaLSbXt7WYsVb9G9jVgEzzUpo73ijdQhaoYz+GAdmztSjAnrUD01HWko?=
 =?us-ascii?Q?AfFpzYz4LC9ZvLTUd0Mg+hjfuVj2yNzItPQDV3GKKf2ZNWAAg4B6+RlSEtm3?=
 =?us-ascii?Q?ZKWKlqmU2EwMZg7angXK3P3xx0N1+jZJMX3y6XFT8BfGuWBD6rJDdMaS5T5+?=
 =?us-ascii?Q?uNSQGbnBIanZ7IWlwYG10DYsFxbQz6gdodUIn8QzHrJ2TkOKT8G0l9aatT48?=
 =?us-ascii?Q?vLV/Zsyt4hZkrAMfhnSIR1t2X2dYAwraBoNnqvVnyvepWOKyIReUaSGXokLj?=
 =?us-ascii?Q?grJIQKyuVzc9ZEZEgHclDXjt9iJxyiUaSqzugSGxsRrS/cozOSU+Q9I7FpLv?=
 =?us-ascii?Q?DK6r2oLO/UoUJ8LQubsliTshziCJo4QocuUiZLv98/rxooF7qgMPVN9VrFbH?=
 =?us-ascii?Q?4fsHK8lcQ7wAkQ6YbK4qqu3TbRr+FfwB88x6hiQYREdLi7sxA5rdnxyPUGaK?=
 =?us-ascii?Q?GE9zAfxd9MGpDMC+QGOw7Ld11OxUlRblcufUhpiu+O+YcwFgb5GfsEaMkdgi?=
 =?us-ascii?Q?uCE7M5bGDDWjRR9RChPWim9z8aq42Xej0V6xYofpMsTl3+vDTmnS/zXYL1E4?=
 =?us-ascii?Q?XN8FbH2vsRNsUWoB82TcP4VOvFLaT47aDaicWjCJd7Rj4rPSScT/an9i7svj?=
 =?us-ascii?Q?yalC6ioek4wZhbzbmZ/DjpxtGPsfGLz0WAsv/satAqhyKAhr8Y9Go3CDs4M/?=
 =?us-ascii?Q?0wWWW+giMD1myVGpQ29ND6eOp3lTZSuACkjH17GwrGncuww4PXk7Kjp86E/v?=
 =?us-ascii?Q?u+ZjS9ykF0+5XGGHzoXZNSngPy1dnmISho80xGTWfduInC5NyxRyDwhFgW7/?=
 =?us-ascii?Q?LDm9l3Q2fTQ6pKshWPJr+Q30OyThIqKRVIpfPJhZXWm0wyGBgxXbUFjiLugA?=
 =?us-ascii?Q?Qiv8dsB9lOrQOeEOpGGU7GhP90qrRImzXY2Fz+TGkA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RiHZ26NSsKB8LmXd/I6UWc4ayPPG3B80QFRZ41jTbXByrfmOZG76GSSJ0x6I?=
 =?us-ascii?Q?bPf8c1rBPg39nWe7at9mj+/Tb9GnkRJT8jGOt4oRIHEaYHLoEgBfzigSU9rw?=
 =?us-ascii?Q?tYfrpgDz5tn1QBo/8ZRwYrpfkSpvoUt3G1co8fkIxM5X6IGkPe7r2zKVClcN?=
 =?us-ascii?Q?XSBR6kQhD7lGHgVIb4fbjd4UqlQYw94Lt/jaSK1UdX2L1Y10rLkFbDzCWj4d?=
 =?us-ascii?Q?lMqwmoRWY0hd/ZqW1sthdAzlaLV8QD0cRuf8H4OaaFZOuA5NdumJXyIyK2Wp?=
 =?us-ascii?Q?80pACTCTAx09A5Y2YEYWbwB2NQ0YFCxEb12uP6Qg7/stGJaevNwcRYLo0WpD?=
 =?us-ascii?Q?P8eEESZe+WfZl5NyAdr6/aUJ+uNBch9LoJKHUIgArlLDzzXv74clI6iJGiVo?=
 =?us-ascii?Q?eDLOQov8zZg21vEObLKP2OBcxzA9eJFKt5JkeXTQfjdr1szLitCpbZQimRPJ?=
 =?us-ascii?Q?IzRx/h83WIHTL0nEBaxy9fltIxHMkBXnxgjbqu4ztz5sSOX7bgQyVMFwgkp+?=
 =?us-ascii?Q?L6zGJkJ+Ob5tVP3EVsMEdLUQ8M8GmvMs6JPlg4KKzdatQ6Zn7a0Z7zHOuYAz?=
 =?us-ascii?Q?RaLzP5cnWVD0glASINDCyWlbCTe7pVg9BSy1z8UpgOt+uo1VoBfB4pysvNqQ?=
 =?us-ascii?Q?6JrzTpW1/7GXAB91dgnVQCoE3isPyzICJrRtxYWm9dbAB+ECew5sjGBlrFyk?=
 =?us-ascii?Q?vqZn70gIVEQ7EPvLHZf0vYK88CjU5gWueX0anljYhUaT8epMZto6KikpGrI9?=
 =?us-ascii?Q?BJCFjd3lJ/a8USW5AN9HM8Hhs6uo31SfJmgZfLi+F+fLVlsHABD27zOqfXvR?=
 =?us-ascii?Q?bJyQZpBhwLGXg9GSbGxCXGcytBMO0Y7geYKJ9HeuJZtvYlDo2NDeYsGwKXkx?=
 =?us-ascii?Q?SKX5tuvv6PeKQFOKI9eyc4xLqXvo51kGmik7os7gzSHaFAL/TW/65HjB/zfG?=
 =?us-ascii?Q?vXtnj0zbBgzb0tfvxhSGBHJDG9f+uCRljS1N1Yp/Sy47Dw4D4vjOi3Hdj8hK?=
 =?us-ascii?Q?uc7ejzdH94o/t6ZI/r+I1AYZdTwFOgWzIgJXbZqlkCHCFKGz63SUFcjOQ6hQ?=
 =?us-ascii?Q?rlTx4Jseq41+bhUTc6CtrIqSB2uIna+b2dY1K3lalT7NzOjZ4kjW4gTPUCtW?=
 =?us-ascii?Q?7cmMkAQSdpi1iiQeElNRUJi83YIF0aCeh2oLHlLAR2Va20dGVMxrRzOQZfc6?=
 =?us-ascii?Q?W5nU/hKFGJHD2Bv7hMa7oVJ4NNqLFR0q4BoH9DXQKKaM4C+jZCcd9pHEWdK6?=
 =?us-ascii?Q?M+49AHK6YSDFv1PYDnmaXfaxHgad6frYxi32bETg7jvhxi4WBSk5XbEewM+U?=
 =?us-ascii?Q?17+e1Ycd33C9jqo2tAhFjRirpWRYj2OfrSbzQjz0pftKQwz9AeIYI11e5MnF?=
 =?us-ascii?Q?XffZcaQdj6u6zmUbafO9BRE6zkPNlo/D0xqaFAiYbGpUyig1SRaXsyM4K9Q8?=
 =?us-ascii?Q?Dol0Y0m+XFEAoVcwIS0OBH5JGOFt31r9F1LoKGwyZJPtUKDoysYEc0O/4x6h?=
 =?us-ascii?Q?yeO+jIEBFuUmQuUVz7XQUtm1GQqqg1kqZdyzcgGNXRz+tTaXeZb5xn+Y5Ama?=
 =?us-ascii?Q?so+OrHX6NbYsKpMJhxV6FK81CJpoitoT3Fo7Wy5XQZ3OsDGij6pe74uoyouX?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2de741-5bf2-4c0f-c36a-08dc7a79ea72
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:12:02.5134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwR2V8qwQIVckGJkXsw+im9VAtqbAbOGYW/m96V3MSqw12EiGAPcLN+mqX1Xp5R6KjXTZ1GF5qvT0cHzpBnLkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8474
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

On Wed, May 22, 2024 at 01:35:19PM +0300, Jani Nikula wrote:
> Synchronize i915_pciids.h with kernel commit:
> 
> bfbda4722767 ("drm/i915/pciids: remove 11 from INTEL_ICL_IDS()")
> 
> and update the references in intel_device_info.c.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/i915_pciids.h       | 2 +-
>  lib/intel_device_info.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 0c5a20d59801..ecfd7f71e2e7 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -597,7 +597,7 @@
>  	INTEL_VGA_DEVICE(0x8A70, info), \
>  	INTEL_VGA_DEVICE(0x8A71, info)
>  
> -#define INTEL_ICL_11_IDS(info) \
> +#define INTEL_ICL_IDS(info) \
>  	INTEL_ICL_PORT_F_IDS(info), \
>  	INTEL_VGA_DEVICE(0x8A51, info), \
>  	INTEL_VGA_DEVICE(0x8A5D, info)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 0bff1ab4ee95..79e3796dbefe 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -594,7 +594,7 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  	INTEL_CNL_IDS(&intel_cannonlake_info),
>  
> -	INTEL_ICL_11_IDS(&intel_icelake_info),
> +	INTEL_ICL_IDS(&intel_icelake_info),
>  
>  	INTEL_EHL_IDS(&intel_elkhartlake_info),
>  	INTEL_JSL_IDS(&intel_jasperlake_info),
> -- 
> 2.39.2
> 
