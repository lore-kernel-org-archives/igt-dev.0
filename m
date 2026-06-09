Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E53CD8CAA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 15:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169EB10E332;
	Tue,  9 Jun 2026 15:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ulaj/ygr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEE610E33B
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 15:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781017854; x=1812553854;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rmv9vBJ+BW0/b7voJGF2Y00AMtAX1+MpiwZjtctaG7g=;
 b=Ulaj/ygrww8fD12wtAh10yByHi3n5YGDuFQfgHMvmLbYKJP67SS9pJ5N
 OG3GcbKQ4gX7CL+uVBdiHGzSaQtnuxkmu3U6Ovm10o6GC3xB8n6kbAz//
 2PqqvQmL7iJ1/1NhakWAwbmZvoBnqtkWtfqLDczgH3o6JS+oBtrPvjyyz
 MsnuIl0dVyTqQgWKOWXEcw4GZX4EoC7bRXrYN9OAG2s7QzzBAMKFndZEu
 6YlWhE27EjrgiSq9/rjCdH0/Sg6RL0mn75RhJVAHM+v1oM41kEid3KL5v
 IVA4ETuhV/g8G4RUQB2o9lVEJ4AF5jrPcJqwD5lS6R/ZqeGa78zzN289Z A==;
X-CSE-ConnectionGUID: 5MqQDdcJSxun+PtDdbeRYg==
X-CSE-MsgGUID: /22nRJzrQ7CNHo4Lf3S0QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81968259"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="81968259"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:10:53 -0700
X-CSE-ConnectionGUID: O2tSATK5QzWz9HxYIAy86A==
X-CSE-MsgGUID: NWhgw/fcRhOiSskp63Dp/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="239550297"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 08:10:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:10:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 08:10:52 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 08:10:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2HCxv1NEWOzNiinjFBsNov3BqAxae/wXB2D42lwstRjspIOvKeD9QGp2+WStFESBZ1v0fvAc/oREyyMuV75BhrDCrp+91ztQN+kyAHgTxkQIEUlIFqCgTc0Ez3PULDrD/oh7fMxNUIirh0Ii7w/4LPofP5f9xcd/mJtu24qDbQHYEPiChmX3RG4j/f8vwWXPF+JnMUa90+4mWBUmkUO7eUzUvkD9uuNwBDC5exRS6ZYTeKa0j2lo/GOSVRk9WADyKIHQOxP8crW4+6sSJS+VEX8nJCYjNa0aGZ7lIC4gQy+xRzkblGbISAzpSluY4dBzhIM0yfBBxj3LxYe8CCYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOfVNFdviInA9bZxEU0dCXVWjaNufqVqCCd6QWz2nn8=;
 b=azQn3cFOkdIva0krdAO1TTfZVkOHsAer+Hwh/nJHnxTsRANKZy/Xim3X3GnhSgH+jsgP4pvEOiwpCh+3bKCqdAm82PmnZRdZCwU9HwKiB+MaQ38OwAQIn9/+J/efgGMer0eiiuiYG5ELw2fM1iacfxTMjcChDCDaifuyZScQBrUAAquuwALH4Z/I5a6JtP8bAQ0+BKYOeM8njuusLcog4DNIJnSAG7ysAOlm77laXw4delNy36oty1uydv1Q/fc0V3sxGDd2lfqxU+05rd9/j2A8U5S3K/Y7HD3NdaUEn0YVXSlDkOdUfh6onJyz3Pwyv/hXPPLtFDwV/ztuBNbIQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 15:10:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:10:48 +0000
Date: Tue, 9 Jun 2026 08:10:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <jia.yao@intel.com>
Subject: Re: [PATCH] tests/xe_exec_reset: Replace fixed usleep with dynamic
 GT idle wait
Message-ID: <aigs9TbqfnfFOFhT@gsse-cloud1.jf.intel.com>
References: <20260608222252.2060110-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260608222252.2060110-1-x.wang@intel.com>
X-ClientProxiedBy: MW4PR04CA0214.namprd04.prod.outlook.com
 (2603:10b6:303:87::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: f7dd9987-3f73-4f18-4c31-08dec639499f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: gRKjOnTpg9k4Migmu9qZ708yXxTPNlUBiL3QWA7JbOz0AlmVhJxgIo3+0zRDmqAymg0yzvHJxv+1E0xKFGJxKhrLYnJvXPwITGnZm4ge05N/LpOCXVjE4dG3lVnVIWd6GpnnMyYnKAhAmw+TCM9G7jfBK7YvoOfZsaqhRTpWzMpeqdhl+uTfzy6k+jEjX2Cr4pEUGSIWvMwcLgGTSf7HIYmZifZwb59jxmLWHvu6ypAGDIcZyDe4h9HAppFshlpHmp40kiDBbnqEC9vyliqLZPmJSJo865j9RpDzlOZPHDtPLRsmoBLuf3P+PopMYw/rEAlU7Z1KCRvvZvF0q83fUsVEmU7dlfOn0c3MZz2Bcf8ZRC2C4uDbtQI0aIHvarujBySSFKCZbxN+xPSG8PiviR6mkUM3iEvC25GBsr4BGUOynbT4UTfT9oZ2OVeeOSLrvUVgXVcuU2ndzfoQ6CpjCN6RiFcm6JcRoh9kB6iAU2vjFoVmZo6KYbuqMuoySf3lL35d9xrUwwIVfaYCfGko/aeXf2R9G3wrv6GfD3JxL7QYO6OLTgMwh8KZprmtXEcuGoPK5zQwC8xcqvmEUHzE8rwCGuOCjqfkiU7Yuk4faOUQc3fy766d0Xyly/B3mmwx1dW+ReFAWJTtMoT+Jf6HCY5eabB1mx55QDeb2jNBtK2jVlxHDP1P+hYAD/wfyBiY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mXNq8brnIAag75vp3x5pYNP9F4BmyNur4frMq7PWmKRsF+tY2D5vwOjzh2sR?=
 =?us-ascii?Q?5jzTDZvpIYtt4hyb/l5/uVSJnnQRqyWvbLSj/sIILnaIQ6tk/YCI9WGY0BgZ?=
 =?us-ascii?Q?oDsINkPHkS6+DFBofDGSzjYKgNIfk5nooW7ZidHYAYjpTatR87/wCu5hL3L/?=
 =?us-ascii?Q?TLPs6b/22m+hMD1feMCDBnMAVOgTkRxpl3QLs/UivM83Wt/n1lb94c6Lc9P7?=
 =?us-ascii?Q?nqZJ7AO4RyTltk751X7J57+amT9GNqIMoVtlkg7LcNstVu39ISYyXI0TJBMH?=
 =?us-ascii?Q?i2JYpEOJlCnVosiQAYoDSWFQKgzhdJMRxA/WIt+u2Spcn0sWanWQTTmj+gtS?=
 =?us-ascii?Q?HbMzAN1Kp9APa+efN1lhxaZ2G94YxyZo7nfXl81CQ4kGwfSJiUeB9Fe89ur/?=
 =?us-ascii?Q?rQJC3Io/DEkDZamDIyRewT1Mlh/NIeV++ij6A/TzozzMnpYIpFGC8Ruii4Zg?=
 =?us-ascii?Q?VqtHgUbbYD5DLp9npNpuiMIDfS4uyMN/HI7jvwUvBFcSpmOmldYDVUas4nwe?=
 =?us-ascii?Q?fk6FX49VtpqYZOS3lPljFzBPebaT2P9rwP208lFkUNJO8YpQ5kyPGVmjdSWJ?=
 =?us-ascii?Q?NuWplZWd5FMiogAnDxBS1CQhCD4BvEDPG5H3b1KI/p2hFPup+ZWPswjKuaKh?=
 =?us-ascii?Q?ExSjKulOxjkvSa7KbLswptX+jx4GYYZgivFbeKaPA2WULcjuR83a3pav+VJh?=
 =?us-ascii?Q?Oiz1/5Drc1lXCtXA1Lun6K0Vzuen/+6q7cvtNJ/yLaP5W2tJAwFbuh/sNLql?=
 =?us-ascii?Q?hNVvd1qH84s31XL4LSbp2DCML2XQH1lSTnhc0+nN/xTieabo5KdzD67LEo4h?=
 =?us-ascii?Q?E4vGO5vf7ikJ9DHm0GrMSC3RLROMwQNBORqlir13Mletq/lFwQL0B4Gz94Dq?=
 =?us-ascii?Q?ZzPk8lN3rOhVAWIydgAYITRDeirIjen29crrkyaDvFwJLhBHIm+fA7CuBjsb?=
 =?us-ascii?Q?ozsvSvRSbmzu6JZQvdGJArykP+8T73olegITz9OEBQ1wdoA3Jz4QcqD8smRq?=
 =?us-ascii?Q?kyX3ftdEgscmtTdRnkcWImuRscjEVOx+M6Ag4zvdNT7zd5GP9Fr0W4gJUaDK?=
 =?us-ascii?Q?2YmyUvW8E7pc4zX1h9d2Y3QM83KvpZmnWgd2bCL9cRck6WPyhpUq5PTOQP7s?=
 =?us-ascii?Q?3RfteQjbPxga7cjyGEOPUywkKvJgmv+4eCQWo+tnZSimgMUyrWOb7X+MVvgl?=
 =?us-ascii?Q?y0JeD9ZbKuCJzmknBiiGJankZzxuPH45/Ld528JUbfcGUn2RA1NZpDa0iq/1?=
 =?us-ascii?Q?iTE3vGTTpbEFVcyPo8wbx7wXrwFqyyCcu3IYpBRRJH9BND/taIOYaU9MSCDZ?=
 =?us-ascii?Q?hXcZs56XvNao+nSV6eVV1xV9yuSBGHKrQk0Fs9QPKfQRXPQcT7AO4+rQoGUm?=
 =?us-ascii?Q?t7JsT0FnQOyQLmWVWke29KUVs/PzsGZdXDM4nombc0T90e3CDcXtF/MDBeK6?=
 =?us-ascii?Q?9lfIZwTdnuZ4TpKyuSVLTmU8KHENqq+10+0yzka51TT49w/iDZT7RKXcuA7P?=
 =?us-ascii?Q?Ya/7tkCTxIFkS6jFT9v3DRShCRsFlIMyg8rDLixPClWoHk3WtwyeQ0FALTsZ?=
 =?us-ascii?Q?9c4vmg7ERBluHzIO//mCCEmXHlvpR+N9oMZHy30goFid1aGU7LhBASmXFd22?=
 =?us-ascii?Q?oUv2DlTY4k5ArqjGHqsf9jFv8r5/AI/Qc+eJ7FDNcEECke5MVxeMa+s4uHQd?=
 =?us-ascii?Q?AhuPxBmjTI6EgTtoFxHce6z4u8QKunDIjf0jT/CFQ1gMzBij3OU+t54yoDt5?=
 =?us-ascii?Q?NSp/rWyFlw=3D=3D?=
X-Exchange-RoutingPolicyChecked: kQDULpUA2I/+GJVZIzwqY5xD2XsPHad1QTlVrLQx+uAiJjI07ixMFjaDWkSIRYL2DmuqkAvKwhiOzxEIQamwBr6kXGhkgPD6Q12DJI9gQvKpdKkcGPlFKTfjw5rH0gZRWI3IZ8CmsQ06vAQyQCct7sSNVVz8ULTcExp5GJ10NN6yUja5nvwBLEh3XNDAWjbdjMK4zbWlLBOPalXF836YrCUYwLDg3jX5AZTeG4LHsO+SgwicG0ot4Oz5ELeXXcs30rflv5Qf+hZRXDD3WQK1xDA60p/K0xRPVJmALOf98P0aBDZ+AUAuLtXlmhYoulf5Q4cL4O9TYladl87dkojs+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dd9987-3f73-4f18-4c31-08dec639499f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:10:48.5991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CadyYox7+4YuHS1Yu+iRclasHQmJJFUoilYgcDNbUPZnrbexah2zQZzHi1DihaavZ5WV4T4OdAHwfywYWbhFUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
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

On Mon, Jun 08, 2026 at 03:22:52PM -0700, Xin Wang wrote:
> The CLOSE_FD subtests simulate a user abruptly closing the DRM file
> descriptor (e.g. via Ctrl+C) while GPU work is still in flight. After
> closing the fd, the kernel begins tearing down the VM and releasing
> resources including the ASID. If the next test starts before this
> cleanup completes, ASID reuse can cause hardware-level collisions and
> trigger a cascade of CAT errors, corrupting the subsequent test.
> 
> The previous workaround of a fixed 150ms sleep was fragile: on some
> platforms or under varying system load, cleanup takes longer and the
> sleep is insufficient. Replace it with a dynamic poll that waits until
> the GT enters the C6 idle state, which is a reliable hardware signal
> that all GPU activity has ceased and resources have been reclaimed.
> The poll checks every 10ms with a 1 second timeout, adapting to actual
> hardware completion time rather than guessing.
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_exec_reset.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index dc1ae7e99c..12c2906800 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -157,6 +157,15 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>   * @parallel:	parallel
>   */
>  
> +static void
> +wait_gt_idle(int gt_id)
> +{
> +	int fd = drm_open_driver(DRIVER_XE);
> +
> +	igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10);
> +	drm_close_driver(fd);
> +}
> +
>  static void
>  test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	      unsigned int flags)
> @@ -277,8 +286,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  				xe_exec_queue_destroy(fd, exec_queues[i]);
>  		}
>  		drm_close_driver(fd);
> -		/* FIXME: wait for idle */
> -		usleep(150000);
> +		wait_gt_idle(gt);
>  		return;
>  	}
>  
> @@ -542,8 +550,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  				xe_exec_queue_destroy(fd, exec_queues[i]);
>  		}
>  		drm_close_driver(fd);
> -		/* FIXME: wait for idle */
> -		usleep(150000);
> +		wait_gt_idle(eci->gt_id);
>  		return;
>  	}
>  
> -- 
> 2.43.0
> 
