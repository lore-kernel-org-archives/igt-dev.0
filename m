Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736B5C27C65
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 22:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A2D10E23A;
	Tue, 11 Jun 2024 22:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmCMZy0k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7204310E23A
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 22:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718144274; x=1749680274;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=otkMjDxo5eS8czhvDjd1f1lychZdUGOoI2Tw9bCCyYo=;
 b=LmCMZy0kixt1RdFU5vhBA9grrLHvyLl5yTfx3O2OQmuUHjkR+jhbepY7
 dvkbE7c5+8/931OdCsiBYlnLlXJZhWh34/+gdzYc46qtr8b4BMgRhGN9u
 mReAIzsfPkIcq5K3W0tUWe8o/gPMyujP5hZudpMI1CcVt76+CY3SwRZH9
 er/7A2NYxDmKpnEGLmu2BATB1PXbqLSjPvulOBbViQlXqOU1rQH9CTdAl
 FZ4SMHUXyd6UDkgMQAGag7iEfRdSW1qgIEoM1oIp2NdDOiRK0IBapkSx8
 Jx3Blte+NyMHgCL5P6XJqqHvCfBE4crl//tJhhRsOvpZgI598j55SLk7y A==;
X-CSE-ConnectionGUID: NbJYlnqUTDOvZRR2YD/00Q==
X-CSE-MsgGUID: 7KAGJPcJSIqtjlNjkvTb7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14757165"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="14757165"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 15:17:54 -0700
X-CSE-ConnectionGUID: s4YnW3HASp+tbtZ4Ggno1w==
X-CSE-MsgGUID: 0w7fxHVpR1OTq+2nLXVz3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="62751749"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jun 2024 15:17:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 15:17:53 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 15:17:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 15:17:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 15:17:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGRJ7mOP7HyNXfp+cC4T3WYHQImH81Ne/dkdh7Zz7V4JhsOzfX7gTiIc+ACv+izRswYYZ80wLKhUQAherGWmW/MV00OEGZ7vAxcYdUhet3cS72PwXlKOvFHVLi/SqXOzBpiqtOkISdCPPS6YQFqi5E5y0U8YEs/thWsduzDYsY2lS0M3dKVc1kuJNRYy1GCYrz4heFJEV9UtTOt0mHcdHDc1mF1+C9tIDlvr5AZxO0bQRS+kzbwgPOTpgfVEpuLMu5cfon4TTj3g6ApUtiWragyDOlNN8o1AxvQhGpF6s3okBTum22yo37ivuynRV79KRtVJwkF8oUNRjHcTgCQx9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UccT9PE3bprCm3B+viaUy9dG9iM/USQ9uZXdyuV2ctU=;
 b=e3UDKZPUkWvvk+KQL54h4c9bbe2IxX/Js+T8SBbU2UtX00ZtdWVwBZA56rDHSf/iUSW4F8cJRVJU7/6GcdNa3jlr4BkSU4+qZGiUXeQnw3tMbuAKCETjWM7OzOu1NijxEMP01tMuw68JT8P+hBcwWHqONGrQjAIWzNCcehRjzGNeD+V276JHDOgmlJ18hCrAMlEY5pkA76oICUpYYMDqJ7qWEdO8q+g5Knrl1OFRT0AT3Glju+MTxV2jEGpHHVFMCcS6Xv0VlRx7xkIt534StWWVheiOkuFVZAEJTCtjzQv/9u0hsqKIEqHdGxPQVKuUcuGpurOTvLlRRiqIo6czlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH7PR11MB6674.namprd11.prod.outlook.com (2603:10b6:510:1ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 22:17:50 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 22:17:49 +0000
Date: Tue, 11 Jun 2024 22:17:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel: Add xe_coredump test, v3.
Message-ID: <ZmjM7aTlD2DsGE3A@DUT025-TGLU.fm.intel.com>
References: <20240611101323.19444-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240611101323.19444-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0045.namprd02.prod.outlook.com
 (2603:10b6:a03:54::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH7PR11MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b2184d-0675-452b-a83c-08dc8a645467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|1800799016|376006|366008;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0MMFdXfW3cVvE5KQo62Ng47uDkSf33T2xBQi124zCN7PKaXN1JdlSNlQGH?=
 =?iso-8859-1?Q?kJcQKcFatYQW9HIgP1pSdrxjOVLStzMDMET4OBmq/7/2y7P8BwMjnEmz5T?=
 =?iso-8859-1?Q?n3lBYeVmLO4wGg3BfUJ80+9keTNZotzLKfFeiROvhZH2iUQa6hy8bGTsjv?=
 =?iso-8859-1?Q?4SMhRZP3LPfnMMwkcqSv3yooLMJ3hQlayg+DCBieLnx21qV4hHpcOITmbG?=
 =?iso-8859-1?Q?tEigrkPfAFJD5FZNZoV4SJ3OpuzCZm9Qn3PGFrTvqJaXkUU4FkF5WwcGX9?=
 =?iso-8859-1?Q?qxF3QlGMcDn3duO7J/yubphB0wqCCo1/0ihmZ43k59y15XP/9jP21V18yS?=
 =?iso-8859-1?Q?ZZoItvsV3a/XOT1bpzMSBRR4OGb/pmbBzDLkmX8n0v1gqb5B+U9+f4aSHL?=
 =?iso-8859-1?Q?ikZTSHW+j+MDXIkGL37ttIIrvPZpoBUdjqQDrmkp4lKx/nQAyljIOCnT5F?=
 =?iso-8859-1?Q?zDtcPTv14kxISk8r7qBvbQF4rbMzGT+C13LXdIIigoY16to3ZiMqt/kgpt?=
 =?iso-8859-1?Q?WRrPN5nCjiBQnoT+HqwFyy5h6BLVFk6DBCVh3n/9qFwMVleC14vVw8u4Rz?=
 =?iso-8859-1?Q?Fo+CWGDe2lHlsRqAA+0xZF394usJ1oQY0cr07aw3RxQPWzNv3xa3Zd6k0r?=
 =?iso-8859-1?Q?Qmxqn5NuESMxBfi8j9Ub04f7adw3vw4iNkT5ZkCq5/2U5ZTFVHKW+ShCFA?=
 =?iso-8859-1?Q?t6tLkMOv8QZvhnFc3ZNKvq0c+ShDL1LiknguGpbe1Y0eK6I+7QY2+6QNsR?=
 =?iso-8859-1?Q?xQdM3uLHo0azkgKk0fEx4mCzWxjlGY0T+v9ZRxCvw4SFySENdfRbw6wi3X?=
 =?iso-8859-1?Q?jm5l5ZFjlOFLsnxIQm+lxMOklhHvAoXk9Cvka3drduMTjqL03QqSFCZbhY?=
 =?iso-8859-1?Q?5mA9IO7P9p85rBjQUGCK+7N1Vb2N+gaZ5v5VINJagAA5yESwO5eSozLNlD?=
 =?iso-8859-1?Q?G6bfbysoxPjQfeKtKlSTltLjSi6RLTu2TzhbP2fctPDipRF35oNzdbV/AO?=
 =?iso-8859-1?Q?rOKevDk2lkVw3A6KXZiCUZ4HntSBFiqLAywHjWl7uUHq4qAZyyGcQKTmdc?=
 =?iso-8859-1?Q?J+Sue0AjfLwYd5SRqyc+u3qTpXVHta0MgtdkELKf3B9NME1nr3QdLC9R9s?=
 =?iso-8859-1?Q?ZxQV/A48dHwgCVXly241MDKjhM3nC8gwBRMU1Lg38wGq63gJaMA2vtB6m8?=
 =?iso-8859-1?Q?NAWwpkppfgU0uPUsjZc8MpuGnkZwap5U+4VWto/u3dLFY5JCnf5qUkdjer?=
 =?iso-8859-1?Q?6jkRuEnAUK49HHFKv/FzTvxE3++eTyQNzC8pH5wD5BknpqdykPn4EYVco+?=
 =?iso-8859-1?Q?rY5v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(376006)(366008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yU/hHV6X557+Db0is/C22lfMv3EyysBiFyt+Zl4vCC+rqUMRgOrkNlhXJe?=
 =?iso-8859-1?Q?7rye9PHRFOOC62KLEr4ARWYH/OZ/i99QFsRaczXWqwSIWthlz21IRnWJGF?=
 =?iso-8859-1?Q?bOQ+8pFBuIxx5SmFVIUaVLQZaJLxCODMf/zEu6dSNTMS3Z/nY8xPsj0wz6?=
 =?iso-8859-1?Q?NJNvl+Z4arud7wU/HT0PHdSw2Yi4neJe2EqZh7oTGPLJoeRSf3wI4NMtIs?=
 =?iso-8859-1?Q?Snp6OW+eOShj9s6EMPX2xxErX25igIPzFFD6jg17LXVB7Qc8PfgqacXW20?=
 =?iso-8859-1?Q?DS7CpaDXe/yvnVFWbL8kNY0WdwPDFolyC6AFJ1Jlx+uDpwecUjn4XCtM/V?=
 =?iso-8859-1?Q?1uHH7aYTcL0PoH2VhkmJG5WzAE13I8fA0NCzd+TbR36/FTgyc8PwZHMVXT?=
 =?iso-8859-1?Q?RPXuVyFWPaTo4oxbUrGPd/WtPuA2UYYpG1EGzVa1n3HD7vViR3HMYy/to0?=
 =?iso-8859-1?Q?mcmXLY7USeEVDtaRxsIsDMgU9Tngyx/N/JeT5jd5xWdgYbkYDRhCXYS3pw?=
 =?iso-8859-1?Q?cqTowBpyyZMILlLa5lyQfs2aRaU8DgezKtvD/i3wADymgcvA5VhM6YKVRg?=
 =?iso-8859-1?Q?2OGZL41wHJUW/iK3VTGFlGm5x2HKHPfWIPVZZ0s+OdpH1PVnRlLX/CxS5/?=
 =?iso-8859-1?Q?BDumgC+bnNqV9ND5H3xeoHRBPZqN/Kjq2Qd1AINaq1bzebs2tL+7OVt9WO?=
 =?iso-8859-1?Q?18w+9gkXWZZvLdLPIDFrACohkp2CTJcLqDzNK9jy3U5I/Cr2D/5bJnJYa/?=
 =?iso-8859-1?Q?fqGtW3jefocGIaTCZ6SJFcYd15Kw3rnstN2IhtavR61P7KtpK0KgfotR60?=
 =?iso-8859-1?Q?Sqr1JvJ0++Z3vElFyXhWSwQ/qOcPl8WiZwBU50NXz9BwkLDvOr2kwYQKAD?=
 =?iso-8859-1?Q?ji1a+kNC4lrJ6b8Gr8KgYe7dGh2st5mH9m7KFw392VkFomS4Jp82M0F+CR?=
 =?iso-8859-1?Q?UM+Z31I4SLQdic/Ql51E/Ah4Fp0z5DTypVNEo6AJpJsSz6tOGms53+K004?=
 =?iso-8859-1?Q?6OTRmIi+rfM9WiuJI7a4h10tdkhWqIYJK0tO3xn+H10sRSiOY7gTsIIPE1?=
 =?iso-8859-1?Q?ZaUVNQHq9hw77m5Cv1XFiuPpy1vw9Eh3CanYpApPRF8CJT3hV1tOitA3OI?=
 =?iso-8859-1?Q?fHbgcWcVGTjYuF9+HeLbM/iLd+cYEWKjxa4IuFKbKs/5qpK2gcbJpFGNAy?=
 =?iso-8859-1?Q?xJB1IFSg5G8l1GXWrNIRX/O0VYAPi0Ti4X94qmbYXbgr7q6ZhBj55sZHSs?=
 =?iso-8859-1?Q?Wcb2eWqvm51y/2C530N4ALn2VYkLq0990mx1yLHGSa6mF8hPfQChySIONX?=
 =?iso-8859-1?Q?cDqJ0sL1SAedjcKHu7vJ+qZ7gNp0CzeCGr+m8wCv+O+AFRhfe02/+Vfmf3?=
 =?iso-8859-1?Q?GLSeZ6+U4B9HleMn89ATj9Eu0S7Jt/e0nmBez4Lic0fKm1oD8I9SeX/qbd?=
 =?iso-8859-1?Q?WtJcciwQwZK2cp7gmkHKF0nJJ2xQ6RAPaoP+o5FRAhDkISd44bJXAkY4XH?=
 =?iso-8859-1?Q?vFmZAx5fLYonBCkmCCiereDQUw3uhWFmZ2axA50OBbFfM6Elfes/WajYvg?=
 =?iso-8859-1?Q?5DBkGUJ4ARCzGwMhB7VS59YNuZ30iJPWCg4K12V1hBvXsbDmufyb4kehKq?=
 =?iso-8859-1?Q?rAQBo9hZvx/M0tVRjU82eO2ne0fn6YUFQpnQKMbMQcbJlZNy6pe+YF4A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b2184d-0675-452b-a83c-08dc8a645467
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 22:17:49.8882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UZqqcqxseS3xYJ/TPTXjJKHyZB3A8rjKLXAXVeMBODRjxYOf5+1wj54+dy2ha3C3WpaQi/hB3uE9OTsQ3B2Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6674
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

On Tue, Jun 11, 2024 at 12:13:22PM +0200, Maarten Lankhorst wrote:
> Add a simple test that forces a GPU hang and then reads the resulting
> devcoredump file. Map a single userptr and BO, and dump the contents of
> those.
> 
> Changes since v1:
> - Almost completely rewrite test for readability, based on feedback.
> Changes since v2:
> - Remove retrying opening fd, 1s wait was missing and test passed without.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  tests/intel/xe_coredump.c | 251 ++++++++++++++++++++++++++++++++++++++
>  tests/meson.build         |   1 +
>  2 files changed, 252 insertions(+)
>  create mode 100644 tests/intel/xe_coredump.c
> 
> diff --git a/tests/intel/xe_coredump.c b/tests/intel/xe_coredump.c
> new file mode 100644
> index 000000000..938b718db
> --- /dev/null
> +++ b/tests/intel/xe_coredump.c
> @@ -0,0 +1,251 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +/**
> + * TEST: Check devcoredump functionality
> + * Category: Software building block
> + * Sub-category: devcoredump
> + * Run type: BAT
> + * Functionality: Error dumping and readout.
> + */
> +
> +#include <unistd.h>
> +#include <fcntl.h>
> +#include <glob.h>
> +#include <string.h>
> +#include <wchar.h>
> +#include <sys/stat.h>
> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "igt_io.h"
> +#include "igt_syncobj.h"
> +#include "igt_sysfs.h"
> +
> +#include "intel_pat.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +#ifndef DRM_XE_VM_BIND_FLAG_DUMPABLE
> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE (1<<3)
> +#endif
> +
> +static struct xe_device *xe;
> +static uint32_t batch_bo;
> +static uint32_t *batch;
> +static void *userptr;
> +static uint32_t vm;
> +static int sysfd;
> +
> +#define MAX_N_ENGINES 32
> +
> +static void tryclear_hang(void)
> +{
> +	int fd = openat(sysfd, "devcoredump/data", O_RDWR);
> +	char buf[256];
> +
> +	if (fd < 0)
> +		return;
> +
> +	while (read(fd, buf, sizeof(buf)) > 0)
> +		{ }
> +	write(fd, "1", 1);
> +	close(fd);
> +}
> +
> +/*
> + * Helper to read and clear devcore.  We want to read it completely to ensure
> + * we catch any kernel side regressions like:
> + * https://gitlab.freedesktop.org/drm/msm/-/issues/20
> + */
> +static void
> +read_and_clear_hang(void)
> +{
> +	char buf[0x1000];
> +	int fd = openat(sysfd, "devcoredump/data", O_RDWR);
> +	igt_assert(fd >= 0);
> +
> +	/*
> +	 * We want to read the entire file but we can throw away the
> +	 * contents.. we just want to make sure that we exercise the
> +	 * kernel side codepaths hit when reading the devcore from
> +	 * sysfs
> +	 */
> +	igt_debug("---- begin coredump ----\n");
> +	while (1) {
> +		ssize_t ret;
> +
> +		ret = igt_readn(fd, buf, sizeof(buf) - 1);
> +		igt_assert(ret >= 0);
> +		if (ret == 0)
> +			break;
> +		buf[ret] = '\0';
> +		igt_debug("%s", buf);
> +	}
> +
> +	igt_debug("---- end coredump ----\n");
> +
> +	/* Clear the devcore: */
> +	igt_writen(fd, "1", 1);
> +
> +	close(fd);
> +}
> +
> +static void free_execqueue(void)
> +{
> +	int fd = xe->fd;
> +	xe_vm_destroy(fd, vm);
> +	vm = 0;
> +	gem_close(fd, batch_bo);
> +	munmap(batch, xe->default_alignment);
> +	munmap(userptr, xe->default_alignment);
> +	batch = userptr = NULL;
> +}
> +
> +static void recreate_execqueue(bool dumpable)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +	struct drm_xe_vm_bind_op bind_ops[2] = { };
> +	int fd = xe->fd;
> +	uint32_t *ptr;
> +	uint64_t offset = xe->default_alignment - 4;
> +
> +	tryclear_hang();
> +
> +	if (vm)
> +		free_execqueue();
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	batch_bo = xe_bo_create(fd, vm, xe->default_alignment, system_memory(fd), 0);
> +	ptr = batch = xe_bo_map(xe->fd, batch_bo, xe->default_alignment);
> +
> +	memset(batch, 0, xe->default_alignment);
> +	*(ptr++) = MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_GTE_SDD;
> +	*(ptr++) = 1;
> +	*(ptr++) = offset >> 32;
> +	*(ptr++) = offset;
> +	*(ptr++) = MI_BATCH_BUFFER_END;

So if I'm reading this code correctly the hangs depend on job time
mechanism (i.e. by default after 5 seconds the job gets timed out and an
error capture occurs). Have you considered using spin library rather
than open coding this? xe_exec_reset uses this.

Another option to consider is build in the error capture testing into
that existing test too. This would personally be my preference to keep
the IGT suite tiddy in terms of number of tests. Not a blocker but I
think it is worth considering.

Matt 

> +
> +	userptr = mmap(0, xe->default_alignment, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +	wmemset(userptr, 0xf1234567, xe->default_alignment / sizeof(wchar_t));
> +
> +	bind_ops[0].op = DRM_XE_VM_BIND_OP_MAP;
> +	bind_ops[0].obj = batch_bo;
> +	bind_ops[0].addr = 0;
> +
> +	bind_ops[1].op = DRM_XE_VM_BIND_OP_MAP_USERPTR;
> +	bind_ops[1].userptr = (size_t)userptr;
> +	bind_ops[1].addr = 1ULL << 40ULL;
> +
> +	if (dumpable)
> +		bind_ops[0].flags = bind_ops[1].flags = DRM_XE_VM_BIND_FLAG_DUMPABLE;
> +	bind_ops[0].range = bind_ops[1].range = xe->default_alignment;
> +	bind_ops[0].pat_index = bind_ops[1].pat_index = intel_get_pat_idx_wb(fd);
> +
> +	sync.handle = syncobj_create(fd, 0);
> +	xe_vm_bind_array(fd, vm, 0, bind_ops, ARRAY_SIZE(bind_ops), &sync, 1);
> +	syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
> +	syncobj_destroy(fd, sync.handle);
> +}
> +
> +static uint32_t hang_engine(struct drm_xe_engine_class_instance *hwe)
> +{
> +	uint32_t engine;
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = syncobj_create(xe->fd, 0),
> +	};
> +
> +	engine = xe_exec_queue_create(xe->fd, vm, hwe, 0);
> +	xe_exec_sync(xe->fd, engine, 0, &sync, 1);
> +
> +	return sync.handle;
> +}
> +
> +static void test_hang_one(void)
> +{
> +	uint32_t syncobj = hang_engine(&xe_engine(xe->fd, 0)->instance);
> +
> +	syncobj_wait(xe->fd, &syncobj, 1, INT64_MAX, 0, NULL);
> +	syncobj_destroy(xe->fd, syncobj);
> +
> +	read_and_clear_hang();
> +}
> +
> +/**
> + * SUBTEST: basic
> + * Description: Read out a full dumped VM.
> + * Test category: functionality test
> + */
> +static void basic(void)
> +{
> +	recreate_execqueue(true);
> +	test_hang_one();
> +}
> +
> +/**
> + * SUBTEST: empty-vm
> + * Description: Create an error dump without anything in VM to dump.
> + * Test category: functionality test
> + */
> +static void empty_vm(void)
> +{
> +	recreate_execqueue(false);
> +	test_hang_one();
> +}
> +
> +/**
> + * SUBTEST: all-simultaneously
> + * Description: Hang all engines at the same time, read out the dump.
> + * Test category: robustness test
> + */
> +static void all_simultaneously(void)
> +{
> +	uint32_t syncobj[MAX_N_ENGINES], i = 0;
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	recreate_execqueue(true);
> +	xe_for_each_engine(xe->fd, hwe)
> +		syncobj[i++] = hang_engine(hwe);
> +
> +	syncobj_wait(xe->fd, syncobj, i, INT64_MAX, 0, NULL);
> +	while (i--)
> +		syncobj_destroy(xe->fd, syncobj[i]);
> +
> +	read_and_clear_hang();
> +}
> +
> +igt_main
> +{
> +	igt_fixture {
> +		struct stat stat;
> +		int fd = drm_open_driver_render(DRIVER_XE);
> +		char str[256];
> +		xe = xe_device_get(fd);
> +
> +		igt_assert_eq(fstat(fd, &stat), 0);
> +		sprintf(str, "/sys/dev/char/%ld:%ld/device", stat.st_rdev >> 8, stat.st_rdev & 0xff);
> +		sysfd = open(str, O_DIRECTORY);
> +		igt_assert(sysfd >= 0);
> +	}
> +
> +	igt_describe("Test that hw fault coredump readout works");
> +	igt_subtest("basic")
> +		basic();
> +
> +	igt_describe("Hang all engines simultaneously");
> +	igt_subtest("all-simultaneously")
> +		all_simultaneously();
> +
> +	igt_describe("Ensure that snapshot works without anything to capture");
> +	igt_subtest("empty-vm")
> +		empty_vm();
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 758ae090c..f611e2e2c 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -280,6 +280,7 @@ intel_xe_progs = [
>  	'xe_compute',
>  	'xe_compute_preempt',
>  	'xe_copy_basic',
> +	'xe_coredump',
>  	'xe_dma_buf_sync',
>  	'xe_debugfs',
>  	'xe_drm_fdinfo',
> -- 
> 2.43.0
> 
