Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8F1CD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 18:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0909B10F3CE;
	Thu, 18 Jun 2026 18:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIgcOiZo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC45E10F3CE
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 18:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781809005; x=1813345005;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tAozawtAHkGbJjkTqY/KwlQ1Dq7zQotAzG8+b9K4h0M=;
 b=aIgcOiZoAoK2l1LklGadvmit+HcRIAAYo1Ifgl1wnp0Po09cwgxQ85WL
 ktiVZs952mHUpL2rFjd/Pl0dmAyeCeQjMNPZ/c9utEf/Opsj98087floN
 HFE0Eib/hWR96+Zz6OkL2zsHLr0q7hv7GbZloecrMRoyjK9g/EMo/IXHg
 Y8SrCClAp/r/ClJLgy6mgZyFVVtfRwO1UyVN2M1Onxq4PpZdTM57uNHRe
 ukm89Ld5REz/2M8wnwLX5/zCpYNjkYAiemrcCn4IHqUmWLPrN/405y6Av
 LkcMPiutB0ZiqGvFwT50LsYiSU2XY1czCfgWbGqSu4O1N/Q4q3KCq2WXf Q==;
X-CSE-ConnectionGUID: JJO8uM63Qi2OzqlU4om6XQ==
X-CSE-MsgGUID: 2KV7u2mxTmOfE3VyqagqVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82660064"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="82660064"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:56:45 -0700
X-CSE-ConnectionGUID: S+ULnAmGSJOMpDwoXmZYbg==
X-CSE-MsgGUID: PDYAdRkGRCSFbJK9E/FbYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="250350445"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:56:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 11:56:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 11:56:43 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 11:56:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOag44zEtw7t0CsOO8dUK64qahhq53tZd8jQ5iFksHW9yag4kJZRsdCqoI3uOWH+pUkLrVpNbiWgqBBsiKP4ExZ15d6rFc6RgovcWydQlUeCbM5Lwx+/cGPF+JgtqY3AgQJ+qhrgUxXeeZRe3LWUe0NIpCSe6z+kju9/fbP0+wgUVP3AsSpJW8ge0lMdpdizaYzG0tffofUm3RSClgNPGbcnHbd8UC5vfNWNJZ2X5+Fuf2dWUldDcwjXH+5MU6KHqHbJnW/rU/FywlPKgBT/QT/+6vYHHPckrKAdNxlAqdYXlzUOzMqe8nP6oOuxFtrq77PYBa6KdibYcU/MzYY4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gBW8KW7st+to0KZCipMCw6cc+XZk3pxyswKuaPjVMc=;
 b=r+rWOQ1WADpbDCJ3Ep/7v8GxAA1eiNyzoGNyAR6SjZf8v2WzEdLbkB4Sd3kNsdMv5dr4M4cJQsSGUhAitSo308jZEAuFREJXeiKEhmGXeAQgHrhajw/Bvo4lolIQ1Tf7pBxyn+k+C6qV/c9wOLGtWCkZSAnY1S2nNG1ANhZJOwyg+UJwApIZgszQYGssgn9BQiMoKjS/2UmwWuPX1n6ah6EVtFIjRYp4vNOCSe5KVhCirB+bPhp8M//nJQ6Op+EA8+6JvQAfNeQbxedG3SeO7aXML5eIRMCVNA4KcZhHLi9/ApOvRoctMAV/48z/he4POA+lytHnuh/TExDMPg06uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SJ5PPF12B0A4A9B.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::811) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 18:56:40 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 18:56:40 +0000
Message-ID: <e9fa990f-6475-4134-b23b-0786e072a44d@intel.com>
Date: Fri, 19 Jun 2026 00:26:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/5] benchmarks/gem_exec_trace: use
 hars_petruska_f54_1_random() from lib/rand
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
References: <cover.1781791747.git.jani.nikula@intel.com>
 <c78b332ceeaa0c00b80e99f4e49765bc22abd0ab.1781791747.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <c78b332ceeaa0c00b80e99f4e49765bc22abd0ab.1781791747.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::15) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SJ5PPF12B0A4A9B:EE_
X-MS-Office365-Filtering-Correlation-Id: 823a727c-e50b-44b3-78f4-08decd6b551d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: vH8KwC8LibXtdlSJmlXWZxZKdryhIK0M32dYzTkYmDkYux1fhcLigDuzWT7hKknAFiPLiPL7dFYM6VyW6DXV/xO/JR6TaPgEtmZO1atcmHspoEZKspFSHPVNqagK8mazGxaSWO5PS2cq7Aq3nM4ToBoa4VHoo0QTz4xgmFyftLAlZv5tJCkROiWLhmPWWv+QE7Bf014KslNywRIdQ/XjhzqWR8At6b91pP64bbM1pOKM/2a5ThHQ+di3dwZdJILYxnMT7LTwQwnUMMLYjnla2gLOsiWo2DJHYImJlQdPTZAvB1RvhAsZwCxnsfM9+K2wJchjoU+pFiNE9/UsgDVKyDHdTop18g3gQcr6Kf6isgBNAbBqXwcspOLFan/7nrab44bA5l/wdQqqSWQdOuLfmGX7Htvyejr+E3J0t8Bmex0Isu+YGpvtQ7RXeE2xiehBEPQ3ElgpECltz7DtJwv8ZJBNeRMWryyM42AFQxeYbnOck75T/P3I62Pbr64nYSBJSYFgEfyAMi5jRZ8TiVJIXfZST58Q56PIFOqnfmGX8zBGDHrM3kvPC8acnAddwEv9QuHYD66zH0zePs9ApS8nc5/49aYUKx+PhKCcMBou2+dScQdLhmfuF4JEnWOuGA5k2FNDum0N0lAlBr4wtI6ZoNqH/KUEeZdCiYoTw5OiZQB11OSr4kroUjFY3aoMdfz/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NktpYWdkRXcxSHBCOHFYY2tub3h3WVhwbzJQWGZLSWttc2cwY3ZsSURDciti?=
 =?utf-8?B?TkRpenNiaXJ3UTBGV2tGT21HNHpUa0s5bjdHN29sWGpwVUF4SHZOWEZyaVY5?=
 =?utf-8?B?bnNDWHJLU3JWN3FDdGszRExVWm02ZjlQV3VyYmJPdmd0dlVDV0lUL3FzZ3ZT?=
 =?utf-8?B?alBYSFR0N2RLWWY4cHBrd2VQM1JCWk5EYXVqU2M5Z3NRLzBFbUJ3UXFtOXA3?=
 =?utf-8?B?anJLQkZaVXdJd3FiU3ZDSFQ5SnlXWU5QMmhjV1ZNazdQcnJjQ3lMVkFrL1pZ?=
 =?utf-8?B?OGFKVXRsU0hKTC9iTUxoUE9SYzNhK3piekFSYnRkalB5QlNiaWJNQk5Lck1C?=
 =?utf-8?B?c0tjZ3JDM0lOazcvVlNnZVBJNWRZSkdGWHh2TnI3ZDZxTUcxWmJQYVVud1g1?=
 =?utf-8?B?WnNjcnBFZmp1RGtUTUhub3g0U1Z5ejcxWVhjT3JneXdSS29zYWhPOG5XRjhP?=
 =?utf-8?B?dXVSbS9xZzdVVVN4K2x0MXAwTUpLUUFYT2NlTlhnVmlLUWdZUDFNdWNUM0N1?=
 =?utf-8?B?ZDhoSUJ3RDJnakNuWHp2L0tKb2JWaTJocDZmdjFXd0tUWFhuVGhKYm1NWU5s?=
 =?utf-8?B?QTJrK3JtUTlQUkFQZXZRQzhja2drYjRWUjIxVTZhM3ZpZWlUdEZnR0s1bmps?=
 =?utf-8?B?MUxxbERVSEFMTC9BUWw5R3ZlQWdtbDEyZUNDSVo5ODFsOXFsVnJYaUFORXZB?=
 =?utf-8?B?KzI1RVZGR1lVcWFDWmRSREYrWmZ3MjQ0TjBZWVZxLzhQaHBFNUVna0E1UVBs?=
 =?utf-8?B?Q3hhVlJQWFdMdG1TWEp0MGdHdnc1L0hmTGduMURxcUhkVFgzZVFjdFZpcjFY?=
 =?utf-8?B?bE1oWmtaTkdwRkVQZ3R6OGV6b3MwejVTUWZzRzBnRGswaSs0YVk5aVZqUkxI?=
 =?utf-8?B?T01IYVdRdU42V0dzVXcyNDUyRktGblhPZVFrUTNEK25sSGdoeFJQaThjcndl?=
 =?utf-8?B?QTFIdEdKdHoxUkUxRml5bGpzeHpkSVFFeVhjbCtCM1hrMTZoK3lmZVR3eXg2?=
 =?utf-8?B?alZnb0hQVkhCWm9aZ0RQYlY4cC94RkNPMEVQekwrNldJcjR3b1F0SU9qZnhN?=
 =?utf-8?B?S1YvdHpvNGdQZmUvZEZWS3JCSDBsMGRPaW9zNDUzQlNCMzBESEo0UzYwWnRm?=
 =?utf-8?B?SkNQWjFPSVJUd25sMGFvZm9lZU93dzRkbmlMTzRkVktjMWhXSnJuSG5JUEFT?=
 =?utf-8?B?SlpiNk4xazN1cElWZ2RvSlN4UUVmN1NPa2NFTVJEd0czWXRPUzBRMWhDV3F2?=
 =?utf-8?B?bzVUNG5UMCtRSU8zaWdnanVOakQ3QzBrOS9uNUJ2VUZWYnBCS1FuVUFaRzJD?=
 =?utf-8?B?bE50YVYxMENnNkF6LzRlRXBkSVhzUE5ZRml4U3MrTy96RHVFWWZMWmV2V0J3?=
 =?utf-8?B?cjRpeHVZeGF2ditKdmkwbFRjMHMwUXg3dk1aNWZBYkF5djNMbTlhaG9YTi8r?=
 =?utf-8?B?blQwY3dZckFFSWIwQkkvLzFTakFySk9kbm40RlBvNStPNXp6V0h0L3hYMkli?=
 =?utf-8?B?Wk1uS0pjMFNvaWQvZjU2VkNMU0NvNnhseEtxUEIrbGh1QXh0d2REaE5CZ0ZJ?=
 =?utf-8?B?Snowbmh4OHhPYnVHUTRodnJ5bUw4RmF6K0Q1SklPa2o2ejdCM0psbHhXbEN1?=
 =?utf-8?B?UXVGMDdnMmJPVTU5M1FWUzVmMldZVmhybWJQSDdGYXpZMktWYXhETlBob0xj?=
 =?utf-8?B?RlczNHNTMHRWZ0t3L3d4OElMVVlDZk9sSlYxeE1IOXlhNWM1akNJWlZWMkpx?=
 =?utf-8?B?cUZ1akk3c0Y2c05Jd3NpaXMyc3R3S2JiV0RmcVRiaXFVUE5wVDgxbE5tMWtD?=
 =?utf-8?B?MGRQenVhZkJyaDczN0Q0MGpuNU5VL1ErdWNjRTFybktpejRwa055UFFvUDVn?=
 =?utf-8?B?MURYb0RTbDQ2d3hzRldlenhveGF2cDVtVytsMDhxRnBQbnQ4T2JYQW5nbHVm?=
 =?utf-8?B?bHNSbVhJYkcwVitpQlZoNjRVMXVaNDI2dzN2TU8xRVlwU3ZET0RMakhwY1Ny?=
 =?utf-8?B?T243UTRXdG9rYUFudnZZKzdhR1dGSWtVTjVSQU1ncGw4SEIzaEdsZkdsa1Bi?=
 =?utf-8?B?eFkwMmwzZmZndFdZbElaWklTazFvWitveFUvNWhENDZ4dU1pL3hTdXh1d2RL?=
 =?utf-8?B?RGNHT1dhVG0waU9vWWlid3FmSG9qVzJ1RGlQZmJiMjEwUGlwVXZRcGEzWWZ4?=
 =?utf-8?B?YitYTTFtRHpLVVBoSmNuaDhBVGszaTR5OVRSbDhIRitWd1dwNkh4NjFRODNn?=
 =?utf-8?B?MFFnODBUY1FUT21lUHRQbjNHYXpVTEpxQ0ZaR00yZGRNWHlxaGFJQVZCTnBJ?=
 =?utf-8?B?WE9FNFdTOUJnQnVjT1ZIV3REYmRLNzF3Qkl0aFZMUlR2R2R1M0F5dz09?=
X-Exchange-RoutingPolicyChecked: HYSISnfg8/qbL61fgIu/VEGzLH3PXEgvp+VndWvbU8qA4Vl83j9BvOVYD5DB/Dqrb+bEx1jltAEDmI9UWQnuO/vIMHGsDAd0MF9QIOHHJMfJ6rBAqNVaT3vFMwHz00qoAYayqSdN8rdMO2PGZGGg2BbkExRBZ2y5im1E4Qtd9vH6nxpwt0VK8qYxBQqoRFAlg0IK8uXjx2U0EopJDMcZ8L3A0UELlfsjSJdUMpf6CAzc/x1iLL5RUmoZNFSUsTbiwLlZteVJVBVxIh8gPmiIoP+xap1yRi68MYKxb5r9GcbyD8dvy6MdAUU+Hd+zRukV3vtr+QBipx/wa7ZA3YcSEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 823a727c-e50b-44b3-78f4-08decd6b551d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 18:56:40.7401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qSgsQUvJYfE9rvAOnK79s0/XPCouclP3rkpIMxVkixRwyaCeEJa3sm/9cSpO+o1ABMkRCINb1rbCe/taVOeRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF12B0A4A9B
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

Hi Jani

On 18-06-2026 07:39 pm, Jani Nikula wrote:
> Remove the local duplicate of hars_petruska_f54_1_random() by switching
> to use lib/rand.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

> ---
>   benchmarks/gem_exec_trace.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/benchmarks/gem_exec_trace.c b/benchmarks/gem_exec_trace.c
> index 4263ccb03dbd..c27639105903 100644
> --- a/benchmarks/gem_exec_trace.c
> +++ b/benchmarks/gem_exec_trace.c
> @@ -42,6 +42,7 @@
>   #include "drm.h"
>   #include "drmtest.h"
>   #include "i915/gem_create.h"
> +#include "igt_rand.h"
>   #include "igt_stats.h"
>   #include "intel_io.h"
>   #include "ioctl_wrappers.h"
> @@ -92,14 +93,7 @@ struct trace_wait {
>   	uint32_t handle;
>   } __attribute__((packed));
>   
> -static uint32_t hars_petruska_f54_1_random(void)
> -{
> -	static uint32_t state = 0x12345678;
> -
> -#define rol(x,k) ((x << k) | (x >> (32-k)))
> -	return state = (state ^ rol (state, 5) ^ rol (state, 24)) + 0x37798849;
> -#undef rol
> -}
> +static uint32_t random_state = 0x12345678;
>   
>   static double elapsed(const struct timespec *start, const struct timespec *end)
>   {
> @@ -277,7 +271,7 @@ static double replay(const char *filename, long nop, long range)
>   				sizeof(*exec_objects)))->handle = bo[0];
>   
>   			if (nop > 0) {
> -				eb.batch_start_offset = hars_petruska_f54_1_random();
> +				eb.batch_start_offset = hars_petruska_f54_1_random(&random_state);
>   				eb.batch_start_offset =
>   					((uint64_t)eb.batch_start_offset * range) >> 32;
>   				eb.batch_start_offset = ALIGN(eb.batch_start_offset, 64);
