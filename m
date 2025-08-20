Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D5CA0EE6
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 03:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C284710E24C;
	Wed, 20 Aug 2025 03:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3DNzLi5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3520610E24C
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 03:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755659872; x=1787195872;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZJ+yetUgS/+GMIEW0Wpn7SmscKLFfzoU+UWTCVjiIDo=;
 b=I3DNzLi5JJfWUsXgp+BT1AsUrZDmiXOUf/LXSFXwe4y+QCu8yZujQBz3
 LarSa6dtZczbx2SOwizIsJ1unWVJWy3Yg1611BZMyZRCYjFkqZmUgQuig
 hUPh8tgVhvYqh0sD4cDHswhIbIieTxxZHR8J8wer7kQlkOx3aq8J3+9Wa
 V4L/lXmTJg0cEKQwxL7XIFUpvwRuMo62KnNfIchE2RQHRNWin8MfhlLXC
 H8ClJrq/nqbIZstY4N5qe13nJI0VD2DyRfW57zLgeB8gsW7IU2Ei2nm9X
 xzWR2H0AOQhSjkufjCSLH5XNkewmY+vaIYwEHV5gUex+a8dlW4yKPVMhT A==;
X-CSE-ConnectionGUID: JhH4yzI0SoWt7FdLF6aq/A==
X-CSE-MsgGUID: P4ckp73gR7e3hb+j1a21uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58016774"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="58016774"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 20:17:51 -0700
X-CSE-ConnectionGUID: 3JS2KCtUTFaDwLDMe116Bw==
X-CSE-MsgGUID: nHoyEUwlRRO1jXOnxo//TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167237665"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 20:17:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 20:17:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 20:17:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.85)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 20:17:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ckqe1f916HUiS5unwjgMdK1bOlxveHj/S/kEd4DLCNC+QKTDWNnxA9Pzsl7VnbqEvEcqbEjH7WwZBz/pR18nqzramTrOKS8nOT+BOiVdVTRHw1DcQ/G6UOi6NjzPYW1MSIQLdH9xlyaTeqqTING8asOTK6wM9c1MgWbNz+vk4+YjCtg1TSimQbqOuVpq3BHXX6iN9AcizPP9pz00lb6dE81FDGUHN8SQgxNg4mwN66+SiE3Viblm+TXhlre5lKClYFsYObhT9+kkZrosIeEF43bFWg8W4wOURcBJikNtTo8KyGg1QgUGBATnuOJfpYRTXCXh1HyipHNXLeuL2e7C8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/DfXR8Esh8zE0X9iFDQFzieRt4b/gvAFVHFz+6OGxw=;
 b=GcgothiuM7sTvP+JNww3YHEPnPDaw77PF27vKmD4BHqDjIfuEs63yxR3ArqJzm0zparnXg/AV7tiDg5DNMEX8rTWgyQ9FZl1YhdBSgqW6ffAYLuAUjjUzRFp8iIGNB0QNKFNSY5NfqILn+pCZ36ZfmpkOhpddjwCPqssfH8ygDTtYHXx5bn127l5vHHl1Do7lygEak6bECoO3DLYHmuyF0Rb/CK8500t/yASJRUz0SWjc/8c5NuygBFrii+U3/Xmh48kNA70auBAwyl0MF82x7h0tbKHQt8a8lGhnpcFJSo1rTKMGHmglLdC7iX266qYWCbtK1FMwcF2ukN22A275g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPFFF98E87FA.namprd11.prod.outlook.com (2603:10b6:f:fc02::63)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.21; Wed, 20 Aug
 2025 03:17:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 03:17:36 +0000
Date: Tue, 19 Aug 2025 20:17:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <shuicheng.lin@intel.com>, Daniel Charles
 <daniel.charles@intel.com>
Subject: Re: [PATCH v2] tests/intel/xe_exec_balancer: use xe_wait_ufence to
 replace sleep action
Message-ID: <aKU+Tvm96G/telCt@lstrano-desk.jf.intel.com>
References: <20250820010454.923727-1-zongyao.bai@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250820010454.923727-1-zongyao.bai@intel.com>
X-ClientProxiedBy: BYAPR08CA0021.namprd08.prod.outlook.com
 (2603:10b6:a03:100::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPFFF98E87FA:EE_
X-MS-Office365-Filtering-Correlation-Id: e390aba6-cb3e-46a3-47fc-08dddf981cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1z8lX2GSGScu7BEz80D3Zfy5JqGb+wrQtyhYOPZ7oTMK3y5NsnJhBLv9wED/?=
 =?us-ascii?Q?gumTQPgphFp45d1kZ7//9/8sYrCLU8fgXNhh56N0Zl4ZW08BA5l0xP3Y6WXP?=
 =?us-ascii?Q?7IMITBaFaodSNbjcb/Y3ZpPUv2pnpTCszgOFbxBA2cgWu36Z7v6YEe5bPhFu?=
 =?us-ascii?Q?3esqnOHtxymwCb+ACAJRBq6MNFoyki1snhdhgtGD3TGOqmfr9/2cCFUQz30y?=
 =?us-ascii?Q?hFCYBhOoUVVdkbpUf3ShwiyJxBeOKxxNgTMIQ9XIVjqtUQ7Lr8Ne7RQvnoiN?=
 =?us-ascii?Q?6CYO7PfVvMqzG8bVjGsRmE0+OrbVEpOrXGA9ujP8KA1YfgMF+RLPxLsU0WNK?=
 =?us-ascii?Q?GYKkJ8JCoI+B1Szj2bbA2wQIc+Ae+yiVdVuZ57BSojEWo2Tj1xbinTz5Tsec?=
 =?us-ascii?Q?J9uzF7M+P78NJyqLff+GkeVyTL1Qk6NK6ZtROhEUaunkdHwRTSYcfyBR+r4y?=
 =?us-ascii?Q?cys4hPiWP1nnFXhb9Hg+6Ny9EizgOZChqwk4XOTO73zMNNUgd7Gtk+7sTm5P?=
 =?us-ascii?Q?Ctn0mGktlCP/XxUoLpJbUA8xr+teQHbccQic2CJ5dN8itgmnCigFw+gIRRRY?=
 =?us-ascii?Q?CAs1qp73/4nETMUGS4GT++cDYsKvQkpB8oekjiUSLGSItVrIio066OPVjbpU?=
 =?us-ascii?Q?ezBgn5JH4xA+wakPfQTStZinpLkIhwUus8+5eVU3m7PN7Q8bps+LMYsmr8BP?=
 =?us-ascii?Q?+jXnrhifPNpi9Yofr+oP+/vI5hBtUwNFNciy4ym18Wrbx5rVC7aWh+dbUEar?=
 =?us-ascii?Q?sFFw+drR7xQ/xMhSbHuZTI4LGXgISsGN2D23lnVTSKU7WwuOooA1Th/b1raf?=
 =?us-ascii?Q?qZ0q06Ppp2FjfezzxyJQFzBXhe+77PQpyPioePEt/dYGXaKneqBhPJRESV6s?=
 =?us-ascii?Q?2xIp31TL7S9egTW4oUnVvEQ2OVrqQIJBa3n4OdXE0A3m7nKGVJ+P7QqF35bv?=
 =?us-ascii?Q?CRTg7l6j/jWebIVgjUG6UK8+IPu4s+0oVeVYdNRySdhUbtogCSa0lM6hhcXm?=
 =?us-ascii?Q?oDgK0f6JwN6NQlNa5K+/WBET2Mr0EDTY1QCS0KUpqJbE5VwbqybhmX1fy6kC?=
 =?us-ascii?Q?jA7Lgrxw2oWkPF7veC9Mvinjfw/ED5F10xlJUsYdr05Jw3XGYj/tyeQTPjGu?=
 =?us-ascii?Q?t7mrWbLAW32U4tfSrKsF7xy87c2XEts6O0LD4jT+Xz+MPZcKv8N6kwo6q/dv?=
 =?us-ascii?Q?ppNok9jq3fU3LPVFHwtUQ0CNHjkx/yL4dBLiPvCGJp9QJKo522r8JzkJtpix?=
 =?us-ascii?Q?r8xmyaw0TAUJR0ff2fDmC53okBRhwvfKVtbG1FdkDPKozU4mg4mGHAv8Nu7j?=
 =?us-ascii?Q?IlEOz+eDLJEGxspC8dDVhYBLls8PyRbKYG4q3lbOSi9rGTUniCgGpfLkHAsS?=
 =?us-ascii?Q?MusVc1lNrsDI5bAcLXDgtaWknlc5yKHx2z9vkF6zkvm1RDP5P+fgXjt2amnS?=
 =?us-ascii?Q?JhONXhNvC4E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TVy6qiO99PeLYhgYNYWCS2yeMwcvQdVZk+EvgZ1+/X4u/BUbYtZKtF5QKpgo?=
 =?us-ascii?Q?HqA7kcdxikNuiCdinckLOZPRVBk5RRrYessj4woE7/uC5PUpaJ8cNY+/yZpg?=
 =?us-ascii?Q?5ObVS8wxW28BiVXvcS95UHJbvy3AMPtFBZKQThrUkwBsxmEfO4C1lP6WI7Rg?=
 =?us-ascii?Q?649f5hL4rqdjXZRcvne3vXJWNRhJoqSWi2/+ZGNe3icCpPJXBN23M/A1DLXs?=
 =?us-ascii?Q?EGWTFlHJZnzGApMR7ht9Qtt23At5p5plEaT0BBu1myFITETf3M4aIl3bSCVK?=
 =?us-ascii?Q?/SxPwhTDD3VOonVhSAL3gRhL6b0bz/Dpu/tJCkdupNtjVbg2yeOo6aFJI8jD?=
 =?us-ascii?Q?S4+ylvTl9oBU1zYi33LkZMGKSJPCBi5RZCHwnncOisejV0q+3mWa8GsgIAYa?=
 =?us-ascii?Q?vHwfqpZUwbAznJzC+RSRHhrTujN+0V6Au9tOdkVY41TvL3EB1qcBn6k0mO+z?=
 =?us-ascii?Q?ZRWE0TtBIxRXF2ujYLaYer+/EUYKhEONf0V8EMaRmrMDJ/5Hbn9IEjC6alLg?=
 =?us-ascii?Q?zNuDs5BScnRRkP4jLw0kJsZNao7SgHGdpDrBOnQvWKE/0w8CiWt/kjrerF8G?=
 =?us-ascii?Q?GR011nkN3SmfsTxXkACK3HPL9WwVzP2TikVoHBp1Amgb06j9kVEe36zLpj3P?=
 =?us-ascii?Q?YVN6X07nOV3AN7Ql2GFfHlxbtWlbNoMjVsNxkXsuZaXSeNrTanvgQJyE9Vtk?=
 =?us-ascii?Q?IqGnRh3ewlGcm5YJbhbRPMNIZskKuw+KXd9QwJHbu3Dhr89SQnFPnBvnKKjt?=
 =?us-ascii?Q?zti6CWRropMVtXvu7kS/8vg0vJ58akSOQ9wwoN6J+67xuCMbH48VrQWfdT5B?=
 =?us-ascii?Q?fiySd6r+vtswFX3X5f3yHAAWEBhVrIWs6v1WIQnxjMdc2nf7wFp7MhaSrrbn?=
 =?us-ascii?Q?u5JoSEH8AKW7+9uZp/UBNeX5TCaATpo5OyMkzgEyjn8P7E0f+WgbHAJRLnuR?=
 =?us-ascii?Q?VC4NCbGWAku2aGMoMevUMpoOB4lPODbjYwb0sowM8wbO+9T7KzQiBHOTyCMn?=
 =?us-ascii?Q?jacAZS0ZEghc+R1V6AimyTDGujDcXEaeePXLbCJdIY3xkQuqhUTlKQ6wBxyf?=
 =?us-ascii?Q?yJRjMzvsPJ2+pwS41DJ4yryF3ywxsfX8oix4JrIW1LLGbFBI0sEw2Nfr6HSx?=
 =?us-ascii?Q?HxGWF4lt/M2bxW6J8LZijnMdK+L2l7JNy88fYMXqxgO11LSUIr3tIgNOxaMA?=
 =?us-ascii?Q?LsZ31VT2inLmp8gBkJH7rVY3zgNEiZfzZ2UQ+XcUKhINJ8d7oIiiR/7781yO?=
 =?us-ascii?Q?iClRR/vMKPZ091r6IJwwotcAjh3gJMSHhK9KBVnsZrXyglCBB+4vcEFes/eV?=
 =?us-ascii?Q?ErDZsdwG5WukQ7Hb2d66g85q/AWhEx8DCaeXt3Ov7lou0nxGvH5fKrUcIfY1?=
 =?us-ascii?Q?H2ivLfDmAn1z9SJIKkmPtWgzzeCFJiXFF9lkVQ+8JaLvQeHRncKM/OfjChQN?=
 =?us-ascii?Q?1/mSKe1okF4CAdt0HrqXWo58DwWesQc3Z6qsPDjYdlPASuj9xFPiGsIXSsLm?=
 =?us-ascii?Q?5g+CQ8x3Gql8aFjo/q6Cujuuf5dJNS5SJHn8TkAaINQCZg5G9XDcUL/2uvZt?=
 =?us-ascii?Q?9//SJ6ajCJxNiqyYYALOyOXcLqnOMBrpjIka0TiukQ7g7HVJJkNxhQoM7toO?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e390aba6-cb3e-46a3-47fc-08dddf981cc2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 03:17:36.8660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCL2/2cnbrJnIMAG3p3rkbTDXTJcMpclpuooV95gcYA44YDZlcFDeWj1aBkjoEAHnDbkWKwAVFjWgWBGpnoRJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFFF98E87FA
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

On Wed, Aug 20, 2025 at 01:04:53AM +0000, Zongyao Bai wrote:
>     In the test_cm() function, for cases with the INVALIDATE flag,
>     use sleep 0.25 seconds to allow all tasks to complete their jobs.
>     However, this time is sometimes insufficient.
> 
>     In this patch, xe_wait_ufence (referred to as "fence" for short) actions are added
>     for the second half of n_execs tasks in INVALIDATE-RACE scenarios.
>     The changes are as follows:
>         When flags hit nothing: => No change
>              -- all n_exec tasks operate with a fence.
>         When flags include INVALIDATE but do not include RACE: => No change
>              -- the last n_exec task operates with a fence.
>         When flags include both INVALIDATE and RACE => New in this patch
>              -- n_execs/2 + 1 tasks operate with a fence.
>              -- at least the last n_exec task operates with a fence
> 
>     With the changes, all n_exec tasks operate with a fence,
>     allowing us to remove the sleep part.
> 
>     v2: xe_wait_ufence timeout change back to NSEC_PER_SEC
> 
> CC: Brost Matthew <matthew.brost@intel.com>

Cc is the preferred Linux style.

Also I sign off with 'Matthew Brost <matthew.brost@intel.com>'

Anyways:

Acked-by: Matthew Brost <matthew.brost@intel.com>


> Reviewed-by: Daniel Charles <daniel.charles@intel.com>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  tests/intel/xe_exec_balancer.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 1747e207c..27ed91d5f 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -527,15 +527,18 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  		}
>  	}
>  
> -	j = flags & INVALIDATE && n_execs ? n_execs - 1 : 0;
> +	/* Wait for all execs to complete, and the xe_wait_ufence need to be run at least once. */
> +	if (flags & INVALIDATE && n_execs) {
> +		j = flags & RACE ? (n_execs/2 + 1) : n_execs-1;
> +		if (j >= n_execs)
> +			j = n_execs - 1;
> +	} else {
> +		j = 0;
> +	}
>  	for (i = j; i < n_execs; i++)
>  		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
>  			       exec_queues[i % n_exec_queues], NSEC_PER_SEC);
>  
> -	/* Wait for all execs to complete */
> -	if (flags & INVALIDATE)
> -		usleep(250000);
> -
>  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> -- 
> 2.43.0
> 
