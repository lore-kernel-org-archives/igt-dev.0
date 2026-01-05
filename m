Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54622C79FA7
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 16:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0081B10E2C9;
	Mon,  5 Jan 2026 16:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pm6wgK4X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C68410E2C9
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767632343; x=1799168343;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mr8vFGJ9sJL7IprIDIgmKvszlzT2kMBFvdzn9h5bnN8=;
 b=Pm6wgK4Xf0/MOnR4cUPUMyMiFLRmFfDP67zYtUNzdelxKuRqfC/w0HOz
 cOi1p/4n1JRVPFgOm+s5jLWKzc3RYMBy7FQWOWcokNKVxmdbnBgo2lmCK
 nFjf4R4I2Aol+97F/du9JudRdcgnX6i0rcs+JIm2Qyu99oi7xg68Qk2TO
 QbnjqWnEwUJINfSEtljzPtHEtrLv8I6Cxa07dBr4LnEcFl3Y+O6ioDzE/
 gEsVRBpbEVYKLkvjjon8k7B2YbmjfkiUX/oRgzcbf0+anIAv5qo7r1RRp
 mQid59N/PRfxgSJtPWE5bUjWTDSAN3yc4xnZLqipLmY63lxGbq8MTWWW3 A==;
X-CSE-ConnectionGUID: o0umdwg4T4u6bsJnV3iCMQ==
X-CSE-MsgGUID: St+EOdYxQe+pvCVLXRAIwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="72626863"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="72626863"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:59:02 -0800
X-CSE-ConnectionGUID: h5jzFXOXTaqzWamHQaSJHg==
X-CSE-MsgGUID: A1qca+76Sn+PrZNbUb1moA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="202675642"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:59:01 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 08:59:01 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 08:59:01 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.51)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 08:59:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSdy98quhOx015bnWcUtgeuYSMzzP7nboZXd8APgQ72OOPUoFDaaM5s430CCbczK6nlfAsa+Z5J/D56LkEZulkPTe2EFm5nbuZxu/ApcMxaQRVrCWZQgfDVdHXGveIbnh7o19I8YJzaUFdQEXxpA2P0CpQIyGfwIlEDdYS/TYXqgnU8TEQNLl7vriBRsWs+Emfsj7SaXruvkSBxZirDo2LKCbaoriVYQkxr53O2YTlqynLpjaujuK5AAtzXize7Oam/AqFq4lX2bEQ/lXFrFwz/of1/vBQbc0ym302btBrEBrB6VJOCOOMeZYUT1SyXGSwfT2NvuK08I7eWB3EFHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVCAXu1WIobkrH04DbQZokjW2Y4yZn04eVj8+T44uDM=;
 b=KpJd02AA4DPtQkGF5W+BjqCF3VI4d7LcaadzXUYUkm5QCzkJkFDT2PWsebTev2WFi/vvzVy3AdOO0i1J6EAP8HRTjwzRNI2UwRAmKhI3VKCmvekN4YVw2Tj4nKZjRoOj2jWvfR2vaaSuCImYviIBIq/FLtTchgE+6VLL8yrojkjWdUfE+nKBzs3LhCrJ73lFZY75v4+o3Y3AAIktiQXKNhH8e2E4MpOLuemr4EI37NSiYw3h0NsI0AoSgxY3M56ZAaNflCPMIlNRHNGr7XWV19Qya+N/ul++Rg2x8P85rc5Md/BKct2lG+o5BCoGN5XBhzpzYBTYs97hUJefEbucVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM3PPFCA3BFC2BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:58:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 16:58:55 +0000
Date: Mon, 5 Jan 2026 08:58:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Xin Wang <x.wang@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw6IHN1Y2Nl?= =?utf-8?Q?ss?= for
 tests/intel/xe_pat: add helper funtion to read PAT table
Message-ID: <20260105165851.GM1180203@mdroper-desk1.amr.corp.intel.com>
References: <20251231232152.127555-1-x.wang@intel.com>
 <176723212287.122496.13206288258009654932@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176723212287.122496.13206288258009654932@a3b018990fe9>
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM3PPFCA3BFC2BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e873a74-a50c-43bb-a9c6-08de4c7bb57e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3OgEhAnnus/25irZsPa7azQA/ikTIZM/TgNyyVnyKo9RMri/72r+y13yHbb3?=
 =?us-ascii?Q?dPtx21zABvXyWBK2ZNryh7sydAJeyPB/aaWb3fwxnUH4udREjvOk7dZOwo69?=
 =?us-ascii?Q?Guy5XiL1y5rcw7WkoMQbnu3kerVSe8gCz4Z3EZZzy6YwTqX2vIw44MIlAGHW?=
 =?us-ascii?Q?mOqqY6I/swn6qsxem5xJiVoUmfZoVQ8k76mDUyDpVZk+4J7VlwTjGq3wwwo/?=
 =?us-ascii?Q?zMLvQliRSv+ys4A9wZjUxIiQ2VOM5A6SREXNTieAG+iXnRZhgd0F2PdkB0ea?=
 =?us-ascii?Q?TQ1JkDU3jtcQPEd89RlupOX50hloLO8J0qnRVLD5llLQZao6W8PIsH8/fpv+?=
 =?us-ascii?Q?sEnNXVLGgLWfKPI8xPtDEdAPFc4DG9jAykcpRVQGY2xFwQoyoRMQgj+1Q0zu?=
 =?us-ascii?Q?WWeijTE3Evn5QsvDCLu7aZRisVHc1X7T2lurnwoq7ncf3FCb2oPUDFIgb8u2?=
 =?us-ascii?Q?gP1epIqi4ylxo4n0Ygs2oSeLNfCjtgp1dRMY1oC1Vk82+xxlcJ3JlCe5RKcf?=
 =?us-ascii?Q?CSHGmCqvtBxr5RVbNsazN0PsbDIWEg+rJcQgDIQSZ3fQL7O3FP39ZiQYsex6?=
 =?us-ascii?Q?Moftiay78Q/ut2wLeVwZg0QQ8dlkN6ND8mzNFF66vYe5wKqoGzEp1JjFzkIt?=
 =?us-ascii?Q?xPATpcm30h1BWeJ3n+eJklu/zkFZjFY0LJ/HNB4BdTe46Gkq+irULzJAhI/Q?=
 =?us-ascii?Q?0wJ/kjx2TCMEpZaajzWy5XdTsXAlV2iyvC1leiVp/2hPXMb/O4omfdURTkAv?=
 =?us-ascii?Q?Zg0SjClsXVU6Fh6DuIWwlB/sj3PGEYnNhFKAjE/etUWXEK7grSrOoc97wvWx?=
 =?us-ascii?Q?IPrMRDHQzbaD598SWOyerhYsjWH7Qr+V8S4+SbZEop79xgxY6RnJilzVOB1Q?=
 =?us-ascii?Q?lP6nxf/76WjElLDugT5b6q1ugPNZy29Ue0b+GZCKrDenStRTCf78sRsdgsVH?=
 =?us-ascii?Q?LPaOiomwrB6RnZOGegrBovnEy/V0ZbubPtIPmEAWf2GSphulweFxG+izn4TC?=
 =?us-ascii?Q?zi8Zy0OoOQTplfeIrHjEyZAAzvMAG1PkUioPGyeVxV79GAQdSm0CXU7bhsBN?=
 =?us-ascii?Q?I9x0pBldnr8u3Vc3cEhhjbPjFCH63DVWst6w869VT1UmoCfZz+VCt4ludaWp?=
 =?us-ascii?Q?hx+6mTWgI4FfeXihzI98n3HEFjIJGu1kCJDwuhIbrOWrANgGDnPrfh+/SsRr?=
 =?us-ascii?Q?lLjh99K98cYNmvdbvJwYYAp5KgLarTz0kQHrwGwSpaFytJm3TLoE1hVHvIpT?=
 =?us-ascii?Q?C/ZZ7wOgpzj1U8rHEMv0n+jH2eRJQosHqdrxbJ+G9ihcs/f+sfSVbvJTy/Hh?=
 =?us-ascii?Q?Vn58ts017BkPENFaUlzuVX2Lr4eh99OnJoubeXrWaUVl+Z2ePbhJQNkhWHU2?=
 =?us-ascii?Q?P5ewGmaKt0JHbT9y+EzB4CH+yn0Lx5cydlyfpOIbvyvXNjzQuw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BFs9ZCxn7ZVC4HA8z13pKSJZ0aVEVDwdWfknbUSlK8CWDlmeqc79v++iAMsA?=
 =?us-ascii?Q?yNkyCn8zjfKA/88RgfGqQKWPTm7PO+JBDinrvQJokv55Vc/TdGvIFZHYwQ0T?=
 =?us-ascii?Q?axot55x9tCNtbCv2sbNF9OrIAE1gyDw5R9d7iLDolldp9SZO0fIsjKdwNUC0?=
 =?us-ascii?Q?wICLNdgZug2jNDwOktAVSA+QUFgV05wZbMqVPy6L4sV1kQPPMxtYXAdQdHo4?=
 =?us-ascii?Q?uFPsmVR6+0CRgvC7evbaFVh8Pf4PbbsxRZi1GEJxbCyTYvPVWnHVfp1YMwE8?=
 =?us-ascii?Q?b+OEKP4kTXkfOngT+WIVS1HDY/yF8/FFobONOIdVIgsPQzYE3319gYE6V/Qa?=
 =?us-ascii?Q?natEKNSxO3hT4T3kRhAZSbdtokBLS9cj3vwmLp2stE2X8S2hJQAXEwHkYboo?=
 =?us-ascii?Q?don5XRXYJHCK+EC05i+wUuKJsbdsu12QFdw2TN0N+AKZDSGJhlzoci4alpon?=
 =?us-ascii?Q?8FSHFYAiaPh9UiEC3ptWRQurlCkKu/dCQ8DBpzERWiZhVOtj1pmK6vg4ez8K?=
 =?us-ascii?Q?LHEYTzFafq8y6yMd0grUdJ7uPmfQXs7wobChhh45AV1sI3TdlS/RTH0IV74p?=
 =?us-ascii?Q?LPF1eRxDG8DqqG/gtVrrfbkubiUocDCxE7+Ugsqh+TSt+h/kudI/4tt9V696?=
 =?us-ascii?Q?4B4CGfoSyLob8a0WAXcKI1+6V0hcrbDFXz1AkxEA80gx+3GIGOt7Ax5tEjP/?=
 =?us-ascii?Q?W6rOIjlTHf05wktLmwy7+OWaAxKJAtpgNkvU/HODz2onagb658iqtxGfk6Ru?=
 =?us-ascii?Q?7UlVtbadiGXm3wNqif2ImQEwFmfqiVZTb6765ZFoLgjHA74O7CZAtTGnM2l6?=
 =?us-ascii?Q?3LyxUfGsYqJNeJ5dD4h31FTLx2LEHcESKhrs6juKjyw9oZm5GFUXzqp9OkRg?=
 =?us-ascii?Q?Nd29A5xywWiG/cHS9g+HT3N3/nWwW+b9xnwzl+MIfU0AnBA5U+f0IzSL8luh?=
 =?us-ascii?Q?9jmFebfWQ5qGtL8HZjldBJ6CkWelVdQR7IUzuWdjXvspdeI0L1Qx9ZWosZ0v?=
 =?us-ascii?Q?nw/r5Jq2YAg3Lh1xJhJnv9mJ2fH6+wqSBAIab33dEquf2tY7erU2RkCcCd71?=
 =?us-ascii?Q?LECMsYKBNCOFiDLyoNsHMMtnGKNNX1sznoYlHXgo+8eBI9dPHc4hdkdRI+or?=
 =?us-ascii?Q?sCR/W7NaoTOmQzHmCWflyGMolB+FMfR135/m0QvJFSC42oP6Izkpjx9Xm+HJ?=
 =?us-ascii?Q?NCOUHeZT0iWFGG/IuDcYg2i8X1+mReqHlbWiWckl3LOknnGYVAp6bwLOHCcc?=
 =?us-ascii?Q?3WvLocmVncQBeQcZqQCV2y7GshnFkaeQiovpdl4TUV3qpLFlfvIQEZQ66/dd?=
 =?us-ascii?Q?JsW+YI4I59tKESw45Xu7xaRrtwO1TbPauqy2hB8C6t8s6KUQ73N2HsrO3zv1?=
 =?us-ascii?Q?EXurXPwVnXgmi67Z6VaHoN9KaGR3y7Vaz540yyph7TyziU0Ap2T96RkfTat0?=
 =?us-ascii?Q?uHBT4EjGGcQj7nBMHVlI5oRwWg6mn/gYZeqZ5fGUkO6opd6KHD5OT0G4Qh9I?=
 =?us-ascii?Q?u5+1Xw8gmUueyWhfFaH+HEL8QNq+ni71rYBiv7SEFi7m8Sza2HgwJIHfjFDn?=
 =?us-ascii?Q?caNBi2gyPMwrfXJcNflxqmZGkxpeO/z2lnkshaI72tFv1/uKbygsZ5EZAF8r?=
 =?us-ascii?Q?h7rYH/FOflgoCYKwKZABX4nzOOuTrkbRj53A+gieRBa93QSFLmVvolVmWEl9?=
 =?us-ascii?Q?5N9EqBrNbD1Dq95lycvsRg4Mfq7xMUMRVl0YEvjQsTZ+U8Rb7mFSBFEgAMhn?=
 =?us-ascii?Q?2LBRaEflIClGesXQWSl+nhyrpvqwB88=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e873a74-a50c-43bb-a9c6-08de4c7bb57e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:58:54.9301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yoq0RuRFizfaovQCKRccRERLuIuFDtqYizoIST2TtJOrfcpJFO5RLPAgNMx0fuIJlswRLwZ2OA6hAIoATZPixux7O8AJFt7zmgB8qTU9vs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCA3BFC2BF
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

On Thu, Jan 01, 2026 at 01:48:42AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pat: add helper funtion to read PAT table
> URL   : https://patchwork.freedesktop.org/series/159576/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8681_FULL -> XEIGTPW_14276_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8681_FULL and XEIGTPW_14276_FULL:
> 
> ### New IGT tests (1) ###
> 
>   * igt@xe_pat@pat-sanity:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.0] s
> 

Applied to master.  Thanks for the patches.


Matt

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14276_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#3157])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2370])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1407])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327]) +4 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +16 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2328])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1428])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#610])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#367]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +18 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2652] / [Intel XE#787]) +25 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#3432]) +3 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2325]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#306])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-2/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#373])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-4/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252]) +14 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_sharpness_filter@filter-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#6507])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@kms_chamelium_sharpness_filter@filter-basic.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2390])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#307])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          NOTRUN -> [FAIL][23] ([Intel XE#1178]) +3 other tests fail
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#3278])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-1/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-random-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2320]) +2 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@kms_cursor_crc@cursor-random-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2321])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1424]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2321]) +4 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#309])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [PASS][30] -> [FAIL][31] ([Intel XE#6715])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [PASS][32] -> [FAIL][33] ([Intel XE#5299]) +1 other test fail
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2286])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1508])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4354]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2244]) +4 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4422])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4156]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1421])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-8/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>     - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#301])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2293]) +5 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2311]) +42 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#4141]) +16 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#656]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2352])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2313]) +43 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
>     - shard-bmg:          [PASS][52] -> [ABORT][53] ([Intel XE#6740]) +1 other test abort
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-10/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#3544])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#6901])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2501])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2393])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#5021]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#5020])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2938])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#870]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2392])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#1406] / [Intel XE#1489]) +8 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1406] / [Intel XE#2387]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1128] / [Intel XE#1406])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-5/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_psr@fbc-pr-primary-page-flip.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1406])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1406] / [Intel XE#2234])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1406] / [Intel XE#2414])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2330])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#6503]) +3 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2168])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#4459]) +1 other test fail
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#1499]) +3 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_vrr@max-min.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#6599])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#5191])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many-vram.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2504])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_eudebug@connect-user:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#4837]) +15 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@xe_eudebug@connect-user.html
> 
>   * igt@xe_eudebug_online@pagefault-write-stress:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#6665])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-4/igt@xe_eudebug_online@pagefault-write-stress.html
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#6665] / [Intel XE#6681])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@xe_eudebug_online@pagefault-write-stress.html
> 
>   * igt@xe_eudebug_online@resume-dss:
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-8/igt@xe_eudebug_online@resume-dss.html
> 
>   * igt@xe_eudebug_online@set-breakpoint-faultable:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4837] / [Intel XE#6665]) +4 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@xe_eudebug_online@set-breakpoint-faultable.html
> 
>   * igt@xe_evict@evict-beng-small-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#688])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-5/igt@xe_evict@evict-beng-small-external-cm.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2322]) +14 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-defer-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1392])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-7/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#6874]) +2 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#6874]) +44 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html
> 
>   * igt@xe_exec_system_allocator@process-many-mmap-free-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#4943]) +30 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#4943]) +3 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@twice-large-malloc-prefetch-madvise:
>     - shard-lnl:          NOTRUN -> [WARN][93] ([Intel XE#5786])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-3/igt@xe_exec_system_allocator@twice-large-malloc-prefetch-madvise.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-bmg:          NOTRUN -> [ABORT][94] ([Intel XE#5466])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115]) -> ([PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [SKIP][136]) ([Intel XE#2457])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-8/igt@xe_module_load@load.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_module_load@load.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-3/igt@xe_module_load@load.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-3/igt@xe_module_load@load.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-3/igt@xe_module_load@load.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_module_load@load.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_module_load@load.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_module_load@load.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-9/igt@xe_module_load@load.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-7/igt@xe_module_load@load.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-7/igt@xe_module_load@load.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-7/igt@xe_module_load@load.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-1/igt@xe_module_load@load.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-1/igt@xe_module_load@load.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-1/igt@xe_module_load@load.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-8/igt@xe_module_load@load.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-10/igt@xe_module_load@load.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-10/igt@xe_module_load@load.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-9/igt@xe_module_load@load.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-9/igt@xe_module_load@load.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-10/igt@xe_module_load@load.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@xe_module_load@load.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@xe_module_load@load.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@xe_module_load@load.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@xe_module_load@load.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@xe_module_load@load.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@xe_module_load@load.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@xe_module_load@load.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@xe_module_load@load.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@xe_module_load@load.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-7/igt@xe_module_load@load.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@xe_module_load@load.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-7/igt@xe_module_load@load.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-1/igt@xe_module_load@load.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-1/igt@xe_module_load@load.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-1/igt@xe_module_load@load.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@xe_module_load@load.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@xe_module_load@load.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@xe_module_load@load.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@xe_module_load@load.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@xe_module_load@load.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@xe_module_load@load.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2236])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2284]) +2 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-50:
>     - shard-lnl:          [PASS][139] -> [FAIL][140] ([Intel XE#6251]) +1 other test fail
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-50.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
>     - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#4733]) +1 other test skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#944]) +7 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput@numvfs-random:
>     - shard-bmg:          [PASS][143] -> [FAIL][144] ([Intel XE#5937]) +1 other test fail
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-10/igt@xe_sriov_scheduling@equal-throughput@numvfs-random.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@xe_sriov_scheduling@equal-throughput@numvfs-random.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-bmg:          [INCOMPLETE][145] ([Intel XE#6819]) -> [PASS][146]
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-bmg:          [DMESG-FAIL][147] ([Intel XE#5545]) -> [PASS][148] +1 other test pass
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
>     - shard-bmg:          [INCOMPLETE][149] ([Intel XE#6891]) -> [PASS][150]
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][151] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][152]
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [INCOMPLETE][153] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][154] +1 other test pass
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-bmg:          [ABORT][155] ([Intel XE#6740]) -> [PASS][156] +1 other test pass
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-9/igt@kms_hdr@static-swap.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-1/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_plane@pixel-format@pipe-a-plane-0:
>     - shard-lnl:          [FAIL][157] ([Intel XE#5195]) -> [PASS][158] +1 other test pass
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-8/igt@kms_plane@pixel-format@pipe-a-plane-0.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-5/igt@kms_plane@pixel-format@pipe-a-plane-0.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [FAIL][159] ([Intel XE#718]) -> [PASS][160]
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [FAIL][161] ([Intel XE#6361]) -> [PASS][162] +2 other tests pass
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@xe_exec_system_allocator@many-stride-mmap-prefetch:
>     - shard-bmg:          [SKIP][163] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][164]
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap-prefetch.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-mmap-prefetch.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>     - shard-lnl:          [FAIL][165] ([Intel XE#5625]) -> [PASS][166]
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
> 
>   * igt@xe_oa@oa-exponents:
>     - shard-bmg:          [SKIP][167] ([Intel XE#6703]) -> [PASS][168] +64 other tests pass
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_oa@oa-exponents.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@xe_oa@oa-exponents.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90:
>     - shard-lnl:          [FAIL][169] ([Intel XE#6251]) -> [PASS][170] +3 other tests pass
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html
> 
>   * igt@xe_sriov_vram@vf-access-after-resize-up:
>     - shard-bmg:          [FAIL][171] ([Intel XE#5937]) -> [PASS][172]
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-10/igt@xe_sriov_vram@vf-access-after-resize-up.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-1/igt@xe_sriov_vram@vf-access-after-resize-up.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>     - shard-bmg:          [SKIP][173] ([Intel XE#6703]) -> [SKIP][174] ([Intel XE#2652] / [Intel XE#787])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-bmg:          [SKIP][175] ([Intel XE#6703]) -> [SKIP][176] ([Intel XE#2325]) +1 other test skip
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-bmg:          [SKIP][177] ([Intel XE#6703]) -> [SKIP][178] ([Intel XE#2341])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_content_protection@content-type-change.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-bmg:          [SKIP][179] ([Intel XE#6703]) -> [SKIP][180] ([Intel XE#2374])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_feature_discovery@psr2.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-7/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-lnl:          [FAIL][181] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][182] ([Intel XE#301])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-bmg:          [SKIP][183] ([Intel XE#6703]) -> [SKIP][184] ([Intel XE#2293] / [Intel XE#2380])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][185] ([Intel XE#6703]) -> [SKIP][186] ([Intel XE#4141])
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][187] ([Intel XE#6703]) -> [SKIP][188] ([Intel XE#2311]) +2 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
>     - shard-bmg:          [SKIP][189] ([Intel XE#6703]) -> [SKIP][190] ([Intel XE#2313]) +2 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-bmg:          [SKIP][191] ([Intel XE#6703]) -> [SKIP][192] ([Intel XE#6912])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-bmg:          [SKIP][193] ([Intel XE#6693]) -> [SKIP][194] ([Intel XE#1439] / [Intel XE#836])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          [SKIP][195] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][196] ([Intel XE#1406] / [Intel XE#1489])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@psr-primary-render:
>     - shard-bmg:          [SKIP][197] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [INCOMPLETE][198] ([Intel XE#2594])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-10/igt@kms_psr@psr-primary-render.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-1/igt@kms_psr@psr-primary-render.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          [SKIP][199] ([Intel XE#6703]) -> [SKIP][200] ([Intel XE#2330])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-bmg:          [SKIP][201] ([Intel XE#6703]) -> [SKIP][202] ([Intel XE#1435])
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_sharpness_filter@filter-toggle:
>     - shard-bmg:          [SKIP][203] ([Intel XE#6703]) -> [SKIP][204] ([Intel XE#6503])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html
> 
>   * igt@xe_eudebug@discovery-empty:
>     - shard-bmg:          [SKIP][205] ([Intel XE#6703]) -> [SKIP][206] ([Intel XE#4837])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_eudebug@discovery-empty.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-8/igt@xe_eudebug@discovery-empty.html
> 
>   * igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:
>     - shard-bmg:          [SKIP][207] ([Intel XE#6703]) -> [SKIP][208] ([Intel XE#4837] / [Intel XE#6665])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-9/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html
> 
>   * igt@xe_exec_multi_queue@few-execs-userptr:
>     - shard-bmg:          [SKIP][209] ([Intel XE#6703]) -> [SKIP][210] ([Intel XE#6874])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-userptr.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-userptr.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-bmg:          [SKIP][211] -> [SKIP][212] ([Intel XE#2427])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_peer2peer@write.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pxp@display-black-pxp-fb:
>     - shard-bmg:          [SKIP][213] ([Intel XE#6703]) -> [SKIP][214] ([Intel XE#4733])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8681/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/shard-bmg-10/igt@xe_pxp@display-black-pxp-fb.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
>   [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
>   [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
>   [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
>   [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
>   [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
>   [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
>   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
>   [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
>   [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
>   [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6891]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6891
>   [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>   [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8681 -> IGTPW_14276
>   * Linux: xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb -> xe-4318-56e91f8b7cd1da01b69096d61b4eca31c5364beb
> 
>   IGTPW_14276: 14276
>   IGT_8681: c49f35440873244aa86e778007ed2dcbe5bf0ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb: 633f3e5eab13c5bc2d760d1f3db65eb346d9babb
>   xe-4318-56e91f8b7cd1da01b69096d61b4eca31c5364beb: 56e91f8b7cd1da01b69096d61b4eca31c5364beb
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14276/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
