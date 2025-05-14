Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336AEC3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 23:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EBB10E040;
	Wed, 14 May 2025 23:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkN+HomQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64D610E040
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747264204; x=1778800204;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UfGuFkesu4j+e+lcR5w7qZieX1IKqAgRpib6Ydmyygc=;
 b=NkN+HomQ3rtRlvJCQiRocxWJqmozU5OIa+sB2P2K8qbonHkwFqJUf2qc
 47HoWbhwasb6t6WbAgI3vTtbX2aA2yrmQQYevF28JOIdWg1Kr7LQq0Jm+
 1/bIrWIeKm2rE8LIDC0lH0UBCxVmX/3SP64wOpgjw2I3baUSidhQtuYbV
 N/Knr0iitfUI5E3IvQFMTN6Md+gytbWJ4STNfk/OQzgXIcleSxfoBBHaH
 GBIAJ3ASMnZndmU5FZ08mPuxeJ8EIv1JKA8T8/jkdq5tIuXx7lqUDTjSR
 yfB0C2oAPUQIiqTnAhPH3TvBCDreVnDxFrvygOFE9j/gilVX86q27zGlW w==;
X-CSE-ConnectionGUID: cb+n0XBCTkORtUm6s4MC0A==
X-CSE-MsgGUID: yGG4yLHHTey1WEgWqJa1cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59412004"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="59412004"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 16:10:03 -0700
X-CSE-ConnectionGUID: E22VGKEVT0uYelnpGbkRgg==
X-CSE-MsgGUID: qN4nOY2wTaePqbuMoehMvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="169119192"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 16:10:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 16:10:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 16:10:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 16:10:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1Z7PxoLwHn8Nm8kauzhk9E9z/95qj+tPD2Ej52VlfvWXJBpNiKcIGu26eT+AzXCFsz+CKO9gfM0kPJ0S99J6Si/Wk0F2gj2Q2q45jk98Sk0FmayEbu04vVHbcB14oAJ20oa44aJttOns+viOuAN06K7TrOqE0sA2LFVNPn2Y+6ZYeznGVK1BpZvMF6z7mcj6b1aL5qwq8c6KxK1fMHYxW66DaWFGBnce/ruBKwA92lMMOJKS8e7NpNoHaQl5qArpP786uXP8r3zOaZlsg/Jt8UXIoMk6mDGYiJF6vgTM9P9fpvewBLawrjkxow+2ee7uW5eebOgxm7VdT+njhCHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UP66ogsHNhwh7EhLWe5UJok5F861dTdVx5Bi90/kPLg=;
 b=rf5YB6BHxbUgcnB0GJ9ezENjCkQ2ireE1F4bWG2Mz0MlwTbs242PXw9Nh8AiwGsoSwjJPkkyXnu6wHQX01CHFzGMyuT11dmsf/hjaWE678KEVbYto58ToQgQre7BQzIDlahq23h8X80np4XhXI7b3oZfDONvpWwooQRwvlmulZnEdi3vzzFQWiOtdViZecl7Cb2BRECrrTUqFW6HFxD6H0yTrnUEnSeMrLXjbA3s162NlvwjV+s+xVcEI8CAia7l8q9Ani9CKBsABSfvMJ5DAgsKkrxbe8uQdNq+Q4wwZiPenNCcI4Y9f7m9N6Rso+NeGMZn/fMSZ9Sf4oAyRUhuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 23:09:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 23:09:18 +0000
Date: Wed, 14 May 2025 16:10:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 1/3] tests/intel/xe_exec_system_allocator: Test to
 validate basic SVM functionality
Message-ID: <aCUi9V1wP2hy8Ki0@lstrano-desk.jf.intel.com>
References: <20250514205801.40253-1-sai.gowtham.ch@intel.com>
 <20250514205801.40253-2-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250514205801.40253-2-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce6d913-4087-4bd5-7da5-08dd933c5a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+89Q5fGlS9bjvV5QchCQXeqJbopGRrIaSIZ0TXj7xWQVrYweko/62U43cSB7?=
 =?us-ascii?Q?zGbXWbnVfvMhQuisCYFF51ranev3FWmRV6ulAIWIFYtj42xuOxK78XxyjuP3?=
 =?us-ascii?Q?mCb0qCzGw6LivC/Eop3fXCRE8YFK2LxmnDdegR94CJbmW/zT0YLr9a0/qZVf?=
 =?us-ascii?Q?0WatzodbBu23CLKQcAm6UshbUgKvmHV/02FMHpyfe1B2lQl0oa0Yg3pGzk5B?=
 =?us-ascii?Q?la2wnAhQQ+fKp5JJjvM3bIAo95Dfbx4VImCu1mu05BhVrp3rqiaiGMbWpxlC?=
 =?us-ascii?Q?c2FfHRUVJ1lXZtGKNTT2gZPfaEzfJGeS0OHntotbbbfrbLjoPsdZBm6h1FF0?=
 =?us-ascii?Q?fdeo7tTrp4q5+aWZxM/E0P9Nr7fR1T0VUusJJ17bvC60xoxmR3Fba2hoe3fB?=
 =?us-ascii?Q?4tWlbiqZZy1x+vvoP4HvqoU6H497BkB2MzxVSOv6/zdbmlb0YR4ZVhVvHTOj?=
 =?us-ascii?Q?6ByXXZ3DlJmoFbJN0n0juncFKg1HwqXnIFiBS+GGMFnMIJMRz8qcqZeAWuUl?=
 =?us-ascii?Q?9LW/rWWs01SLP9CJMndLGGUqQKqfAb6o6KztoPVFZLwdSNAmzLSktFs7r4gz?=
 =?us-ascii?Q?VGkmQfs2WqUuWri5BWhbHF3Z5G7OuOxFDS1i+uih1d5Z8/1ZdHgbr4qjNVj0?=
 =?us-ascii?Q?eZ6qysEfjgwIoHyebHsK78rLFh151M4lVR4e4Qe26dnuGkj3v2dLVJZw5myq?=
 =?us-ascii?Q?XiiDZtHgtU+GT5f6mx6EVoYM8S4yu20cDAeRV9shFg0SXsk06abTa2h+GiAO?=
 =?us-ascii?Q?oFEhAT6Gverfirmw/BiY8zlCeLOZ4H6X20KUJ/BLlWJmwP7e+I1Lq06MV6nn?=
 =?us-ascii?Q?daiqNMr6We7MfuAQUJIQo8IrHTNp3f3JJVzI0RCDPd2UxtperBrQqxFwPadj?=
 =?us-ascii?Q?grXCiUfglVkrm8SLwl6J72/IB8k/8M0FvgBMhcsPk4HZMUKQEVYXeX8IfGee?=
 =?us-ascii?Q?Uvaox2cReH1sB/Dkgad4pNEMWA/rlqdH1CLyuwXBc9XIjz3RHD0vc7WFt/zg?=
 =?us-ascii?Q?IT4gevSzY3NRvF8sSNuT394BR9gmxJhnVFLlRmBqY46iqpMKf7nY0OZkBXoi?=
 =?us-ascii?Q?/YuIT4d4WZVO9NHNhBfh0W209tPYTv+ZNOdo0GMze4m6E5TJd98qgw72wMWc?=
 =?us-ascii?Q?w1BN7jlXy/JT+Kc6KjqDqWHmg7ypLc3soRykPv9dvC54KRMtGkLYHpraDEUv?=
 =?us-ascii?Q?IcOgiU+r6Xv6a3Xxst9o2Szlf3gw9iKBmdb4c7AyPHrycV6e1+R4P1C3RX94?=
 =?us-ascii?Q?x4vyyAbtbwsZ/+2c9TBSjr00sy0oXQiBeFZ1gEX8op08UfIfwkWuXbAIZCE3?=
 =?us-ascii?Q?g5mzCy2hGe4Il5E8QzyxQQsrxBKKfxwCdv0MWM9rD1A41+YNEW+w8TsDyTGu?=
 =?us-ascii?Q?WVYDgxNPvF1hiHAnsVrA/JTFHFSb8hF8dRvaPQ4qkWOr2ENWeCjJD9pe4Rll?=
 =?us-ascii?Q?lIuEgHNIYiQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P+MSAQ7rkKYyeJ+PmDGgCpJCrf0H5YjqAQGWbqtf7HB+OXz4iO6Tz/t162Es?=
 =?us-ascii?Q?dwp1q2UkOKdy6vVUBDBv3wBBNWfLTnwlMJEi7E94LlomCa+VMYyOITcj9glJ?=
 =?us-ascii?Q?UgAL4GvH5wCkpZwSofXPUqNNnltSXLYZC/QFVV+jIfsP8g/3RCWAVf+XnC13?=
 =?us-ascii?Q?pXnYRxatfNdSF1i2T56V1qfNfucx6TxWbr8mmCKKOiwKKgD6swXVsWX3xx/z?=
 =?us-ascii?Q?h8eOz+RF5xdKlsf0yEQonRDzBgzce1ry+TQ6iteQwhe8wcLTez0Ic6+wb6he?=
 =?us-ascii?Q?xHwq59Y+8jai1Q+c0IiSITIkvJ8WR0NILax40rz2Ri0KGkw6OiSueA5pBFvS?=
 =?us-ascii?Q?VXZEGfauvna2ok18o5e4W+7ZUIfiFqPTimA1HhTxYNoVx5qap2cBOnRLK5BL?=
 =?us-ascii?Q?HwkcAKRXFXCrtmonEzJ08KyghiiBgPJdwETuG5DLXw6zcE4U+hEZfnfAB5hp?=
 =?us-ascii?Q?D3fY3IHc99l0q9PqJFWT3zg4Kg/Z9SMC1OJjDzIjtpOnCIlo89hyti/GYISZ?=
 =?us-ascii?Q?tYgF2ft0x4qv6zKf1Izjb2gizC4pQANhs8jee/QAA27n/c2ZiscmCplpQ3An?=
 =?us-ascii?Q?KpSytBuo322iZ0w4K10N0pMqhkIj/m1PQCsj2JEjexYX12zX+IqT5wfnM4uv?=
 =?us-ascii?Q?DrOQToFWsII4B7krDGtoOhGIVFqPxN/9YEgcEkYjPGIT3pMqYpLxlH4U/hl1?=
 =?us-ascii?Q?8VKkssibM4Y/t0KwfSEfjrlyk76krL2a/0rJzdWUhGRMl+Rchb1heEII+Zbu?=
 =?us-ascii?Q?S1bu9cjgoaPVzuhAH3jk9xfpgbcTUu+nKSYO6rbgigxxwT0jZK94pmWwUJvT?=
 =?us-ascii?Q?dD1sSkqduLrrxdazg7KZK9rJAjwORnCCAhuNQd4JUKin+rqZ6+QaGAMb7a8x?=
 =?us-ascii?Q?RzWOvfioZDF0NjnKF3EvRA6yTRv/KC9pvVuYU6jj/2/kPZnyZHVqL4fulLaq?=
 =?us-ascii?Q?LdeftrX8iZXg0eHCj67FCnonIueWEsbTAo4ymuduQrjpl2fNitnHCU4y1fgh?=
 =?us-ascii?Q?hPvNUDtrJef4wVcRAQVpoKgWhyVyEOF3JSH/hvr3Zic08KKmvoPS/4xsBGiv?=
 =?us-ascii?Q?Qr7n2iXp+6TNIaalfle3GaYXEKQPwDWRXrA3JHIwS0F3i8YL9YcHj+Vw7rbu?=
 =?us-ascii?Q?5smKigCY5C7R/HesofUVXNL1pL5UEhT0s2Tz+MMUyKnheC6e0/+SuzsW1Vfz?=
 =?us-ascii?Q?1rYd+7OYktlekBJFu/6YZ2Tt0aKgqN4epj7RGzlJ4l9eHGpykp4pxvR/VkF2?=
 =?us-ascii?Q?QhBPjWS9sPMfdMLeIpq5nShfOsBVFR9SJBPeTvJst2RQ4Ui3y+9Q+v0YUtPG?=
 =?us-ascii?Q?PeQkJjmYPI8cDVi7QZe17huQ+eX0Trz9SXoLGA07PB6H1aC3X6wilOtq5VaK?=
 =?us-ascii?Q?f1WaphpqXRb3QhPl21hLxMa9pcwQ+A09B8S7X7V+zmuUoMHW1BlqCtU4bkf4?=
 =?us-ascii?Q?e8VwlcxMJ8jfEyB3X3d8sU1M7J7+edudE2FEuBz04kFsrS74nNFlIMa0VDWs?=
 =?us-ascii?Q?oGFZple58Rc7dZhu8VKzFh4Xm+xsufLj9YClAs+jCLvFoom7DTK/OPyoIloc?=
 =?us-ascii?Q?U63zjl0fcLKHzW82xOqS/oINdLGuptoP+VyteUG+cEScYLQAIjTjaniYge23?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce6d913-4087-4bd5-7da5-08dd933c5a85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 23:09:18.4442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cV2kLUWugAMmNCOMxP2NH/VnHdkbU47p+rF+fPdtpyECLSii6z1HoN1FVHwRcoOVaN2y0dXGRoFzOUP3lMfufw==
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

On Wed, May 14, 2025 at 08:57:59PM +0000, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Basic test validates basic SVM functionality.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

See my replies to rev1, to be clear I'm nacking all of this series.
Please see my comments in rev1.

Matt

> ---
>  tests/intel/xe_exec_system_allocator.c | 63 ++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 06daac8c2..68bf29898 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -32,6 +32,8 @@
>  struct batch_data {
>  	uint32_t batch[16];
>  	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
>  	uint32_t data;
>  	uint32_t expected_data;
>  };
> @@ -405,6 +407,63 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
>  		       aligned_alloc_type->__size - aligned_alloc_type->size - begin_size);
>  }
>  
> +/**
> + * SUBTEST: basic-svm
> + * Description: Test validates basic svm.
> + * Test category: functionality test
> + */
> +static void test_basic(int fd, struct drm_xe_engine_class_instance *eci,
> +		       size_t bo_size, int num_dwords)
> +{
> +	uint64_t addr;
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	struct batch_data *data;
> +	uint32_t exec_queues, vm;
> +	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	data = aligned_alloc(aligned_size, bo_size);
> +	igt_assert(data != NULL);
> +	memset(data, 0, bo_size);
> +
> +	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
> +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	bind_system_allocator(sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +	data[0].vm_sync = 0;
> +
> +	addr = to_user_pointer(data);
> +	for (int i = 0; i <= num_dwords; i++) {
> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr = addr + batch_offset;
> +		uint64_t sdi_offset = (char *)&(data[i].data) - (char *)data;
> +		uint64_t sdi_addr = addr + sdi_offset;
> +		int b = 0;
> +
> +		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i), &b);
> +		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +
> +		exec.exec_queue_id = exec_queues;
> +		exec.address = batch_addr;
> +		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> +		xe_exec(fd, &exec);
> +		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, exec_queues, NSEC_PER_SEC);
> +		data[i].exec_sync = 0;
> +		igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
> +	}
> +	unbind_system_allocator();
> +	free(data);
> +	xe_exec_queue_destroy(fd, exec_queues);
> +	xe_vm_destroy(fd, vm);
> +}
>  /**
>   * SUBTEST: unaligned-alloc
>   * Description: allocate unaligned sizes of memory
> @@ -1700,6 +1759,10 @@ igt_main
>  		open_sync_file();
>  	}
>  
> +	igt_subtest("basic-svm")
> +		xe_for_each_engine(fd, hwe)
> +			test_basic(fd, hwe, SZ_64K, 1);
> +
>  	for (const struct section *s = sections; s->name; s++) {
>  		igt_subtest_f("once-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
> -- 
> 2.34.1
> 
