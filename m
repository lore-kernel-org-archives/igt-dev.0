Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C141C5B552
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 17:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9B710E0DF;
	Mon,  9 Jun 2025 17:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBxUnZRq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FEB10E0DF
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749489739; x=1781025739;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A9qvgyk/PhqgA7cNBkDgQIg24cX/eOSq++AWzF/myXM=;
 b=MBxUnZRq7cu3/d510i3f39RBy9TATAAUKedDpfH+0+ufjw2iGkxyYBju
 2Dpbnvapo9qRkszqG3pgGWGUv73gHHxbEZqO7GDfzK/2WR+YwZu7OttXJ
 gFWNlPV+PXadPigsKXDcrRnO0MGUoEyeQJwFqGgchJ453AHmbBrNSCSuA
 6oIsR29fKPgLNzkUWaZsu1hsJUzEvpLgj29BxSLuLtGO++GkDpTPdIpmw
 RFv54k+XJzHuhiWPGQE9mHj7xR329bC7DAS5/LyiSAf+OxRglS8C2B3SG
 NsxwPr+pyc5nyvjYf0UkqGX76N8VJwEeC+Tc+0OYL8wSb8NxZk4fJJdSe g==;
X-CSE-ConnectionGUID: 4UCI8FihRt6KYCDJ67G42A==
X-CSE-MsgGUID: 8iNbujJVRGOo33O1FBdxvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51720806"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51720806"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 10:22:14 -0700
X-CSE-ConnectionGUID: tgRIy20SR5mBwOOqx4SMjg==
X-CSE-MsgGUID: 1Uc4tBQ4RVSJXYGD1pLDOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="151827182"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 10:22:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 10:22:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 10:22:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 10:22:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6nbDYi5AL0y4HEFFFVX+l3eSgY4zr5Wlq7NmVW75kDYFlOBUpbTjVmftjE8SIgTInTeWy7nsUugfG73CnodUve91E8urtNIGa0M5CCQxYVFr5CGGjj0jucWhwDc2UJwM/liMhI28I3R8MVPGWXEnHvnHr0zX+wPHXvugfv0kj+vAOtamj4m2UOfEn0Fbs6e0kolgI/cA17ZPFiEbWj8J0TZUSPrFGdsM85QuPxPAq/rK5vOAbbkK4U0lHGGi/PWX2XpMvZHj+9o2qWVBpuLAvjsUlddHpmcehAAPsaH8rYB+4JeVLhVr+Hqz3nJDYizEK++L5ME4R+Qxyo1dB8m/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ffDpTYLh3zHy3J0ams26lrWjitxPztkZ/U1Oj4LDDg=;
 b=ZMoY2pEjR+vOns2NY2y7/SXrm/rH0EXeAgkxS2O/CX3UOZYjgeoyQbT0jGhPZFhH2BgBjbALsqxbbQO24a5RrOBxrV7msz0Nnhs6Oq/3Fe3+9ih9Xagnk0DhHSBvleA3ch/OxD1DWnVYahC+RYEF0yTSUkqMkF7coR9g2c48wzMzjHCYkHOzE1+eDLWMgtoN+G/JRa7M0b1O7fj/BLP93gkTqRmKRs7xxQCjr4V+9kRZb16rVqIIsBsi12DmwY4ym2jUdcVsDicNcnbz6wyHlVGVJuXj1+uGWrjXd4lbCyn4ojEhJeQxi22G/V+kFSB9F1syLoHbTduu3mZ3xR1AUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6247.namprd11.prod.outlook.com (2603:10b6:8:98::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 17:21:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 17:21:54 +0000
Date: Mon, 9 Jun 2025 10:23:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/2] tests/intel/xe_exec_system_allocator: Validate
 preftch of svm with single and multi ranges
Message-ID: <aEcYj9KkhzNHXfIV@lstrano-desk.jf.intel.com>
References: <20250529115237.25974-1-sai.gowtham.ch@intel.com>
 <20250529115237.25974-2-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250529115237.25974-2-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: MW4PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:303:8d::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5a9ad7-e566-4c30-66de-08dda77a20fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ee9P9DBokLgyDTjesHwXwxvSrv52aGebg5uWDPRv5TNMC94EcPVtUTUuhJdz?=
 =?us-ascii?Q?JEED7ZctZq8GDrpX5u9lclKUsZBiR7TDe4mxd90pOfpzYbJlfHOzDzulIfKu?=
 =?us-ascii?Q?5/JZWnwat2+sMElFBM57V86Xk5m2rTsUkUNLGc6zZRgwr+ew1qf3fAQxN8/5?=
 =?us-ascii?Q?4W52h3UQLLlI1cFvwzV8vwp9VA3gmd/juGcahO3G/TUj4Z6skaC3Ah/gIbNj?=
 =?us-ascii?Q?bdOeJryTUdsVmM2ppeBVykAfbF/+K0+yH7/BkD3b4z2xjMuPTWhJj/CQ5bka?=
 =?us-ascii?Q?GBr7P4qM+SlS/gDrWABHAXc3E7gdz0Nwyr+PLPyvewaaTGc9EACimQT8+84g?=
 =?us-ascii?Q?JK2wRnTUa+62GwfHKwDhx+At5xaOppioXYOTvD8jRbeQdtRhEIERiLgb7IL/?=
 =?us-ascii?Q?pzXxnR68JTC21W8gO8LPtbSMB26/4McktrRUOHxyIPW2pUVVq1UupV8K7d9y?=
 =?us-ascii?Q?iSsi50/q/lre7m9Q0qWBpxl1hj7yW5O2vGZkglpOLLbYo1oJExLoKEY7tRZb?=
 =?us-ascii?Q?vek5/KV2gN8rBLIDlaUlDYD1xQHw+olq7jhw8eDFYMfSIhih8ZMhHKW3lyRy?=
 =?us-ascii?Q?x0gl0eZy3Ieq1kdPESYNKa5HLC3LsUbGEoo8k5oF4S8JiB6ytB09cvDyoV9C?=
 =?us-ascii?Q?N5ggw2O9c7VZj+MQ6DwsoIyDPj9dmSN9hOcNzNhLhygWkWNyPg0Ygo+c+a9O?=
 =?us-ascii?Q?o1eS4cI4pwSd+EZCEINIf6i338LvhUofzdE19jd2uUm83oFVAQBX4a70d26u?=
 =?us-ascii?Q?kQQRTRdxJzaCbxoekqK1IHRn08NXD4O7lqXai4BLFzP243sxSqaKScmKTFsF?=
 =?us-ascii?Q?RttZhdMiQgok1iW3R/LAHrl7kxY/FI7UyHAbjbi2JbPmfqhW57RnPau6V+hp?=
 =?us-ascii?Q?uLmoyqAqqMGDlqWRfM6Td0F4pTFEGR4b8uGl85OwdzD3VL3VuxQ0QjIesG7W?=
 =?us-ascii?Q?FIKbBebu9VbgGoqlgP368kiZzN8arGEd4YJKLCKoV2V4WAXshMV7vSF8McvM?=
 =?us-ascii?Q?VdnbsToD6MzG68T5JiO7pM4cdnWQnsRQ+US0M/HvOlrI5NZFrUQGu8tFK5Jx?=
 =?us-ascii?Q?M79zv4MicHKlWWpyNXYYybCM3cY9rnq3bb5lCf2dg8ddodU8r7qaVKtjH7Pv?=
 =?us-ascii?Q?VbDfWqIgeQNfH53qTXbgkXpFCX+rcQZTxczkgOpUucWBt++nOVf9dtaD/hs3?=
 =?us-ascii?Q?Lrid8y29wtPnbEBBEq4FHEWHvGkyjMh5US6Ma6tZHlffKYk03th0zUgwSduh?=
 =?us-ascii?Q?KemXmjcx9dUZThC/anFBR1h96Rg5sXoSris0Z2O94LCrUM2SCTAAYifaE98b?=
 =?us-ascii?Q?UNxdhvKSYEi8oTD/dugGh3jcyaEVKrp7xwt4cqzZtGJlo0p4hX/N1eKtbQve?=
 =?us-ascii?Q?6iWwjPlUk9Rd1QvbXVASK4LZgoNROs5xdAs3NtFR+8yNqHvhOJkpB6UcyXcz?=
 =?us-ascii?Q?Kb5vWWqP1xI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nhar995WQQy2pxIkAUh0bpJccbK+EzmJZh/C0rcvG5n7vN2t9OhqXxgmMGfs?=
 =?us-ascii?Q?ZdlSaCiTOzKjKkytUpomLWOZL/LuxamHfg+20tB+q34F33AaqrWhDr7oo7WL?=
 =?us-ascii?Q?fcBD/Q/PFJ8gqIUDg7dkiOIahEwhwJ/JV+GI+RO0vjJYzciLYFek6nO7o3kI?=
 =?us-ascii?Q?MrsdZvNN5Ef+zeFskQ1zWgRmGPVRnI/ASDaluGN4FBPjMReMAxVAhRzvGsHd?=
 =?us-ascii?Q?t21ibHMpLujLaoiYAgPTLi7+Sr3auCqbVn4Em2g1tXRutaaON59lkJxtexbH?=
 =?us-ascii?Q?u3ygyrBGUDi4+XJ+CZV1GxNZk+9Dtekvyx2DWibKo/gFmCSxl7OCWSNwXTMV?=
 =?us-ascii?Q?80EMdhgRBh5oRH5ioTfuqUZwXvcCP8exN2LE+WxbXWusnyHdYsrHZg/rm0t6?=
 =?us-ascii?Q?e/LkzF8/NDdF+RXw+YXHFn5zj8hPH0oxQphsa78tpW8gxX3q8B7wU8UHNyAe?=
 =?us-ascii?Q?osHVmf1+lDEZlh1eoDB9PuzwQePLs3Zj5hIchfusFm8N8+0rx7jJ/X1yrYWP?=
 =?us-ascii?Q?VckXyONa7yxNplXFrtvdfcn4LmodIQ0fr67OVl50lsaQla0dmUng2gDvYGej?=
 =?us-ascii?Q?+a9iblJvK1R20J/BIqCiZFbf6QJuk71qgjpx3xLC2Pi5SlHJmG2qN8TGMtO4?=
 =?us-ascii?Q?CPo8n6N1hqvwMq7+tw0j+x5PHA15RyK79ucNos3gwNnx67VUdZp5+AnzONUY?=
 =?us-ascii?Q?F/H2h5OqNY622XWuHWhWzgES0DadsXQXIJWdPfhWtBUr7Jw/Y7/oEl9m0QBP?=
 =?us-ascii?Q?zn+/xQL7wV01saRcaVIcItofJSRZ1LKxBHp4MCAsyfqEfzQYhaIaxxTyg0Z5?=
 =?us-ascii?Q?zzXFTuhNtODdLVFq7AhqPWBpc6vynzTKbDPxtpgIypJ3FMIGdOvZyT4NCxDo?=
 =?us-ascii?Q?/pWt2hNh9rJ6/I746/wU/353jegrlS8Ft429m5P78LGoZ9xPLT3vLMtUMkHA?=
 =?us-ascii?Q?nLJpWyrdbKF0ASPXQ8Q7RIlcRyet4SFkGyQOn34oIuQdnzoOXVX9VLUc81US?=
 =?us-ascii?Q?/qvaPxMcSPWg6HE4LD9AFJ0feDmRyu2rqEtGCu9knfQn2aqCT+rUMfKUVK6p?=
 =?us-ascii?Q?WcbKn2oamB9+E9IZqgUApekvNTHUG5aC9HGZQXEkJKk3mQIPrKGhy3pA+4+N?=
 =?us-ascii?Q?uF6UbXPeE5q3O8ffHUY88ITjaW6crV5eK+XlRhsM34wT3RmCtQnW1unvz5jH?=
 =?us-ascii?Q?8zKLWFKoy7F3JX5fokdpi/1NzpVB9esk4OEHK/8xK/ThNaKLBXnt+qWzoonE?=
 =?us-ascii?Q?lpRksToVdP9Ju++HJFEze1gJv+/Refr5M3em1m1EfOel1erhPyP32rouJT3d?=
 =?us-ascii?Q?IMUguIkDaWy3UhyvbbvO4vXrx7gMJAWixCrUukEQk3gi74kxoNnTWqndr7P8?=
 =?us-ascii?Q?70Fa+8op/W70jqYXR2fvwygBND+bXQ6/YbDwkh2kK/zLEqU5v5yP3R2DVRxd?=
 =?us-ascii?Q?m2DdP9tfqciDD67HL2lpe+fy+s4SDDuDHu5V2dpj/yW9SdENGPGSf+p+jde6?=
 =?us-ascii?Q?b3IRdcO19V1oZFUbduBH0QwoXUYe80gCIPrKGqe3SWIsH7Dyip62KcjUmRmf?=
 =?us-ascii?Q?tn6RrUB6M9LaEaQYucd9AZ702c2CqEu0hTe7mBYG2REASBhaJQTSuOBQP2na?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5a9ad7-e566-4c30-66de-08dda77a20fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 17:21:53.9608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdCVcTSshrj5PndWHaoyCM/SJyU3zgkMKb1NbCwg2H8dlhKH4L9rcESd17SJ/wsZ/5lCkumgmGMRCWw75j1NAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6247
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

On Thu, May 29, 2025 at 11:52:36AM +0000, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Tests validates Prefetch of SVM with single range and multiple ranges, with different
> range of sizes. checks if not svm pagefaults are seen while prefetching the ranges of
> svm.
> 
> v2: Enhance test to utilize smem/vram flags from the selection loop (Jonathan Cavitt)
> 
> v3: Integrate prefetch tests in exixting test_exec (Matthew Brost)
> 

This not what I meant at all.

Here you just moved the directed tests in a previous rev from a
dedicated function into test_exec() but they are still directed tests.

Directed tests are out ok for very basic checkout but utlimately usually
worthless in exposing hard to find issues in the KMD memory management
(e.g. races, concurrency issues, locking issues, missing TLB
invalidations, etc...). That is why this test is built to scale from
single threaded, to multi-threaded, to multi-process (e.g. do it once,
do many times, do many time in parallel...).

I am suggested you build prefetch naturally into test_exec() flow so you
get all single threaded, multi-threaded, and multi-process sections
generated. I've done this locally and can share on the list if you want,
or let you try again. FWIW I've appeared to found a KMD bug too in the
multi-threaded / multi-process section too which I'm still root causing.

Matt

> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 135 ++++++++++++++++++++-----
>  1 file changed, 109 insertions(+), 26 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 06daac8c2..9596f7be3 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -20,6 +20,7 @@
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
> +#include "xe/xe_gt.c"
>  
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -770,8 +771,11 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>  #define SYNC_EXEC		(0x1 << 19)
>  #define EVERY_OTHER_CHECK	(0x1 << 20)
>  #define MULTI_FAULT		(0x1 << 21)
> +#define PREFETCH		(0x1 << 22)
> +#define VRAM			(0x1 << 23)
>  
>  #define N_MULTI_FAULT		4
> +#define MAX_BATCH_DWORDS	16
>  
>  /**
>   * SUBTEST: once-%s
> @@ -957,7 +961,24 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * Description: Create multiple threads with a faults on different hardware engines to same addresses, racing between CPU and GPU access
>   * Test category: stress test
>   */
> -
> +/**
> + * SUBTEST: prefetch-%s
> + * Description: Test to validate functionality of Prefetch of SVM %arg[1]
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-%s
> + * Description: Multi range Prefetch of SVM %arg[1] and  check if multiple ranges are created
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @smem-SZ_4K: with size of SZ_4K on smem region
> + * @smem-SZ_64K: with size of SZ_64K on smem region
> + * @smem-SZ_2M: with size of SZ_2M on smem region
> + * @vram-SZ_4K: with size of SZ_4K on vram region
> + * @vram-SZ_64K: with size of SZ_64K on vram region
> + * @vram-SZ_2M: with size of SZ_2M on vram region
> + */
>  struct test_exec_data {
>  	uint32_t batch[32];
>  	uint64_t pad;
> @@ -981,7 +1002,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
>  	  unsigned int flags)
>  {
> -	uint64_t addr;
> +	uint64_t addr, target_addr, ba_addr;
>  	struct drm_xe_sync sync[1] = {
>  		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>  	          .timeline_value = USER_FENCE_VALUE },
> @@ -993,15 +1014,20 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	struct test_exec_data *data, *next_data = NULL;
> -	uint32_t bo_flags;
> +	uint32_t bo_flags, expected, *result_ptr, *batch;
>  	uint32_t bo = 0;
>  	void **pending_free;
>  	u64 *exec_ufence = NULL;
> -	int i, j, b, file_fd = -1, prev_idx;
> +	int i, j, b, file_fd = -1, prev_idx, svm_pf_count_pre, svm_pf_count_pos;
>  	bool free_vm = false;
>  	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
>  	size_t orig_size = bo_size;
> +	size_t slice_size = bo_size;
>  	struct aligned_alloc_type aligned_alloc_type;
> +	const char *stat = "svm_pagefault_count";
> +
> +	if (flags & PREFETCH)
> +		bo_size = bo_size * n_execs;
>  
>  	if (flags & MULTI_FAULT) {
>  		if (!bo_size)
> @@ -1134,7 +1160,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	for (i = 0; i < n_execs; i++) {
>  		int idx = !stride ? i : i * stride, next_idx = !stride
> -			? (i + 1) : (i + 1) * stride;
> +			  ? (i + 1) : (i + 1) * stride;
>  		uint64_t batch_offset = (char *)&data[idx].batch - (char *)data;
>  		uint64_t batch_addr = addr + batch_offset;
>  		uint64_t sdi_offset = (char *)&data[idx].data - (char *)data;
> @@ -1155,12 +1181,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			write_dword(data[idx].batch, sdi_addr + j * orig_size,
>  				    WRITE_VALUE(&data[idx], idx), &b);
>  			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
> -		} else if (!(flags & EVERY_OTHER_CHECK)) {
> +		} else if (!(flags & EVERY_OTHER_CHECK) && !(flags & PREFETCH)) {
>  			b = 0;
>  			write_dword(data[idx].batch, sdi_addr,
>  				    WRITE_VALUE(&data[idx], idx), &b);
>  			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
> -		} else if (flags & EVERY_OTHER_CHECK && !odd(i)) {
> +		} else if (flags & EVERY_OTHER_CHECK && !odd(i) && !(flags & PREFETCH)) {
>  			b = 0;
>  			write_dword(data[idx].batch, sdi_addr,
>  				    WRITE_VALUE(&data[idx], idx), &b);
> @@ -1177,28 +1203,36 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				    (char *)&data[next_idx].data - (char *)data,
>  				    WRITE_VALUE(&data[next_idx], next_idx), &b);
>  			igt_assert(b <= ARRAY_SIZE(data[next_idx].batch));
> -		}
> +		} else if ( flags & PREFETCH) {
> +			batch = (uint32_t *)((uint8_t *)data + i * slice_size);
> +			target_addr = addr + i * slice_size + 0x100;
> +			b = 0;
>  
> -		if (!exec_ufence)
> -			data[idx].exec_sync = 0;
> +			igt_assert(b + 5 <= MAX_BATCH_DWORDS);
> +			write_dword(batch, target_addr, 0xDEADBEEF + i, &b);
> +		}
> +		if (!(flags & PREFETCH)) {
> +			if (!exec_ufence)
> +				data[idx].exec_sync = 0;
>  
> -		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
> -			addr + (char *)&data[idx].exec_sync - (char *)data;
> +			sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
> +				       addr + (char *)&data[idx].exec_sync - (char *)data;
>  
> -		exec.exec_queue_id = exec_queues[e];
> -		if (fault_inject)
> -			exec.address = batch_addr * 2;
> -		else
> -			exec.address = batch_addr;
> +			exec.exec_queue_id = exec_queues[e];
> +			if (fault_inject)
> +				exec.address = batch_addr * 2;
> +			else
> +				exec.address = batch_addr;
>  
> -		if (fault_injected) {
> -			err = __xe_exec(fd, &exec);
> -			igt_assert(err == -ENOENT);
> -		} else {
> -			xe_exec(fd, &exec);
> +			if (fault_injected) {
> +				err = __xe_exec(fd, &exec);
> +				igt_assert(err == -ENOENT);
> +			} else {
> +				xe_exec(fd, &exec);
> +			}
>  		}
>  
> -		if (barrier)
> +		if (barrier && ! (flags & PREFETCH))
>  			pthread_barrier_wait(barrier);
>  
>  		if (fault_inject || fault_injected) {
> @@ -1209,7 +1243,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  					       USER_FENCE_VALUE,
>  					       exec_queues[e], &timeout);
>  			igt_assert(err == -ETIME || err == -EIO);
> -		} else {
> +		} else if (!(flags & PREFETCH)){
>  			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
>  				       &data[idx].exec_sync, USER_FENCE_VALUE,
>  				       exec_queues[e], FIVE_SEC);
> @@ -1289,8 +1323,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  						      READ_VALUE(&data[prev_idx]));
>  			}
>  		}
> -
> -		if (exec_ufence)
> +		if (!(flags & PREFETCH) && exec_ufence)
>  			exec_ufence[0] = 0;
>  
>  		if (bo) {
> @@ -1355,6 +1388,31 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		prev_idx = idx;
>  	}
>  
> +	if (flags & PREFETCH) {
> +		sync[0].addr = to_user_pointer(exec_ufence);
> +		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 1 : 0);
> +		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +
> +		for (i =0; i < n_execs; i++) {
> +			int e = i % n_exec_queues;
> +			result_ptr = (uint32_t *)((uint8_t *)data + i * slice_size + 0x100);
> +			expected = 0xDEADBEEF + i;
> +
> +			svm_pf_count_pre = xe_gt_stats_get_count(fd, eci->gt_id, stat);
> +			ba_addr = addr + i * slice_size;
> +			exec.exec_queue_id = exec_queues[e];
> +			exec.address = ba_addr;
> +			exec_ufence[0] = 0;
> +			sync[0].addr = to_user_pointer(exec_ufence);
> +			xe_exec(fd, &exec);
> +			svm_pf_count_pos = xe_gt_stats_get_count(fd, eci->gt_id, stat);
> +			igt_assert(svm_pf_count_pre == svm_pf_count_pos);
> +			xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queues[e], NSEC_PER_SEC);
> +			exec_ufence[0] = 0;
> +			igt_assert_eq(*result_ptr, expected);
> +		}
> +	}
> +
>  	if (bo) {
>  		__xe_vm_bind_assert(fd, vm, 0,
>  				    0, 0, addr, bo_size,
> @@ -1598,6 +1656,19 @@ struct section {
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> +	const struct mode {
> +		const char *name;
> +		unsigned int flags;
> +		size_t size;
> +	} mode[] = {
> +		{ "smem-SZ_4K", PREFETCH, SZ_4K},
> +		{ "smem-SZ_64K", PREFETCH, SZ_64K},
> +		{ "smem-SZ_2M", PREFETCH, SZ_2M},
> +		{ "vram-SZ_4K", PREFETCH, SZ_4K},
> +		{ "vram-SZ_64K", PREFETCH | VRAM, SZ_64K},
> +		{ "vram-SZ_2M", PREFETCH | VRAM, SZ_2M},
> +		{ NULL },
> +	}, *m;
>  	const struct section sections[] = {
>  		{ "malloc", 0 },
>  		{ "malloc-multi-fault", MULTI_FAULT },
> @@ -1792,6 +1863,18 @@ igt_main
>  			processes(fd, 16, 128, SZ_2M, 0, s->flags);
>  	}
>  
> +	for (m = mode; m->name; m++) {
> +                igt_subtest_f("prefetch-%s", m->name)
> +                        xe_for_each_engine(fd, hwe)
> +                                test_exec(fd, hwe, 1, 1, m->size, 0, 0, NULL,
> +                                          NULL, m->flags);
> +
> +		igt_subtest_f("multi-range-%s", m->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 10, m->size, 0, 0, NULL,
> +					  NULL, m->flags);
> +	}
> +
>  	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
>  		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
>  
> -- 
> 2.34.1
> 
