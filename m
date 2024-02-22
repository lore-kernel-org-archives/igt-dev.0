Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64925C48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 02:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD5B10E856;
	Thu, 22 Feb 2024 02:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Og2MoINy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDA110E85D
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 02:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708570795; x=1740106795;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rf554UkC3y2ximpbIBPLtyosKgd0/nIJ+VVzrSDWw1M=;
 b=Og2MoINyh4yjbblgkJkwbwwFp3nZPrO0ba+42Uhym+BPumDP19kwkWxA
 VSOGYXZq2Bp6sGahx4aXXuBJflXJAZqBKyIVxnUEs6MefKtaB6qo6luur
 jjIgJq6004sTm96nN4u+Apk7WdAluDYhCJfAJ9H9y0hroSSWdx2tFK2ib
 URiFB5r++YNAfhUWYAtIR4NeHXUOwRX1MYwzTipiL94hHJdbxJ4u4bJ//
 Xvff6wulagMuIAAHmOvGAFMpdH5OsWEvOLU1WSaypE9snMOe0qhG4QDio
 VSW4PYzTbwOaHHJn+RUuEfyZULdXXsA9UH4RMCtekVjrT2JwLtsaAJAQu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13898028"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="13898028"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 18:59:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5504051"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 18:59:46 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 18:59:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 18:59:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 18:59:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GITabZQ1JmVUbC5D0qYe907r0edAsytspdfzbt6SK69KvuHDC8YYvcb39gJdmzAHAXuMpzon623GZGqQjhxSAQV5rrcpdqUCNo+TYj+ZJSZjpTcZ6yfBtiVg/GkLfMYd5ap3y/3YOxrqNrpCZBz0nzHqA1REU1IKUbwAMmqDTZOHUGvSeL5pg1viRjotn0ZPtIu2le0qCn2LFjIqoMpC9D3AbB2/goeBMeCNQ3I7qbgG6SZCRpjvO6GsEt4R5FJKWnjsb47usXOqiJzluX0HF+Fx6r90MrBKvuq/oSmCgGnpB/WPA1CnC4HMq9CBnjQ+Hy7urzgmV3ImPPBFiH9Wzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYSf1FDW8UEeKiaIXakyWjxaznJltDB6IhgvM9RtoVc=;
 b=gK/LikAPNkqI06Ie8B0s7FPesAx/6CHuYZ496Bchle8PSuKePzh5LPDr1xZXR8IpEE+2/FFG43I6cLewOeHe9/MenJpkAFN7rimm6nns4MPp8bOxToM8RJpjDRy5zUwQ0ifYuPiLKbRUT/fu9xp5JDoMCN+o3dFHjeJrmH5b+JXmNeGlblJZTYahIa+33sn3zEKoJMdrvhP4+80QXQ1ZF6rXPy65RjW5Iu/pvmHsP4IpxiS4UTMiBGF2NYIO8w8QX0LKiU3i4W83PdUxhIUsCJcQO4ystYCGIZY1x6zOfjbplgg0kWs3l3cyHVUm60vbKrDxVBBrWqL+IwgvKsy3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4971.namprd11.prod.outlook.com (2603:10b6:806:118::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 02:59:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%7]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 02:59:40 +0000
Date: Thu, 22 Feb 2024 02:58:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH i-g-t,v2] drm-uapi/xe: Remove unused flags
Message-ID: <Zda4V1Yo2i70tcMz@DUT025-TGLU.fm.intel.com>
References: <20240221160816.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221160816.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: 3448fd3e-06cb-4e37-8e87-08dc33525027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sG3gIPUspvAb5vo2XBENY6PdylgYJItwez9SSCgb/H98cTVn05N3z20RyVL+bokLAT4pVtRf7NzHsGjv7E6XzTKupK3/PO+QvN0JnbzeWjHqlrAggQNT/1qZ6CaCCUbhTtYR6SSSsv7megJiDxL3WduMbMlST0o2BW17W48elI4ZjieJCBrz2ftbFNl32YtxxO1JcmVxJgr3PNLFdOmJgu4dOISt3udgkdF5G2AsOdHJRv5s2WHIFbJ5/Vdeo0dXEWA3INuSnv3YP6XbEjxEiLPZYIRgoRZz8WwKuEtluSScRW1zOayAcTW2nEiegMOh5sig6pGabiQcIWwzQ1gEsfMjioEFHVh70+SPXFlwYFGDZ6em9Ihr8+OOzeqPPKBwb4gZPXnVaPbVXHt8cpWyFzIVxCtzA32sWtCUSMDtHdTNzqEMpRyDzxiu6mbphZ1yy0bMQwRcjSw+RX/PzEg9KMqtc1Bqb1toeGKoMgIlW5SVmer46/oDAsN/v3oILiquyLGzbLksMLV5XOXnkKgXuoIM2uryRef9Nok+35yp3zk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ufGLBiTX7zcrBVTwkf5zFdtKMSxaW1gVIr/P9GnDbRblsnuemHEdYe4Uaz?=
 =?iso-8859-1?Q?99R99csK2iqqFikfEg8IRRD0kvkKdvnjEpOhc1DGJLS7VTSYzYZpGstx9N?=
 =?iso-8859-1?Q?rg3XJWu/g/+R/JSKv5OEyrCYvn+Vp8Y3AACeFVMezxPUnf749ERmn60zQF?=
 =?iso-8859-1?Q?GvJ1tRz+aq4q9CuIJy5Wq3UnryPzmqdRZJYBAVK9q657Cm68DcOPl2lEmy?=
 =?iso-8859-1?Q?gVveirEy6BUGkyLM4b60Yen09YrYxKMUM8dIG4Xmfz6dM+j3blyzEQGq6f?=
 =?iso-8859-1?Q?nXwmQXk89TUnQEvCpqD+KsSBueMyDq55dpUQEdvC7kOXRa4qsNAz2fx+sO?=
 =?iso-8859-1?Q?C5/ozFQ3jimn1Tgx7oc/kyTLJNPn9mkAKisJID6oiOCsy7oqSeQCn/EJ0q?=
 =?iso-8859-1?Q?pEmiLrEz8LQBvzotSttPCJSnJ5E7mI7ZOSFTkAiRuh/D08PzdYQyMRwIQk?=
 =?iso-8859-1?Q?t29ccUADbpqflSyqmY3iy9l5U9g/vJq4TniNU0Hn8H2/DZaqayM1Ou8SiB?=
 =?iso-8859-1?Q?sAg6yqeDmaF5DLocWIiF2ft9SpChQC9KPIMfV1E8hYktn8D4tr9RNHbY0K?=
 =?iso-8859-1?Q?OBt1vYnf9uYFRRaGe0AfPVCGIeKNOiPF9Gb+jw2WoRzxrmPfGvPlQGm4Zl?=
 =?iso-8859-1?Q?0ysuckpo8fweM9AESb594IYbftYw/5H9CBZMQkCib3c4Q0LoTIt8PLKzyS?=
 =?iso-8859-1?Q?smS5rMuNpkLfxDfpEKqVGgVhwcKlAckpxBU9RD7XxoUxKDTLEk60RcnA89?=
 =?iso-8859-1?Q?pp7/lLgLY6E8WxHy7mrkrYHRm0ms5ft/W83ISDtDeHlFXmhtgA7N8gx1kb?=
 =?iso-8859-1?Q?t2jwPd7GEqxD0BiKIDzJqlPJU0Rk3HuBeROLXuJ2HbCMcRaD7eyS3yHew7?=
 =?iso-8859-1?Q?NLHUjSIm8AGHrRRVeB8Fe88CKF+nwzYthvXcqDmyO3gizGnL1RkVvd0bYf?=
 =?iso-8859-1?Q?KZSh8yzGHhBUZlWJ1OCPXTRTrAo3ktk+iPZr+VwPB2vFP1uYXITPh5tPm4?=
 =?iso-8859-1?Q?OzFYrEW0+pRMTgabjzmvCILFiW6kp7G2QesNGlCyuA009utvVQok4s5caW?=
 =?iso-8859-1?Q?5U96ekgy4F9SPm54e/Pu9L7LFlM85DmhSvYB//VxSOUUdqsN5u5ey1MH+B?=
 =?iso-8859-1?Q?cqo9xGVX7sZ3Bffto/97La4BsWYTjre2f4PHPndU/zTTAtBLjvRFc07IJe?=
 =?iso-8859-1?Q?h3X9GJEA7dMzkLMwnheQhBrOAjmEKmR3osT4v0e4I3lOEwrXG+UwfPE7K5?=
 =?iso-8859-1?Q?ys/k6LiK8FNjB2o4YUulpmEZHisqLT0NwRM9ND06SeUCWD5GUyI4ybe46/?=
 =?iso-8859-1?Q?DANlPf2yxTYcj63ngSobdG///JTVlGdoUbTH8QeKqNLA7Tu0vPjMS3OMMC?=
 =?iso-8859-1?Q?j+8/qqxSdcfz3jmaklxF4Bt22vl9DGRg9bL4IZb5xqoLSx0dnWi/W9VTgc?=
 =?iso-8859-1?Q?Trk6xfpGZaoAOGnJN/VRqsoQpMsb4Z+8DDjVE1/DFX9QMqfJtkkJ4IBygT?=
 =?iso-8859-1?Q?1O9rdv5VriZCh7H+z0MS9zsJ8wanWUrWMJVkoFwbFsUUtbOwITPfE/tuAi?=
 =?iso-8859-1?Q?XSRCEG7jVTYrQRc+q6hZ7Qy8+H2pKhqXPt7qDlRkhx2wgivS8q7GYBfD17?=
 =?iso-8859-1?Q?03Hp1bRfzZY3pel6QzlOCbO+N3/HJJ9x7YjJnZ0ihVzdd6Xm6XXtBLUQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3448fd3e-06cb-4e37-8e87-08dc33525027
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 02:59:40.6893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+4PNTNCyNicREJojHYGR7FY4EsW1qsadg+I3SpL/BRTRT6YXuyrqvOTGQ9psdb7kmOaGNmXkdjkuxUYAS7Y6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4971
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

On Wed, Feb 21, 2024 at 04:08:16PM +0000, Francois Dugast wrote:
> This aligns with kernel commit ("drm/xe/uapi: Remove unused flags"). As
> a consequence, some tests which dependend on the removed flags are also
> removed. Also, ensure that the removed flag values are no longer
> accepted to prevent mismatch.
> 
> v2:
> - Rebase after removal of persistent exec_queues (Francois Dugast)
> - Update xe-fast-feedback.testlist (Rodrigo Vivi)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  include/drm-uapi/xe_drm.h                |  21 -----
>  tests/intel-ci/xe-fast-feedback.testlist |  11 +--
>  tests/intel/xe_access_counter.c          |  81 -----------------
>  tests/intel/xe_exec_fault_mode.c         |  60 ++-----------
>  tests/intel/xe_exec_queue_property.c     |  55 +++++++++---
>  tests/intel/xe_exec_reset.c              | 110 ++---------------------
>  tests/intel/xe_exec_threads.c            |  13 +--
>  tests/intel/xe_vm.c                      |  69 ++++++++++++++
>  tests/meson.build                        |   1 -
>  9 files changed, 133 insertions(+), 288 deletions(-)
>  delete mode 100644 tests/intel/xe_access_counter.c
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index bacdca787..2417a9654 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -831,11 +831,6 @@ struct drm_xe_vm_destroy {
>   *  - %DRM_XE_VM_BIND_OP_PREFETCH
>   *
>   * and the @flags can be:
> - *  - %DRM_XE_VM_BIND_FLAG_READONLY
> - *  - %DRM_XE_VM_BIND_FLAG_ASYNC
> - *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
> - *    MAP operation immediately rather than deferring the MAP to the page
> - *    fault handler.
>   *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
>   *    tables are setup with a special bit which indicates writes are
>   *    dropped and all reads return zero. In the future, the NULL flags
> @@ -928,8 +923,6 @@ struct drm_xe_vm_bind_op {
>  	/** @op: Bind operation to perform */
>  	__u32 op;
>  
> -#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>  	/** @flags: Bind flags */
>  	__u32 flags;
> @@ -1045,20 +1038,6 @@ struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
> -/* Monitor 128KB contiguous region with 4K sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_128K				0
> -/* Monitor 2MB contiguous region with 64KB sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_2M				1
> -/* Monitor 16MB contiguous region with 512KB sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_16M				2
> -/* Monitor 64MB contiguous region with 2M sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_64M				3
>  
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 6c01374c1..17863b6b1 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -75,6 +75,7 @@ igt@xe_exec_compute_mode@twice-bindexecqueue-userptr
>  igt@xe_exec_compute_mode@twice-bindexecqueue-rebind
>  igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind
>  igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate
> +igt@xe_exec_queue_property@invalid-property
>  igt@xe_exec_reset@close-fd-no-exec
>  igt@xe_exec_reset@cm-close-fd-no-exec
>  igt@xe_exec_reset@virtual-close-fd-no-exec
> @@ -244,16 +245,6 @@ igt@xe_exec_fault_mode@twice-bindexecqueue-userptr
>  igt@xe_exec_fault_mode@twice-bindexecqueue-rebind
>  igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind
>  igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate
> -igt@xe_exec_fault_mode@twice-basic-imm
> -igt@xe_exec_fault_mode@twice-userptr-imm
> -igt@xe_exec_fault_mode@twice-rebind-imm
> -igt@xe_exec_fault_mode@twice-userptr-rebind-imm
> -igt@xe_exec_fault_mode@twice-userptr-invalidate-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm
>  igt@xe_exec_fault_mode@twice-basic-prefetch
>  igt@xe_exec_fault_mode@twice-userptr-prefetch
>  igt@xe_exec_fault_mode@twice-rebind-prefetch
> diff --git a/tests/intel/xe_access_counter.c b/tests/intel/xe_access_counter.c
> deleted file mode 100644
> index 91367f560..000000000
> --- a/tests/intel/xe_access_counter.c
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2023 Intel Corporation
> - */
> -
> -/**
> - * TEST: Basic tests for access counter functionality
> - * Category: Software building block
> - * Run type: FULL
> - * Sub-category: access counter
> - * Functionality: access counter
> - * Test category: functionality test
> - * SUBTEST: invalid-param
> - * Description: Giving invalid granularity size parameter and checks for invalid error.
> - */
> -
> -#include "igt.h"
> -#include "lib/igt_syncobj.h"
> -#include "lib/intel_reg.h"
> -#include "xe_drm.h"
> -
> -#include "xe/xe_ioctl.h"
> -#include "xe/xe_query.h"
> -#include <string.h>
> -
> -#define SIZE_64M  3
> -igt_main
> -{
> -	int fd;
> -
> -	igt_fixture {
> -		uint16_t devid;
> -
> -		fd = drm_open_driver(DRIVER_XE);
> -		devid = intel_get_drm_devid(fd);
> -		igt_require(xe_supports_faults(fd));
> -		igt_require(IS_PONTEVECCHIO(devid));
> -	}
> -
> -	igt_subtest("invalid-param") {
> -		struct drm_xe_engine_class_instance instance = {
> -			 .engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
> -		 };
> -
> -		int ret;
> -		const int expected = -EINVAL;
> -
> -		struct drm_xe_ext_set_property ext = {
> -			.base.next_extension = 0,
> -			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> -			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY,
> -			.value = SIZE_64M + 1,
> -		};
> -
> -		struct drm_xe_exec_queue_create create = {
> -			.extensions = to_user_pointer(&ext),
> -			.vm_id = xe_vm_create(fd, 0, 0),
> -			.width = 1,
> -			.num_placements = 1,
> -			.instances = to_user_pointer(&instance),
> -		};
> -
> -		if (igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
> -			ret = -errno;
> -			errno = 0;
> -		}
> -
> -		igt_assert_eq(ret, expected);
> -		ext.value = -1;
> -
> -		if (igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
> -			ret = -errno;
> -			errno = 0;
> -		}
> -
> -		igt_assert_eq(ret, expected);
> -	}
> -
> -	igt_fixture
> -		drm_close_driver(fd);
> -}
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index dae0e8ac3..20a7cf8fe 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -29,9 +29,8 @@
>  #define INVALIDATE	(0x1 << 2)
>  #define RACE		(0x1 << 3)
>  #define BIND_EXEC_QUEUE	(0x1 << 4)
> -#define IMMEDIATE	(0x1 << 5)
> -#define PREFETCH	(0x1 << 6)
> -#define INVALID_FAULT	(0x1 << 7)
> +#define PREFETCH	(0x1 << 5)
> +#define INVALID_FAULT	(0x1 << 6)
>  
>  /**
>   * SUBTEST: once-%s
> @@ -66,21 +65,6 @@
>   *					bindexecqueue userptr invalidate
>   * @bindexecqueue-userptr-invalidate-race:
>   *					bindexecqueue userptr invalidate race
> - * @basic-imm:				basic imm
> - * @userptr-imm:			userptr imm
> - * @rebind-imm:				rebind imm
> - * @userptr-rebind-imm:			userptr rebind imm
> - * @userptr-invalidate-imm:		userptr invalidate imm
> - * @userptr-invalidate-race-imm:	userptr invalidate race imm
> - * @bindexecqueue-imm:			bindexecqueue imm
> - * @bindexecqueue-userptr-imm:		bindexecqueue userptr imm
> - * @bindexecqueue-rebind-imm:		bindexecqueue rebind imm
> - * @bindexecqueue-userptr-rebind-imm:
> - *					bindexecqueue userptr rebind imm
> - * @bindexecqueue-userptr-invalidate-imm:
> - *					bindexecqueue userptr invalidate imm
> - * @bindexecqueue-userptr-invalidate-race-imm:
> - *					bindexecqueue userptr invalidate race imm
>   * @basic-prefetch:			basic prefetch
>   * @userptr-prefetch:			userptr prefetch
>   * @rebind-prefetch:			rebind prefetch
> @@ -172,25 +156,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  
>  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> -	if (flags & IMMEDIATE) {
> -		if (bo)
> -			xe_vm_bind_async_flags(fd, vm, bind_exec_queues[0], bo, 0,
> -					       addr, bo_size, sync, 1,
> -					       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
> -		else
> -			xe_vm_bind_userptr_async_flags(fd, vm, bind_exec_queues[0],
> -						       to_user_pointer(data),
> -						       addr, bo_size, sync, 1,
> -						       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
> -	} else {
> -		if (bo)
> -			xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> +	if (bo)
> +		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> +				 bo_size, sync, 1);
> +	else
> +		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> +					 to_user_pointer(data), addr,
>  					 bo_size, sync, 1);
> -		else
> -			xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> -						 to_user_pointer(data), addr,
> -						 bo_size, sync, 1);
> -	}
>  
>  #define ONE_SEC	MS_TO_NS(1000)
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> @@ -343,22 +315,6 @@ igt_main
>  			INVALIDATE },
>  		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE | USERPTR |
>  			INVALIDATE | RACE },
> -		{ "basic-imm", IMMEDIATE },
> -		{ "userptr-imm", IMMEDIATE | USERPTR },
> -		{ "rebind-imm", IMMEDIATE | REBIND },
> -		{ "userptr-rebind-imm", IMMEDIATE | USERPTR | REBIND },
> -		{ "userptr-invalidate-imm", IMMEDIATE | USERPTR | INVALIDATE },
> -		{ "userptr-invalidate-race-imm", IMMEDIATE | USERPTR |
> -			INVALIDATE | RACE },
> -		{ "bindexecqueue-imm", IMMEDIATE | BIND_EXEC_QUEUE },
> -		{ "bindexecqueue-userptr-imm", IMMEDIATE | BIND_EXEC_QUEUE | USERPTR },
> -		{ "bindexecqueue-rebind-imm", IMMEDIATE | BIND_EXEC_QUEUE | REBIND },
> -		{ "bindexecqueue-userptr-rebind-imm", IMMEDIATE | BIND_EXEC_QUEUE |
> -			USERPTR | REBIND },
> -		{ "bindexecqueue-userptr-invalidate-imm", IMMEDIATE | BIND_EXEC_QUEUE |
> -			USERPTR | INVALIDATE },
> -		{ "bindexecqueue-userptr-invalidate-race-imm", IMMEDIATE |
> -			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
>  		{ "basic-prefetch", PREFETCH },
>  		{ "userptr-prefetch", PREFETCH | USERPTR },
>  		{ "rebind-prefetch", PREFETCH | REBIND },
> diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> index 4fdd4ceae..4e20cfd25 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -16,9 +16,7 @@
>   *
>   * arg[1]:
>   *
> - * @preempt_timeout_us:		preempt timeout us
>   * @timeslice_duration_us:	timeslice duration us
> - * @job_timeout_ms:		job timeout ms
>   */
>  
>  #include <dirent.h>
> @@ -40,11 +38,7 @@
>  
>  static int get_property_name(const char *property)
>  {
> -	if (strstr(property, "preempt"))
> -		return DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT;
> -	else if (strstr(property, "job_timeout"))
> -		return DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT;
> -	else if (strstr(property, "timeslice"))
> +	if (strstr(property, "timeslice"))
>  		return DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE;
>  	else
>  		return -1;
> @@ -172,6 +166,46 @@ static void basic_get_property(int xe)
>  	xe_vm_destroy(xe, vm);
>  }
>  
> +/**
> + * SUBTEST: invalid-property
> + * Description: Ensure only valid values for property are accepted.
> + * Test category: functionality test
> + */
> +static void invalid_property(int xe)
> +{
> +	uint32_t valid_property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY;
> +	struct drm_xe_engine_class_instance instance = {
> +			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
> +	};
> +	struct drm_xe_ext_set_property ext = {
> +		.base.next_extension = 0,
> +		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.property = valid_property,
> +		.value = 1,
> +	};
> +
> +	struct drm_xe_exec_queue_create create = {
> +		.extensions = to_user_pointer(&ext),
> +		.width = 1,
> +		.num_placements = 1,
> +		.instances = to_user_pointer(&instance),
> +		.vm_id = xe_vm_create(xe, 0, 0),
> +	};
> +	/* Correct value should pass */
> +	igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
> +
> +	/* This will fail as soon as a new property is introduced. It is
> +	 * expected and the test will have to be updated. */
> +	for (int i = 2; i < 16; i++ ) {
> +		ext.property = i;
> +		do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +	}
> +
> +	/* Correct value should still pass */
> +	ext.property = valid_property;
> +	igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
> +}
> +
>  igt_main
>  {
>  	static const struct {
> @@ -179,9 +213,7 @@ igt_main
>  		void (*fn)(int, int, const char **);
>  	} tests[] = {{"property-min-max", test_property_min_max}, {} };
>  
> -	const char *property[][3] = { {"preempt_timeout_us", "preempt_timeout_min", "preempt_timeout_max"},
> -				      {"timeslice_duration_us", "timeslice_duration_min", "timeslice_duration_max"},
> -				      {"job_timeout_ms", "job_timeout_min", "job_timeout_max"},
> +	const char *property[][3] = { {"timeslice_duration_us", "timeslice_duration_min", "timeslice_duration_max"},
>  	};
>  	int count = sizeof(property) / sizeof(property[0]);
>  	int sys_fd;
> @@ -249,6 +281,9 @@ igt_main
>  	igt_subtest("basic-get-property")
>  		basic_get_property(xe);
>  
> +	igt_subtest("invalid-property")
> +		invalid_property(xe);
> +
>  	igt_fixture {
>  		xe_device_put(xe);
>  		drm_close_driver(xe);
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index a9206d7d2..a39e5860e 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -93,22 +93,14 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
>  
>  #define MAX_N_EXECQUEUES	16
>  #define MAX_INSTANCE		9
> -#define CANCEL				(0x1 << 0)
> -#define EXEC_QUEUE_RESET	(0x1 << 1)
> -#define GT_RESET			(0x1 << 2)
> -#define CLOSE_FD			(0x1 << 3)
> -#define CLOSE_EXEC_QUEUES	(0x1 << 4)
> -#define VIRTUAL				(0x1 << 5)
> -#define PARALLEL			(0x1 << 6)
> -#define CAT_ERROR			(0x1 << 7)
> +#define GT_RESET			(0x1 << 0)
> +#define CLOSE_FD			(0x1 << 1)
> +#define CLOSE_EXEC_QUEUES	(0x1 << 2)
> +#define VIRTUAL				(0x1 << 3)
> +#define PARALLEL			(0x1 << 4)
> +#define CAT_ERROR			(0x1 << 5)
>  
>  /**
> - * SUBTEST: %s-cancel
> - * Description: Test %arg[1] cancel
> - *
> - * SUBTEST: %s-execqueue-reset
> - * Description: Test %arg[1] exec_queue reset
> - *

I don't think we want to delete either of these tests as these provide
coverage. Unfortunately without being able to change these exec queue
properties each pass of these tests will now take ~5s and .64s
respectfully. That probably doesn't work either. These values can also
be changed via sysfs though. See xe_hw_engine_class_sysfs.c in the KMD.
We can set the default for hw engine class to a new value which is easy
enough. Unfortunately if the test fails we won't restore the orignal
values which can cause future tests to fail. The i915 had some
convoluted way to avoid this, looks like this might need to be brought
back in.

I will also say it is unfortunate we are removing this uAPI as changing
these values via an IOCTL rather than a global sysfs entry does seem
like a better design.

>   * SUBTEST: %s-cat-error
>   * Description: Test %arg[1] cat error
>   *
> @@ -185,18 +177,6 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	data = xe_bo_map(fd, bo, bo_size);
>  
>  	for (i = 0; i < n_exec_queues; i++) {
> -		struct drm_xe_ext_set_property job_timeout = {
> -			.base.next_extension = 0,
> -			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> -			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT,
> -			.value = 50,
> -		};
> -		struct drm_xe_ext_set_property preempt_timeout = {
> -			.base.next_extension = 0,
> -			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> -			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
> -			.value = 1000,
> -		};
>  		struct drm_xe_exec_queue_create create = {
>  			.vm_id = vm,
>  			.width = flags & PARALLEL ? num_placements : 1,
> @@ -204,11 +184,6 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  			.instances = to_user_pointer(eci),
>  		};
>  
> -		if (flags & CANCEL)
> -			create.extensions = to_user_pointer(&job_timeout);
> -		else if (flags & EXEC_QUEUE_RESET)
> -			create.extensions = to_user_pointer(&preempt_timeout);
> -
>  		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
>  					&create), 0);
>  		exec_queues[i] = create.exec_queue_id;
> @@ -219,8 +194,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	sync[0].handle = syncobj_create(fd, 0);
>  	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>  
> -	if (flags & VIRTUAL && (flags & CAT_ERROR || flags & EXEC_QUEUE_RESET ||
> -				flags & GT_RESET))
> +	if (flags & VIRTUAL && (flags & CAT_ERROR || flags & GT_RESET))
>  		bad_batches = num_placements;
>  
>  	for (i = 0; i < n_execs; i++) {
> @@ -309,12 +283,6 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  }
>  
>  /**
> - * SUBTEST: cancel
> - * Description: Test cancel
> - *
> - * SUBTEST: execqueue-reset
> - * Description: Test exec_queue reset
> - *

Same as above for these sections.

>   * SUBTEST: cat-error
>   * Description: Test cat error
>   *
> @@ -374,26 +342,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	data = xe_bo_map(fd, bo, bo_size);
>  
>  	for (i = 0; i < n_exec_queues; i++) {
> -		struct drm_xe_ext_set_property job_timeout = {
> -			.base.next_extension = 0,
> -			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> -			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT,
> -			.value = 50,
> -		};
> -		struct drm_xe_ext_set_property preempt_timeout = {
> -			.base.next_extension = 0,
> -			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> -			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
> -			.value = 1000,
> -		};
> -		uint64_t ext = 0;
> -
> -		if (flags & CANCEL)
> -			ext = to_user_pointer(&job_timeout);
> -		else if (flags & EXEC_QUEUE_RESET)
> -			ext = to_user_pointer(&preempt_timeout);
> -
> -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>  		syncobjs[i] = syncobj_create(fd, 0);
>  	};
>  
> @@ -478,9 +427,6 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  }
>  
>  /**
> - * SUBTEST: cm-execqueue-reset
> - * Description: Test compute mode exec_queue reset
> - *

And this one too.

Matt

>   * SUBTEST: cm-cat-error
>   * Description: Test compute mode cat-error
>   *
> @@ -543,20 +489,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	memset(data, 0, bo_size);
>  
>  	for (i = 0; i < n_exec_queues; i++) {
> -		struct drm_xe_ext_set_property preempt_timeout = {
> -			.base.next_extension = 0,
> -			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> -			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
> -			.value = 1000,
> -		};
> -		uint64_t ext = 0;
> -
> -		if (flags & EXEC_QUEUE_RESET)
> -			ext = to_user_pointer(&preempt_timeout);
> -		else
> -			ext = 0;
> -
> -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>  	};
>  
>  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> @@ -803,14 +736,6 @@ igt_main
>  		xe_for_each_engine(fd, hwe)
>  			test_spin(fd, hwe);
>  
> -	igt_subtest("cancel")
> -		xe_for_each_engine(fd, hwe)
> -			test_legacy_mode(fd, hwe, 1, 1, CANCEL);
> -
> -	igt_subtest("execqueue-reset")
> -		xe_for_each_engine(fd, hwe)
> -			test_legacy_mode(fd, hwe, 2, 2, EXEC_QUEUE_RESET);
> -
>  	igt_subtest("cat-error")
>  		xe_for_each_engine(fd, hwe)
>  			test_legacy_mode(fd, hwe, 2, 2, CAT_ERROR);
> @@ -832,10 +757,6 @@ igt_main
>  			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD |
>  					 CLOSE_EXEC_QUEUES);
>  
> -	igt_subtest("cm-execqueue-reset")
> -		xe_for_each_engine(fd, hwe)
> -			test_compute_mode(fd, hwe, 2, 2, EXEC_QUEUE_RESET);
> -
>  	igt_subtest("cm-cat-error")
>  		xe_for_each_engine(fd, hwe)
>  			test_compute_mode(fd, hwe, 2, 2, CAT_ERROR);
> @@ -858,19 +779,6 @@ igt_main
>  					  CLOSE_EXEC_QUEUES);
>  
>  	for (const struct section *s = sections; s->name; s++) {
> -		igt_subtest_f("%s-cancel", s->name)
> -			xe_for_each_gt(fd, gt)
> -				xe_for_each_engine_class(class)
> -					test_balancer(fd, gt, class, 1, 1,
> -						      CANCEL | s->flags);
> -
> -		igt_subtest_f("%s-execqueue-reset", s->name)
> -			xe_for_each_gt(fd, gt)
> -				xe_for_each_engine_class(class)
> -					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
> -						      MAX_INSTANCE + 1,
> -						      EXEC_QUEUE_RESET | s->flags);
> -
>  		igt_subtest_f("%s-cat-error", s->name)
>  			xe_for_each_gt(fd, gt)
>  				xe_for_each_engine_class(class)
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 1b2623045..55907e2b3 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -518,18 +518,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  
>  	memset(sync_all, 0, sizeof(sync_all));
>  	for (i = 0; i < n_exec_queues; i++) {
> -		struct drm_xe_ext_set_property preempt_timeout = {
> -			.base.next_extension = 0,
> -			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> -			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
> -			.value = 1000,
> -		};
> -		uint64_t ext = to_user_pointer(&preempt_timeout);
> -
> -		if (flags & HANG && i == hang_exec_queue)
> -			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
> -		else
> -			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>  		if (flags & BIND_EXEC_QUEUE)
>  			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm,
>  									0);
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index fe667e64d..7c061c497 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1761,6 +1761,72 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +/**
> + * SUBTEST: bind-flag-invalid
> + * Description:
> + *	Ensure invalid bind flags are rejected.
> + * Functionality: bind
> + * Test category: negative test
> + */
> +static void bind_flag_invalid(int fd)
> +{
> +	uint32_t bo, bo_size = xe_get_default_alignment(fd);
> +	uint64_t addr = 0x1a0000;
> +	uint32_t vm;
> +	struct drm_xe_vm_bind bind;
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
> +	sync[0].handle = syncobj_create(fd, 0);
> +
> +	memset(&bind, 0, sizeof(bind));
> +	bind.vm_id = vm;
> +	bind.num_binds = 1;
> +	bind.bind.obj = bo;
> +	bind.bind.range = bo_size;
> +	bind.bind.addr = addr;
> +	bind.bind.op = DRM_XE_VM_BIND_OP_MAP;
> +	bind.num_syncs = 1;
> +	bind.syncs = (uintptr_t)sync;
> +
> +	/* Using valid flags should work */
> +	bind.bind.flags = 0;
> +	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_reset(fd, &sync[0].handle, 1);
> +
> +	bind.bind.flags = DRM_XE_VM_BIND_FLAG_NULL;
> +	bind.bind.obj = 0;
> +	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_reset(fd, &sync[0].handle, 1);
> +	bind.bind.obj = bo;
> +
> +	/* Using invalid flags should not work */
> +	bind.bind.flags = 1 << 0;
> +	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
> +
> +	bind.bind.flags = 1 << 1;
> +	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
> +
> +	bind.bind.flags = 1 << 3;
> +	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
> +
> +	/* Using valid flags should still work */
> +	bind.bind.flags = 0;
> +	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	syncobj_destroy(fd, sync[0].handle);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
> @@ -1892,6 +1958,9 @@ igt_main
>  	igt_subtest("userptr-invalid")
>  		userptr_invalid(fd);
>  
> +	igt_subtest("bind-flag-invalid")
> +		bind_flag_invalid(fd);
> +
>  	igt_subtest("shared-pte-page")
>  		xe_for_each_engine(fd, hwe)
>  			shared_pte_page(fd, hwe, 4,
> diff --git a/tests/meson.build b/tests/meson.build
> index d107d16fa..02cbc3780 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -274,7 +274,6 @@ intel_kms_progs = [
>  ]
>  
>  intel_xe_progs = [
> -	'xe_access_counter',
>  	'xe_ccs',
>  	'xe_create',
>  	'xe_compute',
> -- 
> 2.34.1
> 
