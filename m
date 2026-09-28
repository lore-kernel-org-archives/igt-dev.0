Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04452CA5FA1
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 08:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB3A10E8FA;
	Mon, 28 Sep 2026 08:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWyBieQ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3818F10E8F8
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 08:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790585383; x=1822121383;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WaLnHQjGrQnA0u0o0/NUxCCaM6Ssoyj9hm7aRhHsP7s=;
 b=dWyBieQ55oRQ+oB+2xdYSd9/dgDdKrMv4T6xb0kg8WsvizJ0IOSTasq3
 X06WpTjYdkGfASPjqWb8AyNOXH3i11Wj7/CrD+McbKXb+x8hAUkQ5kCU2
 NFJJIGFK4iANCtFCwb+dFEYP4vYuXTCyIYcgFEzSuc/zKmzxsqYIXS0bE
 1MO4HH2E/XHC+pb+CUa1ZgeUc/DK4FnaKy05c+l72pJbs4J8lvxMIT+d3
 NrInVK83xVFoOi+gtAaFIfBwyjQVE8n2S2KydWBh5Qz8J43iQexNOEPHy
 YNcA7vENmQJRSi4vU3jkP1K0obQp42ipWnc/V4Ln6hZM82zLkQAs+Q3J3 w==;
X-CSE-ConnectionGUID: nlnrkD2YR5257i3EFM7v1g==
X-CSE-MsgGUID: 4enup6Z1TiexZeohq1iMUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="100611109"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="100611109"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:49:42 -0700
X-CSE-ConnectionGUID: qhjoqCYTSqWEAxVk0xn5fA==
X-CSE-MsgGUID: 0ybHSPA3RXmdLAom0YDoxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="312910402"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:49:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 01:49:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 01:49:41 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 01:49:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llyjquovpBkx12RQSVX454r3QqVnjuv2mjqXCzjVapWIGNvfE5mtTMLGCBgTcKBTRHIpJxcmCOj8lK57Vi/pGw+nFt2lNkQisKuPrMgjGuJ5modThQqKOnzzrCUYZ4MSjzIpGb6kulAqcpwIp/H+/lYJm9kBnl42OrbYi8cGzlBsgt698khumb+JgkL/wcsA6fcf1Si0cdwBHYA+yaWJI3mXgP1BELGXGv0uXYkrWa0bESB+6qwaQKxFWHkpYURno51LVkrzZzaWzlZA+NGs2ET9Dxo2jLihSGDanZEmoRGsy2b0P7KFYPITi+LcHQWNja6KidhVsZN+9RboSEEoyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWKKLUhBY0GDfkMYzwsJNqvJxCk0+xLfYf8iBvWQWqc=;
 b=xJIo37FlpivJk8SrMVf2OKaOSCbyCFhpkA1HrRpUHZcnKoNnjjCHp6LEM74vTKL759X/uAspeYLjPZPkH+2IVxz5GBtWAYxrr2rupQLW/dxg0Xtb4jlbQbNHuo2TVwNsNxbMaqEm98tq+ZxDkBKZzpfl2TKXjVjry+gNvxPzY3ZPRvtSohkfc63S1cE1uKj5gGxLUID6Rk0TyzVfEYlonX/hsgCqvzpdFfdl413PWscPcDR6aVtIXxsb8piMo3gnwnEmfXfOZ3owrHEZva/0KzYdAAJm08Ty1m+iq3WA473bx3SdEn7LI+gWprhv301SivR99lDLuQ03y/VG256KYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH7PR11MB8058.namprd11.prod.outlook.com (2603:10b6:510:24d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 08:49:40 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 08:49:33 +0000
Date: Mon, 28 Sep 2026 08:49:23 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 1/8] tools/gputop/xe_gputop: fix struct layout and
 PMU read
Message-ID: <cvzmslku3u4tnyljjwtzeocdz2mkxopxpi6amy7n4icjbrmtqe@svjtvfgg2ii5>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <a839f4c50d30389830ea3436c5bc157770d81620.1790331690.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a839f4c50d30389830ea3436c5bc157770d81620.1790331690.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH7PR11MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: cdcabf58-42c7-450e-58cd-08df1d3d6b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|10067099003|56012099006|6133799003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: Pg2sLrExX1Af5BSKuyrS+GoUDST86R9gDqQurBdgr/RkNYH5+9iTEUqxp4bxNCQ6PRDQTNXboPuuryo5Ac/lO7OCuAJbCpqvkA1M7StVx8OHX7VHPM+Kzv3x1GvZw7u6xG9n3Cf9omIAyOEfP7sAhAZe/SRjdCYsXrBUySUzTWX7QpJ7F3YxAY7Y7xI2s47/ipDBsq27DOzK8dKe8zjhpLpiorROkjy1kuwrjDRxKZIjVuTdQEruB2LNvjssqsvoKOqLUd6nWacynWX8Arm2nHx+aPjTs0/CsRvjNrKFISfghMtblc44DIo4mhQCQIGqXjjT84VVg6hdVR4gj7vDz7GX3aI8aUTPjaLdlhYLd1wYbH2CZ/maJluO3NqGzIpkdL/pbXy2f6rPBc9iuuqaAPPAYTKEGxQBYtrXY7xr9hbR4snzXMRWHXDZf8nyZ/HRt/fDa7wMWrgE44btCy9Bba4Jj6eS5rwaiGgveGywqndq5EhaZG1BX8/qFu/6yZzY6qUqix5Ow1egufJuWWDj4DOgoNz5NkEmwEzpfOM1NEIi1/PrVFcAFk6bYusL2gwiDXkVtnvbWq0SnTZq6lnxjdIwiigpnu7511DySvb/oh8iek1DzhFPh0yNV5u9BdQQqC49L172o6c58CKwePypsDD3dHNrgwASL4eEYdRnng8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(10067099003)(56012099006)(6133799003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGUxdTllVXZLUGV2MzhDdkNBRFBidTZaWWlQMkU3M3YwRFZMQm5IVmZwQk9L?=
 =?utf-8?B?WUZETEtDQTRHSk5xSWNoVjFKRm1WbmVvSjRVdUpXUmFXUzgvMGxSRVYzY1Ev?=
 =?utf-8?B?b2pBcUY2TE52SFJaWmU3MDQ0Q1k0YndrOXhtNktaZCt1bVdvTFlZTGl4UWln?=
 =?utf-8?B?Qmc5Z0VUTjFiS1M4SDNsUS93M1lMN3FTVEVzZVBtalRJWGZBVDdtNFRkVXdS?=
 =?utf-8?B?NGJzUFpLM0l5SEY5c0RSV2pGSEI5THQ4aVBGTUdHeXhFVXNTSFNvMXhFWkpo?=
 =?utf-8?B?T3FoN04wbldwdXB0RkJJTUZRb1BTdGQ4M3EwcGdqNmtPdkpjQUNoZUE1eE94?=
 =?utf-8?B?Y045NzI0VlExODZMZUR3V1JGT1Z3YnVxYmd3dDdQZHpkaHFEazBFU1pEcjc4?=
 =?utf-8?B?eUtTSk1kQ2N4dFJjYndJWk1qUk44Y29GY0ZhQkozWjg5UHNJZlpKZWYxa2RT?=
 =?utf-8?B?WXNUUXRyZ1lCUDZyNXI1OE44eGxZWFlESXFtWXJvZjUxeXJjbjQ5Y0JGTWx4?=
 =?utf-8?B?SWJkeGtMaXJXK0k5Qlk4M0kxMmFRREt2QkhSRVVjQWQrOXhqV1lKbEl6dGtI?=
 =?utf-8?B?TkZVMFlKc1RWbHA1bytTZXJ1VmdJcENVeTl2VjEzQ2NZZG90OHFRaGF0UE1u?=
 =?utf-8?B?dFdxRmxUNGV5aTJ0b3VrNmJiWkJ5VUNnVkpLSUNXVGJDeEkvVk1lVEFid0tO?=
 =?utf-8?B?OXlCSFVOVHBiZXR2N3I2VDJHNzNpSEhCa04yTldxOERwbTRILzQrZklOblFF?=
 =?utf-8?B?eFd0SXplVmV0a3dzSjdMcHMvZTB5WnErOURxZ2tMbWo1TVUvK0UzV0hlOG1X?=
 =?utf-8?B?Tyt4aEx2ZHpUT3FRV1VmTmgwQTIvZHlTcHcvMjVlT1VOTDFVQkE1S0pVNkRZ?=
 =?utf-8?B?ZHNJYmVzNEJXbmFEakhwZEFaamFFcUN4U2VNcFlYSmNvZDViTDFqQ3U1RXI0?=
 =?utf-8?B?aHgxNmtSUkozRlMwa3AxTFlWVTV5dytROTNsSU1zV1RCWHhMNWsybGxZZzRj?=
 =?utf-8?B?UWsyN2xSRkQxUGJXTkpnNHNhQmhTZ3cvYmNKMkYvVFB0U2xMOVc0WUJNZHNJ?=
 =?utf-8?B?bTl4VXJKTWpBclhZeXFrNUt2ZENYVDFCOGVIemVIQzhBdlhNVXZSYThkTnRx?=
 =?utf-8?B?WWtrcm1zdlZRSTBSdllXcnZKSkRQTVBKanIyQ0dDUjY5a1h2M1lKb0I4YWdj?=
 =?utf-8?B?THJFUkhyWGFHT2pWb2V1aGhvdXI5eWJtZmRwT1ZWS01JYTNaU09xNTBtTk4v?=
 =?utf-8?B?RzRER2poaTkxNzEvY1RLYU1pclJIVmhHenU4MEZzaU9uQmkrRFR5ZHlxMUpz?=
 =?utf-8?B?YTVDd1ZOblJrd2lGbG1hSGVaajJ5c1lzbHJFeVRUZW0xMzE1THU2UmFLb2E5?=
 =?utf-8?B?OGJMb3lSSnlRZUE4ZnhLdFJ3cmdYOWwxZXcxbjZGSEwyVERWK2ZhQ0xiWmNC?=
 =?utf-8?B?MWN3TjhhNTJRYzJYd1dGbysvQjNzdWNSRWptY3A3cVRrNlJLbjgybThJRENC?=
 =?utf-8?B?YlNrd2htMHJ3Q3owMFdDQjUzS1RhM1czYzhtNnNuaUgybmo2NC9PRGdIaTJh?=
 =?utf-8?B?K3lRRnZaRStidHBRTDVFTnQwempEV1lRYXVYKzBuRlozKy9uckV3OXJNV2M3?=
 =?utf-8?B?amQ1NllDMG5UMkdnKzdreHI5SGl5Q0Qrd2FaUE9XeFUvSHlCRFRvNnVLTFdj?=
 =?utf-8?B?RGVBb0xPV0VjdzhJYk0zWDZXaGY1VzZUb3VORWM2dmtCS0VIQmRyWldDSUNV?=
 =?utf-8?B?WkpZWWdUUHRTM2lxUmIvY01pWGthTjJsZ0c0UGpxYkdpYjZEdldjRkdKeXpG?=
 =?utf-8?B?eVVPV3dzSUFhWm03QzUxWDU4OWs4SGJKNjZydDhueUxOYXN4aEtoWkZUWTlW?=
 =?utf-8?B?MVJkd0F1bzFrd0FCRldadERSQUdsYXNGNVZmSUVPWHJrOUdJVy9hOFJ4cy9q?=
 =?utf-8?B?WmQyQVM1d2s5Z09LKzhSUWFCSVEyM3hNWjZndEo5dTJxVE5pajNYWXd5RGVF?=
 =?utf-8?B?QUhFOWJiVm1FNVlHM3RFTGltak1ZZmtTZGQzVTdHTVNROHNDclZUQThXNkpj?=
 =?utf-8?B?NUtyOWVtQWkweUxqZTR6TFFMK1F2eVc2c3hJeTRHYURYQlBaT2xKaFJGc0tU?=
 =?utf-8?B?eTVSL21zU2dZUkZzb3pUN2FQa0QvL1VGQzBvUG5DWHBlcDJMQkpUZXdqaHpn?=
 =?utf-8?B?SlZ3Y3JBdWN3b1pBUW4xSEo0dys5WjB2d1IyS2ZwR2JtSDhvM21sRmU5cytz?=
 =?utf-8?B?V0pBVWNCQXhxL1BoTkxoM28wSnVRdXZiQnNEcmN4SWVnaTA2SEs4NUVPbmdS?=
 =?utf-8?B?ZFRtQ2tWeU1KWTYrU2VKcyswYW5peitVL1Y0bFU3MldibkpkcnBRUnpOdUxo?=
 =?utf-8?Q?+vqhwsuUtTbAEUQs=3D?=
X-Exchange-RoutingPolicyChecked: 0y8Z/TskyAChv/yTFxIG4oUel/Fnvx8DvttwCDAC1Xl1jVTfsvHlgCq68Cdwt7VU4EoAosPeoZTLQHvi/HuCAb2vFbDFX8dydyJOhLojXUlWuIt4M8panxbcE22vE5UKtv7vuKd0rS8FwjzFYwTTzKOL0d/OnZJ/IZH02pqUaFcjyiIVBnc0yqbU3zx8erhB0OsLXs9FM/4u/Loh1gMkrku5LEcTq5AQhmOvF1vsYVDfcBnwf14o6cBBPoVB0aaCt0Mo3f5DBnnzq25qzQeMDYM8EIqe/BzskBSV1A5mzWnYYABNMxAVeytrGuGAT2885OeKR52S2w6L5ekz38O7Jg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcabf58-42c7-450e-58cd-08df1d3d6b1e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:49:33.8282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKzYvehbX7HrSewsvjc4rJCAwVb44zSh9R2U9KH1qkiUkBahg3DeJxwQOh/iSsp1c2x3rkO4xNMx0MiNHZb3Va4fA7puEd0hxppuziLvpQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8058
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

Hi Sebastian,

On 2026-09-25 at 12:57:41 +0200, Sebastian Brzezinka wrote:
> struct xe_pmu_device ended with a plain 'struct xe_engine engine' member,
> but xe_populate_engines() reallocs the struct to hold multiple engines
> beyond that member, which is undefined behaviour. It is replaced with a
> proper C99 flexible array member (engine[]), and engine_ptr() is updated
> to use [] indexing accordingly.
> 
> pmu_read_multi() and xe_pmu_sample() also used VLAs (uint64_t buf[2+num],
> val[2+num_val]) which are forbidden by -Wvla in IGT builds, so both are
> replaced with heap allocated buffers.
> 
> pmu_read_multi() aborted the process via assert() whenever the perf
> read returned an unexpected length since a monitoring tool should never
There needs to be some separation between these two sentences:
...read returned an unexpected length. Since a monitoring tool
should never...

> crash on a I/O error, the assert is replaced with an error message and
> a graceful return.
> 
> An explicit #include <glib.h> is also added for the CLAMP() macro used
> in pmu_active_percentage().
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/gputop/xe_gputop.c | 35 +++++++++++++++++++++++++++--------
>  tools/gputop/xe_gputop.h |  2 +-
>  2 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> index bb2caa6ea..119545c75 100644
> --- a/tools/gputop/xe_gputop.c
> +++ b/tools/gputop/xe_gputop.c
> @@ -3,9 +3,10 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <glib.h>
>  #include "xe_gputop.h"
>  
> -#define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
> +#define engine_ptr(pmu_device, n) (&(pmu_device)->engine[(n)])
>  
>  static void __update_sample(struct xe_pmu_counter *counter, uint64_t val)
>  {
> @@ -212,29 +213,45 @@ void *xe_populate_engines(const void *obj, int index)
>  
>  static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>  {
> -	uint64_t buf[2 + num];
> +	const size_t buf_size = (2 + num) * sizeof(uint64_t);
> +	uint64_t *buf;
> +	uint64_t ts = 0;
>  	unsigned int i;
>  	ssize_t len;
>  
> -	memset(buf, 0, sizeof(buf));
> +	buf = malloc(buf_size);
> +	if (!buf)
> +		return 0;
>  
> -	len = read(fd, buf, sizeof(buf));
> -	assert(len == sizeof(buf));
> +	memset(buf, 0, buf_size);
> +	len = read(fd, buf, buf_size);
> +	if (len != (ssize_t)buf_size) {
> +		fprintf(stderr, "xe: PMU read error: expected %zu bytes, got %zd\n",
Please remove "xe: " prefix from the message. It may suggest
that this has been emitted from the driver somehow and other
tools do not use this convention.

> +			buf_size, len);
> +		free(buf);
> +		return 0;
> +	}
>  
>  	for (i = 0; i < num; i++)
>  		val[i] = buf[2 + i];
>  
> -	return buf[1];
> +	ts = buf[1];
> +	free(buf);
> +	return ts;
This value is ignored (currently as well). Maybe, convert the
function to void type or add the return check to
xe_pmu_sample()?

>  }
>  
>  void xe_pmu_sample(const void *obj, int index)
>  {
>  	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
>  	struct xe_pmu_device *engines = ptr->pmu_device_obj;
> -	const int num_val = engines->num_counters;
> -	uint64_t val[2 + num_val];
> +	const unsigned int num_val = engines->num_counters;
> +	uint64_t *val;
>  	unsigned int i;
>  
> +	val = calloc(num_val, sizeof(*val));
> +	if (!val)
> +		return;
> +
>  	pmu_read_multi(engines->fd, num_val, val);
>  
>  	for (i = 0; i < engines->num_engines; i++) {
> @@ -243,6 +260,8 @@ void xe_pmu_sample(const void *obj, int index)
>  		update_sample(&engine->engine_active_ticks, val);
>  		update_sample(&engine->engine_total_ticks, val);
>  	}
> +
> +	free(val);
>  }
>  
>  int xe_pmu_init(const void *obj, int index)
> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
> index 1e3856071..c26db0e7e 100644
> --- a/tools/gputop/xe_gputop.h
> +++ b/tools/gputop/xe_gputop.h
> @@ -41,7 +41,7 @@ struct xe_pmu_device {
>  	unsigned int num_counters;
>  	int fd;
>  	char *device;
> -	struct xe_engine engine;
> +	struct xe_engine engine[];
>  };
>  
>  struct xe_gputop {
> -- 
> 2.55.0
> 

-- 
Best Regards,
Krzysztof
