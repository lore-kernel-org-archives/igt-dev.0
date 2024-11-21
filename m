Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED50E64002
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 18:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AD710E150;
	Thu, 21 Nov 2024 18:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZB1ZikgL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B81310E150
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 18:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732214218; x=1763750218;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=y2ONVBeBqA2TV9ArWH0ubJlVn29+JsxL6pFhz/0qdfY=;
 b=ZB1ZikgLzBa2XoOat9D6qr9V4E1c5LjGyzeARAPqdDRcBR8EP8VFeSqN
 v6QbUtSHZP2iQwBUwC30jNl3lEEpD6Sfr2TktSs2RsBz4zPGNs21R/foi
 j4sR6QeOMdx9UXkYA6Bfr1b6OK+XymxcgwjRw+eTmnEy0p1LV0WR8fM6i
 xqP396yBPUquhTkVTlLTWkIiJojwKsHBiA9V2/Ug7DX9fgXPlSmhYOKZX
 DeHTkUuM+LHsq2OP12OoBazvDQ7bKvmppMQBZDbxu/iBm7cF0hSi1H5vT
 oGqWeRUppNullq75ReYXP8XuewBPoJ2aLHUxnruDPeJbNLAI1CJLMRYaO Q==;
X-CSE-ConnectionGUID: L7O/LCwjQPedTacVkV/OVQ==
X-CSE-MsgGUID: ES4ECixcTI6ihUTx+N2XFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54855363"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="54855363"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 10:36:57 -0800
X-CSE-ConnectionGUID: vy2+Gc3bTvC+6BvdseevGA==
X-CSE-MsgGUID: NVvut487RTyZiABrhERMcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="113615051"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 10:36:57 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 10:36:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 10:36:56 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 10:36:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGm74x/f3dez1Z4N/+1qxtYoJcfKPVApqZliwC1yTn/vWQVoOmLg5usIgrIQV2YhRv0DpoNLIONtCSDoFfRrqF9QJWB2Wi7c3Pvyys0o3RyrzOBuBS8RqCwtk5A3uqdMWoyTHiL+W70rDiJzbFYUOMv3AMWJ7LWFWFPQGVgYy75VJNp7iVljTmnvNPIuLrDpW8iicTzSlVEGZ/7wiNpz8pqDCeZc0jxshPIjVoS2AH2wvN1uXvurKGBf4R5mWuMmZmXUlnOxrRbJgbbpJixBfeC+5DSWI4AIhSFawE8CtyyhccJw4BPSHePnmddAiEIqstSY3kklNgWlUCGYhJXkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8Uw3BV8MzOz6oxh7anqeugGgabNauAG2a5CH1WXuxE=;
 b=FTfeLytZ8oaJ+yjw+QduDmg2j+4P/4UqH0G0d+snZeUmSVvr6KvKHFl3teo2aBNG7cPyjPPGsAUd/R1du84i6DUt7hGnlED0VXZyfriXv4Z4o5wGvXOHzCbitqIO2GKyszN0m48iZaX/mfSVH/w/aZDh6h9rmn3E0hQnGE6G9JBew5FOtO2E2MxDEpsMruoLaKGO7SHqn1UfY0yXzuQq5EWsIyTewoh3rRFktJvK43EvYc0KQ6c8Bm5MB49ZVIURCXrmg/fik/jYladWbL0tgp2c7v8TOPc7Xm4QI7GgrLEva3qSIy5d1itPYJdNXJaVAKWeyBDgVaLjbRPJ3ex42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Thu, 21 Nov
 2024 18:36:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 18:36:46 +0000
Date: Thu, 21 Nov 2024 10:36:43 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 lib/intel_device_info: Use per-thread device info cache
Message-ID: <20241121183643.GG4891@mdroper-desk1.amr.corp.intel.com>
References: <20241120223546.145304-1-matthew.d.roper@intel.com>
 <173218967572.1116962.6647589911669818113@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173218967572.1116962.6647589911669818113@b555e5b46a47>
X-ClientProxiedBy: SJ0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa70341-d5de-486f-d4db-08dd0a5b73f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0TXUpYlXbFio57Juxu0l7tXfKTG98uF2mUkD9JstyrS6TgJm8X/cntf6gCMP?=
 =?us-ascii?Q?KX7JX58sDz1Czprl76facTZehzdkdvlseH+72AgamFKeXCeQM3GKEeVFApY5?=
 =?us-ascii?Q?c2R+y5t87AuuPqieNqQCo9iFWQjGK1aAySx5eWIbGtOl7/TXcJ7lrK/PNHxc?=
 =?us-ascii?Q?VvNfksWnhcPxL4FoV+2VeiIh8ts2s80Mtci7L/VcHoUxzf/jKrIVI7dX/x0k?=
 =?us-ascii?Q?rFhK1xMCDYABCbAZopAD3a38o+4OlEKFgM2stOutH8Jo5SUNmka9x6j3Jyax?=
 =?us-ascii?Q?K7eJ5WQJUY6/WimlHGJ55c4AMpyUoSYXJUav1Zp2fLmbpic4qeI46E6Nj5f5?=
 =?us-ascii?Q?dyhkWw8paT0Rwrt2duS40KRU+t8MnabND+QlFab1xmWcOEGRdqBzfVX70DoU?=
 =?us-ascii?Q?j7rRdhCMFkm9gjBL6bm311/O7lGqQrczHyG7TfMSX2LUWV4XrYcR8qs4u4ud?=
 =?us-ascii?Q?Oe6hZVaWl6nRzEQJsyMtMKDXio3DH2LYqeoo4eO20xYZs96Qf9sG+suRLGEX?=
 =?us-ascii?Q?Wf/T9w4ssiCkdrTiMDQqYW5BWrYRuUESog43cu9rxCQ/ZJWeIx5e7v+cL/jX?=
 =?us-ascii?Q?+f5gS0dAHwKbc+oahoPr7zaTWnAwYwPFHLaP4nmXXRYCwxfiTztP/61HsZja?=
 =?us-ascii?Q?SS6ZHy3VcKyr1ekpuAS+B/ahy/dstEQ06nf+xfQaZ9WIsZio2me8HXFntOW6?=
 =?us-ascii?Q?Cf4oOW/0aLp2FbwT1N0D6qKxjpuuwZpSZCGgoA1eFMeWVJYNoK6zPZ5HXRkN?=
 =?us-ascii?Q?yQtfJ265r0hZnOWON0CeVhV1SrMKaEJc2HlI6Svo84ocQi+m1ZUOZlZIaYa2?=
 =?us-ascii?Q?PfMeubjuqrn/SuVuVw8U0hgUKKypXw6Q2JynS/nweeovJVIzLMK2O0cLLttj?=
 =?us-ascii?Q?mym1RIn0lCE4WEXWfNR6y41L8tdb5ry/ef9N4VM7BcXfBDo5fuZoLiPIliHY?=
 =?us-ascii?Q?IE8KAVhzo+zjFtjFvPn8TxNxrP9sANcqpdZ3kK6PBnj6X18JGiyRhkq0uDRb?=
 =?us-ascii?Q?YOMndKNcyt2OQIP2IZwM9NBJ77jn17492pQBw6oeyIWmQftCffxy04cH+r14?=
 =?us-ascii?Q?4TAULY/4onCSAEe3AihfMLTcPzUZ4nG/SSHovWJlmxXXd+LRpoEDhtts/7lw?=
 =?us-ascii?Q?Wts3po8v4/PRVvZb6ILDGut3itv4Run7FlPaE2y4NI1L8u7vXEVqkyXh4P8n?=
 =?us-ascii?Q?9ggLdbrpCIvc9SdxSFHPR9n2RhqVxy7QKTAUSfAzXgNibnvU9KNKEaXD2Bv9?=
 =?us-ascii?Q?HJoTK0O7Z8OfXFTaGNqDyOfhsI9nAcK7BJ4vcv5FFA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vDWtjsFflzqHevE7FXSUPOloHW4SRMmjRpyc0xk1TRaUM2b1KW8DPAkOdckg?=
 =?us-ascii?Q?L7MW545ifjGJveHsfFouTxJQS60tfaO3wosxJNe7icakCeW8nlcKLBYwvDb+?=
 =?us-ascii?Q?bCrppsliJ+Eyc2oqvEWODlp7Z+xTxCZ+C0qzMVA0TRPG+QnIbMwhHfxX1E7P?=
 =?us-ascii?Q?+SxbQYyEsyhPUMANwDuJ1mfEeSScj64/q/EOnYF6pi0jDNqpL2ZGuq2p50Wb?=
 =?us-ascii?Q?aaF5b3hgPgrhhPT4rr5wVB4lTHNe7UPPVFcqIxVF+cfsbbXe/bqYLxB/juKX?=
 =?us-ascii?Q?5Pchs+qJWA6yxHwKOq86QG54tCRdX4dVOIwbqNVBqgNwmFFqn9ZFM40Y7MrR?=
 =?us-ascii?Q?MHzIBDImPZPdrN2qNiuTJbDTmNVx/RloVtCqiUaDFeeZvBiY+aldv4uAkm6q?=
 =?us-ascii?Q?nyLLcaqyH1I+E/Y2E9B4wrxTZsz5ONRUwY+hrXmtA9l747uDeE/kfideNrZs?=
 =?us-ascii?Q?SZnIVRqzfRr2JW2wuzlBuuMzHQP6v39J1xe+wn7mjj2bNOXZyGtZBV8/YjDM?=
 =?us-ascii?Q?2h2KphIOflAQXUyrpxBAgNpPX8w7seIi5L/ef0ywqRbnHdYnH27PfiWFVtog?=
 =?us-ascii?Q?5UNAAw5CRdoOJzG2RenNXsCmDuFOOUZtZMYavPIOXMbIiRv0eWLKS2Ly3Ljz?=
 =?us-ascii?Q?IG9tDA1VlsDHtRp1fYT85+FiRhrFdfDMqResK9PNtW4E7Aj21krxkLWyA9zW?=
 =?us-ascii?Q?760bJEH5fV2HuLRIeYv9zOEuApllUzMvk2BUoOZbg3R9YT0bu3DRzGg6cgPl?=
 =?us-ascii?Q?egsTIKO8WX5m9es1KShcfWdkjwcrLh0gAHwR33+n7cH0dyI6Aa9RJ4PPHCok?=
 =?us-ascii?Q?D9ssVQ5QPQ+3mzq1/g5vNmJVSBzBlfCuobH/ZIBOQcBnJZfgtJlfFsGMv4Tp?=
 =?us-ascii?Q?bMK9pPVe816npCHb7laaKFhh6sFRVnC1aJAabJ+I6PAruRj7nG6WSrXy0DMc?=
 =?us-ascii?Q?uDJslPXJcCUD+acPFuksfXZ3pyKVIqY9lmvf5dBfqONNp6o/nvewR4Mmuy05?=
 =?us-ascii?Q?BFdKp92Oe+GXyfuWjA/0jguhDw8b2HqdGPHZQd92iIlN+hJy6faf4YPILcC+?=
 =?us-ascii?Q?Kt+MxbBh6uCvGznQYu/UqSz3nR4zJutcRWAzpJaEKib0+IxKUGe/zSK2HDaf?=
 =?us-ascii?Q?ru1HPMIAOyBrfXWoy+xcFeYDr+hB8mMVFO77hJAXahjoGJa8tNFki5JgoN83?=
 =?us-ascii?Q?DgzdpYU2BJ8bY1sDUTARVLYsu/1kwvDmleUDa1khYi2E55UWidaPwLe6iKL3?=
 =?us-ascii?Q?zDCqi80o6EH/aWtbtWrxHPx4LwABU0XYlvOc3YVN158X9730oY+PvdDmEFdK?=
 =?us-ascii?Q?X3SqFHiriT2/o0nGpQuV5/FdiC/ZsQpmP6AuKvK+Yl6UsM2eOg8rbp646SDV?=
 =?us-ascii?Q?+A5fc4Zt2Vp2fdYFYLAxhNZ4acSJHOwHujPbyLupYlv9RsOAHLXCjMYoXSe6?=
 =?us-ascii?Q?FvWP03k1ivxrEIIJ5fPmhLyVctj1DLdCVOlYpaVWt+SjdMq5ZmMgirVRYU+7?=
 =?us-ascii?Q?nMY3DAZ26N4LzQAjnD+jrKsMt1UZyqP+6xLeMhbp8OM4tINeg1ud+4IP7cD7?=
 =?us-ascii?Q?QppQFWyCurMVUtFYUDmgoJMKtl8Z/JxISqO4swDg3R1qU9TKmm7hjY0Afbx0?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa70341-d5de-486f-d4db-08dd0a5b73f7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 18:36:46.2959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbAiRSXKV81As7hbmZ1ZXiYP7t+A6Av0OqLHZhXwp6uEDNSSOf8V1Ap3iCvcYMMl3yuVawdu7Cbmn23Rq3vKrqgBZj1oHEU6MZYIxnwZUxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
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

On Thu, Nov 21, 2024 at 11:47:55AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/intel_device_info: Use per-thread device info cache
> URL   : https://patchwork.freedesktop.org/series/141627/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8118_full -> XEIGTPW_12153_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12153_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12153_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12153_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic@plane-immutable-zpos:
>     - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +3 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_atomic@plane-immutable-zpos.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@kms_atomic@plane-immutable-zpos.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2705

> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

Unexpected incomplete.  No errors in the log to indicate what went
wrong, but doesn't seem to be anything related to device info lookup.

> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5] +3 other tests incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

Ditto

> 
>   * igt@kms_vblank@ts-continuation-modeset-hang:
>     - shard-bmg:          [PASS][6] -> [INCOMPLETE][7] +6 other tests incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_vblank@ts-continuation-modeset-hang.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@kms_vblank@ts-continuation-modeset-hang.html

Another incomplete, although it seems like there were some issues before
we got to that point:

        <3> [401.001771] xe 0000:03:00.0: [drm] *ERROR* flip_done timed out
        <3> [401.001947] xe 0000:03:00.0: [drm] *ERROR* [CRTC:134:pipe B] commit wait timed out
        <3> [411.241739] xe 0000:03:00.0: [drm] *ERROR* [CRTC:134:pipe B] flip_done timed out

Doesn't appear related to the device lookup changes in this patch.

> 
>   * igt@xe_module_load@many-reload:
>     - shard-bmg:          [PASS][8] -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_module_load@many-reload.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@xe_module_load@many-reload.html

Failure re-opening the driver after a reload.  Not related to this IGT
patch.


Applied to master.  Thanks Zbigniew for the review.


Matt


> 
>   
> #### Warnings ####
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
>     - shard-bmg:          [DMESG-WARN][10] ([Intel XE#3468]) -> [INCOMPLETE][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
>     - shard-lnl:          [FAIL][12] ([Intel XE#3499]) -> [FAIL][13] +4 other tests fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
>     - shard-bmg:          [FAIL][14] ([Intel XE#3499]) -> [FAIL][15] +1 other test fail
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12153_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_getclient:
>     - shard-dg2-set2:     [PASS][16] -> [SKIP][17] ([Intel XE#2423]) +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@core_getclient.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@core_getclient.html
> 
>   * igt@core_hotunplug@hotunbind-rebind:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][18] ([Intel XE#3468] / [Intel XE#3521])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html
> 
>   * igt@core_hotunplug@unplug-rescan:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1885])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@core_hotunplug@unplug-rescan.html
> 
>   * igt@fbdev@info:
>     - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#2134]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@fbdev@info.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@fbdev@info.html
> 
>   * igt@kms_atomic_interruptible@legacy-setmode:
>     - shard-bmg:          [PASS][22] -> [DMESG-WARN][23] ([Intel XE#1727] / [Intel XE#3468])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_atomic_interruptible@legacy-setmode.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_atomic_interruptible@legacy-setmode.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#3279])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#316])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1407])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2136]) +27 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2327]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +6 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1124]) +4 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1124]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2191]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>     - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2314] / [Intel XE#2894])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#367]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2887]) +8 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#787]) +146 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#3433]) +3 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][44] ([Intel XE#1727])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2887]) +10 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2325])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#373]) +8 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2252]) +4 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#373])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#3278])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-4/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#307])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-3/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][52] ([Intel XE#1178]) +1 other test fail
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][53] ([Intel XE#1178]) +1 other test fail
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#3304])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2320]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2321])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2321])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1424]) +2 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2291]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-dg2-set2:     [PASS][60] -> [SKIP][61] ([Intel XE#2423] / [i915#2575]) +109 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#309]) +2 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][63] -> [DMESG-WARN][64] ([Intel XE#877]) +2 other tests dmesg-warn
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][65] ([Intel XE#877])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#2291]) +6 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#2423] / [i915#2575]) +34 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][69] ([Intel XE#3184])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1508])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#2425])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1340])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#3070])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#2244]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2244])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1138])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1138])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1137])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#2316]) +6 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1421]) +3 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>     - shard-lnl:          [PASS][83] -> [FAIL][84] ([Intel XE#3149] / [Intel XE#886])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - shard-lnl:          [PASS][85] -> [FAIL][86] ([Intel XE#886]) +2 other tests fail
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#455]) +6 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1397] / [Intel XE#1745])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1397])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2380]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1401]) +2 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2293]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#651]) +4 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#651]) +8 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2311]) +13 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [FAIL][98] ([Intel XE#2333]) +4 other tests fail
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [PASS][99] -> [SKIP][100] ([Intel XE#2136]) +31 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2312]) +3 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#658]) +1 other test skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>     - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2352])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2136] / [Intel XE#2351]) +11 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#656]) +21 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#653]) +2 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2313]) +12 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1503])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-3/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-bmg:          [PASS][109] -> [DMESG-FAIL][110] ([Intel XE#3468]) +17 other tests dmesg-fail
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-bmg:          [PASS][111] -> [SKIP][112] ([Intel XE#3012])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][113] ([Intel XE#2566] / [Intel XE#3468])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [PASS][114] -> [SKIP][115] ([Intel XE#2571])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#2763]) +11 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
>     - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2763]) +9 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2763]) +5 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
>     - shard-bmg:          [PASS][120] -> [DMESG-WARN][121] ([Intel XE#2566] / [Intel XE#3468])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2446])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@kms_pm_rpm@cursor-dpms:
>     - shard-bmg:          [PASS][123] -> [INCOMPLETE][124] ([Intel XE#3468])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_pm_rpm@cursor-dpms.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@kms_pm_rpm@cursor-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1439] / [Intel XE#3141])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-1/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][126] ([Intel XE#3468]) +3 other tests dmesg-warn
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-dg2-set2:     [PASS][127] -> [SKIP][128] ([Intel XE#2446]) +3 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2-set2:     [PASS][129] -> [DMESG-WARN][130] ([Intel XE#3468]) +1 other test dmesg-warn
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#2893]) +2 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#1489]) +1 other test skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1489]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2387])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1128])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-8/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#2850] / [Intel XE#929])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@kms_psr@fbc-psr-suspend.html
> 
>   * igt@kms_psr@pr-cursor-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1406]) +3 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-1/igt@kms_psr@pr-cursor-plane-move.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#3414]) +1 other test skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#3414])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2330])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#3414]) +1 other test skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_setmode@basic@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][143] ([Intel XE#2883]) +6 other tests fail
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_setmode@basic@pipe-b-dp-4.html
> 
>   * igt@kms_vblank@query-forked:
>     - shard-bmg:          NOTRUN -> [DMESG-FAIL][144] ([Intel XE#3468]) +4 other tests dmesg-fail
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@kms_vblank@query-forked.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#1499])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@max-min@pipe-a-edp-1:
>     - shard-lnl:          [PASS][146] -> [FAIL][147] ([Intel XE#1522]) +1 other test fail
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_vrr@max-min@pipe-a-edp-1.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-3/igt@kms_vrr@max-min@pipe-a-edp-1.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#756]) +2 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-4/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#756])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][150] ([Intel XE#3468]) +25 other tests dmesg-warn
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html
> 
>   * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
>     - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2905]) +4 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
> 
>   * igt@xe_eudebug@read-metadata:
>     - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#2905]) +5 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-6/igt@xe_eudebug@read-metadata.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#688]) +5 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-6/igt@xe_evict@evict-beng-cm-threads-small.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-bmg:          NOTRUN -> [TIMEOUT][154] ([Intel XE#1473])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-large-cm:
>     - shard-bmg:          [PASS][155] -> [DMESG-WARN][156] ([Intel XE#1727])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_evict@evict-large-cm.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@xe_evict@evict-large-cm.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2322]) +5 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#1392]) +4 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@no-exec-bindexecqueue-rebind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#1130]) +64 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#288]) +3 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html
> 
>   * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
>     - shard-bmg:          [PASS][161] -> [DMESG-FAIL][162] ([Intel XE#3371])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - shard-dg2-set2:     [PASS][163] -> [SKIP][164] ([Intel XE#2229]) +1 other test skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>     - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#2229]) +1 other test skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-3/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-lnl:          [PASS][166] -> [SKIP][167] ([Intel XE#1192])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-6/igt@xe_live_ktest@xe_migrate.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-3/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#378])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@xe_module_load@force-load.html
>     - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2457])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@xe_module_load@force-load.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2248])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][171] ([Intel XE#1173])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#2284] / [Intel XE#366])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-4/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2284])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s2idle-vm-bind-unbind-all:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][174] ([Intel XE#1616] / [Intel XE#3468])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s3-basic:
>     - shard-bmg:          [PASS][175] -> [DMESG-WARN][176] ([Intel XE#3468] / [Intel XE#569]) +1 other test dmesg-warn
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_pm@s3-basic.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@xe_pm@s3-basic.html
> 
>   * igt@xe_pm_residency@cpg-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#584])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-4/igt@xe_pm_residency@cpg-basic.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#944]) +1 other test skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#3342])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-4/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
>     - shard-bmg:          [PASS][180] -> [DMESG-WARN][181] ([Intel XE#3468]) +89 other tests dmesg-warn
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
> 
>   * igt@xe_vm@large-split-binds-536870912:
>     - shard-dg2-set2:     [PASS][182] -> [SKIP][183] ([Intel XE#1130]) +168 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_vm@large-split-binds-536870912.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][184] ([Intel XE#2919])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@xe_wedged@basic-wedged.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_getversion@all-cards:
>     - shard-dg2-set2:     [FAIL][185] ([Intel XE#3440]) -> [PASS][186]
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@core_getversion@all-cards.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@core_getversion@all-cards.html
> 
>   * igt@core_hotunplug@hotreplug:
>     - shard-bmg:          [DMESG-WARN][187] ([Intel XE#3521]) -> [PASS][188]
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@core_hotunplug@hotreplug.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@core_hotunplug@hotreplug.html
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-lnl:          [ABORT][189] -> [PASS][190] +2 other tests pass
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@core_hotunplug@hotunplug-rescan.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-5/igt@core_hotunplug@hotunplug-rescan.html
> 
>   * igt@fbdev@unaligned-write:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#2134]) -> [PASS][192]
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@fbdev@unaligned-write.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@fbdev@unaligned-write.html
> 
>   * igt@kms_atomic@plane-invalid-params-fence:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#2423] / [i915#2575]) -> [PASS][194] +85 other tests pass
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_atomic@plane-invalid-params-fence.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_atomic@plane-invalid-params-fence.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-bmg:          [INCOMPLETE][195] ([Intel XE#2613]) -> [PASS][196]
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-180:
>     - shard-lnl:          [INCOMPLETE][197] ([Intel XE#3466]) -> [PASS][198] +1 other test pass
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-180.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-2/igt@kms_big_fb@linear-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-bmg:          [DMESG-WARN][199] ([Intel XE#2705]) -> [PASS][200]
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [INCOMPLETE][201] ([Intel XE#1195] / [Intel XE#3226]) -> [PASS][202]
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-dg2-set2:     [FAIL][203] ([Intel XE#1475]) -> [PASS][204]
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@default-dirtyfb-ioctl:
>     - shard-bmg:          [DMESG-WARN][205] -> [PASS][206]
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_dirtyfb@default-dirtyfb-ioctl.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_dirtyfb@default-dirtyfb-ioctl.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
>     - shard-bmg:          [DMESG-WARN][207] ([Intel XE#3468]) -> [PASS][208] +109 other tests pass
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
> 
>   * igt@kms_flip@wf_vblank-ts-check:
>     - shard-lnl:          [FAIL][209] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][210]
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@c-edp1:
>     - shard-lnl:          [FAIL][211] ([Intel XE#886]) -> [PASS][212]
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@c-edp1.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#2136]) -> [PASS][214] +23 other tests pass
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     [INCOMPLETE][215] ([Intel XE#1195] / [Intel XE#3468]) -> [PASS][216] +1 other test pass
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-valid-mode.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][218] +10 other tests pass
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][219] ([Intel XE#1503]) -> [PASS][220]
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-lnl:          [DMESG-WARN][221] ([Intel XE#3466]) -> [PASS][222] +38 other tests pass
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@kms_plane_cursor@primary.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-7/igt@kms_plane_cursor@primary.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
>     - shard-bmg:          [DMESG-WARN][223] ([Intel XE#2566]) -> [PASS][224] +1 other test pass
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-dg2-set2:     [ABORT][225] ([Intel XE#3468]) -> [PASS][226] +1 other test pass
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>     - shard-bmg:          [INCOMPLETE][227] ([Intel XE#2864]) -> [PASS][228]
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   * igt@kms_pm_rpm@universal-planes:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#2446]) -> [PASS][230] +2 other tests pass
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_pm_rpm@universal-planes.html
> 
>   * igt@kms_psr@psr2-sprite-render:
>     - shard-lnl:          [FAIL][231] ([Intel XE#3536]) -> [PASS][232] +1 other test pass
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_psr@psr2-sprite-render.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-3/igt@kms_psr@psr2-sprite-render.html
> 
>   * igt@kms_vblank@query-busy:
>     - shard-bmg:          [INCOMPLETE][233] ([Intel XE#1727]) -> [PASS][234] +3 other tests pass
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_vblank@query-busy.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@kms_vblank@query-busy.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-bmg:          [INCOMPLETE][235] -> [PASS][236] +2 other tests pass
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_vrr@negative-basic.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-4/igt@kms_vrr@negative-basic.html
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate:
>     - shard-dg2-set2:     [DMESG-WARN][237] ([Intel XE#1727]) -> [PASS][238] +1 other test pass
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
>     - shard-bmg:          [DMESG-WARN][239] ([Intel XE#1727]) -> [PASS][240] +2 other tests pass
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          [DMESG-FAIL][241] ([Intel XE#3466]) -> [PASS][242] +9 other tests pass
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
>     - shard-lnl:          [DMESG-WARN][243] ([Intel XE#3371]) -> [PASS][244]
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-4/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
>     - shard-bmg:          [DMESG-WARN][245] ([Intel XE#3467]) -> [PASS][246] +1 other test pass
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>     - shard-dg2-set2:     [TIMEOUT][247] ([Intel XE#2961] / [Intel XE#3191]) -> [PASS][248] +1 other test pass
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-bmg:          [DMESG-FAIL][249] ([Intel XE#3468]) -> [PASS][250] +17 other tests pass
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [DMESG-WARN][251] ([Intel XE#569]) -> [PASS][252]
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-bmg:          [DMESG-WARN][253] ([Intel XE#569]) -> [PASS][254] +1 other test pass
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-lnl:          [ABORT][255] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][256]
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-6/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt1:
>     - shard-bmg:          [DMESG-FAIL][257] ([Intel XE#1727]) -> [PASS][258] +1 other test pass
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt1.html
> 
>   * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
>     - shard-dg2-set2:     [SKIP][259] ([Intel XE#1130]) -> [PASS][260] +155 other tests pass
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotreplug:
>     - shard-dg2-set2:     [SKIP][261] ([Intel XE#1885]) -> [DMESG-WARN][262] ([Intel XE#3468] / [Intel XE#3521])
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@core_hotunplug@hotreplug.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@core_hotunplug@hotreplug.html
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-dg2-set2:     [SKIP][263] ([Intel XE#1885]) -> [DMESG-WARN][264] ([Intel XE#3468])
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][265] ([Intel XE#2423] / [i915#2575]) -> [SKIP][266] ([Intel XE#873])
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][267] ([Intel XE#316]) -> [SKIP][268] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][269] ([Intel XE#2136]) -> [SKIP][270] ([Intel XE#316]) +4 other tests skip
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][271] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][272] ([Intel XE#316])
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][273] ([Intel XE#316]) -> [SKIP][274] ([Intel XE#2136]) +2 other tests skip
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][275] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][276] ([Intel XE#619])
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][277] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][278] ([Intel XE#607])
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][279] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][280] ([Intel XE#1124]) +5 other tests skip
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][281] ([Intel XE#2136]) -> [SKIP][282] ([Intel XE#610])
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][283] ([Intel XE#2136]) -> [SKIP][284] ([Intel XE#1124]) +4 other tests skip
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg2-set2:     [SKIP][285] ([Intel XE#1124]) -> [SKIP][286] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][287] ([Intel XE#1124]) -> [SKIP][288] ([Intel XE#2136]) +12 other tests skip
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][289] ([Intel XE#2423] / [i915#2575]) -> [SKIP][290] ([Intel XE#2191])
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][291] ([Intel XE#2191]) -> [SKIP][292] ([Intel XE#2423] / [i915#2575])
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][293] ([Intel XE#367]) -> [SKIP][294] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][295] ([Intel XE#2423] / [i915#2575]) -> [SKIP][296] ([Intel XE#367]) +4 other tests skip
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][297] ([Intel XE#2907]) -> [SKIP][298] ([Intel XE#2136])
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][299] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][300] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][301] ([Intel XE#2136]) -> [SKIP][302] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][303] ([Intel XE#2136]) -> [SKIP][304] ([Intel XE#2907]) +1 other test skip
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][305] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][306] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][307] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][308] ([Intel XE#2136]) +9 other tests skip
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][309] ([Intel XE#3442]) -> [SKIP][310] ([Intel XE#2136])
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [FAIL][311] ([Intel XE#616]) -> [SKIP][312] ([Intel XE#2136])
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [SKIP][313] ([Intel XE#2136] / [Intel XE#2351]) -> [INCOMPLETE][314] ([Intel XE#1727])
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg2-set2:     [SKIP][315] ([Intel XE#2423] / [i915#2575]) -> [SKIP][316] ([Intel XE#306])
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2-set2:     [SKIP][317] ([Intel XE#306]) -> [SKIP][318] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>     - shard-dg2-set2:     [SKIP][319] ([Intel XE#373]) -> [SKIP][320] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     [SKIP][321] ([Intel XE#2423] / [i915#2575]) -> [SKIP][322] ([Intel XE#373]) +7 other tests skip
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     [SKIP][323] ([Intel XE#2423] / [i915#2575]) -> [FAIL][324] ([Intel XE#1178])
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_content_protection@atomic-dpms.html
>     - shard-bmg:          [FAIL][325] ([Intel XE#1178]) -> [SKIP][326] ([Intel XE#2341])
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][327] ([Intel XE#2423] / [i915#2575]) -> [SKIP][328] ([Intel XE#307]) +1 other test skip
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][329] ([Intel XE#307]) -> [SKIP][330] ([Intel XE#2423] / [i915#2575])
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2-set2:     [FAIL][331] ([Intel XE#1178]) -> [SKIP][332] ([Intel XE#2423] / [i915#2575])
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_content_protection@srm.html
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     [SKIP][333] ([Intel XE#308]) -> [SKIP][334] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][335] ([Intel XE#2423] / [i915#2575]) -> [SKIP][336] ([Intel XE#308]) +1 other test skip
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][337] ([Intel XE#2423] / [i915#2575]) -> [SKIP][338] ([Intel XE#323]) +1 other test skip
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-bmg:          [DMESG-WARN][339] ([Intel XE#877]) -> [DMESG-WARN][340] ([Intel XE#3468] / [Intel XE#877])
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][341] ([Intel XE#323]) -> [SKIP][342] ([Intel XE#2423] / [i915#2575])
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@torture-bo:
>     - shard-dg2-set2:     [SKIP][343] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][344] ([Intel XE#3184])
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_cursor_legacy@torture-bo.html
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_cursor_legacy@torture-bo.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][345] ([Intel XE#455]) -> [SKIP][346] ([Intel XE#2136] / [Intel XE#2351])
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-bmg:          [DMESG-FAIL][347] ([Intel XE#3468]) -> [FAIL][348] ([Intel XE#1695])
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [FAIL][349] ([Intel XE#2882]) -> [SKIP][350] ([Intel XE#2316])
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>     - shard-dg2-set2:     [FAIL][351] ([Intel XE#301]) -> [SKIP][352] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-bmg:          [INCOMPLETE][353] ([Intel XE#2597]) -> [SKIP][354] ([Intel XE#2316])
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [DMESG-WARN][355] ([Intel XE#3468]) -> [FAIL][356] ([Intel XE#2882])
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
>     - shard-bmg:          [DMESG-WARN][357] ([Intel XE#3468]) -> [FAIL][358] ([Intel XE#3486])
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
>     - shard-dg2-set2:     [INCOMPLETE][359] ([Intel XE#1195] / [Intel XE#1727]) -> [SKIP][360] ([Intel XE#2136])
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][361] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][362] ([Intel XE#455]) +2 other tests skip
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-dg2-set2:     [SKIP][363] ([Intel XE#455]) -> [SKIP][364] ([Intel XE#2136]) +2 other tests skip
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][365] ([Intel XE#2136]) -> [SKIP][366] ([Intel XE#455]) +2 other tests skip
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-dg2-set2:     [SKIP][367] ([i915#5274]) -> [SKIP][368] ([Intel XE#2423] / [i915#2575])
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][369] ([Intel XE#651]) -> [SKIP][370] ([Intel XE#2136]) +17 other tests skip
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][371] ([Intel XE#651]) -> [SKIP][372] ([Intel XE#2136] / [Intel XE#2351]) +17 other tests skip
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][373] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][374] ([Intel XE#651]) +8 other tests skip
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
>     - shard-bmg:          [DMESG-FAIL][375] ([Intel XE#3468]) -> [FAIL][376] ([Intel XE#2333]) +10 other tests fail
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [FAIL][377] ([Intel XE#2333]) -> [DMESG-FAIL][378] ([Intel XE#3468]) +11 other tests dmesg-fail
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-rte:
>     - shard-dg2-set2:     [INCOMPLETE][379] ([Intel XE#1195]) -> [SKIP][380] ([Intel XE#2136])
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [DMESG-FAIL][381] ([Intel XE#3468]) -> [SKIP][382] ([Intel XE#2312]) +1 other test skip
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-rte:
>     - shard-dg2-set2:     [INCOMPLETE][383] ([Intel XE#1195] / [Intel XE#3468]) -> [SKIP][384] ([Intel XE#2136])
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [FAIL][385] ([Intel XE#2333]) -> [SKIP][386] ([Intel XE#2312]) +5 other tests skip
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][387] ([Intel XE#658]) -> [SKIP][388] ([Intel XE#2136] / [Intel XE#2351])
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     [SKIP][389] ([Intel XE#2136]) -> [SKIP][390] ([Intel XE#651]) +19 other tests skip
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][391] ([Intel XE#2311]) -> [SKIP][392] ([Intel XE#2312]) +21 other tests skip
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][393] ([Intel XE#2313]) -> [SKIP][394] ([Intel XE#2312]) +20 other tests skip
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg2-set2:     [SKIP][395] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][396] ([Intel XE#653]) +9 other tests skip
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][397] ([Intel XE#2136]) -> [SKIP][398] ([Intel XE#653]) +23 other tests skip
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][399] ([Intel XE#653]) -> [SKIP][400] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][401] ([Intel XE#653]) -> [SKIP][402] ([Intel XE#2136]) +28 other tests skip
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-lnl:          [SKIP][403] ([Intel XE#3374]) -> [SKIP][404] ([Intel XE#3374] / [Intel XE#3544])
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-5/igt@kms_hdr@brightness-with-hdr.html
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-lnl-4/igt@kms_hdr@brightness-with-hdr.html
>     - shard-bmg:          [SKIP][405] ([Intel XE#3374]) -> [SKIP][406] ([Intel XE#3544])
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     [SKIP][407] ([Intel XE#2423] / [i915#2575]) -> [SKIP][408] ([Intel XE#356])
>    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-dg2-set2:     [FAIL][409] ([Intel XE#616]) -> [SKIP][410] ([Intel XE#2423] / [i915#2575])
>    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_plane_cursor@primary.html
>    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_plane_cursor@primary.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2-set2:     [SKIP][411] ([Intel XE#2423] / [i915#2575]) -> [SKIP][412] ([Intel XE#455]) +5 other tests skip
>    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html
>    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     [SKIP][413] ([Intel XE#2423] / [i915#2575]) -> [SKIP][414] ([Intel XE#2763] / [Intel XE#455])
>    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     [SKIP][415] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][416] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
>    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     [SKIP][417] ([Intel XE#870]) -> [SKIP][418] ([Intel XE#2136])
>    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_pm_backlight@fade.html
>    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     [SKIP][419] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][420] ([Intel XE#1122])
>    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][421] ([Intel XE#2136]) -> [SKIP][422] ([Intel XE#1129])
>    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
>    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-dg2-set2:     [SKIP][423] ([Intel XE#3309]) -> [SKIP][424] ([Intel XE#2136])
>    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html
>    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][425] ([Intel XE#2136]) -> [SKIP][426] ([Intel XE#908])
>    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
>    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_rpm@basic-rte:
>     - shard-dg2-set2:     [ABORT][427] ([Intel XE#3468]) -> [SKIP][428] ([Intel XE#2446])
>    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_pm_rpm@basic-rte.html
>    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_pm_rpm@basic-rte.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms:
>     - shard-dg2-set2:     [SKIP][429] ([Intel XE#2446]) -> [DMESG-WARN][430] ([Intel XE#3468])
>    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_pm_rpm@legacy-planes-dpms.html
>    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_pm_rpm@legacy-planes-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>     - shard-dg2-set2:     [SKIP][431] ([Intel XE#1489]) -> [SKIP][432] ([Intel XE#2136]) +10 other tests skip
>    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
>    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][433] ([Intel XE#2136]) -> [SKIP][434] ([Intel XE#1489]) +10 other tests skip
>    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
>    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][435] ([Intel XE#1122]) -> [SKIP][436] ([Intel XE#2136]) +1 other test skip
>    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
>    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][437] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][438] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
>    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
>    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-dg2-set2:     [SKIP][439] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][440] ([Intel XE#2136]) +11 other tests skip
>    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-blt.html
>    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr@psr-cursor-render:
>     - shard-dg2-set2:     [SKIP][441] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][442] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
>    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@psr-cursor-render.html
>    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@kms_psr@psr-cursor-render.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][443] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][444] ([Intel XE#2351])
>    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html
>    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr2-basic:
>     - shard-dg2-set2:     [SKIP][445] ([Intel XE#2136]) -> [SKIP][446] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
>    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_psr@psr2-basic.html
>    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@kms_psr@psr2-basic.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     [SKIP][447] ([Intel XE#2423] / [i915#2575]) -> [SKIP][448] ([Intel XE#3414]) +1 other test skip
>    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
>    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][449] ([Intel XE#1127]) -> [SKIP][450] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
>    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][451] ([Intel XE#3414]) -> [SKIP][452] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     [SKIP][453] ([Intel XE#455]) -> [SKIP][454] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
>    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@kms_vrr@flip-dpms.html
>    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2-set2:     [SKIP][455] ([Intel XE#2423] / [i915#2575]) -> [SKIP][456] ([Intel XE#756])
>    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html
>    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][457] ([Intel XE#756]) -> [SKIP][458] ([Intel XE#2423] / [i915#2575])
>    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-set2:     [SKIP][459] ([Intel XE#2423] / [i915#2575]) -> [SKIP][460] ([Intel XE#1091] / [Intel XE#2849])
>    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][461] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][462] ([Intel XE#1130]) +1 other test skip
>    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html
>    [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     [SKIP][463] ([Intel XE#1130]) -> [SKIP][464] ([Intel XE#1123])
>    [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
>    [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][465] ([Intel XE#1130]) -> [SKIP][466] ([Intel XE#1126])
>    [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>    [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][467] ([Intel XE#1126]) -> [SKIP][468] ([Intel XE#1130]) +1 other test skip
>    [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-dg2-set2:     [SKIP][469] ([Intel XE#1130]) -> [SKIP][470] ([Intel XE#944]) +5 other tests skip
>    [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html
>    [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_eudebug_online@basic-breakpoint:
>     - shard-dg2-set2:     [SKIP][471] ([Intel XE#2905]) -> [SKIP][472] ([Intel XE#1130]) +12 other tests skip
>    [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_eudebug_online@basic-breakpoint.html
>    [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@xe_eudebug_online@basic-breakpoint.html
> 
>   * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>     - shard-dg2-set2:     [SKIP][473] ([Intel XE#1130]) -> [SKIP][474] ([Intel XE#2905]) +9 other tests skip
>    [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
>    [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [FAIL][475] ([Intel XE#1600]) -> [SKIP][476] ([Intel XE#1130])
>    [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-dg2-set2:     [SKIP][477] ([Intel XE#1130]) -> [FAIL][478] ([Intel XE#1600])
>    [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
>    [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-bmg:          [TIMEOUT][479] ([Intel XE#1473]) -> [INCOMPLETE][480] ([Intel XE#1473])
>    [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html
>    [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-large.html
>     - shard-dg2-set2:     [TIMEOUT][481] ([Intel XE#1473]) -> [SKIP][482] ([Intel XE#1130])
>    [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
>    [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_exec_balancer@many-execqueues-virtual-rebind:
>     - shard-dg2-set2:     [DMESG-WARN][483] ([Intel XE#1727]) -> [SKIP][484] ([Intel XE#1130]) +3 other tests skip
>    [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html
>    [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@xe_exec_balancer@many-execqueues-virtual-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-dg2-set2:     [INCOMPLETE][485] ([Intel XE#1195]) -> [SKIP][486] ([Intel XE#1130])
>    [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>    [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
>     - shard-dg2-set2:     [SKIP][487] ([Intel XE#1130]) -> [SKIP][488] ([Intel XE#288]) +24 other tests skip
>    [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html
>    [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_fault_mode@once-basic-imm:
>     - shard-dg2-set2:     [SKIP][489] ([Intel XE#288]) -> [SKIP][490] ([Intel XE#1130]) +26 other tests skip
>    [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_fault_mode@once-basic-imm.html
>    [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_exec_fault_mode@once-basic-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>     - shard-dg2-set2:     [SKIP][491] ([Intel XE#2360]) -> [SKIP][492] ([Intel XE#1130])
>    [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
>    [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     [SKIP][493] ([Intel XE#1130]) -> [SKIP][494] ([Intel XE#2360]) +1 other test skip
>    [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>    [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
>     - shard-dg2-set2:     [SKIP][495] ([Intel XE#1130]) -> [DMESG-FAIL][496] ([Intel XE#3371])
>    [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
>    [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
>     - shard-dg2-set2:     [SKIP][497] ([Intel XE#1130]) -> [DMESG-WARN][498] ([Intel XE#3467])
>    [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
>    [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
>     - shard-dg2-set2:     [DMESG-WARN][499] ([Intel XE#3343]) -> [SKIP][500] ([Intel XE#1130])
>    [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
>    [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
>     - shard-bmg:          [DMESG-WARN][501] ([Intel XE#3343]) -> [DMESG-WARN][502] ([Intel XE#3343] / [Intel XE#3468])
>    [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
>    [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
>     - shard-dg2-set2:     [SKIP][503] ([Intel XE#1130]) -> [DMESG-WARN][504] ([Intel XE#3343])
>    [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>    [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
>     - shard-bmg:          [DMESG-FAIL][505] ([Intel XE#3467]) -> [DMESG-FAIL][506] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-fail
>    [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
>    [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
>     - shard-bmg:          [FAIL][507] ([Intel XE#3499]) -> [DMESG-FAIL][508] ([Intel XE#3467] / [Intel XE#3468])
>    [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
>    [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
>     - shard-bmg:          [DMESG-WARN][509] ([Intel XE#3467]) -> [DMESG-WARN][510] ([Intel XE#3467] / [Intel XE#3468])
>    [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
>    [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
>     - shard-dg2-set2:     [DMESG-WARN][511] ([Intel XE#3467]) -> [SKIP][512] ([Intel XE#1130]) +3 other tests skip
>    [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
>    [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-bmg:          [SKIP][513] ([Intel XE#2833]) -> [SKIP][514] ([Intel XE#1192])
>    [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html
>    [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][515] ([Intel XE#1130]) -> [SKIP][516] ([Intel XE#512])
>    [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_mmap@small-bar.html
>    [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-463/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     [FAIL][517] ([Intel XE#2136]) -> [FAIL][518] ([Intel XE#3546])
>    [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_module_load@reload.html
>    [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@xe_module_load@reload.html
> 
>   * igt@xe_module_load@reload-no-display:
>     - shard-dg2-set2:     [FAIL][519] ([Intel XE#2136]) -> [DMESG-WARN][520] ([Intel XE#3467])
>    [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_module_load@reload-no-display.html
>    [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@xe_module_load@reload-no-display.html
> 
>   * igt@xe_oa@map-oa-buffer:
>     - shard-dg2-set2:     [SKIP][521] ([Intel XE#1130]) -> [SKIP][522] ([Intel XE#2541]) +9 other tests skip
>    [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_oa@map-oa-buffer.html
>    [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-433/igt@xe_oa@map-oa-buffer.html
> 
>   * igt@xe_oa@syncs-ufence-wait:
>     - shard-dg2-set2:     [SKIP][523] ([Intel XE#2541]) -> [SKIP][524] ([Intel XE#1130]) +12 other tests skip
>    [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_oa@syncs-ufence-wait.html
>    [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-dg2-set2:     [SKIP][525] ([Intel XE#1061]) -> [FAIL][526] ([Intel XE#1173])
>    [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_peer2peer@read.html
>    [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@xe_peer2peer@read.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-dg2-set2:     [FAIL][527] ([Intel XE#1173]) -> [SKIP][528] ([Intel XE#1061])
>    [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_peer2peer@write.html
>    [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][529] ([Intel XE#1130]) -> [SKIP][530] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
>    [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-dg2-set2:     [SKIP][531] ([Intel XE#2284]) -> [SKIP][532] ([Intel XE#1130])
>    [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-435/igt@xe_pm@d3cold-mocs.html
>    [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-dg2-set2:     [SKIP][533] ([Intel XE#1130]) -> [DMESG-WARN][534] ([Intel XE#1727] / [Intel XE#3468])
>    [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html
>    [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-436/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-dg2-set2:     [DMESG-FAIL][535] ([Intel XE#3468]) -> [SKIP][536] ([Intel XE#1130])
>    [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][537] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][538] ([Intel XE#1130])
>    [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
>    [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-dg2-set2:     [DMESG-WARN][539] ([Intel XE#569]) -> [SKIP][540] ([Intel XE#1130])
>    [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_pm@s3-multiple-execs.html
>    [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     [SKIP][541] ([Intel XE#579]) -> [SKIP][542] ([Intel XE#1130])
>    [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
>    [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_query@multigpu-query-oa-units:
>     - shard-dg2-set2:     [SKIP][543] ([Intel XE#944]) -> [SKIP][544] ([Intel XE#1130]) +4 other tests skip
>    [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-463/igt@xe_query@multigpu-query-oa-units.html
>    [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-dg2-set2:     [SKIP][545] ([Intel XE#1130]) -> [SKIP][546] ([Intel XE#3342])
>    [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html
>    [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-dg2-set2:     [SKIP][547] ([Intel XE#3342]) -> [SKIP][548] ([Intel XE#1130])
>    [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html
>    [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   * igt@xe_tlb@basic-tlb:
>     - shard-dg2-set2:     [SKIP][549] ([Intel XE#1130]) -> [FAIL][550] ([Intel XE#2922])
>    [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-434/igt@xe_tlb@basic-tlb.html
>    [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/shard-dg2-435/igt@xe_tlb@basic-tlb.html
> 
>   
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>   [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>   [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
>   [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
>   [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
>   [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
>   [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
>   [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
>   [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
>   [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
>   [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
>   [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
>   [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
>   [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
>   [Intel XE#3521]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3521
>   [Intel XE#3536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3536
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8118 -> IGTPW_12153
>   * Linux: xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd -> xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380
> 
>   IGTPW_12153: f93e94ca39aabc9a0f6e3112f2f212e9ebfcb22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd
>   xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380: e46649e7764a9f6868ccbcba7b8b23b413303380
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12153/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
