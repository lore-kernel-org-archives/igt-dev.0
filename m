Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A899FCA1013
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 19:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9E910E27D;
	Thu,  4 Sep 2025 19:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2kEYMJ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9C910E27D
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 19:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757015967; x=1788551967;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sdrf9OdNMMv9n3qThzwuCgXgB86BQYd4a3h7hgVQ32M=;
 b=T2kEYMJ/opHCsc7N2rLWROeEqCTBIGBqhVuRU77dADiKV8LUh/R/rxzg
 safe8Xn8il9uGo6jQ/VkvFQC6Z3Ogedkcn0K7f/TqjvKB06uSBhZaEY3C
 CBFibsR6Zz3C+fDofIhjT+dxhd+SCRJjJsX7GHRV3//lIXIj43+XmmFLv
 Gro0QeFLkUCORSO3pJoa3B2TJaN7gcm4LM6Ekmz5Emyz+er+e3j8CmTqB
 WhJnKeqNcz20hY+prEF7waVErPU6Ylp7l58gbeAWzFQuM/cPWtH2B6Vgp
 KAKTqW5aqKGh9PONEbrBuNsgy0rwquRD1PWLDSjK0OggzXaos/tFG7SPh g==;
X-CSE-ConnectionGUID: A4ZBRh1ERduW5H8cHIAUbA==
X-CSE-MsgGUID: uRZvLEzuQOiWptXSHfryiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59515915"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="59515915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:59:27 -0700
X-CSE-ConnectionGUID: 1O8vPfMaTBG0gZSAtZO1yA==
X-CSE-MsgGUID: A6GVfJIESdGLeK/Ochj0jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="172423599"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:59:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 12:59:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 12:59:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.76)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 12:59:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBZ2zscrQ3M0P7r8iEepXkkj4/7QCZdUNFznijStRFNoA1f/KQGO5doQa2Audnh1eoF/tywISXlqXIGkGIO9Q8tc9/mhWowDnvt8TseyxQ6nTnmeFNDXmoy5bWqdaq+K9nYa5+fnaTGbtwI8dD1HJzJgIwEHBi7GZwM+qU2pzDctU+omn/S1V11ma2LGNGUuMw9RlyAYVkAWEwFYj/PPtwkj6kzBrH4YedaT+wl5mxhW3GdO98cGLZqCeFzJXi5DaB1OZk8CWOSga1CYN07nqa9ngA9kcItXUF9QI3pt4AwxTe2zxUh438thUf8uGNuGsSGPdzr2Ktb3PZUF+PG4mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqWPzBGQ/mwFN0a6RiGNkibVBKd7g05xF5XS7L1qKw8=;
 b=SBSAVLbkGpBonOjgaTV+DYpgao/nMyQpTOCfZeOPsMhwO1YD2w2n4VbVIhiwm/d0Q8guoLrhqsD1q7L96q6UeP31DEI0jWIjl+eOXxKOLEuloY2Zxwy9CGORxSuQeLNpWFKgnLG2JP6aTapw3Lrjab9fYVw3QnRBUfWTnRIRhv6J43/kOnigsuizZj3097y1HUvDB25D3Kq/JmpqzV53gdk2xesuPytCwkHDI4XcVdlDDvEKxc2aoA9rkaDnwWqI1LNhw69F/0KoHd25fZ5w7NQrO4N7/U3CgU+/n2bFwM41F75jiYjdKJh8yYJdU0TnNTw+1NYxy/jrxEX00e/wAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPFEF71E136E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::85f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 19:59:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.018; Thu, 4 Sep 2025
 19:59:21 +0000
Date: Thu, 4 Sep 2025 12:59:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <nishit.sharma@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <pravalika.gurram@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v12 4/5] tests/intel/xe_exec_system_allocator: Add
 madvise-swizzle test
Message-ID: <aLnvl4yoMo17PXFr@lstrano-desk.jf.intel.com>
References: <20250904082701.2154029-1-nishit.sharma@intel.com>
 <20250904082701.2154029-5-nishit.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250904082701.2154029-5-nishit.sharma@intel.com>
X-ClientProxiedBy: MW4PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:303:b4::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPFEF71E136E:EE_
X-MS-Office365-Filtering-Correlation-Id: b4002ab2-1a95-4f45-a3b7-08ddebed8a5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6xGLdIJL8juZ4lhSC/uwjX/pTFBaaErcMfRU/GEo0nh2K/Te7ogkqSJOeEZQ?=
 =?us-ascii?Q?06vozqZ1w+aB0y9XySMIjswGk3TPp0LKgH4+VeeZCoHpYvKjCFAIpuSxAu1x?=
 =?us-ascii?Q?cDkK/MjyAlGokD2IsDU8VNvXeGZifErwNZHiH+XiyFRdPyhjasSddPy6oerz?=
 =?us-ascii?Q?R3Gs5u4Yo+kI80BGsEFBUb5M9rAlL22vHulfERKV+5yOTwcHJw9F9Ckd1+nq?=
 =?us-ascii?Q?BLAgYYaIVyDzJMPUC7+93FSYgvmhPzTBYyFrm5WkBYcdUjyxnNei2FMNlIm+?=
 =?us-ascii?Q?uu6LdB81o1BxByLa9esht4lZ9nEIwKLMx2qmzx90Vkrt/y8ocRh2lDhD+wjR?=
 =?us-ascii?Q?udFJuXSUwM5ppswQb9dkss6G+jPmmhHeX3M+8hN3nRAbSuOLQWNyZ+CnOVbn?=
 =?us-ascii?Q?dgBVeo6ezMejMyonoHB2FTVOw5Xmjly4f+rvsD46Y0MdPE6WAevxlLezyymr?=
 =?us-ascii?Q?oci5/deItOSz1znDwugOjzQ348sX16Ht+smoYkQE+P/sYsKoBamuzDPJY+s0?=
 =?us-ascii?Q?UvPuRQkuCfxRT2zOxtkwABEvtWZGHdnNIe8dinq29/5xfdf+oShdZCIwO5Zp?=
 =?us-ascii?Q?fsZ0h76bnvg+6AIUB1rjB6643yVgFrTDgN21z8/wvmF62HhjnsEBVnpnc3sc?=
 =?us-ascii?Q?QQna1nraXHUbUFDtulBrKCh/hwzbFC7lbcME3cIMyQtVQ/SE2sScK/EAVR0c?=
 =?us-ascii?Q?GMWPpkV77SlInYs5iCwED6d6or5OllkCSgn9ZYeupsSgZpRU+TuAabtBl+61?=
 =?us-ascii?Q?X3Y8RaGxKVxTOPhCww63oT7RvnE8LcgEu6+6P6Tq+NOOKl608x4ui2dytT5/?=
 =?us-ascii?Q?Cr1y/Jyv7XZIhfmBDCJfizniDMsc97j7TVvHRCVzyE1k17TB9I+91mJHf3JX?=
 =?us-ascii?Q?OTZqfCVuhFgiGiG9+FzPcP1zSKahiUHN6pwUwPA551dJF2Ih3qpeA9Vdfngx?=
 =?us-ascii?Q?HLyusEg8b3px3UauycxPg5MsYJd0YfuVbndcv8va3KRGXBCuK9yw39JwPo5U?=
 =?us-ascii?Q?05TI5F6i3I/+oqrhZJVf5y3lWP6GQWumDxf1YM238kcfAuULty+wvId5Z0ST?=
 =?us-ascii?Q?NqySAoOkgUXxp7L2AGQuA9FMkjBTrIyzYGMqa4dg9KwoiRmW+gz8wDAguxsQ?=
 =?us-ascii?Q?ePo3xXDOfRECATVNR6s2XfGsgqdl/JWNjgo9XQBeSVrlDqZi51XAuyggeDJn?=
 =?us-ascii?Q?biq/qvj5gkZ/8Cy1V47gEpd7GN5e2R4QS0wypKEg1Jb4Ivn0yfLvluZThQ4P?=
 =?us-ascii?Q?+Z7/ATg1GCnM/XOQ1s9KBpkUCZ0BQB6DQhJ6LssrqVl5/mogV9WeAFzm2fPz?=
 =?us-ascii?Q?widniDAePQtXIyqUyU35JoFdXOwxwirUIU5laQHfSXDn4G/hBVh4sFKKF9hF?=
 =?us-ascii?Q?HKlR0eZzFw0yLHQTCvWnwuPG5LYikis76UvLqV4nwe5ijXsrorxfwAOLehD1?=
 =?us-ascii?Q?mbizzC1vw3U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jvygHSkYJKwuvChitlXky/JdPMKzjIZIht6w4d9ZgPo6+jURsTBcyXgxzGEI?=
 =?us-ascii?Q?o1eviabtNmply7LZIEVJS6DXXkct2dj5r3JarHb4yIoNk3QaJJlxN6thKJ8Y?=
 =?us-ascii?Q?smbZFldNq8tzlqJWeJdWMDcOEWzjz+2F6aVD1DgtXY0pkZrpQ5RQ85WgX/R1?=
 =?us-ascii?Q?6FT+wySv81PNLp3IQ0NScTAm5RrpKqGcE/wa0sVmosbHLhEIzG9fuB+dJggp?=
 =?us-ascii?Q?XgwEObUhzmusrrfqDujhG6HWI3XmJkerOxjFc3+WoCfTkVn3SUIvvI1g6kwv?=
 =?us-ascii?Q?CrrrcEr1R8FlyUIOxi6ii3ZnjiUqYCKe0x99tVPjoLTEpxQSO+rDiK8NLAbl?=
 =?us-ascii?Q?umMWAcmU82RQfEYXshnEp2yG+vbuE2tgdAVffGkljs80S/c/rvClEcSqWKHI?=
 =?us-ascii?Q?qw5UMbpCQnVg4+silDINcnmRYd1bxN6pAN7VuuA69LzkoMDB0RL3a0Jsl9LS?=
 =?us-ascii?Q?D4xYMpg9cVfJdWnrAvlN6uqLdIZt0FfwVL1JZpKEhrUsiXey1MG0kC/I6/pp?=
 =?us-ascii?Q?BN8tsuvIQ2xituJPQrmALR3TZ1du6LNgVy8VX0y2HVPYveFqmekLufhbu3Kb?=
 =?us-ascii?Q?yHinhRUb2/sk2D7242f9Ae9ma1yLxXm2pkEeZrYnkJmH3MftFTWNpciqARjJ?=
 =?us-ascii?Q?gI0MzJJqCPc/m2GMFQ0lcNC4Ia37idhRtFGpYfiEHUebFUIRfhdZWBaZ8ZSg?=
 =?us-ascii?Q?czRaoiNMeufYKASbJC1WLclDpe4vgKU6zuVSSccimtldVNusEm5GrOnpM1L+?=
 =?us-ascii?Q?bggKIxfdUddj4TLf00BqJh7q/0qKMV7I8chHBnnCaFQ/S/dOnNoMiMMwz+sL?=
 =?us-ascii?Q?Ef/znr12dIPp6Wf02KTdVmuwaKxV0BA8ESGh/I1yDUIkBnX1U3blQHvCuDVN?=
 =?us-ascii?Q?+1FXPfNVZ5CO/oITGWPsI9AjDMm08PSxUBPJD3c2tGpf9ksh36egB24xoAdQ?=
 =?us-ascii?Q?YA1wbRAlOsdubyaz4dEYsikESWSptrWTBy537lg1djHuMQN+Hug7t2uhnHjN?=
 =?us-ascii?Q?NX17m8Os7l3wMxCGgZyFtc7fojE/v7Y5Zh3/apnKOeW9hiP504DH+cFvBMWF?=
 =?us-ascii?Q?kG5YK3gdTkEmCwCdrNnN6V038dvU7fL/nxmlPXmCvBrMprXLn4PppPGirKl9?=
 =?us-ascii?Q?rTB3y86t2+ulvQow9hHGCuTxseRuVLhoHITMfCeGyVf+Bb3khiHHlCxVqO0S?=
 =?us-ascii?Q?V8xv4uZWN3TdgtZnordxr8sZx8CcywYb0VA8A3icLoLOhOg/DLRnejbKoJxL?=
 =?us-ascii?Q?/DlJEPfYGCnX5jh6p29MD94RytWxQuvFf0ej8g7t+1UChS9EOPYbX6OecCyV?=
 =?us-ascii?Q?mNyQloTlZKfJiUkoRaRNJSnVE9gIAYPG4FTdqh3oyPzH58cL2JAhs24e037f?=
 =?us-ascii?Q?c5LC4gR8eowfLDBK4ZHIWewECIJiUPwA+E6BHtHg0StHaOeDj9WKt35Jybrb?=
 =?us-ascii?Q?auRWsvIwxa8k6CgjR7lgl5SBqUgSo5Ix/aC5d/f31U+7hRpGiORa6oGpOnGL?=
 =?us-ascii?Q?IdMKFVLh9MR1xlse8MR6uvXwenX6kJlqsTRA2mXxAiD5ZOLDPf9XfI28BBwF?=
 =?us-ascii?Q?xtYtW6iI6dQsnnKmfqnapaow/PXxuWpwGEwiFc/KqzMIa65pPVKY1u+h+kCm?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4002ab2-1a95-4f45-a3b7-08ddebed8a5c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 19:59:21.9116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9hgVJgkQT9DorDL1vZlub5gHM2/clp3TczMV/9lGIwiSOBduKiHPgaJyWWXtDUz8Fto7ov01p7F+C8v5HedUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEF71E136E
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

On Thu, Sep 04, 2025 at 08:27:00AM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> madvise-swizzle test introduced which is called in combination with other
> tests as well. In this test the buffer object preferred location is
> system memory. MADVISE_SWIZZLE called in main loop to toggle between
> SYSTEM/DEVICE on each pass.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Feel free to merge the first 4 patches in this series. Reviewing the
last patch may take a bit more time.

> ---
>  tests/intel/xe_exec_system_allocator.c | 35 ++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index e7f3d423a..8d9696a33 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -777,6 +777,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>  #define PROCESSES		(0x1 << 24)
>  #define PREFETCH_BENCHMARK	(0x1 << 25)
>  #define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> +#define MADVISE_SWIZZLE			(0x1 << 27)
>  
>  #define N_MULTI_FAULT		4
>  
> @@ -885,7 +886,9 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * arg[1]:
>   *
>   * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
> + * @malloc-madvise:			malloc single buffer for all execs, issue a command which will trigger multiple faults, perfoems madvise operation
>   * @malloc-prefetch:			malloc single buffer for all execs, prefetch buffer before each exec
> + * @malloc-prefetch-madvise:		malloc single buffer for all execs, prefetch buffer before each exec, performs madvise operation
>   * @malloc-multi-fault:			malloc single buffer for all execs
>   * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
>   * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
> @@ -897,6 +900,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * @mmap:				mmap single buffer for all execs
>   * @mmap-prefetch:			mmap single buffer for all execs, prefetch buffer before each exec
>   * @mmap-remap:				mmap and mremap a buffer for all execs
> + * @mmap-remap-madvise:			mmap and mremap a buffer for all execs, performs madvise operations
>   * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
>   * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
>   * @mmap-remap-ro-dontunmap:		mmap and mremap a read-only buffer with dontunmap flag for all execs
> @@ -916,16 +920,20 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * @mmap-file-mlock:			mmap and mlock single buffer, with file backing, for all execs
>   * @mmap-race:				mmap single buffer for all execs with race between cpu and gpu access
>   * @free:				malloc and free buffer for each exec
> + * @free-madvise:			malloc and free buffer for each exec, performs madvise operation
>   * @free-race:				malloc and free buffer for each exec with race between cpu and gpu access
>   * @new:				malloc a new buffer for each exec
> + * @new-madvise:			malloc a new buffer for each exec, performs madvise operation
>   * @new-prefetch:			malloc a new buffer and prefetch for each exec
>   * @new-race:				malloc a new buffer for each exec with race between cpu and gpu access
>   * @new-bo-map:				malloc a new buffer or map BO for each exec
>   * @new-busy:				malloc a new buffer for each exec, try to unbind while buffers valid
>   * @mmap-free:				mmap and free buffer for each exec
> + * @mmap-free-madvise:			mmap and free buffer for each exec, performs madvise operation
>   * @mmap-free-huge:			mmap huge page and free buffer for each exec
>   * @mmap-free-race:			mmap and free buffer for each exec with race between cpu and gpu access
>   * @mmap-new:				mmap a new buffer for each exec
> + * @mmap-new-madvise:			mmap a new buffer for each exec and perform madvise operation
>   * @mmap-new-huge:			mmap huge page a new buffer for each exec
>   * @mmap-new-race:			mmap a new buffer for each exec with race between cpu and gpu access
>   * @malloc-nomemset:			malloc single buffer for all execs, skip memset of buffers
> @@ -999,6 +1007,23 @@ static void igt_require_hugepages(void)
>  		      "No huge pages available!\n");
>  }
>  
> +static void
> +madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
> +		size_t bo_size, uint64_t addr, int index)
> +{
> +	int preferred_loc;
> +
> +	if (index % 2 == 0)
> +		preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM;
> +	else
> +		preferred_loc = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
> +
> +	xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
> +			DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			preferred_loc,
> +			0);
> +}
> +
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, size_t bo_size,
> @@ -1210,6 +1235,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		if (barrier)
>  			pthread_barrier_wait(barrier);
>  
> +		if (flags & MADVISE_SWIZZLE)
> +			madvise_swizzle_op_exec(fd, vm, data, bo_size, addr, i);
> +
>  		if (flags & MULTI_FAULT) {
>  			b = 0;
>  			for (j = 0; j < N_MULTI_FAULT - 1; ++j)
> @@ -1790,7 +1818,9 @@ igt_main
>  	struct drm_xe_engine_class_instance *hwe;
>  	const struct section sections[] = {
>  		{ "malloc", 0 },
> +		{ "malloc-madvise", MADVISE_SWIZZLE },
>  		{ "malloc-prefetch", PREFETCH },
> +		{ "malloc-prefetch-madvise", PREFETCH | MADVISE_SWIZZLE },
>  		{ "malloc-multi-fault", MULTI_FAULT },
>  		{ "malloc-fork-read", FORK_READ },
>  		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
> @@ -1802,6 +1832,7 @@ igt_main
>  		{ "mmap", MMAP },
>  		{ "mmap-prefetch", MMAP | PREFETCH },
>  		{ "mmap-remap", MMAP | MREMAP },
> +		{ "mmap-remap-madvise", MMAP | MREMAP | MADVISE_SWIZZLE },
>  		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
>  		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
>  		{ "mmap-remap-ro-dontunmap", MMAP | MREMAP | DONTUNMAP |
> @@ -1828,16 +1859,20 @@ igt_main
>  		{ "mmap-file-mlock", MMAP | LOCK | FILE_BACKED },
>  		{ "mmap-race", MMAP | RACE },
>  		{ "free", NEW | FREE },
> +		{ "free-madvise", NEW | FREE | MADVISE_SWIZZLE },
>  		{ "free-race", NEW | FREE | RACE },
>  		{ "new", NEW },
> +		{ "new-madvise", NEW | MADVISE_SWIZZLE },
>  		{ "new-prefetch", NEW | PREFETCH },
>  		{ "new-race", NEW | RACE },
>  		{ "new-bo-map", NEW | BO_MAP },
>  		{ "new-busy", NEW | BUSY },
>  		{ "mmap-free", MMAP | NEW | FREE },
> +		{ "mmap-free-madvise", MMAP | NEW | FREE | MADVISE_SWIZZLE },
>  		{ "mmap-free-huge", MMAP | NEW | FREE | HUGE_PAGE },
>  		{ "mmap-free-race", MMAP | NEW | FREE | RACE },
>  		{ "mmap-new", MMAP | NEW },
> +		{ "mmap-new-madvise", MMAP | NEW | MADVISE_SWIZZLE },
>  		{ "mmap-new-huge", MMAP | NEW | HUGE_PAGE },
>  		{ "mmap-new-race", MMAP | NEW | RACE },
>  		{ "malloc-nomemset", SKIP_MEMSET },
> -- 
> 2.43.0
> 
