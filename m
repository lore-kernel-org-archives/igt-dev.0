Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BB9D75E59
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 14:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866D010EB53;
	Fri, 22 Nov 2024 14:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UEKYiXnO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C41B10EB53
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 14:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732286820; x=1763822820;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SR7evorQIuEfk90BLdAIv8EZTt0f3yyK76OzSSRflVU=;
 b=UEKYiXnOsOf8k+XSz1Xw9zkXxtMMMVo0CR+ADBYsNkwCVuBYGOsEH20g
 Xf60wGGyBLJ/6N70xxbjKlqxxf2KSXmPZNY6CXhth/I5N/G/URE0hPbgL
 +5EgvWShCGvBQ2lzL0Og5vcpHOZnehY2bLONWw0VnbF8ekL/GJLrwvilY
 UOZ5SnxpTjovLVY/z/+fMN6sA0UkmmU1CjKdY1vPLNvuyLgy1Caf+KZlw
 bBqx6SNmb2RfJph1xiG+xFFdjXHOICYMOJq0u6AJYv30eW1ehhb38bpSS
 xdX236Y5Tdkkc8QuC0qAV+b0mxrt/7ZM015UsqJbGGtZfcAGf41ux4Ty7 g==;
X-CSE-ConnectionGUID: 3prnqkyWRmmhzniBJe1S5A==
X-CSE-MsgGUID: gZrQCDDwSKmcE+SvYyz/0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="35302312"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="35302312"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:46:59 -0800
X-CSE-ConnectionGUID: lqVcnqFFTnOS2ilu7tJAGw==
X-CSE-MsgGUID: OfjkZ+FMSkCpdCQjFWlZyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="95679643"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 06:46:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 06:46:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 06:46:58 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 06:46:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWN4oa74E0zirh/bwHFpcQ1KLXXpss5E8yPfHSi6pYpzSxpS2v0wK3UrrR3ub0eM52zk6AR0LqiAM15cdSxyJZn03mvMB3vM1GPajc5vKRkKSviCLthsr8wFdH1JF7IxTrWmUuKh334PMw6xffUW+FUD9m40NWg1uQB4JwPyvGFgiskgDSJ4cq56gGuQTLqrvyyHUKQNY3xf6BiGjis+a+jJqz8cZ+S1zeSDD98xDMebymFr4d4/h1nqrv3Q6Rl4wMTbmMQ5vCCVASidNRNy29f0nK0QgBHYs+OlNjyWYffiXv9fvdkI7Trznl47hnEmW08+0gtgupS9Zcuyhpfc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eeaz6H7AuCQKzUVtT7E0ywbleBcGWDT7l/oMkepvVU=;
 b=akH1zO5/iBBQoKQORpytJ74LR9wtrlZrfaXiNu8EP2LTENDu/LsJX06uPjae9vBCDwibgMIQirdCkUTVYoJiptzGR3GTwwkWR0kS/TrSfxFrX68cQYvIgRbFJHx+Dy8G5r0B5kpEspyG2Vnn6Qv07fM6FhkL+WJxxThbXACxSkIMWPeVv5OP75aUAYQw25N/OTDTPTslWeNJERUVgG2QvlgAhCtgSwWSNc9AjJjcSBXLKL7TScN9rqUo09KRciFbO/CefYIqi1kFklDjeY1hN19aXQJm1EMYqfMsD+rdFEl8Bd1//iZa+t3vQsOAmUFvCvNgI6cywEYhCHflZpTy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 22 Nov
 2024 14:46:41 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8182.014; Fri, 22 Nov 2024
 14:46:41 +0000
Date: Fri, 22 Nov 2024 15:46:32 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <nirmoy.das@intel.com>
Subject: Re: [PATCH] tests/intel/xe_fault_injection: Use valid pat index
Message-ID: <Z0CZSOP2ppGVZOfX@fdugast-desk>
References: <20241121202943.149868-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241121202943.149868-1-jonathan.cavitt@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: ZR2P278CA0030.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::20) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ad6124-2589-4ec8-fee5-08dd0b047a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fzxPqCLa2EH3NksqT+3QqlpqS0dMEnv5SUPiIv9gf3jonqo1EzoP3ipLsz5i?=
 =?us-ascii?Q?0SwUjHG4bopVO2UMcxMypX/FviWANiEHQi48olQ34/I+RrYXNNX64PkJ1JSF?=
 =?us-ascii?Q?V5ZjLceXtQEntN7B2DDSPkE+Z5mz3i5HkDE65VPrFvoD6o4MzDfHT0mgVvIe?=
 =?us-ascii?Q?U6x5JuLtPrKE26+39AXchtAJ8D7byTSjTIZWbNSlxZYI5A5XlrQv6Gq4Z0Rn?=
 =?us-ascii?Q?KvHReqoBl9Ujj24RYg1oTMS3wd8qZV6/vQqhfrpbAYKN7D71ZIR98RBmLZUn?=
 =?us-ascii?Q?rUuDvhr5m+hcuc/GT/UFdL6V1GQZvKCwRqk3U2PQebjMeL+/APzguW/sRFxN?=
 =?us-ascii?Q?JjAkS+yghyQHOmAdI+UaGMkd3Udx5i/KVC8v7UduyUzQ7qEjOdJe782sz+3j?=
 =?us-ascii?Q?66KudY9o0yaKhjIc3SH/dcjlyuhm6Re32BhPUrdY+ohqu5kCXtsr6Bl4egJ4?=
 =?us-ascii?Q?2XG618TyzngpXXUUTMVJTV6Z1XWrbfVfZ4FGrJNlBg+Rs6jy5tbPb1bRCCsU?=
 =?us-ascii?Q?F7hPtn0vAIsk9JKo8mQaT77JQW0w/zl5GcmTmTVRpT/fct3ThfxGGabJgE3c?=
 =?us-ascii?Q?bRfcPruXJKlxaxPq52ByJkG8rSirkCjBAOSvU6/Zt+4GVITtbkLFAQ1lHr7y?=
 =?us-ascii?Q?sIpuLrbDrCrqHs4zLrH/jfh9e8hNe1Kb/uXDopzYv+izxZVXAIvOdf93zgXY?=
 =?us-ascii?Q?t6H4QM3p+MLjn/CqkkBDi8on/bFo0BrSp47Uz7fo9rtY/AvJis2pzHAzmQ79?=
 =?us-ascii?Q?FuH7SYlkFoMOyA6SEYiw/cJulTSPYHzUQy7Yd+fU4hsTvMLxFLzfe1+TQx/U?=
 =?us-ascii?Q?IoO2TxOnHtb5GbvbePZm28NTmHQFt1At2ckjMBBDvvvnSajQmN4D90KoU3Gt?=
 =?us-ascii?Q?qlhaofGYCm+HW6duEw4QlxE8g7wgmLkWhmpgdWkbUBuZd7bmfAW6Tna34z1W?=
 =?us-ascii?Q?B/wNaA07jV42z31T/XyEbuZoRm0AqPVsdl6ef+Eb+2vIMG8AJLykWzOAr+pn?=
 =?us-ascii?Q?WQzCoR0TXZK6iA3lFFkj+aDYhPqovWkJx7VlNqHEg4/nP7g0s0ElFHX0hTld?=
 =?us-ascii?Q?SFPGXOKHEyAjhkqvuyk/DPCxPIZ1iP7l+ndsrenw3r8z1iJmKWxB/V0XSPUL?=
 =?us-ascii?Q?VqLMwPVmQLkRe4P3MogScbEwVccUd2MWu4BjYzbuGD91ftcn/lFetyYzYEWD?=
 =?us-ascii?Q?1AnEARBAYggM8bme/pfaQhVb5HH8j+DUFK5hqHLL0unGnSJqiqMf56liONBl?=
 =?us-ascii?Q?rdJOwiXL8y6ugPWcMjdg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E9XnvN4P9cYqmG/8ZtdMtbO+h7i62aifisB4+maMncBIOgcU98fA0qdb59B3?=
 =?us-ascii?Q?ANo055NG+lmXVLPI4oJFZWeiwVdHWrJ+g77VWRc5TRvyQnNG5rR1zlJYiFDF?=
 =?us-ascii?Q?cdyu9JH6IQKaD0W8p2V/EPBWdod9cS1IAV54n4DELeD7dQerYo3XxGrnKNIp?=
 =?us-ascii?Q?3xlY+G2mfOeMiBgG8Oq1UZueuhWILJkN5OBCeKcqcUW14sp/E74LfMbEfeh3?=
 =?us-ascii?Q?OnQMxLAKQj38XCrcZfNgfzB1ZWzqv2nd9f+cKg/xzQkv9K8023h/d9UQA9kw?=
 =?us-ascii?Q?osUqI0emZJj8rNfyK4Y7mJHDxsbd/1Guir1euIva4W+2cUXl4kLGfvXdyrNJ?=
 =?us-ascii?Q?jzo9rry/f5A3CFcuwm+62EuAR2UwM0No3crJyKVzT8zn4a2jjL3I9aBltXSm?=
 =?us-ascii?Q?D92k2OIe4g12mdeKywG0ZteTk2C2fQanK2QPXcVIe158kTpPp4Bm8R7/H4HW?=
 =?us-ascii?Q?zjJxm3BoWR7Xk7JCqr4pILKk3ZrAq6Gtt7GGPaqq19OclHiCV2bGObTB+WLf?=
 =?us-ascii?Q?W5EvJt2tAvbxmTBXM9Vq9+IV+jhSBMDh7RFPSkmTZqRO/b/abr9+vWSS13rR?=
 =?us-ascii?Q?b8lCOBQQ8X98lFpGBK5YhG47L+5pzXu4qPFcUnL1B9WZ6cMQxg+BGV98FLPY?=
 =?us-ascii?Q?UsDfBJ1r3Suxw9O9m1i0FPEnNtj2RPmsHNDgcm/eqpgdcSyyNmus/pTreg5S?=
 =?us-ascii?Q?6K9YtI0AAjJlqLCBqoDS0ZHs+49tX1mwplmdJWZrFn9Dv+aQ7kJ0/hRARVKu?=
 =?us-ascii?Q?BS/q7+ZX8fuvIyvYdrh33M6J5iCekeX64NJqzq/sRW6ZWz2B50UQNgLEMtip?=
 =?us-ascii?Q?43XPFyNOjW6AGsJaedkRFWp4PeX7pe8D4rSdP6cGfWRNFsTtPZwPyq8RWe1G?=
 =?us-ascii?Q?C1davwmbsq+A+i41R0SRPXahLEBd1TZe7FBCls2bi3pzPnR/G2xaHFBS2/8Y?=
 =?us-ascii?Q?LTUwAwWlpsRgawPpBwACYJlAPWEsxBOh3x9q7DnbWUA/EVlzCZgvF9xbzPHQ?=
 =?us-ascii?Q?LG9r5/TQPcHTt5Il2x3H+uEXxQ1nbrk6LuAbuakK/8iD5NH1WGOKbIdBBsQj?=
 =?us-ascii?Q?m05EBZXWvrm4nt/B6Lrn9+5DDFCSSn7rF2CzGElk1z1ATU3llX7XGp97w+84?=
 =?us-ascii?Q?wbIkuCvoe2tgQU7AI+h+RNQCaH8+ZczOWnozlRj6m0aa2BZZ257HBpnLPDps?=
 =?us-ascii?Q?sL4ilyiMydu6iJ39KFgzX+GsqYCHjs3zBx4WZAImI3+QY66HJBdEEE+1OfRT?=
 =?us-ascii?Q?yPn3mPSn2gChTTsACZ9gdGEhtJUYEGBNRxDdbZfZcDcXB9lgb8rMU+4Dm7v/?=
 =?us-ascii?Q?mCCdA9F9pFWvZWzZ8wo4Z7/bqvsIa7finHOgNkYwzUxEE8t5RIB30JI+neT0?=
 =?us-ascii?Q?0R+WaY9CsJJV3ELSHs+Q1U+YfhyR88wYSm1ItYpsVmLGRIj0UxMN1GDPCTQS?=
 =?us-ascii?Q?XJ7x4LITppyOIngglMJ5uf+HyoSDHJStQWniYUqtstgJdgr5oh2Cv2c3+BQt?=
 =?us-ascii?Q?9f16zb+gp5XEvolsW0ql8ACE4POCEUDNqR+c1tCRYIuF6dnUNqsYZ7rlAOVR?=
 =?us-ascii?Q?nWo4QGuKusoYEbutUXWPdX6JddYpA8U7mwdPkoK8i0YJK3nL+i7COlvABu0i?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ad6124-2589-4ec8-fee5-08dd0b047a11
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 14:46:41.4139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKyhMOiMB3ltxCHYzrbbf5aStnKJW4k4a6Q6NZFvX7tRoPvb+TV7vAuLjVdvntRiwktmAZqXXZFyMNnU+GaKkHhqlsYo1cnDAMJq99WwjTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
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

On Thu, Nov 21, 2024 at 08:29:42PM +0000, Jonathan Cavitt wrote:
> As a part of vm_bind_ioctl_check_args, all vm binds that use the
> DRM_XE_VM_BIND_OP_MAP_USERPTR operation must have a coherency mode of
> XE_COH_AT_LEAST_1WAY.  This is determined by the pat_index set in the
> bind operation before the bind is performed.
> 
> The value is usually set by intel_get_pat_idx_wb, as this is the
> default used in the various xe_vm_bind helper functions (or, more
> specifically, the pat index value DEFAULT_PAT_INDEX is passed, which
> translates to using intel_get_pat_idx_wb to generate the true value sent
> to the ioctl).  However, when the ioctl is called manually (through
> igt_ioctl, for example), it is up to the calling test to ensure the pat
> index value is correctly set, and in xe_vm, for example,
> intel_get_pat_idx_wb is used as well to set the pat index.
> 
> This step was not done in the simple_vm_bind function in
> xe_fault_injection, so use intel_get_pat_idx_wb to set the pat index.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3499
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Francois Dugast <francois.dugast@intel.com>
> CC: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 1b29041745..f8d7278caa 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -17,6 +17,7 @@
>  #include "igt_device.h"
>  #include "igt_kmod.h"
>  #include "igt_sysfs.h"
> +#include "intel_pat.h"
>  #include "lib/igt_syncobj.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -213,6 +214,7 @@ simple_vm_bind(int fd, uint32_t vm)
>  		.bind.addr = BO_ADDR,
>  		.bind.op = DRM_XE_VM_BIND_OP_MAP_USERPTR,
>  		.bind.flags = 0,
> +		.bind.pat_index = intel_get_pat_idx_wb(fd),
>  		.num_syncs = 1,
>  		.syncs = (uintptr_t)&syncobj,
>  		.exec_queue_id = 0,
> -- 
> 2.43.0
> 
