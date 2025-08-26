Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D388CA0FE7
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 17:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A45910E6B1;
	Tue, 26 Aug 2025 17:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hn9dpA74";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F210010E6B1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 17:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756230757; x=1787766757;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qo3T92EclXhdd7XZVCHpHthwoEY/SuHwxniWNaXqt5o=;
 b=Hn9dpA74X8hDrz+d8U4nQAeECY9Sldp5tbSVyPO1g0a0Cxc2So6paw9y
 pvGYP7I5AG5fBNiGQFfWinG4DkUGM695aj5XuhmG/4MDzaCXcrtSzSVW6
 CNkNSTjjOWHI1HV1LZrPTyWUp31lwRS/8l7ZbI+LTCfsT+1F873MfldOW
 N+uvFdwFeYiOI1xKKnWNIsYRJaQ12yPXqPa9+zUMxJYtMFN76ESLI5KwF
 SNdOhg+jUMPXlGpDhYwwiztjDVB8nIA4G8LLnU4/GyjazhFfRc1Cn/XgO
 llihK6BGl/wLGLbaYRm6TTc5eDcMwtwI/rH57jsi1BkZoxhGPi5SBEZTq Q==;
X-CSE-ConnectionGUID: FJewg1uBTGeDnRzzx0nfrA==
X-CSE-MsgGUID: uoYEaU4XR56iAyrvSBYBUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="61111049"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61111049"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 10:52:36 -0700
X-CSE-ConnectionGUID: KgrVtTt6QGKOnICNVyPfEA==
X-CSE-MsgGUID: R6nujObUSH6y/4pMT8H86Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174895199"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 10:52:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 10:52:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 10:52:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.72) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 10:52:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hM0H2+0JE3cGV3fcMTpmhtc022tfc+dlslBy692Gx6g08PsOFd4dtCJnRaDfKry2Wwf36pWGgsa9bSquaG/O2WRp2tk4QN13N6EghvyrVmtS3nhQxl8O1AIZzeG3WFl96mvzYtixQL4gn1D8D0V5tjCreSRAySh+I9jwcS+kny4s78SD+GcEEbL/9uAGZr8R9tO1br1ZgPHHgc6EwupN3jBOlpjO8PWjebxzr2VnN50FaWiKV8umfAJXdjO5ImQ9iG6r+Oysr98ocfProJRbu0oklXDfXYzJPmAjMPnWDca0XBIYL3ylMBN6rXNJzhlDuWQPVqq8OAU/8iCi2q+84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kjyfWM83GB0ZNgt1Zx6D0xgosINX//1hYe3zLLNIf8=;
 b=Aczp3iWTW4+hQ0vRR8J7JRZc2aMJowUoSsOZMxLhlc5IV9ubRcWsBFSwRE/uGzGG7z+POgkldZTtYD9wRJYzQtE78Mweja+L9lk4jpdtvvpBFMzXwZiUlmI8V2W53WbvuZpUZLpqZxUDJOo99SQ0rYwN2BnfGhNMTTV4wWGPDUh73ddYRXvjI6gErMH/0G6Xbc2prKmkutpVFNJhC+j/lcJpEs9q6lCz9zgfZJIxJ9E6/ddj7dnJQQPqT7h9ChvM5h3brZHIF/zwEmHnuCeiFgJLR6XQL7HBiLt9CoIqSAhRVShk5qtu5FOBTQXiT+Qd4oAdOo6v39CyxOoeDxdALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB8086.namprd11.prod.outlook.com (2603:10b6:610:190::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 17:52:34 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 17:52:34 +0000
Date: Tue, 26 Aug 2025 10:52:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add compute
 test
Message-ID: <aK30XreJ3nbzuLn5@lstrano-desk.jf.intel.com>
References: <20250826165952.507970-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250826165952.507970-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0148.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::33) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: efa23153-c932-4fe2-30c4-08dde4c955fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OxvgyXBRNAegxqOzKx4YIRoDHMKqthet1i+9q3Planws/S7VA7SEMvcmh7bi?=
 =?us-ascii?Q?jbmGzJmBCOvBHR1G8dLaPU6KkLfzEs1S574qkXfQVZSBLk7BhV2FaAxt6Pft?=
 =?us-ascii?Q?LLmeeCFUKCIAeMyV/8zHIU1yCCnW8JuryxbWgt51+MPHXeANm773KvgE/RWH?=
 =?us-ascii?Q?Fv4Y4XmQ/yWrBR9eHNBsvTAJxdx6Givgbjkcb8c+y4gTf7WZqRoN4zlcfX0M?=
 =?us-ascii?Q?ShXTwnYiAXBMajxhxyX1ILGz8GGy+EFAsQGvTzb02qxn0fsZAGl1e0xdve+K?=
 =?us-ascii?Q?lRdgttRlGng9b6lpgrblzLW+q4RG9mdLfi53Wd1YXMmwbPB+iWyqlNycnNkJ?=
 =?us-ascii?Q?NuheLsOquGCpdXVtGWHv2YzTGF6eHE7m04nNlNXERJH0KEHKHJiXMG3iVfyd?=
 =?us-ascii?Q?HwVWqMxOdQri/t2D2+P6incRJIldMT7DazdrY5shtl4k4GmWUW9wS0Myxw5Z?=
 =?us-ascii?Q?IQXYuLvoFnEr8G9LNYmhX7Ois7Ftvb8bgrXkXv2URro4zHlZ2qnWNPuCWRr4?=
 =?us-ascii?Q?VN/n3HuUdMiA6eB/QRIEt9/nzWriI+W4GxujXaRZihDP80PtEL8BB21dKRfR?=
 =?us-ascii?Q?mdv7FM5uSp2cHgO/nvu6ipWhQH5mZ+h2yHv0kr00i1fREJWYvkMkV9kJR3m9?=
 =?us-ascii?Q?VHJHMd1S97XlPQwPL0A/TJvp7fUm5n7ZApXorcWMU/sA21j19TomP8e/ckSX?=
 =?us-ascii?Q?fk5ZuI5ZwoZEUSn+mOwF9DwRiIDIUaETdg7NezG6FrgRi8NK0ylphcwSxTIj?=
 =?us-ascii?Q?6Nbpmn6E0j31+m0by6+HsWoLG+R1W5x31+MT8+hKuSRGedw9Ixt5pD7fVX+X?=
 =?us-ascii?Q?UoJlCbrUxwfq300ssYxZgvwtjc1sUeVD8k9ooEVLBbat0dB3JbPNnmI17LhK?=
 =?us-ascii?Q?2g+ACMiun03ba8ojFJq8m8O6gGeDBakxAgtrkXRL2FKHqLuqKcGYK4eJxpn2?=
 =?us-ascii?Q?lXQnQ5AMbDa/A1DZsxdanbVR3G7DNQ+slkSpEi3VEaVMOEnnqLFmloMgMZ6h?=
 =?us-ascii?Q?WppkpahvOEwaARjrKg78gqXSRgH0zvoJ15j3YpEPw9g1M/CgfIIoBlhSooxZ?=
 =?us-ascii?Q?r25jbSsisrYz81Czuyr1BWBPdGMt8hAKAQKjJL7y6/h2A4knb3iQctM/k1H4?=
 =?us-ascii?Q?0ZWl2/4wLRrshi9IDbaUfj23GdpfIe8kFSytaL6Y2uqnNCU+Gf/Gb4td5Odu?=
 =?us-ascii?Q?o+V9ZYT/NGXpQDk+UhcUj/dZwo0wnFgDPSUfcrksRL5+xMzyKd0Mj6nAgjrA?=
 =?us-ascii?Q?qxXmV/n/zNfthr009Mm4zakXlbxbjvj3cgZLJ7WhTiTsYfB3GDHxzPE1cBzj?=
 =?us-ascii?Q?+ll4kW2KCYRwHwOZunorUb87QW6BnbZXd/8Bdb6x3evq76NujS83wykGmBMN?=
 =?us-ascii?Q?38GUOXzLmZBCr/zKJyiuzMJ3DFfd/3fU/K6AUOKJRwOGxoHZybM3bhtsGYII?=
 =?us-ascii?Q?kSggNvm0tF4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VOd1ZwFhjqJfBfRO7RWzEoLDj9WTdv45W4AKUMg0cAzAQ/fDdiKTS0+0sQM8?=
 =?us-ascii?Q?geRDvSOqGXjwEYcxD3NG+gOa/4+vWfKz/S9eytOdzi7+E7iNJQb8Qtr5mwg7?=
 =?us-ascii?Q?Timg+46VHxuUG0MIJXlBVaXsYRVD+EmD/14NL9ErRy6iTOpBYD1j78mcbFrH?=
 =?us-ascii?Q?bOUJopSwECrESlmOv9AX4KIVY2amoEAlwW0rai43bRcKPQ6LHeNglPWIM1gh?=
 =?us-ascii?Q?oy1ewF1uGk8g26BjEsUESoDnd0P9e1rR7UIL0fqT7wzv4txVpGk/hxjDKZ16?=
 =?us-ascii?Q?z8VeXqFOmaDTeKrAaOs7NcvKHvT/L7HSz62oW7qjk2svyg0erEAvkuoGS0aF?=
 =?us-ascii?Q?AotUhq1quMBDGQJEXHr4yKzVY5YKQJYePtCHj3ABz2rKTqsDNJMTOwyOxUH8?=
 =?us-ascii?Q?CxaJ+rvAngN864nwyZ9FwvJ1yOIrbMEHXbynFOOV4WCYBJWQcq1ZB1dL70+T?=
 =?us-ascii?Q?7XteP4nemjqWHNOaH1m9a5vxRsaCS2SpkPiu1jzxgqenAfEfRGDP2Sboebbd?=
 =?us-ascii?Q?DdzJdimcdumjduy9kE+ikl8thX8CNW3p884USPtiPRtyxb7uDahsrpo2+lyV?=
 =?us-ascii?Q?QdEBrrJV9QkVaYHe/nGIZSxQUsFv4NdPZF0pAJevyXMNztScf/tfmCvpqNga?=
 =?us-ascii?Q?4WLZFXU7S1KwrLdt8uVe7fSYm45yK+y//MY0kpE/lQ25HsDg0qDW6t1PonFJ?=
 =?us-ascii?Q?MtKwcwcsWCAdfchXAeqU4kUc6dxZ4WTtkuXNZx4fTL6yrgb687pLgYnyh0VL?=
 =?us-ascii?Q?8VdeDuggZ8J1bchn/djvF6iLQ7E7XUdceCG5ntb7/OEKCdiEk6IpqjbuUe9p?=
 =?us-ascii?Q?RcA+hbDG+KprNWpb/FOCg/icRCQzg2k69iHZvz55EhRnG/AtQrML6w0XuJ/H?=
 =?us-ascii?Q?Ud9ukjsf9XbIln7zQRPyhyb55SefFWMqqF05V9wMPEzJA1nMxASQFGEnSmPJ?=
 =?us-ascii?Q?4jfCqKEKc3dsAfveIWcyXPPhDKhOaq5Zv9LNqFCyta1DrT8ooa4DQUUkj+EN?=
 =?us-ascii?Q?kFj4gOSJH2Edp5gxrX9TBujmXj/ebGhPXmb09Sw542POCwR5X0DiTE/K/fIT?=
 =?us-ascii?Q?MUqQIiZoNR4pdz059q/8q5Hx3dJXJh5xKDL2NLuFWsDgLKjwS4e2R7diEpv1?=
 =?us-ascii?Q?6UrjRI5DPRI4mcgk8qpxw3xJcgTyHdsStNa8pL2GCEld3g8vTJdK0BPkpCAK?=
 =?us-ascii?Q?vMT9+j2v8OcooIuCsA84mV24PyXeJCatDrGTRzyoQZgUJyecWBFUgQMaX2ig?=
 =?us-ascii?Q?ImbDeepDB78XwuuFZxEg8Vv7mANOmoeufQ3wd9ETZDlbWWJmGtjFqNFRgg5f?=
 =?us-ascii?Q?sRemTL/AU6FXrd9GFuE7P7e6/IhQ64wv1ui1b+8qqZxmGTx4CnKm463WW1ZP?=
 =?us-ascii?Q?e/yyPsRGFNAxQxey2qa+KI5DoYcj3WMtKF9MFd4qHn9Ry0jLXBFzbDrPQhUZ?=
 =?us-ascii?Q?Lj83D2p8/fq+VSP2/PAOwTg0Gx28DYP7YgGcreXb7D/tUgJ0sGB13lpYtPxK?=
 =?us-ascii?Q?Qd4NT1Z6Oi6+YoflF3IeZZmBmEasFfTtjmdAK0qe63Yb76+F8lUuWBpLGAs0?=
 =?us-ascii?Q?80biwMTnCfLZz7CGerubv6KbiDA2zbyxjIp1POcuj3ZMJFmRol2UZpzBoqJX?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efa23153-c932-4fe2-30c4-08dde4c955fb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 17:52:34.0379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0j6WicIr7MPVqRqTAUEtMrkBCYXXh/WJPfib7SUrRCNokLkxWiwxEP88ToWs7Ph1lETXso9OKa3Lst5ffJTfJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8086
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

On Tue, Aug 26, 2025 at 06:59:52PM +0200, Francois Dugast wrote:
> The IGT compute library recently received multiple series of updates to
> make it usable with the system allocator. This new test makes use of it
> to trigger SVM faults from EUs.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 56 ++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 007d9bdc0..e7f3d423a 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -18,6 +18,7 @@
>  
>  #include "igt.h"
>  #include "lib/igt_syncobj.h"
> +#include "lib/intel_compute.h"
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
>  
> @@ -1728,6 +1729,57 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>  	munmap(pdata, sizeof(*pdata));
>  }
>  
> +/**
> + * SUBTEST: compute
> + * Description: Run a simple compute kernel with the system allocator
> + * Test category: functionality test
> + */
> +static void
> +test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value = USER_FENCE_VALUE,
> +	};
> +	struct bo_sync {
> +		uint64_t sync;
> +	} *bo_sync;
> +	uint32_t vm;
> +	struct user_execenv env = {
> +		.array_size = size / sizeof(float),
> +	};
> +	float *compute_input, *compute_output;
> +	int i;
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
> +	sync.addr = to_user_pointer(&bo_sync->sync);
> +	bind_system_allocator(&sync, 1);
> +	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +
> +	compute_input = aligned_alloc(SZ_2M, size);
> +	igt_assert(compute_input);
> +	compute_output = aligned_alloc(SZ_2M, size);
> +	igt_assert(compute_output);
> +
> +	for (i = 0; i < env.array_size; i++)
> +		compute_input[i] = rand() / (float)RAND_MAX;
> +
> +	env.input_addr = to_user_pointer(compute_input);
> +	env.output_addr = to_user_pointer(compute_output);
> +	env.vm = vm;
> +	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> +
> +	for (i = 0; i < env.array_size; i++)
> +		igt_assert_eq_double(compute_input[i] * compute_input[i], compute_output[i]);
> +
> +	free(compute_output);
> +	free(compute_input);
> +	unbind_system_allocator();
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  struct section {
>  	const char *name;
>  	unsigned int flags;
> @@ -2026,6 +2078,10 @@ igt_main
>  			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
>  	}
>  
> +	igt_subtest("compute")
> +		xe_for_each_engine(fd, hwe)
> +			test_compute(fd, hwe, SZ_2M);
> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		drm_close_driver(fd);
> -- 
> 2.43.0
> 
