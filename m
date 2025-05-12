Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743B3C3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 10:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA89789361;
	Mon, 12 May 2025 10:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDWbOXrY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29AE89361
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 10:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747045464; x=1778581464;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C7K8o1OLl/HtFCx37wrgGfiX2LxblauoH2HpfXFtG50=;
 b=ZDWbOXrYrdsXhzdus99vf27lhJmaq23b1mmdd2WyY+zS6nz/m4llNNZ4
 aQ/hcHxFwyYTzfp7Pm9JCaypMDguzLVq7nqkKATfg+x4khAsihc0cj8eR
 EKSvRfpaqXQse1vbqO8iE+rvBrMGkbX6LuK+dZnYo0xs0GBq5ocrmfVFw
 vxC7J19UEoi2gHLhNVbo670O92BTWJ799csi5Q0U6CjFb5z+6Cq9ERS7P
 mn3epE4iRfYUEdFKkMdVRkILBAisJdIInMkT9QjrvtMyajvHoj1d8iQFM
 KLDp62VUg8TzIb65VL2OusDvUmwGI8mE0v+tzE713O6ydY0yNeUtNiq3C g==;
X-CSE-ConnectionGUID: Y0ebfOhCQ+yZksm7aq5SQA==
X-CSE-MsgGUID: 0AgAMXNrR0Sb2oxa+b7w6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48734861"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48734861"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:21:15 -0700
X-CSE-ConnectionGUID: N9CZQtiUQg+g321/33tgUA==
X-CSE-MsgGUID: UeSPcA3bTrqrzhvz5l4JSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="160580058"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:21:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 03:21:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 03:21:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 03:21:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qN3MrGBTxFlH2eaCAuwyoHGwY3MNEmY9Vg8yH5vs1p9n6Wqw/Xy1KV7coKiz/zAW6u+BuPdYL0uZgyzbeqF0bAU74Xwvz0PFvTGALGHxO4UtXekEjnZIO2zVkUTA1yP84ZnpqVtqDjAMQDpXIGeqBU5+T3N3FAnOgUw2aRDuMkj+DWp7gqCedACb8UWhpwpsNvC5pEuPeAdpc/5XoBOZ5W1IjtTsgrzqMtN0AuJ76rDKZuftQ8jf/TRvEVtg5IR5VGvFk2r4ivfscuYdlCW1CWsT7EM8bN/3eC+noY6iE8wR2A/Ay9l9JtX5zOqa9RqlVps0G+uaLkBILPmLBaIwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Avn9q8zXleXC1Cnk7Rb0lwOsffrjkPuSTktEkrWcVSw=;
 b=Fnyr95oHSkenFJLwUZFSCq3FRfux7Tbf5f+VbVtQFvrm/AFufqVjsyZrs9XO5cOc674QQ15Va3zlAklPlMq5j8QLBwpO/q+pT4r1a5+mYYKIX6uJJQOvtHl2xd0ddWtMnvkSZi+d50gDMZyViPcSewuqskpLbaGlhgaDujoYkl6Kd9XlWWbG/ZqcztAfLaxqrmQYQrdQMawHkpTMmW2Y253+y69rm1iYDmCRT/eDR+IhgCYvRZNuWyaTz1dUZgkE9KA27HT0Jeic793EbOeVZMZvczwU/UCHLmc8mLehQe3UQrKBOsiKAyqEL7b38HS4D1yHvB2xzd/nwM/cDdsdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by DM3PPF4C5964328.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 10:21:07 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::c7d3:72da:ccae:68dd]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::c7d3:72da:ccae:68dd%6]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 10:21:07 +0000
Date: Mon, 12 May 2025 10:21:02 +0000
From: Jan Maslak <jan.maslak@intel.com>
To: <nakshtra.goyal@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <dwarakanath.ramadeva@intel.com>
Subject: Re: [PATCH] tests/intel/xe_mmap: Adding igt exercise for RO page
Message-ID: <aCHLjrlrPjyVYNQa@ART-DEV-395>
References: <20250414083627.3264121-1-nakshtra.goyal@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250414083627.3264121-1-nakshtra.goyal@intel.com>
X-ClientProxiedBy: DU2P250CA0012.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::17) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|DM3PPF4C5964328:EE_
X-MS-Office365-Filtering-Correlation-Id: ade956a1-9a90-41e7-fa2e-08dd913eb526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v4PBvEhVXUdBkjYevdlLbYbTMzIf8fnLLc/4VpLguTnwCZPDwFw7HqtHYh5O?=
 =?us-ascii?Q?9KIb+XMiEu2KYq5dYv1eIe6Uz24deFUpJud7XjeFTM8pfbNvtXWuHjJoc0kg?=
 =?us-ascii?Q?fOCUE2GCsqk7W8fUOGX6XmG5Ornse3hR1F7xn0UdcSltY1rzvRIIk/VplPMZ?=
 =?us-ascii?Q?jmTvGtbdClOOyn4n2duCmW3ai8k4Bk0QgKhvmJv+QoHNy0lmkrNNHHmlYuLC?=
 =?us-ascii?Q?GATPzXqBQcq/SIlz0bje0dm3biaVU8fSa5OxXtXdJergGTBpXU4REkEDRKgR?=
 =?us-ascii?Q?Qk55GU40vqARs1CLfuVEMaSsQ90XjgqFwtnSdZAN2nMwI0jF21bOU67W6niV?=
 =?us-ascii?Q?69Qtpput3bJcvhiPTbLayh5KSFtVff96b5Dglx+KqkFNFQLPAVeUxhBiD7s+?=
 =?us-ascii?Q?rDLumi36w3QT1YsJAOKYGiakTw0zULHxa8TqyBLZSgYJgNSeETpmkAOCPzvx?=
 =?us-ascii?Q?ZbFTT8bIjQ25vxrLgLkp5OFQfRrIAGl0etmS7siyUuu9aTmTRnc+zejq8uR0?=
 =?us-ascii?Q?/FZNw+19peGstytaMSCli9/hTMO6aEt6Ko+bSAeYPhVELw1Mr1qt7va7NUCp?=
 =?us-ascii?Q?fD0RPfdFBmiXNjynda1S7AS1aKycEPdXb1BtBSVki12KH7W5VuMQJRg3aM6I?=
 =?us-ascii?Q?osd11bWBgGD1nqz7go9dAP58Y11egtfzMdyibiWo2ozLnRnTkCJ/PphU9qIj?=
 =?us-ascii?Q?0w1qJ5Ho9MnhWBsF2ZXibIV2af4JMuT88WixeLcmUx0FvCZ7mMCc1VCSgvZ4?=
 =?us-ascii?Q?rfhO3XIRidlcBUsjNNdATJV0qQ0hbPWeXRmzvuKfFlcegwcmtDAjkYv2qDxk?=
 =?us-ascii?Q?o4I9JAktUR2g4JSEbkqCJCL72Cg0Q+lu8V2r1Aa81WiUHWFbB2GugJ5L4/Rt?=
 =?us-ascii?Q?kJyD421ZCFi1QmihD051CMVgExjJfihykMNNNpmcvQ3d3MQ9ppHJ6o6W7K/v?=
 =?us-ascii?Q?U7tpfZO1yZ0q5btyZjiLvfRBUKJTqCV0XmEyT/BA4d4fkxKF3/RSk+qxxmtJ?=
 =?us-ascii?Q?hxHJwyibCBQuH+jlSqOCzLY7C34S/VOmEGJObI8c2/+Im4xg33A6RyGzrZgo?=
 =?us-ascii?Q?Z+p8P0OuTR2tJhr70kV2ohp+Bx8KwcnDNxx/cELcWLwmP2iAxYwQeNi+gYRO?=
 =?us-ascii?Q?NoHG4HBxPJvK8UZI8NgMQJqGZdimvRttBvou8KDVhI0nY+bu7xfXA44aBBNE?=
 =?us-ascii?Q?Wj7STX3M7ZBx4y8m+ljgmlzmEY7P2+J4PpfTF1Oh1yM0j1Xb5LXSX9MEVpy5?=
 =?us-ascii?Q?yOGTS/2xtneKGW5Ex14iXrQjEloiJKgiJGIqhBJMtL7QghQAeGZowNWWhdK4?=
 =?us-ascii?Q?wenB/j4hM1yx0XjT0Jkke7RLgI4aHUm6X93TJNmqxENK36ySxRsGday5yfLy?=
 =?us-ascii?Q?ChjmJOlediIaWxp3mKUI1XEpWKM/EvITPrwjgv1Q1vJQXndECTp/ZFLV8aO3?=
 =?us-ascii?Q?Sg3MGNdvs7E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W7qFaPY5vatyOXxJ0ITT9PQzHhmrE9eBGJPUdTDDm2W8oL99pkrAW/gtgJ+j?=
 =?us-ascii?Q?TWHb55DxC8JFrfunYvlYgizY2EHukiNa4P2sO6AAouVkr6YoQnj2q7LMRz5P?=
 =?us-ascii?Q?kQMmmxt+LcHPDeX0oOFRFegbLM/UX7w+G6KnAIvSkhDkov80mLo9NPiUNYKv?=
 =?us-ascii?Q?p1cXP42ITze0Xc+MrwRTUiHb+BZMMnsCYXGjPnDgPwBIhpu6GWDhB1kn2KEF?=
 =?us-ascii?Q?xTrWOCOOvTVuMQBprw0lHHBUX7gds092B0v0qIJZ3htGKw8NAQ2lkKH9PVzb?=
 =?us-ascii?Q?BU0Mk6SCX2Dav5Fn/qsNBaOF9/642rbkBUl6Fp+NFBIm0EnviMIOtrvyHzHD?=
 =?us-ascii?Q?XpmCRZRlw/QpfT16yxz4SXOedRU/kdyMSAjRdNT2y/aOcfqNK67gB6GimCvi?=
 =?us-ascii?Q?gs8ioYkZtokG6tO31/WDAaGzqx/Ffa4G3+y76nbRCI/DmrpnklQ3zHL0JpFH?=
 =?us-ascii?Q?nhcGI1G6sgntpHM6bl+KGPXLlv2uS/jyyFMT9OwOr/LxQsv0x64zooYcZs3s?=
 =?us-ascii?Q?DUcMVqOm8XsQJII6MOmc2MLdqgmBdntpFQ6H4FjiwvV96BnIO0km8YE7ABdu?=
 =?us-ascii?Q?5uUPZuKmjH6HOc2tAS8UY5jkbeyXicWV7YRSjmORT5XwHw5poBBdvPBBYbP2?=
 =?us-ascii?Q?sHKzFJNYchj375N4dbR0NpfBDjbGzTreQ1KLTGG1+TD1CI0F4VAkHFiN+vPq?=
 =?us-ascii?Q?hoaMZHvWSzlxWorucR3O5VjVZtoIdolJQH20g9i6FGUlC6YEqQlB5eR0LzVO?=
 =?us-ascii?Q?oQoVPEqWFv0IfETBhHq10q8sETh4nliItJumbbaxXPRBS2dKISaVqSVkykuJ?=
 =?us-ascii?Q?79WLPOpG1MLbSfpnm82iQXYmVEXMhGTlWZ1qVlYWVNgXa5wGDslrGfKYCT1j?=
 =?us-ascii?Q?7okRfIjqH4seT2bfS7dBEGDv881vqO/4E4GKIxGxTgSNn+a1vvx8o5sBzYjL?=
 =?us-ascii?Q?fbgFmIklMGzB0JQXAGjKsMoXNU46y+E99gpsJAON1rxUNcQEfvVh8eheTv0a?=
 =?us-ascii?Q?mOYd24SI3JH0mwcY/95sPEhm8rItyNNJYbvtRdhfFxRKWGIZdNN9sGwKw+Ws?=
 =?us-ascii?Q?RgtEVZV4dUCGvIJB402jwwJ+180mbYwKsAM3DZQ54NllwY0Mb1dGTL4MvPUW?=
 =?us-ascii?Q?oWHvnsf9SxzrXZOGP0Gj+FgQc7D0ZjBZciEvcHCVTYPpPOmbKdDvWq3b204D?=
 =?us-ascii?Q?Ak433fjZOi5LXqBLTEDg2RWALU5h/s4HN9BfwracUwl9UGh76qDf1IDtnt/D?=
 =?us-ascii?Q?0EVZS/2WNNP+qPO2suXRoVIBGnqPfZZUTxeSimGwBs0xlzs1iSRaVXWXyQ6a?=
 =?us-ascii?Q?/nMOizb7FIAcAsfiaTKyXFweYoEJpIUWPpQ+1VFDftidmTEuyGDwmnYM7ZYR?=
 =?us-ascii?Q?EHN1GwOhER0UfG53KeVKLXwZ+PhE2cSIbsQXU/lK0BqjzF3g4A7+8IU4Vrct?=
 =?us-ascii?Q?9b+TJ3QTjzbzVP27dweksh0JBSdUXpw6GEjjASBi4sw50E/57AI2zYV3RHkb?=
 =?us-ascii?Q?aZJZA5hTxDs+WayuXdmLmV/p7vd4HWfj7MSLguiMHj3t1kT3JgDkjfOaZw7G?=
 =?us-ascii?Q?wJ1yVOUpNPJnezChQ2TwxWGxjZjc7aMTmH3fRkw4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ade956a1-9a90-41e7-fa2e-08dd913eb526
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 10:21:07.2054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYgG2tx+f3fDvMWPY7SADoK3eYNd8DZEFMQdiwV5MMGoitzW2Ql0GizFn/WKWBWX7ZIGV7n2gpUi0VF23PhllA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4C5964328
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

On Mon, Apr 14, 2025 at 02:06:27PM +0530, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> Map a memory then make it read-only and verify kernel out for read-only
> memory
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>  tests/intel/xe_mmap.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index 5fd641075..649a11544 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -338,6 +338,24 @@ static void test_small_bar(int fd)
>  	gem_close(fd, bo);
>  }
>  
> +static int
> +__xe_query(int fd, struct drm_xe_device_query *q)
> +{
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, q))
> +		return -errno;
> +	return 0;
> +}
> +
> +static int
> +__xe_query_items(int fd, uint32_t *items, uint32_t n_items)
> +{
> +	struct drm_xe_device_query q = {
> +		.size = n_items,
> +		.data = to_user_pointer(items),
> +	};
> +	return __xe_query(fd, &q);
> +}
> +
>  static void assert_caching(int fd, uint64_t placement, uint32_t flags,
>  			   uint16_t cpu_caching, bool fail)
>  {
> @@ -357,7 +375,16 @@ static void assert_caching(int fd, uint64_t placement, uint32_t flags,
>  	map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
>  	igt_assert(map != MAP_FAILED);
>  	map[0] = 0xdeadbeaf;
> +	munmap(map, size);
>  	gem_close(fd, handle);
> +
> +	/* Adding a Read-Only page check exercise */
> +	map = mmap(0, size, PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
> +	igt_assert(map != MAP_FAILED);
> +	igt_assert_eq(0, mprotect(map, size, PROT_READ));
> +	igt_assert_lt(__xe_query_items(fd, map, 1), 0);
> +	munmap(map, size);
> +
Unnecessary empty line.
Other than that, LGTM.
Reviewed-by: Jan Maslak <jan.maslak@intel.com>
>  }
>  
>  /**
> -- 
> 2.34.1
> 
