Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E316BCD4F21
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 00:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7747010E060;
	Wed, 13 May 2026 00:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwtXtkfP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50A010E060
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 00:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778631272; x=1810167272;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8Ze+UT5B3M/v6k07u6s66KUAhyG5bRydaWZzOatMK0Y=;
 b=EwtXtkfPTHnMF3pNSAZ8zWMP5PGrc4dcv5ZX1X6vVLC3txbViB7Q/xLu
 2oM+CWJKhSCFEFuX9rItlRxOZV3q+C3tAuaw3RQ81BX6tghgnr2QUw+Yj
 bD+nMWLn0XoVKc5zP2L7CzMmDbjmqvI0FpoAaIz4aM10j0BrDMAtZ7HKo
 4YSO74Cb6U9TD4ssidCIt0KeQYJFBdL4b0i1aM3hjMaZ1Mqm1qts6u/LF
 Z0fOVfALvGEdueeOY64X0L8JWvjT6+JhMRkVChUdyG3dq8q1vfdUvDgQG
 RkctMrzTMpIbd1WdpVoO+lhERowkfc+ljZs5ncCELw5UKyjyrzkKO9TzD g==;
X-CSE-ConnectionGUID: c+COqRRIQLqTree/fhQC/A==
X-CSE-MsgGUID: GLmQWwHiSYG4AIsnnfyGVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79503731"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79503731"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 17:14:30 -0700
X-CSE-ConnectionGUID: s3/fuPrSRyS2lvYIa/POIQ==
X-CSE-MsgGUID: H/nApAXNQ5u6N24ddkDpmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="238172902"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 17:14:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 17:14:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 17:14:29 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 17:14:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fy/WFbT+LPtvq+inIxNZV1cW7DyXmnz4wp1eiK/s14yDwcUUym77zaTGx5ee84mcePF0gDzUHlz/OXHzwBQqlr73XYUPn1iiuAJFTolMrEgIN5g74DhUU55s8EOfCG/76MybvVJtU/mp/iMQ1ENULS59gyN4NRDCmuDkYqUJow7eK49SlQZ/+xMy14xMG7awefNCoT/zXjxVKIFrurWKrMMKtfrbP53EXtkxJlYIiMYtJOwS/xMOEeHpSj5QdTgwSh3uUTJA6FENQ6Y58BDQoP3T4YblfWrDm3Hvszr5I8bYryN3YF0yV2C8DPhYvBcsD2Zlv0xDn66lHBU5fjp2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7ATcREd110nsW8uW980yfNs6Oad6ce0U0G7AcydYJQ=;
 b=Ll9wTgG87dD7bdIT4JbydPLmx7UIblVKQhtYaRjzr+KtmW62JmfQimPiSlkt3INUtuBfFq8MhP4VX+XtJgjkZaEiahvjfPSX94TymZFyYnULZgfp8NaREX4fxMN+PykmGC+Fxjxp8o6wE2U85wmKzlU9Xg4+2XtToJU0oiKoFmvxWLXqX6TsQ4FO0On2491j4VFedZrsOwj8kX2h0Y1Afi2Q0IYuO+zYQfPfP+JeBKvwfIhnNbbgKdkxL+w+jsOIj/UNNbWn4zB4vePhhAU9m+kCT8lHNm+weyDRMKE/eT3yfHwCq6HcSfXMOgs1pHYMZtHhA2WB0/8rGDWGexFDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH7PR11MB6355.namprd11.prod.outlook.com (2603:10b6:510:1fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 00:13:08 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 00:13:08 +0000
Message-ID: <8dc2f316-e65c-4f5f-9795-2c57920829be@intel.com>
Date: Tue, 12 May 2026 17:13:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/intel_pat: skip UC compression when FlatCCS
 unavailable
To: <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <stuart.summers@intel.com>
References: <20260512033504.3665416-1-nishit.sharma@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260512033504.3665416-1-nishit.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|PH7PR11MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e77c7f1-d83e-4e9c-c0f3-08deb084690e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|366016|376014|1800799024|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: QvyKlh1jrk534eU4xFhP1+oLJtVKWut7Y78V2WfVf81tHflW+SZu0O17xgkVN6mMCugdRin5VFmwASQoduuqswT1xpyeDYMY5dk+k6bTnlqRQ5Pzk6DeDzmSTermrS+wSYYDPzypZ8NU5bCWM5QB/Pikkcg6HYPN2BlPf+qLOF6KaxlKADInx+K82YbKQ4srSYweTXUXbO0DZOHRV1zZ+cNlJc3fDOzalm/o/XOcVcNVG1MIa32LlF7l9hGBMI57nYDCvd5jFauMDxExFNaHRbf5Qpe/fmiEg7O0wJXPbiXX1kVATHkZffJ4RC0KyAoo4HAH4uMKVtT/DNzXtr+WU0WjSMGEXI56l+clIPXLDk7sO0kbYrgcfbZwFmITKDNtcNGDpYZpkd8c+5ORptKg5gETJrr5zb2dfWloDbd9VErUmds8Rks/Fv48nPT3tKtwbaNx+DBMknuObyRt44ed7cL1DmPxH/dsLmjMWi6wEOFhTiiAZqDHMABCfE9WKXbHnYF3/KpYmN+CIKnm4UJyIgbsLyc6YvXyCvY8HXaBKwddUu9Bo9ullADoNTun7/eb1iOHhaIVKrfpQuIyW+6pox08Vv1IGRNzY+q5YoL0XZjKh9cHhoNhejFx8UjCqn9o7jDxwc3YtrXjkv2+8PPUas1ajBTOlL10EpSK/qYcbe3FUsxkmuS/I8dKoxyuLNw4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXNjdUpwbnN3RnIvRFlkQ2svN1ZRbS81em94ejZ6WkdFa0x5dHN4TTU3L0RE?=
 =?utf-8?B?VzlIK0RVaGZRQWdiRCtNSisyU3VWRzB2WU5yeCtDeFhPd2lsKzVBOVcxTlNG?=
 =?utf-8?B?VENCVHJvWDNiSzBVYldjOWdPWFl2Vmt5TXFKUjEzNTg3QkhpSHVXYXNMcU9X?=
 =?utf-8?B?cUlWOHMxVUVEeE5IZ3c1TFJPbkNxN1ZZZW9QNkwyelR6dVo3ZkJ6dEIzUWs1?=
 =?utf-8?B?ZzZXbnczcDVZbEFpSUhpWUlaa2Roei9YV1ppcDBCWHBMUkZvUnR5Rjh2K0h1?=
 =?utf-8?B?UFZMYWNNb1hubFljNGhsTDZkRmk2eGorZC9ubHNXRUtzVFdNTk5idENNcjVV?=
 =?utf-8?B?WlBOdTRLbngybTJCL1B6YmovK2N0QkNla0xOTTdudTBzaWhlOHdJekVMRndu?=
 =?utf-8?B?K2ZUZWpQckFaUWhWNmVuc212ZWQydTFBUkNyU21iYWw3eHVrMFlENFlHVHRZ?=
 =?utf-8?B?b1hYVk9iM2lXRzdPNWxrdTF5cUg4VWhZS09Wd2ZWZjdUQk53aDRvbFJjOXlu?=
 =?utf-8?B?aVY2ajR2WXhsbFhpQUhqT1p1SVkzb1VuZU5WcjBPRGFWdUZvUWtsTmN5Ykc2?=
 =?utf-8?B?SHFGVzZuamVLQlF6OEp6dktFK2tpUllBencxbnJsalh4cVB0OGVOUHpvazRu?=
 =?utf-8?B?aWk5cFJJOURYMllOVFdiOVEwRnFlZGxuVFgvUzNDYS9XTlM4RHJ6c2JZM0Jj?=
 =?utf-8?B?YWJESElFeVk3Zzh1UitjOCtxM2ttbjE1T2ZoVFZ0T3B6WHdya0pRREFuRk1U?=
 =?utf-8?B?WVdPV1ZHZzZCa2tHU1NTZjJyS0tGdFlWN3dJUWVBTmJiQWlpQ2lNbTVkLzln?=
 =?utf-8?B?RWV6TUpJMHpZM0tYU0RzU3M2MjNIcEZJcDlzb1cxdHVjQ3gvV2FVZXZRQ2cv?=
 =?utf-8?B?cEdCYkw2Nlg5WEFmVkNQaUEvUllIejJtM0wxQWZlVTg5TldXNzU0elcvZEVx?=
 =?utf-8?B?ZlVuQ01UU1AyRU91c2U2S0JlUUdEZXM3VjlsK0dXaTIyeExralBBV3pHeUhy?=
 =?utf-8?B?RWpIaDZYYkFoNTJsaXRRZ0VWaWk5MWl6ZXNVTElCREMxcGdjckpadDlwWlBY?=
 =?utf-8?B?VDJsREh1azlLc25QRjhLcWFMN3h5WmN6ZTE2VnRNbldrd21USXVnaDZzbG5W?=
 =?utf-8?B?ZXZzRXY1UitJYlNrUkRoSmdRU3k5QWJDeE1NNEltVGtDTWxrMjluT1pHc2J2?=
 =?utf-8?B?QndiU3hMeHRnaEdrbVExbDU0UWJvWGJPVXAwYlJMc3AxZFk3SThaMjBWTjM5?=
 =?utf-8?B?SjJndWRFV3BESzhTdmFWTHdPMFZ6UzlKR1c1VHRRT2lYTGlrUlQzUmpFYXZT?=
 =?utf-8?B?b2V3MFpJbTRFUkdnZmZJUHlLWk1mMXg4cjEwaUpabDFnOUVzZnM1ODBsUUpp?=
 =?utf-8?B?WG9ScTZ4OVVKdHJUUmMzUlpTK0hOUXVmdWxFbExOekxRTVpoZ0J5UklsR21q?=
 =?utf-8?B?aDRId2YybGNXNkV3LzcxelNNaHZKVHpyVENKZjVkQzZNY1JNTGtKTW51OWhk?=
 =?utf-8?B?Y1d6NTRyZGdzQ1dOUy9uUlJtQzJBY1dTWkZDT1dCOUZ4ZUhlWEcrNysrYkto?=
 =?utf-8?B?dEkrY2dWUnNWUHd5TlFSZTc1dWFzcUxCZ0cwa3FkVStjdmlnRmtIWWNhVnY0?=
 =?utf-8?B?SnI0VkdiQnFMbUJMNVBJTFRaYkRwQWlkTTJSN2h5dzd6SHFrWm1hL1NQYUpF?=
 =?utf-8?B?SHJFZ3QvNjNIcThSb2RHVm1rQkdsNVdvVU5QN1BoeExndVZ3eS9WN3NuTWw1?=
 =?utf-8?B?bHRWMVgrQmhPOENWMjZjcVRqSjdaeVJEUkZFVTMvY255RXlqRS9ZRzRtTExy?=
 =?utf-8?B?Y2lCZk5aVXUzbE9kRUd2WkZHdDVldUx0Zkd6V0VEa1E1SkUxaTJJckljWVF6?=
 =?utf-8?B?Q1hMeHpId2FVYks4NmdLRm5zcXR5RG5ZdXdBYTJ6ZG1idHJDSWxYNC9zVnZS?=
 =?utf-8?B?aWJnQkxCSlZKQi94MG1jS0NBNGxiOE1rd0xOZnBPd1BMNXMyRGlKb2hjWk1J?=
 =?utf-8?B?WTRLN2NuRU0vYmZvVXJaSWl0MTRwaGFmY3pkK3I0NlhEajlYZFd6eXdWbXB0?=
 =?utf-8?B?RkhkeEpocVFCaC9XT2tMWXhocVQ0cnJtSC91RldYMGRvNFAxSyt0SkthYTdF?=
 =?utf-8?B?aU9HN2pEaTl2VVN6VnlHd0xYdFVOQWtpUE13RXU5ZS9RdlhUa2R2b0NrMHRu?=
 =?utf-8?B?VTVyOHdzczBGUkxld21wWGRvR2FnejlOVmZ2WER6QUh3K2dUbDVSNTlzZWtx?=
 =?utf-8?B?L2trQWk5emRZOTI5bmhjdW44OXdxeUI0Nkx1UGw1UE5HdW02aGFvRWpsWkVt?=
 =?utf-8?B?T2JRRWttdkJUeU04QS9RTitvc3J2bFdhOEJHRW9jektYQnVTU0hTQT09?=
X-Exchange-RoutingPolicyChecked: guCEkRE3vdCpFzDkEZTnGxzB6t3BVBeyYtD4+G+w2oHiz5Rg5c21hhlV+SOjIj6bhqp+QLgiVsh/UhC7vOmXOjga/YscBWR3KRTUUaVbTgTA9jzQ8/2cuiXn9bQJVANjEkgZ7TWhkMVDrTLkg/nWtoxiLMm2wm2LC+txjkssRinPWY3g7t7SLQHL3mS+G2kIze26fkSvbUUbGsAGT/HiY2nAyHSO7tuE0A67OIVos6xnfl/muPhE83VK5ElNCUa4H1d7u4YwDZbrhnlnANLt5JBJh9pXkJMTq0YcfaPdIZkCSWrUNOKMdUGwGNHIb91sSKtuSGAyg6V/NeUtVgwZWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e77c7f1-d83e-4e9c-c0f3-08deb084690e
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 00:13:07.9784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPemsXP7si0BTwcpaU65SnNe/kEzg+jC6LztB88DorCMckNV78vPHVPMNf1LTdGHtbCaqkraByI3Tz51SAatfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6355
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



On 5/11/2026 20:35, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
>
> Use igt_require in place of igt_assert to avoid treating unsupported
> platform conditions as test errors in CI. Since UC compression is
> supported only on FlatCCS platforms, skip the test on platforms without
> FlatCCS.
>
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>   lib/intel_pat.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 2f35bb772..bcf31b4b2 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -276,7 +276,7 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
>   	uint16_t dev_id = intel_get_drm_devid(fd);
>   
>   	igt_assert(intel_gen(dev_id) >= 20);
> -	igt_assert(HAS_FLATCCS(dev_id));
> +	igt_require_f(HAS_FLATCCS(dev_id), "FlatCCS not available on platform, skipping");
>   
As a basic library function, I don't think we should skip test cases here.
Theoretically, this function should return a value to the caller under 
all circumstances.
When on an unsupported platform, it's more logical to directly return 
`XE_PAT_IDX_INVALID`,
allowing the caller to decide whether to skip the test.

Thanks
Xin
>   	intel_get_pat_idx(fd, &pat);
>   	igt_assert_f(pat.uc_comp != XE_PAT_IDX_INVALID,

