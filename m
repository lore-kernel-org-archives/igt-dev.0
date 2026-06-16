Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E2DCD98CF
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 08:48:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF71710E924;
	Tue, 16 Jun 2026 08:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsU6B1k4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1F010E936
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781599703; x=1813135703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T15t50i6G2BiwWtns0mvYRQm2arN4O6qEpj26wpOdfc=;
 b=HsU6B1k4V0y0vvKWRb8z42OSORr8JJuZCSaSvPrScAtEhpfImMuMyGYJ
 w7uAE3i59xMJ2/h/KVCiIVcwyA1rtKRF3JOWIExq6HXz7TwoQL5tUkOj5
 Q3BxBs/gUc9TFACiuJC/FxXJjybI3tSxhPHds8r8BxW3UtAxj8B2yLycm
 fS1C/jeX6LOpuNamLXW0Ngwz8/aK5k4MKl7P1Tu3hQ9ABRA7GLp6WnOmZ
 3/QbK+eBXgDOe/EaLE5Fk054EJd5ux/4w1jMOjObRT3I3vJsUPCxE4o3L
 S3rpp+kU0ZPDLBu43DjQef3G5fK0VetbDjsQoPQPlUTJRT4qPflo+ivdp g==;
X-CSE-ConnectionGUID: TB8oRFypSH+QgE1d359tNg==
X-CSE-MsgGUID: 3eoe5VbGQzGg6QBSo/F9Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="69904307"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="69904307"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:48:22 -0700
X-CSE-ConnectionGUID: 2QgWkrjDR+SIe4KhrJf9Vw==
X-CSE-MsgGUID: FQHTBnNwR9q8a+2LLdQkgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="271779985"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:48:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 01:48:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 01:48:21 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 01:48:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqxH3jNWp/I5dBzj/9gPeww9NkHw6JsV6g/wfRUr6NwRwPTrU9fYvwjwrcDwoMY8Fv2IFGQIWRdBrIht9bz5BRojiTTWUcSBW0iZ/BtpcpTP7tFdjt99ygElWA9OnTuZYdeibDDrnWgbbTndBUQ7LIDvRHOh3APCEP91QfUF7wX8VaWLWVtMH2P857ceZAjf3xbTj/SC1WaQq0GlBP307vGer+29/rZHDL4q4fmI2wvwwi54/VkrF4szKFCeEaOVScoHLQghUqLK6X+DWeP4WS/GhgzsW4foInQL8j+Cuad/WybDOCgeh7zHy4WkHpvkGwFPi+6arsbiyhT15mtlAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bu92PnWp0hNksmrJAtiaHgGnfHBtj9LC7vsT11qiec=;
 b=jE9losV7UGau6N6Hiv8ELCxFmOfugkXIEmMFyRyM1JtoA5P898Nkmqo1quzR9O+dAsR85MxuGNOoze6Q83pcpjfCV4Th2lOGFtBIIeXNPsTEJYGuBtLqfCEQa5ovnCL7iS5PITCq0Rtalo0bVpgOzfNW6V1ksfrbrV9ebcTs1x0kn1iyMjG/yFa0cRpVD53ztVpfm79aZFwmTidVaSO8IXBj0A96xTh8scGO3i29VyfI4ho9HtEc71roCL8d1bMaYYLXz9GKecxZcQgoN234QZFYsW0Pn6M3v16kBBt+iVTVIo+o1bij7VzNs7UF8DPtI7ykKShP/gciEAbw+3dLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 08:48:19 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%4]) with mapi id 15.21.0113.014; Tue, 16 Jun 2026
 08:48:19 +0000
Date: Tue, 16 Jun 2026 10:48:12 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <zbigniew.kempczynski@intel.com>,
 <priyanka.dandamudi@intel.com>, <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH i-g-t v2] intel-ci: Add SVM,multi_queue tests to Xe
 fastfeedback
Message-ID: <ajENzJoBU171sQP3@fdugast-desk>
References: <20260616072331.2651-1-venkateswara.rao.muppidi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260616072331.2651-1-venkateswara.rao.muppidi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0259.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::24) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA7PR11MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b81a635-9f5c-4387-02d4-08decb84037a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|3023799007|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: QcH1RS4sx32MAEzE9No6kTBtd7LDzmQPCu4ef9v+P2tNvOj0XAib56E7monwlHp4UfFcXrThVZgZU40/LEi08V5ZlqaOVK3mIf69YdZN0mV50fJGpYcBjzi+Vrc9ehpbkFFPiOcGholnnNRUUxYxbd3zBjkTB1EKs9Ly89QvgQWaR/0GTI9s0ShpP++dt39xKEo0bDxCKR3ou3sWzkEV8U+qm0JjhDLAoNPkQ7EyLMbzrkJQHwnu4X9N0BbYMnoxt74NpUHpHia45057JfNx0j0C2Du9nm21qiPXYPC8vDYq70ym673cU30jq7iLQGnBR9ZmdjKTklBqELOzWnvujeXd4zfgLwmDsr6asYVHXvfXsZl2S23ZLjPNtyEbVWZFRr1Qd7liCWG9RErGY+CdP8g3wmszpmCTN0QZiDFtWxWBu+8688IPbEW4wwzPtbzQmSOyBAtQr6P+tZAuf3O40Czr/KpOk+pmc3e1AqhL5TZU8mkZaVHa+/KTbEp5NDZacg/unsTV+fkaJbLNHI12OB6MzCjugXknSN8Ux8tTi8G/WtT/uLORPYehtwN6XE+o2xW3ICprzC7Ta1iJABsUmypfnTcv9lUJP+VS0IgRbn7/GJBmNIrVJzJV5ShU+SllaL8fEV19cllPw0tsvUDhFu+twqpsXol0YDSP5cyKnw+Hlli5Ab6FT2Ix5mMY4bpN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(3023799007)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zZoc6agUMapvvsunp+2JvPgZWR98DPV8tHWbo2CzPJyQ7/zuZo/Um9Tt6ctO?=
 =?us-ascii?Q?NhfswOgTHqBtyTvXJoJs12hCeWLyiyp47sQneA1Ehq/MParxOCAGwZUHmw1O?=
 =?us-ascii?Q?NKT3YyPSSyM760zqZL06eclVxtc9CgTdl4r/29B1oZ1M76Zd1eBqzw3SBFn2?=
 =?us-ascii?Q?Xwn5FYPqnyHCxLTsqdyKkxza/X3Isjh+jniT1EGPFhQlPmvdzrxDSbk1rbbm?=
 =?us-ascii?Q?xyWvqjS0zATL0iX+j6bDU42gV/KiDbQWPCUEwV8j38d7GAC+QZZIn+Zf2jXE?=
 =?us-ascii?Q?LqWEtjLA3TCDxraVNtktDa3pTao+Y5dhsyDIi6WQro6qjgV9rLNN7LmDNkHK?=
 =?us-ascii?Q?ax+8SGSAA41VK8kGJawNBpBfZv+sfl/sxtsugcde3LytnTnSvp0H8VRYtAsc?=
 =?us-ascii?Q?is4P35eS3N5lExCrwg0Erb1rNUtxtV8FLiFoaQfMvDRVG3y2mw/b4gXN+3s3?=
 =?us-ascii?Q?EdEV09rGBgC7hu/5eW+0Jsd7ysu5ghWWs0bOmlo9cZhDbtXGLd+1ELkrdSck?=
 =?us-ascii?Q?OgJHudBVrCoBdbW2FlnL+AsdQqtOtH3aGm0zActXF8fdffThAFYuz7RPhugS?=
 =?us-ascii?Q?gUMi7+x8FiioGSoCiPKjkeyw196EKjIuYxNQAY95U5tSt4trvneHdUliAQu3?=
 =?us-ascii?Q?WcTYj8ZmxOcWDTqnEQj2+MM+9i9lJdGUl9WVuTrrJJpf5vgvVFJldyI8iHFX?=
 =?us-ascii?Q?YSozbuzwiTjfzpEZQjFkBFjbbEK+KhApR9x3HDjcaz+HBKPCCspjADsocuLs?=
 =?us-ascii?Q?DDm8sCUTq5w6u/c6EPuM8P9epaNXzLc3elO8ewEaGrzVmwkxSv8EKN1WmSPK?=
 =?us-ascii?Q?a6TgrqCUC/vNEOFtaOxh29SIJKBbIZZX9aX2lmOG2vzse6qUDfCY5JhvOAAZ?=
 =?us-ascii?Q?mIMhyzhxUDrqYc2XEeXeBpEAJ5EI12vbKdKrM0ax5xxIgm8p2p7AxadWBQY8?=
 =?us-ascii?Q?bgMhyP5OIqtRRz/OiDVcK0YixxGtLU2HVvm2Dn2dT/vaGVituV3+f3TVacAO?=
 =?us-ascii?Q?1amHd9g/n0ojD2QTK1wmFS6k7Q5zBiprcO7OSQMIj1FJKdti84prAAJcKQLW?=
 =?us-ascii?Q?QITeQZx4HTtdUnaeh7QiJFeTYcMywnW7byWAb8HcdXMwAjAWV0qk7HlyVUIz?=
 =?us-ascii?Q?Ro40ZKcm6dpqHWMaMLJHbZX6D1HfkPbQWb9/Vod5M/Xym1uC3Or86xy2okTH?=
 =?us-ascii?Q?lvtuQCYp8Agaa6bz9QlSITYNNpJYge9+cDmWyDLgXNdGTRxMEMzYXDu2XkBI?=
 =?us-ascii?Q?UDlRURRIqkiD+wfa3cndp0+1Pcw6+VbDApvdeVnBpysjoDF2IOE+dJKun509?=
 =?us-ascii?Q?56fHIzJr05WsfK5X9dCNR9tohsFRRbM1U3ImNIAseRfbSak/3tWLHeu3ujIA?=
 =?us-ascii?Q?pSRjsFvgEgDMP3xr6JYhEICl3qCDAE2FgiaJIRD777beN+VHWqaCVsk6Ijay?=
 =?us-ascii?Q?BmiaQu63vFE44aAMlXqH+PvkrNbGefE+Gmn9/j+3jTbbKT9OF/O/nZr3cIF9?=
 =?us-ascii?Q?KOBYzRTgHpaoSShpKf0kBuWH82rw7CtU2VJAEvB8Ul3XFoRtr+OPO3tV7ihf?=
 =?us-ascii?Q?bz2QSAoZ/sYhDyFn3z5DRcXHBYs2apMh1lSum2Y0x6GAT2Za7QfzOsgKi1N0?=
 =?us-ascii?Q?IN1SPPb0l7DJ3utsUnIyaZtZq5MsHjEiWXbeRRNma1fMtjjeyC23dXVObruT?=
 =?us-ascii?Q?rDzNhhmgjF7a4bj2yJHwc73G8DT75Nz3wP2p/yrTP7klRuQsPKE8QR8Zx9Dq?=
 =?us-ascii?Q?FPKiok7zkosGBUa5JuVp4DSwJFQdmGg=3D?=
X-Exchange-RoutingPolicyChecked: PUTKxiT107kbcHxzNMkVvHFMvw8U3IyQpfi/mwVzN8YIt/Vn3e6m25S43bYg5UXBNOGmglOKCsZSZoCe5cKHIddiMEn4ox62QUIxXbHgdyaUHgL3IiH24ywb4WlkztKrbc4EqER/PY2EnftTzyg9B61gkyjOqUTchn87gCvIq64kJjPiVTSr/ruc+UBP4Or07hI8V7TcPFbfyU3bwfD4vjFYwmv87eTZuGCjCeZMOAPk25pyzIcESRVjKRZabVeK3WnmSzOOe+QScG+OUMQy1lvY9Z4ucvLVEkX90aOS7i3plSZcVu/lPXuh1n2q7RwoBa2yhkzNT/a1j+9KD6cznQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b81a635-9f5c-4387-02d4-08decb84037a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 08:48:18.9810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnP9z2i/wsA4jlbnwX/hIfx0foePp9uGmVXmoblmwEDticO8TYdOjV4QFYMWmbCRohFA7N1cMhm2i8Zdh3WUsSfQirJGZhURX/64Enrm4Bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9594
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

On Tue, Jun 16, 2026 at 12:53:31PM +0530, Muppidi, Venkateswara Rao wrote:
> Add  SVM, render copy,ccs,compute_preempt,exercise_blt,exec_mix_modes,
> access_counter, fault_mode,multi_queue tests to fastfeedback list
> 
> V2: add eu-fault-2m-range-device-host test (Francois)
> 
> Signed-off-by: Muppidi, Venkateswara Rao <venkateswara.rao.muppidi@intel.com>

Acked-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel-ci/xe.fast-feedback.testlist | 35 ++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> index acff025fa..e3b3f21cc 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> @@ -215,6 +215,41 @@ igt@xe_waitfence@abstime
>  igt@xe_waitfence@engine
>  igt@xe_waitfence@reltime
>  
> +igt@xe_exec_system_allocator@eu-fault-2m-range-device-host
> +igt@xe_exec_system_allocator@many-execqueues-free
> +igt@xe_exec_system_allocator@many-execqueues-free-race
> +igt@xe_exec_system_allocator@once-free-race
> +igt@xe_exec_system_allocator@process-many-execqueues-free-race
> +igt@xe_exec_system_allocator@twice-free
> +igt@xe_exec_system_allocator@twice-free-race
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
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate
> +
> +
>  # All tests that do module unloading and reloading are executed last.
>  # They will sometimes reveal issues of earlier tests leaving the
>  # driver in a broken state that is not otherwise noticed in that test.
> -- 
> 2.43.0
> 
