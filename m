Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0FACD98E4
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 09:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181EC10E9BC;
	Wed, 17 Jun 2026 09:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9gZCa4F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2276610E9BC
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781689470; x=1813225470;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B3KNFgH/Mi1nHPzhZ19lzJw5pyGKvoKeE+/V90qYYQs=;
 b=j9gZCa4F1tpvYYa3SD487qre5bLqJnB3KRneSEfTaAxFLmQmTNLoYTve
 5j7j9j6L1nd4xJ4vLmY/5CIqN3ZVDYYUqQefiGD45TRe1WGnl+oXOuZhg
 MZFMGLk9lcshfCAcoiuThQoFO+pTEqQvwPyH3Ew9cPSfC/zM+L4rNUXSZ
 lwqEEui8gVIlxa0hVe/Bhwpkjns16c+Fm/UeeLoi2Wu/ydfPrqqkKLQ9a
 rIlbtWS5AQvP6tHOphoF+YjY11w6l1R0v2YvJAqriy+L0fBrT8HeeI8F2
 z5Wf/FrO6ZLsL5Jw1lCeSDFYviUKF1aPb75HQUI//AwzXhelh4+EFKCJJ w==;
X-CSE-ConnectionGUID: /IZAFc3ARoac2ewTX5cfcw==
X-CSE-MsgGUID: 9yQvpPTWQVeD7UhzjBXeMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93963439"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="93963439"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 02:44:30 -0700
X-CSE-ConnectionGUID: a9fv36SCQD6k11EJk56oxA==
X-CSE-MsgGUID: POqCK+NySqWXXlM6claLog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="248083630"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 02:44:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 02:44:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 02:44:29 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 02:44:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YroEglaG5C2LFjRdr21qkPhPK77G0lPzRNBsSXLnLzGLfrZP6l4M4csUo4ZNmsW1rbE45IFPbSiEwBccjNX/hZhR4Z2WHeJOkw9fQIzSaVr6UsKT+ARvy+rMLdG6HzmGPukQkpXyqU2FViWx0ZfBoqFPN/KtoSk6GBrmj1i8RkZ+8VjJvAVJKpbI4vHRlbNBSL9bsslLKcUtBEqMSsXVODC7cVW9cPzdqrXuONhN7Xp753Sy2C8c12yqhxdmB/E/GlJOsNiBz7tPzIffwgkoDjzJnIyc7CDJcUjXcdiA1Z9bloAXX33vnDzxPRKOrZzMJ43swDjygyQcbrzs0lGYSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mfAbOCtlfrtPd4clSJE4kXnXB/Rn7NkM10yR8c3NUM=;
 b=l+brI3jV/2BOcFCMH2Y61cEbPe0FcDM6uzhHNdNN1lCx+EXQmV1Q6sAUL6r95D3Ef9eW7v3Q6oLgfO6KOkSPd1c71lhviOX1HIbzekCCaIaEbJM27aa6dAQo9WyiPb0Qax5wYCk+SSNpL2wEZqallIv86BsaGzHyES2/2JUWrGeNM3JsAkZeROftQrFbtmKyspj0VPah9EcTaISX4okRHAPZEeOOUidMNGJmtY3leapRk1mT/HFjkQR8rESMLcnEHkZRNfDTF+MvTuiGeH3wXvwdEk5FcruR8LRHexEXoFFshgTnGcMXsINuknOatV2hflRwj4LdBrukUN6M21ULcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB6289.namprd11.prod.outlook.com (2603:10b6:208:3e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 09:44:25 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%4]) with mapi id 15.21.0113.014; Wed, 17 Jun 2026
 09:44:25 +0000
Date: Wed, 17 Jun 2026 11:44:18 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <zbigniew.kempczynski@intel.com>,
 <priyanka.dandamudi@intel.com>, <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH i-g-t v6] intel-ci: Add SVM,multi_queue tests to Xe
 fastfeedback
Message-ID: <ajJscrjPpUGHJ5mn@fdugast-desk>
References: <20260617094235.3017-1-venkateswara.rao.muppidi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260617094235.3017-1-venkateswara.rao.muppidi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::28) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB6289:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af97eaf-0a3b-45d1-7787-08decc550483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|3023799007|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: Kfddh8eTGvZ3TNS1po38jeGcB5b7Gz1OaaGhOEXrLM5RpFNjuPqJMAEUnntQ5aiMGbDr/OGHK7fxts4wL8kmHaW4KtGIEYy24b64MHm6r/8ygp8UHeeBF1Qx7f7yx+nUXvQ/PX9TQ+OEPp829ubwrLqF/eCWTKwSTYCjVV7EzmwS1jNrRCmN2TDisAS6gALwLVtJbAE7s7QoU2j8iuqN9tc9YNnsSihcDukp4QvHvMopMNF+7vzkDDdifPLz3LqbXmy4yGLjkapDpvlRUF8mMhWwN4mN57VwPoBaRGQ6RbXsGDpRR3qYZbufuRcIBvXbq4vGcXtESwNB3vedKW5KKusFZa2WXvVnTxd3zWu5pZRsIxiaBVM+b3uEfvgCzRvChogbbh6/O7VaysRBK4uIpBqSG0y2jK+NatYZde/oxrQPCnqP1RT9mJWR5IOllAeds99BSenWUYbu57da70Y/J2848i+/hY8WnCAi8B1MDKleTGfdA9pDcRsdMPUWSjRfHKRLEIUUrMruESBt3v1Ok+5JzzK7AGBG8zqo7W6ccAiCI40kAwlq/gkfq4mcxOjlNfK6avfaHylbusPIUfNwg98T7zuMVLiu72GTEjrLHaAarMdb5ids2QhLT/nZWF66uIqsmGMfLS7O1GwmNA+EKIvK+iRn5ooeb9bm0E/V8ISOiYt1F2DOjs8npEq7sA4b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3wGiffNTwELQG3iv+DD26uZvHfVCc/Kg4+9u2z6GmMR9Q7REnpKbkC3e+JVP?=
 =?us-ascii?Q?zazl7kUhse/AeXJ3r5i7X+FZ2lVC5lXyNKS89I/64MYLKfxS+nv1fhYqkKZu?=
 =?us-ascii?Q?LCUW4cH6xLRXNueUJUkJE8qByLma8ixFUm9DAZ+RQTBYSznqiOefm3n5nAV0?=
 =?us-ascii?Q?touwOUHyxOfd8bQ8a+wwg2esiVyqoCE7PeVuYbWDLX0V6topLJJBis+U1hRn?=
 =?us-ascii?Q?w4MrqY4f0Llv7no4QszYx01PZjvgxoVpbMnYZ+u8NjZ1gKdVKPkLKkNv134L?=
 =?us-ascii?Q?3Itpm1G6aq4ZRUgyVM7E8bIGG01uyF9lca6YdlssXCYbS9L5X4LwOObksm09?=
 =?us-ascii?Q?J+DRArXnjouKnpSAhRtws+pveKTe+4ozRLjGs1WxcvTT3aaKMeUHig7bpTnS?=
 =?us-ascii?Q?nXCTxJ6lU4uiscET4D737iv3ydk7GZNyGhUIACBD7htA9OCdTtRdJ40H1mK3?=
 =?us-ascii?Q?fb2EnZ+pR5eGBXVjUATXboFZS0A5Pa3JtpMbEWDU7uDRL/mw8t7QJaNDFn/N?=
 =?us-ascii?Q?rEqsIXd/qu7NluSCdgGF0aYk7V6uEFUTSmSuxjA84z6qlesIkctairIDFFof?=
 =?us-ascii?Q?fWeyz4ynIq2ST8Jz+lXMa6pa3wff2ovLh5LT8FOwV6QXrnzwrXYoziaiCxQ5?=
 =?us-ascii?Q?piDXrNgDiljoHuptpzBibJnnHwM6VDRmRM10tvvXUpZ98/dRpHKA4sjPxiN3?=
 =?us-ascii?Q?BPeMnnH9SU4hwP+7W2oI4WxKVkFl4SuAXs8S//ajUrY6Z2cmWErYWv4tt0L6?=
 =?us-ascii?Q?iQFVda/z4uYxKRzeoUcbPaQsdUCE8KpaUihvAqoUHtoiZ0tHCiQ0+NXIXmqN?=
 =?us-ascii?Q?7DnuiQCSGPpsuq6zCTl+Mtb1cw9n4CUZdtKEwkX4MsHH3MuksgzKCk3Kwlwg?=
 =?us-ascii?Q?C8VI4x9dX3rHyUh/1np4+QeZ1l5b9p9zdIQ57Z457pjOB4tfOyuz1U0dhjx6?=
 =?us-ascii?Q?NxGfPoyNJznwrDlaGOSmGpSJ5i3Akaa+fgHuQlUPERpGBrc585D67RJ9DFJV?=
 =?us-ascii?Q?BXDhiCQJ/eoEXt6raznSVW+xiJn+RBdo3uIRitmyxvYbAkgRgEY04isAaf7N?=
 =?us-ascii?Q?CUlTwjAakGBuXf6OnpkJByWuS4GBKlvKZh4adxZ7K4ZjHRDmcMSr01k0QBbX?=
 =?us-ascii?Q?yn/WnclJbN6pcSd8ZcD889tg33+k8/JbVM2gqxY/5fBo70B1XtLryMpkNnkg?=
 =?us-ascii?Q?TA5vKVzZOvEelJ/iPESSFW2faH77c+I+KeAiKa1wDuSq8QJ8/9eA+Fo6quND?=
 =?us-ascii?Q?uKmrsDQEe+Q6mMxoFNkF5NQwavYQJ58r6AoRJZdV5k3XR18KqyCOqfWJOM9Q?=
 =?us-ascii?Q?wgarxYvFBc8WQMcgAu0Nmy5kfjqQWcOzc1aJLovKY3EOFigh8I3o+111405W?=
 =?us-ascii?Q?yQ0BT3PZ454ZWwDvGEE7owaeFR+sTvvCDKHV/DfTmmwSl7dkY6+rODTSO1En?=
 =?us-ascii?Q?ryeVmxH/AtfsqzSehRoHZwfSAGhsY8vzf5YG0e3z6hS6yMTfPIsJO2m7SQN7?=
 =?us-ascii?Q?OuV71Lz5mW4IfF+TdipjHJud5LTr1KNwhjcFkR8sfb453PGBEiZTHSNtL55j?=
 =?us-ascii?Q?v67kSjVwYK2ScfKlCtXF7+GChM/maCozQX34byqdyrWmen+H9B1fK2qJH2WE?=
 =?us-ascii?Q?VsayHg6Npz+DsuHsZLqF8UoamMxoDIkE5h5UiXmLfwspakcNn0jbFWTmTk+n?=
 =?us-ascii?Q?qzL4t22wV8AvWot/q5uQ0mOFicvEpIB3ZmUN6NqBmgzaMmelFacKefPthxRi?=
 =?us-ascii?Q?tNrJdfUwgEEy74rnf/3lpJO/viMCM4Y=3D?=
X-Exchange-RoutingPolicyChecked: Ey0ck1E9RYtDpyPShLfhs9sVc3VKJX3I5vlhVreG9tkpxKZ0m6JCVyGu4PwMdzKQcahh90Ndv4HyXOJ1Bj0diVqzQ0zU0l/31fV10QcGL7teOa1Z1ZBn1pFXQTm72yf3FO5bjb+XQWeLJKVcVBbxe3vkEzBJWD4/hJ1N0Gk5EUi2KROZ8xst5mBwu3kLCuQ3zBDtF9Y3udSwV+YoPRZF782hxjyU8Ogds5SvsN2VJl2gVzXUvWQs1+PpUTSO3I9viTvDe9oaxIMeT/1V7m+kzqJdz+qwRmI8zsVnAyoQ2zsFSkyPz8Xf1qaEvwovlrbhPnCd5V3/XUAD63IxtXbJhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af97eaf-0a3b-45d1-7787-08decc550483
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 09:44:25.4573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66ae/UosiP2oKfEpCM364GlxAlEjteb87WNNiJryTjyMynaNw6QZStX9WVvYro9RuqGVARPmtOzarPFl8C7P6uoNL2NjESXCTatlIa0lJG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6289
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

On Wed, Jun 17, 2026 at 03:12:35PM +0530, Venkateswara Rao Muppidi wrote:
> Add  SVM, render copy,ccs,compute_preempt,exercise_blt,exec_mix_modes,
> access_counter, fault_mode,multi_queue tests to fastfeedback list
> 
> v2: add eu-fault-2m-range-device-host test (Francois)
> v3: corrected s-o-b and From
> v4: Refine SVM tests by removing the race test, adding remaining SVM tests,
> and organizing all entries in alphabetical order.
> v6: Remove twice.* tests and add a new set of SVM tests (Francois)
> 
> Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>

Acked-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel-ci/xe.fast-feedback.testlist | 38 ++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> index acff025fa..c3a400bf8 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> @@ -69,7 +69,11 @@ igt@kms_psr@psr-cursor-plane-move
>  igt@kms_psr@psr-sprite-plane-onoff
>  igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
>  igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
> +igt@xe_ccs@block-copy-compressed
> +igt@xe_ccs@ctrl-surf-copy
>  igt@xe_compute@compute-square
> +igt@xe_compute_preempt@compute-preempt
> +igt@xe_compute_preempt@compute-threadgroup-preempt
>  igt@xe_create@create-execqueues-noleak
>  igt@xe_create@create-execqueues-leak
>  igt@xe_create@create-invalid-mbz
> @@ -129,11 +133,43 @@ igt@xe_exec_compute_mode@twice-bindexecqueue-userptr
>  igt@xe_exec_compute_mode@twice-bindexecqueue-rebind
>  igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind
>  igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate
> +igt@xe_exec_fault_mode@invalid-va
> +igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence
> +igt@xe_exec_mix_modes@exec-simple-batch-store-lr
> +igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence
> +igt@xe_exec_mix_modes@exec-spinner-interrupted-lr
> +igt@xe_exec_multi_queue@sanity
> +igt@xe_exec_multi_queue@exec-sanity
> +igt@xe_exec_multi_queue@few-execs-dyn-priority
> +igt@xe_exec_multi_queue@many-queues-basic
> +igt@xe_exec_multi_queue@many-queues-basic-smem
> +igt@xe_exec_multi_queue@many-queues-userptr
> +igt@xe_exec_multi_queue@many-queues-userptr-invalidate
> +igt@xe_exec_multi_queue@many-queues-priority
> +igt@xe_exec_multi_queue@many-queues-close-fd
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-basic
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate
>  igt@xe_exec_queue_property@invalid-property
>  igt@xe_exec_reset@close-fd-no-exec
>  igt@xe_exec_reset@cm-close-fd-no-exec
>  igt@xe_exec_reset@virtual-close-fd-no-exec
>  igt@xe_exec_store@basic-store
> +igt@xe_exec_system_allocator@eu-fault-2m-range-device-host
> +igt@xe_exec_system_allocator@fault
> +igt@xe_exec_system_allocator@madvise-atomic-inc
> +igt@xe_exec_system_allocator@many-execqueues-free
> +igt@xe_exec_system_allocator@many-execqueues-malloc
> +igt@xe_exec_system_allocator@once-malloc
> +igt@xe_exec_system_allocator@once-mmap
> +igt@xe_exec_system_allocator@partial-munmap-cpu-fault
> +igt@xe_exec_system_allocator@process-many-malloc
> +igt@xe_exec_system_allocator@threads-many-malloc
> +igt@xe_exec_system_allocator@threads-shared-vm-many-malloc
> +igt@xe_exec_system_allocator@twice-free
> +igt@xe_exercise_blt@fast-copy
>  igt@xe_gpgpu_fill@basic
>  igt@xe_gt_freq@freq_basic_api
>  igt@xe_gt_freq@freq_fixed_idle
> @@ -176,6 +212,7 @@ igt@xe_query@query-topology
>  igt@xe_query@query-invalid-extension
>  igt@xe_query@query-invalid-query
>  igt@xe_query@query-invalid-size
> +igt@xe_render_copy@render-square
>  igt@xe_spin_batch@spin-basic
>  igt@xe_spin_batch@spin-batch
>  igt@xe_sriov_flr@flr-vf1-clear
> @@ -215,6 +252,7 @@ igt@xe_waitfence@abstime
>  igt@xe_waitfence@engine
>  igt@xe_waitfence@reltime
>  
> +
>  # All tests that do module unloading and reloading are executed last.
>  # They will sometimes reveal issues of earlier tests leaving the
>  # driver in a broken state that is not otherwise noticed in that test.
> -- 
> 2.43.0
> 
