Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B08C982DE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 06:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF3410E013;
	Mon, 21 Sep 2026 06:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMUKHKeg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3290710E21C
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 06:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789972865; x=1821508865;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZexA8YfP2oKo1OTfl7NGSSXw5lysN6b8n4eIMpR2ZDU=;
 b=RMUKHKego0VLzd+plL2tp0T7RmwSqg9tu+aehzGVV4mYADQPyve4GpDj
 vhbP0Jzr0Ee0H8fr5unQ2snjkHC1izAsUIEiWnt7BWSKjjiT9EAi36GW3
 w64zQVb1/XRvtu+DAwvmA2w4QxCt79CuGGVBz6ND+u+bWuSYH7g1Md8be
 KkTVzyoRnWiu29dj7Aq2s5w8kXn4HcVyOHi4Es5DbvHhmJmJIXOkugmNm
 5K8fIut8mPQctHZ5T/DBMo0qx/TEgOKUvkuHyXm/ulxhI6fn+qWv/i/kE
 rQtKRdQhpVZOO+78/TlxAcDSardgImwiZHL1frRl5g+yKbbCwP/3ewLcB A==;
X-CSE-ConnectionGUID: MYHS6cOaQuiTxQd9trN+1A==
X-CSE-MsgGUID: 8dZF6uLJQS6drbb6Tv1rkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="101125658"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="101125658"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 23:41:05 -0700
X-CSE-ConnectionGUID: tvQLFgnKS3OQj+4vNb9j7Q==
X-CSE-MsgGUID: LUJQnBdbSdOKE0CYlhF+ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="280583583"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 23:41:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 23:41:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 20 Sep 2026 23:41:04 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.57)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 23:41:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuVhTuqdWmGvU6arqGRjcyobG7NZ5l8QLzDTHO49iTQ5uTGph9iAHvNfURBU/4cKFVojsFNljpJTjXR16Tm0OKZtFV/z4ZMhdufynjFPb6C6TLLSxjPQixe/iJlMbCjntUM+GSa9vwfT55Hf9TQ9phuD5tSmr59vopfPP5l4EZtlXXGAWQX3lBjORKq7frXLUgYXgUWaMYP+Vt7040Eghc2jnGVpeFUMfcMWCL2HVMre0fjc/uNRDpDNoPQRtQsxMOYmC9QhWP+bwFz/BpMtiuJ96/ZZOTJ8em5OvVobafoDoU5pa7lC1fHCpKrLZ8gpvB5XbUNAwtQWIF1w+2eeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51EvFyzYd6UtCwPeGubsnsxr8K3b5eDFSaYtUjH6K3s=;
 b=Eu8K+oP3Yzbs3o4nQvRZ6W/S/2RNEKgB8W3UYQZ4WcQDtiikYYGJ1qqVJlMFk/SW4INN3bi1uA1/0Z0UYFtl9cb+TN9VSkyoKi0IV5RnSkshWXhK/XyfTkpEpNfHQJvxdOV6nsNGAYyvKnXsC9j7X4rhHh4bFctFNnvJJEJNuwjJ23dLAonQ1ivo39PZP3O4jdH3bTNI+a0uLQ4cZHtPssXTz6EDWOxj5mYEywRmSclJiiHLn+5Dx94NMuGEXOAMDPpzuTgNrxNxt5cwec/anfers9dTqqGL7sFVFJU0/twQlk1BzC1iT3N5tX/DYK7YRDnRrYpaSWuA0514k0G2Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:41:02 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%4]) with mapi id 15.21.0428.011; Mon, 21 Sep 2026
 06:41:02 +0000
Message-ID: <0f298bf3-1a08-4210-a7c7-fd8e0db89947@intel.com>
Date: Mon, 21 Sep 2026 12:10:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tools/xe-perf-recorder: Wait for
 mmio-trigger-report
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260905012055.494831-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20260905012055.494831-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0288.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::16) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f594827-8d40-461b-1bcc-08df17ab4db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|3023799007|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: EdMaf3wjtsBGBtB9/acOj1GmhYAnzvJOL7fYyMB8ZExsLeUMjnIRa66m1fKwstNUudUQj7ByPD7AJaEV3wmIecjN6YwtmquAqxgF5B//lmQPOPGVIZtff/lRK89d4rwfyPWAHKSgfN9W6xEgLWsECsIuhYksVOc91j/Aa08GnzibE1Sxm9zuUQ5K11FRj21Uh30TViBo/+bPzrQASRpdHOwOHhNzATX3mfHBHahCRcQOiTPPoRu8kGsVOvg/SWxKtlOARJ/gyIZv0LP3D7ckyQU6bdpKcOX/B0/GoldaFc6GupUejVcFAZLH8JFPp90NqBraw7bTpZOMlfggdGExQaivsikp0VKDR03kK4mCzRc+EKjPNLoepDGLM1oVlovROw85NJhyo5V/mAzHE17fuQAD9UbwB1kOYbceR3jwxIBUwYMJNVcjLVK8PGGUiAazzrgMhJvy9E7CUkUb/rIwyXaIGs3+ySrYkvwfxsLBnfRNZ3UlTtKRKQ8qUU6JMAzENjWgRwqdXclCHPxBzKnMLcp2WJXtP35FQMHKAHgTbk4OM+yi4j8/cCW6ZYSOKcc0rzRIeeX5qyBT25Bc66XbCtxBbtuf2eO+ifdGm3C3rYBNlc8O8aIgrKahgTarx5TTbmkW3kGOl66SRf0zK6tRwZtpBclKQDIJhUgGsJPJ8Vs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUdmTmI4OHRJQXJtbUxsNTNHdDRRdDFUK1FTWjBzM0hBaW5ubjUrNlJ2d1Zk?=
 =?utf-8?B?b1J1cDZvaFZVeWJ1a1hGS1p5alpEMTgrSS95SE9JV2xINUkrWWRMYnhTV29M?=
 =?utf-8?B?TXZjc3g3dVpHVWZoUXpKVVo3TzRoZ2pMendzN084K1BLNHhqaElmbXdyYUc1?=
 =?utf-8?B?bk5KT0RVNmp2SGdlc0phUm9LZHA4VExXMHVTeWoycUpkQWJUeE9zV2ZxSGRT?=
 =?utf-8?B?alJLcVg4QlNseitVZUlCOG9mWVVOZU1KQlhvOXBlWU1QYlc3dGZZbFR2RjRv?=
 =?utf-8?B?bEZUd3NudHpkbmFURHYxYmJGU285R0IreitQU3U5TFBHbC9PN0FjZ0dXRWo3?=
 =?utf-8?B?Sy81MGEyQ0tuM0hBVXRoUEVYRzJrUnBoUjZhR3hDS25iTGZWamtCWUUySzkz?=
 =?utf-8?B?R0dBeDAvMUgxUG5DVkFvMWpFYU9Tck5nNWZiNm0ybHdvQlh3akhFTXQ4dCtR?=
 =?utf-8?B?K0pGK09ZOE1paHRVaHkxS1dPeXBQL1V5ZjRTSVNuOXlTWXF5R29XRnJyV2ZY?=
 =?utf-8?B?MDZ1OENTQURvcFpXRE9vNkdnS1BLMGtoTFM3Wk9hWWNMdVVaVHZGemcreVlN?=
 =?utf-8?B?L1NjVHFCZU9mUE5VandWY1cva1hmYkphUXJndmhPTm5qdUFPVXRYYklDd3ZQ?=
 =?utf-8?B?T1VUcHUzaUQ1TTAyOGpKQVVsM0FveHVIK0J2TzRZTU9YOGFXdHZFV1dpYksv?=
 =?utf-8?B?akxpRTdqRTcrMlRINW9lemtwRng5RVdTTlFROE5QYUhYZEhjcUwvbGxackFr?=
 =?utf-8?B?ZkRReTFnNFpwVE1TWHltNWpWTDlueVJxMFNadVI4ejlta2hxTUhmT05pRHBG?=
 =?utf-8?B?MjZVRHlTTFdOb0ZhV0FKM3QxblRLZnNVMDhRTVhQUUVGckc4L21LWWgzNVgz?=
 =?utf-8?B?cDJYc1R5Qmlhb2h5eThRdUNJNmt6TkV5bktQK3lmVkhrYS9Ycldsb0N0emhj?=
 =?utf-8?B?MHdwdkQxSzRzUUlXd0dEczIzQlc1MERuWnArU0RDRjI5MkxVeGJkbWlneUdj?=
 =?utf-8?B?OTZqOUZaZWZzdUFLd2VEYTl2MW42b0ZGaU5YWXpBVFZKS3BjSUtHNlRlMmpt?=
 =?utf-8?B?RnBVaERoRjhoTy91cyt4NXVpbW1tNEE1ZGNpOXNjZGZqZjBPbTNGWEJmcEFy?=
 =?utf-8?B?bU4xZ0F2SjB3SUR3REZocHV4VXppUDU4d2FHTXJkTHhHTTVyQUR0dEJXTUpv?=
 =?utf-8?B?cEowdG83S0xwTmh0K085dXVVak9BVjkvd0xPVXpINDNNSmdWTnQrR1Z3Uklx?=
 =?utf-8?B?czA4T3JLa3ZraDhGQlJ6S3p0YmN1MTc4cnY0U3dXZGYxUnJWL3F4RzVZYW1M?=
 =?utf-8?B?U1BKZUh4Sm4xUjRMbEFvRzQzZ0lXMldpL1R4d3pEZmZFcm9VWTNyQW9JMVZE?=
 =?utf-8?B?TWRUT1lGMnFxUXJmMkwzcUMrSTByTDBBRTE2V05EVTJIVDBhcWdNN2NhbWps?=
 =?utf-8?B?MXdPZld1YkYxelloOU5JSkYxbFRISm5KQVZsRWp3cDFkVGppSHdoY0lyL0w5?=
 =?utf-8?B?c2JQbmpiU1lPMXJyZzlNaFRveGhxY2tFbE8wSzJQUFI4YzJGV1YyVFJpNTA3?=
 =?utf-8?B?Z1VRMjhYNWE5UjZTR2R3RlMwcnJBcCsrWVZ5eTFXaVQzK0FKZlIyT3hyWUFN?=
 =?utf-8?B?RG14Zkw1NU9wTVVINTVGWTZEdXpRVzdobGt0RGJVOTFTN2JxN09PWGZCRG9P?=
 =?utf-8?B?eWxUSHQ0TldERmlwZmhzdFBWTjJ6K1k5Nk4xeGs1d2lCOHMrbEFTWHVGRU5I?=
 =?utf-8?B?TEhSU004cVNibG5EZGM2eVB2d0tIc2hGaWdJZm5qWWdYdyt4MnBKdWVFQTRX?=
 =?utf-8?B?Rm9QRUFaYXNFZzdqVDRqRTBQdTdkdkRoUVNQMldMUlNHSFNUSm5icnhLSytX?=
 =?utf-8?B?b3JHUlNoNlNlbkZ2OW1ZSVYzSjVwNFI5d1ViV3B5SEpxUmlHeElJUVZwblo5?=
 =?utf-8?B?czJTdEZrc0Nmd2IwUVpIOGF1V2pacjlheWhPODAzelJDN2JGZ1Awd0lDQW5m?=
 =?utf-8?B?Y3pWQkpUVmxGWDloMzFpeHBnNXNQcWNuREVXOS8wckk4ek5zanFsdVJtZExM?=
 =?utf-8?B?ZjhqU2M2N3F6R3dudzZsclg5dWFsMjdKanlTMW1qODNuMHM2RWRJdTUrSTA4?=
 =?utf-8?B?NFJmUzEvdDhXWTRqUmE1MU5OMmJEMUlwVDJWQ0FZWUo0Vm9YeU1Qdk9IRFIv?=
 =?utf-8?B?Y0ZQc2lFc3dWWlFvUWdZK2czK241VXMxY3lETHdMQmFKZTg2VjFyTTJqbkhK?=
 =?utf-8?B?Q1Q5ODRFZjQrWmFtTmxCSUE3a0o1NDVkL0RNWHdDbFdLVFd1T2Roa0dMczJE?=
 =?utf-8?B?WFVCR1R1U1dJMDNVNGY0VS81N0grUWsxRnc3WnJpR2FXMUZVTGsrRExzUUds?=
 =?utf-8?Q?hVOPrsJ0SmDcjzsk=3D?=
X-Exchange-RoutingPolicyChecked: SrIUcmATqe/NR0Q68rQohHqUX+W4VPLmDKwa0Iep63cmnDR16ixYkWmLy+tnaXQBKT5VgMm/LqN+TgE3fX103sLidICSDrLaFYoCxCdzJVWSX+YvFm2E5FKIvpmfDtr0/QIJMsvVxnk4vHATj4cq4Y2xbg/JUV477L2xK5GgbDoeuEtsN8ZO0yEnEhv2+tHKXEcbxS2fG7Pu+rjbGo9gmYipNe0Bu/KtQTrRarUdZb4Cl6A1/2JTbSj+LWOTJUk5gQFfehBZ+KgH00KFnk4WJmvnmAerfjqMEQe9ac/N+c5zcCyRDXB/AVTET4EPfu/bkSiTx1X6xvzL/Tmo8aBhkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f594827-8d40-461b-1bcc-08df17ab4db3
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:41:02.1577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +opYNUbVbb2et39GuxxRdZzXf2Ru1LJR4Dtl0vM2svHRT8s97K6Af/feumarHLVB4GvejzBTThqbucsvU+ICThHKQk+dQEhRNrQvaJmwSzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
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


On 9/5/2026 6:50, Ashutosh Dixit wrote:
> After mmio trigger is issued, we should wait till we receive a report with
> the context id issued in the mmio trigger.
>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   tools/xe-perf/xe_perf_recorder.c | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
> index e13eef5190..cb7ca67bdb 100644
> --- a/tools/xe-perf/xe_perf_recorder.c
> +++ b/tools/xe-perf/xe_perf_recorder.c
> @@ -370,6 +370,7 @@ struct recording_context {
>   	uint32_t vm;
>   	uint32_t exec_queue;
>   	struct intel_bb *ibb;
> +	uint32_t mmio_trg_val;
>   };
>   
>   static uint32_t oa_unit_mmio_trigger_reg(struct recording_context *ctx)
> @@ -642,13 +643,15 @@ check_mmio_trigger_report(struct recording_context *ctx, const void *report)
>   	const uint32_t *report_32 = report;
>   	uint64_t value;
>   
> -	if (report_reason(report_32))
> +	if (!ctx->mmio_trg_val || report_reason(report_32))
>   		return;
>   
>   	value = (fmt->header == HDR_64_BIT) ? ((const uint64_t *)report)[2] : report_32[2];
>   
> -	if (value == 0xc0ffee01 || value == 0xc0ffee02)
> +	if (value == ctx->mmio_trg_val) {
>   		fprintf(stdout, "Received trigger report with value 0x%" PRIx64 "\n", value);
> +		ctx->mmio_trg_val = 0;
> +	}
>   }
>   
>   static bool write_stream_data(struct recording_context *ctx,
> @@ -712,6 +715,18 @@ static bool write_perf_data(FILE *output, struct recording_context *ctx)
>   	return false;
>   }
>   
> +static void write_mmio_trigger_data(struct recording_context *ctx)
> +{
> +	struct pollfd pollfd = { .fd = ctx->perf_fd, .events = POLLIN };
> +
> +	while (ctx->mmio_trg_val) {
> +		poll(&pollfd, 1, -1);
> +		assert(pollfd.revents & POLLIN);
> +
> +		write_perf_data(ctx->output_stream, ctx);
> +	}
> +}

On a write failure, write_stream_data() bails out in the middle, and 
some reports are dropped without being checked for the trigger value.  
If the trigger is one of them, this while loop spins forever.  I think 
we should use a return value (maybe a bool value) and bail out when 
write_perf_data() fails so the error reaches main() instead of looping 
forever.  Something like v1.

Rest looks fine to me.

-shekhar

> +
>   static clock_t correlation_clock_id = CLOCK_MONOTONIC;
>   
>   static const char *
> @@ -797,6 +812,9 @@ static void emit_oa_trigger(struct recording_context *ctx, uint32_t value)
>   	intel_bb_flush_render(ctx->ibb);
>   	intel_bb_sync(ctx->ibb);
>   	intel_bb_reset(ctx->ibb, false);
> +
> +	ctx->mmio_trg_val = value;
> +	write_mmio_trigger_data(ctx);
>   }
>   
>   static void
> @@ -815,7 +833,6 @@ read_command_file(struct recording_context *ctx)
>   		FILE *file;
>   
>   		emit_oa_trigger(ctx, 0xc0ffee02);
> -		write_perf_data(ctx->output_stream, ctx);
>   
>   		while (offset < len &&
>   		       ((ret = read(ctx->command_fifo_fd,

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

