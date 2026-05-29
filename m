Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD46CD6E4A
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 14:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D27A10FFE6;
	Fri, 29 May 2026 14:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rhz1aog9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6793110FFD5;
 Fri, 29 May 2026 14:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780064339; x=1811600339;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D2q7n9tvkmXli03lLn38Xr6bpMU/5UZflOugLXjBXlQ=;
 b=Rhz1aog9LHktLoHNmlVOBcENwMR8aNqmAAHf9mpQdMvn9Hyidpy3x/Ig
 wPdTpANVPTWzVdehazQp2kcz46/IbhrMWpct754t84EcMOLAAp2CxdJzU
 XaIRuRJS4ixojMkh3axVFdxDb1NNPqxDG/BsTOfBK+1vGjE9dgsNlW/vi
 vNg/bzaVvT72tHV6mJnzpNeYK82k2oaWBuhTYtQ+eDpnpkttEdD0f/C9/
 pTDyFoc7GvgrDH67R3tmL2SQIjRXu2rKL9EkBlOg4h7n40uyP6jfFQGJt
 0TU/q9vTGpjrFCRvLSIvVQA5xFjaA1jiy5ooO1R5i86aKBt3bfBmnz0zn Q==;
X-CSE-ConnectionGUID: qBkdY4UfQQm9jdeN1qBStw==
X-CSE-MsgGUID: cxYeeYOZQzSXepp7TAvHmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80978848"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="80978848"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 07:18:59 -0700
X-CSE-ConnectionGUID: BS0Y+52WTu6invCD/S/5/g==
X-CSE-MsgGUID: FdqlFabCTFWDMVhQJDDQdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="246875095"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 07:18:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 07:18:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 07:18:58 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 07:18:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKLm9Tcf6+siNHoItIL0f5nzebujNsVBONlr0x1sfiOXZwckfyBq+sXhfG3TY1dRkzls7d2ubKqWnAT3GHg3x6e7VEjQpdNbmwvhBZSbhRKMuXD6d/joCiIhx4kPyxshFugT0svNHV3VVp6EPzkcb53AWw3S2yXgfTvlbyKzr5ypdvDD2FDdaaCv8NAALtcgtuu24uhfVu22N4BDOdMdqN3CBaHaPDaHfs3G2abk1aGlC0kCD5mZWgC+vwzgPz3sXHowTC9dAJ78d8/hl3ZSL5dZaeGmWiauaHr319mafNxa+hZ+1g2OhH1mg1Yljl4vLQZeuY7711c7r5DZJzdmIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgqyKBgqv1pxWs2HhKkdSvNqAjG86XjCLiQtXOLjmCU=;
 b=eibXLMmzQiyw7zhrzjpiiUuy7vo/mkw4gea1ak8CUcpV+iEE0mAf7M/mTjRqjr+thyejq57JbUKLdzcjJbuAnU8Zggjh/lIXiv3j1FKEEQGO7pZE2ctt5j+BSjszYilOqmS73waC21Icqt+bCcbbn6IQ5Hxefz0cPONi58em7uSqpPJUFBg//cuZeWzLtZlw2LLNwPKouyULWRPTiK4Qe2SQ2h0df+a5B769F4eq6Vc+ZasdCkKAVV2BFYYXaDnnSSO2x6Jm5eoZ+nJggpB6AvY3WAquxGYlo4f/0DWPGklpgYG7EiVoDvkRCBNpubOD9tmeY9F8lKlDzzbcFlzFtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by DSSPR11MB9667.namprd11.prod.outlook.com (2603:10b6:8:374::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 14:18:52 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653%4]) with mapi id 15.21.0071.010; Fri, 29 May 2026
 14:18:51 +0000
Date: Fri, 29 May 2026 16:18:44 +0200
From: Jan Maslak <jan.maslak@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <I915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re_fo?=
 =?utf-8?Q?r?= tests/xe_userptr_pressure: Add rebind-under-compaction test
Message-ID: <ahmgRF_SJbh8cOLF@ART-DEV-395>
References: <20260304221203.4053291-1-jan.maslak@intel.com>
 <177274044558.322779.1533130181131565588@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177274044558.322779.1533130181131565588@a3b018990fe9>
X-ClientProxiedBy: TL0P290CA0007.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::11) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|DSSPR11MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: e5639d26-e5ae-4bce-0129-08debd8d3509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|6133799003|56012099006|11063799006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info: +dOfIm4U40IhyrYqUITrikslu7QIsU7sb/Swdt/1DXtYTfsvCEsH3uDOcfmgbXdyI3Dd2cryEMpl3i+JmDZazJ6ZI3hC/AgKrL3t0rM54KOgoO26x2Y2wT+pxlV77mfzuii8/FQDTQZIR3SgkpVSQBo/m6AkqNitVaSGLcG4parwR98WGOIQSAXwtoxVlEiC5UWjNFrP69WBS+vqKckiydHpZu6W15M7ParC2iYa7BzibX2grz5ZhEWdV7+kpQmlHZk3W3Whc9+4Shdu0Ez55LNRfYTN96u1ok/UQCQYfCDcrBdp3+m5mUJryjHUl64Yj74HwTlyGhrWBp9uh6ceBKv4A4fH5c+qEsaWGYzlOHveEG4/Sp0mpL6KdNfUbPEUZTAcV1w5ubXnxv5JJvi7mxi6SV5klsyTR4txEOvL3/SYSh2aStpEYo+xejZ7RQiZzAKo7WvMs9Jpl/3SbLyuvdWldpVfRyh197ZzzO/zqCyHj8zVrD5g7jIkZpzhkq5vDK69uRxlpSi5CYmOGFG7w6Uw0TpwMLyd3O7LoluVSEcmSHd3tBMLL97B8n5GI1+RFsSyZcGLrtHGA5TjkOG1soGqR1p1SzC73eEGMfgIUu7GFAAEhN89CFc09EqJKQVVvz4BRC78yXqpTYOoL/YuIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(4143699003)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gu+iOoucDMJygGmSlyuS7ckR1c5GC4Mr5YvZ9Zpny5Wdgwcmny1aQSD+2+Sl?=
 =?us-ascii?Q?0skWbg/xdZg0+HqdfiykBVKhaDAtjvBaOk2+rcIGaMy0k/0d2s2SGlzezpaP?=
 =?us-ascii?Q?+uiEoOrNsq9vf5PB832YW25O4i2uWSwyNqzgICbvxZOY3/L/CkqGTubg9z/v?=
 =?us-ascii?Q?5HpcPDpcFYYnK8UCUtGiXmggX7ts0B40/21oWHinAWBBhIHdpq9lM5yt/Y1j?=
 =?us-ascii?Q?/LBpkzEMdSOm1UbjluXoyeO05NYlka8XGuiptz8Sfs+bTHn04d6Z3r/Mt2dw?=
 =?us-ascii?Q?sPwO1W/JBtTMZzHtHgZvXQM4sOQolbbfRGT2NyX58ZeXbpMhDwDU2Yv/TxCm?=
 =?us-ascii?Q?b7enVqOL2Bk3gGzEn4b7KXa8cEINdjCZ+1XI5GKIOPYmq4HJsGg7sU6xoYlf?=
 =?us-ascii?Q?0GXwQmqFtlFbxx3OxbHTpPgRJHK3N8LWTPQL8JmFCZA7EpOSpzEfogj0t1DQ?=
 =?us-ascii?Q?RbcSTcpuCADPAVv1/wub5dmT7utHw0GM3UdIrEK9EMzXM9DC071PmUD9BpNg?=
 =?us-ascii?Q?6y14XVCRA35DAWvOBxEvVfnEn8xLta3WbV2h7DnkiSdhwDb0ldUYzhSEVluJ?=
 =?us-ascii?Q?9VxcBzijM4gpUq/lbOL/O8G6T6D+YmtAf3Nejo89jhpoLzNnUr5O75WM2GhJ?=
 =?us-ascii?Q?TMrbQxxcsA2RX4kWXesTS0emps3nqgAlUVYrVrNU4Cehmy0UWykr8oEB85r/?=
 =?us-ascii?Q?fETvMLTPWhjgcAnB67n33MyaNupLGr4UV0MI/a8LvXn+njqDZylwWjUFkePv?=
 =?us-ascii?Q?muSRssviAOhTP5aWqK8dfTw/19OMtuFGRa3gbEXcsVeoNhziMT99q8cbPMdD?=
 =?us-ascii?Q?08I5aH8NYx5ZOZwpX7Viim/YH3uCCEf9a+dVwShz5fu9s2u0QRn9CZ7CSdrv?=
 =?us-ascii?Q?mgAHHhh28nLTOrEp3jUBfEeJohZxrG7ao6dEVv2RIIAw0sDpbVnpQkso/4iw?=
 =?us-ascii?Q?RXI26jhGqVRIsI1xNnzo/BvMlPuXr38wCfo29C15pzwQdBRFQT9e7M6o6N3A?=
 =?us-ascii?Q?+pAoh5FvBzeBE3S79r57RgB4SqZ3VwqAM9PVw4NfG7+R2b9H9tPz0X5LA8Si?=
 =?us-ascii?Q?NFppRsQ2Ka0J4WHupKYSScnxtUxtYsF32GMN38vw6qgh8GeiDmBmiRucOiQc?=
 =?us-ascii?Q?G56SO+zBbOP8gdYO2ZUDWE469KlxzxqEu/Wc9wX2zNxbv9yCDlv+wGQBlRBD?=
 =?us-ascii?Q?DlDfCheu67x1hDO+NNHrNzoyR/7ogELXQiZ8YJmLqtY31dDRlMrLxqdmfjmq?=
 =?us-ascii?Q?WE2/5SLcHKzpv4ICKwROxkXhPO4hlVcctpVIpsuJAwvJsBw6WHJnlBZiPGmM?=
 =?us-ascii?Q?JayvPVamwK8AloerfMHAtm0+uMc3n6EWxlihMtjKiUnDFPXOTmMMK5ckOLEs?=
 =?us-ascii?Q?itA8++1OQwvNx5jHcZfO2WiNCECJ9hUi41kaM89OeQ2HXvNG0z4mNuibe/vB?=
 =?us-ascii?Q?BBdBJ5AfSdBjXLiABgBFQAFkM53cZLP8f5DocGqeClNO0iqkrNTYpYmasKL0?=
 =?us-ascii?Q?owRZl94LZZvyBfG20ayxFY/ZAzNTZ/527IajgEWRXqfnGX35M0na1qgAG1q0?=
 =?us-ascii?Q?1LpC/TFWFOJvFPw80Ff3UFMTuZLAHoBf1Qqu9U23ii/PZ+gekn61l60EJUfD?=
 =?us-ascii?Q?/YrBHH43oa/tUQjt0iTaDsxXvE0kr+8K2z6EcYNHHf78NCI01vZdby0kQAsX?=
 =?us-ascii?Q?9v0o727TaDEPO6yB6/xRvNYLZcUqz0moX978Q1M5q/dg6n1WSt1iNL3OkDSQ?=
 =?us-ascii?Q?qDMWbEUgSg=3D=3D?=
X-Exchange-RoutingPolicyChecked: VS3XFbzUv4WMuKy4OHDSbmGEg6d38bQSRhIQvtV/3XqoKNIeXI/2CDRSDtrK1H8ODMdqtVkW4EN7QGed0R1GThyWrnnZAqccFRJo2Q/PwcOXu3qJiIkyVgxHj5VQE9F+J3To9jzoCc7R/xxBH1fvVZOm3yUFUKKjSBJrv1m0/y10vGbwDQ/n+gMofFF4k8nvWq3BToY2K5ruFz8Irab18iwXs/FI+R+gVvT2m+H1wt/HyJ8q72gzcnYA03q35zgXpse+B8oeOx2pQnXqu+BrQ9BbydcC2zLyT38+WbupyG3CAPGqh0cJlHMsj95T6UAMLdb7rl9cNnNKCY5G5ymsIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e5639d26-e5ae-4bce-0129-08debd8d3509
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:18:51.4425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzZxXWViIOtrgLLcdTxYHuWPcWQcEkSWD0e+0EqbT18rDT54kUZDpdjZgO2eU5BWx2ZADMCehCzt2zKh6YO8DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9667
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

On Thu, Mar 05, 2026 at 07:54:05PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_userptr_pressure: Add rebind-under-compaction test
> URL   : https://patchwork.freedesktop.org/series/162610/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8777_FULL -> XEIGTPW_14672_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14672_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14672_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14672_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
>     - shard-bmg:          NOTRUN -> [ABORT][1] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14672/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
> 
>   * igt@xe_oa@mmio-triggered-reports@oag-0:
>     - shard-bmg:          NOTRUN -> [FAIL][2] +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14672/shard-bmg-6/igt@xe_oa@mmio-triggered-reports@oag-0.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8777_FULL and XEIGTPW_14672_FULL:
> 
> ### New IGT tests (1) ###
> 
>   * igt@xe_userptr_pressure@rebind-under-compaction:
>     - Statuses : 2 pass(s)
>     - Exec time: [78.56, 107.09] s

The two regressions are unrelated to the new test being added.

Regards,
Jan
