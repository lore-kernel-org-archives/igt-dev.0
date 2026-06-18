Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C9BCD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 18:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92FB10F3D1;
	Thu, 18 Jun 2026 18:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwc2uEJP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2F110EEB2
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 18:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781808884; x=1813344884;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=B1lhMU9g+Qj+Qf661Bf3OybmrJRSrr8X+8fu+JhxpsI=;
 b=fwc2uEJPCbZUbBCEmVND0LOXDLCFutDthm9otE0ASuOnELnHt6OagPlX
 hu0PaL9GGz01ixhDgoDUZascgLwaRJvWKo1jwenoqYruEOq2ZZ8WcgYVQ
 PqSVOWQn/tc23cw3bY9j3I/dE837A768A5zAx/Wsv/8X1uKzoOb9/jh72
 2wvICM0hp2icyiLq1aAVKU74AivCTMCWg/OaD5AY3hBAvg8Vv+j6FtItF
 +K7qe7SiXkJozG+nsEH2dvvRgqnA8fEUKbAF/OuTG73GSpug9AiKza8ok
 sF2Iqf2ZkllbhEh5UiU09kgsSNwbqySuRpZIgUGMfcIbm3ajkZLQnZpV7 Q==;
X-CSE-ConnectionGUID: WMWg9lGGQgOYEEnHuipHKg==
X-CSE-MsgGUID: 6OWb0c7WS++8U7Lp75a67w==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="100084607"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="100084607"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:54:43 -0700
X-CSE-ConnectionGUID: aqz6NL2ySBOyv6suVyrKnw==
X-CSE-MsgGUID: FldYmlIhQa+g/MVZPF2SBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="248506494"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:54:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 11:54:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 11:54:42 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 11:54:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzLal+LfK7LTdyNonvAa/BMR84W8cYhBkltloC2K5+cB5myrvTqASZnsEtGLvKrqNb5Vy9MLeu8feGBBPpCEy4tCyNcdccwyvB3uocG0uE7k8pcj+D+2HjqCCGUYOXvjSERSwKEBeYkLO3l1g4JzDIJi+EvI/DyesirmZDDYnmx+tbcvEMhMOTIWY04D1yp3K/cTGWf1ogFqTNNtmZKDFkq4Bf395ukkJagbUQvz/tL2efHA1P17nYNXInKO6c6uwQSc1j7HmQLPvcZ32CUkDXnXU8aMP1Ub6OKDk+WQ8qVT6+Y1Ww5OLly0elJVHt7kHesnbiMgEEyZJ8t/MNO6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/5qcgd4eYpnVXB+nmjBGwRORUB5RqhTsoKzUDHgZS4=;
 b=UG8N/A5llgVlXpuwMMMBjQJEpXpaUTlMWN8tZBRm3jmWVgtkg6+u5aMU/tMGnMkfp5sYQM0WnR2EHngN59rsMCcr7IZLMQaVCTL9hKeWgQGjNNYrQoQDdsP+MZc+mv/4ySuBp93ueMRR6+mlbRDkJ+RoivZk/dJOW1AY5khdDHWC7vlEitmfQJ9qAxWd2RQJCU4QJY85JSzRiAxA2V3oLhyh7oTav4tTyIgxs0ceFG69IF5d3R9liIqyYbhomcHlyLw2ekJKHElevBXqSWP2HFU5ODYqGsmtCyGSsQaWlJLar4hTzM/jJPVDCc+Gpme4d0S2emNYqG5PrPasPzMlwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DS0PR11MB9454.namprd11.prod.outlook.com (2603:10b6:8:28c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 18:54:40 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 18:54:40 +0000
Message-ID: <20ecaa52-681f-493e-a072-d1714c5fdb85@intel.com>
Date: Fri, 19 Jun 2026 00:24:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/5] lib/kms: simplify igt_random_crtc()
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
References: <cover.1781791747.git.jani.nikula@intel.com>
 <d19355cb9a4952af550912ef95fd4d79b653050c.1781791747.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <d19355cb9a4952af550912ef95fd4d79b653050c.1781791747.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0260.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::8) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DS0PR11MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b84d7e-48f7-4d5e-4eb4-08decd6b0d66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 7jGE0owWiO7cDYp1s7qe1ZC2u8H+dArcwxf48CPJsvkxTLP+cJwT+mubn8douob5RwSZWJn2L5FuipVC2uvAXQ+qxosRMybTxLezglFXrFL82uHnBEhX5IQjozRe4Ct44DaDfaFy0frQy9JoJ1YvUEuP+pQ691fK+M88qT2BioqvC4u6RTy/wkLRBeN5NWvHy5IncA7x/Cie/rT+OWbyzHZGFQmlAWrNZXga8CEMu95yZNvveJVFEYpAH23sfiLF2S4X57CEbo+2TjOwH1iUNaY7fFpI7KkUBQ5eam3P5ZlD8EQ10a0crT7G/ayJ6M1sFkhbN8hd7wpkpGDHTSCaCa+WWs3ZsnBXTP8LY0XTMZDWK4dkagaeL26FUB94qSuG9QYVrukyLrmeQ47+SMgpCOkY6COk1y9vWbI3h2Ud7QxiO52fZULKxSMCL2i10f9TOlU6feoqOm5szMWW+sMVrFxNUbvSvhw+mZkUf6aUNNZYPh1kceFKrxNM7l2RSG+VVOdcbU/4GbXgJBCNxHP0PjL4ITX4Q3l4rJZ1+PSlbcDDUAnZvdMANOyuEUSDz14xEIfwqdk414wJA8DSUfHbpo+2X8Ej53TARHfMhkELPeS/Qn9c21XjFzMtWc9Rjq+6viOIwtPmfEiOpKDLyZs18kfEGNotH5u4+Z69YihV55+mtC3e81e27gllsteCBTMb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXV5MnI5dWh1UlJ4alhoRzVCa2pRNkxBQTl0YTFFbWJwb3J4Q0FHc3B5d1hH?=
 =?utf-8?B?TThZWVlvZG9MS3hISkhIYWxWY3FGclNqcHg5aVNVQlVyYnRyYkVoY0ltU1RQ?=
 =?utf-8?B?UkZvdkZDUWlPN3VaOTRDR2RvWTV2TDdaMDZrVHNibHM5Mkx1bmNFc2JscjN4?=
 =?utf-8?B?QXFtWXNucmVKZVpoT1NYYi9ZNmJoODBuenUyYmVFNHpaVno5SDNkMGtjb3NM?=
 =?utf-8?B?VzQ5OExzYTBWN3kyY0VpNmtSeEl6RkVLaWJ1Ym02M3pFUlNOTFlBaE5xNlJ6?=
 =?utf-8?B?YjNVektqK21aam9VTndtb2N1QVZDdGdWK1IxV2Y5b2h0VWV4cWlsODdBOWpT?=
 =?utf-8?B?Wi96NGROc1pjRnF1eTdzNUQ5YlFPSWxaNTcwZ0JXQXprM1lFS1ZUT1NkQ2lu?=
 =?utf-8?B?aFdScm9naXZZMjZmaUZJekQrSW5SQ2JiVHlPdmdTQkFqLzBRcE5aaUtWdm5z?=
 =?utf-8?B?V1FuWUpNUFE1eExhVFAwVVVlZ0FwZkJBWVVuWTBsM2YyS1R3RlBaKzBwck8w?=
 =?utf-8?B?SGJaTEhocXY5SzFpUWVSVVMrMDU0dzI4SE9XVHhrQnd6STF5ODQ1WmlRNk1P?=
 =?utf-8?B?elhNSkpmS3kxdkIyc0k3WW15WU4yeGVrZ245bkp2c1JaVFI1NmxjTTViRk5x?=
 =?utf-8?B?Z3lpdStqeGN6Q3VnYUpCaGNqMmZNZUl4VHFBcVEvRnhwMjV6OS9CejNmVkZr?=
 =?utf-8?B?V2w1MThGSFZVMVd0RExPOFFzL3Y5TGlodTQ1b2FyMzB1b2c2VSt5T2l5WGRE?=
 =?utf-8?B?bDh5NHR4a3EwcElKZVo2LzhNQlZzQlh3SzIxaFVYQ3ZPYjJUNTYybGFFYjMz?=
 =?utf-8?B?b2J6bHREbTBSZTIvdHNFZEdiTDlDanZ5L2VlaEtXSms2V1FBTXdOTzZ2dHp1?=
 =?utf-8?B?SjU0djUrSmFhWCtFV2xJK0oyN29Dc2RpSHdHRjFuM0lYa0t6ZEl4VFJQZEE2?=
 =?utf-8?B?Q0pwTmNmc0pEaE9IbkFDSzRxZmdkRklCeXdzQXhhL3JoY1c3bE9aUmJxSmdh?=
 =?utf-8?B?ZDJVdEIzclIvOWc5K083WW9EVlJDQWRmeG5IR3FCT0FKMERWK0VEU1hUaWxS?=
 =?utf-8?B?SERLajhMUE10b2RHKy92aEJvTlRWNStIUktDNVZzR0ZxaVR3bzBHWkRVcHN5?=
 =?utf-8?B?S21LSmhnUzR5M1pEUEg5WGtwRnJ5cFExVXlpbUZ1UHBwc29waEN3RTJqdzh5?=
 =?utf-8?B?bHFUWG1VQi9OazJQNUpQWjc0dUk1SEo1U0wreHVDMGtTVTZTYWttTm5IVTFE?=
 =?utf-8?B?QzV0d29SSWFLUFh2NjRvR25RL01TY0JLWHg0MXpaYTlOME5YT0p5UXZWZUJE?=
 =?utf-8?B?RWlMTlkzS2xsbmJROW1aT1h5dnplelZQanNPTkNrZ3hUc3JPcnJTUmVHTDUz?=
 =?utf-8?B?TVFEek1lMmNCUzNDZ3VmTExTblhFOWNQcWJDWXF4ZVk5ckE3RkwrTnlSSDZP?=
 =?utf-8?B?UEdXbkhaOFJiTDNTQ2NtWFJ2bG1xMC8rMWJiZnZiV09kdDBZR1NXeFBhSUZi?=
 =?utf-8?B?V0hQZzhJNTJrUmFGRG1DOHFIT3kwQVdzZTBlSzRxUWl2cGlVaHdZVFlqbWxU?=
 =?utf-8?B?SXhOdENrUXgxVXduWEZZc1UxelJ1NldEWTI0VW5sU2xHelVIVEFMVFZ3a05W?=
 =?utf-8?B?M3RJa05tTURFT0VpR2QyYnY3V253V2NEUndhbG43K1ZGT3o2LzRJc0VManNw?=
 =?utf-8?B?OTdabUNVanQwckJWSC8vcEU5d2NaQ3FtV09pNkExUWVuQ1MrUjZPYWxGN054?=
 =?utf-8?B?c1V3aS80MlVJT2s2U2x2WU93YnNYaVVBSVFRaGRQWnFaeG1BbW9nSTBaSjcw?=
 =?utf-8?B?UEVJdnkzZlZINDMyQmRURktvYnpVQVdCbU4yOEx6VTlyQTVXeGExS2FxN1R3?=
 =?utf-8?B?TXRldERlWnZvZnVxakVFZE5NalFDSW9nT1drY3NVNVg4Vnd5VWFSdjd2bTZC?=
 =?utf-8?B?bzhQdmJISHZ2NlZ5Y3BwMC9BYjRzRFJ0aUtzazhlbGg1eWQrZ2d5RlZ6Mkdq?=
 =?utf-8?B?ZTJIbGo0S3lzZDhFc0J1U1JRZjYwa3MydXltRHdkWDRxcmtRMlUyK3U4QjRD?=
 =?utf-8?B?bDV3R09mTEtRUDlkdjE2cEpmcmdQVHlBWWJUcmRCbFRORVdTa0Uvd0xRVW1q?=
 =?utf-8?B?V1VEM3VYV0x0Z2p5YmI0czFLMWVjUUszSTBlZHp5NFE5bjBjd3MwWVE4YXV6?=
 =?utf-8?B?bzNXOE15d1REdm4xbnB1VktRdUpiVEZFMHExYnlyMXdZb2c5bGpXemFnNWVK?=
 =?utf-8?B?bTd5VlczcGNsRXE1dFpxNkF4WG1jdjFpSXYwWGQzVXJmV2V6eExRN0NrcWox?=
 =?utf-8?B?OXVyNW01Nno2dTZmOUVnMmRLU2VveWNCNDZsZFZoWkg1ZXBsdlEwZz09?=
X-Exchange-RoutingPolicyChecked: Ok828o/RuZ8fVW2SL90eLX1XZC/Ua4V9m6fF21fUyPrYEwG71OG2FUwm0NDrjdcd7ELmgcuJCIVV91l0TxqD1i3wgH/v+yqlVGvrVPGY/By4VDFVEXRI/A3E0xD5ebPR/rnUTZqrZ+BIJMo43RytTvofM+TT+Sl9XOa5VZ++QLRItS/Xt+icfHCPtRFm0o9xUcsZeNKcaaSQo+Rr4YRvPTwmT2L3HFALpQ3DbZK0XkSi8HIT2HTJz597JuEawLIO6I790JmLAc8XpbR+i/riX//L3gKdnS1PmYR1fYTtyX7VvE+jgXEAPiRwLhm+bnn1iV6e7DuhQr4wgL56sBFeAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b84d7e-48f7-4d5e-4eb4-08decd6b0d66
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 18:54:40.4686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRF94CWCgYy8aIRe6lfVd7EFqdksdxN2G+AfsgRYVNiU/TgfeL/iVifaYC6tbmc015YNVGGPZtTrB1e1HGsLvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9454
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
> Now that igt_display_n_crtcs() reflects the actual number of CRTCs
> again, we no longer have to count them separately.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

> ---
>   lib/igt_kms.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e82d32130666..06138ad7125d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7922,16 +7922,11 @@ igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc)
>    */
>   igt_crtc_t *igt_random_crtc(igt_display_t *display)
>   {
> -	igt_crtc_t *crtcs[IGT_MAX_PIPES];
> -	igt_crtc_t *crtc;
> -	int n = 0;
> -
> -	for_each_crtc(display, crtc)
> -		crtcs[n++] = crtc;
> +	int n = igt_display_n_crtcs(display);
>   
>   	igt_skip_on_f(!n, "No CRTCs on device\n");
>   
> -	return crtcs[rand() % n];
> +	return igt_crtc_for_crtc_index(display, rand() % n);
>   }
>   
>   static drmModeConnectorPtr igt_wait_for_connector(int drm_fd, unsigned int connector_id,
