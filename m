Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E739C43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 19:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B743F10F24F;
	Wed,  8 Jul 2026 19:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0f+C43G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E10010F257
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 19:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783539363; x=1815075363;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CUqsLG6dOZcLOKFc/lSJBcSFpsIhMqGj8CRjp8WmSRo=;
 b=Z0f+C43GYSpjjqYTx/KNc5tRhypd9Kccb/hVhjBHcMxFcagljEuASUn7
 gjNnPxkNHJ2ME6cM/4cgmikLVpXrDayHWvlzAtBrd9tStQQY+wQU2BGvY
 rik/EYVFNpmGOIHUHQ/BaPgQNotByqthnO/L1mtxbhrWz1XDa35Ta9Tf5
 ke2AnUNpSleGUS/PfIPZJMaj5fb/NoK4Xi8hHXXZXgPuYdEop9iWMTG4s
 PGcZ982k9CUI3N1i/lNOCICLjvcWn+KPbrOhZbJqpCSvi/phRkEf5CQRx
 n6LF08P66w5P6BWeDDKkSkPwtOF3bnnzMq+HUUXeUeG1pcjSwRA4rQ9F8 w==;
X-CSE-ConnectionGUID: J1ar6xZJQMubyWY2eKoSzQ==
X-CSE-MsgGUID: NkrZkzJ9Qre/wjqIumT0iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84234587"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84234587"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 12:36:03 -0700
X-CSE-ConnectionGUID: gfxCK1LXS2eccYDQv4H9Xg==
X-CSE-MsgGUID: fQVoReoCQHO8J3uZ9oZkfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="254477987"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 12:36:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 12:36:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 12:36:01 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 12:36:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e02uhzgFJKiDDEhSa1Q1FtFtFJaYleIUB45g5ykW1DActD2tNg8PQYgtPY+a7Og0+fKJPB+MZT6g6LVrOMnTzNwjpTuyNHU2BnmoOIgTL8mS/FEUWyBgv4KRgKLCmjrhRzfM19Q2V7xpsd/VmfUTIGFPI9TzRE0FOxxAF0Uuhp25o96rvsca9vBIoOs34ZqpE3FjbUPyMrmmv31Kv7+Ib2UCxadVm8fIRTkN9pxzrQ+IfwfV1vdF6WC2IMejv/YVM7ms6xO6et1BKJPuTr+npIhQpuXWAhlkYv/BbC8YBmxIhN6ul5wwHLi9OHIqNZ5m9RVkIZ1Pf8mKYDmDTrrJgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNU8OIANnziLZKCsPas48jbZSiy45naGGG6fRUjdbnI=;
 b=JoGtVpbukbh/5s3373wSnHZCP/6lpc3jefsgXv6GaqcakzZCvy+U7fEcVBdLtMTzldLYepoWiOzBRggOUAsO5V+vt01jEzLgMzwyullFM1qkurndhmlv/3R3FaWZHx702y+R8bbwjuJrRjBZvNnzYT3e33bXsh7g8Gvu/a7K5nlIhgQHNqehP6WLTsT96viKYWYOQy/H1TjF5LKqRR5ie1qZ2/bXF6cRwEcD/UIoreSiAR+xOontPTc8cWPT0dmJN69YnPwEBBX0FSAIGko5Z7bcyfyXl5o6IKy9DsydvB6UVWOXZ1mX2IqmGDjOb3pATsoZcmAm6Skw4EgghqpPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by LV8PR11MB8697.namprd11.prod.outlook.com (2603:10b6:408:1fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 19:35:52 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 19:35:51 +0000
Message-ID: <09e5795b-6974-4f33-a69f-5f1789c1d1f8@intel.com>
Date: Thu, 9 Jul 2026 01:05:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_feature_discovery: add HDR, VRR and DSC
 discovery
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260613195901.2675666-1-swati2.sharma@intel.com>
 <192d86f5-509e-4113-bc00-77a33084bf3b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <192d86f5-509e-4113-bc00-77a33084bf3b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0118.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::11) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|LV8PR11MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a74079-f29b-4825-d105-08dedd281e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|5023799004|4143699003|11063799006|56012099006|18002099003|3023799007|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: v15h99YzldBCLC9BCdvgkTVPJ28dGFUxpmavCvV1yFvOX2TxmW2Cm0nF8+JFapy0mgHTsHoNUJuB61UwtLL23nuXduD/yd7kbIMB6iJ38c8i59d0jlgyIe1pUltUeSRxpmBfLiELEV3AAmxx9rZp22UZduuxWqKEaX20gW8tb+6vhy1qPjn3E098uFwJ/exMM6sZfTpANhnYeA/GF7sdaBeh/Zxp9VJVFUGknMV3t/aQpZ/FHHD+IkvG42+NZghb82GH5Dpn8eEd1FwcxbqUnHtRlSJl90Gyw8X2gJGOeURLQj3985pdr9pXJzcIBjNiiIrPiI+yTZz+gGpGJcyYYBBfh2aJyToSEpZUThAj3R6xJXqjz4O0E8pXjRF4K7Arkl/ktmiwTXZeeWwI3x8SxX+1Y7/OR0a4XnRegTczOQ0dS5x6tG5R4HJEieB8oUg31wVJKYqU4dBB1LCXbezhcNGm6Qu+deEx/uotxjAovq4rYEiWJ83DzgcHOfk1YORn2TZuWWx6zXmBLQXHHnzdEF9+OgUZJoQ/FUoNMcL/RZWEc/Xe4/GD7juX2rqci2Tn1dW2qf7rwU8bHvs4Krsde13jKAmZ4DUS6xi0eyXmrezCTdAoZ6E+Ggc5c5lPgdiLyh8dV5HiwDuIIXRnn97tfygug9tT0zhVhSXzWKIbQp8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(5023799004)(4143699003)(11063799006)(56012099006)(18002099003)(3023799007)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXVwME85NG5xeTdXWVNMbVB6NlBBNWRhVWM5TU53UWpSM08wTm0xa0xibFM4?=
 =?utf-8?B?NmdwOTJ4aVNNMGN5RVM4MHBJdC9vS0o1c2lLaW1lWWRvTi9OSU1lZkpYNFhW?=
 =?utf-8?B?WUVQMUZVUjhEVUtzbzRKS0d1RldIT0xFSnJ1eTVORzNRMlZaNjMyMUFBZ3gx?=
 =?utf-8?B?VlBZMUJEaldZb0ZJc1BtelRkN0VlRXJaeVpYSENzVjNUUmFWa2VtdDlXamwy?=
 =?utf-8?B?QndFd3IyaFlZbTNiMVFVaURUZzZFazI4S0tWY0F1RVdHQnRCTkJDNHpwQWlR?=
 =?utf-8?B?TEJ3SFNYZm90cnRkUW52SG9QcUFuV091bzZYU3JzQk11VkRjbk02V3B1MzZE?=
 =?utf-8?B?cHF0dDVlcDdRdkR0Y3NXa0hwSTI5RjR3RUNlMHl1WmZCVVBuVW9EbExScHcw?=
 =?utf-8?B?NnFDUzVYMkVwTzhDcGQrQnUvMThlRkFrY2dXRDFjZmhnVHhROFlCYXZJYnND?=
 =?utf-8?B?Q3pEQjBDSWU0eDZMQ2d5TUNiVkVhWmZQQWFYaW8zRDNLMStidVBzZkhrY1Q2?=
 =?utf-8?B?UFdEeDJBeFczZUlRekVHT2lmMDFpVjZrWUFaMEdOUm5QaVpUQXo1SFRmNnZL?=
 =?utf-8?B?TXQyL24xT2RPZXhUQ004b085dDZRRTN1YTlxekdybk9EZnRPRXpvKzkwZmZ1?=
 =?utf-8?B?Q1NFaEViZEsrL3RsVWhOZFpLOW14aTF1bE95dDhVL1R5b1hEQ01aTnZ5Mng2?=
 =?utf-8?B?U1JmaGhZdjJSbnVhWFpEME4rT0NOY0VQQmtlRU5COUFpbVNyWHBYeTNSM3N3?=
 =?utf-8?B?OStkS0k1V25vSk9lU3N2STI0cExhcmNJakZsbEE0NnFnZnljRW9YL1BteC85?=
 =?utf-8?B?RmFPYjRxVVZnOVJ5akppMThTRnFKaEQ0SkhhdCt6WXVLdzc0RmkzdTBXNWo2?=
 =?utf-8?B?YjZJVmJjME9pUkNFZ2lTZnhXUXNYbXUzZnptQUZOeWhCUHZOc09MYS9nTFRS?=
 =?utf-8?B?Mk1vVm53ZzJyMjJteUc4emxQOHBZcU1EV2x6MEZ4WVhoK0JFZHRjMUFLMTF1?=
 =?utf-8?B?Rm5ESmEvOEtUcjdpY0czazVFUzQyUUZwbE9BUHhySzdjSUpVZ0tUc0c1TStx?=
 =?utf-8?B?V29peWlIR3RQMGQ0Z1AxNzFQVzMxR1lkRDBsSGUwSmR1eFJyMDIyRmwvbDI2?=
 =?utf-8?B?SU0vTHNZMlkrbjJXRjhlTFFHUHQ0YVBGRTM2OTBtUEY5Zk1CNk1zY0lpVmln?=
 =?utf-8?B?Y2NERFArcUlnQzJ4Y3o2c1h1cE1mbXdZTWdDYktzaHpZM3JHZ29lNDZHeGZo?=
 =?utf-8?B?Rmo0V1RENEszWmJ5UDgxaGJkZlhnY0JLeC9jZUFKczZRRmVYQU10T1FYSHB4?=
 =?utf-8?B?MzhGU3IrQVlCLzNZQ0VwbFE1OTYyS1JkNkcwTFZiWmFNQkJFRjYxU01iU2NZ?=
 =?utf-8?B?ZGhRNWZOM3I1YVpWbWh0MmpkekUxbVV3dmxVclh1OWFRODFHMjZtVXduNVB6?=
 =?utf-8?B?YXlISitXQ2VoeDlsWnhOZnBGTzhIdFA5bEZHNjNwRFlYNDNnSWJ4THNXUTEv?=
 =?utf-8?B?YzMwaDdxZFA0czBzR0tuZlpLd3hVVkI3MUhJeVdtUFAwdFNDQVYwL1Z0K2Q2?=
 =?utf-8?B?d2V1SHMzM0h2Q3Z2MGhZM2ozWmdaNnBmLzd4bW5ZVWdpYnFZOUVWMGFOd1FQ?=
 =?utf-8?B?MjNOVzU0bklYQ3VOV2lVQmFubEhwY25RS09mT1BrZFRTYk85dlB0YldtZitw?=
 =?utf-8?B?WTkwbG1BVHU4V2dneFpwQU9uM25GVVkyUFo4R0l3WTFHa0g2aTdMV3d3bDFX?=
 =?utf-8?B?am5IUXNHKzVJSmQ5M2w5a3hRa1JMZExvcUZyMmpCSkNJam9MSm5rTUxhSmtC?=
 =?utf-8?B?bk5KQm5sZFpqSy9WWlJ0NUNndXd3K0dTdzNJSTF3dDFYS2VHTHMwYktYQVZh?=
 =?utf-8?B?VUc5VXhROWpaWnhyeTJvYWNGT3lLTS9kQldMOTRpMFdUam5MenlSU1YyaG9i?=
 =?utf-8?B?Y2hsQjl0c2tyV2NsRVRBbnBydXZVMGVpSkFYNjNCSzg5R2o0WjExRytWUFNx?=
 =?utf-8?B?S2ltUHFXbW8rWEpDWFRkNk1rVjhkRGN5NUlWbnpMK0MvS1ZuTC94Vk5CdERJ?=
 =?utf-8?B?QisxSElIUHArSVFyWHRMSkdYOVZyNzY3MVNKeFhoRXhadlk4ckI0dU9BVW02?=
 =?utf-8?B?ZlhnZ2JkU0lZeXVHemRwTkorQ1p0dTRielBZQ2pMVnkyZmlXaVFubU91VGhr?=
 =?utf-8?B?KzJpSHJ5U3dCUnFLWER0L0tYcjk1Q2s5dmpUb000KytWQW9oOHNtVUlLNVRS?=
 =?utf-8?B?dk1SbTByOE5RNUtMYnhGNzAzNTI0ZE5LT0w4Y3ltVkZRTVlVa2VmV0VUaGxR?=
 =?utf-8?B?Y05yS2JMakZWSmowdWxCU0d6QjczRzVSRlJpYkpTa1dkVVcvMG44WG1xR3dB?=
 =?utf-8?Q?UgCXuG2nP4S0jIVs=3D?=
X-Exchange-RoutingPolicyChecked: PwXPACyLsr4ZCDj4Bt8PgmgLcQ5rtXpPR1rqANRceNQhj+7zqJZn5UY1U2/bkKMuhvy9if2Ad5z/o21w+G93T/LRyixDxHSFdt/oqX4Wz02F0E+khY754bfsJoikO0SMFfFhCvxC4DHDJ6Y3XraoTZKvCM6oBMcye3qNcrWGza5d1vMKpeA9f37by2U8pWbaXtfTctTSRP00wEByXMjb6UkLTUqcc7uW4hRaHaDjp2tJoXX61o92w5KlZqszsS4H1d42w765IIEddnaMtOpwLd2D1tE6Q5PKrNcKrbTbwoP93J1eFikKkrvzXxEbY40XufZfNGbRWyMM6CmVvTx6Kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a74079-f29b-4825-d105-08dedd281e45
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:35:51.4040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccLflH7oC9EdzAE2XVbw+HfQ8QN1VCYURddzA2scYFF0sxvZiZCEB1h+tN/B8ByPecYcVIeS0m39w7GzHs8InA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8697
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

Hi Santosh

On 15-06-2026 09:05 am, Reddy Guddati, Santhosh wrote:
> Hi Swati,
>
> On 14-06-2026 01:29, Swati Sharma wrote:
>> Add display feature discovery subtests for HDR, VRR and DSC.
>>
>> HDR requires:
>> - IGT_CONNECTOR_MAX_BPC with max bpc >= 10
>> - IGT_CONNECTOR_HDR_OUTPUT_METADATA
>> - EDID HDR capability via igt_is_panel_hdr()
>>
>> VRR checks connector vrr_capable support.
>> DSC checks sink support via igt_is_dsc_supported_by_sink().
>
> Would it be good to consider the feature discovery check for HDCP as 
> well in this patch.

Yes, but prior to that we need lib for HDCP.

>
> Regards,
> Santhosh>
>> Assisted-by: GitHub Copilot:Claude Opus 4.6
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_feature_discovery.c | 75 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>
>> diff --git a/tests/kms_feature_discovery.c 
>> b/tests/kms_feature_discovery.c
>> index 28ec89c55..07a0c5e16 100644
>> --- a/tests/kms_feature_discovery.c
>> +++ b/tests/kms_feature_discovery.c
>> @@ -36,6 +36,7 @@
>>   #ifdef HAVE_CHAMELIUM
>>   #include "igt_chamelium.h"
>>   #endif
>> +#include "igt_hdr.h"
>>   #include "igt_kms.h"
>>   #include "igt_psr.h"
>>   #include "igt_sysfs.h"
>> @@ -63,6 +64,18 @@
>>    * SUBTEST: dp-mst
>>    * Description: Make sure that we have DP-MST configuration.
>>    *
>> + * SUBTEST: hdr
>> + * Description: Make sure that we have at least one HDR-capable panel.
>> + * Mega feature: HDR
>> + *
>> + * SUBTEST: vrr
>> + * Description: Make sure that we have at least one VRR-capable panel.
>> + * Mega feature: VRR
>> + *
>> + * SUBTEST: dsc
>> + * Description: Make sure that we have at least one DSC-capable sink.
>> + * Mega feature: DSC
>> + *
>>    * arg[1].values: 1, 2, 3, 4
>>    */
>>   @@ -174,5 +187,67 @@ int igt_main() {
>>               }
>>               igt_require_f(ret == 0, "No DP-MST configuration 
>> found.\n");
>>           }
>> +
>> +        igt_describe("Make sure that we have at least one 
>> HDR-capable panel.");
>> +        igt_subtest("hdr") {
>> +            igt_output_t *output;
>> +            bool found = false;
>> +
>> +            for_each_connected_output(&display, output) {
>> +                if (!igt_output_has_prop(output, 
>> IGT_CONNECTOR_MAX_BPC))
>> +                    continue;
>> +
>> +                if (igt_get_output_max_bpc(output) < 10)
>> +                    continue;
>> +
>> +                if (!igt_output_has_prop(output,
>> + IGT_CONNECTOR_HDR_OUTPUT_METADATA))
>> +                    continue;
>> +
>> +                if (!igt_is_panel_hdr(fd, output))
>> +                    continue;
>> +
>> +                found = true;
>> +                break;
>> +            }
>> +
>> +            igt_require_f(found,
>> +                      "No HDR-capable panel found with max bpc, HDR 
>> metadata, and EDID HDR support.\n");
>> +        }
>> +
>> +        igt_describe("Make sure that we have at least one 
>> VRR-capable panel.");
>> +        igt_subtest("vrr") {
>> +            igt_output_t *output;
>> +            bool found = false;
>> +
>> +            for_each_connected_output(&display, output) {
>> +                if (!igt_output_has_prop(output, 
>> IGT_CONNECTOR_VRR_CAPABLE))
>> +                    continue;
>> +
>> +                if (!igt_output_get_prop(output, 
>> IGT_CONNECTOR_VRR_CAPABLE))
>> +                    continue;
>> +
>> +                found = true;
>> +                break;
>> +            }
>> +
>> +            igt_require_f(found, "No VRR-capable panel found.\n");
>> +        }
>> +
>> +        igt_describe("Make sure that we have at least one 
>> DSC-capable sink.");
>> +        igt_subtest("dsc") {
>> +            igt_output_t *output;
>> +            bool found = false;
>> +
>> +            for_each_connected_output(&display, output) {
>> +                if (!igt_is_dsc_supported_by_sink(fd, output->name))
>> +                    continue;
>> +
>> +                found = true;
>> +                break;
>> +            }
>> +
>> +            igt_require_f(found, "No DSC-capable sink found.\n");
>> +        }
>>       }
>>   }
>
