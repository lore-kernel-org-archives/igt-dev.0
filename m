Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DED2FF8875
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 03:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A4910E08B;
	Thu, 30 Apr 2026 03:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2gpBYZx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B64510E08B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 03:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777520235; x=1809056235;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2X9GDkBcF28UNnzncj0hZCCcZibYpeFZl1+i4zl6POU=;
 b=n2gpBYZxnFyisdjrd3ENZeyTEK30QmvToycTl6YXQdth3N51HcgIFilJ
 IVpj3lCrQB90P0suTV0ynTBLww/rD3orXhII24e3mjNfTuj0CBmn5QiUu
 jYhmlWUSpIanZXuhINrh8DuIsfUG9gA3xsUZx33BXLSPBgQQzPkvA+tzA
 BWNvpDr4DWiZydARlyar20llJ7jcZx4j8TjyaUMum1/hLqWa3EfYoXBzC
 O3aqAG2Jjt9Uicwf2EvKX6/V1NPM8/7CQ7rGcmD+efKVTaMf6h5jVi46L
 8KtDWaX74Ya8iq5So6y+yQj2Gywv7jO7QeYZjMx6PZy5i9huN+PCr/8Ko Q==;
X-CSE-ConnectionGUID: Eg45anRMTGqbWPxLU75djw==
X-CSE-MsgGUID: yFCByIwoQIeSqFqBIsu7Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78380273"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78380273"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:37:14 -0700
X-CSE-ConnectionGUID: MRc8c6rqSWK90s7Fp1c60w==
X-CSE-MsgGUID: uUyS5aSVTVqC36MEOnTbcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233615500"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:37:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:37:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 20:37:13 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:37:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emtdjHU4vyR+Ky2PmnxGzEl4g7EVTxEqdYxmNZWNnxCM8JE3xdWR1tZKRT680JcJCbv8bq7elGfR1l0jkWZB1x+3V/+AHCEjvVkMbQjOu5GYzQneSENnpYHSDmK/leTHj2MtMIGXJqEHYGCjWd+iAjrUz02w75KtKjnMY9AN2kyjl6kxI8wqlAmrItRrggYcLwjajoTSrZczleuwkNyMDmCwvKZ59KPlTe2Usv6UWdFqDca16s9H718dvYdV6idXs6sj04PWoblwxack4FTMcH5vZ/OsS6HLb4qkeqohpJH4UT4095nmK9eb+w7y16EQO7TKC7o55d1//ZuDip1FEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5h9ziflhOShKvOy/UupPROjdAep9USh36iONKSBToXQ=;
 b=F0zwZzO7O438abG+sbf5oNTGCeTG3JOkwBGvoFAH996Rp263Clx3gn/uVppbqUCiBxOrasRtFAs6xWyPDbERWLwSq3iL9bxl5cr+b4TMHJsZWWdRvdnLn/0xzeaPHmbapAMycNPwiIA/BiSE52RDZJwEQiTlUrZ1Gi4gxwz4FnbUHKFLu+FURJUZfBtf5wM/z6cLfZL4dDI3iTW/ack2P2uR3h+F5NkGuRKsrSYKVvIaeS3Q9MCkYKpMwZrHW1fNaOOvN63h8Y4fILaarob3oNlEYIqOYPEudubBiT5j+EmEBdQQw68hWLwNnc/DQAdI/ijCaxUGBmQByZCUoP8jMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SA3PR11MB9485.namprd11.prod.outlook.com (2603:10b6:806:45e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 03:37:11 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 03:37:11 +0000
Message-ID: <d37a835b-69e5-4eaa-a6d8-fd98b02df74a@intel.com>
Date: Thu, 30 Apr 2026 09:07:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 03/11] tests/intel/kms_frontbuffer_tracking:
 update the outdated fbc status reasons
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <jani.nikula@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
 <20260416092559.88735-4-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260416092559.88735-4-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SA3PR11MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: c24ebba7-1a1b-47e7-5204-08dea669c2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 7QMOYUaN5TgJsqYZdxTbYEcPWRBrPAea+8WgjdT0/byFjqOSFmEKT51fYIHb4K0BGCM9iVJAkABAPgfEd68aPc3MX6IFQzqGw+Mdi5N9lPWim5hsa9HeL31ploCJ+7tJNQ+YK1h3LSjhq/o4w5lry4WQKOSIq1/lzEYLfVh5NaRqy5bx5fjARwf20PUcQBkE4+q1uPb3k13ypJqBvTvG/a6tAcjiaNMcX5Fc40fuyY9fZniIUdInYFAKlgfmsyuzQYASl1CMwpWgAqCzProV02met410J50x/wLfGABr15X2EuEclj2N405R/jvKTDalmPG3LjIxi7JT3ojTsfvPXCwz1VlKejjfnDKAnzVWhmViGxFhvdLdxNVR1dW2AelXJBkq8s+uXZEzxKwvIVRo4hRNY3C0U3WbxCbajvu2aNmMPxZFyT+b5ECkD/y69UTp9mjhpGcPyp0HWpOPBJxVG310VtlisIZpiR2918iAHwUQfirrw33tzkWC0lUnleYXFuPEkjMTKmCUJ9piQNdcbHCJ8PFJxzKXtJNFQVQWjxCJs1V+3LsuQ8yzbh9eO/nAGxi2CKIc2sqQt+jN/QYVdvqAyohLhYIt2UoKj/94Z6cb1iR/wgCfpbaS2E+0imL3kbNDTztH3TYfYotoS5Wvui1bXcFgn/cwp0paU0EcZBRMPhvrmrU0pXS/Mo3IBRN4CMgzWFQJIHDeryYxBG1UHb8ly371dlYpqm4Wl8ZUPrU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUNydjhQSHNoY0dKcjY4N3ZMTEk2K2dyb3JTT25xRitBL0l6QVJJRFkxbFlY?=
 =?utf-8?B?Qk83REludEN0OHJsS2oyZUFiUVVtUThaUmpobXRpV0NpYXF3ZnJQSm9vMDlM?=
 =?utf-8?B?Wm90S0JGUnhyVWdTL2lHYzNneE9TS2pTV2QwS1BoSmpxanl5bkNQUzRjQjM3?=
 =?utf-8?B?Yk1Mc2Z6aEIvSlpWUGkxeXY0ajdqTVRNdC9sR0dHaXl4NUpaMDBCLzI4RkRN?=
 =?utf-8?B?TDB2dTZaYzVmckd2THpkbjEwTWorRVdjMCtiWEMxN3BQK2NMY2xDL1V1dzlk?=
 =?utf-8?B?eHlsbmhWN08yU05PTXQvWTVHS0xtOFZxUWNnNmQ2ZDJVMCticW53ajl2RHNT?=
 =?utf-8?B?cEttNCt2WklXaExDOWtZWVNiWVpvUktoUjdZSytnVm54d3VtS1Z4RXVhZ2RP?=
 =?utf-8?B?NFZFbkg2eHJzMWxtK2Qyb1hseTlKbGFZQ3c5QitjUVd2SndXZWlUeFoxYVRw?=
 =?utf-8?B?ZnRiVGdkMm4ybDZVZk4yQkptZGNVYTV3dDdmbFpvN2ZGdWNxS1gzZTVzcW0z?=
 =?utf-8?B?MnZWWmtiQi83OG83NWI5eTNQZkVoL1QxaTlhUjNvNzZWMlZOTXJYcXhjM2xG?=
 =?utf-8?B?ZEFBSWJQa2dIbjJWTlMyaENyeU5Ed3lLN1hKQVRxaXpnOW5BN2JQdGdoNlRh?=
 =?utf-8?B?R3F1dUpyY2hENGpqREQzNXhGQTNmMy91ejIvWFZWUVJUMHFQUGQxbWFVV3My?=
 =?utf-8?B?RHhCemVTYlhuM1JVbnpTRExRZWZSY211a0xCT0xNYWoyYVVVS3lNTWpnNjZk?=
 =?utf-8?B?UHVadVVIMFVNcStVRUdYUGNNYjhuV0RaN0J5UHRIbjRzRjQ5aEgrRmQvYW43?=
 =?utf-8?B?VWxSbVNxeWpUSzdqMjVWRkt6aW1BQ0x6OWY3MTdxamVsVk15WTZxQ3NjOGI5?=
 =?utf-8?B?UDJpSGpSUVNycXV1MW9qRWFCY2hoVHpZYmIzbDVVcW04K1FsS3lNTHk5VTc5?=
 =?utf-8?B?MVdRbEs1WExHbEpBbitCWFNjOTZVbkQrclQwVElpd1J6Ry9BbkZmN0xkRURx?=
 =?utf-8?B?QW1qTTFBOHRyS1ZseVdhQVBPV1FjOGZwTjdDUEhjNDN4OVpKcElBM2lUbnRL?=
 =?utf-8?B?MUpyWndFbHN0c3VWU0VkWnF2OG5kRXNhNThEYXFxRjVnaEp5V0hOMGhqVVFu?=
 =?utf-8?B?WHFreXVtdkxBWm1GMUYyVjVZdWtnM1g1a0YvSktWNFpsSWVFWlRsRk5HMEdX?=
 =?utf-8?B?c3NtNXVjemRIUlVJc0g5R1Y5UzFLRmNsWVNOcEhTbG1oV2EraWhmUUJUc3A4?=
 =?utf-8?B?Wnk4Yys5eUFhTVJUcTZXdlJHZEg3cUNUVVNXMXc5a0NOTVRtNDZuR045WFpr?=
 =?utf-8?B?QTNCTWZ4anJjWllBc1JYVVNxcHB5ZDd1K0k0ME1ORkhGZ2p1b3djZXNxQ3V0?=
 =?utf-8?B?RGFxaHpVUzBPWkhnRXk4TEVnbGlOYUcwS1NqT1A2NzNEZDVGUGpPLzVrd21r?=
 =?utf-8?B?YnArZTVkTGpOVGNLaExrTlBJTmt5bGozRW9JYVFQZFF0TktSV3B3WU1aQy9k?=
 =?utf-8?B?dTNUYk13R0h3K085SGkzeFdsQ3E0UDh4M3lLZzB1QXQrbCs3MUptdzZNcEZT?=
 =?utf-8?B?bkpBaDB2eElUY1Bpd2Jubnp0MkpnMWF3KzBqUEtadmlZc2V5Rkx1YSttQXVE?=
 =?utf-8?B?c3F0MVZUUUpnMmtiOGV4VFZlNVJKRXVqejZTYWw1K0czdHFGQVFLTXJlb3ZC?=
 =?utf-8?B?ZDFXVDY3L2dYWXdDYU04c2lnNDdHQWlFaEFmN21RWncrRXVlUzhFN082Nkd2?=
 =?utf-8?B?VmhWd21TTStrWnFPaUlRMG4wWWhnaDlQRDQxdStzR1ZRZnBUTzQ3cXhZNHQz?=
 =?utf-8?B?TjJXUDVDZFFSbzEzR1REVCt5SzlyWnpEQWh6NjVjeFF0ZjRDeFlvTUtQVGRu?=
 =?utf-8?B?Tk5haFg5R3N1SkZKS2RGY2lXZ3o2WVg3c3g5TmJjUGZUakhhdzFGNlg3a0xr?=
 =?utf-8?B?RVJVVi9EOUcyZnhRdzN3YkhHajkwaDkzSXc2clRsMmVkeEhKbFlDTmIzbmpx?=
 =?utf-8?B?WnJnM1dRSXVUN01MQkZHbmFjUC9NbVpyQyszcXdOKzVieHJHNWpuazhWaTUy?=
 =?utf-8?B?MEZoditWdG9DZEVRTVRlcndOQVlxUnVRbjMwajNLR0FjM3EwQis3YVJvcnhY?=
 =?utf-8?B?UUlITktmODV1RkxjamtOWXhTSGE3VnNyb085OEM3ZEZaRDJRY2hCbFFUYkhV?=
 =?utf-8?B?WmpwcHg1TGNxcHd1cngvOS8xVVdsbDJlcG1pOEVnS0VYOXRhNFVJZktleEtT?=
 =?utf-8?B?T3czT29ZTGFxWGN3SWhWY3FLYXVFSkp4MG5lck9FZ1RJb2hXN1RDOSt0a1Ix?=
 =?utf-8?B?cTlaOENoWm16aDRpb0xkMlR0UktXNmVJWFo0UXcxR3p2RHJFRmdEY255aGdP?=
 =?utf-8?Q?ZTSPBU0OaYlJqZyIeMrABhp1G27xCBFcRkKbR?=
X-Exchange-RoutingPolicyChecked: iM/uWKI+afjIkrMK2A8S8TQVgLSWBnkl+VKGdxpGSQz55fufPnYLjNiU1hzGuyOAElprbCK7IktvfoX3HGGjVhCWByBIo8ChuZlX6oOPoSBVek21FfsOYPoOroOlGIcTNRI75kgQywLsX8gpdtjqE1n25e+8kpuU9d0h7OOwAtIEz12ulMcJIlPGisJ9Yt3ZYQW7YsnzYgY27XBdBJ+afZMHDClgOkklEj97uTruK/yH7PEN+BQd5owseTUjrAfrs+sjHlhBiuZnQ5LtIxeWOvyoOYmIeyMuUDCdkx/LjqjK5X5J4+G/x9AnG69FZi+MkqvP0mmfSa1cdVhXhwd6rQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c24ebba7-1a1b-47e7-5204-08dea669c2ed
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 03:37:11.0800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HetGA5wBo3opbbFHFT5UJwdF6cFVWuQZm6EhRzQcaVjeuvEYC7mozDwhnexRVxvDR+He50Hl6R+gpKExGNaKoH5gAgo7DDlhcYYRxOa/W6nP7cHwpEGQO5H6e5uypBxG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9485
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



On 16-04-2026 14:55, Vinod Govindapillai wrote:
> Replace the fbc status check for "mode too large for compression" wchich
> is no longer being set by the driver with "plane size too big" and
> "surface size too big" fbc status checks.
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index b01959d2c..5bdfbd105 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1667,16 +1667,25 @@ static bool fbc_stride_not_supported(void)
>   
>   	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	return strstr(fbc_status, "FBC disabled: framebuffer stride not supported\n");
> +	return strstr(fbc_status, "FBC disabled: stride not supported\n");
>   }
>   
> -static bool fbc_mode_too_large(void)
> +static bool fbc_plane_size_too_big(void)
>   {
>   	char fbc_status[128];
>   
>   	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
>   
> -	return strstr(fbc_status, "FBC disabled: mode too large for compression\n");
> +	return strstr(fbc_status, "FBC disabled: plane size too big\n");
> +}
> +
> +static bool fbc_surface_size_too_big(void)

Same here, The next commit deletes all this code and replace all this 
with intel_fbc_found_skip_reason(). Imho, we should squash this commit.

> +{
> +	char fbc_status[128];
> +
> +	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
> +
> +	return strstr(fbc_status, "FBC disabled: surface size too big\n");
>   }
>   
>   static bool fbc_psr_not_possible(void)
> @@ -2362,7 +2371,8 @@ static void do_status_assertions(int flags)
>   	if (flags & ASSERT_FBC_ENABLED) {
>   		igt_require(!fbc_not_enough_stolen());
>   		igt_require(!fbc_stride_not_supported());
> -		igt_require(!fbc_mode_too_large());
> +		igt_require(!fbc_plane_size_too_big());
> +		igt_require(!fbc_surface_size_too_big());
>   		igt_require(!fbc_psr_not_possible());
>   		if (!intel_fbc_wait_until_enabled(prim_mode_params.crtc)) {
>   			igt_assert_f(intel_fbc_is_enabled(prim_mode_params.crtc, IGT_LOG_WARN),

