Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1838CD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 18:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D9510F3CE;
	Thu, 18 Jun 2026 18:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2Oa/z7C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D03410F3CE
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 18:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781808956; x=1813344956;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XJRjQ8O5iyUtE25gLJn2C2tQgyZ5IgvFHZGdHbFWxNE=;
 b=M2Oa/z7CPieDqmJEj6r9jlr6ecuX/j39twM53Rg+5J2ym8KYHgxCJmP3
 lM+OiOAt212fcJXe96eA/Q+RXIzgM+l8ZuvvMB89lX7ytBbjbDUCzwVgi
 4mJQ/VZ0V5i/527j8bW+FvGrG3P8xIRX0Xe55HPiO16H0t10dzho7UqLA
 bLMZpWChQpDRZPCQPo6h+XFSiwUlfn7l1+TCqk/psKkTHc6+R1sRC7MyR
 qdsvLqHk0iQ8cpyZmvYJnv2boGfyy4CEhv/yLUdHMdvfMD5HidkG1Ra7F
 xCF/+PICEs2fNwxoXgkvG/VtgZ+ngKnzYJ6QEykBBq3IPK4cd6JkulaFa g==;
X-CSE-ConnectionGUID: 41o4o5uhQSOKF/DJOlnlbg==
X-CSE-MsgGUID: BK6bHOcGQYmQAK4aQnRZZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82659931"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="82659931"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:55:54 -0700
X-CSE-ConnectionGUID: gQsiOr3cQlq8U15YLf0AdA==
X-CSE-MsgGUID: fc0PtIx9Sf+smKW0Mm9OjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="250350246"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:55:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 11:55:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 11:55:52 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 11:55:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3CINHuNqjRiqUUeTw+wHEoyvYzqhQdnsd++hx3+ZUkXt6cQSag88QnnBdLSGZ6WszcWYk8qJm4lkL+GvVFfoNCwOBZbYInn35Uj87OabaiOtrudFvol2LH5wrICkJjkicLTVtbGoi1kH1CUd9ViUCk9MmAhzajOoOozjreA2uJIT4xs3BmzqdPHQTeCKvaqoZfVVBaC+HmlzIPs5G+kzbJDHK0DXujpmcQ4NBQ86xABI9ijePJLAdrbgztCU1lwtCa4a1oR2ZfV/LDvFFe5XVLruCZ8bedlC4zaa+0YmgalUsX2DZ8YlvK9IxUUYpW/kCV5h+DykNfjI9JDgYLpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxnLdEF4OuK3e8/Y7cAVx+NSL0urRz+/otJqoCD3Rmc=;
 b=DA4vp9i3tyCfxO51JgntWW+hK5zCbKB71TGzpBgx4g1dRD/9Mb68sIGaVYA3+AUW0WTpHJ5nKOi8FcQco0pXwwmIdB3O0BaDc10509T66nzz6ATG1Qr9Y4JfwwSUUDrBRGr3/GnmW/T7HUcuwP36S/Vg2ohsTQdYXOOouYEBTqz1L/+oM/6ARsqLjn5ZcPhCF5UiUnUr3BCBbanLQUWXY2Wfm1GqTUKcWZg+ZEonwZwF+kP+2y3TeFYnz8gyzMf3WQIXcuuzxGz2dGCs5Kp6Juiv/QpwA78+NxF2ykgm0+7KAg9U3H/uO2ZT6z6bULDmEdI+att5wtDRsFJj9qZg9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SJ5PPF12B0A4A9B.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::811) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 18:55:48 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 18:55:48 +0000
Message-ID: <210af144-af2e-4752-8645-031b8a3c2886@intel.com>
Date: Fri, 19 Jun 2026 00:25:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] lib/rand: move static inlines to proper
 functions
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
References: <cover.1781791747.git.jani.nikula@intel.com>
 <40a88ff11484791be04e69d648a0a09aa218f9f2.1781791747.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <40a88ff11484791be04e69d648a0a09aa218f9f2.1781791747.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0265.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::19) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SJ5PPF12B0A4A9B:EE_
X-MS-Office365-Filtering-Correlation-Id: 10064c54-7eca-4c58-7572-08decd6b358c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: e2FBz8jBx62nIebtbl3O26AycioLWf3SuDbbaak0MrakJWICwYU+xEt+LjWcgUeeXf4+6Z3k7LV2JBHb6uwAp/kWhM2mt7TR6bLWu2EK9MavR9rBDH5R85N7yFbRkoL0CnAbmrP+r2sDAaZFJGbMf5VVuuFqK/X5Ga6tbD5Qt1ChHFrgBRXL93C3mgy8fZljeXmbzETawJ8O9Dv6PWRIfoQs6rPxtNOGaUWN2DaoPyFcPd1d2/ndfqUmVtH5q8WgjFIayeKzYIgEuVNGi6aB/1pOVLq/g2zk+Mw+kyyrnUWLQaAzU3gFOcZx5PSLU2fadL5RMxC8NhXGCRHLU6uujf4yAM8kZljbg4qm2GA3l02YldfRSzpRZU4HYBagPZffxeHmmAX0KZNQ6I3hjPMjt9BF/4lHpnZxiED074ZfNeZ/+Qk4kvpn8UVc927Di9Dnl44Y/84S5G7UST/NJHZfHjWhMiiWlJhTrON+XH778cJDFnPkFlJwMNrdTOjgMF8pXcc05Wo1i1GdkvKUZA6QUzgJFkBonrtzQZmraFhFeWbhYMyew8Nqd10toeFMLd5vcH9+9hv1ft929Lray5mOCSsGsB+SdRJTF5I+Ey2NiK5CemU7jOOVAzLDRRwJIV1IVT52ViZqfpetRWwUi3b8jxb9R/dEZ47cS9kiszWoUxtLrw22xxf/srv+/ZLhgPzJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bS9zNzVlUTlmMUNiNTFUeU5vR3BlbFQ4SVFNRmFpTnNUWVVQSU1USmszR0Nv?=
 =?utf-8?B?ZlJDOVlRM2o2RWhwZXd4bXJ3aEtCNXAyY1lYOE1LOFBoZVdYVFc4NUFkTlJC?=
 =?utf-8?B?RWl6VmQydlNjSDJSN0cvVE5MaUVFbHdkRU1KOXVrU1NmQTB5aFc5RCtYVlZX?=
 =?utf-8?B?cEwrUnB1NDlqeTRQZXhON2p0aUdvajVuVEVwenBtLzd0OXlBT1c4cXlyRVJO?=
 =?utf-8?B?WUJEOHBzZFJETlpLVXdzbDFTa3BJeHdXR1ZqS2MrRW8xYTA1NUNMYW1nemc1?=
 =?utf-8?B?UThUY281QzhPYitVY216ajVqNUFaVEZURmZydGR3dm1Kc09MUWFwb2dzcjFV?=
 =?utf-8?B?UmY5QWpjZFZxYnBNWS8waWRlaVp5bE5BbndwcmFzMzhLaTl2Skp2WTEyZG14?=
 =?utf-8?B?dUJqekRhUlIwK243ZE9MZFdOd3RqYkNSOXBBV2VzcWszSTdHZDh2VjlMT3My?=
 =?utf-8?B?UURJSjFrcDFQakF0azdKb0V6ZHFpNmlsWFVPblloa3VOUTZXeUl1N3BiT0NP?=
 =?utf-8?B?THdneGlwVytWVzh1M2k3d0QrMTNlQWRIKzZxaWFFZmlEdlB6bkRLaFNTb1ph?=
 =?utf-8?B?UTBrOVVsclRxRHpLWWljUnV5R3NYWG1HUEdtbW9tVW8veXRGUmFrakZuM3dp?=
 =?utf-8?B?SnQvNVNPSm1lbko5VERIRmV0b3d4blFOTWpBWEsyUzlBQzQ2SXBjdmNzb0lw?=
 =?utf-8?B?eHZtNkZZTDZWZTY0elMwempZREZzeTJ2U25IMU1xT3MvWjdoRG9OZEdLK1RJ?=
 =?utf-8?B?RHlEWkNtRzNUK1M1SmxIdGRDdEZwdFFUbitZUGJ6aS9Ed042TUlQNVJKaG05?=
 =?utf-8?B?eStMK05Ed2MxU3hUcVpLOEtFcnZRdzBmUklwWjR1Nkx1NERWdnBtTm94TVFa?=
 =?utf-8?B?azVTTTF3blZnTFFLa1lFbmxaQ25yMWRCZlJkV1VpSGcvNndOZk5ib2lqeVpr?=
 =?utf-8?B?aTRwUGdYWTRKYk9zR2NhekFjd3RJR01TQ1h6eStmU1k1QU1jYWxUak9WZlRG?=
 =?utf-8?B?KzFvTG14TGZmZEljNk1wRzdiMnFvVEVGcVhMUE5BbnBMcUZnOEFnaENlMDhK?=
 =?utf-8?B?WGhoNTk2SThrbllKNFRjaUZWdmVKemhEcWJvclFjeGMvYXI3a2xnamN6TFM2?=
 =?utf-8?B?L3BGQ01ZZG0xdHNUQytJY3RUSnIvWEdRRHhKUEtCY2R0bnFzYTZhcWFWSUdC?=
 =?utf-8?B?TXF4UTQ3U1hFL0dXckYvUmFxcXhVdTkzaDFrTmJKN1lZeXdIeEtPUk9kR3dh?=
 =?utf-8?B?NjFRUEdDbkFEU2lTQkkzaFRYOGllU1dVL1hWWnNId2gyUVZZYjM3Q21JRjhQ?=
 =?utf-8?B?VEN2bEt1UXkxL09VdnNKWG9MaTl1QVNhUk5pUGtraDZnWGgwWEV1QVl4TnFU?=
 =?utf-8?B?NzE5SUYrVHV3R3JVWmFXdjEyZEQ2UWJjRDQ3YlNWTU0rQkVGNnljMmIrTVRS?=
 =?utf-8?B?alpmY0FZZDJpcHhBRW04dlI5cXZURHNrMEVuQjBOVG5hcHFFc2w1L1pvdkd5?=
 =?utf-8?B?OThVZzg1RENSWUNzcW5uMitZTHplVFZuZldkRWZQYkxBTWt5MFU4K1FLcGRG?=
 =?utf-8?B?WUxsLzVSNlRMR2Y4TnF3aEdNNzhCZFN3TkJUam1yRTdLaU1WYUxGUXNEeitB?=
 =?utf-8?B?bWlIUTlGYlkra0puaG1ncUJhdWtraGs5YmtLemw0U3RUTXJPbHY5dHdveVYy?=
 =?utf-8?B?SkxzSzNkOHF5OVkrVDJWUU5YOXZKVW1BaDZtUG9aOHVsNTF4QmFTVmdvVzBZ?=
 =?utf-8?B?MnZlelk1YU9lMGdHK20zR1JjNURmNU5TYWhOcVhaTU53VWlnWlVPcEgvS1Zz?=
 =?utf-8?B?bkV1WkJPcm0rbFJuanJUSy9sRFpBZWtETnJsdlpSNTlhcEg0QVIrTk5wUm5z?=
 =?utf-8?B?YmxOQk5ueDRac29rU3BwbjFZQTZQYXR2aENRK3VCbi9xa0ZLay9ya0h1UDZx?=
 =?utf-8?B?dTRUMlV3K0JTeDF6bGlwZ2Z3alNzcVJrLzUvYnhFZ2Q4OE9YcW45VER1ZFZr?=
 =?utf-8?B?WjA5VXV0d0hKVGMyMTVNMTdqbzNtYk1QWkJyNGJza3AvejZidkpmRDlmYTM0?=
 =?utf-8?B?dFR6NjlqK08yaVl4Q3o4NHVxczIycWtaTVZjNGZ2eXJqZGU3QTgvc25xb3Ro?=
 =?utf-8?B?RVgzK1RNZEc5bit2Y2syNjR3QUo5NldIR2RaN3BKY2dxUWNrQ2lvd0dJMjRl?=
 =?utf-8?B?U3A4SEpQTTVDcjhmRG95RzlCNExVbGVzZzYzZmFDdHFmbFVCUzh0dzJIT0ps?=
 =?utf-8?B?b05Vb2QyVFNyU0MvWVRXWWU1c05vcGk0NGRHcm1xdWNrWVVlVVNnYW9XUFRR?=
 =?utf-8?B?QnorMU1IMWtSU0ZFUDl4VlVMbjA1WUZwZ3BqWnc1Um1ZL3RZU3NzZz09?=
X-Exchange-RoutingPolicyChecked: Ic0KCCeCpFyucLmZonm9o0npk1ebjYrKcV4ttjCU3dyWHiYDg4zSeiiuUuN/+TcaFJaiCWth6vJY7GzwzwbO2ovhvGtuydCNPeJcc6gNkqid6Y9cGy1xN0joN5XbXco2At41l4JEx41XSyQG2054fEEsuMhq4qOnpRFICoJb3nKdoBA1jR1Yb2IyoakkeOJThpx8h/pvVfvrxl81yCYO3o6RhUt0lcQ4UiyFmo/MZk9ZxbShiZ8hmg4/BV7Yb9QJ4T1g2YmN70McNnVl4l42aW608I3UOWMmtJcNmC4x/TuyseSv58drKK9+UvpQK7MH+csrRwVhoOkn7YY8ophGHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10064c54-7eca-4c58-7572-08decd6b358c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 18:55:48.2396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OotbY1qF4gTiVDniC80uoh+eFCZ5LICie3gNByrSt9VLHbSDX9JU5P+LgMKOaLLdg9jnJgcPt+zzPcqQidGRYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF12B0A4A9B
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

Hi Jani

On 18-06-2026 07:39 pm, Jani Nikula wrote:
> Hide the implementation details. Gut feeling says this also allows the
> compiler to do better optimizations within the compilation unit.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

> ---
>   lib/igt_rand.c | 13 +++++++++++++
>   lib/igt_rand.h | 13 ++-----------
>   2 files changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/lib/igt_rand.c b/lib/igt_rand.c
> index 16a6ba9b0c65..b2856d000450 100644
> --- a/lib/igt_rand.c
> +++ b/lib/igt_rand.c
> @@ -35,3 +35,16 @@ uint32_t hars_petruska_f54_1_random_unsafe(void)
>   {
>   	return hars_petruska_f54_1_random(&global);
>   }
> +
> +void hars_petruska_f54_1_random_perturb(uint32_t xor)
> +{
> +	uint32_t seed = hars_petruska_f54_1_random_seed(0) ^ xor;
> +	hars_petruska_f54_1_random_seed(seed);
> +	hars_petruska_f54_1_random_seed(hars_petruska_f54_1_random_unsafe());
> +}
> +
> +/* Returns: pseudo-random number in interval [0, ep_ro) */
> +uint32_t hars_petruska_f54_1_random_unsafe_max(uint32_t ep_ro)
> +{
> +	return ((uint64_t)hars_petruska_f54_1_random_unsafe() * ep_ro) >> 32;
> +}
> diff --git a/lib/igt_rand.h b/lib/igt_rand.h
> index 0015680461c1..d89803bb020b 100644
> --- a/lib/igt_rand.h
> +++ b/lib/igt_rand.h
> @@ -32,17 +32,8 @@ uint64_t hars_petruska_f54_1_random64(uint32_t *s);
>   uint32_t hars_petruska_f54_1_random_seed(uint32_t seed);
>   uint32_t hars_petruska_f54_1_random_unsafe(void);
>   
> -static inline void hars_petruska_f54_1_random_perturb(uint32_t xor)
> -{
> -	uint32_t seed = hars_petruska_f54_1_random_seed(0) ^ xor;
> -	hars_petruska_f54_1_random_seed(seed);
> -	hars_petruska_f54_1_random_seed(hars_petruska_f54_1_random_unsafe());
> -}
> +void hars_petruska_f54_1_random_perturb(uint32_t xor);
>   
> -/* Returns: pseudo-random number in interval [0, ep_ro) */
> -static inline uint32_t hars_petruska_f54_1_random_unsafe_max(uint32_t ep_ro)
> -{
> -	return ((uint64_t)hars_petruska_f54_1_random_unsafe() * ep_ro) >> 32;
> -}
> +uint32_t hars_petruska_f54_1_random_unsafe_max(uint32_t ep_ro);
>   
>   #endif /* IGT_RAND_H */
