Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659E2C982DA
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 15:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164B010E934;
	Fri, 18 Sep 2026 15:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KtV7rLwa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95C610E934
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 15:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789743760; x=1821279760;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=VK3Mq37ymZi7px/5IGUAKO0zYF88iQcRWpJ2iaU30OQ=;
 b=KtV7rLwao4ZC1TO4jmTT/D/aG9HucMeXPGh7kgfnJeGk73nLUOJVXsUO
 5VXuefjTxMbGChJLFsYwPLh/p1I4nUI8fAW+QkaOHYsxdbKRMvWAQ4ttV
 MI8elC4roaJ3p+dTA0o+41Da9SlGWYT1MXlV+rJ0eOW9tqrw3wTRS7Lw6
 b50GMtadJs308tCKVAAvjXByCT+ceI0FkxPsBYdUWf6P06IS5pwJhxG40
 AXNEG+KGdwb3gH4LJTpqTCS45/qdFxn3TZ8JTo61V8tgs0k4L6lfJeqDw
 rKQZh4mxXFRaol0kmHUJLk//2C8J9smNDFjWrDEC3LYnqa6FBWyn8m77e w==;
X-CSE-ConnectionGUID: zFciBTzhSUiM90PIRgvMdw==
X-CSE-MsgGUID: xBSqnSKnS32qzDgYofrFrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="761492"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="761492"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 08:02:40 -0700
X-CSE-ConnectionGUID: +eN3Yc0qRDiqbMchV03l+A==
X-CSE-MsgGUID: lvWYoc4iTqeHCW8aw3dE3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2672012"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 08:02:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 08:02:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 08:02:39 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 08:02:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfhnYrXXklDDypDQ9D2sAVJYhzBIt44Ji89P3HU5edH7m/uG4MdHmCtA3mW1cM1gy0njTTV7+VWcB5MpPbfBuvaGaIkEg+SatJ0jdUP+mXGFiwVYwbITVzS5lCv1scBVDy6FM+GnCkOjxXDR5kQTaH+rI9cnpSR23IfU1/eEKYhLGS/IHEdMFgPZMwnzkIKjSHU7yX+KxS35Rj4ys7KdtunzY5rtkdk2R0l9vXKLGvSwKMysBp9u8qI/qJCo1J2SLtxVzKaxSenLR7RleyB1MkCjIx1TZpav2Mrx0J2jjutdwyLcu7dsQDGGU9IBYqBTsLodKMSCAUA5HhQ3iQJapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FASZISSaKEFD3YiPtuyB4ozKl2r8uJkuUD7O+gU554=;
 b=olTxd1TI00AaHLoMFnxHjpy7fk7h34s7rTN6lrLrp0ORsJT/rQRg/TTPwed0B3cvp4vUe+sg7M4q3TqWMoSm+Wb6LhTauEnL3NmMgXNDZGTPKfqyjM3O9+yiEg98OSHsjlZoHR/ShvqB2QyTiJOmw5WoPZiPVDJFhmwWjC6AobjaFLl+zDUFNqe2V6gkAvkGTaw2db+I15PivDMj4pfvKye6aw5NDW6B6MAAUZZzyEt5nCJoliex9QidMdzhbLLgyc4+q5XllwLCElF/26bGUlfUPvNw/gEsz5sGGoapJa0JxhUAjXGPrKlIyeLd9KhCosxwN3s4LHFs/RliIoQSZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 15:02:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 15:02:34 +0000
Date: Fri, 18 Sep 2026 08:02:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_tests=2Fintel=2Fxe=5Fpmu?= =?utf-8?Q?=3A?= Ensure
 stash_gt_freq allocates sufficient storage
Message-ID: <20260918150232.GE730887@mdroper-desk1.amr.corp.intel.com>
References: <20260831204455.1242947-2-matthew.d.roper@intel.com>
 <178834360508.112571.9204811399147748983@61270ab9df2a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178834360508.112571.9204811399147748983@61270ab9df2a>
X-ClientProxiedBy: SJ0PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: ad5aac79-55f6-4413-7cd2-08df1595dec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|56012099006|11063799006|5023799004|4143699003|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: MGeQ1/Sf9fIfc+jnQZOqdMFf+s6qXoMAc7BOHGv2h/v8N32J/rz+inNE2SDhlijvRw59ne/RebJmGDKcbtb25eX/pWEXXizAQe3yU8fF5WZbxIcMjVl7ITnUARDGp6Fjm+0IYOEQGZtgfipG0b6uIKPu0uXANK1j+VydPE95eNNggQG9TI0sxdYR33xWumLjvVfqLk08CyLoequBJxHx5FBqdu86aHBwOycTqFwCrdP/8BJGPzteP0hapFiMmsIoKnrQEu/ixb+ALq70E+W3jKT69FD2GdMgV+euTCvN9GayVVtacePrQ717hj7av61MTyWMBWqKL9BzRso4wN4fXCXMWWUh3oeK1h1SWNYyIIUewHUGvB/Bnp5EK9visf0VC0cygy497kIp7HuLgrTPLznrAW+W0ogqdRH7hOSK12OeO/JbqBxQuvcl4fGPj+uCDOTQAA5r1Np0W6w4i8CquDd4TtfJYoGZCVrDdaq4o2vnW+xE2MX8zEb8CqWjJ44SIKbzYTCVYOQOxbM7UipIa0j6nc8XxB5IfX/AaOALbDSoEDvIQZ/22A/C6x6Bb2cK97vnnin+Th7aICz7SU/L1EWYHgSMsspCYa+dJmv7EIA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(3023799007)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?biLKVbTmctRf26IeltsE43CenG+F6LPoIapMSp8n6xqX2kLVuPoV/uiJktCk?=
 =?us-ascii?Q?lqFT6MFjL9tNFYUmO9Q3y1eYR/TJTz56ZBR7oG42SFT6hoJvnq3KhA1Z1x8p?=
 =?us-ascii?Q?Wv2C5E3plzoSPaIxHIGdGVhg3BIujd9Q673Ukx01k1cI/ylQWLkQCSMesAii?=
 =?us-ascii?Q?zn8pfYVJUhKEszpjSFsWjPcqUCLYL/ObUSAmxzRBiOKMeaYx9SLM7pBfG0Ak?=
 =?us-ascii?Q?4bzq146HZoPEs+JTor7/6OchP6tx2p/yerWga3Md6I+tVmMJNHmu+TnJf9Z7?=
 =?us-ascii?Q?zWevI2xc5jmhSKKtC9WNgJRi/TNfoOtiUYdbW4uiE3fNkIb8q4FEPWM9eWsn?=
 =?us-ascii?Q?oehtmDGK4tZ2a+LYbu1n5cdxPBSaaeEaVNYLjuMQIzCmxnBSPCuYShuJHL2j?=
 =?us-ascii?Q?v0Q6nJLJcoK+Gab32QRuW7z2nJ3omMoTagJCO8zPDSnj0AEyYl1hXd48sKiN?=
 =?us-ascii?Q?QOfUiFDMXoCee7SyLlKmv2NKNI9SZTDeid1mNFUpYkZghw/b1FuSFm0n3lWd?=
 =?us-ascii?Q?kw/tksXVMok+084+U1RK2dZYp93zm8uBLw0E9d8ESGlQ5zjN/IPkxZMlOg0E?=
 =?us-ascii?Q?T5mDnLIl5mJOe0Dg+rOkOzq0yXuoWcpaz4JFrGlq7nBbE/GizCRDibRRQcVJ?=
 =?us-ascii?Q?vVtlVVK0zQHu56QlISpepVmP1sjJctrAGkHKibT3kJqc58R4ArlKBerxxfCE?=
 =?us-ascii?Q?xjiGv4HYDH/orRI/9TkLMrv8LvJDwT+yiGq/QQTANtyyCIieGSkFY/7VvDBM?=
 =?us-ascii?Q?ZmyQaJijS2dNwnSPLMHL77Xa6ofvcMkXWscKfK1utDUDPoQQYag20NbUXmFz?=
 =?us-ascii?Q?v+aGEoy/p+NRlglNMcNJbOGcYV9ThMcJ73ST3BYbalsBC3Qj6IKPmwNheKfx?=
 =?us-ascii?Q?NZq0F1yg1fTGRCcEpVV1R6jl44Yec+oj/wealzZZhb4ZvM4FMhQx2KFuJW67?=
 =?us-ascii?Q?uOXAUbjzjLqJ+SWFq/Az+ngOG8s1Bai0VERJzPakGf1RbJyGsonSGtIFN0nE?=
 =?us-ascii?Q?MEt48A+Apx2g0AojMJeZSctiX1OKmpU0ZHG2LG7fYtoH9v0Fz12akphVr3TK?=
 =?us-ascii?Q?XB3BAYWzDvixHHTylUpgI92wK9c+6C5c1l9S443ibC9CCMs1s+kzYn5gR3Pf?=
 =?us-ascii?Q?MQWbZ4E5I877cbmq5Cqm6cIHMbwNZLyCjr/bwSPl/l8SiaPm7uIW1HsUAW6h?=
 =?us-ascii?Q?61KgCljfyLeEicSV6RBHCOqpgqgibSerHvc1FJDmRsD9R6v0GyJtPswUjFE/?=
 =?us-ascii?Q?V6ojIMGEiafsq/DpewbPw+WxyFgrUA2OGZkpeasGC8tM7NtTS4zlSHRvQ2PW?=
 =?us-ascii?Q?y/T+DJ7ozVR5LXFnrdsj0tCk46STMW1DBWBZx054LK9OAeDbGhEMWWsn3dmM?=
 =?us-ascii?Q?BDOOPUg605ahNXhOObJtprveiqgV4a0i1fueCDDKjxoGffrjhuhvQ2vxp40P?=
 =?us-ascii?Q?0ryThpfXQ+ik800ReJs4a/cG5VUm885wyLj3CMUi/QAaq/1uy0CEPig1DOMq?=
 =?us-ascii?Q?QUUvFWwRNFkCa9fBnwsN6CZknhCrHvMKhM3vulv3khPbpFlQ6PqqcubyXFzO?=
 =?us-ascii?Q?DhtMSUNuFVL1TsAGxtzTjOJD2AywA2xAphdNhScMPgf4v+RxUePRlktGN0JG?=
 =?us-ascii?Q?BEvT/AYDtPEXy9zmjUbacRSUnB/JJj19Lg8FG4m0FXIxHy7rmWU4yBrrCwD1?=
 =?us-ascii?Q?7xcfgL9yP1eAo91NS7NGrCnJohck37fNRvCPLhjeCAhnvTH7S9RjuXRLuM9u?=
 =?us-ascii?Q?VpnbNmO2ZtqTXH+iDoPNwGWnPZq0RLI=3D?=
X-Exchange-RoutingPolicyChecked: jqJ7DTIN708G/tLAotyxXcsbuabp/40KxTfQzbjsLCulNED25NKiKirNy9tb5i6Mdgmd1IqcCWe0Tmqxv/15XOKkGJUwIWfpmdWRtwZkw/YBy7xk0d5ig6YqfQy4CsSULxZoNczO3oOHr7IpHxoJVp58UXk42EO7mvoUP21WRfHjtKSPgsWV2TRDrc7S17r29liHgRar/JQnTV450gqMjMcm+W3SgJrSyXIehYW9sZADKLHqoQzjeJd+fcggSnGkyxkMC4dh2lQghm7Lswob3mDV6HFJMTzYHldirxqzrcydRAmgYsGCkQK0F+7MLKM6NwyrT8yCuyS6RORuhrDHGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5aac79-55f6-4413-7cd2-08df1595dec1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 15:02:34.3292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvR9PTOor0AxxbopMrO6SdwEMjtQCXFmOY4JkhxcUX/kHccEYmYdqLN6143fzs4SP09K6ynm9sPwoFfuObqGfJJBbo1uSmllHAkELB3HJGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
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

On Wed, Sep 02, 2026 at 10:06:45AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pmu: Ensure stash_gt_freq allocates sufficient storage
> URL   : https://patchwork.freedesktop.org/series/173093/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9079_FULL -> XEIGTPW_15762_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15762_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15762_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15762_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pm_rpm@system-suspend-idle:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-1/igt@kms_pm_rpm@system-suspend-idle.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-lnl-2/igt@kms_pm_rpm@system-suspend-idle.html

Warning from the kernel about slow GuC load.  That's unrelated to
anything userspace is doing and not caused by this patch.

Similarly, none of the failures reported in i915.CI.Full are related to
this patch since those are all in other tests running on i915.  This
patch only affects the xe_pmu test of the Xe driver.

Applied to master.  Thanks Kamil for the review.


Matt

> 
>   
> #### Warnings ####
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-lnl:          [FAIL][3] ([Intel XE#7949]) -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15762_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2328] / [Intel XE#7367])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +7 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#610] / [Intel XE#7387])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2652]) +8 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#3432]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +11 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-7/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7358])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252]) +7 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2390] / [Intel XE#6974]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-6/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2321] / [Intel XE#7355])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2320]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#7809])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2286] / [Intel XE#6035])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#8265]) +3 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#8680])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2373] / [Intel XE#7448])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-10/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2374] / [Intel XE#6127])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-9/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2374] / [Intel XE#6128])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-2/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [PASS][28] -> [FAIL][29] ([Intel XE#3149] / [Intel XE#3321]) +1 other test fail
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [PASS][30] -> [FAIL][31] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#301])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4141]) +12 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2311]) +48 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7061]) +3 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7399]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2313]) +53 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#7308])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-10/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#8303]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-4/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7283]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2393])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#5020] / [Intel XE#7348])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-7/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-framegap:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-framegap.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#8396]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7794])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#8399])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@package-g7:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#6814] / [Intel XE#7428])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-4/igt@kms_pm_rpm@package-g7.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1489]) +6 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-psr2-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-4/igt@kms_psr@fbc-psr2-basic.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2330] / [Intel XE#5813])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_sharpness_filter@invalid-plane-with-filter:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#6503]) +6 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-4/igt@kms_sharpness_filter@invalid-plane-with-filter.html
> 
>   * igt@sriov_basic@pf-unbind-with-vf-probed:
>     - shard-bmg:          NOTRUN -> [ABORT][59] ([Intel XE#8868])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-3/igt@sriov_basic@pf-unbind-with-vf-probed.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2322] / [Intel XE#7372]) +6 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#8374]) +14 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#8364]) +26 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
> 
>   * igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#8369]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-6/igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#8378]) +6 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6964]) +3 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html
> 
>   * igt@xe_page_reclaim@boundary-split:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7793]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-5/igt@xe_page_reclaim@boundary-split.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1420] / [Intel XE#7590])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-8/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pxp@display-pxp-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-6/igt@xe_pxp@display-pxp-fb.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#944]) +2 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-bmg:          [PASS][70] -> [FAIL][71] ([Intel XE#6569])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   * igt@xe_sriov_vram@vf-access-after-resize-down:
>     - shard-bmg:          [PASS][72] -> [FAIL][73] ([Intel XE#7992]) +1 other test fail
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-5/igt@xe_sriov_vram@vf-access-after-resize-down.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-1/igt@xe_sriov_vram@vf-access-after-resize-down.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
>     - shard-bmg:          [FAIL][74] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][75] +1 other test pass
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - shard-bmg:          [FAIL][76] ([Intel XE#3098]) -> [PASS][77] +1 other test pass
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [FAIL][78] ([Intel XE#301]) -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [ABORT][80] ([Intel XE#9093]) -> [PASS][81] +1 other test pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [FAIL][82] ([Intel XE#8399]) -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-bmg:          [FAIL][84] ([Intel XE#7992]) -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_exec_reset@gt-stress-reset-bo-invalidation:
>     - shard-bmg:          [DMESG-WARN][86] ([Intel XE#8649] / [Intel XE#8652]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-8/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-8/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html
> 
>   * igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-eocheck:
>     - shard-bmg:          [INCOMPLETE][88] ([Intel XE#8159]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-eocheck.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-mmap-remap-ro-eocheck.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-bmg:          [ABORT][90] ([Intel XE#9101]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-5/igt@xe_pm@s4-vm-bind-userptr.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-8/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-bmg:          [ABORT][92] ([Intel XE#8591] / [Intel XE#8963]) -> [DMESG-WARN][93] ([Intel XE#8963])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9079/shard-bmg-3/igt@xe_wedged@basic-wedged.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/shard-bmg-4/igt@xe_wedged@basic-wedged.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
>   [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
>   [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
>   [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
>   [Intel XE#7949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7949
>   [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
>   [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
>   [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
>   [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
>   [Intel XE#8591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591
>   [Intel XE#8649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8649
>   [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
>   [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
>   [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
>   [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
>   [Intel XE#9101]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9101
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9079 -> IGTPW_15762
>   * Linux: xe-5668-b8f17b16c0f8638b9df4f090511e3ae97210eb77 -> xe-5670-97649417ea562630ab357dbea25f153a654b61c6
> 
>   IGTPW_15762: 0f509951c9c45e609662715ce2e39c8f511ce563 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_9079: 9079
>   xe-5668-b8f17b16c0f8638b9df4f090511e3ae97210eb77: b8f17b16c0f8638b9df4f090511e3ae97210eb77
>   xe-5670-97649417ea562630ab357dbea25f153a654b61c6: 97649417ea562630ab357dbea25f153a654b61c6
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15762/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
