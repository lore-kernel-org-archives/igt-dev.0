Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C56C25B77
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 12:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEB510EE9A;
	Fri, 17 May 2024 12:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpwvRFtN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B633B10EE9A
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715950047; x=1747486047;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9tYnnOXNCMaQcJEvKGRRLx0RpqPsGOXgNH28lmhqgh0=;
 b=bpwvRFtNg+Bn7wydvAF5o+dwBjhVnbmQSugbh6A8wA3gkbUxlgy1O8Vy
 S1qTnDhMe9LrcfnLNzC7QtYrtGdc2ITPnO1u+zAyPxRyMCUdHnTv2CEUB
 bd/lQLAqFYQB7yXPhDEbzIZifxddvaDNjs70yuVJUsKiBMkFiQXBhfSZ/
 dFFzZMz1S/vIa4MhFt+9O8IC5qSzLnR2Us44ggt+KZmtisCwMKdbGna+b
 6ZBIAS00EH3W1+sMfLs97I8PmpIWKYcinbUZydhwDOX5aYuLv5uqm6eQ4
 ZgB7SBYlT9uHltpZ2TUbokpfsfShlLxZBTkgise4NXQbClKtJYJ5fUw2J A==;
X-CSE-ConnectionGUID: ejSqIbsGR1WxLzJhoZk13A==
X-CSE-MsgGUID: oXoFceiKSa+kF6q9cjnIyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22798451"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="22798451"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 05:47:27 -0700
X-CSE-ConnectionGUID: WuFb038WQnSQkkUnzHH9Tw==
X-CSE-MsgGUID: hSiFJLxXTf+wBKtFcpesHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="32325809"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 05:47:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 05:47:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 05:47:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 05:47:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 05:47:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GH9NvE7ipuiP8myMaAjrlKGcacm+njLaAKslnlQQhL4R/zqnb4MnCIP/YUymUK3jIcXm6vjeIYZvBHoqfmuFZSfAIGHBWhgpHC6nXe+JLNJkCKhM4FSe/bN425VyoX02FZX0TTipwNtSl8S0kl5OtTGSxnSXIlidWOMn4e65gCm0iqspmlXRbZZCmjEfjKsbudknFOznm5OpDlkZe8PuZZOmOtO4p+kvyJ4fkyn5fyMo2a8xq6W6jGuMt4r8/Pd3Oq19irihIT88XM+55q2eIfAFYLGZikq6Mv/QZ8kMDW8OcnWlTyzt4aJF8GYmiolAGpTnyQ7GO6ll8jaFjGRsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9PDI3Qdp1SCrA2yta12/77bb18rChR7F4QWVkGUISs=;
 b=evgpb9zYViDOQjYDMA44SFI4dhZuc9PHvU9wse13oE6GzOOGqAcmKw+n1yGRBpaLMljvn09PW9RmQ3+6OiEs4lcHufVnv+HvVf5smJK/IYqBpY7d+zOKEw0gZiBylKfv/azTEKMUWZd08rJZzzC1Cze8LTZB5jK7wqiNi/Ri9EpR2QyuzRgfa5ieycBxX2EXl1K8KBLUEp/69X5tMqcz0PNGmG/rFfU4HyN8lvR4mmr1Xrvt9Qvh+zwvXVFtOoqh1qhFeke2eePnuvcC+fEnbpnaYqGfcWBWHJN3bbvyphqyiNstUejdHMeUiNUu2+B31kFRiT97EAvULRFlsa8ogA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 12:47:19 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a%3]) with mapi id 15.20.7587.025; Fri, 17 May 2024
 12:47:19 +0000
Date: Fri, 17 May 2024 14:47:12 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_pm: Convert mmap tests to use
 existing d3 helpers
Message-ID: <ZkdR0JGYkyQUniRz@fdugast-desk>
References: <20240516181015.149824-1-rodrigo.vivi@intel.com>
 <20240516181015.149824-5-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240516181015.149824-5-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI1P293CA0029.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::15) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MN0PR11MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3e2fc0-7de2-4cd6-ca7d-08dc766f7d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9nLhwnQGq32XbIJM+7Ypxn0jCHSEQqgkqYaFrI4zwXUACg/ZkwWZXpwNCpzy?=
 =?us-ascii?Q?Lsy698K+SUgqcB3TJP4CBmnjZo7FuNAvqku2S5xCL7xojIeXvlP0PsM0c1Zz?=
 =?us-ascii?Q?O1R08KPTEB/Vpdxdbe9M2J8S1XkJtHXm9kTTH0/yIcpFN61MS38knok5lu/t?=
 =?us-ascii?Q?tyNSg7gV8jUPJiKUta01QjwFOVclxJx3WRVfMUJXoAB+XhP9dgC1f4ARlIIh?=
 =?us-ascii?Q?hGHF+hSIzwCOTWuyLG2/D8vb2iN+ZKOCDTmt2q0jPkKV8X4p/GCj+mfEIaKa?=
 =?us-ascii?Q?zcYOtZnVEjy2DFe9FdexxGZnJym6Pea468NtK8mxKilMQ5djRDFXyLU6W2Z3?=
 =?us-ascii?Q?rhI4TxKEGna4yu8ZgZnmQf+otqhv63R5WJxMkGDkPCyqKqTjZ168sHN6n4N7?=
 =?us-ascii?Q?Pm2x7agnExtPUJF9Ib8wmsXU+VtHCeMDStNstsAT/YSlzwywjX1pRiJgcPaL?=
 =?us-ascii?Q?7TYVU9lOoPulmNxV8SMYFJHFrnp0JqTFomDjDtk9uwhhEQeRPKnMOIEHMQmJ?=
 =?us-ascii?Q?GlTspWbRl0QHSc3snL8QWh6RJnE9RCsAv9sVPEjtGR2epirMD7gJqJxllsXL?=
 =?us-ascii?Q?UMjqSpnWwdvgy4sMrG48b99K1dE98PuA3usahY1T4nzDiX0o9TJVgSN75bXh?=
 =?us-ascii?Q?YpZi+6WaOIxt1tV7NA4YBtLbugyot6IJ2nj9l+7bkg471HRa/Bj17Npysulu?=
 =?us-ascii?Q?z2Oimh0cdfQ/lcQLngqh9pVxALrCY0Ij5RvLAKb0WXPYRJK5LvnNhcQ9Pww9?=
 =?us-ascii?Q?sJy2Hwpbyr1V2WBFYUhxU8j1DV4gY+57RrF9sjf9z9QuFu1h4c2t9CeFSp02?=
 =?us-ascii?Q?JALdz7qteuIsJONCJ3eS8O5YF9sz36yb00am5BC6SWayzmO+q2KTaYBYeKjM?=
 =?us-ascii?Q?XfDWaae1QCdQtgfwsT9y4vwp4n5pkveq/8YVvaPf6qzFePYUS0eqGBSE+jWy?=
 =?us-ascii?Q?y4JYOWFIElOkjp179nOFbO31GZ35a+5OKvORWk/1tinxdfJUGuyBv1XPmpXo?=
 =?us-ascii?Q?8QKdyW6e3GLM/CFgr+afE7vZ3EBCy8WPo+dsW3UQMYARK+1oTYdAKqaPnkWm?=
 =?us-ascii?Q?aYKkVTCxREDnfMlICkEDUrPPRHAq/PgJ+fE2Fh8qkdcnqndKgbAsB3+LBvub?=
 =?us-ascii?Q?e8fGT14LICP2Fn2FUs4jY9gapiDoKdRw98NdmsJ1yYAjlnbJc00Jz0hpJvGf?=
 =?us-ascii?Q?c0licuMx6xVSkfG7lvk71X9KIpzsvBE97rSOsIkNIipnK2CEfsqBVJY5q/dB?=
 =?us-ascii?Q?e82fG+UpmvILx0fp/cUte/xfduImzlaYResYzTdnbQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wuoJZTBYWCc/zzRjN0DpDg4tcemmcD3LXB9F07CyNqS1canf05tEAram/y7X?=
 =?us-ascii?Q?5Q+yaCaf8jjWhQ6EDGDtfbIw0Dw6OGc4yFWDSS3z2ZoaV9KemdZe4+S8W3co?=
 =?us-ascii?Q?7HGeELWdPAY68PQZXqirDnVyHUc4xNQCzr4LY5eRkrwfhyjKw64IDcZi2VuO?=
 =?us-ascii?Q?BZjeGHuzjQhXK4akJk3alvr10eOJLcs3LX8hpr/aeqFJOjMXZvShf8HsgPHN?=
 =?us-ascii?Q?jNn62bWZE2l4QLRDHKsxZbtcsLONgw0zuTgbuPSyGx6cYaPM2Ftimzsf/4cJ?=
 =?us-ascii?Q?cq5a+XJXDtRENCMPN38hKmNyfEnnCSVOitgw1lQ+mr8O9JNhQ1XFYUpSoVys?=
 =?us-ascii?Q?pvGJDL7DeP63qmuNGE2kW0yxXXIaz+Unk4L8fy3eASll/UZ3VGW4ltO/TNwR?=
 =?us-ascii?Q?90x3Lb5Od9EPRqACtdTl9EfUDYQe0DGW5BRxlNMP92E+Sxyd3Y1L/nQhHiec?=
 =?us-ascii?Q?aRhrtFh/QcrPwQv/TCMnOdVr0n+GQKcrY5Nny6m0MZEanQ68TzUSi2s9C3Z/?=
 =?us-ascii?Q?xwlnd49l1N1WhQsqwZfajp95UOnul3vvqKF7ZeFIdsK/tAmmy7HQt+zPIMvg?=
 =?us-ascii?Q?KCt2w86e9m/Ayf1yFxDzxxvsWyoDzp+KAqwY+enGGpXXbf+t/H+zDVeNF4vx?=
 =?us-ascii?Q?oNRLMVotPQ5MOyQgRWUYLwsY+pZOBC33DAcacbosW1ameTBI3/JDjihQEaDO?=
 =?us-ascii?Q?yPeMEtpCG6/IXpuG56Ldjsp9mok994PhsC//g5LhqUa4PWzmr4xda3s9JxOQ?=
 =?us-ascii?Q?FvPLO/3BA27f/+NEbkK3X0dm0QWTSgSwt3s4NXmhu+RDaVuHTOp2UiwerDPc?=
 =?us-ascii?Q?GBP738QMnE2H/aibhs73v7pGuY8XjeuZWjs78ulR8QIqEAFIXoYReC4MYz8h?=
 =?us-ascii?Q?fZ3/EB0blV9Ni1jJw+xR9GVQkflIzba+gm3e27ybuxmwZRA90ndULl2oXBDA?=
 =?us-ascii?Q?mVQHDvjQ+j9tiyILHQilFarWlcafJIaT8tmGrXWA3/NWPefhG1sQ0EezRWU1?=
 =?us-ascii?Q?8up5WKp9wfQ/IourPNOPai9h2NiRvksXQuIVSnTZgKZry8OJOL2T3F6fDm6o?=
 =?us-ascii?Q?0YVh66BOY9pbCqBfgffyg5TZBa4ntGAO1Lbm5jiNH05Lf38ZeM+sfYusXad2?=
 =?us-ascii?Q?J6jRHFtsQQivxwHdAKwC0Dhp6GKOE9wx/lJdXeV8veCJmMN5r5xcxfo3YU5v?=
 =?us-ascii?Q?qCqvzF5SdPW0omZVNzitVZxq18ue8KoxNjfYD03FAD7gW4o2Na/bM0V4xOVy?=
 =?us-ascii?Q?99Oa8YCPXWhaz4bTmCBla6FwMSbNpUNPHf5APRjqwVs6YOLwe2/U/Nuc48L1?=
 =?us-ascii?Q?KpZUJCB1ZbcC2FwZCzEP878mppAPbf5ykSidHRjKFe/S6Ze6kMi35SsU7/Ma?=
 =?us-ascii?Q?KR1Y3kVhuTI4j0ETaQMl3PGmib6vmwt006ti+dTgX7O/bZkt7ZF6Ez/m8t3F?=
 =?us-ascii?Q?2ZQsnEyZfH5W3RCcrWjhZu72o5LM4WzBK/piLqqDfhhLr+fspHcuVCc8VAk1?=
 =?us-ascii?Q?d+M72sHZqOfi0t6uq8evFdiqlxiy9kWFvxytTd/1DzIvmaPBVyKaRTUVLSEE?=
 =?us-ascii?Q?kdnCqUW8vuN/zVMv6s4yBisxVjx3gRDz4Ap1Sk7F7OUpinrURqLsO7x97XH0?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3e2fc0-7de2-4cd6-ca7d-08dc766f7d2b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 12:47:19.4165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksKm2bHVqM80JFbnm8frFbb85IlXhKzTiUmzRaPJqE30l0Pp2Med1KqZmIX9Yb28VKi0/kHc+vOaoxNJzo3x+7h6SvGnMQN1nadD2upBdi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
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

On Thu, May 16, 2024 at 02:10:15PM -0400, Rodrigo Vivi wrote:
> Standardize d3 setup and ensure that it tests with D3cold and
> D3hot.
> 
> v2: rebased

It looks like it still needs a rebase after
commit 05b3f554 ("tests/intel/xe_pm: Disable display for mocs-rpm test").

> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tests/intel/xe_pm.c | 80 ++++++++++++++++++++++++---------------------
>  1 file changed, 42 insertions(+), 38 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 2770ce83d..94e36774a 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -516,19 +516,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>  }
>  
>  /**
> - * SUBTEST: d3-mmap-%s
> + * SUBTEST: %s-mmap-%s
>   * Description:
>   *	Validate mmap memory mapping with d3 state, for %arg[1] region,

The description no longer matches the test arguments: s/%arg[1]/%arg[2] and s/d3/%arg[1]/

With this and the rebase:

    Reviewed-by: Francois Dugast <francois.dugast@intel.com>

>   *	if supported by device.
> + *
>   * arg[1]:
>   *
> + * @d3hot:	d3hot
> + * @d3cold:	d3cold
> + *
> + * arg[2]:
> + *
>   * @vram:	vram region
>   * @system:	system region
>   *
>   * Functionality: pm-d3
>   */
>  static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
> -		      enum mem_op first_op)
> +		      enum mem_op first_op, enum igt_acpi_d_state d_state)
>  {
>  	size_t bo_size = 8192;
>  	uint32_t *map = NULL;
> @@ -537,7 +543,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>  
>  	igt_require_f(placement, "Device doesn't support such memory region\n");
>  
> -	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	igt_assert(in_d3(device, d_state));
>  	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
> @@ -563,7 +569,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>  	close(fw_handle);
>  	sleep(1);
>  
> -	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	igt_assert(in_d3(device, d_state));
>  	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++) {
> @@ -578,7 +584,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>  		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
>  			   active_time);
>  
> -	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	igt_assert(in_d3(device, d_state));
>  	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++) {
> @@ -588,7 +594,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>  			igt_assert(map[i] == MAGIC_2);
>  	}
>  
> -	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	igt_assert(in_d3(device, d_state));
>  
>  	/* Runtime resume and check the pattern */
>  	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> @@ -783,6 +789,36 @@ igt_main
>  					  NO_SUSPEND, d->state, 0);
>  			cleanup_d3(device);
>  		}
> +
> +		igt_describe_f("Validate mmap memory mappings with system region,"
> +			       "when device along with parent bridge in %s", d->name);
> +		igt_subtest_f("%s-mmap-system", d->name) {
> +			igt_assert(setup_d3(device, d->state));
> +			test_mmap(device, system_memory(device.fd_xe), 0,
> +				  READ, d->state);
> +			test_mmap(device, system_memory(device.fd_xe), 0,
> +				  WRITE, d->state);
> +			cleanup_d3(device);
> +		}
> +
> +		igt_describe_f("Validate mmap memory mappings with vram region,"
> +			     "when device along with parent bridge in %s", d->name);
> +		igt_subtest_f("%s-mmap-vram", d->name) {
> +			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
> +
> +			/* Give some auto suspend delay to validate rpm active during page fault */
> +			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
> +			igt_assert(setup_d3(device, d->state));
> +			test_mmap(device, vram_memory(device.fd_xe, 0),
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +				  READ, d->state);
> +			test_mmap(device, vram_memory(device.fd_xe, 0),
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +				  WRITE, d->state);
> +			cleanup_d3(device);
> +
> +			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
> +		}
>  	}
>  
>  	igt_subtest_group {
> @@ -798,38 +834,6 @@ igt_main
>  			test_vram_d3cold_threshold(device, sysfs_fd);
>  		}
>  
> -		igt_describe("Validate mmap memory mappings with system region,"
> -			     "when device along with parent bridge in d3");
> -		igt_subtest("d3-mmap-system") {
> -			dpms_on_off(device, DRM_MODE_DPMS_OFF);
> -			test_mmap(device, system_memory(device.fd_xe), 0, READ);
> -			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
> -			dpms_on_off(device, DRM_MODE_DPMS_ON);
> -		}
> -
> -		igt_describe("Validate mmap memory mappings with vram region,"
> -			     "when device along with parent bridge in d3");
> -		igt_subtest("d3-mmap-vram") {
> -			int delay_ms;
> -
> -			if (device.pci_root != device.pci_xe) {
> -				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
> -				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
> -			}
> -
> -			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
> -
> -			/* Give some auto suspend delay to validate rpm active during page fault */
> -			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
> -			dpms_on_off(device, DRM_MODE_DPMS_OFF);
> -			test_mmap(device, vram_memory(device.fd_xe, 0),
> -				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
> -			test_mmap(device, vram_memory(device.fd_xe, 0),
> -				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
> -			dpms_on_off(device, DRM_MODE_DPMS_ON);
> -			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
> -		}
> -
>  		igt_subtest("mocs-rpm")
>  			test_mocs_suspend_resume(device, NO_SUSPEND);
>  	}
> -- 
> 2.44.0
> 
