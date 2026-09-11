Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1A0C88E53
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 20:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570DC10E40C;
	Fri, 11 Sep 2026 20:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2fP0v06";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E8010E40C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 20:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789158928; x=1820694928;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=zlnBYaaMWZRGjcPZI+OYNH5xSODvX/OkNM2JDyphd2U=;
 b=A2fP0v06FRA4szmvEdzB/7ymKznrMSs0mXlQSuevgtqzHVmlvwxYiSo2
 6p/4lF1hvMMfA4LGv/RWfgD4MTSiKNz8DTgyc8gyaEXr8EEPwYZtFpbzV
 hNkU7FCODy65afIde0ANsJEqh+sOkJyJwX9o/q6XAJAz9FgiqPioiFYjZ
 wO8e1ZDbK7WY5BA+v2rIko46OAAzZBxd5zsNWy/EUrFT9hZkca6kyV9/G
 WLHBlr/3yzjsMlw1Ouvy61mJiv3cd6yCJ2EbTpKWkjpFXVhJt3ANrfNeg
 ekwkdsHIUXLarbcM9fzLboDBweoBae3qsJafQY2IdHS84671hSJrL3T9q A==;
X-CSE-ConnectionGUID: jKxq9PzCSh6KU6Ws3KkTBA==
X-CSE-MsgGUID: WpMvgeW1TP+oaBeYwe3G1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="112398088"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="112398088"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:35:27 -0700
X-CSE-ConnectionGUID: v9LS1/AKRz6nj9uV9tDo7Q==
X-CSE-MsgGUID: KMfBh0StSTWOZjkcXhLlMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="296997885"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:35:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 13:35:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 13:35:26 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 13:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNBXAshC4OEgQVv9kAJnNRVdLiaMJJfXCe5DsfnlvrnSeKtwog5rsvpuqDXJt9UqP5yuC7hFILzTfZovyd/KJZ9mWt6YWhVHl/7VJjYfTvVptWG/bvaOjK9hhdFE9pmyj2YLKYhALiTpCDti1AOx65K9SpIOByfApKZf0CKdJ2xWk4S6ReuFIr3SUEyHTf0aJmMlorYydrTH/hpmnOurzOddGS178nV3Q9jW9TC9uzS9Iqns5FmwWx7EzrvPpaQl+LirqOeidkJarWljxvjLvDePRhGxjMplI7d6J75ibDXRsPdooWBqwVIsH/2k3Bjagjs7Vxcp+Y2MvsVWBBqn6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwjTLDUD/uLdCFgMvzEORxQmmy9f+O4SUhjJ6eNBzNc=;
 b=iJKq9opwRjTd2b+9+Jqc+9ToqTcT29PxtSTKtpUJCloqXUdzhzIBWZNlcOLLwinjF5dWTd2NUeA4nBt6i8mPDGzoJ4ufGmFYAbJvBd5tVTmUUusLI4oVOpweVvd7ADSn0NcOEiZjEh77U9ujJAnAZe+DU8Kuu325Q5l54ksVZCx9ym55ZqjI9N2jgAbHMUj9qPq4qV02ym/C58daGFxOGxyEkOeBk0iWP+OAPJHkRSe0vly3Uj/Cj2/6xP60ien5sSEkJO/vObW27ePkzfcHcJAFrGE82i6cmXxMqRR5Uq4kHiBbI5fRdVwDjejWnbfMCF5N1bz+lq6nfmHYZhGvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB7709.namprd11.prod.outlook.com (2603:10b6:510:296::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 20:35:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 20:35:07 +0000
Date: Fri, 11 Sep 2026 13:35:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re_fo?=
 =?utf-8?Q?r?= lib/xe: Use proper GT lookup in xe_gt_get_tile_id() (rev2)
Message-ID: <20260911203505.GA730887@mdroper-desk1.amr.corp.intel.com>
References: <20260909-gtlookup_noncontig-v2-1-e25a659b43a1@intel.com>
 <178903418728.146288.16226406217549229234@61270ab9df2a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178903418728.146288.16226406217549229234@61270ab9df2a>
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a64f29-3d53-4d15-8a7a-08df10442ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|3023799007|11063799006|5023799004|56012099006|4143699003|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mJdC+iLGhe6SxyCNq1LDBs0vBvQQmfuON/al2fgzR3V1plcpsBZZppwksgd84V0gi8BYsRKi9Hrw2YoNNCtm1yggnJeSHCS8bDWWlluAkP7yLR3QqcUAXPdyZ7+dgUHj/NpaZbwHDmal6M8FcQ4uD9c8MlcFNrZtt4wEMyYkF3wJMOpgyAyT9k3euTF2sAvPxJAF7mRe3Dd5+uFywu7iCLgzvQmm/ynMymH8WmxIvj+D0XEcuEANqMW7tcNMZkqDwnJY8vTCOXrkzzzpF0nA6azq237xMUTjzvlL2NUaL9ijO7ligdGIErx4fFq4KXpY1aNnQEjG9wCu3NLPFixS/3+Pc5vXzMgvBj6z1hw8LDR0tthji7Q9ex4eduHo/jDsB79r7jGF4Y7aAyEZ5HzFWaBy3gaHADziIW7056OEAsnOwhfotGQ4oKLe4e2J87hKkCVzGjIVzOrbHbcfhgcEct78+XzeIYLlmtNV8jSyXNXLJGU7S9gUdlYLs+DZbK/rxy53lkxFPfMg3d858u/avH9evK72LKng1yfoyAqv2Mai4VtkNm4hHEVZChlu0brGwL/DFnlkWoZ1effYckBfu03jP2fv9XA9BknNNEJEhY0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(11063799006)(5023799004)(56012099006)(4143699003)(6133799003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B6sXafx55EHr5pvXe98CyRvLkRjhHKdhlZfx+KUon1aKSO5S1e913nZ+qJlI?=
 =?us-ascii?Q?szmJ2qn17Q7opxHPpCylsWYRt7cEvxo5+CyfA5dWlHb/pFeJuS5v27gXZ/e4?=
 =?us-ascii?Q?nqYDiJEN7ZcEbPw+zmM+N2Xr3/2/xXRWCUaVCOGeWQ0VpXCbt1KAkffp6igI?=
 =?us-ascii?Q?+HTVkk2hevUbRaWzOiNSANv90LLMrK+6PBm2GGwZmmdkveTCSZJxqnbH5aKa?=
 =?us-ascii?Q?fvPx+MLqUtkOuedj2iIdwSTngh+HjLV+kN5VkUktEKdW3RJeIOTzlso1IEXl?=
 =?us-ascii?Q?vJZD/apATrSkTXp1d3pKlA9ESatCw8A1Lsg5Ddh4UVV0OT/UlyY+anZMrw2/?=
 =?us-ascii?Q?ZOa65uwZAZj8Cgj4Cw8uiifpXkRjBwX0r73v+Vx7DyqdiaT3GEV3xd1E2yM8?=
 =?us-ascii?Q?OMHyzO1GORfhLf6NqS9HRr4IiCP4jUEY6jATklkeziqLObxNV1EguQwCgHEM?=
 =?us-ascii?Q?isNy/UwgDNR7yakRRJwD5hEANi8ogef60j9mtHzpFBDUqGSR5Jdm6+Udm4jL?=
 =?us-ascii?Q?qSD0mETCco7lCmoj6VnK4fWom1It8A3RKjY9CnNCd8NQF8B0P1sTHIpMcTMj?=
 =?us-ascii?Q?sXS2rzWhtRID1+3HooF0PFiQn6LRBxSh8LJPG/NqYiT4TcdhFsGzagLfujkF?=
 =?us-ascii?Q?Ioc2O+BJptt5O4Xqg5QeEZTkcehcPj5QoWk/p+JkAHEnkIvccQw13pRIFFi4?=
 =?us-ascii?Q?ht0060946XMjkFW8vP3QQlQQgNvgHzeyE6w9xWlcY3iqgeloLan+we+lufxv?=
 =?us-ascii?Q?bcQ0Y3Lxom288Wpy7GqToaqKY7Q7f8phob+aIZXc3bEm67zuLW/nch0A8ajU?=
 =?us-ascii?Q?lIQJz6oJP3sttAZt/QCuJ7Hn2qvJ2g4AIKW2L7f/+qP8sUSRX1/XqDBF8Q2Y?=
 =?us-ascii?Q?GbQpggDYEE8ZxYpmi6UFFZh/+whgBlTOSfKd1X2HA5D8oXR/k2PudYBUTAaL?=
 =?us-ascii?Q?OWZRJ0387ojEfAfSvyLDIU532+Cxg1wM3I6pMRbvDkME9Xzf6LmFlBQuIrap?=
 =?us-ascii?Q?fmmnDmUr8aSGUu60XHRVKbRYmb8stNN+uqZENfeEFqR9B1hsF91QBwB5gOuE?=
 =?us-ascii?Q?wARP78dPMeZjeByunQFR5GmTSQVoUryqXXh9pvylGWkwsY5zfh23LBvq10Vb?=
 =?us-ascii?Q?Ia9Mz8lT8mrD8XaFAB8B/ugXiR9Goc6LMcy2NSaybiwguif+8YEt1Vxzfd7s?=
 =?us-ascii?Q?DlG9kue4MV5FieWtVB7mi9sJsxBOaD6bLE7kXqDLSAqXqJzNpIyLz/zL875R?=
 =?us-ascii?Q?yIfzUL++Co9i3PLyYfGd5cu7908LaZOAkzbWzkuYr05NlNUkb44C2zMFUqow?=
 =?us-ascii?Q?FyimUrLIB0apUK6OhW5JHpW+NNeRpncvyQIYHX/4VIvuGchIaxwPLpkHDzGG?=
 =?us-ascii?Q?uPbel3EZKGQtkS9V5jl9xqKrsO2u2TXcPgZByr3nb6wATmSPCYwMZluXCZco?=
 =?us-ascii?Q?rikSTHYdmE0uCj+82JUsmJ0fbNFLZvb2Z+kYBwpIWZ76B+EofTJ8/5YiSWwd?=
 =?us-ascii?Q?YOprBmmU1DZUadRkxccmNKEl72XGMPGHx63J409GwPfZdlWQSZ0rw/Pcnivm?=
 =?us-ascii?Q?Grdyf1gOgfXvFO1c+Z05qbXD/rU7OdchCAfu+W/m3LJeL4Xnys0+Qcdw71Ec?=
 =?us-ascii?Q?LsP0JnCotn8N1ac1bfHYfCB1n7ohnTf132Krru5VrMQxHCMXNNH219Q72Exk?=
 =?us-ascii?Q?cCIodfxr+n8pYGRER6Ate9WbkmO8RROW9KqcoR2R60ysKzhJLTNVBagiNu3s?=
 =?us-ascii?Q?J1G3aXFxUvPcymp2ZKXBpcywWY4JXZ8=3D?=
X-Exchange-RoutingPolicyChecked: oHlAz9wyNf72IZxWvVjWd/Gx2cv8ym2lqDM1r15Q+G9KSkbinSblVXAhRLvt/mjjArm86HGSrRhkH1v0UbkJTTjR/8KoW/pyIALE/OrtbDmN1NAT+3PKWiQT/eLiW8XKsJnwFk80XGkhmCkx4MpKDOmvVjN9m7N+49QnnOPOPF47pvmBsop8Q3QKvqeqtTwD6u6hGvZWgC05RtnGaT5UveU8daF4n6Xo8MTfLvkl6WBFKbgrmE2uXqrOOx0pbQFiC6HtJAFHMYQbB9aQI8OryvVLraPOdeIMhawFf8BBzz6RSrkDnuJBDKOoHMWvmQYX0XYtONTP1j1l7z6qnlyq3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a64f29-3d53-4d15-8a7a-08df10442ac6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 20:35:07.4174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SL2g9kvelUMRTSoQ0qPIwdlx+DS4t/DBXU4Yw89OCs9VTDdIBe4jvqOOHbGkoHInFVgjt75Q8Zo7NPMcj/Kgb6vqV+VnUp5fEU/gQsv5/Ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7709
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

On Thu, Sep 10, 2026 at 09:56:27AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/xe: Use proper GT lookup in xe_gt_get_tile_id() (rev2)
> URL   : https://patchwork.freedesktop.org/series/173091/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9088_FULL -> XEIGTPW_15818_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15818_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15818_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_15818_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-9/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0.html

Pre-existing issue:

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8526


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15818_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2328] / [Intel XE#7367])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1467] / [Intel XE#7367])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +4 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#7679])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#367])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#8365])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +4 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2669] / [Intel XE#7389]) +8 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#2887])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#3432])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#9204] / [Intel XE#9219]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_cdclk@plane-scaling.html
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2724] / [Intel XE#7449])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-9/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#9219]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html
> 
>   * igt@kms_chamelium_audio@dp-audio-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2252]) +4 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-5/igt@kms_chamelium_audio@dp-audio-after-suspend.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#7358])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7358])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
> 
>   * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#6974])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
> 
>   * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-10/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7642])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-1/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +4 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x32:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1424])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-32x32.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2286] / [Intel XE#6035])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4210] / [Intel XE#7467])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#1508])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#8265]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#8265]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4156] / [Intel XE#7425])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1138] / [Intel XE#7344])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_feature_discovery@display-4x.html
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1138] / [Intel XE#7344])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][33] -> [FAIL][34] ([Intel XE#6266]) +1 other test fail
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-dp2-hdmi-a3.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1421]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +2 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4141]) +6 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-stridechange:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#6312] / [Intel XE#651])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-stridechange.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2311]) +29 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7061]) +3 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#6312]) +3 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-shrfb-scaledprimary:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7865]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#656] / [Intel XE#7905]) +3 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2313]) +35 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-plflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7905]) +7 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#6901])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#8303]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#7283])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-framegap:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-framegap.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#8396]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#8399]) +1 other test fail
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#4608]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1489]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#4608] / [Intel XE#7304]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html
> 
>   * igt@kms_psr@fbc-psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-1/igt@kms_psr@fbc-psr-suspend.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1406] / [Intel XE#7345])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-render@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +3 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html
> 
>   * igt@kms_psr@pr-sprite-render:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1406]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-8/igt@kms_psr@pr-sprite-render.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#3904] / [Intel XE#7342])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1435] / [Intel XE#8695])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-10/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-plane:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#6503]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-plane.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#1499])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-2/igt@kms_vrr@max-min.html
> 
>   * igt@xe_evict@evict-mixed-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#6540] / [Intel XE#688])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@xe_evict@evict-mixed-threads-small.html
> 
>   * igt@xe_exec_balancer@once-cm-parallel-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7482])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@xe_exec_balancer@once-cm-parallel-basic.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1392])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#8374]) +6 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#8374]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html
> 
>   * igt@xe_exec_multi_queue@many-queues-close-fd-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#8364]) +4 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-5/igt@xe_exec_multi_queue@many-queues-close-fd-smem.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#8364]) +17 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-6/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-cat-error:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#8369]) +2 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-cat-error.html
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#8369]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html
> 
>   * igt@xe_exec_system_allocator@many-execqueues-mmap-free-race-nomemset:
>     - shard-lnl:          [PASS][79] -> [INCOMPLETE][80] ([Intel XE#9191])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-7/igt@xe_exec_system_allocator@many-execqueues-mmap-free-race-nomemset.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-8/igt@xe_exec_system_allocator@many-execqueues-mmap-free-race-nomemset.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#8378]) +5 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#8378]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html
> 
>   * igt@xe_madvise@atomic-cpu:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#7980])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-5/igt@xe_madvise@atomic-cpu.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#6964])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-basic.html
> 
>   * igt@xe_pm@d3cold-i2c:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#5694] / [Intel XE#7370])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-7/igt@xe_pm@d3cold-i2c.html
> 
>   * igt@xe_pxp@pxp-optout:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#4733] / [Intel XE#7417])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-1/igt@xe_pxp@pxp-optout.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#944]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-bmg:          [PASS][88] -> [FAIL][89] ([Intel XE#6569]) +1 other test fail
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-7/igt@xe_sriov_flr@flr-twice.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-3/igt@xe_sriov_flr@flr-twice.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0:
>     - shard-bmg:          [PASS][90] -> [FAIL][91] ([Intel XE#7992]) +3 other tests fail
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-9/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@fbdev@read:
>     - shard-lnl:          [SKIP][92] ([Intel XE#2134]) -> [PASS][93] +1 other test pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@fbdev@read.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@fbdev@read.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-bmg:          [FAIL][94] ([Intel XE#8583]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-9/igt@intel_hwmon@hwmon-write.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-9/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [INCOMPLETE][96] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][97] +1 other test pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_color@ctm-0-75:
>     - shard-lnl:          [SKIP][98] ([Intel XE#3297]) -> [PASS][99] +2 other tests pass
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_color@ctm-0-75.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@kms_color@ctm-0-75.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
>     - shard-lnl:          [SKIP][100] ([Intel XE#7006]) -> [PASS][101] +3 other tests pass
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [FAIL][102] ([Intel XE#7809]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_dp_aux_dev@basic:
>     - shard-lnl:          [SKIP][104] ([Intel XE#3009]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_dp_aux_dev@basic.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_dp_aux_dev@basic.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-lnl:          [SKIP][106] ([Intel XE#9127]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-lnl:          [SKIP][108] ([Intel XE#1135]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_feature_discovery@psr1.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-5/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][110] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][111] +1 other test pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-wf_vblank-interruptible:
>     - shard-lnl:          [SKIP][112] ([Intel XE#2482]) -> [PASS][113] +11 other tests pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
>     - shard-lnl:          [SKIP][114] ([Intel XE#1745] / [Intel XE#9144]) -> [PASS][115] +2 other tests pass
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling:
>     - shard-lnl:          [SKIP][116] ([Intel XE#2682]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_flip_tiling@flip-change-tiling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
>     - shard-lnl:          [SKIP][118] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][119] +22 other tests pass
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-lnl:          [SKIP][120] ([Intel XE#7779]) -> [PASS][121] +2 other tests pass
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_invalid_mode@bad-vtotal:
>     - shard-lnl:          [SKIP][122] ([Intel XE#2568]) -> [PASS][123] +1 other test pass
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_invalid_mode@bad-vtotal.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_invalid_mode@bad-vtotal.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-bmg:          [ABORT][124] ([Intel XE#9093]) -> [PASS][125] +1 other test pass
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier:
>     - shard-lnl:          [SKIP][126] ([Intel XE#7250] / [Intel XE#9128]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-modifier.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-modifier.html
> 
>   * igt@kms_plane@plane-position-hole:
>     - shard-lnl:          [SKIP][128] ([Intel XE#9128]) -> [PASS][129] +1 other test pass
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane@plane-position-hole.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-8/igt@kms_plane@plane-position-hole.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:
>     - shard-lnl:          [SKIP][130] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][131] +13 other tests pass
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
>     - shard-lnl:          [SKIP][132] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][133] +13 other tests pass
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-lnl:          [SKIP][134] ([Intel XE#870]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_backlight@fade-with-suspend.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [FAIL][136] ([Intel XE#8399]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [SKIP][138] ([Intel XE#7794]) -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@universal-planes:
>     - shard-lnl:          [SKIP][140] ([Intel XE#4886]) -> [PASS][141] +1 other test pass
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html
> 
>   * igt@kms_properties@plane-properties-legacy:
>     - shard-lnl:          [SKIP][142] ([Intel XE#9129]) -> [PASS][143] +1 other test pass
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_properties@plane-properties-legacy.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_properties@plane-properties-legacy.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
>     - shard-lnl:          [SKIP][144] ([Intel XE#1489]) -> [PASS][145] +2 other tests pass
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@psr2-sprite-plane-onoff:
>     - shard-lnl:          [SKIP][146] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][147] +10 other tests pass
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_psr@psr2-sprite-plane-onoff.html
> 
>   * igt@kms_vblank@query-forked:
>     - shard-lnl:          [SKIP][148] ([Intel XE#9125]) -> [PASS][149] +68 other tests pass
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_vblank@query-forked.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_vblank@query-forked.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
>     - shard-bmg:          [ABORT][150] ([Intel XE#7774]) -> [PASS][151]
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-9/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0:
>     - shard-bmg:          [ABORT][152] ([Intel XE#9206]) -> [PASS][153]
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-9/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@rcs0.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0:
>     - shard-bmg:          [DMESG-FAIL][154] ([Intel XE#7774]) -> [PASS][155]
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-9/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs0.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1:
>     - shard-bmg:          [INCOMPLETE][156] ([Intel XE#7774] / [Intel XE#8654]) -> [PASS][157]
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-9/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind@vcs1.html
> 
>   * igt@xe_exec_system_allocator@process-many-stride-mmap-free-race:
>     - shard-bmg:          [FAIL][158] ([Intel XE#9115]) -> [PASS][159]
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-3/igt@xe_exec_system_allocator@process-many-stride-mmap-free-race.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-8/igt@xe_exec_system_allocator@process-many-stride-mmap-free-race.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>     - shard-lnl:          [FAIL][160] ([Intel XE#9096]) -> [PASS][161]
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-lnl:          [SKIP][162] ([Intel XE#7590] / [Intel XE#9125]) -> [PASS][163]
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@xe_pat@display-vs-wb-transient.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-5/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-bmg:          [FAIL][164] ([Intel XE#6569]) -> [PASS][165]
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-bmg-4/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          [SKIP][166] ([Intel XE#9125]) -> [SKIP][167] ([Intel XE#3658] / [Intel XE#7360])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-lnl:          [SKIP][168] ([Intel XE#9125]) -> [SKIP][169] ([Intel XE#1407]) +2 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [SKIP][170] ([Intel XE#9125]) -> [SKIP][171] ([Intel XE#7059] / [Intel XE#7085]) +1 other test skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-lnl:          [SKIP][172] ([Intel XE#9125]) -> [SKIP][173] ([Intel XE#1124]) +14 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-lnl:          [SKIP][174] ([Intel XE#9125]) -> [SKIP][175] ([Intel XE#1467] / [Intel XE#7367])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-lnl:          [SKIP][176] ([Intel XE#9125]) -> [SKIP][177] ([Intel XE#1428] / [Intel XE#7387])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
>     - shard-lnl:          [SKIP][178] ([Intel XE#9125]) -> [SKIP][179] ([Intel XE#7679]) +2 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
>     - shard-lnl:          [SKIP][180] ([Intel XE#9125]) -> [SKIP][181] ([Intel XE#8365]) +1 other test skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
>     - shard-lnl:          [SKIP][182] ([Intel XE#9125]) -> [SKIP][183] ([Intel XE#367]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          [SKIP][184] ([Intel XE#9125]) -> [SKIP][185] ([Intel XE#3432]) +1 other test skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          [SKIP][186] ([Intel XE#9125]) -> [SKIP][187] ([Intel XE#2887]) +19 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-lnl:          [SKIP][188] ([Intel XE#9125]) -> [SKIP][189] ([Intel XE#2669] / [Intel XE#7389]) +2 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-lnl:          [SKIP][190] ([Intel XE#9204]) -> [SKIP][191] ([Intel XE#9204] / [Intel XE#9205]) +1 other test skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-3/igt@kms_cdclk@mode-transition.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-lnl:          [SKIP][192] ([Intel XE#9125]) -> [SKIP][193] ([Intel XE#7008])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>     - shard-lnl:          [SKIP][194] ([Intel XE#9125]) -> [SKIP][195] ([Intel XE#6974]) +2 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-lnl:          [SKIP][196] ([Intel XE#9125]) -> [SKIP][197] ([Intel XE#1468] / [Intel XE#7396])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_content_protection@mei-interface.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-lnl:          [SKIP][198] ([Intel XE#9125]) -> [SKIP][199] ([Intel XE#7642]) +1 other test skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_content_protection@type1.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>     - shard-lnl:          [SKIP][200] ([Intel XE#9125]) -> [SKIP][201] ([Intel XE#1424]) +7 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-lnl:          [SKIP][202] ([Intel XE#9125]) -> [SKIP][203] ([Intel XE#2321] / [Intel XE#7355])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-lnl:          [SKIP][204] ([Intel XE#9125]) -> [SKIP][205] ([Intel XE#309] / [Intel XE#7343]) +5 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-lnl:          [SKIP][206] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][207] ([Intel XE#309] / [Intel XE#7343])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-lnl:          [SKIP][208] ([Intel XE#9125]) -> [SKIP][209] ([Intel XE#323] / [Intel XE#6035]) +1 other test skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-lnl:          [SKIP][210] ([Intel XE#9125]) -> [SKIP][211] ([Intel XE#4354] / [Intel XE#5882])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-mst.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
>     - shard-lnl:          [SKIP][212] ([Intel XE#9125]) -> [SKIP][213] ([Intel XE#8265]) +4 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
>     - shard-lnl:          [SKIP][214] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][215] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +2 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
>     - shard-lnl:          [SKIP][216] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][217] ([Intel XE#6312] / [Intel XE#651]) +13 other tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff:
>     - shard-lnl:          [SKIP][218] ([Intel XE#7779]) -> [SKIP][219] ([Intel XE#6312]) +22 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-lnl:          [SKIP][220] ([Intel XE#7779]) -> [SKIP][221] ([Intel XE#7905]) +64 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-lnl:          [SKIP][222] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][223] ([Intel XE#1469] / [Intel XE#7399])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
>     - shard-lnl:          [SKIP][224] ([Intel XE#7779]) -> [SKIP][225] ([Intel XE#7061] / [Intel XE#7356]) +7 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
>     - shard-lnl:          [SKIP][226] ([Intel XE#7779]) -> [SKIP][227] ([Intel XE#7399])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
>     - shard-lnl:          [SKIP][228] ([Intel XE#7779]) -> [SKIP][229] ([Intel XE#7865]) +38 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
>     - shard-lnl:          [SKIP][230] ([Intel XE#7779]) -> [SKIP][231] ([Intel XE#7061]) +13 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-lnl:          [SKIP][232] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][233] ([Intel XE#656] / [Intel XE#7905]) +59 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-lnl:          [SKIP][234] ([Intel XE#9125]) -> [SKIP][235] ([Intel XE#6912] / [Intel XE#7375])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-lnl:          [SKIP][236] ([Intel XE#9125]) -> [SKIP][237] ([Intel XE#4596] / [Intel XE#5854]) +1 other test skip
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-none.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
>     - shard-lnl:          [SKIP][238] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][239] ([Intel XE#2763] / [Intel XE#6886]) +5 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-lnl:          [SKIP][240] ([Intel XE#1489]) -> [SKIP][241] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>     - shard-lnl:          [SKIP][242] ([Intel XE#1489]) -> [SKIP][243] ([Intel XE#2893] / [Intel XE#7304]) +5 other tests skip
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-render:
>     - shard-lnl:          [SKIP][244] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][245] ([Intel XE#1406] / [Intel XE#7345]) +2 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-render.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-lnl:          [SKIP][246] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][247] ([Intel XE#1406]) +4 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_psr@pr-cursor-plane-onoff.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-1/igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-lnl:          [SKIP][248] ([Intel XE#9125]) -> [SKIP][249] ([Intel XE#1127] / [Intel XE#5813])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-lnl:          [SKIP][250] ([Intel XE#9125]) -> [SKIP][251] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-lnl:          [SKIP][252] ([Intel XE#9125]) -> [SKIP][253] ([Intel XE#1499])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-lnl:          [ABORT][254] ([Intel XE#8963]) -> [DMESG-WARN][255] ([Intel XE#8963])
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9088/shard-lnl-4/igt@xe_wedged@basic-wedged.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/shard-lnl-8/igt@xe_wedged@basic-wedged.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
>   [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
>   [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2682]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
>   [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
>   [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>   [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
>   [Intel XE#7008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
>   [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
>   [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
>   [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
>   [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
>   [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
>   [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
>   [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
>   [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
>   [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
>   [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
>   [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
>   [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
>   [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
>   [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
>   [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
>   [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
>   [Intel XE#8654]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8654
>   [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
>   [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
>   [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
>   [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115
>   [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
>   [Intel XE#9127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127
>   [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
>   [Intel XE#9129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129
>   [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
>   [Intel XE#9191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9191
>   [Intel XE#9204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9204
>   [Intel XE#9205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9205
>   [Intel XE#9206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9206
>   [Intel XE#9219]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9219
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9088 -> IGTPW_15818
>   * Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -> xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d
> 
>   IGTPW_15818: 15818
>   IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada
>   xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d: a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15818/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
