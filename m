Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333E4D2F349
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 17:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B023710E36D;
	Tue, 13 Jan 2026 17:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDbstXyq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219E910E36A
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 17:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768326601; x=1799862601;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zPRXH7Yo0Ktc522CMIcwbRPVSOOolzoleiF7QhGqFWk=;
 b=WDbstXyqylm/XLD9oP8CrYAtCI6vPf7Rl5wBwWxuVfrRhFBmYc3VLt7Y
 CRRwZ/lNvdC/BogQEZu8jgxTZz5OGCg1lS+SZON0hUeM4i4bOeA2epUuU
 RgLuCmXUc2UFveOHNlFtuUqtopw4IAivYRMXkN5Cq5D7KxByZiVA9+Y42
 aVk3vk1eNBxHt60mFoPKmkPP2mqXO8Kihu90Mze50dtOMGBFGXIaWpzKB
 DeGiVlq+1DbjLa0/nx7qGrLz1aGvuA4KfJLId+zx9GgbkplRPZok961T2
 EdSx/OL4Hz5je6l1RoRTfsjK0ZUcKYIJraw+5ewlLFgRc04MZZUdspTVR w==;
X-CSE-ConnectionGUID: TkXupX0nSkqJkPfA1+nk2g==
X-CSE-MsgGUID: UVFGKz90RQyiIujWoWkwDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73461791"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="73461791"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 09:50:00 -0800
X-CSE-ConnectionGUID: il0oKy49RYeRm4L/3z3H9A==
X-CSE-MsgGUID: bwsu3RBvTDSSaTGDAOPHvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="205043566"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 09:49:59 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 09:49:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 09:49:59 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 09:49:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILG3TYJ8MjIdKKwgU2DJ9kMeq+NliBfG1BnakSITCh61qsodK3mA4dIM+7xzY72SHkfu6HzNH/Gi3hcBWh9ja+xDbfpCaPvTcjJqlsB8q/QUpr7x4LHhO+yBDirst0aXmXnaJQunfaH4FnnNa3YD01YNJRmGm13ZAcDUESxW36Xt2vIQbxzmz7SJ1D1Nx4Kski/XHie4SHHOtrCuFvRcOgtfMKr1IIgN1blEaPaToPkmU4CebuZ+r7eQl0eCQWt+p0Onrk3Gy3xV2bg1tOWkcq6VbVjOh0LAV3S11ZU870gO88lpYXDkfA/hY1hH3mnqyo1vPybq1kTLF0pItCYfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4agN7UI13G8jiwYhucTdRHhflVcR04KQ1bs8dDTMBU=;
 b=Te+OlXqBY7mAzRgPiuXw/lBxdFG/vNCuQ+I6qR/hmxOxmO2/7I3gjFfSG0L8/UCKDws7VWImRarMbecxyyA+NhFZOjXe3qqJVHe+LCv31tvGxsZsBsLJe3RUrieL4KEEJfb5up5rvLjd3BYep70DnTPr1FT/KjN2JkCN0Dtc/kv5jLcrL2CrDxHtUt51T+HzTWkWus27fY+JRthItg7KRne6nubUsBkrZpkwincqTwCCa5IAUbYBCEChK7ZpVfgea3skGUyU64WBrzOw23K3JMTjq9IDWL/wuRAWqrwNct+KOYoSYs7Ebdf+cfE3eE24IPyqXeB2yX8DmthUXVB9mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by SA3PR11MB9462.namprd11.prod.outlook.com
 (2603:10b6:806:47f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 17:49:57 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b%7]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 17:49:57 +0000
Date: Tue, 13 Jan 2026 09:49:53 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v2] tests/intel/xe_exec_basic: Enable dynamic subtest
Message-ID: <20260113174953.GA139452@msatwood-mobl>
References: <20260113145314.331614-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260113145314.331614-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BY3PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:217::19) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|SA3PR11MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: c7115e41-d52d-4fff-5c61-08de52cc2a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7eJYAWtVTDDpV/0Vf8Y1+1sTYXeRTrtA0yNRX6urqqfmMSRLA3SgGrCXwHrZ?=
 =?us-ascii?Q?joz0e2HBPoU6YzV4w8EEvra8zyS3vHQlmgEOfdF8RMKgYFYygN90xX74dLXJ?=
 =?us-ascii?Q?r55texXQ9AuJTm3k9iIkK02J+r/08WKQyHRnLPfmSIdUBBi9ifHK35nfxM94?=
 =?us-ascii?Q?qUfbbG4hCBqI+txoFGpjNgGJU5OMscbfdfdoWNldSQAaA6QvvsyijV/9TPn0?=
 =?us-ascii?Q?7WBKj9Sn7nTXGHnPf9bNV4uAiovkJ9Ih2a0UDk9CQvLhui6y6jgHsfYww01C?=
 =?us-ascii?Q?5JHwwi/GO4o+xvv6TQhRKqix0TS+9ZFqZv02X6IyCJaK0ImzXyj6VqEmTfJX?=
 =?us-ascii?Q?W63z/1GFY01nfSThWHaVk9qEXg4zO4vcHhHEpuG+6+JLdHPXrAWJY/lHJ4Ht?=
 =?us-ascii?Q?rMCGR6GJ4sSm3nkpsMZQXkM/olMU74JebSH8Vrep+76jgZFRrBCglNrglxFk?=
 =?us-ascii?Q?bKjQxGXYcSrDlXw+PrJtvSOPvj/X2gH6sPPC+oGXUDBcUpJ+x8xCb0vHmcNg?=
 =?us-ascii?Q?heF6fI/bXCtdjR5kkEUkwjt7/vPXXEjJUHGHf+udNjDEqyb4P9mVQhWhwZoT?=
 =?us-ascii?Q?bL9rWYmMMjrG0NtFys+pG6Ckza6eYeHOG4XqQ5v9F28xaM7GNUanxZes3JXh?=
 =?us-ascii?Q?4KtecNIQyN7dNVyZJV/1bzJgqNOvd3uicCMDVudCmBqtcY7D0ZwyQ3hlpUE1?=
 =?us-ascii?Q?BrglICYTOsiRpylPuBUS2yZtWRv6TJgTipy7x4IQ4ixkmtkRaU7rf1scp5Vk?=
 =?us-ascii?Q?FL3K3k5nR9UfeQao+ifJpKJOINEonITO9Fo1GczzvwJF2dWnXFL82ZxzyUyI?=
 =?us-ascii?Q?nfaFBezW3hhJd4kFTahHX1mhfyMI2KKxkcUFgJ76Xyqb6bLQl0zXugAKQGTX?=
 =?us-ascii?Q?EBA+9wNMLVRvbgeCKPJJkpowvKwDSDeeXm++wXFWRm3XGKWxdhPR6NOcAJgU?=
 =?us-ascii?Q?a0m75AZd9g9cRb6Yx6sD8PP34oFEo7QdgqT0+heyHyNVE8cO8k6b6pAqoQ5x?=
 =?us-ascii?Q?h8XRg0fUikzbclSer9az6R2fugND0F9v+ZlcMHn2lVTacKyFD3gZ8DOj/qow?=
 =?us-ascii?Q?rtFCzKcAYpXU4Bn9oFXVnU0+YrwSLqWJ3ApVsz8rmkYV3FzCdTA97KuL7uei?=
 =?us-ascii?Q?TneC7dRB1nsW8sdpe3odBhWuShk5iYEisZ8wCi9aOsqO8hljL8syFsATzi2K?=
 =?us-ascii?Q?53FNt+FqjWWhYzXu75t0X3AnRazOIrgcCL7uG40l5Ryv5itcb4AkSKoI1FEb?=
 =?us-ascii?Q?Jy/cLVtvwQDEM2Kl0NEImQqrSnoQnj3mrUQNqmcINPLLdC3ddTDR8XWHS9Jw?=
 =?us-ascii?Q?9GAzhlL7UhRX/kUUxuqBJLtbJu2CTRdM0UGCalameqE5liP6nn64BjIwPiUJ?=
 =?us-ascii?Q?/tcilEWCJv6D0qv1b3uo0icJDOIqcCKcfQZWbNSWAAmDE9vXuSrY55gdkg2u?=
 =?us-ascii?Q?LaIyXQlA9gl2eq3KIwTQJLktwoepcMn8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2oLOcF7dtqzankkzQk2CAZWo32eDMw0sbUuHcPA0lMW2iDZznrBn7yGiv+KP?=
 =?us-ascii?Q?pFNFlwxBypPeTZVMB0fi6VeNHTX1lg7lcUVXPrIf9l0nMeApECPKsEas3owu?=
 =?us-ascii?Q?Z11w47LeSmYInIN/Rqhqu4fJ12V0Al86MdvWk8BIfim6v53mewW3c26rKWjT?=
 =?us-ascii?Q?km1jcerNkYOp1nM5YHis4zCsGnN/g2qJqFsYlAcv+3iaG9BKOim2gLYbwP8w?=
 =?us-ascii?Q?kFeFv+Fd5jmNxs2pc54m555Ptdg2Hwliuz9ZUGVuIqNlLJ1AN+KzXq2U24MZ?=
 =?us-ascii?Q?pcqzj51bcMIZphSiA4czLqMylvo69wtN/bVe926dU39hYFx5528DVUpcXBM0?=
 =?us-ascii?Q?VIgfIQEVi7xrkfKOZdnbiggany8z+K9Nx5igbIZpbcqFWTx6sYZYtWVaCQqR?=
 =?us-ascii?Q?i953c2aFgD51ELGtuz+IKaZYMZvKIYMx0w78mLLxf0/Zci5akVLZwjqP1OxW?=
 =?us-ascii?Q?mQNbpUZKxOQSIHumrG5s5EG9QDZxQ961Z0Hno++7fezE2AXSxV5pAEUkWE7P?=
 =?us-ascii?Q?XZzZXKZ6AlP09OamZuV2EwRAqQaRwQ172y7iAPHDRUKzpvHCsvyg384eMzAJ?=
 =?us-ascii?Q?psPEVvsgDvsFv4F3Yjo5/+UzfdbZLC1vC6bQyye9FN6sOw/1jZxEvZHZzw5N?=
 =?us-ascii?Q?ZNMlZa+yDBTCsINyagVtOOibGgyXaHG3CYJAjcb+4OcyjsXiOMN1H2YHRHr6?=
 =?us-ascii?Q?D6z9HpnRIEJhu7T7Wz3ZajjDDox8u14XHCMmmCX97AjX1SHN5zxwWqsxx5aJ?=
 =?us-ascii?Q?yCn6OO3Gn+2FFn1cJOLCpMOdeB523RULhagUmoJFmggdGjRJQoFInjYS68lT?=
 =?us-ascii?Q?Q7YdFSUUfhaAIGc/Kpgy+Binf5lZoH9CFCeKGOHpsqrZ42DF/Comv48JHyiO?=
 =?us-ascii?Q?x9g1mUftOUwquON1G+a+pvvF/EvL914XgZEQ+flZ3wMFzFV/cx6b7CbNf3i1?=
 =?us-ascii?Q?GN4r3SWfjiFVllFwJ7fD5sHIoLllaln6jiZ2UisJCpx+PBHtPSJeBlOgbpF0?=
 =?us-ascii?Q?7GWseCB91zR72sowYh/oBQ0ciZhEoJAgv3tQnmEhI+2qey4tu0sBjPYevVFj?=
 =?us-ascii?Q?UdEjsyAb9xB0facGkrofwCYWrZhX7K0UvRvU+XDq/UBgxRYjc404UgRhsRcS?=
 =?us-ascii?Q?jmW3d/uLv83vXzu1Pz0RUqSvi7UYyCcERpXQwCDKYAGkodUoR5hDOIx/ykLp?=
 =?us-ascii?Q?wVZYM3eS9WFR5mEbP93oTakQkeqLfnvj8Hf7Dc0EEvvdC/7RmCdfyXXqU/qO?=
 =?us-ascii?Q?nDcczIH4JEq84fLiiGOA5ioMBjkge8OBSG+T8pkQuoCGtDopE6YNgbngwBuN?=
 =?us-ascii?Q?PmUhuYAMslKEDO63NUFZiBU11tlgOv7MgOXntT6bDzL7IwZQQGjdhc6XEIJ/?=
 =?us-ascii?Q?nhopXhNS/7W1Y9xdCQWn+oYLhTn60PtXF1k23uJqNoSyV/akEascfg2kbswV?=
 =?us-ascii?Q?HqmsF+VETRICgP3DfoimLUQpv9DSw4IDm7TR+l+ry7otL5wfThUp3NNI+Gbx?=
 =?us-ascii?Q?cmjEJZaHrs2Aocg6vkKsV2ib4mAd+s1VQxTeiVIcseL5o+Z074z8OJhcINL3?=
 =?us-ascii?Q?5c3Mx1CL4jyDwcn3I96Xa5vi+4ntb1X/ywLRn12fVxD2Vd8ZlSD8MIizBICY?=
 =?us-ascii?Q?9bZl8JHGRDqrVTRxj5J26jmLY/jpjOrcR+ww7hamYyiwuwaWKZm3SFq0GAk4?=
 =?us-ascii?Q?0HuqmyjoAsvHfrhhNv199k7p/fP+XNWB1w1+zhDk3JA7u4igdQcGORlzbFAH?=
 =?us-ascii?Q?vCGq0qcaPILMckXcS3jS8Zng3J+bIsg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7115e41-d52d-4fff-5c61-08de52cc2a81
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 17:49:57.5509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0LTxYG8XMxKLnwityLo/OABG/ag8BEB7hVM/OsIfTRyGLkrKlWka1hgOFKlLL4KP0t8uelQaFa/j/9sgwwezjKBRjuct7nkFM7xuPovfgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9462
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

On Tue, Jan 13, 2026 at 08:23:15PM +0530, Balasubramani Vivekanandan wrote:
> Sometimes during debugging it is required to execute tests only on
> selected engines. Dynamic subtests allows us to filter engines for test
> execution.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
> 
> v2: prefix card index for multigpu tests. Otherwise runner complains
>     duplicate test execution when a same dynamic test is executed
>     parallely on multiple GPUs.
> 
> ---
>  tests/intel/xe_exec_basic.c | 63 ++++++++++++++++++++++++++-----------
>  1 file changed, 45 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> index b105455f3..5eda766c1 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -349,62 +349,89 @@ int igt_main()
>  		fd = drm_open_driver(DRIVER_XE);
>  
>  	for (const struct section *s = sections; s->name; s++) {
> -		igt_subtest_f("once-%s", s->name)
> +		igt_subtest_with_dynamic_f("once-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
> -				test_exec(fd, hwe, 1, 1, 1, s->flags);
> +				igt_dynamic_f("%s%d",
> +					      xe_engine_class_short_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_exec(fd, hwe, 1, 1, 1, s->flags);
>  
> -		igt_subtest_f("twice-%s", s->name)
> +		igt_subtest_with_dynamic_f("twice-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
> -				test_exec(fd, hwe, 1, 2, 1, s->flags);
> +				igt_dynamic_f("%s%d",
> +					      xe_engine_class_short_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_exec(fd, hwe, 1, 2, 1, s->flags);
>  
> -		igt_subtest_f("many-%s", s->name)
> +		igt_subtest_with_dynamic_f("many-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
> -				test_exec(fd, hwe, 1,
> +				igt_dynamic_f("%s%d",
> +					      xe_engine_class_short_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_exec(fd, hwe, 1,
>  					  s->flags & (REBIND | INVALIDATE) ?
>  					  64 : 1024, 1,
>  					  s->flags);
>  
> -		igt_subtest_f("many-execqueues-%s", s->name)
> +		igt_subtest_with_dynamic_f("many-execqueues-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
> -				test_exec(fd, hwe, 16,
> +				igt_dynamic_f("%s%d",
> +					      xe_engine_class_short_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_exec(fd, hwe, 16,
>  					  s->flags & (REBIND | INVALIDATE) ?
>  					  64 : 1024, 1,
>  					  s->flags);
>  
> -		igt_subtest_f("many-execqueues-many-vm-%s", s->name)
> +		igt_subtest_with_dynamic_f("many-execqueues-many-vm-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
> -				test_exec(fd, hwe, 16,
> +				igt_dynamic_f("%s%d",
> +					      xe_engine_class_short_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_exec(fd, hwe, 16,
>  					  s->flags & (REBIND | INVALIDATE) ?
>  					  64 : 1024, 16,
>  					  s->flags);
>  
> -		igt_subtest_f("no-exec-%s", s->name)
> +		igt_subtest_with_dynamic_f("no-exec-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
> -				test_exec(fd, hwe, 1, 0, 1, s->flags);
> +				igt_dynamic_f("%s%d",
> +					      xe_engine_class_short_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_exec(fd, hwe, 1, 0, 1, s->flags);
>  	}
>  
>  	igt_fixture()
>  		drm_close_driver(fd);
>  
>  	for (const struct section *s = sections; s->name; s++) {
> -		igt_subtest_f("multigpu-once-%s", s->name) {
> +		igt_subtest_with_dynamic_f("multigpu-once-%s", s->name) {
>  			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
>  				xe_for_each_engine(gpu_fd, hwe)
> -					test_exec(gpu_fd, hwe, 1, 1, 1, s->flags);
> +					igt_dynamic_f("card%d-%s%d", gpu_idx,
> +						      xe_engine_class_short_string(hwe->engine_class),
> +						      hwe->engine_instance)
> +						test_exec(gpu_fd, hwe, 1, 1, 1, s->flags);
>  			igt_waitchildren();
>  		}
>  
> -		igt_subtest_f("multigpu-many-execqueues-many-vm-%s", s->name) {
> +		igt_subtest_with_dynamic_f("multigpu-many-execqueues-many-vm-%s", s->name) {
>  			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
>  				xe_for_each_engine(gpu_fd, hwe)
> -					test_exec(gpu_fd, hwe, 16, 32, 16, s->flags);
> +					igt_dynamic_f("card%d-%s%d", gpu_idx,
> +						      xe_engine_class_short_string(hwe->engine_class),
> +						      hwe->engine_instance)
> +						test_exec(gpu_fd, hwe, 16, 32, 16, s->flags);
>  			igt_waitchildren();
>  		}
>  
> -		igt_subtest_f("multigpu-no-exec-%s", s->name) {
> +		igt_subtest_with_dynamic_f("multigpu-no-exec-%s", s->name) {
>  			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
>  				xe_for_each_engine(gpu_fd, hwe)
> -					test_exec(gpu_fd, hwe, 1, 0, 1, s->flags);
> +					igt_dynamic_f("card%d-%s%d", gpu_idx,
> +						      xe_engine_class_short_string(hwe->engine_class),
> +						      hwe->engine_instance)
> +						test_exec(gpu_fd, hwe, 1, 0, 1, s->flags);
>  			igt_waitchildren();
>  		}
>  	}
> -- 
> 2.43.0
> 
