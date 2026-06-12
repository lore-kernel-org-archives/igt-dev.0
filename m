Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DF5CD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 13:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DE310F4A4;
	Fri, 12 Jun 2026 13:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4bcJO6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD7110EA2A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 13:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781270521; x=1812806521;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iTrCUI2VArsgsPaQo5B3Ks4QY0DvBy1y5nyhUlXFu2I=;
 b=E4bcJO6p/p+42/HcZvqC5UbgR1M8S+sAvhojP815ChdgWTdKcyiOi4I4
 i5EDk90WX/c3pPmv6H3iLspyBE+cr9wafnaRdlc/jZ8BEcTpOc8zMFs4c
 GSOVVmX7QyPQ/KnKjvcP33oUAozGNRj2+4YZ0O0BTOmlCv2xjCmTZat/w
 BP3sj2AIcgah8WA62XhOmauSuEKPsRmZtBghWcBbv9Ui2i5kIAY1n/Lxc
 /X09PBlz9Azz5kkFgHcXz/jbiyZDzKsprSE20kOi73+ylV+DtL9oUO+8X
 A85ouxsISbRTqdnGDbdeT4X51cJi0ny19f2OQlktLS7vzwd3qHQA7pKai Q==;
X-CSE-ConnectionGUID: w0fbRwRJSOWZAWp0fYlnFg==
X-CSE-MsgGUID: FtbJCsnhQIa/ISqUn99urQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81234965"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="81234965"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 06:21:59 -0700
X-CSE-ConnectionGUID: YsD+OgtHT1CfVXGLVFLa+w==
X-CSE-MsgGUID: PNYDNR1PQJu6ClNzesJPeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="284928970"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 06:21:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 06:21:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 06:21:54 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 06:21:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHdH0q8j2pFEMAD7+DmarXH7ay8z8fCkHXpmsa2I+rXYPC/IUxaF9SS8AytDOdMaBT3P/0Qmon5RDdz1hB7zX8whuZt/eGuZtwQEQPKK5gISXDbGUGNMdKKs8sgZnJ0GRUVziuiMXXAgIwVzaiDC1rDHMMNs3CbjPEzClz+tC1uNNhNwK3ii6u4rT/B/eZaWMmxc6q3HvetVQ+20r/WIs3N2MPLU5KKW4TH4CY6p/My8WtOBsX2jda5jaj0S7ZYXkLjYd5CqUU/X0pAy8gkOCoyy6Brqz5uMdUmiRDvEs4wpiNgYD4a/7pWErRQEmKCZeMFKlELa8Upf48PFAXGiTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTWI+abiQu1SY7/GVo8z9vUcvfO28PwrkW8/6C3tV9s=;
 b=rdtDmyxIa6ux5xtS0v9e8FAplBRXpRF9sWiuFtojWCPZiRZvR38hEkhq1mKUkaXPlmNRqciEdszRwpRuJIKsE+xmNVNY7XMDES+s4oZOZf3E3QsQvqbzORfS0KK4+LK9zHdEwrf+ARJmAmen+A2TgqygRLUMj8tGrSe76GJPwie146lBzqF5gIC9MoS+4/KZL9vUF7NepawOp/wZqy9yKDFQ3NQN7MTUue2h+r25B9LcGuIKDFW8BwgIFzH9W/gdd3op7347oZsuQ+k4Ahxsqu8BhsX8oL9eVI1iYg4fpZUtQfS3NWiAk47LTFYfjg9aJroA5HthgNfWRf6k7MaTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 13:21:52 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%4]) with mapi id 15.21.0092.016; Fri, 12 Jun 2026
 13:21:52 +0000
Date: Fri, 12 Jun 2026 15:21:42 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <zbigniew.kempczynski@intel.com>,
 <priyanka.dandamudi@intel.com>, <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH i-g-t] intel-ci: Add SVM, multi_queue tests to
 xe.fastfeedback.testlist.
Message-ID: <aiwH5qdwccT780lH@fdugast-desk>
References: <20260612130659.5129-1-venkateswara.rao.muppidi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260612130659.5129-1-venkateswara.rao.muppidi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:10:232::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a07a60-2947-4ed0-adeb-08dec88590cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: uxju2rUU2MlGC/pJknXQvvDRe4rJimD1ILmyAORf3fJm/reKa9zSecWKnG4PPez8BDq1T5gEacVNFa0LaaczO/LqLZi4NgR08yyGR4RitlKs65SOU5rhc8n2x3yDirLG8Qm4AS9lbTB54/Y5KpPWfFACLsFFL1L31IEbh8LWXoLh1aJ/ROTW2RKiX8Y+oX0H14zig+SerdL119ug8WI77s6htI16VmgmwDVATIhN8q676ptf3fFdaVI67QsuR/e32+x5eehPk4brsuDYxquQQsb0uJmXfKQ6Zill1xV2O4HRabkUxTlj8pmu4Gc5vdrv+n08JtW8XJdaJPAQRVYlc48abotsfTREbGbe9kaGbKRJ9tcGWzfeebsazPeM8MCmZK6ohoqSDcLiF8SXq5nRVVCK5TZ6v4PG3CgfP0Drj/uyApH0TGGk+uA8tRpeP+CmAHW0wiBPH1J3NE2ZjR726Nf44QfCtWUTyNz3EB0WmKN9i8/PkbwkxirZpOhYfgzm7DTTVOmBqDcg13/I+1iTDcz9//WyIJJufrWzSE17zIg+0q/Eh6Oi9Ciem45ONzzgoawTu8jDXuZ4vPA0qGyzZeqgw+kNnQIxoehB0z0wOaEOkkhBpFgFKvSW/NyOBanx2ASH++AVey08mEcjzmrRGg5MivRIiGfTjV5qgK6zQpehi/5Gb8ahoLmnksDTaLi+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(3023799007)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DZ6JgbDiZLmefUNmHjMmFTbL244Q7cUkarSFe+d7PrXYH5l5mE2I5N+E6GNv?=
 =?us-ascii?Q?k+/US8X4tdB6Zr2PMN1k13uQLhtbnTsHZTVaHLq8s2WMFhsZ3OeAc50kTTVp?=
 =?us-ascii?Q?MIsNe5e0zUjjEtfXNmpXZb8O7ihMvfgUVTbDsguzl6X0NslPCiTF5LqEHZxF?=
 =?us-ascii?Q?LMsMwFoHuPozB18AmMH2e+rEohfZij3zEjBTpZqdUv/KJcqhyjV/ZzCqkokA?=
 =?us-ascii?Q?SYYGr5UlJYb4VfQHK52cG4/9Ykqigpd9Fj0CD+qJep+J+zZ6hIjRC3cb8KvV?=
 =?us-ascii?Q?uIoMI/T7LPU3ub3n7t+n6VFQzyMooljE0tQpk5v4uQYaFn3z2gxgbLidpJds?=
 =?us-ascii?Q?n8gjfjckXA/2B/VMMqEvdnt4oVxS202VMSfEYcAXW9ZlDOJhH9FjiukGS3Cp?=
 =?us-ascii?Q?qiI0FJvAHs51HAN6Q55HrZvyQe83CqwpXinw7Cm0krGfQwJacdXvg8rV2BI+?=
 =?us-ascii?Q?ERxoR0vz3VwRQfbkXRIUVhGH72qIgIdFlYeDQjtjUmhDB5qUrOdocc/rK1h/?=
 =?us-ascii?Q?etiyEDGxreBYU/Q0EAfBc/wxeLxGpGe7SxfQEPHbrLHd/6VfO8x1MRESZJlN?=
 =?us-ascii?Q?iJSv5EtRFwpoFTpU6TnjeJ1TJl1iFbMv9QLYgxk323/89dzGlqng4TunHYgp?=
 =?us-ascii?Q?nfgizaoRwA/iHn58OttylYnvIh12wMCxf/W3JS9+CeRdnHpX0SSvWoCJpGcm?=
 =?us-ascii?Q?63uXyJX0QvA7lFgT3p9VVeyRtxNSuvvpkq2dqAasV2b2uH9T+ZRaS3qlLTRh?=
 =?us-ascii?Q?Si/wjivyyloUuxfC+pJwP2jjSbthdLkgM3dy9t1iCeNmbXJPcVl2+68aaLEC?=
 =?us-ascii?Q?b2L8k+O0yL/0dymoLaX+3KxlR7ksJBlhMNzf0VSBtTyVlGvYL+UcWljJ7xg/?=
 =?us-ascii?Q?/JnfISshhBIplyYuAeBaqYlOLTfTby+ofq7OwCbEU+QT43MSQHOSR0WDt3Bq?=
 =?us-ascii?Q?/fXT3mi4yMI+BxFTvvChgBbgeRrHtkcCKplc6zkRFkOlTDYHThVoMU9x3sLM?=
 =?us-ascii?Q?20oziFivzTCU7jSNvEiTvLH1aM4++6LDe16BVTSbIwRVm3OHMsTZ4gQ4cTDe?=
 =?us-ascii?Q?yD3h+OyzUHKyhZ89SM2uNjyOcD0Rda1EZL3EUM/DqeXHnIZUrURHmjgF3pnV?=
 =?us-ascii?Q?psAxL48l4gxcHmi2sTu5yhi6PAIOdlkqED3N+2cUVqYnzViJzYz+0KLV6gjw?=
 =?us-ascii?Q?yhOhHXxJUbT/fS/gjSfndINFCGLbDTjeXVvXnGCwELo9DzgKVDkj8qIMjqRM?=
 =?us-ascii?Q?hBhfaaKVTyQ7LzyJcQ2hxQwKEKpRo9X5PdAg0tm3aV15/GCAjmvSmN+S1t1I?=
 =?us-ascii?Q?9pDH4f6AqyClxhriUUusTgwCX5tVuBJ7THajLgrm1ZCeT0zyFIhCAaqOdgEf?=
 =?us-ascii?Q?qwsf02n92/2vxHWX132W+2BJZBCILylCo0c2isoLc1+dow47nawF+aNnalGc?=
 =?us-ascii?Q?gfh+SW6YK+x+iKEbuYqHqU2+wlTgx5WrBMm+EMvv4ZK6Q50XfatRM9hj/3zt?=
 =?us-ascii?Q?m2lSYAptoVRs17y7KGDCkJfK67E+axvtUcwnljQUWT0GqUe077JvO1PPIgAW?=
 =?us-ascii?Q?4RSaqxVIlgubnl8ryBeUhQ/Oyin2BNtVvztaJb5TgAMkz8PGje0TBhlPezYW?=
 =?us-ascii?Q?Vj3oyLHt3EvTmNcwkVWMdFqur7ykRm5sYZVEqgxe4rvnMezEC8k320g04PWl?=
 =?us-ascii?Q?wEr88gGhlAc68LtokMQNZE6MBzUoTDnuiBN1q25AhK8XPGT+85uq3iDD7oLr?=
 =?us-ascii?Q?c/j7KOvbRAPMgR9swJKw9fbOSGUCjcs=3D?=
X-Exchange-RoutingPolicyChecked: QkpOez3M4+3OaNhslLlSueaIotOxjyEBPNwbKnnopNpkGVNnFWlxaDAis6RblTY3ChtOwiUS/VpOPP+usd4IUK2yy99s+kJcWaSaygWSxSbmUaXQjFN2ylbhSFSio+/RYd3kDPgltOF/EtslBHZV1LWUmY4P6q5tDd6v17LQPrW4qnDvA+Wcerk3k7Oo9i4tlKodhVmsQe9C+v0M/5vNhi4yBTomXuS/1Ex0jFi9VpkvGe61eciZEotX+ljtdLsxyfmeuTrUfT0h9NN74oc8LPfsFDZ9e0TkyZtMpbTFI/QMvxSnjLIzu1dHwde/v+S1sk2QK5M8kcwIKFUh01MLgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a07a60-2947-4ed0-adeb-08dec88590cc
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 13:21:52.0629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdjSn7GNvNQqCBv6rMY/KUrIdLloc9jAI7+RKhUFBYRqeISbwSFqAAhJymHTch+XimLN2yTgJvnrBRgiaS+2P6a/PlZcieSWdsKt6c/6VRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
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

On Fri, Jun 12, 2026 at 06:36:59PM +0530, Muppidi, Venkateswara Rao wrote:
> Add SVM,render copy,ccs,compute_preempt,exercise_blt,exec_mix_modes,
> access_counter,fault_mode,multi_queue tests to xe.fastfeedback.testlist
> 
> Signed-off-by: Muppidi, Venkateswara Rao <venkateswara.rao.muppidi@intel.com>
> ---
>  tests/intel-ci/xe.fast-feedback.testlist | 36 ++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> index acff025fa..de71cacef 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> @@ -215,6 +215,42 @@ igt@xe_waitfence@abstime
>  igt@xe_waitfence@engine
>  igt@xe_waitfence@reltime
>  
> +igt@xe_exec_system_allocator@twice-free
> +igt@xe_exec_system_allocator@twice-malloc-fork-read
> +igt@xe_exec_system_allocator@twice-malloc-mlock
> +igt@xe_exec_system_allocator@twice-malloc-prefetch
> +igt@xe_exec_system_allocator@twice-mmap-new-nomemset
> +igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap-eocheck
> +igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap-eocheck
> +igt@xe_exec_system_allocator@twice-mmap-free-madvise
> +igt@xe_exec_system_allocator@twice-new-bo-map-nomemset
> +igt@xe_exec_system_allocator@many-execqueues-free

Could we include one of the eu-fault_* tests, such as
eu-fault-2m-range-device-host ?

Thanks,
Francois

> +igt@xe_render_copy@render-square
> +igt@xe_ccs@block-copy-compressed
> +igt@xe_ccs@ctrl-surf-copy
> +igt@xe_compute_preempt@compute-preempt
> +igt@xe_compute_preempt@compute-threadgroup-preempt
> +igt@xe_exercise_blt@fast-copy
> +igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence
> +igt@xe_exec_mix_modes@exec-simple-batch-store-lr
> +igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence
> +igt@xe_exec_mix_modes@exec-spinner-interrupted-lr
> +igt@xe_exec_fault_mode@invalid-va
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
> +
>  # All tests that do module unloading and reloading are executed last.
>  # They will sometimes reveal issues of earlier tests leaving the
>  # driver in a broken state that is not otherwise noticed in that test.
> -- 
> 2.43.0
> 
