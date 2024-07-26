Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F7BC3DA49
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 21:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DAA10E221;
	Fri, 26 Jul 2024 21:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ji5P4wzQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E9310E2C3
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 21:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722029373; x=1753565373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lIwzIs2s4Yx+8mokgVyIV2KdZqHGzr9Ebp9G8MOKWGU=;
 b=Ji5P4wzQ5apZdmH3r37MQlgnHIEG5cL4eE9fNJlSKWv9eKCh8WLV12YH
 XgcOs+BdxA/WUZtl/Fra/Q3vAb1RtP8qiGmrVgIQFR/PVYgTK2NI031L/
 ed4bOUEc+7f781cuuXKytX8eHkboYZOwVYDEm//73UkiYbYEIwzWL5j6d
 C5lUoZ+ViiYiiwXUcsqO/cRuPRiTAweiUUrl9wGhkvxOqXolXWXQoTWhg
 zimK0oDNFcVYrANg5YDw4HECYjPWqKuRuHSBHdLjJuSY+kcr1+ceGvgV4
 hyEoDLEIuNeqUZYG5PTckjvL/A/nood1V6cD2WKigdMP4UtCB2pOrWKuu g==;
X-CSE-ConnectionGUID: CKShpB3+SOyZHFHpiHHXlg==
X-CSE-MsgGUID: 9fi7Y2+iS8GPJaoBk97zfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19975409"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19975409"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 14:29:32 -0700
X-CSE-ConnectionGUID: PmGb+4fuTSeLq6kzrODQwg==
X-CSE-MsgGUID: UXUIttRoS525WsRnCsYFzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="58164703"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 14:29:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 14:29:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 14:29:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 14:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sn8o5Ny3hqqGwL7qxEFqkxIjtIgNlAS+JMq7JVJQCL8vcr50zRxnIOJdK9U8JJJRkRn9YSpepkd5LSfoatAuumFcWDNBnB2QW+p3kAbt94LasbReYFTyfQW43I1HoSCnnY3apf/+tQ+90tpx0NTwiXn8BMvUvpErxeIs7xnRCKsvPflw1voTKKR9T3lNTqAzadORorllT60auHbpp4aIo9oXfg15XDLKQ6wkBb46EGOKYWovZoJVehsfs4ZFuFKbHgOqr3KJtq2oncJpeTsFovEapYtUdw+ezGEiYuoh6IHXah5uheMi2j2lSN3eFeR0iR2/e2kH9aen5bJdpK88eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZP4WvgXwUnlXREcAdfy2rMM8CX4dHga4o5x2lTtHAw=;
 b=Trh4ofu2w4cm4cUeE0lnsKnwy73/risf/ksLiVhaWJ/FNi4nRV06rbNoE9xua5BHOLsM4RkdpZtTaOsf9AcW8R/VQ3zQqpC+7bE2PfAxoNPy7Ttc4SwmwfWvJq3qhrhtjfumETJxLivpmuvRubheGRCFXHoJpAIKN/8tjJ5+kmTOodoZHroAWCpYhfDNT4VS+jqGfR4uIjXpmZbfOTmmAp7EIgTwzSGQ/yVSc3id/0CXFAmev5Qd09UCS9Q/Ep/WQu34tSayPjiYsF+0cjcSxiiAUjuHO+OIMEdCGOuAF/vF2O/SSwkGVs/EL1nYxAerHcdjhalcIjE4sWuj/g/0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4549.namprd11.prod.outlook.com (2603:10b6:208:26d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 21:29:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 21:29:28 +0000
Date: Fri, 26 Jul 2024 14:29:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Pallavi Mishra <pallavi.mishra@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/xe_exec_store: Modify test for Priority Mem
 Read feature
Message-ID: <20240726212926.GA2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240724194006.1201429-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240724194006.1201429-1-pallavi.mishra@intel.com>
X-ClientProxiedBy: BYAPR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:74::42) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4549:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ea07a4-6a60-4397-d624-08dcadba07e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nxew53ciTcRKXPRXz5YL5bZ0T9FK4O/cY3eKPqab8jbYEZsEAoN22g9VTrZN?=
 =?us-ascii?Q?woCgzwutr3fT8LNpioGl7kwDqii/MzeRcPDi1VGW20BsdmpcXVowdRCLzOjd?=
 =?us-ascii?Q?pV0dGGaXFLZrI24SyUYBFmz8Kaj7aJmodg60W2OUwOqoaj9sLcTKFnhZffSA?=
 =?us-ascii?Q?2OdD9+SvvVOxQ8JasaykmJ5fDOc+5kDGmI7JiVR+0HFDdUziXCESVcOUHFq+?=
 =?us-ascii?Q?8Hp64ar716hqEMsQEC4+v/mEnDO6gZ2nTou1YUytekwmrI6WHbV8G/yYh7Ed?=
 =?us-ascii?Q?4tVrlwWa/dpnSbOQySSzVWDHJzyn2aQhjoUhRRAOw/jHbTEn5rFC2K4GfFo+?=
 =?us-ascii?Q?iU2JzT3xibF8vYL7qKBaPubCtKMh4egdjKKG06BG/kBjal5w6BfLFI2lI3MG?=
 =?us-ascii?Q?ngaeKPT+3sXZ4uxVCGyqAaBb/obkpK8UlkyFXka8tw1yacbjkQHn6rb7sszS?=
 =?us-ascii?Q?gvkdvdJFGYBcF8O2jVYdjnAPw2NN1pxI77+WH3OtWzyTbgDBQcfV2j7GsOr4?=
 =?us-ascii?Q?qZMdOTnB2Dari9x+P7EnCVZF0QvqXGKbRFmq+K1CZHVmtPJHdCWKbPmfIHw6?=
 =?us-ascii?Q?y9QP8La/+q6+knBWq80rzDGgHS86XJMMIq2DYTt/RKnjNcX3xd1kf6MBX5KA?=
 =?us-ascii?Q?c3LQP+j0YSZrsnkh4ENd+mpbE5CREnfydDRRmAqfwQYZRIRRuJsDXMFFZI/S?=
 =?us-ascii?Q?uoyQqlf5313em53lD/8FdzxJVgtAD5mLKI83TPBb4Z095yueNChQrdc8VmCj?=
 =?us-ascii?Q?PAd43Zj7LeP2glS34M7FJQivWmIhhdSa0QHVC5/sa66JYiZkEAf47qnkx4wo?=
 =?us-ascii?Q?09L+B4IdweqtxS8cTrYX0KuD3Bs7PcYV0lXQ4+mtwQNLIwmVfhKVFGUbBSJI?=
 =?us-ascii?Q?6O/1Hm4r5Hfylkfei6nxrnTzsMdZrVim1RVKih8OOSCYyM1PFWMkI44qZzc0?=
 =?us-ascii?Q?1uNG1KQ9n6qdvQ4quBtAfVgdMomcO3yG2zG+XyUjCMJ9HYvB5PTLnODSWt/J?=
 =?us-ascii?Q?qdYqV+SwK8RBEGxyR1WjRQxeXkzju6Vvqk6PtXx9T9KxnWVu9CByj6CDhfqd?=
 =?us-ascii?Q?erUGyyQWtN6k4Mm4Y7i74ksuub4j3KK0RbCSlAxYjch5DUPPEbd0NaAa7if+?=
 =?us-ascii?Q?aDlnjt2SjEzDJdyqO9dRE5EVQT80DIG4v07pJ+/sGQ051PtKsob1DbZvolOC?=
 =?us-ascii?Q?8K1JKd+fdCWLFs2b2t6owwS6iAe0OI4jOIkgrGUwWTtkD1ZKz0582zV2HzbK?=
 =?us-ascii?Q?RzUrmNu9+9c/vpfKmZHjeLzNB3ZnaNFUM0/LyB5olev5vKGJMdCgHrGGOMHO?=
 =?us-ascii?Q?0qE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e8lnu9YBSZ2dTBGXDl3ozqo4NivqsrunnYtx91Jm5m3pxSyh28iTSesu96WB?=
 =?us-ascii?Q?Ku8cBoJ4SbyFpohp03xz+GPJQC+jh+cQBXsqbPSeyOveU9z8wCxIkAn7PSdA?=
 =?us-ascii?Q?CT5aZTAaC7NX0ojcl4SilZQO9x+fg7vYDFnmuwUv1LXTUcmXVhb55aAbUyvH?=
 =?us-ascii?Q?9mSD+97s5vwpuiLTz1HCy1cBZA85e8cu4wiMu+7QxgFBfsoQDNIR5Q4/wz+B?=
 =?us-ascii?Q?LEJS9lX297FbyhcT8yXg3anigv57XJTPvBnQLlSWw3dmpYEHmrdcj/20gqEc?=
 =?us-ascii?Q?mWGNfPantU7sBN8Il3OXuv81sey7vavj4UWcq3lNqgNDqw4YKrj4uL4ZzaUI?=
 =?us-ascii?Q?8yfClj6Xrx52pxmjeQRLk0Tb3DuTIrLY6Brche3yim0gRq91Jg2vsUYxjhrJ?=
 =?us-ascii?Q?7SYFf3xBYNv4GqnyHtb+T59ppeV4oE+UyaGAg+VBOFfZ4uBGTQlQTBDiw9S2?=
 =?us-ascii?Q?NSdocPjfghExim4c0kdk+RHNKx6sMbIAIjgupHu7ksXi7x9xDPCEGYRpZWa7?=
 =?us-ascii?Q?DkYCRgNWfL5ADLqYfg2oHGGpPTtB24xPukoJNJPjF/UJsy5bgikYEV4Sxq39?=
 =?us-ascii?Q?Pb22kG9/HqjLBaxKytDt4Rg05Rz/MknUByO3UOOXVAyPTVu1f4mc8L8X/a3t?=
 =?us-ascii?Q?+TAEUu8c6AIl1lIiaSg9rKC3oKt3gPHishpM0Q6i5tB3SG13ObE/SHk1AZKO?=
 =?us-ascii?Q?PzIRfPe03hiHMKlx+m7du6jlXhZBH8KC9+Vp6AlB1zEAj2crkl8ZajUcEtFQ?=
 =?us-ascii?Q?EmQLVP1V5XJpcky5AFVUL8lv2SYOKF4T76txywXozz/FrWtDb3zg9tOPD5/T?=
 =?us-ascii?Q?fDGo/oAdJyro164tDsmgrr8T7G3Lmf9O83E9tnEn2ivTWyL5vkN/F4VJuF4p?=
 =?us-ascii?Q?w39OL7waoFQrw6jaD9sNjzw28XjuMhbXcddsRmvWNHCsKs/S356CxsQAxC2m?=
 =?us-ascii?Q?iT0yyb2Atv/AM3K1LneAihfI+5ntdp4PJOZI4d3c847L7uCpx5Hc9a0SbplD?=
 =?us-ascii?Q?lqb0d4Se476Gt83/7k4YIdFTgWkgHOqTg29KNV6O9RhDUCEJPUisWIKjBvte?=
 =?us-ascii?Q?OC6lGcJOQnUJUNvbz+2Iy4ogkDtLWpgFTynCf391bap6lyk8cUgI1wXTqOg7?=
 =?us-ascii?Q?r/83RXXFezXnx282s8eaTAzNuwefk/nzplRFlmmFyqJnYJMF9k7fDO0y3/jV?=
 =?us-ascii?Q?/E7AGxgnbEOzaU7ShWl5x3OISxMPCsIt7baqeTqJ3MOBoBW6byWXEywFxO5F?=
 =?us-ascii?Q?/aOFBT3qK20qgGiNsm5GBkyOh/ShZOQNf7rY39kVawnjCl7uXdmtdrzaEtnG?=
 =?us-ascii?Q?L0WlezGKpxmILhaoenBP/Z/Pan1MlSdzW/ijCPEXHjihmeOawdrpa+1qo9T/?=
 =?us-ascii?Q?p2BmHxTFTlCb11FIfVn6nREEakQcwmAiUgXmvaXEg5wcDooN0SjlNFaxLzSb?=
 =?us-ascii?Q?SFQa4tSlHcaMwfVLSA1dP95LKEjoQiSA8xWnRrsAoyNzxgIFmmJX9SVrRsHn?=
 =?us-ascii?Q?WVSvV0b2wFsduEVMU9UT0fVi8s7Y/DC164i8khReSup2xrIuhBHyDqX61FTZ?=
 =?us-ascii?Q?u48gdSWnUpKiZKUu5iJjvr4/VQr2O94WB/8LF9kTi3GgCK4Ppy4i7VdKpoHN?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ea07a4-6a60-4397-d624-08dcadba07e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 21:29:28.8809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCLPeq0dzcF483ZeDaiCMp9hx0dlsow9+Q9Xq8mMtcHevDqm6mDdKpTnRiQxLASQLBvE+O1W5pLQ8m5zCQvksMe8EiIlcS2ccES7kOULHZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4549
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

On Thu, Jul 25, 2024 at 01:10:06AM +0530, Pallavi Mishra wrote:
> Now that KMD supports Priority Mem Read feature, care needs to
> be taken to avoid RAW hazards which may get introduced due to
> unordered read and writes. Inorder to prevent this insert
> MI_MEM_FENCE which will ensure data coherency in such
> scenarios.
> 
> KMD patch to enable Priority Mem Read:
> https://patchwork.freedesktop.org/series/134038/
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>  include/intel_gpu_commands.h | 2 ++
>  tests/intel/xe_exec_store.c  | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
> index fe734c4bb..cd281ba89 100644
> --- a/include/intel_gpu_commands.h
> +++ b/include/intel_gpu_commands.h
> @@ -89,6 +89,7 @@
>  #define   MI_DISPLAY_FLIP_SKL_PLANE_3_A	(7 << 8)
>  #define   MI_DISPLAY_FLIP_SKL_PLANE_3_B	(8 << 8)
>  #define   MI_DISPLAY_FLIP_SKL_PLANE_3_C	(9 << 8)
> +#define   MI_MEM_FENCE		MI_INSTR(0x09, 0)
>  #define MI_SEMAPHORE_MBOX	MI_INSTR(0x16, 1) /* gen6, gen7 */
>  #define   MI_SEMAPHORE_GLOBAL_GTT    (1<<22)
>  #define   MI_SEMAPHORE_UPDATE	    (1<<21)
> @@ -192,6 +193,7 @@
>  #define MI_OPCODE(x)		(((x) >> 23) & 0x3f)
>  #define IS_MI_LRI_CMD(x)	(MI_OPCODE(x) == MI_OPCODE(MI_INSTR(0x22, 0)))
>  #define MI_LRI_LEN(x)		(((x) & 0xff) + 1)
> +#define MI_WRITE_FENCE			(3 << 0)
>  
>  /*
>   * 3D instructions used by the kernel
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index c872c22d5..fb99e53b7 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -63,6 +63,7 @@ static void cond_batch(struct data *data, uint64_t addr, int value)
>  	data->batch[b++] = MI_ATOMIC | MI_ATOMIC_INC;
>  	data->batch[b++] = sdi_addr;
>  	data->batch[b++] = sdi_addr >> 32;
> +	data->batch[b++] = MI_MEM_FENCE | MI_WRITE_FENCE;

Does this need to be conditional?  I don't think the MI_MEM_FENCE
instruction existed before PVC, so I'm not sure what will happen if the
test executes this opcode on an older platform.


Matt

>  	data->batch[b++] = MI_CONDITIONAL_BATCH_BUFFER_END | MI_DO_COMPARE | 5 << 12 | 2;
>  	data->batch[b++] = value;
>  	data->batch[b++] = sdi_addr;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
