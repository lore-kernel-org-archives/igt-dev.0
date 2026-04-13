Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A070AF531DB
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 22:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5745210E15E;
	Mon, 13 Apr 2026 22:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WI/UNog5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5E910E15E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 22:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776118596; x=1807654596;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7swP8NbWmALt3Jl5c3mlLO98QWOhz1Swh1Qrky4hKU0=;
 b=WI/UNog5aj9z9j6Qo4vGtlLv7BYOeOBf+B8e8Oo9aZFfxhJ3353BTin/
 owTuqkxPgIlODEuiJpXTXJK9jSp/zfIEDFS+EBYX7WmpJavm3gH9mG7+F
 G3g39sj2S3bd4VzAxdlG23XUabTfj2GpLUZIdzF8UePMYaAygW2O+hmOR
 E5rP+JVsbBSk9SorQhAH7bWVkp3jgP8noRWCuk/n36NAUZdSaGskL18G2
 hVcz0hWs5URo2ueWo+iOeEPaqkmqwC770mnNKvGnNZwLxxXGXEqmgbDdf
 MWBYXMyIk/i+AeoJuEIxQkgMindaGQ+UIu/NPc7VR7PFJrijFClVCLFW+ g==;
X-CSE-ConnectionGUID: qRb1DnO/S5evVmzfGJ+Lsw==
X-CSE-MsgGUID: YRINhTJZSxGFBMaUktaD8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="64599007"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="64599007"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:16:35 -0700
X-CSE-ConnectionGUID: E1pIyLnGSrqGwNxMwMkNwQ==
X-CSE-MsgGUID: 3RhF6pCVRDW9wC2FM6AsyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="253292533"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:16:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:16:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 15:16:35 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK+6lIbhFJDMRDinOLw2SMrsfjCP14w2zDDdNjD4mCOmoxJrjNKviQYHde6g0n1uuWMv3X2WvU4YETNn/FYEzm60y25WM+T3sfwIcpi5rEzPMzMHGJUaPYEVt2AyVx3fsqH7GgxzMiXBytHdEPYj09iloeXULEfsXwiNtppxB2biD/17A/INxr2i5c8OOucm0rpJNr0LDVzsKRf9zYrrnHSD8IiipwFZyPJ1EaoFi2EdfzfoV9ZJIXJ1qoxrdemn8ADPMmiH6UWKtt2oykjSR4+hj+EX/CyPqdvAMPFq+kZyxlP7GjEimv98spfLQX4QigZwgWxZ43Vvul6Zueopfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9W36Ykr/dcc5aN3xUIc9jreRbHYGolLMxOmAFNyE9Q=;
 b=QHVpIAR83/CyvqhddlNCo50NURSTStHHAdHLGSB+mjpf9LMOMd0PY/7qgv1Zc7++7uq6RROmTHp7jIIsIUIvYzJi4h0H266FEddD0x9/uGMCkxUpwEn7hyL3roS1QviYVQfrTNJmP+5UwEZ736yrkM7v22UijDocoxpQ8gLZgscKyqXCiCm/rSj/GNn8svLDgeBexI2YfpuUpbqGVGlIGtVAp79VN/EMKyRzqCghmRw19oz6AtD45V/IZYXzoz1Hcd5oJA2gMR3kXX11BCdZ2qEczI44y+zi5ZNI7CJ1gwl+lsXFlc06P8IEYWqvK2VLZdY7FlCClq5rSCDci5iPNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 22:16:32 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9818.014; Mon, 13 Apr 2026
 22:16:32 +0000
Message-ID: <6d90e43a-94f4-49d8-8b71-f6e7bd2637c8@intel.com>
Date: Mon, 13 Apr 2026 15:16:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] tests/xe: Add large VMA range tests for better
 coverage
To: Brian Nguyen <brian3.nguyen@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260406184226.1294486-6-brian3.nguyen@intel.com>
 <20260406184226.1294486-10-brian3.nguyen@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260406184226.1294486-10-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0187.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::12) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SJ1PR11MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: 50128060-858a-4550-486a-08de99aa5136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|42112799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: b2Mj5UwvSOY8MBAyqTEY6SnwK91472Vcs1lTwYkgrwakOKOxIdbgEY2CYAGQ5GCBSDgo7G2Hd0Ooc9AKRFMe7uN/BbYu5CmNcLIDL4Q0v4yilzkOYx/tHKTUkrFGuoTYc6LMY1/PyjsvgLVcWK6CbdSVWYDlw1QYKjx4UP63ZW1KPISHUdk7tidqwK7IY8C85WFdj8fAMpi8xo+UcgYsA51JvcJFplM2+xIik4tms17+APqNwjBOHD5XXb7XilOoAGGqc+zcJ5o32ZgYAhnY7nBLLARls5VQ4peUlMScV8yDeMVatW+2iQ12hcouNkC7YJzGnLUHCgo0CoHvdSzhvlXz2nQWN7vjNoz+Mscp/FK9m6WFHgc8mZkDL3FMbMRZ7eRcbydhr0+47yfwn6lczNJdeXFpZb1LOS53CVZnw9RKorVGrnhqRQUfNP/t0vKliG/2vLCgloObOWcL0L7sqXfuf5NceBteZdDA2bkfo1JkQLcLuxPHbIEqfYk4LgaCvdFXCjE8LWhdbCCN5VHyUDbpea369B6WPygZgL47tOXkL2LRglicT9lgFuCizbRnKF+FnH1alrbpe0ETppKFC8q67EleoTWvyc1t4ljeMQArV59TTUi7uhphBkmEzGnnKOwbkbgAr28eYqsyd5dWugfkxFDkwFZ4DDaRZkjSw9+UT3dIxGEM+tuIcdatekvQWHL8jwafnHbd3qL8TKIa/2OLffgfzC40Gy6Do45gDFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(42112799006)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnovZzVJRUhod05zK0FkTXZxcXVOelB3cmVOaXlMbzBmbGN4K2dmeW1FU3ZG?=
 =?utf-8?B?THh3OVFsS3AxU1JlSGM1d3hCYmNWNkRXb090ZXNwbEFGbGxaQzZ3alFZOWs3?=
 =?utf-8?B?V2dGeWg4WWRValBPeU1lL0hueVQ2ZHdEaEFXanRYTU0xNjE1OGV2WW5jNEVJ?=
 =?utf-8?B?ZGduakRlZzZzaHd5YllibFdVa1FpdTFKd2U3UHdrN0FQSkRNeVdrOHZyZ3pW?=
 =?utf-8?B?M1RYTGFCZnhxV1RYL1BPNUtVRFZ3c1BOVFVUd01Ca3hnRjY5Rm9Ua05MWEg0?=
 =?utf-8?B?dEMvSEMvWmt3Y2xWUm0vc0NjVTNqcE9wOTFtanhRZU1WTXkyYXZDR2tiKzV1?=
 =?utf-8?B?K2lmd1c0WEFwVjAzOUVxQ1VSWjFLRjF1QWM5S3RQVi9PVnRuS3lYM2I3T1Qx?=
 =?utf-8?B?bGNpcDc4bDBWWWNDRDc5UG85MkZjWnlVMU43N0wvaSsyTkpHUDl6VG52Qkpi?=
 =?utf-8?B?T0J6bXpSdHRWdmR6QVlXaWlFSHhoTmw2WmtmdFdMbUpPTjUwVlN3T0ZhRGRy?=
 =?utf-8?B?Zk1CUGhaaFBBNkJhTXhOR0FCdGRod2ZHY1JjNHM5SXlvYWdUYW5yZkpYRU9s?=
 =?utf-8?B?aGNGOGhQdFpEcUNGM0RnNTNadUJyMG1WcG9qVnZZN3RxTzAzaXp2MVF0aVBH?=
 =?utf-8?B?ZEdFVHBTY3h2TW40M0o5VWgxa0pDQXIzUjN5V25ZcS9VUVFUZ3l4THUrZ1d6?=
 =?utf-8?B?cXVLZVpVS0ZXbk9FbHVveE94aXdEWGxkM0J6YXRXK2FrYldSZUhwUXdUaWMy?=
 =?utf-8?B?dTlLVHNTZXVOdmZDdnBTZEFxTGFIWHhRZTQwVWF2RGVOZ3lhOVl0M2p1UHdZ?=
 =?utf-8?B?bjVhajlEK3JWa2M4QnBkL2djWDlxcnhhdUVjMVF4b3orNFRZd2V1RXFHVEhl?=
 =?utf-8?B?SHFKVU95dWlmdmNXZkxOTU8rS2NJY0VScmpiaUlvTEZDbFFsdUtvaDRkWmVD?=
 =?utf-8?B?ekxmZXlvWkFKbEI2ZmVKeG0zT0VjTlJhZU04Ym0wbFhQd2hlYmowd2VRUEFo?=
 =?utf-8?B?UUR0K3RtOEQzd21uS2NkaENkN1FraHk3enE1SGtuNHZaajI0TWl4azBNVVVv?=
 =?utf-8?B?MzRXUXVUaDFFdi8zRzBIaU1JT3haekN5RmpreHhPcmRHMXN2Yzk2QUdmekZH?=
 =?utf-8?B?bi9KRTZ1WFZzSDduN3lIUGVCbGZBelVWTXQ4QXVpZGxZTVBTaldQYm16eXZx?=
 =?utf-8?B?K25Jd0VrcC8valljV1cwVHZIbkdUUlhiNGtmMHhLZXptZ2s2UUlZcXlVQ1g4?=
 =?utf-8?B?RW5hZEw3TXNvNDk2dmRYUVd3R3ZpSExhdUh6N3dtNFo0czJXNitHWEk0UTYw?=
 =?utf-8?B?ckJwNll2YmRIbGszYllFUXgyZGRQOVpyZmxFeWxjS3ZIajc4SUQ0bWpQTnFj?=
 =?utf-8?B?NnB6bXRqQ3ZvK29pLzdHd1o5eUhoVnRZVkx1dEJKNXhRWGlOY3VkUW5DekhJ?=
 =?utf-8?B?TGJKR2lrVEVLVDhRSHg3dmNRK0VUb1VEK09DV0RidFgyUkZUTkpWNFZNbFJ0?=
 =?utf-8?B?M2VOOXUrNDJoNnpINXN6dE1pcll0VDNNZXF2R1BUQkpkMjhpUU5DaUZ1V245?=
 =?utf-8?B?RDBDQnduaEV6QVRjTk04aDEwOG1IaWxDczRueUZBbnFiUnA2M0JXWU03b1h1?=
 =?utf-8?B?VC9MbFpZSysxdXRyRTZaMVEybUZiVExKellCVnlwOWw3NjcrMjY2dGwyVjFh?=
 =?utf-8?B?YzFRak93Z29VSEc5b053dHcvQ1NnYWZ6NnB4SThWY0RVS2w1SG1yb3ZFRUlk?=
 =?utf-8?B?bXBDS2hSZXI4OGttdFh1cXNmY0V5S0hRZXFtUWcrd2N6NmtyaEVSUUtERVBN?=
 =?utf-8?B?Smw1RWN0dCtKU3NtZkhDckVrQmpwTTdDR01RWGViZGxtMnNFNlRIOUFBV0Vw?=
 =?utf-8?B?ZERoQVRqU0daZU5uUW9aYkdqQzR3c1hKc3hmbFYrWnpqcFM2VjJzVWRkSFlQ?=
 =?utf-8?B?aFp6VGp5VkJ0Mm5GVHFJNURCVitEcy9PZkZjbkVVYVM4UUNWUHgwRTlyaU82?=
 =?utf-8?B?ZmI1UkkwRVdtaUIyQi9Obm9GLy9QS1RjUVhBMTdYeFhnVVhlY3hpaHYwOVpD?=
 =?utf-8?B?bE1ydm5MdkZpd3VTVmVOR2E3R2J3TXVOV3V2bnkrTGw4dlFoNzBoYlovT0V3?=
 =?utf-8?B?WTJpZitlU1I3NzRKRytBd1JRVThibkhmeS8wMjZtbDZrbm1pY3NoZDdRdTM2?=
 =?utf-8?B?MFVhTnh2ZjF2T2ppaDQ4UWxOekk0TnZsdHZvdHFoRVppbnQzMU10OEEyMDd6?=
 =?utf-8?B?ZE9Yay8vUitzSjhHdVZvTXgzTC83MytMQ1JQNlhzWlA2VDdZUHQ1UFpRL1VL?=
 =?utf-8?B?NkFTcU9HVE1EWlZKd25MWVU2QytRZFExNFc0dzIxUkRnck9lQmIvZz09?=
X-Exchange-RoutingPolicyChecked: vCkPThFvwRVfPzrhDsi7I5K8AqfBltyldpSkX/iDS3Zb9xa41/SGplMEQZSkrF1EvuptaRtCGqzT/iQ8EMWXE+1Ey+LCUMZlK/y1esLI9i+GsS56yqaRGF6R2J6F5zANH/IfPRRRojBDexup8i0S3fiXK9n20AXrJvMFYaL5mHCaAJA+Zca1bCZEm3cT2rMj2BeRlbBtsUHBQgWU/1zJ3tN0ci2PrTyJzEL1+c/cvSge07L8bBsbbE6GFsJr+pRo3+8iVNQDaWiGxvhwEcLviBqPOc8MHrEPbOZvLKuIqPQYidDCGDDdBMLRrxkk+oEQBUT2pktDYxtTgBgIJ/GT9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 50128060-858a-4550-486a-08de99aa5136
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 22:16:32.1217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pITOurS+Ogq3l6mZjIxbL6UJyoLzzWQlhe30IYILM9off5lJsqtVakTIeUKUMW9Bk8pF9HWrs3pk4EzbxDjvsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6201
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


On 4/6/2026 11:42, Brian Nguyen wrote:
> Add tests that require multi-binds to ensure that the handling of PTEs
> are behaving as expected even in split VMA ranges.
>
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---
>   tests/intel/xe_page_reclaim.c | 147 ++++++++++++++++++++++++++++++++++
>   1 file changed, 147 insertions(+)
>
> diff --git a/tests/intel/xe_page_reclaim.c b/tests/intel/xe_page_reclaim.c
> index 6cc29d8d3..3bd44285c 100644
> --- a/tests/intel/xe_page_reclaim.c
> +++ b/tests/intel/xe_page_reclaim.c
> @@ -107,6 +107,20 @@ static void compare_prl_stats(struct xe_prl_stats *before, struct xe_prl_stats *
>   		      expected->prl_aborted_count);
>   }
>   
> +static void xe_vm_null_bind_sync(int fd, uint32_t vm, uint64_t addr, uint64_t size)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = syncobj_create(fd, 0),
> +	};
> +
> +	xe_vm_bind_async_flags(fd, vm, 0, 0, 0, addr, size, &sync, 1,
> +			       DRM_XE_VM_BIND_FLAG_NULL);
> +	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_destroy(fd, sync.handle);
> +}
> +
>   /* Helper with more flexibility on unbinding and offsets */
>   static void vma_range_list_with_unbind_and_offsets(int fd, const uint64_t *vma_sizes, unsigned int n_vmas,
>   				 uint64_t start_addr, uint64_t unbind_size, const uint64_t *vma_offsets)
> @@ -623,6 +637,130 @@ static void test_pat_index_xd(int fd)
>   	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
>   }
>   
> +/**
> + * SUBTEST: binds-large-split
> + * Description: Bind a large BO (256MB + 4K) split across two adjacent
> + *      VM bind operations at non-2M-aligned boundaries, then unbind each
> + *      range separately to verify that page reclamation correctly handles
> + *      split binds producing a mix of 2M and 4K PRL entries across two
> + *      distinct page reclaim list operations.
> + */
> +static void test_binds_large_split(int fd)
> +{
> +	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
> +
> +	uint64_t bo_size = SZ_256M;
> +	uint64_t split_offset = SZ_4K;
> +	uint32_t bo, vm;
> +
> +	uint64_t addr = (1ull << 30);
> +
> +	expected_stats.prl_4k_entry_count = 1;
> +	expected_stats.prl_64k_entry_count = 0;
> +	expected_stats.prl_2m_entry_count = 128;
> +	expected_stats.prl_issued_count = 2;
> +	expected_stats.prl_aborted_count = 0;
> +
> +	stats_before = get_prl_stats(fd, 0);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	/* Slightly larger BO to see behavior of split */
> +	bo = xe_bo_create(fd, 0, bo_size + split_offset, system_memory(fd), 0);
> +	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size / 2);
> +	xe_vm_bind_sync(fd, vm, bo, bo_size / 2, addr + bo_size / 2, bo_size / 2 + split_offset);
> +	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size / 2);
> +	xe_vm_unbind_sync(fd, vm, 0, addr + bo_size / 2, bo_size / 2 + split_offset);
> +
> +	stats_after = get_prl_stats(fd, 0);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +
> +	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
> +}
> +
> +/**
> + * SUBTEST: binds-full-pd
> + * Description: Fill almost an entire 1G page directory (1G minus 4K)
> + *      by splitting a single BO across two adjacent VM bind operations,
> + *      then unbind each range separately to verify correct page reclamation
> + *      when most entries of a page directory are present, producing a mix
> + *      of 2M, 64K, and 4K PRL entries across two page reclaim list
> + *      operations.
> + */
> +static void test_binds_full_pd(int fd)
> +{
> +	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
> +	uint32_t bo, vm;
> +	uint64_t addr = (1ull << 30);
> +
> +	expected_stats.prl_4k_entry_count = 15;
> +	expected_stats.prl_64k_entry_count = 31;
> +	expected_stats.prl_2m_entry_count = 511;
> +	expected_stats.prl_issued_count = 2;
> +	expected_stats.prl_aborted_count = 0;
> +
> +	stats_before = get_prl_stats(fd, 0);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo = xe_bo_create(fd, 0, SZ_1G - SZ_4K, system_memory(fd), 0);
> +	xe_vm_bind_sync(fd, vm, bo, 0, addr, SZ_512M);
> +	xe_vm_bind_sync(fd, vm, bo, SZ_512M, addr + SZ_512M, SZ_512M - SZ_4K);
> +	xe_vm_unbind_sync(fd, vm, 0, addr, SZ_512M);
> +	xe_vm_unbind_sync(fd, vm, 0, addr + SZ_512M, SZ_512M - SZ_4K);
> +
> +	stats_after = get_prl_stats(fd, 0);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +
> +	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
> +}
> +
> +/**
> + * SUBTEST: binds-null-vma
> + * Description: Verify handling of null VMAs by creating a VM with real
> + *      BO mappings followed by a large null VMA mapping, then trigger
> + *      page reclamation across the entire range.
> + */
> +static void test_binds_null_vma(int fd)
> +{
> +	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
> +	uint32_t bo, vm;
> +	/* 512G aligned */
> +	uint64_t addr = 0;
> +
> +	/*
> +	 * Layout:
> +	 *   [0,      2M)      : real 2M BO   → allocates the level-3[0] subtree
> +	 *   [2M,  512G)       : null VMA     → fills the rest of the level-3[0] span
> +	 *   UNMAP [0, 512G)   → walk covers exactly one level-3 entry (512G each)
> +	 *
> +	 * Only the real 2M BO produces a PRL entry; the null VMA has no
> +	 * hardware PTEs and is skipped by the page-reclaim walker.
> +	 */
> +	expected_stats.prl_4k_entry_count = 0;
> +	expected_stats.prl_64k_entry_count = 0;
> +	expected_stats.prl_2m_entry_count = 1;
> +	expected_stats.prl_issued_count = 1;
> +	expected_stats.prl_aborted_count = 0;
> +
> +	stats_before = get_prl_stats(fd, 0);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo = xe_bo_create(fd, 0, SZ_2M, system_memory(fd), 0);
> +	xe_vm_bind_sync(fd, vm, bo, 0, addr, SZ_2M);
> +	xe_vm_null_bind_sync(fd, vm, addr + SZ_2M, 512ull * SZ_1G - SZ_2M);
> +	xe_vm_unbind_sync(fd, vm, 0, addr, 512ull * SZ_1G);
> +
> +	stats_after = get_prl_stats(fd, 0);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +
> +	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
> +}
> +
>   int igt_main()
>   {
>   	int fd;
> @@ -674,6 +812,15 @@ int igt_main()
>   	igt_subtest("pat-index-xd")
>   		test_pat_index_xd(fd);
>   
> +	igt_subtest("binds-large-split")
> +		test_binds_large_split(fd);
> +
> +	igt_subtest("binds-full-pd")
> +		test_binds_full_pd(fd);
> +
> +	igt_subtest("binds-null-vma")
> +		test_binds_null_vma(fd);
> +
Reviewed-by: Xin Wang <x.wang@intel.com>
>   	igt_fixture()
>   		drm_close_driver(fd);
>   }
