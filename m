Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902B5EE57C5
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 21:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD66910E046;
	Wed, 31 Dec 2025 21:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoOxaYEg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF0710E046
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767215754; x=1798751754;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n8oEJYQVv2S6dyFfuPrlrvWWpttq64azACV/9+1l+4c=;
 b=HoOxaYEgge/OhTg2YrCKcm816S5Mj/juvEPrdqgTu0p87BTMQc08uBNA
 6i4ZRelfD0PNoK7E6GWrT6f1Ig/LlB5JAuLeJJ6vn1Wj74vMv5hlkavk9
 2v9sogQpDgs3+itR20+UWStbgRL40WiU30OM3RmGehZ1Tnmo4Y52eHBj0
 fHPzVss6UQocE8zHv2YxZzsWTka8C81Jrmo22pEsM/8ot72HqsoQ3peCy
 sz/aG/s4mXDVBiKLaHZw2uPxZ7IX0o9KpfqAhmum+RfpX0rQ3XmaCTNsL
 rK3TLpOgiUvVK0Tn7U3DLaqZ+ej0fl2LA0VNuO0v2rRNNoohrvP5O6Ehw w==;
X-CSE-ConnectionGUID: V+LL+ym0T1G9ewr8Zq1qyA==
X-CSE-MsgGUID: hSPIsNqtSCu3A1YQyvuohw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72637739"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="72637739"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 13:15:53 -0800
X-CSE-ConnectionGUID: 2hXaHs+hTietkpFeRBhsIA==
X-CSE-MsgGUID: 7L26XxuYRP2U5v5+fJ0VqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="201395743"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 13:15:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 13:15:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 13:15:53 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 13:15:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rq1qxsqtWSNkV5gAPywnKK8411nf/OGqh5lk1bjbjaaCGqJzgymkKpZKpvSA1RjypPv55ZCnNdDuunyftt+uJFBB80o5Var2y+Joz2BZbt9j5ACpbud5pjIF/MzVGezbMRILA/hclWv7KJBCFOj40ZgZ2CUdsPUA15t0gLOr4EVAEuNTX/2tL9LqxW9GoTDnWVmJr868stoIVieOvSeegLxD2C891Aiugfy4YNvFrkrOEzONgQJacHwHEGkd1bLBuIfCqV5ON9Jtycq6ANqGpapujzj1AoiQW84DrU52b/jLs6UUJUoD8auxzAEDF91hslschgsxMyOprMCTCIZMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TllkHNEInqwRa5yztW2fTY/v/nE44oN00GhWfUyRt1k=;
 b=fBtLYwjUrLFGvmohfv8siC0qudHbUzbxxQWz9pxKHXiaKwvBobX2vWKiGVvNs41mMxhLPO38Dr72k5AEyXE2hZy32DHnzRuviaBZDYhcSVK7OzCH/rsOOBjokEcIDGrNdiDrFIvHZriL0/9k0W4QdIsRodXBRl9CpF6t9KClIjmgKfNpjp3o3FIiouua0n2JmgCt5pW5VI03ZTfqnaMUcWCw9gouhrvSbZOqGGh2IP04GiomY89qCbFWOdjZcz0K6erZW4w01yVjX8dmROSypMj9oVfQnYvT2BSx1Gbde2AIgODeSIqz3Y1c13hDtowLdgmPTVUJgXNUGtS+6530dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by BL3PR11MB6338.namprd11.prod.outlook.com (2603:10b6:208:3b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 21:15:51 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9456.008; Wed, 31 Dec 2025
 21:15:51 +0000
Date: Wed, 31 Dec 2025 13:15:48 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 6/7] tests/intel/xe_exec_threads: Add multi queue
 basic test
Message-ID: <aVWShAsoxGrXXtom@nvishwa1-desk>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-7-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251219120154.695287-7-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|BL3PR11MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 065d490c-f40b-478d-c27e-08de48b1c69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pUMZiUV/kNyTMcYPC2eB40oajnVBg58Swxu9fLjs6SeyfInezJLcud8CGHBp?=
 =?us-ascii?Q?CVW9VZFD3YTIN6wfXGCqk1EEd6oTyn5nIWDBiIO6fa/YlrQ8erdO3ak0qoOQ?=
 =?us-ascii?Q?xdTkYu6bLPmKd2NM0JSn/abra62VPqcdVtWuNX87JJNEz7edBUeGVVGmRBVD?=
 =?us-ascii?Q?PZNgfcYLopG20xqo6CiiHmMei7hKW7OYL7igw7Qj98dxm2Q3PLgvYpTKJFbG?=
 =?us-ascii?Q?Pv+MDGvS+KWhZj2y5vfqVU9+xef6cT/Xe1Y/OwaRRuGyqh5FzRSIyQRdxSR+?=
 =?us-ascii?Q?aCK6aA05pXTtl8xRKa4zlEUyLfla0DKBuiA+rMZ3DbAZfBGax13iALaSTvdv?=
 =?us-ascii?Q?VxqIV2mwLJZ3rRdA8E0Wz+bZz1NXYiC/DVJd9YKMzquluNb7teh/g/PGa1Xc?=
 =?us-ascii?Q?jIuwfaBCz/mcpkA3qto7mccxoEk7PouZ5oSGrs7kwfiI9gLq8bUtMuQwCKeL?=
 =?us-ascii?Q?Y0gFowyI+FwHrGqg8D9woGv0eX57Sd/Be9tO2SwLF2aONzTTzeQzFVl7B1vS?=
 =?us-ascii?Q?QGi98dqrpkNMWyYV3Xr9+SNkcMiuHhC/s7L4/m7/8QLb8GDDPZP96rK/qS2x?=
 =?us-ascii?Q?SS8in3OrqJUnG0wyJreF1N2CKNimCmaAJ62acMHVxKbdJIATVtZ8msdSgZhh?=
 =?us-ascii?Q?lrNThTLt80YP+wrIWQzbNXXzddP5nSmEiUcK1R4Kd7MYLpGzaMsxuEHHTlCp?=
 =?us-ascii?Q?NgNafOYrqWvrwzj2qeKK582FxrfjAlvo72U4D+WgV9fsn14tlPoIMyJV1fMj?=
 =?us-ascii?Q?zrbs2vb6Mo+/XGkx8Dj9etpuKAX18qG5kMCnsJVLYxfFf0AydLMZ/vgGcFXV?=
 =?us-ascii?Q?K0eE2JHvtwrVfmoWQ6nm0zDQ2WpvIvwg1lmaWnfaTPn6SMkLJ6gCoVjvMbgK?=
 =?us-ascii?Q?sRrrHtIC5F0WJ3KDSCA47Kque0yHIMHedQ8LOgmdQE2qWjCVpXcOAxrJU1Fq?=
 =?us-ascii?Q?4Rv/FYLP24pxC2fy6NVOGKgjZ0cuGGClsLT3MqLNQ/F64Pqu920ql3UXT1Lq?=
 =?us-ascii?Q?MqJLoQ1TZ4d+ULopY+fdOKMPTtnBk84KEKFcJPZur0qI7qaJ7jLMmMNnZNWv?=
 =?us-ascii?Q?ZNXtDI5D6kD25lMPICTElDtpn0b9L6jJBMAfekIyB9mp5K0iJtfGFsGDuYDQ?=
 =?us-ascii?Q?qgV963BVVJwOph/mXi2/oTSQvBKfcRStjFbPufh5W/LEuu2a2kmLpjKZKS8X?=
 =?us-ascii?Q?ktbXSKWBxRwzR0MKgFiXQ1yjBw0q8yEPtKcrwhN82x3yEUm0hSNhdSQkL/D3?=
 =?us-ascii?Q?WUhEGySO2uXNV3vqlqZb//RaIbgYZcduiG7zEUXskLq4tmCgF80wZWS4naK+?=
 =?us-ascii?Q?riy41gWRpyqv9QI9xzoWF3T05e1QSUiMJH8SUL01I2pi/zj861p0DKe/3/1O?=
 =?us-ascii?Q?1rlyoaaHzZiJD9Bv0naQC2g1TiYdXVC1sjfe9pN65GnWQL7I0rn3Tu3+1pZl?=
 =?us-ascii?Q?0s9arogYxzAFCCIkolBtWhv279EF5tLL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?33J19Tl1rRGv2Tg/7d4JRwKrbp0dTjixTQ+euEi2LmT03i14+eaQwTbYeirA?=
 =?us-ascii?Q?yudvQoa5MI332U34Qe2NjV6mchZXoLAjF/MMocPtjN8VEC0gWH+SDALmKqJ/?=
 =?us-ascii?Q?HTJrgwW3E8xzSXsLNAnnZTJp17z+cknO+j1iRaIURcIpZa4zyddggT/omkbZ?=
 =?us-ascii?Q?q8c8juqDTLGo4LBZMflsXFFoyFbVfK0abUrh/r8DF8W+HsExbSUlqDa/ixjy?=
 =?us-ascii?Q?KPfm7WL+FbTY6/ZysrzQCRQ0EwfjPpEFi0uRJZwl+BB41zK6nBfiWzsNsR1D?=
 =?us-ascii?Q?qnSZWn8WkPWsf3CJYZPQEriuhm/hBCYhS61uo6xq1qly9GWfu4USKexdhzno?=
 =?us-ascii?Q?zIcy7itm9knB+bJTnQ/tT2PNRiniMYMZ9Yj/6C/RtzTxTETz2Owaz7kHxvwX?=
 =?us-ascii?Q?/0KmHTr27aZZWvwQUShbjhgkT/ikLhJka4caDbuJ3sEO2HKhrAoStaiNfiJr?=
 =?us-ascii?Q?t8Dn6ndY8JWANOCNGwbWY1iVxvh7oBvlrXteWn+RKHy1T8X/N36f1xGvLreA?=
 =?us-ascii?Q?6i1h1uE46ABitQEb4OXg0cUukaXb4nP0lwptvQ5onLXQ3Gj4Amft7lFLWZyk?=
 =?us-ascii?Q?NVyPfSL3X/uwSj77xnY7OucDROaJxuHxpN0mKn5CN/11X+xeGst2TjicGD2c?=
 =?us-ascii?Q?IeeIL30IST02asjb0tWyQX6bh90PwxqWhwRNcBSvI7NAxhV/yFBEZalizDK2?=
 =?us-ascii?Q?it4RBRzbYNvR70/lOI0e97FdD4RfJ0hEOX43FqE7zIjGj4PPF76LzrkC2B6C?=
 =?us-ascii?Q?Jh+PRmKF5JQ+ra3x4jrg7pPqg5TxYLzMkK9jTsKcehERvzha4FjT9orlzeOy?=
 =?us-ascii?Q?INwsAtK99aRPYklHldvmfgoYVcvX/q3lu3YQxbwx4SIkvIsIj3/o3dYLJ9Sw?=
 =?us-ascii?Q?ZJ3VutBCErpQY7jOkQv+GjCAbgEMAKwtOsgsneE9ht0909/pGSy8HbW3i4Bd?=
 =?us-ascii?Q?Y2h54y0HjBXwTvCSzcjohYN48HEBaXM8vL1BfNGn5+c4BcOONn72SbCrFm+6?=
 =?us-ascii?Q?j7RLImZq1CiFAm0I63kytUuQ5AUYcfgbrjvvh52rMQCsTbyh0tVac3fudI4C?=
 =?us-ascii?Q?hcif6F4AP9KxBBhNptDBAuC/evV/+ItkoiDg2hqqds/z59vL6vDTSmNFYa1f?=
 =?us-ascii?Q?iSq7tseVLiIie5b301vwcqU5jFudRkYYfsvw663Gp+GL40rijd/+hBd70OyA?=
 =?us-ascii?Q?ErMxyWiz0fgi0IKxSbWUnrMpPtAYUmnxT5aNO3b6LZgsXuYttjuqgBBY3IL2?=
 =?us-ascii?Q?o20O4HZG4ujKGvV21PgNEaktPw2zpEi+ieqkkcDcf0GPf/PexCXB9UwS4dds?=
 =?us-ascii?Q?sw2MypKDVMLSbddIzXAPm7LRytU2Uh5BpcUnur+a1vowThWCWRY8RqF6H5HA?=
 =?us-ascii?Q?eYQOZMr/hVXT6sDIyUTRg8BAUOtNZdg4HNaiFoEBWbgx/3hWLFm+7gUjJIAg?=
 =?us-ascii?Q?H7B06r3+GfUVg7brEJ05zLv2ylruDw7KxdMMQeF19pzdT/ml+J6YWpTWawSD?=
 =?us-ascii?Q?aZFRnx3kbN3XdpOqvJ0Fq5g/a1oTIKLyrGa7JtHTKATl0vO/9d0elLT/l3Ko?=
 =?us-ascii?Q?m/pEJqUWi0AlZ113InMDqmOhzL5nPXkFb5Qy2rQHQ1WLfqcVa+YkfGvW/n+5?=
 =?us-ascii?Q?ChEfn+unpBuSW2Ej3xhs9pTKOGu3cYL3eeH/y5Y5c8ToR8jpOUqq+ZWjz8yU?=
 =?us-ascii?Q?zm/TLQoRKMZXPUmzBxrX+8No+UNkODy/yC9Rh7tuVweF4sL4ffur1NSbGhaa?=
 =?us-ascii?Q?NKVNy5/io2aGRJJ5TrnkwtF+riwnm+p+S0QF3k+sd3fEJw3toRnO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 065d490c-f40b-478d-c27e-08de48b1c69e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 21:15:51.4093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/dDxTeR9aTuD2ulLACNtNEXSLG8WymHv7Olw5Xen66Uo5kOfeA9opl3huL6oY5WZ09K5Ica6RpWbLaj+3uw2jZslu0F9WNC1UdwNRpdWI6pHevbMZEVFhSwRRl8WFwO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6338
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

On Fri, Dec 19, 2025 at 05:31:53PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>
>Check multi queue functionality in parallel execution scenario.
>Changed naming for multi queue and assign exec_queue create
>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Same here, remove email ids that are no longer valid.

>---
> tests/intel/xe_exec_threads.c | 39 +++++++++++++++++++++++++++++++----
> 1 file changed, 35 insertions(+), 4 deletions(-)
>
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index e8d56a3ef..4bf1cd1b1 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -41,6 +41,7 @@
> #define REBIND_ERROR	(0x1 << 12)
> #define BIND_EXEC_QUEUE	(0x1 << 13)
> #define MANY_QUEUES	(0x1 << 14)
>+#define MULTI_QUEUE		(0x1 << 15)
>
> pthread_barrier_t barrier;
>
>@@ -540,8 +541,22 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>
> 	memset(sync_all, 0, sizeof(sync_all));
> 	for (i = 0; i < n_exec_queues; i++) {
>-		if (!(flags & MANY_QUEUES))
>-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+
>+			uint64_t ext = to_user_pointer(&multi_queue);
>+
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>+		} else {
>+			if (!(flags & MANY_QUEUES))
>+				exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		}
>+
> 		if (flags & BIND_EXEC_QUEUE)
> 			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm,
> 									0);
>@@ -979,6 +994,8 @@ static void *thread(void *data)
>  *	balancer mixed fd userptr invalidate
>  * @bal-mixed-fd-userptr-invalidate-race:
>  *	balancer mixed fd userptr invalidate race
>+ * @multi-queue-shared-vm-basic:
>+ *	multi-queue shared vm basic test

I don't see MultiQ mega feature being added here as done in patch #1.
Looks like it is not consistently added. It probably makes sense to
remove it from individual patches and add a separate patch for all
the multi-queue tests.

Niranjana

>  */
>
> static void threads(int fd, int flags)
>@@ -996,8 +1013,11 @@ static void threads(int fd, int flags)
> 	int n_threads = 0;
> 	int gt;
>
>-	xe_for_each_engine(fd, hwe)
>+	xe_for_each_engine(fd, hwe) {
>+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
>+			continue;
> 		++n_engines;
>+	}
>
> 	if (flags & BALANCER) {
> 		xe_for_each_gt(fd, gt)
>@@ -1023,6 +1043,8 @@ static void threads(int fd, int flags)
> 	}
>
> 	xe_for_each_engine(fd, hwe) {
>+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
>+			continue;
> 		threads_data[i].mutex = &mutex;
> 		threads_data[i].cond = &cond;
> #define ADDRESS_SHIFT	39
>@@ -1277,6 +1299,7 @@ int igt_main()
> 			FD | USERPTR | INVALIDATE },
> 		{ "bal-mixed-fd-userptr-invalidate-race", BALANCER |
> 			MIXED_MODE | FD | USERPTR | INVALIDATE | RACE },
>+		{ "multi-queue-shared-vm-basic", MULTI_QUEUE | SHARED_VM },

What about other tests? Why not add multi-queue variants of those?

Niranjana

> 		{ NULL },
> 	};
> 	int fd;
>@@ -1285,8 +1308,16 @@ int igt_main()
> 		fd = drm_open_driver(DRIVER_XE);
>
> 	for (const struct section *s = sections; s->name; s++) {
>-		igt_subtest_f("threads-%s", s->name)
>+		igt_subtest_f("threads-%s", s->name) {
>+			if (s->flags & MULTI_QUEUE) {
>+				igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0)),
>+						"multi_queue is supported on graphics version 35 and above");
>+				/* Balancer can't be set with multi-queue at the same time */
>+				igt_assert(!(s->flags & BALANCER));
>+			}
>+
> 			threads(fd, s->flags);
>+		}
> 	}
>
> 	igt_fixture()
>-- 
>2.43.0
>
