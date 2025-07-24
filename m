Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF864C83F26
	for <igt-dev@archiver.kernel.org>; Thu, 24 Jul 2025 21:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EF410E096;
	Thu, 24 Jul 2025 21:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxT5Vp72";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9DA10E096
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jul 2025 21:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753391915; x=1784927915;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2OZOYvqBkrvA7EOe7HPJbSnK+EWyI0a0RLSdbtTPTjM=;
 b=AxT5Vp72c+LmZ8RGG+fGo6sWFES9j+f5f5L/c+NcKBCV15bjuDjkE519
 1u41lmmYbe4lSxqiuJG39L7VFpq+LdcbIidtbcVqWsTxzL90lGThGxi5T
 Uw1wciURG+6VA4Xj0WGIqZqco2qJ7OJ+8ZvMxUzsr7r8XesEhmQ8Ao2ST
 Ve41JNAnVxELd5N7rnvCc7o6xM8+2mWv13ayyI2GWaA1xgEuU9ditHvmp
 6khfzCtAZabua9iS1wlxnzmLgohEfuVYAl0p7z+FtiRyIl+4AMLLYE7AM
 N2xD9RexrH5V4dewWglt11EJvBCI1S9Xu/tCSTtJVBn4Zg1+MUW4MUYqb w==;
X-CSE-ConnectionGUID: 7yc7JW9SSBK7yYu34wkKcQ==
X-CSE-MsgGUID: 7F6aAPs0R3GamGgYKUSWCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="54811280"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="54811280"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 14:18:34 -0700
X-CSE-ConnectionGUID: mL/0jth4QuexNlQZZADJ3w==
X-CSE-MsgGUID: gQBa+y8WRmW1sLdPPnvxzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160087030"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 14:18:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 14:18:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 14:18:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.78)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 24 Jul 2025 14:18:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udeKOXJR4wZGklob2SNG4q+6V/ztWfnQo2PHsyMu0Ffa9TUfGguc7g0KcnMgDbpkz/ujCI4RhU4DR+74q4w0hEOq/1QdGZancaEHvm5lK1+FrbxPIrhDgNgbnpENmL79CteBAnlEEZr8XH/eAI+PUs1ejkrJ9v2qqqDvM11incgOno3KoODzDK2aiFYjwO4H/hipuITznj4aK2NfOTchdeC6kDF+Dz2L+BGvI/CyD0X4z597EK5Tyaqnu7bd72teHq7HQzrej9E1Shh33IwIVVnBUR2j/kIy0nYH99i7WkVknKb+md2uzWcAEku2u+Qvs5F5Wr/RB5IxOMrfUo5O8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7QgC4LMUCXgTgSF7MLq+BK1TjtcSlz5+9YBNx/AVnc=;
 b=ZUUQhJT3fDRlLHYR6+tg/AqPNvQgqWxsrTNo36gqvaqnbTMZzjn0l0dX/Zd5oWtxgf1jWI7PsGDQ0WsfwsH0Yvv/qCdWy1lrXAJaAOaLt/JNanqsHyJgDm7RZCNPpuF5xUc+BMJlBt3oBP/9FMlMYjTQA1FHcGKf2iIv1iHY+RaKWvfDwR6JTkJl/28uKG/E17ubWvoBPRgCve7jEMha7qPtro6b79/2EECEdwT3+Sd+b83Q02QpHAAHJXczul5GAmkNO08kvbwM2CIRfb66mI1HpXQQ6I8hdPqj1temwkglyndgtYM2NNCI4bhe9sVLudxR9y21PPOm52JLKunHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Thu, 24 Jul
 2025 21:18:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 21:18:32 +0000
Date: Thu, 24 Jul 2025 18:18:25 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH i-g-t] tools/gputop/xe_gputop: Keep engine activity
 percentage between 0 and 100
Message-ID: <iqnibyn7mc2ckr6snqfehvuc5hobx7fstzre2pcbt2mz6komv2@crpxe4lvykix>
References: <20250724185040.3163412-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250724185040.3163412-1-soham.purkait@intel.com>
X-ClientProxiedBy: BYAPR01CA0064.prod.exchangelabs.com (2603:10b6:a03:94::41)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c31ff7-e5d6-4484-759e-08ddcaf7a41e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uyC307pLm4LXJahENLnxl+no+oIQSf1ydMLrnZvgRC9nH3qa8Jdn+y64XuTt?=
 =?us-ascii?Q?Sk4sO/nMR8quwvcMEs/Sh53gitJI6xhH42SQHLo/WQ3PDp1tn4Q9LqbjvP7m?=
 =?us-ascii?Q?zGOI0whX8XsY9CcpRiurh3ZMgdl3YdiusHHEjy8teTLmPQCz+8nyiKeGgRiy?=
 =?us-ascii?Q?4sEyROR7zruBvpmONWl6qBiZzuoHDrK7Wk7y8ktQ+umJdcxqSRt2zNCFiL4V?=
 =?us-ascii?Q?bviPRWo4il6rMMg6dlTPQDO6OUXfhiGwnBZSnzNqSKAjp6xIjsvOIlByjLB0?=
 =?us-ascii?Q?xyeAGZim58V5ggxTNMkjczv20tPWU45fi6rULsey2nUflyB9oseBxdLjUbtC?=
 =?us-ascii?Q?oXx0o//jqAAi3qbzYWzAYZL/v8usd3JPvegVIhL3Z5KMW+sDcmjsFjrT6FMm?=
 =?us-ascii?Q?ZernMDuAV4YpyRSeX/eM1PJOrcG/t2CgVSIgfV/4tI89FOII6RS2LSsTjE0R?=
 =?us-ascii?Q?AVGjb0NLnKWsAO+G7lbzxczLDgWKPaI1U2Unsmrr/WONsypkjH/7l7myDieG?=
 =?us-ascii?Q?5IcicgsSc1JJ33LsLINXUi7NpIgcyZ01S8iv8KHpzf0BjuerEcsHH1ctevrz?=
 =?us-ascii?Q?DugQwoX+ULlEwrZ5dyjr/99w4W1sIStr4+Ng/FPp6HTPCUabBxzMl42vtDNI?=
 =?us-ascii?Q?Ldxdmb/6fPY0yEZSikBO+1/Qd2J4xe8WUxKUUhJqDWO2QWL/NsL5mrUOeQgs?=
 =?us-ascii?Q?MeWJWM4F0Bfr5cNXe1nqPIAqztXFC/UZwoBw0daUxdQRcWMQ4292xzBzI33P?=
 =?us-ascii?Q?Ve1+MBtqIcxZHZ0QGtR5FGK+Es6RgZWBUtIHEyJh92hn5xbBIt0mQKIJiDI2?=
 =?us-ascii?Q?wBknn1nT+UO0Adex3IRoukDhvpah86UIUoEBf1/7DtsWExoI8zrqFgtKcNG+?=
 =?us-ascii?Q?GuUP/1+hzp+Q24+DtPXN2E/AE0EYx1HSAqW2SkJVrE9oVa3bjrPjUQ5ONmjI?=
 =?us-ascii?Q?o0O7RGGKLVI+7qMrxCJooiQT8R3zvSzh8L4gUI6Yd6UeMPZwSLSjMPn6tbVi?=
 =?us-ascii?Q?SgbUUT9ejypBFOO+9F5WYApbVXDyLNBHVsJ3aVcDRdb1zjAUCrcwuz4h28mC?=
 =?us-ascii?Q?tgY6uYRgcVdZeaZDzljRd3jc8sIvOV4erFL6MbgosNE9Z9HE7o2yLo6QJhOD?=
 =?us-ascii?Q?JhEGZ3GEudUbB0HAu4wqKRFoJx6UlA1eBxYVQNP6Fq1f2a7pbigJkeNcMB0Q?=
 =?us-ascii?Q?Hfx1l1paNVGiWkd16Mzcqk/4Dctd68m5Eu/HTvZyPd69RuDT90Ky8BWRgzNI?=
 =?us-ascii?Q?R+Hw1jj4UQErT6y0fxNMbglaswMntfcbQ4bLqGoKq1ukKWg5RjtjgGm+Gsix?=
 =?us-ascii?Q?qb9p01Vxu9KnCzOd4rJQedWj+asyw24gna4hBjVIoDsF3QXHs+j/gRTN3Li2?=
 =?us-ascii?Q?zBEoo0TnaqZZ58qPR9DXv9GLNmrhRt0dqxa8DfFLNle1DzYO+D8GDjxL+Hhe?=
 =?us-ascii?Q?vz+GaeCUFhU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fBSc5FZgiOpORQUNX3fuFw3LJ+suZGe010/+e4hzkjD0ACb5+ZbMr8n+kLOs?=
 =?us-ascii?Q?qO6pYJQK/JooT+v/fsto2+CAwivtzbFZVSe6DSQQYjjM976U9gN/cEDFQ2UL?=
 =?us-ascii?Q?Pp4cD8pr8KfVgiKWut5AimZy5lTTOt7ItDQq0c/yWuKi6klYlSeUwLgmCkO7?=
 =?us-ascii?Q?afnW9aHZ5XGQ9vpYHjQLmkO67C0en3pICOAMrh44QqMfkmWDNTn3ysI1QE2v?=
 =?us-ascii?Q?3pmoMsgQn48uTv+C8u19ph2eFkIvrqoHT8IzPe0ta1zELWpS/deP354ENupD?=
 =?us-ascii?Q?0IR7iL1YNjjZn5aby2aqsMqrKAudi7zZ+KimsGcS0SYjq8XqzJu70K+QQyfn?=
 =?us-ascii?Q?KgevfyhdKPHZwULioqRtL/aLOs/znvzjqSCCfzTWR4c7PwfB861By59lIZUi?=
 =?us-ascii?Q?Dn+nmAZsHrtUeEkEXFJPnCgA3/TI4lvl0XI0cCYZmJKlQBSQruISqZKJqJhN?=
 =?us-ascii?Q?BCMhJ/Kl66cA9kDr+APpGsIN/LS0+fZCJFBkMM5WDWTYSkal19xZpzIBCCdX?=
 =?us-ascii?Q?7Q3U+hh2or27GWL4/qntxxdhxwwCWa7MIEa6H7s3unqNEc6Ei45DeNV4t0h9?=
 =?us-ascii?Q?VjvCvyMw5F0GX1FAJLpK0RuhifvHmN+T6j4PTzC/ZEzYOGgKopKqnMwDH5qd?=
 =?us-ascii?Q?3BMkDkg/AixAk4Q2mlnhyIEnf+B6xVTm3422n8vn+CqalgqQDiXSXqCNdygC?=
 =?us-ascii?Q?ty9EhsqHFCL4YW84uOds9gMvZcn9r2JOgMdB4KPr/uOBbV9cYSY4XrmvFuU5?=
 =?us-ascii?Q?a0AfOFJQOaYQafqQEhk08jiw67RjPxLdxwCS2Bl0l9tgg/rNpP35aAq1TiOb?=
 =?us-ascii?Q?R9o7+nTjU42hBrnxNnaFsXJrRdLQvjtKd67jpw0MkYJqg0RTsoTQLOzzjcRh?=
 =?us-ascii?Q?F3rGXspTpv4ZaoGDQA9NQ+ghca/xC7Bxp2kVBMZlpocCsrr002KthrCar0DA?=
 =?us-ascii?Q?vL46cCzpbjRsKBkWqINPmi+pWcIwCM1XFrISiFwwRYW+lkJ5JQX7p1Di1lE6?=
 =?us-ascii?Q?/0WqVZaGb7UPOk0owCH31wX25RbXhNmx8FXlRJNAk3DrvmZDKqLyOEAPn7+P?=
 =?us-ascii?Q?p+MQTVQKfDyZu5Y7m/OJVUtv0HittwzJN/0auA82iHXa31YQ/Cx2i9+6dmOB?=
 =?us-ascii?Q?j7NOxQq0KdrUphGQthCJ8ZGOjorvcA8qzJQ38e93WVfk7k2s9t42QOQ8QA30?=
 =?us-ascii?Q?ebVPH/IZPzn6vSAoasSXhzhIT4mUW0vMDtcBSqT6v/kUB+KjNSDfP1uPBHP1?=
 =?us-ascii?Q?g6wuM2RDXRNZtZeMK4sj3bkXpWXT/uaZB/xxwvmHvAsrfIdyx5QF8SBk853Y?=
 =?us-ascii?Q?n9BNdjFulpJSMWBhHvR+012IkVZxusA7UjXH6fr3lDsbFx9Qt5mzYNgoUJfk?=
 =?us-ascii?Q?Smx+Ee/4qwBWf7AmZT5hrwv6xboVzRxuQhV2uF4G9QqhgbfzbmX9Nj0RZnDN?=
 =?us-ascii?Q?AzA0XKLzhuOErYx7pSOfGU+tmXW4PvmS3IJRG5I4EJz2Btt6klxADz7ATe/g?=
 =?us-ascii?Q?UIWfBkxuwgWbaJIm1Bju1e50Q88M64Q7NXE3oB6GGwjTZFgevl7JGO0QtyuC?=
 =?us-ascii?Q?xXnzDvdho2+RN3T6FZ2NLR/Z3D+yHeE8gtw/z6KXFCcINbg9F2iTZjg98IPE?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c31ff7-e5d6-4484-759e-08ddcaf7a41e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 21:18:31.9739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrCxA/LxwBX/W1UJ9fZ1Omd2maHWOIwrzxZwtVO7XKrRcpm6Foo3IgVW1pCA/q2HedC37PxGxNeI4LZW2eoBH+bNhFMWnzTsYRiDPab5xwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
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

On Fri, Jul 25, 2025 at 12:20:40AM +0530, Soham Purkait wrote:
>Engine activity percentage within the valid range of 0 to 100 prevents
>out-of-bound values that could lead to undefined behavior during runtime.
>
>Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>---
> tools/gputop/xe_gputop.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
>index 9757369a8..ced427c0c 100644
>--- a/tools/gputop/xe_gputop.c
>+++ b/tools/gputop/xe_gputop.c
>@@ -281,6 +281,12 @@ static double pmu_active_percentage(struct xe_engine *engine)
> 	double percentage;
>
> 	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
>+
>+	if (percentage > 100)
>+		percentage = 100;
>+	else if (percentage < 0)
>+		percentage = 0;
>+
> 	return percentage;

maybe this would be clear enough and shorter?

	return clamp(percentage, 0., 100.);

Lucas De Marchi

> }
>
>-- 
>2.43.0
>
