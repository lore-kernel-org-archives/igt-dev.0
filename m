Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE17C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 16 Aug 2024 18:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CF410E818;
	Fri, 16 Aug 2024 18:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hwq1jVga";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CBD10E818
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2024 18:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723833705; x=1755369705;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bftJOGgY3llxywtxOsSrJ1Wa9kXPxYhzgNrCnqr7Z5M=;
 b=Hwq1jVgaoRdNCwQel6jSjsu26xX8IxSdy5TMMVlzbpwVSbXbxUFdMh/9
 VlYmdfxB/FTdnCWLyq11Zn0k+5gLZQPzZWp0Eu3zcGkWUkSSrhBB4XA7C
 3qKapku2OA/X5VtgJXZTZbxpYAf7oX8fdEUVuK1daDt4DAOpzZWXc+Wrb
 pI5rZvnpSYjbNLauHrVNnBrNmMXcdfYcO78rIvkSw+9B0TxL2V0FsxHQC
 8l58Lr15iWIavNbgEgJAX5heEJDXggY1q1owv97w8L4uqpzQotLT3sYgs
 INkAJBRrHjjBtH4Eh/5b1f/MjksKoe0TuEs/UjXPmtawhczKv9bd4TWdW A==;
X-CSE-ConnectionGUID: eKBCoJhrTOevz5Esuwx/XQ==
X-CSE-MsgGUID: ogP5GvT2Rf2qIRTsJlEBgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="25040212"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="25040212"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 11:41:45 -0700
X-CSE-ConnectionGUID: dFUNaRhJQ1WGNi4hoRiLOQ==
X-CSE-MsgGUID: MhxqdrvrTZqKl55/v/Bcew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="64708058"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 11:41:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 11:41:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 11:41:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 11:41:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ri+nmz457Y5J5bKjGWppD2gtUqhEYPvarlSIZ5K7Y5zOspl/BdwT44bmZZ4d/+J9f9jbzaZOW6sQr/WTq5mZxNx1OuUFa/01PW49Iz6DdR/jLSB47t/ESnqrXri6r6Iz3Vt6f+UJu36J0lilkThueu178ZCc9OBzs/ipQPrp9VzdSKl3aydsUDs3ChFyCSDT8XTtCT0dKtLR7/oCWvT7VUYy9udBfn9anLeS5/BkGH3JILtNhb/DeOZ1t/EvTBqLvMyDEebu360d12eZQ50Mv2JEIHu6Ur1dBTRLpcuLCsPO2nvex5vASm4pJl/Yxwbu39tAl13lBqOduXkrYMfvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+9F9veZm+ySiz+D4/h3C3TqBwqsD9gU7C6BaIOxcJo=;
 b=Mzpkrli6HaTjgf9hY8OcMl3puKx3JBmurkbYhmARlSfWyWC2r9NqFWmprkHxtCnvilqezESBxpClgA88wR98n/6IsJMKYBI3N0E3BUBWt5cGeG7isPoCXlAsdVC+9cgEoL5lZ0CCt241slZHbP9ViH1kcdfkUblG7feH+OCAaPn5A1n/YUVbrmuHRW/aqAOO4EqbJwlHMpQR6PGz1TsGEWd6lGNX+lrNnwPZudTPPQlAeAsHncAIfanCPFxqoqoxB4rk82J/MBjjPH7DZ71CaBVhPDD5wMBd9T6HL8Zrdm/oa+qiS1J9lEvd+xgDU8R3IKp1QF7wKtlHftFNe5u/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Fri, 16 Aug
 2024 18:41:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 18:41:40 +0000
Date: Fri, 16 Aug 2024 18:40:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/xe: Abstract virtual/parallel setup
Message-ID: <Zr+dJftZN/tGV46Y@DUT025-TGLU.fm.intel.com>
References: <20240814175013.3679997-1-lucas.demarchi@intel.com>
 <20240814175013.3679997-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240814175013.3679997-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0076.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 7888c540-2128-4e80-71ac-08dcbe231164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BFh6wna0e3UU+D8EAjq0d5u6qclzuQ0iz1Dk93LVGzUp4QSpUjaTOdhiNTIY?=
 =?us-ascii?Q?UBvp3Dmni9cLho+KhTof6Fnv4+v8jFcm3TeZMaWq9MEDbP7tLQ9uinENedxI?=
 =?us-ascii?Q?eM+K4dgS4a9I3ajPFAPHnMzLcnw43cnMEJNAneL486LGIac7HT8H94gHl3Ez?=
 =?us-ascii?Q?BbTe9/o0YjMb1QUaGSBgTBvIK2279PpFAdG4Yf3Hr6sdWDTAX8lMpi3Jac/f?=
 =?us-ascii?Q?wLJgibxFWfujhdbKDbr1u90xfb3qwjD4w8uri8KbUakTKLvJ/zwUZNKNJRBV?=
 =?us-ascii?Q?P/p2s2JVvhF5XBwb3Yhwm+obNVEZkZ+IHbTl5vXokJgpMsCN5FZGBvMsFJZs?=
 =?us-ascii?Q?m+f5wy5hGmp+oeEh+ixPuygbxEF7k4cpZqOXwAm+V3fTD4tdnDeI5Rsxj1eM?=
 =?us-ascii?Q?UL8bX1KRoQ+rle1lnASMOlqCPcjR/6aVgYzjOk+kgkdLhSlrms8WqReSpCq+?=
 =?us-ascii?Q?cADWp+2cVJazDBQSxmmorJJtES5Xsbi+5dOrvKYbBY1dOJwmlA15Z+2Fq61A?=
 =?us-ascii?Q?PVnOrQ4pZtEhFoES8j7CkOS/Aqo33kQ4CRx8CD5O3WSfQucHd3rrtaFTRA49?=
 =?us-ascii?Q?2NqHGQIaor2YLUG7KJjkhCx67oRnppbirtnGUL0tFToYHUQ1XrB0Z5rWOs+5?=
 =?us-ascii?Q?3eiL/MXII4kk43nqAux4iyvi7gczQWucNuFWB7dvuYorY2T9zufFNvjYQ/vF?=
 =?us-ascii?Q?ItfAkGVT+ZQgVJBouqnk6W1S6UW7yeRCXK+lyoEvZxG5xiNYg/0fKc4lnGPF?=
 =?us-ascii?Q?KaUdXfDKuZyQkgRB9zzjJ425qAC3bt019RaMNELBBj9fmjxiAG51uBqJ03nZ?=
 =?us-ascii?Q?eTtp/R6WGEF5w7vjMRApN0mG9HDglXU/4iGp7NhZBkTDEd1xMFhRWzOf2FUZ?=
 =?us-ascii?Q?KPbwG+3XMSIyAZ3N5n2J9Uu7XskXLJGsrJFUBfHon9UPQSsO3jStqZEJaEa5?=
 =?us-ascii?Q?EUDDxa4x0YejbAGRW9WdmCFSlS70HLYd6RlWtCBpPU/XuP7dWdkT4lOWdJyY?=
 =?us-ascii?Q?9EtjtJX0LoAa6OHlB2HsH3dmlxUV5VfbPQeNFfTLJPJYPMU6IIedZlUWWZkd?=
 =?us-ascii?Q?4ClYxlkhFKnLNi7izbsh/9vAeAVgzmtnkfHVt+GQ7ICHK7b1P2PyO9mkPS05?=
 =?us-ascii?Q?nua8ipRWANcmbH1AVz3vy+bet/bZEuvTa0FSbxrIlLW8SOLOVlQ+N573yV0I?=
 =?us-ascii?Q?CcYoARVFJ/9VjvdCAg9CSSckYAWr2j7tDEixUsCbGt9a+sZlujwsY/HzW1fb?=
 =?us-ascii?Q?msB7Jk9yrikEFry0VFeVTPvJ6q7gW1lcTVPQkXmffFoYVRYOkBCVa7AY3iLB?=
 =?us-ascii?Q?agP/p1niR4PASgilsKdXS5L+t5dANl6ioozGSW/AFYk17A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ppJwXud2ELFZnd2D4gQ9ZhOVxmGBAMzQcHSn7sCf+vAydf0zdvaVys3aAgAW?=
 =?us-ascii?Q?MtLc+xF65FFBLvAjak2e+s7YG60PgjGaSpoyRLFs5xasGLLkL3sDBQZdcjTK?=
 =?us-ascii?Q?i9s8dR1wG1bH1biFEEDhvVZqFTDO+urnTwIT18ZNcOQo7Cr38zhSztbGbulB?=
 =?us-ascii?Q?hCk/UAKh770byvlwBwykxfMLnBCjHSs5bAJA//0EhYT0iQm1sOWmHFpuiTYe?=
 =?us-ascii?Q?M/z+BA+UGsI4ATHIGTCNB2Q3Rv6pA61u31Q37/egCqkp8GJEkWD7y+aM2W2p?=
 =?us-ascii?Q?h+oxUqmc/FcHh8ja3T3ioqSun1ISzHSo6BvCPgjPpQFB5WXMEfm49ZueBq5Y?=
 =?us-ascii?Q?ulYICwyhTkMVZDITvfQOtRIuBW/saQbJAFBnSEpqXsK6P2TKH6UsOg2/Qh3V?=
 =?us-ascii?Q?KEY/qq0NXRwB5u80cnTdVtsfFh8j1xlmKTD2tENRim+HA2iyoMVtuKak5G8l?=
 =?us-ascii?Q?xJ5X0Ze0p/sdlPIT4FYlYZ7jhd2iCz4i1dIgdemJNanOqUzYuQRA5T8zmLr6?=
 =?us-ascii?Q?MgHwyS1cBkUSkv+8AqsxJ23+D98BhYs1b50+wzQLeWIPFWDG+GvDA01sXTWn?=
 =?us-ascii?Q?BnLgNdhkBZCw9DTPjzSwySJweDP6XE9BPW2+tdqdQgZKfs6WHqdqTpFFxvOK?=
 =?us-ascii?Q?pFHyeX/HRy1BAb9UUEApuA6A+FLRqZVpvlAbH2h8GWSQUW6uMGpcqgKVq4Eo?=
 =?us-ascii?Q?XZN/y4kaeA3jx6tvAokxjNknk6CyexOBPkHpw4Nc4MMGBh1BZA+G1hRFb+0/?=
 =?us-ascii?Q?4gzMh37jTva9DEqkhdkhES36li2XPHLDCLDeLUYRn++k/E2BjqecZKBc5eD1?=
 =?us-ascii?Q?7iOxJjVQKdPLuY4pOV0ZOFvhawN9DEK7X2HdyDxpIgrYop/bQcO0ifiQ6jHH?=
 =?us-ascii?Q?5SsEgTSn0QoSt7wUGY1OI/mtzm62GilnV+Vz9R2dTj5ZOYvRTBscso3yA7RG?=
 =?us-ascii?Q?5bh2/SW9+flGI5i2z8m9klHragMACO7YR2Pr7oMi6NAwTkLUcLEsqE2zxsmQ?=
 =?us-ascii?Q?WcCu+saOwd2Be/tHTdGxgZ/y7t+6vcDX3Q73hDK+JDg40HckmhFzskcc3w1S?=
 =?us-ascii?Q?Wx8LvQtMlj/MClW8mQPya/onLSXUxfIgxXgOKqeBQl5V02LWqRwv+cvqGLQ0?=
 =?us-ascii?Q?MSDhfS9LS26RBJN4ttoa3s6jXgpK7UF1FSqlvVBINAmv0B4Qe559TbGoco6n?=
 =?us-ascii?Q?YBXtyKccboS5h+VxaDg7U5ghOkGorWgeqV76rwuBgQy0MpyHd5+GDDAHeUso?=
 =?us-ascii?Q?x/aCvRHmIOnYr5TBW3/3Cwwf2mF8WxaJUDRxf0r10K4kPu7XlBi+FnVVIvyW?=
 =?us-ascii?Q?DxRj9plmTAAMBRbUlp8DdyTGAdwU4VqE5LuCOkeQSA1UcTCmG8DsaIR5ZD3L?=
 =?us-ascii?Q?lqn4P5qbMT7Qm36SXC8B5oCnfyVEZTXv45JOKZ8lTHvfEVXDY4H3iVd/46L+?=
 =?us-ascii?Q?VKPLqIm5gCb1CtxSo+XAm+5nu4OLNZP8i8JG1Ix1w4Zx9F/mOa6WG4Wja1tV?=
 =?us-ascii?Q?9sDo3sLn0oTncurCqhYmEfDpv2xYswtVmH/chfqUgvzEKS1+TSlYtEMpo+m/?=
 =?us-ascii?Q?rJNYi1qV5VUPbi/FbxCo4E6vCIMONh6VLF8EMBIrCjzXgNypdHI/358tshgw?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7888c540-2128-4e80-71ac-08dcbe231164
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 18:41:40.6068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B76mm8e47vM43Mytnyh84UbxKddJ3p/cGM+qTjSWuFj2q+ANPn7LDTuQesvMOzoUaYjSXzyR6bhb8gTbHJKguw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
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

On Wed, Aug 14, 2024 at 10:50:13AM -0700, Lucas De Marchi wrote:
> Add 2 new functions, xe_gt_count_engines_by_class and
> xe_gt_fill_engines_by_class, that can be user as helpers to setup
> parallel/virtual exec queue. All the tests were basically looping
> and filtering engines that matched gt and class.
> 
> Place these new functions in xe_util.c as currently we lack a better
> placement. xe_query.c and xe_gt.c could probably be other candidates,
> but they all mix all kind of namespaces too.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  lib/xe/xe_util.c               | 47 ++++++++++++++++++++++++++++++++++
>  lib/xe/xe_util.h               |  7 +++++
>  tests/intel/xe_exec_balancer.c | 31 +++++-----------------
>  tests/intel/xe_exec_reset.c    | 11 +++-----
>  tests/intel/xe_exec_threads.c  | 30 +++++-----------------
>  5 files changed, 70 insertions(+), 56 deletions(-)
> 
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 050162b5e..9482819c2 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -255,3 +255,50 @@ bool xe_is_gt_in_c6(int fd, int gt)
>  
>  	return strcmp(gt_c_state, "gt-c6") == 0;
>  }
> +
> +/**
> + * xe_gt_fill_engines_by_class:
> + * @fd: pointer to xe drm fd
> + * @gt: gt number
> + * @class: engine class to use to filter engines
> + * @eci: output argument to copy engines to
> + *
> + * Fill out @drm_xe_engine_class_instance with all the engines in @gt that have
> + * a certain @class.
> + *
> + * Return: number of engines that match the gt and clas
> + */
> +int xe_gt_fill_engines_by_class(int fd, int gt, int class,
> +				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE])
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	int n = 0;
> +
> +	xe_for_each_engine(fd, hwe)
> +		if (hwe->engine_class == class && hwe->gt_id == gt)
> +			eci[n++] = *hwe;
> +
> +	return n;
> +}
> +
> +/**
> + * xe_gt_count_engines_by_class:
> + * @fd: pointer to xe drm fd
> + * @gt: gt number
> + * @class: engine class to use to filter engines
> + *
> + * Count number of engines in @gt that have a certain @class.
> + *
> + * Return: number of engines that match the gt and clas
> + */
> +int xe_gt_count_engines_by_class(int fd, int gt, int class)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	int n = 0;
> +
> +	xe_for_each_engine(fd, hwe)
> +		if (hwe->engine_class == class && hwe->gt_id == gt)
> +			n++;
> +
> +	return n;
> +}
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index 6480ea01a..b9fbfc5cd 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -12,6 +12,8 @@
>  #include <stdint.h>
>  #include <xe_drm.h>
>  
> +#include "xe_query.h"
> +
>  #define XE_IS_SYSMEM_MEMORY_REGION(fd, region) \
>  	(xe_region_class(fd, region) == DRM_XE_MEM_REGION_CLASS_SYSMEM)
>  #define XE_IS_VRAM_MEMORY_REGION(fd, region) \
> @@ -47,4 +49,9 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
>  
>  bool xe_is_gt_in_c6(int fd, int gt);
>  
> +int xe_gt_fill_engines_by_class(int fd, int gt, int class,
> +				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
> +int xe_gt_count_engines_by_class(int fd, int gt, int class);
> +
> +
>  #endif /* XE_UTIL_H */
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 53ea245a0..36dc56707 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -22,6 +22,7 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_spin.h"
> +#include "xe/xe_util.h"
>  #include <string.h>
>  
>  /**
> @@ -52,16 +53,10 @@ static void test_all_active(int fd, int gt, int class)
>  		struct xe_spin spin;
>  	} *data;
>  	struct xe_spin_opts spin_opts = { .preempt = false };
> -	struct drm_xe_engine_class_instance *hwe;
>  	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
> -	int i, num_placements = 0;
> +	int i, num_placements;
>  
> -	xe_for_each_engine(fd, hwe) {
> -		if (hwe->engine_class != class || hwe->gt_id != gt)
> -			continue;
> -
> -		eci[num_placements++] = *hwe;
> -	}
> +	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
>  	if (num_placements < 2)
>  		return;
>  
> @@ -184,18 +179,12 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		uint64_t pad;
>  		uint32_t data;
>  	} *data;
> -	struct drm_xe_engine_class_instance *hwe;
>  	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
> -	int i, j, b, num_placements = 0;
> +	int i, j, b, num_placements;
>  
>  	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  
> -	xe_for_each_engine(fd, hwe) {
> -		if (hwe->engine_class != class || hwe->gt_id != gt)
> -			continue;
> -
> -		eci[num_placements++] = *hwe;
> -	}
> +	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
>  	if (num_placements < 2)
>  		return;
>  
> @@ -403,19 +392,13 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		uint64_t exec_sync;
>  		uint32_t data;
>  	} *data;
> -	struct drm_xe_engine_class_instance *hwe;
>  	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
> -	int i, j, b, num_placements = 0;
> +	int i, j, b, num_placements;
>  	int map_fd = -1;
>  
>  	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  
> -	xe_for_each_engine(fd, hwe) {
> -		if (hwe->engine_class != class || hwe->gt_id != gt)
> -			continue;
> -
> -		eci[num_placements++] = *hwe;
> -	}
> +	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
>  	if (num_placements < 2)
>  		return;
>  
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index bcda78609..efb7f9e89 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -20,6 +20,7 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_spin.h"
> +#include "xe/xe_util.h"
>  #include <string.h>
>  
>  #define SYNC_OBJ_SIGNALED	(0x1 << 0)
> @@ -162,21 +163,15 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		uint32_t data;
>  	} *data;
>  	struct xe_spin_opts spin_opts = { .preempt = false };
> -	struct drm_xe_engine_class_instance *hwe;
>  	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
> -	int i, j, b, num_placements = 0, bad_batches = 1;
> +	int i, j, b, num_placements, bad_batches = 1;
>  
>  	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>  
>  	if (flags & CLOSE_FD)
>  		fd = drm_open_driver(DRIVER_XE);
>  
> -	xe_for_each_engine(fd, hwe) {
> -		if (hwe->engine_class != class || hwe->gt_id != gt)
> -			continue;
> -
> -		eci[num_placements++] = *hwe;
> -	}
> +	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
>  	if (num_placements < 2)
>  		return;
>  
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 06452862e..6fdafdff5 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -22,6 +22,7 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_spin.h"
> +#include "xe/xe_util.h"
>  #include <string.h>
>  
>  #define MAX_N_EXEC_QUEUES	16
> @@ -64,9 +65,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		uint64_t pad;
>  		uint32_t data;
>  	} *data;
> -	struct drm_xe_engine_class_instance *hwe;
>  	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
> -	int i, j, b, num_placements = 0;
> +	int i, j, b, num_placements;
>  	bool owns_vm = false, owns_fd = false;
>  
>  	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
> @@ -81,12 +81,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		owns_vm = true;
>  	}
>  
> -	xe_for_each_engine(fd, hwe) {
> -		if (hwe->engine_class != class || hwe->gt_id != gt)
> -			continue;
> -
> -		eci[num_placements++] = *hwe;
> -	}
> +	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
>  	igt_assert_lt(1, num_placements);
>  
>  	bo_size = sizeof(*data) * n_execs;
> @@ -963,14 +958,7 @@ static void threads(int fd, int flags)
>  	if (flags & BALANCER) {
>  		xe_for_each_gt(fd, gt)
>  			xe_for_each_engine_class(class) {
> -				int num_placements = 0;
> -
> -				xe_for_each_engine(fd, hwe) {
> -					if (hwe->engine_class != class ||
> -					    hwe->gt_id != gt)
> -						continue;
> -					++num_placements;
> -				}
> +				int num_placements = xe_gt_count_engines_by_class(fd, gt, class);
>  
>  				if (num_placements > 1)
>  					n_engines += 2;
> @@ -1021,16 +1009,10 @@ static void threads(int fd, int flags)
>  	if (flags & BALANCER) {
>  		xe_for_each_gt(fd, gt)
>  			xe_for_each_engine_class(class) {
> -				int num_placements = 0;
> +				int num_placements;
>  				int *data_flags = (int[]){ VIRTUAL, PARALLEL, -1 };
>  
> -				xe_for_each_engine(fd, hwe) {
> -					if (hwe->engine_class != class ||
> -					    hwe->gt_id != gt)
> -						continue;
> -					++num_placements;
> -				}
> -
> +				num_placements = xe_gt_count_engines_by_class(fd, gt, class);
>  				if (num_placements <= 1)
>  					continue;
>  
> -- 
> 2.43.0
> 
