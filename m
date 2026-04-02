Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A4BD39413
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 11:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1FD10E409;
	Thu,  2 Apr 2026 11:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMuwVQTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B07D10E409
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 11:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775128776; x=1806664776;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QyZhxVLlT9KNYkjz+kj1huDLmwa4ZYybzDGTebJueUo=;
 b=kMuwVQThYr2o3XAsasjPqusAC/vIzoYhMhpShCCmx8C0Vfa0o5A6lCF6
 WGdLI9HR6xa5/+HDdxl5yKpPoKYkzkeui9PI5Q5Xw+g5uXhcCbmo1VH+j
 eNceiv3CHBdvqjZ7eclOBi9Ij/zCb2fZZFZOvw664J8milxn6Lszg2E/v
 pP4VGE9DbrVQ4JXu64lDG3mcTspBQS/SWA5VFmhc5rEecS2Z9ob/vPvee
 vIqF/9ShGB8CQV6YNgygYZwmw4itIel9PeCava56svg2TY0FjaksjvCLn
 2u8x03FiYpscYecvNegj0U/eEwkXaJxXxF0eQ3AdYYKs9jFuDB7oyHqnj w==;
X-CSE-ConnectionGUID: AsI9RedZT72wGoJog2FYxQ==
X-CSE-MsgGUID: J3BaPvhOTTiYlNsZVpCgSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76242709"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76242709"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 04:19:36 -0700
X-CSE-ConnectionGUID: C3zrIU0YTOSqew6A81NZVw==
X-CSE-MsgGUID: bFzVodToRR6kJvyPBcId7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="250018339"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 04:19:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 04:19:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 04:19:35 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 04:19:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWV+YNOkhhZZXRIKf1CXQQ/7LGABto55IBuZcqJ8nTGxe1BhSP7NxNuDJuo12b9HOFFB8Z8UaXYWWDKlS9/DE2ygNMWFmDVOBPV6S/J7J+rFCEVQoSefy1gzbnJqL/+kkq6qKpfBMfPWuDeVasIiE1d+h5oab7slzGUy3zen6Ibt6pCcIiuaZZfA1OTFP6CBpIR85fG3w+WhRUPdwkEIPvu/dOc7He1UyvSfhjHc4/9yQRuxSA15/CFlfmg6PmeROmI6NAl7oKc1u3M9O5xckYJKrrW3aSoRuUsbTMvLT83lqxP/0y3Z3FVxTHFoyBMhmcHg3CVl65pVilv6ROOT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n228sI5Mr4TITkPgxUkTjuQhBV2YXM0AbOMPk/giulg=;
 b=EfxlWJ2jnls4hQ3wzBGgQ3FnqAiLI9xGUINCiAOBhRsSWLZxuc+559rgpC80iz8mHcyk1ksoJgpK0Dzeu95IBrom2u9N4jPRB2EV+fnpnnxEg+j2OvIIsGk49IY96GFLEohH2YVV/y3h+MwPpXr/P/b80/OZQua9VI/inwDYZ60+3xG/VhV/IjE2a5fDCcQWGvC7WFejTHm/Nxk9ihhg3mjpVtLWI47HXPIedRRmJOHhKX1iqMmh1gSToGg/7HQDKWbc/FjortU7q4dliRqgptK0khSmMqiYsJvDTn+FelNtuSXCHkB7l59QucOvpSEwPfXpqzSQAa8b91jRTRQM2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by LV3PR11MB8481.namprd11.prod.outlook.com (2603:10b6:408:1b7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 11:19:31 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 11:19:31 +0000
Message-ID: <dd1adac1-d872-4c96-8e10-33264d487118@intel.com>
Date: Thu, 2 Apr 2026 16:49:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Remove the
 "center" scaling mode test
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260401161539.30360-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260401161539.30360-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0207.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::15) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|LV3PR11MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: aeba7cda-fa08-44e0-92f1-08de90a9b630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 34T00yp1jNDUrSbdkHxTifliT11PuFwCatUmmyYleJsoGezog/PMbC+1gTJDAYXvfLTzi8UZNh0mR6doAEbRuF4YDpvZYto0DAXyysA/cVSTtRExaCNJ6wNBwLndJWLwDdV+EW5Y++dFJvQmcJ7mOhf5h84Gg3FPX2yBQNuacUk7Yn+xsigEJIdvdYHpyKw424/Rs+cJyINjHmSlWp0WiOksrfst8bDQ2Lh8Vc6vZ7NL7oFgPRmEnXX0kF2E3nNDYoIkleRaCrddMZYmoCt1P1djLjlLOf1WT1E9bKNgY9jAlyJiiDEiVsJ+VaBYYVOpEVWyG5u+dXcH5IOMQok9DR5SxtblENnsPWXZV8+uP2ehdCMHKxgGatiaFUtLpzEOXpvBwnXkBV5MmrieAAN0mpsy1eGz+MOmqq2NwGbBazXj083RNS1jO+g0aDjMWUjP4HlgpwRUsrc75oxH5CfrXUzzhTeC+O0NBOnTzqBIMUX9+d4YMIiKAuysg2UK8xaUn51WczzrPAvdJs8etl3p0yKHWu4iiaKfFyjHS/8zxVwUghC0rF4Jz9q0sQY7XDdyO9l4Un0NsfNHFSwF4/EYcMltqEGzLkLoN9oTfub3GWd8NdTeD8ie+r03X5Q1GrIo5XUcedmNAHJmeXGRckVbWI6cRryQhodZZv+7GF5fwDSqRxw1BzrkONGPiggV91aDoBgf1K8xVeeLk8lTiKIAoHwqwlUHxsaEjfytBUo9HEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTJNNS9samlCZ2o2TWt6ZG5GVENka0R3YlRLWEhNeDN0aHZoWXd4TG5VQjJX?=
 =?utf-8?B?QXgwOVMyTm0yNkNheFkyOXNObDhVQ2NhdlZVL3k5cnFybElDN0ZtaGFkRHB6?=
 =?utf-8?B?bXFGRndlSHNKeVlQNjg1Vm94aU80MzlRdkd4a1luYytGaTdDWW9jd3VEMTZT?=
 =?utf-8?B?VENaSmFCLzlla0F6T29ZZ0ZtMEhrUlp5NzhIYVVRWmdoZWFmaFpLcDEwSHVl?=
 =?utf-8?B?dzQyc3FnOW9Bd3V1M05PNGNCU0xUaEVaalNNZDJkVDNoNTF6TCtLL2x6bWZp?=
 =?utf-8?B?SzJBY2dUbWhYbDl5Q3k2RWxjbUpOdWFlVXF1Y1dRTGtQd3ZqS2hvY1FmcjFn?=
 =?utf-8?B?ZnFaMmQ5Qk12ZlhoTEhrVWJncTYzbmZhNWNyNGlyNjI0aUxGS1Ura1prN0hs?=
 =?utf-8?B?cUpVYkR3WGlvOXFRN1IzSXRHVXJJYjd5ZXFmVHpnS3RtSkNUWGZvRXZvcDNo?=
 =?utf-8?B?bHVQVldXY2VQYkNiZW1kZ1J5ZXhPUGpNUWtMZVMzcFBpNFdCZlcranVyT05V?=
 =?utf-8?B?cG9vVWVXbmthSy9MNWdrZjRlS1pzNVhkZW1Jcmx1dXg2Q1l3TVhuTHp5M21I?=
 =?utf-8?B?S0d1OUtaWGc2OXNpYkkxVTJGSDJTMjUzSFlFRU9sMXJvQllIRTdXbHlmRC81?=
 =?utf-8?B?R0c4WXdBL0U2amV2NkpHUzcwbEJOcml0ZGxNRkxQYm1JY1dYQk5rNjBycXBy?=
 =?utf-8?B?VXlWVU5DS0hiZXZrcWhvVUhoNCtKbUtzbXBzUDE0cVEyemRFdUQ0R1N4QkYy?=
 =?utf-8?B?blFVR2NqRW9TeDBjbUVEQnZFRmFCb2JVdW9Jc1VqdXNTRmFibU1nbXM5N1Ay?=
 =?utf-8?B?UVNUNXJrVUVCMW9NMEZRR3h2K1NidFdEcHBzazZIaW5UUTZ2ZHNNUFJ1UHZ1?=
 =?utf-8?B?Y3J6ZUIrUlZZM1FGMmUvOXJRc2RLRzZCdmlKeUNsbGtIM3lCeGZzRzM5Q1Y0?=
 =?utf-8?B?YmN4UlJNaHVsZW9TS1E0VzZieFpQRWNjMXNaK0lPS2tHcTBCc2ZUWU1hK3Z5?=
 =?utf-8?B?TVU3cEJUdXhad1VnRnBaa2tzd0d1SUhZWWlYOHhPYUNaMWxlaWpwSXE5Q3ZI?=
 =?utf-8?B?U3ZUMnNDSnlqVlZzaDBvSjdmVE4xMGVUUFpwY2d3b0ZubUFjYWFCQW0yVlZI?=
 =?utf-8?B?NlNhR0FSZ3g5emJEVTZJM1RHWStOWmI1QkR6MzVmNkZGVlMvYW1lRUV5cU5u?=
 =?utf-8?B?N1k0RjVhNzBCRWRXV04rR1FXem9kS29WMFpDdC9NTTBpcmRYWTBya0dQUnQx?=
 =?utf-8?B?TjdSbGZxRVcwTWhHYVl3bE10MHVPQzJ0VHVjMkRTUHRxamRDRW9jLzA1Vy9W?=
 =?utf-8?B?RzBMSm5BaXR5aWo1QVFyYzFpMHliZEJUeVpYNWdudDZWQ0lqbnorL0JCYkly?=
 =?utf-8?B?QnJpNUw2RjBSdmRYbWxXdWRrSHJqMndRL0czejBVMUhQQUt4QmVoeGR6b3Vy?=
 =?utf-8?B?c2R2QUdyWkJQdjJ2c1k3cmtFSFB0dVlRMGtXOWVNbGtYckxoVk84ZXN4YXh3?=
 =?utf-8?B?d0NPZXYrTktTUHc4ODFNNWFpVEw5UU1qb0NtNWhUdTFRR1FDZWhNNE1pN0Zu?=
 =?utf-8?B?aTExWU5jdUsxRkdZMXI5eTF2OXBqM1Q3NHZMU2pWSlV1eEpaZVBXL1pQcXhM?=
 =?utf-8?B?ekRIa29maHZ4UFY1aUx5ekoxR2VGOFplaDU1eTArTStpQU1RSFYzSjFnOUdE?=
 =?utf-8?B?RnZUQ0pOQTU5SGFDU3BiYTNCcEQ3Lys2ZnV0ODB4M0ZIemNkaG1wZHNpaHcv?=
 =?utf-8?B?VkdHd0VnT0VZc2dSd1R0UXN3NldSc2NqRFNnRlZzV0NRekxZOFl6ZXJtTmVH?=
 =?utf-8?B?WXk3NWdONTB2RUdqMk96YkVkcTIrNW45bVp6U1hJdVo1TjU5UXhSQWRIeVNC?=
 =?utf-8?B?Z2tXZEZkQzVwZnh4ZEpuOWpkTmkrUWU3QXhpdm5Ydi9mY1U4ZnY1T1lrRXdD?=
 =?utf-8?B?WkNFZGhXVWxOaTNRWXdHbk5hQkQ2UytmeXJIVFUrUXFxWHpxS2RxUHpJeDJO?=
 =?utf-8?B?bXByaE42Z0FVem55RTkxeE12QkxKMlBFWk9jbGxRMUVnNmlNVE1UN1lXeEox?=
 =?utf-8?B?ZjFqMVFFQWtUY0tNMEhUNE8wNmpIOEtXOVRUT3Fud0s0bGxiQlZZb2xKdHpk?=
 =?utf-8?B?MTk4U09mbkY2SSs2eHNpZlltWGl5NzA2cWxrNHZXbEJSV2NHQ0IwdUFOZ1ZS?=
 =?utf-8?B?aTBIZXN5T0JzWUwwbyt5Yjd1ZzM4TUg4L202OHpMa1FuZStOVlNwYXpNRWhz?=
 =?utf-8?B?THR3US80UUJHSTVIY2ZWcytLanV4RjhRc25qVUgyc0NQakVUc3p3YkFUL3g0?=
 =?utf-8?B?VUpWQnJYWFZNc3RrcGl2bnNEVkVlUGlFRG9Qa3E3RWpOMkFjdE04UnZVVitY?=
 =?utf-8?Q?7jD+SsHthx2rysFY=3D?=
X-Exchange-RoutingPolicyChecked: FBGDAtM9Sdj+zUfAuT7MjY33ze/H9rJk1og/9s/nm+HVMK4Sx2o7p6ZsPY9hnPHcWeiVhNqPbRIZh2T1H/fJbIHaQ8WtkUG65foeK3p46l9EQVbsqbUEE66WNde9NhIHz8/1DVCFWVk9DBq3OXD9cP1YRO9QxJ0eQ91t1CX4F3aFRTqJsQgQRELOzOMSe9bpK2y2ZRDUb+dqW0YVsQkS1FjZmk4MDrSJEJkXOW60c3N9vRN+Ro4h3KU/L8xH/syh27MGA1mdr1EnkN10oFX0swqSwIKS3jZSshqg+ubJJPE8u/oFmt/IPvCPmiyRIOYWOYVhBghYUtfqRSSjpsv7YQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: aeba7cda-fa08-44e0-92f1-08de90a9b630
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 11:19:31.7243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQvtyzDN5Ah2ltJMCU4FQsh08gVAmVDQj8AzwqalSNTZAniJGiSFYN8kfvTGI5i8OdNVlXRZ+IRTYYwPsjso/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8481
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

Hi Ville


On 01-04-2026 09:45 pm, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The "center" scaling mode doesn't actually involve any scaling,
> so it's fine to use with the sharpness filter enabled. Remove
> the test that claims otherwise.

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index c9fc191fdc02..15c5e600626b 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -148,7 +148,6 @@ static const igt_rotation_t rotations[] = {
>   };
>   static const uint32_t scaling_modes[] = {
>   	DRM_MODE_SCALE_FULLSCREEN,
> -	DRM_MODE_SCALE_CENTER,
>   	DRM_MODE_SCALE_ASPECT,
>   };
>   
