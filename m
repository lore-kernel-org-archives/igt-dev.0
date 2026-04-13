Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAFBF531DB
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 22:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3018C10E15E;
	Mon, 13 Apr 2026 22:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2mAIJNa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A4910E2E7
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 22:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776118470; x=1807654470;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AFB/Jvu7LDBuGFTXZyaTJqaMWtKauFwOdNDds66kUzY=;
 b=L2mAIJNao83Fb9WgS91G35lWGwxiLjK70ECCPO1qlLCCAGx+y1BgkQux
 Au3/A69VhvUz8DhuNCQc0Aa1nUlGqH4fHursa0wjLMVCFwnNcs21vBQBY
 XFqft9OPtXF/nKqx4a5no9ciKVkeWP0udtdZ5/XFfB0T/sQA4hQqdeAv+
 z0jSip+DNytgiV9fDgatBprHiRK42QmU3FOlrh+etK0tjdipe17/tmnvT
 rvUItcuV11h+Uh7yPAzfQAtg24N6hqmibBvhHPMdU2kePQBfxImR1yjim
 ZkpbtbHq6GKrbKGrDHogqVSG4FB9tBQ5qaGHwMdQifHjwcpNcI3y9b8X1 Q==;
X-CSE-ConnectionGUID: xkDzfpnZTZqvx7pWnWvbVw==
X-CSE-MsgGUID: f80rUSSrQFO/ShEa6ky6Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="64598665"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="64598665"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:14:30 -0700
X-CSE-ConnectionGUID: 2QwmYj9YTsuaJi6h2yVyxQ==
X-CSE-MsgGUID: 86ZHwfu5S7KpkHaqLtwkbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="253291817"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:14:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:14:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 15:14:29 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:14:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnOOCTLya4Z9X92ZdwkDFaSq+lHc0XMrDGlIAGYgD1r1tOIf8fBaowiKSWNbyotUUvy8Dncsow3TFsmBhrJttoKj94WYtP9IZn/1p1EmcUhT57zZQcfv908wfFxcUjfuyg1VlLTRksKwaEbq7ZiNPNemhNHrukOPVJMix0pJv2AisQyzrimqGc0cVp0uwQkXLWOjJoxXfE9kBzFwsqZvgMYAs8Byl9B1XiESQVURbHQbMkgE/8zLUQ5vp0UZwY+SoL9dMIXsbQINv2kFYyyS0xc7Ri4oa7TrtHFBGrprGPpq2bi3DlLS2C5+u7F/Drs/FPQWsg5lhgoRtHSik8FiBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ve1AVDdaRzLdsrYBUUIzT9kL/vFAM4IsMvYsuSovBZ0=;
 b=YPSC4bJh7F1yYpP7YKO6rk7HNCUoEW1G1F0MgQ2/8w0Ij3Lo0ynM8V4zKai/T3WFrUYdtuGCdSd4OqyYQYbTLDU2nehoQovuBy3mJj4dtRzNpV1KyOorg9boheYLvdIUz/vlNvPYcCQjFpYHurrjLSvZuoIWU9kSc1Wi+k9VLBZCYipNSWt6PswdZGB42v/oQ1VNc43rWD9opaL5QyR4mSTSUhWmjcqe/RDpLSciS+B9HaQayztDT9XNDQJtQe86xdHBEokW2pkzGRwALweymfLWM+ahwCC0tq8VCwUcK62Ky3fQD9HNcI7Jntx5gZEyZsOHnEw/pR9CybeCy6ReaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 22:14:26 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9818.014; Mon, 13 Apr 2026
 22:14:26 +0000
Message-ID: <b7ff5071-d247-44b2-b660-5fd966c250bc@intel.com>
Date: Mon, 13 Apr 2026 15:14:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] tests/xe: Add page reclaim test
To: Brian Nguyen <brian3.nguyen@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260406184226.1294486-6-brian3.nguyen@intel.com>
 <20260406184226.1294486-7-brian3.nguyen@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260406184226.1294486-7-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SJ1PR11MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f5358c-b956-4a47-46cc-08de99aa0600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|42112799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: StlSsyFNlykCK+AcQVtBCu0HCZ5zx24fXnL9HOm1t2ctHvqvLbXpykrF5k4JvdyJGhC5lAm+EAA0rvYPdqSJhLJFVnphiOGJHRnZqTojQqzhTViqqMmdnFW7it4xWv/xU50CPce4oTIIKE0dbOYdwmdOOnnpbm5YuClyyISaPSjOJsefzk6e0Y/iT57pEXEBcA/u0iIuJLrvSqodvLpXwnkOWzFIk9UbbmuIvnrpVsK67GCYKfapp7z7oVAyTqfKGAMwtMJifgBeglWmyJBzgELp1k/ybPW4mGKAE8PkhLN9O2GbB5Dtji7/26Vwz8vCQHH4w9/fyxZ2aQAiX3HMVPA57kX/i5AbeySq1e0cYebROhjpOQKX4Q3ahsQ//pLFwRI9rGfEJ/g7idOLp/jNK9hBX6B/Ofa7Xq+GB4P2vmcBHSVtf2Q59GIiEju11gUiXMjVK0Q2aRpzXqAG2I34ZWXmi0C1yFrrrgVqABk76o3CKrLmwSFkf8dQdIyZdxz8l3cPb2V9lTUdvpToQ8GO7HG9c6tKPyqSZNnjDXqUnRRUsWWULBep85+c8vaA+sdu8ZNRHA/iR5eqEbsCSW0VyWN342nQdPQRGuMMlcgRMN5ibEpoQn/Yw8lN3K5wYRgteRKStYVHHV4FJ6Y7GuzhuSjHCKE/zURxGZlBU483UCZhxqlcjZhmhmfK2t7JBux9nsqxbGib3GUuRPw0uNMTA9YrqtcdnbY9mvFEFVtjt8k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(42112799006)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkM3cGs2TlBOenRxQmxJR1lpRlBRK0EwTldtcWljSUE0MXBhVThsQXdMWThD?=
 =?utf-8?B?K0p0MnhDWmY5QUdQelZVK3ZSbmYrclhjaTExVU9ESmZuSUpWYlhCcHdIZmdY?=
 =?utf-8?B?THJwb1pDVWE2ci90RTc1VmtJVmFmUkVjWmY3cjhNZ3ZZM0doU0VBVXFTUHd0?=
 =?utf-8?B?ZXJteGdsZ0t4amtZeFV2V1p4cE9NR3cyWUdLeU83OExSZzhsMGNrOUt1dGdZ?=
 =?utf-8?B?L2ZjRjlrWklkZUpYMWNRRHc0YXViQWlJc0tvYjhYMk1YOTBZNmJpWTlvZnlR?=
 =?utf-8?B?Uk4rZDMwM1VsUU1aNjdHdVhxcmpjc3NJY2ZzQjBSdUdKR1NHN0ZXME1jR1RG?=
 =?utf-8?B?c2lHSS9sQlhpN245a1BpN0ltdzE0OUR1VXBOYW43aDhlTjR0a1ZCTk9YRGEy?=
 =?utf-8?B?M1hsdndFK3MvOU9VY3FER0UxbWFNeW80M2hOZXo3MTZpZ24zK3dXU2tNcG9Z?=
 =?utf-8?B?RVZCVUVqOSt3d0s4RVYzL2h4YTBBdC95QlFOUHc4RHBqU0RqeGZPa0VsVE85?=
 =?utf-8?B?eGZRdHFRK21HVzk3cUJibkU1bXVNejJFMzhtQlVzYU9vV01KYytKZlVTbjNT?=
 =?utf-8?B?cnF6b0hDT0F0ZzdCWDJiYXE2bTZCcmxIWEIydVY2eGxoRW4yanpHbkdVV0sw?=
 =?utf-8?B?bng2MHZzdjZTd3BPd3FmMzFoQlJpR2VsclE0U0VZZjd3dlF4ZTB0L1hTMXRI?=
 =?utf-8?B?aGQxcmlZQTlsUmNjSlZUMlNDUklhM1N2TXZpVm1BdkxUTGUreDBsbUkxeXhp?=
 =?utf-8?B?K3VudHVhcjNHc0cwbTdjdnlYdllHYWlxdWJuQWJiQXhXSjZFbGc3RnZVYzha?=
 =?utf-8?B?aS9YSjh1NnhlNWtwbURxSXpuS0FhTlcxbjA0VmxWbi9JTnhydVNuL1RqRjhL?=
 =?utf-8?B?T1RpQ3lCYmNNKzlOWVJjbXhHVThaZkZOZ1lQMmZJQUlTVXNTbG52bDkzMUo2?=
 =?utf-8?B?cjVXZlVsUG9uOWJLZElFN1Vxb0hWcUVzOVlvSUFjTFYvZnN4ZlFKQ01rUWcr?=
 =?utf-8?B?OVptTmc2eDVYRk10M2sxYmIvMUlPRzVnQ2NYZ1JVd05KYmNwNUFucTJVWE1Y?=
 =?utf-8?B?TFlCMTdZSUR5UlBQZExVZklNTkNRMzE2MU5scW9oMVpDS1c5VG9iQ0VqQXVV?=
 =?utf-8?B?SEJkRWlyUzE1Snc4UXo0YWkrbGZDbnFXaXY1SlRlOVdlajNWa0JwTE1GcGVV?=
 =?utf-8?B?T2QrR2xKN3lCREhiQzJFVGZTRjd6UjlxNG9XVUcvS2FIaG9rdTgzR0MvM1RY?=
 =?utf-8?B?Z2VHU1d2OGsrcGt1d05CNW03QVVzS2NUM2t3T3RBVmlYOTl0NzhMVU5ENTJY?=
 =?utf-8?B?SzNwaWxoSk9FNnRBQWp6Vy9FRVhUYytlVC9TcU4wOHZMRmdBd3c3RVhIU2N6?=
 =?utf-8?B?eGczS0xUd3c4OWhuSXVjNWxrK2puekhqOVF3UGhmZWpnUzRKTnFvMkF0MlhT?=
 =?utf-8?B?ckZnTk1UZ0w2TjZFZUdtR2ZKY1NMMUhWRVFxUEFML01wWlFscWk0dzRKLzMz?=
 =?utf-8?B?OHQrZGNRQ0pkUElNM2NtM0R4V1hud3VTK1M3OCt4TFBPTE9OQ3VabW15V1M0?=
 =?utf-8?B?MVpNUXVHb2g3c21uYVZRYks0TUhZN0VMS3UrOVNXMjBra0FNUTJGVlpmaVF3?=
 =?utf-8?B?bnd1SXJING5SRms3eUZ6RzdzYlZjbkhLWmdnYlJDTXRLSlU3NUIxNXY0VDQv?=
 =?utf-8?B?Wk43YS9MZFhDWCtGOTZQT01SOUpNVldLb044b1hyZEw3ZVpMZzRaRDV5NDAr?=
 =?utf-8?B?WFE1K3FndEFPaEE0MmwzRVYrcXhNUGhuVkNXRWloVitIM2Jjd3VhQXV1YzFB?=
 =?utf-8?B?U0FIMXpaUlkvZ3BVSCs5UFhZMko0dTVZRy9xTWtqSEJ0L2xsa1lISEs4TmV4?=
 =?utf-8?B?VGZheDIrTGlVWGc0aFltMDVJUnhGeUsvTmU0ZlNhb3hzSnI3V1g5WkhYODFH?=
 =?utf-8?B?MWFOTnl2Y2FKM016UFRJTGVuWm1xTnFpWWF0dkxlcW5namVhUVNabnFqa09x?=
 =?utf-8?B?aVdFcWxEOWRva2VkRnRFaHJJTDJZVVh3ZUlBUjd4a0E4UzlVUFR6RGFxY0N4?=
 =?utf-8?B?SEgzUVF1MFpFTUtWbXJlNzdTSyttMldnSUFzOHZmK0ZmWWk2WElOdm5Ecmhm?=
 =?utf-8?B?QlFTdjlXWE84OUxZNHNrSi9Galg5N0RVeU9TSnd4UTFjd25DMi9wbVB6RkJY?=
 =?utf-8?B?YzFpN2c3aTZZQ3hHZk4xeHhPM1V1QW16NEdjZkkyU25wTEhkaTFtU3hsT2Nr?=
 =?utf-8?B?Q1RuWis2ZmpxdW1WeUVQQ3FnQ0E1bk5VNEc2eUZneTM0c2FyZmJXajdKckxU?=
 =?utf-8?B?QWhlemEzb0NtR012NW4xS1dnd1hWemN4RE5WdTBWNHlQUCtTVG4wUT09?=
X-Exchange-RoutingPolicyChecked: hlNvOQoeel4N9juTI/yLamQR1y1J0KwGt1OhGW5xIkcaCO1FsUgulZc+FIzg2TrjhUR7CtEtZ4dPqiMi5qLM6tVlc0yZtQfAsziaS5LwQfLEq+PqIs9/UMS3YQlrMGrLMxOZOCklugjCyfYDWKTmB8VNPCZQrE5hV0JWS4D1ziQmG5L8FsAAjMscrenrXbvIXMhm/eIf2D+Pk3KB64MVMcThajcbJ3d7PZoZgeq2k1EM2l1RWR7hJ4Mpf30kQQSiyRCoSMEPmF8PB9p+GSIeSH0BuNCfUGpmXhHQLrNnTxHMv9Jfg8rgLSQ3Zum93aAVbAyEOcjeigm+GB0GpPap/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f5358c-b956-4a47-46cc-08de99aa0600
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 22:14:25.9477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JPnfU/I1QJkV77rzYpEAlpAtS8QOwjNjUwIPkkJwyXaKm6CEeFS6vqt7gGP14mP/YbKqikyT5jt4UmEpKqeEA==
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
> Page Reclamation is a feature enabled in Xe3p that allows for some
> performance gain by optimizing TLB invalidations. Xe2 and beyond has
> an physical noncoherent L2 cache that requires a full PPC flush
> everytime a TLB invalidation occurs. With page reclamation it will
> only take the corresponding pages associated with the unmap that
> triggers the TLB invalidation.
>
> xe_page_reclaim test cases create pages of a specific size, binds them
> to a VM, and unbinds, observing if the expected pages are added to the
> PRL, through the use of gt stats.
>
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> ---
>   tests/intel/xe_page_reclaim.c | 441 ++++++++++++++++++++++++++++++++++
>   tests/meson.build             |   1 +
>   2 files changed, 442 insertions(+)
>   create mode 100644 tests/intel/xe_page_reclaim.c
>
> diff --git a/tests/intel/xe_page_reclaim.c b/tests/intel/xe_page_reclaim.c
> new file mode 100644
> index 000000000..acc237d43
> --- /dev/null
> +++ b/tests/intel/xe_page_reclaim.c
> @@ -0,0 +1,441 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <fcntl.h>
> +
> +#include "ioctl_wrappers.h"
> +#include "xe/xe_gt.h"
> +#include "xe/xe_ioctl.h"
> +
> +#define OVERFLOW_PRL_SIZE 512
> +
> +/**
> + * TEST: xe_page_reclaim
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: VM bind
> + * Functionality: Page Reclamation
> + * Test category: functionality test
> + */
> +struct xe_prl_stats {
> +	int prl_4k_entry_count;
> +	int prl_64k_entry_count;
> +	int prl_2m_entry_count;
> +	int prl_issued_count;
> +	int prl_aborted_count;
> +};
> +
> +/*
> + * PRL is only active on the render GT (gt0); media tiles do not participate
> + * in page reclamation. Callers typically pass gt=0.
> + */
> +static struct xe_prl_stats get_prl_stats(int fd, int gt)
> +{
> +	struct xe_prl_stats stats = {0};
> +
> +	stats.prl_4k_entry_count = xe_gt_stats_get_count(fd, gt, "prl_4k_entry_count");
> +	stats.prl_64k_entry_count = xe_gt_stats_get_count(fd, gt, "prl_64k_entry_count");
> +	stats.prl_2m_entry_count = xe_gt_stats_get_count(fd, gt, "prl_2m_entry_count");
> +	stats.prl_issued_count = xe_gt_stats_get_count(fd, gt, "prl_issued_count");
> +	stats.prl_aborted_count = xe_gt_stats_get_count(fd, gt, "prl_aborted_count");
> +
> +	return stats;
> +}
> +
> +static void log_prl_stat_diff(struct xe_prl_stats *stats_before, struct xe_prl_stats *stats_after)
> +{
> +	igt_debug("PRL stats diff: 4K: %d->%d, 64K: %d->%d, 2M: %d -> %d, issued: %d->%d, aborted: %d->%d\n",
> +		  stats_before->prl_4k_entry_count,
> +		  stats_after->prl_4k_entry_count,
> +		  stats_before->prl_64k_entry_count,
> +		  stats_after->prl_64k_entry_count,
> +		  stats_before->prl_2m_entry_count,
> +		  stats_after->prl_2m_entry_count,
> +		  stats_before->prl_issued_count,
> +		  stats_after->prl_issued_count,
> +		  stats_before->prl_aborted_count,
> +		  stats_after->prl_aborted_count);
> +}
> +
> +/* Compare differences between stats and determine if expected */
> +static void compare_prl_stats(struct xe_prl_stats *before, struct xe_prl_stats *after,
> +			      struct xe_prl_stats *expected)
> +{
> +	log_prl_stat_diff(before, after);
> +
> +	igt_assert_eq(after->prl_4k_entry_count - before->prl_4k_entry_count,
> +		      expected->prl_4k_entry_count);
> +	igt_assert_eq(after->prl_64k_entry_count - before->prl_64k_entry_count,
> +		      expected->prl_64k_entry_count);
> +	igt_assert_eq(after->prl_2m_entry_count - before->prl_2m_entry_count,
> +		      expected->prl_2m_entry_count);
> +	igt_assert_eq(after->prl_issued_count - before->prl_issued_count,
> +		      expected->prl_issued_count);
> +	igt_assert_eq(after->prl_aborted_count - before->prl_aborted_count,
> +		      expected->prl_aborted_count);
> +}
> +
> +/* Helper with more flexibility on unbinding and offsets */
> +static void vma_range_list_with_unbind_and_offsets(int fd, const uint64_t *vma_sizes, unsigned int n_vmas,
> +				 uint64_t start_addr, uint64_t unbind_size, const uint64_t *vma_offsets)
> +{
> +	uint32_t vm;
> +	uint32_t *bos;
> +	uint64_t addr;
> +
> +	igt_assert(vma_sizes);
> +	igt_assert(n_vmas);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +
> +	bos = calloc(n_vmas, sizeof(*bos));
> +	igt_assert(bos);
> +
> +	addr = start_addr;
> +	for (unsigned int i = 0; i < n_vmas; i++) {
> +		igt_assert(vma_sizes[i]);
> +
> +		bos[i] = xe_bo_create(fd, 0, vma_sizes[i], system_memory(fd), 0);
> +		if (vma_offsets)
> +			addr = start_addr + vma_offsets[i];
> +		xe_vm_bind_sync(fd, vm, bos[i], 0, addr, vma_sizes[i]);
> +		addr += vma_sizes[i];
> +	}
> +
> +	/* Unbind the whole contiguous VA span in one operation. */
> +	xe_vm_unbind_sync(fd, vm, 0, start_addr, unbind_size ? unbind_size : addr - start_addr);
> +
> +	for (unsigned int i = 0; i < n_vmas; i++)
> +		gem_close(fd, bos[i]);
> +
> +	free(bos);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/*
> + * Takes in an array of vma sizes and allocates/binds individual BOs for each given size,
> + * then unbinds them all at once
> + */
> +static void test_vma_ranges_list(int fd, const uint64_t *vma_sizes,
> +				 unsigned int n_vmas, uint64_t start_addr)
> +{
> +	vma_range_list_with_unbind_and_offsets(fd, vma_sizes, n_vmas, start_addr, 0, NULL);
> +}
> +
> +/**
> + * SUBTEST: basic-mixed
> + * Description: Create multiple different sizes of page (4K, 64K, 2M)
> + *      GPU VMA ranges, bind them into a VM at unique addresses, then
> + *      unbind all to trigger page reclamation on different page sizes
> + *      in one page reclaim list.
> + */
> +static void test_vma_ranges_basic_mixed(int fd)
> +{
> +	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
> +	const uint64_t num_4k_pages = 16;
> +	const uint64_t num_64k_pages = 31;
> +	const uint64_t num_2m_pages = 2;
> +	uint64_t *sizes = calloc(num_4k_pages + num_64k_pages + num_2m_pages, sizeof(uint64_t));
> +	int count = 0;
> +
> +	igt_assert(sizes);
> +	for (int i = 0; i < num_4k_pages; i++)
> +		sizes[count++] = SZ_4K;
> +
> +	for (int i = 0; i < num_64k_pages; i++)
> +		sizes[count++] = SZ_64K;
> +
> +	for (int i = 0; i < num_2m_pages; i++)
> +		sizes[count++] = SZ_2M;
> +
> +	expected_stats.prl_4k_entry_count = num_4k_pages;
> +	expected_stats.prl_64k_entry_count = num_64k_pages;
> +	expected_stats.prl_2m_entry_count = num_2m_pages;
> +	expected_stats.prl_issued_count = 1;
> +	expected_stats.prl_aborted_count = 0;
> +
> +	stats_before = get_prl_stats(fd, 0);
> +	test_vma_ranges_list(fd, sizes, count, 1ull << 30);
> +	stats_after = get_prl_stats(fd, 0);
> +
> +	free(sizes);
> +	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
> +}
> +
> +/**
> + * SUBTEST: prl-invalidate-full
> + * Description: Create 512 4K page entries at the maximum page reclaim list
> + *      size boundary and bind them into a VM.
> + *      Expects to trigger a fallback to full PPC flush due to page reclaim
> + *      list size limitations (512 entries max).
> + *
> + * SUBTEST: prl-max-entries
> + * Description: Create the maximum page reclaim list without overflow
> + *      bind them into a VM.
> + *      Expects no fallback to PPC flush due to page reclaim
> + *      list size limitations (512 entries max).
> + */
> +static void test_vma_ranges_prl_entries(int fd, unsigned int num_entries,
> +					int expected_issued, int expected_aborted)
> +{
> +	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
> +	const uint64_t page_size = SZ_4K;
> +	/* Start address aligned but offset by a page to ensure no large PTE are created */
> +	uint64_t addr = (1ull << 30) + page_size;
> +
> +	/* Capped at OVERFLOW_PRL_SIZE - 1: on overflow the last entry triggers abort */
> +	expected_stats.prl_4k_entry_count = min_t(int, num_entries, OVERFLOW_PRL_SIZE - 1);
> +	expected_stats.prl_64k_entry_count = 0;
> +	expected_stats.prl_2m_entry_count = 0;
> +	expected_stats.prl_issued_count = expected_issued;
> +	expected_stats.prl_aborted_count = expected_aborted;
> +
> +	stats_before = get_prl_stats(fd, 0);
> +	test_vma_ranges_list(fd, &(uint64_t){page_size * num_entries}, 1, addr);
> +	stats_after = get_prl_stats(fd, 0);
> +	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
> +}
> +
> +/*
> + * Bind the BOs to multiple VA ranges and unbind all VA with one range.
> + * BO size is chosen as the maximum of the requested VMA sizes.
> + */
> +static void test_many_ranges_one_bo(int fd,
> +				    const uint64_t vma_size,
> +				    unsigned int n_vmas,
> +				    uint64_t start_addr)
> +{
> +	uint32_t vm;
> +	uint64_t addr;
> +	uint32_t bo;
> +
> +	igt_assert(n_vmas);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +
> +	igt_assert(vma_size);
> +	bo = xe_bo_create(fd, 0, vma_size, system_memory(fd), 0);
> +
> +	addr = start_addr;
> +	for (unsigned int i = 0; i < n_vmas; i++) {
> +		/* Bind the same BO (offset 0) at a new VA location */
> +		xe_vm_bind_sync(fd, vm, bo, 0, addr, vma_size);
> +		addr += vma_size;
> +	}
> +
> +	/* Unbind all VMAs */
> +	xe_vm_unbind_sync(fd, vm, 0, start_addr, addr - start_addr);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/**
> + * SUBTEST: many-vma-same-bo
> + * Description: Create multiple 4K page VMA ranges bound to the same BO,
> + *      bind them into a VM at unique addresses, then unbind all to trigger
> + *      page reclamation handling when the same BO is bound to multiple
> + *      virtual addresses.
> + */
> +static void test_vma_ranges_many_vma_same_bo(int fd, uint64_t vma_size, unsigned int n_vmas)
> +{
> +	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
> +
> +	expected_stats.prl_4k_entry_count = n_vmas;
> +	expected_stats.prl_issued_count = 1;
> +
> +	stats_before = get_prl_stats(fd, 0);
> +	test_many_ranges_one_bo(fd, vma_size, n_vmas, 1ull << 30);
> +	stats_after = get_prl_stats(fd, 0);
> +	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
> +}
> +
> +/**
> + * SUBTEST: invalid-1g
> + * Description: Create a 1G page VMA followed by a 4K page VMA to test
> + *      handling of 1G page mappings during page reclamation.
> + *      Expected is to fallback to invalidation.
> + */
> +static void test_vma_range_invalid_1g(int fd)
> +{
> +	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
> +	static const uint64_t sizes[] = {
> +		SZ_1G,
> +		SZ_4K,
> +	};
> +	int delta_4k, delta_64k, delta_2m, delta_issued, delta_aborted;
> +	bool expected_2m_entries, all_entries_dropped;
> +
> +	/* 1G page broken into 512 2M pages, but it should invalidate the last entry */
> +	expected_stats.prl_2m_entry_count = OVERFLOW_PRL_SIZE - 1;
> +	/* No page size because PRL should be invalidated before the second page */
> +	expected_stats.prl_4k_entry_count = 0;
> +	expected_stats.prl_issued_count = 0;
> +	expected_stats.prl_aborted_count = 1;
> +
> +	stats_before = get_prl_stats(fd, 0);
> +	/* Offset 2G to avoid alignment issues */
> +	test_vma_ranges_list(fd, sizes, ARRAY_SIZE(sizes), SZ_2G);
> +	stats_after = get_prl_stats(fd, 0);
> +	log_prl_stat_diff(&stats_before, &stats_after);
> +
> +	/*
> +	 * Depending on page placement, 1G page directory could be dropped from page walk
> +	 * which would not generate any entries
> +	 */
> +	delta_4k = stats_after.prl_4k_entry_count - stats_before.prl_4k_entry_count;
> +	delta_64k = stats_after.prl_64k_entry_count - stats_before.prl_64k_entry_count;
> +	delta_2m = stats_after.prl_2m_entry_count - stats_before.prl_2m_entry_count;
> +	delta_issued = stats_after.prl_issued_count - stats_before.prl_issued_count;
> +	delta_aborted = stats_after.prl_aborted_count - stats_before.prl_aborted_count;
> +	expected_2m_entries = (delta_2m == expected_stats.prl_2m_entry_count);
> +	all_entries_dropped = (delta_2m == 0 && delta_64k == 0 && delta_4k == 0);
> +
> +	igt_assert_eq(delta_issued, expected_stats.prl_issued_count);
> +	igt_assert_eq(delta_aborted, expected_stats.prl_aborted_count);
> +	igt_assert_eq(delta_4k, expected_stats.prl_4k_entry_count);
> +	igt_assert(expected_2m_entries || all_entries_dropped);
> +}
> +
> +/**
> + * SUBTEST: pde-vs-pd
> + * Description: Test case to trigger invalidation of both PDE (2M pages)
> + *      and PD (page directory filled with 64K pages) to determine correct
> + *      handling of both cases for PRL.
> + */
> +static void test_vma_ranges_pde_vs_pd(int fd)
> +{
> +	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
> +	/* Ensure no alignment issue by using 1G */
> +	uint64_t start_addr = 1ull << 30;
> +	/* 32 pages of 64K to fill one page directory */
> +	static const unsigned int num_pages = SZ_2M / SZ_64K;
> +	static const uint64_t size_pde[] = {
> +		SZ_2M,
> +	};
> +	uint64_t size_pd[num_pages];
> +
> +	for (int i = 0; i < num_pages; i++)
> +		size_pd[i] = SZ_64K;
> +
> +	expected_stats = (struct xe_prl_stats) {
> +		.prl_64k_entry_count = num_pages,
> +		.prl_issued_count = 1,
> +	};
> +	stats_before = get_prl_stats(fd, 0);
> +	test_vma_ranges_list(fd, size_pd, ARRAY_SIZE(size_pd), start_addr);
> +	stats_after = get_prl_stats(fd, 0);
> +	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
> +
> +	expected_stats = (struct xe_prl_stats) {
> +		.prl_2m_entry_count = 1,
> +		.prl_issued_count = 1,
> +	};
> +	stats_before = get_prl_stats(fd, 0);
> +	test_vma_ranges_list(fd, size_pde, ARRAY_SIZE(size_pde), start_addr);
> +	stats_after = get_prl_stats(fd, 0);
> +	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
> +}
> +
> +/**
> + * SUBTEST: boundary-split
> + * Description: Test case to trigger PRL generation beyond a page size alignment
> + *      to ensure correct handling of PRL entries that span page size boundaries.
> + */
> +static void test_boundary_split(int fd)
> +{
> +	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
> +	/* Dangle a page past the boundary with a combination of address offset and size */
> +	uint64_t size_boundary = 64 * SZ_2M + SZ_4K;
> +	uint64_t addr = (1ull << 30) + 64 * SZ_2M;
> +
> +	expected_stats.prl_4k_entry_count = 1;
> +	expected_stats.prl_64k_entry_count = 0;
> +	expected_stats.prl_2m_entry_count = 64;
> +	expected_stats.prl_issued_count = 1;
> +	expected_stats.prl_aborted_count = 0;
> +
> +	stats_before = get_prl_stats(fd, 0);
> +	test_vma_ranges_list(fd, &(uint64_t){size_boundary}, 1, addr);
> +	stats_after = get_prl_stats(fd, 0);
> +	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
> +}
> +
> +/**
> + * SUBTEST: binds-1g-partial
> + * Description: Bind a 1G VMA and a 2M VMA into a VM and unbind only
> + *      the 1G range to verify that decomposing a 1G mapping into its
> + *      constituent 2M PRL entries overflows the PRL capacity limit,
> + *      triggering a full TLB invalidation fallback (aborted PRL) instead
> + *      of a targeted page reclaim list flush.
> + */
> +static void test_binds_1g_partial(int fd)
> +{
> +	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
> +
> +	uint64_t sizes[]   = { SZ_1G, SZ_2M };
> +	uint64_t offsets[] = { 0, SZ_1G };
> +	int count = ARRAY_SIZE(sizes);
> +
> +	expected_stats.prl_4k_entry_count = 0;
> +	expected_stats.prl_64k_entry_count = 0;
> +	expected_stats.prl_2m_entry_count = 0;
> +	expected_stats.prl_issued_count = 0;
> +	expected_stats.prl_aborted_count = 1;
> +
> +	stats_before = get_prl_stats(fd, 0);
> +	vma_range_list_with_unbind_and_offsets(fd, sizes, count, (1ull << 30), SZ_1G + SZ_2M, offsets);
> +	stats_after = get_prl_stats(fd, 0);
> +
> +	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
> +}
> +
> +int igt_main()
> +{
> +	int fd;
> +	/* Buffer to read debugfs entries boolean */
> +	char buf[16] = {0};
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +
> +		igt_require_f(igt_debugfs_exists(fd, "page_reclaim_hw_assist", O_RDONLY),
> +			      "Page Reclamation feature is not supported.\n");
> +
> +		igt_debugfs_read(fd, "page_reclaim_hw_assist", buf);
> +		igt_require_f(buf[0] == '1',
> +			      "Page Reclamation feature is not enabled.\n");
> +
> +		igt_require_f(xe_gt_stats_get_count(fd, 0, "prl_4k_entry_count") >= 0,
> +			      "gt_stats is required for Page Reclamation tests.\n");
> +	}
> +
> +	igt_subtest("basic-mixed")
> +		test_vma_ranges_basic_mixed(fd);
> +
> +	igt_subtest("prl-invalidate-full")
> +		test_vma_ranges_prl_entries(fd, OVERFLOW_PRL_SIZE, 0, 1);
> +
> +	igt_subtest("prl-max-entries")
> +		test_vma_ranges_prl_entries(fd, OVERFLOW_PRL_SIZE - 1, 1, 0);
> +
> +	igt_subtest("many-vma-same-bo")
> +		test_vma_ranges_many_vma_same_bo(fd, SZ_4K, 16);
> +
> +	igt_subtest("pde-vs-pd")
> +		test_vma_ranges_pde_vs_pd(fd);
> +
> +	igt_subtest("invalid-1g")
> +		test_vma_range_invalid_1g(fd);
> +
> +	igt_subtest("boundary-split")
> +		test_boundary_split(fd);
> +
> +	igt_subtest("binds-1g-partial")
> +		test_binds_1g_partial(fd);
> +
> +	igt_fixture()
> +		drm_close_driver(fd);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 26d9345ec..2637033ea 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -321,6 +321,7 @@ intel_xe_progs = [
>   	'xe_noexec_ping_pong',
>           'xe_non_msix',
>   	'xe_oa',
> +	'xe_page_reclaim',
Reviewed-by: Xin Wang <x.wang@intel.com>
>   	'xe_pat',
>   	'xe_peer2peer',
>   	'xe_pm',
