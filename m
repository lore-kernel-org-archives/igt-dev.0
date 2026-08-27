Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED6FC5DF9D
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 06:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C41110E3A9;
	Thu, 27 Aug 2026 06:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhfOEmX9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F5310E3A9
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 06:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787813677; x=1819349677;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TfnovhTjnW/klsHA19qWYZZ2ayUkQA0HcVqG9DPsYtQ=;
 b=EhfOEmX9hutTWb9yBwB+2dLyulz03YTfYHLHbWiJUrNI8GMleIG2luD7
 9ha9Psj8d6/bjMzRs9qSVrLHKrPbJPkux49e4hA8DWYkOe/82XJJ+5ysx
 SPkw4ZqdoqMZXLkMJuMduZtiV/0SMUiM0JWWSfTUrcz/QP9cy+8IIf8Xu
 PRqtT0q2vaRs70ox0cbGyMVhLHu6y0edND8GQHQju1RXKuMlryHThMPR5
 UZ5xlq10IC++IRq6aOPS+hXGrReD0c61T96YMEPW/+bycrwpDQQ+iYURk
 MSiz0T3GY//nZGSmf3RigynWrK6nTg/mWdHqkodVAGGrC5DbEqSuSBdIu Q==;
X-CSE-ConnectionGUID: GDvKUSfNRSy8u0oRqW0sMw==
X-CSE-MsgGUID: oQQmubjDTDG7KS2bF1jl4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88362017"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88362017"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:54:37 -0700
X-CSE-ConnectionGUID: F7s1iQ7dRm2cSpbZmHVQdg==
X-CSE-MsgGUID: Fhmx2VSvTFa00rWDkNbQmg==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:54:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:54:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 23:54:36 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftkInxXNSfOgcQgxHxu51Ufev7iplh2XXpUAR3qQ+7w9OV7Rou3fdEqcNCJ817HagzOAZhuFDkMKxjIom4+lGpY+qVJh5rkSgPC+gjFJ6QWBuMBsy9zU/NT/txu6lYMCDYj2qI2wgtvlnIhoYkh0S5as94VG231a+v2rC0cdBVRjCSMxsfIrYuIm12I1MQTRC0Iuj+85wPFAk+LeYObi9N10hIOpueyeBHerBGaFQ3sq0dl3VjO9AYlmcC844OfWcBc1vfFKsxjo4ahh+uFAlr3k5zYgSsq0ZhqlVS9J0ANdLo5rkhRon+rAoAeWE1j/FjVRvKbL3GXi6lgKWovHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJFxCiEljsBBzFs8U87ToOcoTwUqW8+1GnzsmGT2cjE=;
 b=glSeZvKwI8j2+4e2jeDvTKgmHB9Fp2/QuGgPf4wu5cY3dynNnkqWAd1KmW9xYTZX/VBkAoaM1RrwElD8gZI6deqEIcrp2a/OMt4euDGtAk3Q9zR3twDqgDRSrzK+a704otqOyRup+nPC/OuueuIonIbwFS4xZsQW2iTRVK4xoZZaSou4GnawtPEV8CHQvYU/zr6R3iSsuY8nfLFQayDKTeNM3x569dNv5E6W3R+I5ySA3ieOEpJKvztgFrb3xNApDxNJ46oupkiFODiyoj3uOYdcu9JPzF3oynNAmtk16esUW4KTybo1TUXxwsWLjGjAbe27OMq/Zwqxevk/GdixDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH7PR11MB6697.namprd11.prod.outlook.com (2603:10b6:510:1ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 27 Aug
 2026 06:54:27 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.005; Thu, 27 Aug 2026
 06:54:21 +0000
Message-ID: <c492af94-cac9-4e0e-b737-68ce25a36733@intel.com>
Date: Thu, 27 Aug 2026 12:24:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/3] lib/igt_kms: Add helper to return vblank
 timestamp and sequence
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <mitulkumar.ajitkumar.golani@intel.com>
References: <20260825183359.2791891-1-ramanaidu.naladala@intel.com>
 <20260825183359.2791891-2-ramanaidu.naladala@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260825183359.2791891-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0207.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::15) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH7PR11MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4f5c19-5cb9-4f60-1580-08df040805cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|4143699003|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VBzqXmgroJT3YOOU55X+vvDn7DNvOR9xey9Nt7zolArw+jCpkUAk7GfodE2HnEuvU3/8qssUUuN69fluyxuoYeWIPlBemY1EfWVVqwXh7klhEUijSqVL8z+XlmfA3w9raaX1JyP4CJ1UfdpIJ2HT7GUabniQCZxzyMNjVktN/r582bUVs3/ItS7UVf/HFU8hN+DM8r04GHlRPTqAMCzTmUx1XysXa0oAWN/bxQpGiU0x3gloU4jfVfsOYn+H2P9W81YcmTy3BKcgQ8O3qINoxE0vABnW0foJQWQo/DWhxS3mVwLqGbqsr929bmNv/9EzXaFUevzqoxjPYSyNk2Bk9wFgugfn9zXsgapDh0CcCLzx2wiQ6FVR2taZ/Jb7Rd1fbjPQFp22IFQMLKxv4VSA5kkxG4zhqbaCss2mAKqixqXNllnjuN8jmvIbVFUy8yXdVE+kysHQt2vgfmxQeoOAhwEq4KIEKZ4V7K1VDEa5NiZhTlJ942NXNZMIsRoSQe1lJyzXIi0JdQVSEOpKJ7FN/k27d8JIEagjRHAlKq9y1ZZ0oQjJlRujGBJL1SCgA9WJYYTY1B+Zre8HyjAJW9XbP8744G43QareOT1/2GiikHwL/oYjT0bggm5quow5vkMRN461WwLTagr0X3501leztbeJ2tzJVzijcN2pbYcFL4w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anpqbnpLNkhhMFlmaUpqc09mOTFSYUhjelhmUnQzcFVuQW5wNHpWQkRmdGEx?=
 =?utf-8?B?ZmFYQW82S2dKcFV4akR6QWdnOWRleU5jcE00MXovQnFRUUV4KzNyd0MvNFVS?=
 =?utf-8?B?T1ZhUmRyZGV1bTNxMFExSWNRNVZPc2ZsTm11VHhoemFEcjhEVkpZSEJsOGtF?=
 =?utf-8?B?clc5ZWZqWDNzdEdmMkwwUmhzdGFRODBieFVIRTZHN2MwWmNBUE9Ra1pXdjY4?=
 =?utf-8?B?aklGcnFpUGczT0RiVjRJemVaYVBhbTl4L3dBOWdwQnAwa2ZlWFdiTHc4blgz?=
 =?utf-8?B?aW9lRG5xRDZPQXJKRUVIb3hXejR1cTJMaEd0V01WcVAvU0ZhSjFtWkhpVlVw?=
 =?utf-8?B?L0lhUFloNU5vaGVoRDBRTUJXNDZNclFRVEp5LzhOd1kyc2RwTkhaMDZndXVQ?=
 =?utf-8?B?UjRVRC9IZWJvZmVtdUVTckc4UEJPQnIrNjczN01XdFdrNlA1SmwydUh5SWk0?=
 =?utf-8?B?VW4rOTd4cHBJRlZvUlVjZmRTUzRGcWduU1gzUXI4YUR3dGY3eExIUXlQUFov?=
 =?utf-8?B?bnNDeXZ1dWxlTVV6dmQ0NHpIYXVPeWY1ZDF4Z0hMSnp1QjlTYzFuQnZBOS80?=
 =?utf-8?B?cGh4eVcyZjUrVVpweFkvUkpXS3pMK3hVZ09IYk1RYUJuL0RtMENCQit6eWdK?=
 =?utf-8?B?QmZWL2JMU2xITVJ0Uy85U0xhWUsxTHNXdVJQZS95clhrM2xUZkhuSWt3S29D?=
 =?utf-8?B?UDRvQUZPK3pOTG1CbHZYSlJqTFUrYzJ4RzhuTHc5KzQvbWpRWTI4TUNCK0NB?=
 =?utf-8?B?NklSeUE3T2cxbGpHNUlqZ1Awd3JNaHlWMy9JbnhOeitOZXU1dXNjREJlc1Ry?=
 =?utf-8?B?N2pHUUNhQWxFcm1kM2txWHl1SmxOdWJYZUViTkJxSGU1dGYzNWRmLy9SMGlB?=
 =?utf-8?B?MEVzdk43VzMvUXM2VmpOYUc5ZlZyc0M5ZEhTTXI0T2l3WGVvRGlYbStiTU8w?=
 =?utf-8?B?c0lDZlpieG1HYzhwUThTUDgrd1lRU1FWdng4SEIvcEZMUXErQkl0THRSVGlt?=
 =?utf-8?B?b2thVE1VdFl6VjJSOU5KTFlFOHd0RzBsa0hoYmYvOW9jaXZsQllHb2trRnlO?=
 =?utf-8?B?d256Z3BjY24vcE4xK3YzYk5JWk53WWNiVm1uOUd0cGNnYThBeTg1eEFBOWlQ?=
 =?utf-8?B?b1J3T1R6TEo5ZnMvUkVRaU5Ud1JaUlpReUdmd3JLQnc1aUtIQy9kcUo0Rm9r?=
 =?utf-8?B?dHJJa0NXY2NKdnk2UWFPNHdhRHFCMW1CODJTVWtYb003aFY5cW9ENnpaVkdi?=
 =?utf-8?B?Vk5SSDhvS2pGS25sZnJDRk1YME0zUVB0dmE1TGJBT0x4cmY1YVp2ZHBMM09J?=
 =?utf-8?B?d1Z6Smw5WUdMMlh2cWNFVlp6b2JWNDNPRnh4SHI5L0ZZQTdjdVBuOGh3eUc4?=
 =?utf-8?B?RFFVTjdGcWs4Q1g1WHdSU20wWThZbW83OXZZUjBCU2dDV3JLQjJyeGJ5ZFN6?=
 =?utf-8?B?NWVURHIxZGlmcVZmVzBuWENJQVF4YVErdXA1UDVsUjdLQ3B2M0RMUzJHeU43?=
 =?utf-8?B?YnRHaE41N1ZjeUg5c3dqaWdlZDBRaVhNR29OZyt1VjV6a2tHalZya091RjVs?=
 =?utf-8?B?aGJUUVlJam9GbzZJQzI1UnBleFdncTJEUWNsWU4wekRXUVlWbjlwRlhJTFVU?=
 =?utf-8?B?aXdVYVozcjcySllmMTRuWjRESi9hZWxoR2RLRmJxNytNalRtNUdvS1paQ1lt?=
 =?utf-8?B?TlhLcXk5bThiWTIrZVZ0dEF6Wk1ScE02RTMxajh3SUNBZVkzTUF4OWhYaCt5?=
 =?utf-8?B?ZVg0RFprZlgzei9iWFNxc1E1dEJYNjNYaW9RQ0xCcXJvWnpsWk9qc2xxVE5T?=
 =?utf-8?B?L1cvcjZ0Y2NFaGt1bU5TL2x5ZWlOenYxaE1ZaklkSHM3VnM1cUhIbzRHMnFa?=
 =?utf-8?B?NFNvNXo2Q2xkOFd6ZjVUbnBZbDhiRFYrc0dEQk1QaDdNejA5VDBFc1g4dFll?=
 =?utf-8?B?NWdqNXVYSHFvdnp1dnBvT2gvSkVVRU1NeDhmUVpaMkdSMFJVVnR2QUIxalNs?=
 =?utf-8?B?V1F0MUZIQ3NJVzY3a281SzFPRmF3bGl2UjJhUnNHUzBodmo3dC81Qm1oalFF?=
 =?utf-8?B?Z1NScklDWU5zWE1OYzJlTWhVZjI1UzdDRVFET0FnVENqQlowek13K3Z1cGJO?=
 =?utf-8?B?d3dteHYzL2ZzYjgvUUpJRzdWWVowV2lnUStNcDlyeFluek5ZdXNhS2FraTV3?=
 =?utf-8?B?blRROVFWdWtTOSthVnVBNDg4UnJqQ1d0OFlxTTQrRlgyUlUxancrcFNJYTQ2?=
 =?utf-8?B?MDlIaE5tSUd4cnNUZWhsQ0lDdEo0cXRWOFNsa3JwblpnTXZhaTJ0ak50a0h6?=
 =?utf-8?B?TkkrdFVOSDJ1QWVWcHlkU05oOXNxeERVeDFHMDNWUDFUTUZvTWhtMjhBeDV2?=
 =?utf-8?Q?oi/PrbaO/n69L5Yuf/qcdiYIslw2L1kC/PWJi?=
X-Exchange-RoutingPolicyChecked: ibcffs6cdJIwDg/8S3Vaxjyh0tGLVTaE/ratnyhjmgDBFqAoE7OqdDhr+Tuc8g/n2V5PugEA01ZouLEJkEU2PWW3lwxlzEaq/GIK/hZ+fH0Ke1ni7pJ9uimWn2bN71R59ZKl/73rX8ZKQEab2RUT1k98N8rsweUtVfpaas6szWEcfxBEJPhy9JVeZjRYRDUalL6ww2945i+PAE8GVFOenbEC5gsTkVOD1W5U46I2Z+/Z3YSPscGnGHZHPqXFkQR1cThZQueb8FHOZvEXXT1Ag0QSg4ojaKkhXtwTq+M61Y8m5V31UiZOfC2gC37eoW3j5jf4p7NUhIFnmfiqW8GaNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4f5c19-5cb9-4f60-1580-08df040805cf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 06:54:21.7460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sEl8A1mKa93M0O9Ur0jejvQiPZ8OFRPewwfw7qUC+M3oMP2vsRTTweHsTMeLmriJSlBpuQYkWB5LHqg/4/SKE3J25KmB3fxNUIW4oJmtcUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6697
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



On 8/26/2026 12:03 AM, Naladala Ramanaidu wrote:
> Add a utility that waits for the next vertical blanking interval on a
> specified CRTC and returns the timestamp and sequence number reported
> by the kernel for that event.
> 
> Several tests need access not only to vblank synchronization but also
> to the exact timing information associated with the completed vblank.
> Having a common helper avoids repeating the same wait and timestamp
> extraction.
> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   lib/igt_kms.c | 25 +++++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 26 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 42cc7c3bd..cd4783db9 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5876,6 +5876,31 @@ void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count)
>   	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index, count) == 0);
>   }
>   
> +/**
> + * igt_wait_for_vblank_ts_seq:
> + * @crtc: the CRTC.
> + * @ts_ns: returns the vblank timestamp in nanoseconds.
> + * @seq: returns the vblank sequence number.

  * @ts_ns: returns the vblank timestamp in nanoseconds, can be NULL.
  * @seq: returns the vblank sequence number, can be NULL.

> + *
> + * Waits for the next vertical blank interval on @crtc and hands back the
> + * timestamp and the sequence number.
> + */
> +void igt_wait_for_vblank_ts_seq(igt_crtc_t *crtc, uint64_t *ts_ns, unsigned int *seq)
> +{
> +	drmVBlank wait_vbl = {
> +		.request.type = DRM_VBLANK_RELATIVE | igt_crtc_get_vbl_flag(crtc),
> +		.request.sequence = 1,
> +	};
> +
> +	do_or_die(drmWaitVBlank(crtc->display->drm_fd, &wait_vbl));
> +
> +	if (ts_ns)
> +		*ts_ns = wait_vbl.reply.tval_sec * NSEC_PER_SEC +
> +			 wait_vbl.reply.tval_usec * NSEC_PER_USEC;
> +	if (seq)
> +		*seq = wait_vbl.reply.sequence;
> +}
> +
>   /**
>    * igt_wait_for_vblank:
>    * @drm_fd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 8d4d14847..8d1928af6 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -652,6 +652,7 @@ static inline bool igt_plane_has_rotation(igt_plane_t *plane, igt_rotation_t rot
>   const char *igt_plane_rotation_name(igt_rotation_t rotation);
>   
>   void igt_wait_for_vblank(igt_crtc_t *crtc);
> +void igt_wait_for_vblank_ts_seq(igt_crtc_t *crtc, uint64_t *ts_ns, unsigned int *seq);
>   void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count);

nit: Add in the same sequence as in the c file.

With that, LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

You can now replace the local function in kms_async_flip. But that is 
for another patch.


>   
>   /**

