Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF99C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 20:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089D910E0C8;
	Wed, 20 Mar 2024 20:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLXmCPac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E53110E0C8
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 20:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710967697; x=1742503697;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2rWbEjJLqe51AdlDbreQMU9X1eBbspOy+RW0uA5/PJA=;
 b=dLXmCPacog23zDGBr781YWiitc6VdsiqtKX8BUjF0tbZE3JEQC+JmPU7
 4wDb3qsQ/jbkuEz5PWjJBjacjXvXvA5NwPol+k3dnRUerkmXj7v8wPDc/
 4zAAdN5bIN02KRImNAN4F9tSpxbprVFZCxfPuFpPgs5+ZeFEjOZGe6t7+
 5gLl7qjomXVmIYCuAlPBBfFVELw8If86uGIaGWRJh+uWdjKp7Zk/xgUHR
 rSHy3kbra0/04HQNYXfsRH17ukUsLw54wnwMVGomxPR6sfOmRZlEClE1i
 A9PbDFs+m8Y40m3tyJOFpfT5OE6uvE3IO6MQGHpXs+MBzz3Xfu3KXZGE0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5808748"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5808748"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14176519"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 13:48:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 13:48:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 13:48:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 13:48:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMtjiBjDncED7/7hDtpZ4aHKsRYiY3OKfBCA1pQ4vymq6L1PWKOSuc+hFzfdqZW98yUKSlyltp2wWVnnk+NPtGQ7ElBH/LY0Yqk68aMiLbPTxVNtXi9Yx+3OLWcLKVXhmCzoOTTJcESFOuCf46nOIYX01ww66hGzdR+ZFX5X1ZMLTaHP9OxzDDz564MzZPSAAFcBcw1jmMgfYG6acx7xNPxZ7yANAeYv48fxUK6i3O75cIFNGCpdG49tNt1Qp9YPC5W+hwKwtpa7SLk/Pf92cUTe0HjwAKaXBE++K/AGzxdeI8VW/EnvO4uKHzaRTXYW1SF+h1pKXc//NytYVkdg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1nSYf+bFEvcX9ww2K3yNPqH2pddwApNHVZWd49+Vnc=;
 b=g8l18t9eOJ0XbXoIS6cghYJgYd1wTdqH1K442Z3C5Pd/2xeaDGAm70DMk4lC6RNoSYG+Q4R8FlFHbYZJc2I1V1WJBa3A/xZzx2aWHNP2+Mlahu7lxsaqY+D4WoWSF/LBYkqnCU9HJMVU1lo3ok1fseemHGps+5W+hTaTZNg+sFHVWFleXTKjG/PPIY3rTBKNqx/dvcltc5HqLXw9xUvx0Ya9zbcB5RGpYf0x5tBv76vS6SrQCIYTtmnqXmcIB99/PzWK9w+uVtwDrhAhknPbNDOG3YSnq4vlZEXVg01cPdBxfzjPBYM4tWl28g7sCfKKcO7pz6pljgsybD8d1JlHjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7143.namprd11.prod.outlook.com (2603:10b6:510:22d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 20:48:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 20:48:00 +0000
Date: Wed, 20 Mar 2024 15:47:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_exec_threads: Fill in GT field for second
 balancer thread
Message-ID: <7vgrnkw4ndo5ydxybh3qoqriovorgyvrrsatt4tgifis7xo3ju@3g7qmeluwrps>
References: <20240320192356.359327-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240320192356.359327-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR01CA0024.prod.exchangelabs.com (2603:10b6:a02:80::37)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f39aaf-3f1e-4f1f-24e2-08dc491f077c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6lES83qKI8Zwiv56dbblO0xeKNaqJUmzao6ksTWZijo/BhG28hBvbyxHtEX/hC4oDRqJErBem9p8r6dMt0xpXHLzXDBBg5DX9NV+cmjovEsYAzVYKsJhuS6K3S3ZqXow/18SSx/LbYr32V56uS+DmNLa/6ZVIYiQpGfc3CyCALnSFKGo3QZHRnT+5SA7JmsWpgCK5L9f3cf4Qgizf4X7BQvJ+LQt6iiRyl4dKZq6weHF+Yzs8Gdc+1rc4kVdJ9hV1Dttda2pfrXHozikDjY4balPT9dk+dgjZnSgBidXqk/E4y5lkzpwCEzX3ux+hRgjCWvuB6nscPcn9bNB2Bmb1RVi7oAMHGPguUUFHgO5rBGuBiz1k2DYsoQCXSGU23fYXTqHIl10Rs9j2fmU2+AVCIzi6nVF/a2alS+599kX2X9yD6EDdh36p6hEFzyisnC+L8d+VBTBCn5zM+PAIrUmAalHwT9EOZMF4qNTBNktHKYEHla2zo8MYAuFNi/DaxtRgKFrV5Y0kXhrO1Rrj172SweyFvBgvhm6S2wYTY/a1tFExAl0Z7g9q1PRmTCaEm4WcCqMFqugsUwZ5EEPvIhEgNWg8c47tu4FcBy6bWTzGnWywPrnHA2JqqrJ27wTwPJdDF2nxVPIGjUM5xmio6MGrAxhFNB/H6LSyd2MXg14s6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sidi40laRv94FHBuqsmcCL8HSmpDQgKSSXmWBdv6XUslpzlX+O6eSSCigT6+?=
 =?us-ascii?Q?f5GQji0T7FNDXWtZeHurdqxQQNcKngnLVGYMleKyPuUFzNIR8Rz/K4h15gny?=
 =?us-ascii?Q?Sdap6FTyWPjL1WHltzKF8Sx/hqQckyKTXwh24Jk4bkhps5LsVO5ZEinZRPNG?=
 =?us-ascii?Q?lYBdJHIVfqJvnlFtkDzsY5Rxu1tB5L+hVlOOQLqCAqQNexvHj5Ct+oef/+h2?=
 =?us-ascii?Q?qTBhX5Mp4pmFIqQVZcTIf+AHnSzYJ9yNeezw9Xg3KIlgAfzyLPXSS8eVftTr?=
 =?us-ascii?Q?oqIkB0Jx72Bl8Q+qIrVVmghfEYjy0JLI5nl0xCuoz6koxAbnqa0rE72PM83a?=
 =?us-ascii?Q?oZ+LsMOC1Fzh6iCjcLVLNFqxp/6PdS8k39I0xG33m5Kha5SeaUX5fiev66/4?=
 =?us-ascii?Q?mIMwQvrVFxlDR8O0YOVaw+B06FEVlhsu7Gauv5PAN/TYTe/SXP0uBT+1J08b?=
 =?us-ascii?Q?W5El33tCoBOzzUxfpxdmNPMgf1w1Mx10gnCziUzCO3AXGoLOlTdE7YjbB1uh?=
 =?us-ascii?Q?ZF7dqnc9kCyR3gM5BP/a1p3T27nFaN/hU/Z43UXG0Uh3hDF1QVz2+1Brp2XQ?=
 =?us-ascii?Q?CW/YNUVtIDpR02wkBsud2O1PcdyzIgBlZCWyGmERbwArYcEQYNFoK9hE8M3E?=
 =?us-ascii?Q?H57Bcmd4hDru+dlVMtq/p3SZxQRVXnao8RLgULQeOuFYzHobyG580gQ0efzG?=
 =?us-ascii?Q?zOynBRXikIblX0x4ik34/59KhE1yKeeEWYVWHYvUG5nEXc6pC14q6NmZZCRt?=
 =?us-ascii?Q?H/UoOhtHOnfiGwsW0pJiJ3ptU1X7S5I4RnF5lnb9Z0wxzlc9p5zRGiK3msEv?=
 =?us-ascii?Q?32EKWVzYhNrkX8Jt/2VXjxtbDmEEeM/0+0DMbgfpWFdeQeNBKCHcxCebHqIz?=
 =?us-ascii?Q?mDw5IQvvlWSBj1eRcbFbVEx8xN15J54jRo4bBoB0jcPr3g2fgtmdmVjgjKqm?=
 =?us-ascii?Q?BYrQHWCPstxsr7tyCwV/dMgZmxsvLUzWuqcSSAst93OV21j/EzxdbcotzfBD?=
 =?us-ascii?Q?gcZmc6BGP/LoBZ1WahY8nIkjbKVxMRPwzxDQ+8jYMyCogpNc6rVtu59UEjl5?=
 =?us-ascii?Q?FA51mACm1ezMVKzIdDLNHoG2BwdNacvWVrhp3BDURI3lXeY5l9jTVRmozLRF?=
 =?us-ascii?Q?KSGXgllPySdEgN3m9KL2mTEO2N7KOG9GD9/NBkcWHIZU4Hhs9t2qGM9FHt6m?=
 =?us-ascii?Q?G5AXHcE/n1FbWbFKOL5LKNSLesJ1YdWKZ/tG3zQ8eWBY1kkelb2ebPXkjkMO?=
 =?us-ascii?Q?5hgwGuF4lkrJmwK90pPhLq2w8XhAS/Ehs2Cj99lIyzQ6NjXcgUfxVJYNHxoi?=
 =?us-ascii?Q?0naqQuI5qwjdgPI8HDLkI1AfrZtWhoueA/OhBzc/sw6IYkV+LUka/kfbuNua?=
 =?us-ascii?Q?roX1o2DAvCclm2xQGbNsYH1TAh9jSuR6+bdNUQyZCMhnO4xOMgluz0APt9Q7?=
 =?us-ascii?Q?QGVJ8SrsAglIvVlkrsJywfrS66006GCyVXHdQmapW0Dy7it/yeWsjKAulJKt?=
 =?us-ascii?Q?QVNgYbKD4ScHVns5Srfo6pr1UYbe+kZEZcXM40OXcDN9AJCwl8KWx3revCHx?=
 =?us-ascii?Q?5h38wHasMDXVE4s1DDdrQnBCmotzAaJmrGeUsNgMTWvwTPji4/MpBAi5CsNR?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f39aaf-3f1e-4f1f-24e2-08dc491f077c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 20:47:59.9969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGA+c/D+wH2BLbYU7/av6uHzu2cEuRrA0anS3WSyzTf7aTQfFBoD/xmg+48PpBoRwGtg9SJBPEARA28zD5idt9SWYAg7AiAVh8oWpZJFrrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7143
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

On Wed, Mar 20, 2024 at 12:23:56PM -0700, Matt Roper wrote:
>The balancer subtests spawn two pthreads per engine class if there are
>multiple instances of the class.  The GT field of the data structure is
>filled in properly for the first thread, but not for the second,
>effectively leaving it set to "0."
>
>For platforms with standalone media, this will result in failures when
>the thread tries to find the instances of a media class on GT0 and trips
>the "igt_assert(num_placements > 1)" assertion in test_balancer().
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

do you know why we unrolled a loop in there and did a wrong copy and
paste? That together with vertical spacing on flow control seems to be a
good source of bugs. Good find.

The only difference between the first and second thread data I'm seeing
is flags VIRTUAL vs PARALLEL. Matt Brost, is this test from you? Could
you add an overview to its documentation? The boilerplate doc added
there after the fact looks less than helpful.

Lucas De Marchi

>---
> tests/intel/xe_exec_threads.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index 55907e2b3..977e8c600 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -1081,6 +1081,7 @@ static void threads(int fd, int flags)
> 						threads_data[i].fd = 0;
> 					else
> 						threads_data[i].fd = fd;
>+					threads_data[i].gt = gt;
> 					threads_data[i].vm_legacy_mode =
> 						vm_legacy_mode;
> 					threads_data[i].class = class;
>-- 
>2.43.0
>
