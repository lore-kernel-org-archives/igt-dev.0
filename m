Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0769EC54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAB510E168;
	Mon, 25 Mar 2024 15:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P188g691";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F9410E168
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711381907; x=1742917907;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=bOSVEHp+iEOEEMogdzP/uQX6QFtB6e/Iw0ID8OoB2jU=;
 b=P188g691MjJLYC5zfh7sz0g57mmCDlnOqhtb8+qAbbN2pmBX9H5Y7lIg
 cQaBSuH7ouPpfCQHEJkzIxwvcZghsZUk7sn2h8Kr6ao29Y/lyREt0+MFG
 ycFfyZKzYZ7PI+twQyWWc/T+Eok13UxuC+1BMdS8ru/esjhezFcW4kunQ
 OA4MwFctOd08JVBWFT6jE2Oq+FNhNdiRJdUk3yxUgQF0qi+Pi/tqnCGFF
 URnCtJZuPP6grKmd74UamWLhIZSH7s1xav3Oe1ndtEyfl5IT+QH0QjwNl
 FEgomt5hV1qNbhgzcTr2hwBSL/GP5Ad/j4ASAi28AUp0FwswLNpW6dwzD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17828593"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17828593"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="15736604"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 08:51:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 08:51:44 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 08:51:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 08:51:44 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 08:51:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRKmN6AoiH/ytMxsajoY77toklBE6UOviyZd8WOtnkFEyxiSlHJJnaOBT4xjiIHwqtWMmcwDMbThiiQyYHEaiB7lGBaOLnWiTvkFCOjoOwZT5RCw8JBWpZ6wU11V2vOW6nObpu4j6gQKi18b3Fcwv990F2Y/AHwmv76yC4jdZUhveF8/ITWQYCLuOZYuZX1iK9/a64feNwEQy+CantO8z5ywpAhzIJR5qSOqBsAFEkU7xnpkXRIYbMcpKs+fSK5sz4em+ZohhHwcQ/A6DRww/bEiQ8gNeDZk0ZYYIeueO6D83qfkfw0flquapcfOn208t13pgz2IZqoZ1vbTheqzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3MSH5isqedRdC9OdRp3/xJHAj0xj/60uFvkaogJSP0=;
 b=al24yQVuBSxNLI+L1A1NqhX4Bugbv58UT17VI/9hCAnhH8xHJNAtyzc+pLq6pMN1a31mrCQiS9nCj5yBRjNNlHsp4pqS3tO4KJwa0KyuZvKLa7jrImjDSO/GEGni9R7nH83fy1xrU6owgwltrfvDYBMAjdpOiHh0Lb5OF9K8SFn8Tr+c9ns94V4rYxnsZ8SCOk8/KHIW8/OVvz55s2W7NRzXgytRttUqCM1lMuh2RZXpTKfB/aiLK28xqlderLrV6YgJykgljzUMgWyTb8OVd8nQyZpC1r9p/9m0qs8wsqGOUSEs9hQwxIgCUoCKg0t5/Cv8t4ZhvhjGs6ygA0j04g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6073.namprd11.prod.outlook.com (2603:10b6:208:3d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 15:51:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 15:51:37 +0000
Date: Mon, 25 Mar 2024 08:51:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLnhlQkFUOiBzdWNjZXNz?= =?utf-8?Q?_fo?=
 =?utf-8?Q?r?= tests/xe_vm: DRM_XE_VM_BIND_FLAG_DUMPABLE is now a valid flag
Message-ID: <20240325155135.GP2837363@mdroper-desk1.amr.corp.intel.com>
References: <20240322205327.850864-1-matthew.d.roper@intel.com>
 <171115318505.962476.3944312201719630425@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171115318505.962476.3944312201719630425@8e613ede5ea5>
X-ClientProxiedBy: SJ0PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: f8dcea41-3e1f-4d01-4eb1-08dc4ce37477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Im0F8MDjMY1Yq+nU0JItJR2Ao9QRt4O/Y8KZ0SLhO+Lwg+lYIKxxdaIfnVYlSqiMLc4A2/LtF6QqQLnpsV3Q8ksWb09At0yD9oCQ876AU+sTehSCsbMe+3K/Lf/2cd4aP3mmMOtTxt9wPk0/it3ZfVuRTCPKAD4KME7w9AJbCIil5sNRNt4nuigwgBc6XUMAMwYYRaBjSedrKLiggihvuOJEM5nWGs5pPvzNQ6F77oWu+39lBviJzuZWMW8Yxz7NPkH9Hxe6mcFwECygerDT0iZx+NRDGJymHiB98GswA3MQPe9Hl9JummtXA0509LmFEa+DbULsvQ2ofpaIXCxt6hBNsA5K7RsZmjoN4LIB9nFq9iaC8PstGSFpsehHHPXuIw7T6KlnkyKsFUTG1gIhGICQwF8g0/EsvD1/RuEyGOPkM0R/734WnwQC38MYnvu6IQ4rvT8TiWZG2UgWZkJfm4AscqxbUy6a0poOjpteDFAdEfu975k4pWibCJDY/20SYIlIJ4ZVgWdLz4SHZT3eJgQi4s4xy2CPzH4k8tBjMMZFluJi5tMK56pkweB0uhcpNc3p4tR1uSpD+zxhfZypuufqsm+C7YqoRqnRuxI4A6L/fPDOjXeLbZp1Lcw/PRq1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SXY4Ex7hoDhyTUm7zF2d5Bc9rBZ9lPROq9B5Avfiitm9RmoZ3FrDA08YskMH?=
 =?us-ascii?Q?3Bfrx5d8ju+56O1uFZInka1UAnvKEEdK3wemvrHfdwwA7FPdO1ZYc1Np4/k5?=
 =?us-ascii?Q?lI+bSOOrdw8SZ0gmcTbbznS9CPA3tPS8UeD3VL4dkZ0gYsIKL5aFlG/bYTeT?=
 =?us-ascii?Q?txGypMMT8Ypfez/frLH1/4tmsiQ/1e0fI1Z+Us6SlwcPB/mGMmkiHjmMXF0e?=
 =?us-ascii?Q?5+xXeV2UZ/8UzcJqRbFCwtU9URgVB9REl/xwLllCntfUxjBQ63amh3ZEd0Kd?=
 =?us-ascii?Q?d+Q4TH/L5ICfijQISDVSvH+lFeBk8webDzAnlzY8uItzCh+Ec0553oPxA4TH?=
 =?us-ascii?Q?La2hlAY5au8bf27yuw/0d2UghO+8aADv5w7zkKf/P/Vg0xPcdpFsrXiqjQBE?=
 =?us-ascii?Q?JOfxUeSs17M00ENIjSwicnV6KWNBpwl/kOAkA85FR1yMLku93uLWh8rLAins?=
 =?us-ascii?Q?vBzs5ZMsuNi+RhGZ7wBse/u8qN1SLM01WNTnTTHH7yaHpuQIiWuOtLRUEIal?=
 =?us-ascii?Q?cLioXLd+oVk5iYPyA7KnnqfJvCEsUr38ssaCFN4fDwOQ+8GHV+ciheSF1Ix1?=
 =?us-ascii?Q?VDBOAoAxcfSZSCiZKHXCCu73Pr+JIr06jwyt4SAWilTspcZU7Hobjhoi2zqj?=
 =?us-ascii?Q?6X8WDyHlo/0H8OKigXZDawWh+zTBIA0ish16f0sN00bTZkw3OMV4JUrLe4N9?=
 =?us-ascii?Q?ukU8Anaoz1fBNz41obaRuFhZ6ZFBCXgC2op6VuWqgbWTREio0PWFU/Suf+yV?=
 =?us-ascii?Q?qicNh2aiK9YHIUZCi5jRgcxV7mFBfdnoRuwXqNsVmXZFonRokVZeAEKcdrTI?=
 =?us-ascii?Q?rzLrMIme6yzLec9p86L0SroCVK17rpEAoIF8iN2qR5STdPKxcgtwh7iALNl8?=
 =?us-ascii?Q?UgxipVtUzUkvNvBPFaaojqsh7ZGgE1MnHVcXNIw9gPRnrLMlDhoSOk6ffKTB?=
 =?us-ascii?Q?tJ12jkvb9LbfUdy5ueOSShqIQLV0ZUuP4W8curo4QQGk+htkJ3sdIsj6Kd/b?=
 =?us-ascii?Q?HLryRLQhouDL2Lw1nmEbTOJGtE5FFdYrvFlkJmoqHdZWxKQM3Wgh3fG0oI53?=
 =?us-ascii?Q?qFB3OB+/mEBngrIGKkOepOpBetn+iOuKNDIT3Fgl8o3MBjGlaKwm0S+flyyg?=
 =?us-ascii?Q?EExK0p5wP8aHwqZbvP37Lm/f8evQV9oYKppiF/YPGiqpStJDPgoS6dt8j2+1?=
 =?us-ascii?Q?FbVDuDgx/AAdYmUMs547LddvFk3ERsj5pkDuimekPwH9q6kEtY1mydKfuxTC?=
 =?us-ascii?Q?NNkBpzpgWWgAwXQn8Q/nlda4osK+tKTr306qFHO+qEpDnlZMR4rUjDUQoCs8?=
 =?us-ascii?Q?5MNT26DEH8tmqmZRaToQ3OVhfrlXkLZO400Jrv3NoqEGXlKxwQEC3ST6+xfU?=
 =?us-ascii?Q?LNY5evDZ9z9YSyBZk0qDKRvLEKQC80AnAvAOoBo7g8OBxtdGLk4LT6kW8UhK?=
 =?us-ascii?Q?KqOChOR3zvkJqkAiQ0LhzqInT5YfFqfusB1uVizrWnbdRkOejgCIqZSB1Uqw?=
 =?us-ascii?Q?7EKlyOzRaHMu1QiTNdyOaaoZPyFcrw5vD+XfUFthh2yL3UWywKfFXCdOwheJ?=
 =?us-ascii?Q?9cECeh6tYQWJ3fv3OTLrDV/EMqzMHIffK1IU41ikbXC7kNxD7x5GkLF21Wqb?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8dcea41-3e1f-4d01-4eb1-08dc4ce37477
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 15:51:37.6227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDR5f5qmTjDQZB3rVkF4kttUn92q2gPkIVnx6PfS+F77l7R6LwSCh4Eou5lY21QoqtldRyKFagio2i+Y+/ZZ5rvPK5oDgSDeuodo89fExGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6073
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

On Sat, Mar 23, 2024 at 12:19:45AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_vm: DRM_XE_VM_BIND_FLAG_DUMPABLE is now a valid flag
> URL   : https://patchwork.freedesktop.org/series/131520/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7778_BAT -> XEIGTPW_10890_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to master.  Thanks Jagmeet for the review.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_10890_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_evict@evict-cm-threads-small:
>     - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#1259]) -> [PASS][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7778/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10890/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
> 
>   
>   [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7778 -> IGTPW_10890
>   * Linux: xe-978-b89042d4d087c1e037c1f7904b4c223e48919b88 -> xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1
> 
>   IGTPW_10890: 10890
>   IGT_7778: 0f63f0cf1fefbf7933ca33441c7a89966e85d8c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-978-b89042d4d087c1e037c1f7904b4c223e48919b88: b89042d4d087c1e037c1f7904b4c223e48919b88
>   xe-983-657dd8fcd2f1d1205c6f98fdb8b60915228991d1: 657dd8fcd2f1d1205c6f98fdb8b60915228991d1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10890/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
