Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AD2C3ABDA
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 23:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7027810E755;
	Wed, 14 May 2025 23:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e66WUYJE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CB110E755
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 23:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747263848; x=1778799848;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X+uL7b4Du9KHaeMZbxTBJeBQ8T0iHQhoBX3iuMvasWk=;
 b=e66WUYJEAaAPb26kxQuNAawyYPhjOAV0KPMmNpEaGNHukK4HM7KW26Q0
 JWgKjM3noWQ+0G8Df0ieDlxmLEhOeWF9u/gjY9BwIlXtqcF9YZXbyucjk
 6NMb3wFFjAHwmFbx2HLx1MKQVLDKVuxj238lzku1O9AMCQ3mYOIBwAkrj
 BP8TjvJ4F4YfYg5XBpM66FDIRAhDU9goqZ8A1Y96Lnw6d8aPCCk92EVVF
 Al9Y24Ke8Sbb4AaEctUR3XBmA+rhMJCFvwsN+c/s8y8lqQS+p0AzYzLF9
 0v+9pEWanRa3lGCNMAb8mdE8cj2zcRTmSjet7BZneobz/7YMwjt4lZGCF A==;
X-CSE-ConnectionGUID: 2ngML5xeR82iI1abuSlsxw==
X-CSE-MsgGUID: Ucd3eC6BRmWCutL5D3fWLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49322764"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49322764"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 16:04:08 -0700
X-CSE-ConnectionGUID: Ky6khlS6SIa3Lcs2oX0YXQ==
X-CSE-MsgGUID: lKFd0zAbSHSgue483B0RIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142203828"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 16:04:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 16:04:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 16:04:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 16:04:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTU3ryrYjnZznwMw6k5l7k9Zt6CGC2azY15RhpvgQbgXP/BJi481g2KTPXLBosJjIel8cudx3aqazdhHT1S0gtcNr7XL/RH6yredXLlbZdqUYr5ByJ1O6StsEPiu4EvTQU0qMH5TucSpQEUzJ0pejQZIIUuMvroWRfVWnLSWOl/Q5Xj4STDGp/72vrPMZnPWmBoehyLMtXBhXKSNjW4n33lqo2HAOBmRqCsSPfkzKAlST9VrKIisy5WtS70vLAS5OJ3Dy2wod97vGwo1Ly5tlzV6ODdIwlNM1dbZs/qZpXIZ68lJKZ5459ykxd65UKULv8eex/80W6ZAWmNByIa+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89K08/bk6Z+p5yrawNikZQhuaj3NlJ70teF2VSUynBg=;
 b=Dz39qdYqYSyvIXyY06scDSZbtabQm48k1UPvmT4++Y1c4dJmOymqE67T5ini+4v3Yh47SRKkYMPzvMPoW19i1eSelLzs/VY1RO+m6+ypamBxyxutTC68lxxgFA+kzPgHoOP5XMzKYfnckLnh2cOkeezlCp1qvOLXFc41jRcgc+ZH/yEZ8Pnu+CjT9p4e8w0nhPi444mGTr3FG5bU+QF1wV912pwgd3qO3y99tupI5/78tyDXzd3pd3wEmat33guRNKRO4EUOpI/LRdPECPtYP6bYjwqx4K6lIOfdv5QrbkKr89VSY1H56eg97+ZsbDL/gsHpRXI8PQremfAfDa294w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 23:03:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 23:03:17 +0000
Date: Wed, 14 May 2025 16:04:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate
 preftch of svm with single and multi ranges
Message-ID: <aCUhjArfpwMyRfv5@lstrano-desk.jf.intel.com>
References: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
 <20250513170711.14518-3-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250513170711.14518-3-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: MW4P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d32dbd-d069-42f2-3a8d-08dd933b8367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2O511jX0VsOcxlDjzBORjqVdTAPS3kYLFUVAwiLhd2McRMrl6Zll11KjWjCx?=
 =?us-ascii?Q?xBl1djGVT+oSTyiHiXp/zYS+dIbpkgZv2N0BonfRq7n682cP6HjbV9E+2nV+?=
 =?us-ascii?Q?6A7rJzBvqPje7eO3kv4bhTtZQWye+xuw4D+teg5ZJG62oGe+Sf9gtWVTetdI?=
 =?us-ascii?Q?FZSG3EhCnd/xsRjQ4h+WvYDyxHsz+rZhbfoxeF/lYXrmhl4rwWLJZwO+Q8xj?=
 =?us-ascii?Q?O9zirJpzYbNlB2wanyu7PX9bVfgNtsOPa56uzlfb+qxdsX0WrvV8Us4Yu5+p?=
 =?us-ascii?Q?0W6ONZue+dX1547mVlPITU7U0SzbKooWk7SEjA1JemDRfbUaX6x9bhMoMD8W?=
 =?us-ascii?Q?oLx2xHNIiPFIpPNxDAVXP4ZhYo3uV9PSNPsb4ihXDST0iAeOVWlGd8vxMhne?=
 =?us-ascii?Q?6aAjZorojt3TGYNfFXKfIHaWDuOFUKTFZ/hiBKOZdySRJAJXhs5VUwDczOlc?=
 =?us-ascii?Q?mE6M4rIjP9ftfcfuX0WZRh13u0sC+xigivRaggpLQS/EuIUS25fxlX+gaADi?=
 =?us-ascii?Q?CoVfKKIvx5tMcjemSS1P/090FR8IOrsWM9+7u9nsFntlpogk53K8cLevqSYX?=
 =?us-ascii?Q?98yF0p3gcx/d7NAB0sRd8sa+KGR5HjEO8ErUUlFKcHwUEAVpczJHDU+nKTvT?=
 =?us-ascii?Q?cTiyrmabZaZ5riFu8y/5CK4lbhCsH9UbyARxrYWO0f853gu3LUQpVPCBTIND?=
 =?us-ascii?Q?sP1wHRsbfIXu7tlEl2Pp30Bqep158ChCwcwxIiapogdLj95hL6Sk39/JLLCx?=
 =?us-ascii?Q?3a7sVNnkDy0JOCNgjBb00L3Pj2D0r1jvTgeGjjhRlEna5VekYT1eZfxb24yM?=
 =?us-ascii?Q?G4i7a+i1L6bFnKSYi7KLaeQJEwq2Ezv+eSlKuR35t8tFgN6335lP4l3Bem/W?=
 =?us-ascii?Q?3/ZqT18DNDnMiVX4vZ0Xj1qYwUIYFr1I5wCauhpuPCDu7wvzNJPWnlZeVsmv?=
 =?us-ascii?Q?aqzBiHykJ8rsskTyCBzfta1IkFmeFhsJL72y++HZSbxfayuhfDt8LyKRztyC?=
 =?us-ascii?Q?OIL1UaTMT0QXA+/DwnLCHjWPeK89NnQ2oNJ9VUJiCpaL+tpqJyqAEqp+nACN?=
 =?us-ascii?Q?yv1ecsOvppx37QantDoL7cw+M9OLZvjrZtDQwDIzsFF3kE33j0WSZF4/+ZUK?=
 =?us-ascii?Q?bSZmqt3ZRyLBIfaeHudbbsWtyTkHVdn32NSfpL7AW05wV4vCUGANjyrvrqXo?=
 =?us-ascii?Q?CQVtexvLGI2BHSQmu1i+22i6mvJTDMllvVpwnKPO29RpJ0c7UI2ub/u87WkK?=
 =?us-ascii?Q?8uj38/UGL8yidFkYEa8p9vv4oRkiNrr1JRngz7xqEXJcY67HMEBWFlFOMil8?=
 =?us-ascii?Q?shUxgfRUdtjYYA4YNjcKWsRTB4Z6IBP2qR5zXbSBcuHtMNDzRgXU4jyMXZdB?=
 =?us-ascii?Q?ZNHZcZfXnapZrc0nmWl89fYneIPAH7YaYapwdpiI6Egab9XZTdTXa1hbAjXE?=
 =?us-ascii?Q?FklRWT04B4w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qedCCy5hGPuir0LfnBpuh8FvjYsY49NxDyhKCglX0jtF2N4O51IgoSiErMds?=
 =?us-ascii?Q?djw8QZkOIvn6FjGu1HkbqHDQdVdPASaunk+Zm5zrCG8irmb9S7UOjihILePd?=
 =?us-ascii?Q?+KuVagsH1HbL0HCDTf3O7zdmurbVSEk90UCHhGIM9yfuRGgjq7RHhmhoednX?=
 =?us-ascii?Q?RFES80Gsqy7vp87NrGBm5VICHXqJIx50rQv9FmvhHBZQ4FjIiwHqLq/yes8W?=
 =?us-ascii?Q?3rgeB2vGtMjmlWGq3Ce7mmpWPDMNAJkASz5Znp//A10qJODeBwhtaxKNA3Ko?=
 =?us-ascii?Q?1IqlY2KG9fb+1EyadYwpyqwPcnOHMGj/l4zLXhc3etgOOdEpaU9B3eKY9q9R?=
 =?us-ascii?Q?42Ll11YmaGNmiHWwJvtKVNqM6lhmEuW0LDSD2hsvOGOQ/wjM6KvGzIt1+udx?=
 =?us-ascii?Q?CNSQCMymUKC0mqC80IN2ZXicm6FQgcM5r7Qpnq50tQAvZturErVQIbrrYqbr?=
 =?us-ascii?Q?i6XGRgR1PTrainv+s/IQB/2mYRAR7o3E9OyOw2seaga8B+nXY5ElCE/OfHS5?=
 =?us-ascii?Q?34cFsKE+gtRnYsa4vG8tT4eZyr8C19Xq7vSv4Z3eBfgCfLPrsmQYu7oXgV2s?=
 =?us-ascii?Q?GfgvVuTwIeXBRiVvO5lJ+QF5JGAsbbxDyFpWWDa7Ev9eHe1OHyqLRQKzRtha?=
 =?us-ascii?Q?ezPhPHSq8Sj8Ay2eNNuRavFz4O6hvt8CsXJobvA0gMhSvsfQQ8M1OdyivNPt?=
 =?us-ascii?Q?tkXBsypyCT20S0QX7mWUzzGyGpFHCYKk3N3oig+JhWfzoq537fGnZB78IGBE?=
 =?us-ascii?Q?w4ryCZXSEnbzBhZHjFZmguZsnJnxeWMIDO17uXl0WrlWF27xexsGFZWEcYoN?=
 =?us-ascii?Q?OO+yVRFTTiA5wsQGAFq+j2PQzjnnPRsNSRxAxQHHDenDI7naci251jC2JfIz?=
 =?us-ascii?Q?xFHUxgCILJoqgpBFINbIDPmA2B4nMsLSwKJo4n78KEtSw/vqoevFzFI8ncrg?=
 =?us-ascii?Q?e9izucCzW91dbT8EB2RIFLY7rxMjTLRG3kT8xa4UwyZ3vevlraovmOhvQei+?=
 =?us-ascii?Q?UUDxfuANB+R8RX22F9AV/4NMMfCZeYYJJ+NNMSDwnjpsoyhTYm5UDtSHjzZq?=
 =?us-ascii?Q?vHRqPGqaehrGx1s+vogQHyLpBnLiqvmfi+lznWSU5lYzNZqTac3ngdEw9L8T?=
 =?us-ascii?Q?2f9d0Jy6r2sME5iBVKUVly3lUz79pPF5e441N4tL1dPiGF7dMbizRrsY2EPP?=
 =?us-ascii?Q?ZB0HfvX87bdQVVb8k5DvxDjv4X4qb9WbFjGywHYaAG6GLctr/UAOH4r9ILYn?=
 =?us-ascii?Q?ZYhojIbap0yJ9Jv8a+0fI4a+baciIanMNSjTf1Q9NAMtC7eeVMEqTUoyuy81?=
 =?us-ascii?Q?iW9ZasbOWpLBWYKvTzzknjpq+kVFZXe/zDfJ/ZxVCYyHZPKj3nYZLoCIssLJ?=
 =?us-ascii?Q?JdVECrar5ovTgMf0W3wwySrfqGqB44lWhlI/hXvpEZSwbbSiYiopazk+lMS+?=
 =?us-ascii?Q?rIvpYBCFepN0kixp1IM2DjXQ/96HzyZqQrKWChB8AbZDgyxpU44FdRXSJRfj?=
 =?us-ascii?Q?m68M7i6QD0chjxAE6fzDEo+sjpWSTTTNEVxG/txD/fhhpsLE0NlaTubTE6kY?=
 =?us-ascii?Q?UoNyeR5dCIlW4+nCLQe7LKEDpNx6/rDvzk31nXMueDujGiUOtIbwYuc3ZLLA?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d32dbd-d069-42f2-3a8d-08dd933b8367
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 23:03:17.5699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYt2TUjAMZaX6maLTzXLZ2PrclhT89EIU6WlWTzRZZUXS+QVA8k8SBCE7e0L1NsBT6mwyHIDK4C/TWRjPbQGgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
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

On Tue, May 13, 2025 at 05:07:10PM +0000, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Tests validates Prefetch of SVM with single range and multiple ranges, with different
> range of sizes. checks if not svm pagefaults are seen while prefetching the ranges of
> svm.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 126 +++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index ba11ed834..c3f0e61f3 100644
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
> @@ -139,6 +140,7 @@ static void signal_pdata(struct process_data *pdata)
>  #define CPU_FAULT_THREADS	(0x1 << 2)
>  #define CPU_FAULT_PROCESS	(0x1 << 3)
>  #define CPU_FAULT_SAME_PAGE	(0x1 << 4)
> +#define VRAM            	(0x1 << 5)

These flags are for 'many_alloc' as indicated by the comment in the good.

>  
>  static void process_check(void *ptr, uint64_t alloc_size, uint64_t stride,
>  			  unsigned int flags)
> @@ -464,6 +466,106 @@ static void test_basic(int fd, struct drm_xe_engine_class_instance *eci,
>  	xe_exec_queue_destroy(fd, exec_queues);
>  	xe_vm_destroy(fd, vm);
>  }
> +
> +/**
> + * SUBTEST: prefetch-smem-%s
> + * Description: Test to validate functionality of Prefetch using SVM of size arg[1] at smem region
> + * Test category: functionality test
> + *
> + * SUBTEST: prefetch-vram-%s
> + * Description: Test to validate functionality of Prefetch using SVM of size arg[1] at vram region
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-smem-%s
> + * Description: Prefetch of mutliple ranges within arg[1] size to validate multiple ranges are created
> + * Test category: functionality test
> + *
> + * SUBTEST: multi-range-vram-%s
> + * Description: Prefetch of mutliple ranges within arg[1] size and check if multiple ranges are created
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @SZ_4K: SZ_4K
> + * @SZ_64K: SZ_64K
> + * @SZ_2M: SZ_2M
> + */
> +#define MAX_BATCH_DWORDS 16
> +static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
> +		     size_t bo_size, unsigned int flags, int num_dwords)
> +{
> +	struct batch_data *data;
> +	uint64_t target_addr;
> +	uint64_t addr;
> +	u64 *exec_ufence = NULL;
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	size_t slice_size = bo_size;
> +	uint64_t batch_addr;
> +	uint32_t exec_queues, expected, vm, *result_ptr, *batch;
> +	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
> +	const char *stat = "svm_pagefault_count";
> +	int b, svm_pf_count_pre, svm_pf_count_pos;
> +
> +	bo_size = bo_size * num_dwords;
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	data = aligned_alloc(aligned_size, bo_size);
> +	memset(data, 0, bo_size);
> +	addr = to_user_pointer(data);
> +
> +	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
> +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	bind_system_allocator(sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +	data[0].vm_sync = 0;
> +	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
> +				 PROT_WRITE, MAP_SHARED |

MAP_SHARED can't migrate to VRAM so I don't think are testing what you
think you are.

> +				 MAP_ANONYMOUS, -1, 0);
> +	igt_assert(exec_ufence != MAP_FAILED);
> +	memset(exec_ufence, 0, SZ_4K);
> +
> +	for (int i = 0; i < num_dwords; i++) {
> +		batch = (uint32_t *)((uint8_t *)data + i * slice_size);
> +		target_addr = addr + i * slice_size + 0x100;
> +		b = 0;
> +
> +		igt_assert(b + 5 <= MAX_BATCH_DWORDS);
> +		write_dword(batch, target_addr, 0xDEADBEEF + i, &b);
> +	}
> +	sync[0].addr = to_user_pointer(exec_ufence);
> +	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 1 : 0);
> +	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +	exec.exec_queue_id = exec_queues;
> +
> +	for (int i = 0; i < num_dwords; i++) {
> +		result_ptr = (uint32_t *)((uint8_t *)data + i * slice_size + 0x100);
> +		expected = 0xDEADBEEF + i;
> +
> +		svm_pf_count_pre = xe_gt_stats_get_count(fd, eci->gt_id, stat);
> +		batch_addr = addr + i * slice_size;
> +		exec.address = batch_addr;
> +		exec_ufence[0] = 0;
> +		sync[0].addr = to_user_pointer(exec_ufence);
> +		xe_exec(fd, &exec);
> +		svm_pf_count_pos = xe_gt_stats_get_count(fd, eci->gt_id, stat);
> +		igt_assert(svm_pf_count_pre == svm_pf_count_pos);
> +		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queues, NSEC_PER_SEC);
> +		exec_ufence[0] = 0;
> +		igt_assert_eq(*result_ptr, expected);
> +	}
> +	xe_exec_queue_destroy(fd, exec_queues);
> +	unbind_system_allocator();
> +	munmap(data, bo_size);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: unaligned-alloc
>   * Description: allocate unaligned sizes of memory
> @@ -1658,6 +1760,16 @@ igt_main
>  {
>  	struct drm_xe_engine *engine;
>  	struct drm_xe_engine_class_instance *hwe;
> +	const struct mode {
> +		const char *name;
> +		size_t size;
> +	} mode[] = {
> +		{ "SZ_4K", SZ_4K},
> +		{ "SZ_64K", SZ_64K},
> +		{ "SZ_2M", SZ_2M},
> +		{},
> +	}, *m;
> +
>  	const struct section sections[] = {
>  		{ "malloc", 0 },
>  		{ "malloc-multi-fault", MULTI_FAULT },
> @@ -1931,6 +2043,20 @@ igt_main
>  			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
>  	}
>  
> +	for (m = mode; m->name; m++) {
> +                igt_subtest_f("prefetch-smem-%s", m->name)
> +                        prefetch(fd, &engine->instance, m->size, 0, 1);
> +
> +                igt_subtest_f("prefetch-vram-%s", m->name)
> +                        prefetch(fd, &engine->instance, m->size, VRAM, 1);
> +
> +                igt_subtest_f("multi-range-smem-%s", m->name)
> +                        prefetch(fd, &engine->instance, m->size, 0, 10);
> +
> +                igt_subtest_f("multi-range-vram-%s", m->name)
> +                        prefetch(fd, &engine->instance, m->size, VRAM, 10);
> +        }
> +

In general I'd strongly prefer the existing test_exec function was
updated with prefetch rather than unique sections for it. The power of
this test is how it scales, we should build on that.

Matt

>  	igt_fixture {
>  		xe_device_put(fd);
>  		drm_close_driver(fd);
> -- 
> 2.34.1
> 
