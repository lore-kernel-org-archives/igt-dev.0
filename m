Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9948F0180A
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 08:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F5410E185;
	Fri,  6 Mar 2026 08:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZU5Ru2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DF010E185
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 08:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772785501; x=1804321501;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hGYaJRBACVGyA8mcyW9ibGkcu+uTTGlokMHYgB2BQG8=;
 b=OZU5Ru2KZuNiM86wudvRPc1JDzG99BCcX0OGXbXt5ty6Bwu5CxRo7ahg
 AUse1rp+iYZBPbjHKzuQpCypM8yx5vvn1VVbLWjhMmyt0KXDOqnPjXxQx
 MWe+3rADYy7huQLMn/YDImoBkya6G3GgHrJ0De0Dlvwijh9ZtRC1T7t9n
 mOHjs2eM+ZVKP9PptBEPQW8+6KGt2oofSFW3YQZugghloCe7t0wXIATHS
 f8m97U8aQh8uYooyM1m8daE1CL2ei83370+idfvjX8jQeNBweu1dIIqmJ
 jadaz22NL4Meztm5pPxuLSOidb2uhEqBU4pV9PL4uaB2EjGbPhuKkVZrs A==;
X-CSE-ConnectionGUID: 1W0EuSGARXeVABf9+whXkQ==
X-CSE-MsgGUID: KgWe5gN+QiO0JlvyMKZMug==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77734727"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="77734727"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 00:25:00 -0800
X-CSE-ConnectionGUID: eTylCB8SQ5OMMiY3lECl5w==
X-CSE-MsgGUID: BpWUIEImTKKNh2J0hSwt2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="256852480"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 00:25:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 00:25:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 00:25:00 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 00:24:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Baw9QJ8cd/75R9+HVR7L8s0boG3HAEwi9uC6pHoEKtCf9ukx2YpWIESi3x/sZfC4RWMkKrH+ytgENZVZnUfKzkiplh/NLAkLQLSUYdmWN6CUnp7sT4L4RuypjaZalzmdEcDyM1rOYknB6z8mie3lTp/q6g83OXipQd4qYHJvKJ+x2DAZbMac7g/C+1Euy2XolxlvkzPyv3yhJS32vu+gcDby+pxC5OScx5PBgy0MQlP4wLJAN1gwZVqC4u5Ke18XDlMK7zexI/FYmUVtqwbbV9yd9KblegMlDwNzvN6c6SvjcyUi7DBgygsEHATPJ4c3Ha/nlzN85PbFqs6pJk5vRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/QuCmn4kHrRNGnJY6H/04wyAkS7ZHJwrkfETYaLdQw=;
 b=Bt2VtKVsfuVPo3Li3m4ytgc5FpZlBgtGUAwktNz4g13GFo4jdx8xFHbOP3HfT+NB2ZW63Nrznh38W17F9m2Ct7qfCFVKdqieWZ5gFXmSagidb42ja72HeJyTsPS8KuuDy0Ts4+I06hN/N9dF1rqo++fAK666p185RKnIaq3FSngaCf8OAWL0012llWiSxVbGUdpOPd3Ejy5ebiwg6cdAoz1WDYmTQKD7rysY+59/2bNPVQnWdXFcCriqMnOg+pQAydYz1Rzo9GOqEYZfKEQKoKGzrtfM5a4ZLfLMdpHOoelmDqLxLcHnAhGfRmvY18Hw38izER9YIkLhWyswyM7RnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS4PPF1C4B3BAB7.namprd11.prod.outlook.com (2603:10b6:f:fc02::f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 08:24:58 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:24:57 +0000
Message-ID: <4fcdd6e1-8c49-4c85-b67b-b1869072724c@intel.com>
Date: Fri, 6 Mar 2026 13:54:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_colorop: Update gamma 2.2 LUT names
To: <igt-dev@lists.freedesktop.org>
References: <20260305061212.4133135-1-alex.hung@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260305061212.4133135-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0242.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS4PPF1C4B3BAB7:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d26097-57aa-456a-8635-08de7b59d9be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: d8C94UTGWbyzeJTJfwGC7woFGh2XyvbO1kfzGzSStQL048AZqtBWjrDAvFjkRzVIZ4iwF75CJpgqRYNZx+8aHt/toNjPSocpILpzJQp8dYhy8D93hpMQEmbLqHVhq2s+WbMM9OUNTeEKRzVx6anvxOvigUoXfZ6PhWNqmYHx75aT2yT+HFjT6fNL05U2DOWEJePd+xD0JGsZ4Sfi1VsSLNLErexdnB8VwYy1qWFLVH74bJrW4dX8KtZmG2meiJlE90vwOjwm8RRKGxbeH29vUon9es/zGjl+rkkdYUH6ab00WS0kfLdwTXTozjXGffiQJf+ukfo8cZr//hdfKMGTiE88L+ODmD/aNAnozef/yXeJp6HwUU4Zqhjx0wSH7vkKT6GRtVsuwewfgsNyAvmdFgjNhM1+WL0wOJAxS7QpvW2OGGj1qSwfJYGzyyDIurXmyjkRLzq43ym44SYXaBzWBhs+yUNehrCm/4a/8P6SlU7fNTUByh4WjyEQQsQEJiNoIlotYQSgcfB1LSfSPQAVxAzNEgRvPPMgBW3Xuech1Sv+ZzlleD3vyzVwEgRo/tssQSeIJ872YTuYWf/TFUiiEnqJZ+2/yta3M4GWZg7RaRYwuY3HKmgob1ttirQgGtTLrPm3++rWruAJDDIGXCi4rj56em1gavwPDoUTEeg8eP5914LazjOY2ljh6gNb2M0otnTNMJXz1iXdzLJOtra6ts3hOxZkvjUkao/8ChN1B78=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0l6b01OTkJzTk4wY0loc1dMMGZFUkxHeC81K2tmQTR6MURtZTI5NFBkOE9n?=
 =?utf-8?B?Um05cTBlTlJKYTJiUDUwVlZ1WWhoY1Rnbm45SkJzUGNsOFhNeTFYSGkxMEpq?=
 =?utf-8?B?aTc0Wlg5akZBQnhGUFV0V0VuOWg1SFZzVmRaVjVSaVMyWEJ2d05VVFFObTJH?=
 =?utf-8?B?dyt6b0xYalJTaHJkTXZMQzU0YXhpZGhLM2FueW43a1ovbk9sUGM1dlppdjZq?=
 =?utf-8?B?UzMrNXlteGVTVGxXVEdFRkRHb3Z5Y0U1Q0ozVVAwbG5wTG5xRXM3NjRhN1JV?=
 =?utf-8?B?RHdJc1gxQ2xwa0U3dWRpK1FEOXVHbEJUbFFPbW9zWVcvZzRBTExMN0tTWnhH?=
 =?utf-8?B?VlBRc2l3TFhTNnJsOGNtNzJRRlFKTFk1aXd6VEo5V0JMVTg0bjQrS3dlbHM3?=
 =?utf-8?B?MWxwNGphNHpkdklnVCtEbDd0S2pNeFZyeFdiMUJucEJkQW0yQU4rMk0rNzJD?=
 =?utf-8?B?OFJidjE1NG94VlZkRzZhZzcvYndDQXA1WXRGSVJBOVJZWG90M0xmcDVsTXZU?=
 =?utf-8?B?MWxkbTlEU0tlSXZvQjE4TVZKZHRuU2tVNVdNalJVdTRMVWRkQjRHeUd5R1pS?=
 =?utf-8?B?TG1XYXdTMlpwV1I1akFqNFdIM3RwMHFIbmY5TGtlVHV6TFFoeURzUlVONEsr?=
 =?utf-8?B?d01RZFhzVmN0N3hja3l6TDR0cjVXTldiMmNrb0lZMDQwOFQ1NUhaVUlOQVA4?=
 =?utf-8?B?a0FXU0NNa1A4QmVzNDZsT1gvSzBIaVhRZ2hBYmFQTzUvZFZjOHBPMjdVY1RZ?=
 =?utf-8?B?MThDNnVjMmpUZlBkbnk1RkNTQ3BrM09aMmpiOVFvM3RYSGsrMXErTVpoWlN0?=
 =?utf-8?B?NDdNdnRHbG1RbDFMQkRqQnp0bzdWVDJZazRVWU9BY2IwVnBvK3VnbEloM3d1?=
 =?utf-8?B?aUdYWFVLNXVqM1BjTlNzZEVtZHltakJqd1pJVHRSVUQ2S29qTTRHNXVYTmov?=
 =?utf-8?B?ZXEzOUI5ay9vbHlMS09hUmRjVVFhZVFpSUhUUHZsZm10bUxpYWpqTWtPNU9Q?=
 =?utf-8?B?c1FVRXVtcE84eUZPV0ltNUZsajU0WjBRcnZ5TWJsSTN4VVdmV1ludVBIY0tP?=
 =?utf-8?B?UDMyVnI4V0g0L3YwdGp2VS9vdW1TZkpEdktFMi9seU5MRE1LTmhGdmswZEU4?=
 =?utf-8?B?VlRtak5oN0JGcmFScVBvbVpCcGdxZjE2Rnd1VlMwNG0rdXVsRHlFazN3aHpC?=
 =?utf-8?B?djk2S2xIT3FYbXh5UWlxR25CUElzSEtBdVNJVUloS3d3WWxzZ1hmRDNSRW9q?=
 =?utf-8?B?TGFocDRsbzlOSUNnSUZ1aExOb0tyeS84OWNnK0lTcTZTbDVqMWZBR2pyZ2Zo?=
 =?utf-8?B?SFFaT1lXWnFJdWx3OWpRU0JYWW1uTnJVWUowNTdXaVhNRlZDdXJpVmg3eWkw?=
 =?utf-8?B?YjJPdExxM3I0VTNhblNmMTUrVmIwL3hxRUlZYlIrUy8wMitFRG5BeEpheUF0?=
 =?utf-8?B?ck50SkhZUStLaXlPd2hWbGNDK1ZxNGNubmFVN3lwZW5jN29BZ3J4bzJpRDEy?=
 =?utf-8?B?RDhuRkpYNXppWHRYTno3elNlbzhNbXJDQ082ZXV1eUVqdXBRSUZBajdWSVBS?=
 =?utf-8?B?NXNGY3pIVmtoYytoQk04UE92TDlGekZKb01wMkF3Z292NWgxNEdVcHp1VkVq?=
 =?utf-8?B?U01NZ0xFdFlRY3BtWlo3K1NRM3V1R0R1Uzc0anc4NWJaNWVybG9JUEt5NTFO?=
 =?utf-8?B?ZFYzSXRTR3BiTnVRdWRnT0lUcVQ4U2xvWmVvcFNuWEJJbkkwTmdaNDFWa0g1?=
 =?utf-8?B?bk13SnUrNmkrVjUwQS9SUUpuWXgrNGNPRG9ram5rRW9lQTVjU2xicXA3VzN0?=
 =?utf-8?B?RnZDU0dLcnU3b2xVOWV4OVpyTTZVSXQzYUJpalAyL292Kyt3Y2dKa0o3SzBj?=
 =?utf-8?B?YVhWZUZvcmV4MDM4b0ZCNWl0SGpqR0wxUjZTMGhYMzE5amNNR21ZcU5HMWFI?=
 =?utf-8?B?a3BjcnhHKzFMR0RIbnoyc2lRY2xBNW01UC9yQnlWS3FaYm9wWlNRcHJLWVc5?=
 =?utf-8?B?YlZFMjVRZ2wvZkJlUDVvdWJxTDI5TWIxY3FHT3c4K2o0Qit6MG12Z2g4SnNQ?=
 =?utf-8?B?VlZnSDY2OHMxcG1hZEd4WlVoOHVZaHdDTm9rTjdDb2tmOElRZVpiY1hNVTla?=
 =?utf-8?B?eWFEaEI0b0dMUWNjRWdSTXozU0g2OHlCbXVuSXcvRDg0Wlg0Ly9vWmI2b09O?=
 =?utf-8?B?KzZ3dWhEN2JOekovdVJSdGFZcm9MaWpiTU0wS0E2UmlsVWdMcVFtbGlFNGli?=
 =?utf-8?B?eDErTUh4MHBtdmZLb29hMVRaVmVUeWVQYzBacVhFU2ZSaW0rUWNNNE9CS3pv?=
 =?utf-8?B?a3ZEekYyZFFSclEwbUxoeWo1ckFobWNWZ3ArV2pTMlRha3ZvUmllZXV4Y2wv?=
 =?utf-8?Q?r4XiQ+OUr4B5hoQ8=3D?=
X-Exchange-RoutingPolicyChecked: TdHphDam+syzVqbW4VreO3T4Da6BEJmXvoQxp7oI4bBXyfU/YSOBKEgEynGroeDnHYtxnS9FSb8qBzK/V7S+rytQ40nPa79BhrYOXTRBvzuKyCLfT70CFx113PYo23vCOgVTZGCcE+i6wtpRdKDgwbdeMflVi9uiHlhXXhmri9UDtXs40TvAQMzR9/KieTxZ3Z2bpmWCvp3rTkzbf/YttHQhOrOayppxlL+YcZdgkMrXKy9QUobU1QXpz7RgF53vhH2C0BZIcIoqxzY1p74AQbkCZ/57E7Aljk3uLVT2WLLZ+tfMQBKYoNmqv9JTZaDBm+RCHdHlacJOLe1DiVZrtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d26097-57aa-456a-8635-08de7b59d9be
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:24:57.2491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMuathqRaYD6TX+v2R39Mgh7LhQpo2L3nGxUVOfEHJio3m8g2PkneSl6+uQfxr6BZahtn5GorA7w+e+qrvUk9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1C4B3BAB7
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

Hi Alex

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 05-03-2026 11:42 am, Alex Hung wrote:
> The names must be the same as colorop_curve_1d_type_names in
> drm_colorop.c in Linux kernel.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   tests/kms_colorop_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index 152e90f26..c3a2b8f13 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -14,8 +14,8 @@ const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
>   	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
>   	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
>   	[KMS_COLOROP_LUT1D_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
> -	[KMS_COLOROP_LUT1D_GAMMA_2_2_OETF] = "Gamma 2.2 OETF",
> -	[KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF] = "Gamma 2.2 Inverse OETF",
> +	[KMS_COLOROP_LUT1D_GAMMA_2_2_OETF] = "Gamma 2.2",
> +	[KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF] = "Gamma 2.2 Inverse",
>   };
>   
>   kms_colorop_t kms_colorop_srgb_eotf = {
