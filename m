Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC4FFCC9DA
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 06:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEA910E169;
	Wed, 11 Mar 2026 06:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7ntwVZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BBD10E169
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 06:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773209861; x=1804745861;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yyItJb+0hwZi2Dy66ROuyzKutps+ziYBkXulhbw2hC8=;
 b=E7ntwVZXWeTTXWiqsJ6lwU+5hCUxj3vE1ervgJypbDPyDpaNoun7Myxe
 FtGqlWRy5zB5K0ZiG52Zv2e1cUseHVL1+YWsLQcbtMBna+BcDn697YiEY
 XmGoJ8tX/wN+EF4aJJQ87BBxiWZXziS/WjH85OE3Nqy4QfVhBeRvXC2Iv
 pAz/OtBFSIGT+8gQjFJz3URyEijL6AZApcmfpJt2OxjjHxixPd3Vm0W+t
 +Dg8iFKYDf4Qn16WnClOolLdYxA4ARdKN4mQ3LsXn9m0AVvyMrtB/hULw
 P19YkVbXRPSXtpk3xlk0IWrF7F+irflCpDiBFN/FAt082Us27zrHtClD8 g==;
X-CSE-ConnectionGUID: 9rHinMo7RMOUa5n9VRSavA==
X-CSE-MsgGUID: Iq/Z9TE8SE2KHZokTImdsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91652920"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="91652920"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:17:41 -0700
X-CSE-ConnectionGUID: KtvqtcxpT3ubkwbBCsn2xw==
X-CSE-MsgGUID: Jjg0fqsXTOKX03nz+j0URw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="219607084"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:17:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 23:17:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 23:17:40 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 23:17:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjdG1mYm3I9QxiFW26cej1RNQKKUy/4fYr4RPoPXBN9xRBUJWPHXdViR7YzDc7crl2uuuwUPWTt1L+pOz5fcisuVKCROxSaIhkNwPhljBw7cPMFS5HEaiM6GPrtIh1Dtl8+44K0nfOPkFDSmBi88H+n8pJgMq9HzkYnZe8vktgvQPsPWnGz7eMA8MZ7qO2riGbB1d41MRpUEZWWQ4QHGslvwydxF86HvaqkacHMtByYoFMCKzvR8VZmNqYVWU//HASOBvDuLcWkmQIKqLYBVbmQcH2FHFJUzBPY9R1cltr1jU0UvmsQ+ls3VWd4w+7vNiYuQJPhV8CH8/RTKcQwSGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibi4RkpJ+KjAEywldYzWvRo3DppUKN9NTFlYfaNOpOU=;
 b=SaVOXQUGv44jJCbwJEPXSSSqP99SxkHQuGQLJnwm/lZ80awM81sK6WfVdFEOj7Z61Og8u0m03giSyCQHv9aSaSRtDmKjIpG51Mq65EKa6Ob93lmpY7RenkvfsNkuU8OIyFAAVUi58l2zki7gRNJQz9Sjc4fDr1rTZ1MKD3Y0WJzSNlV4SP8USDmX0EP9+HlcF4nGKSgMx6PDUm7h3CwQYtldgZy5idxs6xYXGozquCuKbcEMGcnjfMiZZ0/v8rw2KZRIPTWdqeZ7NsHh+NBM8WwO3w2rI1YYN8NpnZ3ATCQ82ahz7HL+VhTwHUB+fUEMOzppSJeX8ttuUFGoqzuE+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by IA4PR11MB9279.namprd11.prod.outlook.com (2603:10b6:208:561::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Mar
 2026 06:17:37 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 06:17:36 +0000
Message-ID: <3515b6eb-6547-4656-855e-b9499bf79205@intel.com>
Date: Wed, 11 Mar 2026 11:47:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib: Add NVL-P support
To: <himanshu.girotra@intel.com>, <kamil.konieczny@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260311054958.9770-1-himanshu.girotra@intel.com>
 <20260311054958.9770-3-himanshu.girotra@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20260311054958.9770-3-himanshu.girotra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::10) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|IA4PR11MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec8d277-b01c-4e10-3f3d-08de7f35e3cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: fJlN4TCSYbndb3t/JmRghWenSx5KZg6oYx0YEKyHriiD5XeIq6Ma4RuONryzizxTuERh/hFHCQQS/pQA9RbbCXvKWuzwUEdggHezUJS5UgkxwGanphwU/FiWFtiCaiXKKvxXvR0BcyHuZeDyO2I3HLFeTVs+Ca2yx6SVG0Qv4eqKHONNkwvTLv+wY+WRCvKPyUivvuETFho/EG/Q25YFe/TOUDUtlXHS5rN+/0/SZH4CNXr5HBbeR2FZsPjw/wcgzWeOEy74ywDv6bxVmZggdtvW5O49CXOB4OvrLKcognhzLPaoD+4DAuiZj8LcLoqKUggG/7XhVcyyd9TBcY8GbGKUo7Q0scf6y21yloEwyoPT9WHx/fDukbCSRkfP6GudmGQ0sOhUJGbQzryzqFz+h1MdZqvd/PZffbCAQzpILaUCyBYrtxTkkIoZ3UKE/9oRXntGXmF6JJ6MCsCFIZz9ig//kiU0h/gPUSqjaUdOBkAxkxRWXsLBahDU+iSanFfkGJij9kDAzrbE4EoIeNPeB6OApL4vrlb5lNbVwsU8EI9Bt1scS/rY2oZt1ubRUystgWrkPPfaeyFHerOBWS6aP69JR4SPbqSZuRyY1Tsoj4bkVW4Ak/o58KB4y8LkkNPSw8dbp83uiNeK+sIXITCkmbiJA2DrvrtM5tv32F49M/crOkTw5v1uwqTRHBiUEX/DPZ5vdZa4rS8QTdamqThGmQDxZS6drHJ/JN+qDI0LVFY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2RZVVhHaEsxRkIrYTA3Y2xNUGpUN2RicGY3SExhSHN2Mkt5bzJXK0pZSENn?=
 =?utf-8?B?L0hXQ09hLzUwNjNxRFlscEdzZFpQNmVjeS8zMjlxZWlqR2FjbFpLMGRTUHg1?=
 =?utf-8?B?cHJHVXRldXRycmR3VmVXdi9VZ3BNRUFRcEpFUk5sZjQrYUFYMnFKKzdJWitT?=
 =?utf-8?B?a1FkVEY4cmhXRmdjSjlYelZUcUhtdG81MFl5UFZaTDYzTWRyOFN6R3FUdXZX?=
 =?utf-8?B?UHR1ZWZ4WHlLSHI0K1VaRkFHSGh6Q240blYybGV0SEhmQ2pOS0E5NVJpY00x?=
 =?utf-8?B?b3FyYmRKNlB1SXF4YVVsQnVwc3l3VHlFS3ZubWVzbVJiakxoeHJvWUVoNjBh?=
 =?utf-8?B?a2JRcDdMNU42V1Q5akxxZlNQc3NOTE04cVNYLzhsOWdxc3I0VUhZaVJZY2dx?=
 =?utf-8?B?YjkxNzMrT01YMU9seGRhSExFTkJ6b0wwT3gvZ0J1dkk5R05xa3VHa1daRUI2?=
 =?utf-8?B?SVNtM3EyLzNhMlcwTng4cjNXOG5jVGxvZHJyckw4UzBDT2IwNmRHb2RBbVBw?=
 =?utf-8?B?bkthOHVTVGU0eVczdEVMUm03UC9yc2l5NkFKdUhsQjFiZExubjRvTXpsWDFC?=
 =?utf-8?B?TG9OYW4wTS85K0ErUkJGZGxTdThQbWpxK0NJaHF5SzlxMHp1L0hleFdMRHNK?=
 =?utf-8?B?RVdHckEwMXRjL0tudFBRaXVCOU84Q29rTlR2N0FvZkN1MytCcTV0bVBoM1V5?=
 =?utf-8?B?M2hYMkRSa21GZDJnNWVMM1dqczg1ak1nMEZFeXBUSnc0aWNLOUFvYkprc0tS?=
 =?utf-8?B?L2d0TDk5VkowNkFQZktQeENjZHpONEpReUdabjI1OWc4WitTNFU4NitDbGZ5?=
 =?utf-8?B?VFVSa0huSnAySUxUUTkrUTc5ZDZwTWZQZjIxSEdGM1E5RnVzUWd0c0tuVFZK?=
 =?utf-8?B?NmVhcGdHMUVFaWZLa3ZSM3BPZ0ZQaW1tNURrTGdlSHNTRnYxYnNoYnB3WDlN?=
 =?utf-8?B?dnBLUjR5SndLVzdXallHZ0RxQ212VDFMMzlRSm1iYVY0ZzNmZFhlODQwTnhn?=
 =?utf-8?B?TEZPNDFaOHJ3bE1qSkN0eDNoSnhTb20wSGxXMWVVMENWTFdzcDlBVkQwd3RE?=
 =?utf-8?B?N2IxSWZJNGNLVFhnR1NuWmJnTlBxYXdjNFR4ZzRPSndyWkRVV0VrQVc1M0hM?=
 =?utf-8?B?eGlUYzlSQUg2UWY5WVRiaG4zOTlzaWM2QlpRN1k5SE9SWUxUQy9IRlFXTGVQ?=
 =?utf-8?B?WXdkOXg5MkVOQldMUWxDTFhsNURwTHc2eWZaODJMR3ZSY1hMRnNGemwvdWpL?=
 =?utf-8?B?dk50RDJwUkJDOWxKbGRBYUVtd3ZFakZXNHFJeEU5VU80TWR6Qm5La0ZMeHov?=
 =?utf-8?B?V3FGKzR3RjlNZ2tvNEtLK3NVK2J1UHdDa0lSa2ZnZ1hyUXBxR0pJeEVwSE8v?=
 =?utf-8?B?Yzc2MDZjSm9rWEhkNSs2Sk9qSmM5cjVwNkQ0OS9sQ29IK0swa010NmJFTjFJ?=
 =?utf-8?B?SVdsU2Z1cnN5YXdROFFCeFV6SmVtR2taY3diZU1LUFpQdUlZMGRhTWNyeEk4?=
 =?utf-8?B?WXZyMmZXdlQvZFNraDlieHQrRElPT2RDRm5FYmw1cUhiZjBVblZPcDEyY1Iz?=
 =?utf-8?B?N2dxTXB0aHFXNFdSQkc5YkR0ZkRnOERrY2tMdW5ZK0FYc2M3U1VWRURkNHRo?=
 =?utf-8?B?cnFESTh3eEZxSkJ0YWpHT2J3QTBuOHpqVFpkbDBVT3JCcVc5U0d2ZFFydUFx?=
 =?utf-8?B?YW0vU0Mzd2hjTEZZV0ZCdHkwL3FURXRnWmRzcnpsT1o0NENHY1pRd2VYRWpX?=
 =?utf-8?B?NCt0eC9JLzAxYjFLQ1hNSkFDWlV5bGZDTkF2Zktsd04wS2UvcUxXL2owYW50?=
 =?utf-8?B?dlZOY1dpYTc3blhQTVNHckVGTHlLQXA4TWVpUlRDZHBnaHppbjBIRE9FVkhp?=
 =?utf-8?B?aW93N0FZdGtFMVNYeHlSK0NJL08xRitZQWc4VWNsTXNJelhzVHB4SnNOaklT?=
 =?utf-8?B?NkhpaVFMTnArMFV4cjVQTlVWSVRGMW4wckxCV2FGelFzdWdlRzFFclh0U1lJ?=
 =?utf-8?B?Q2Y3VzFKTXdybDBTeVRka1RyRWZzSGIraitGejltd3pnZ2sraCsvYmRiYU1O?=
 =?utf-8?B?N1c1bjVySjZqby9EL0dneGZhS0UzdTRLeVYwSy80TTVMdVdhaGlFNkZqWU9L?=
 =?utf-8?B?MXFUMW1CcDFRWUs5SmtKc3pEdzh0ZFlpamw1M1U4S1FBZ1IySHhzQjg2VE1E?=
 =?utf-8?B?ZURvT0JjNDV5WXllMFBMa28zUk40aWVnZFZIOHN6UElwV2RSN0pKMHRhbmlK?=
 =?utf-8?B?N2ZPTjlWakVuSHRNNmVlWVhDWDc0OTdrTjU2MG96T2ZxaUJMVDh1Zy81Si84?=
 =?utf-8?B?aVhVbkFETERHV0dBNGwySlpOV3l2SW9JdlJwcWZkOHhsQVVHK05Tdz09?=
X-Exchange-RoutingPolicyChecked: kX6ZAlS9NCW0eUoletnZ7dqPsHJC7vRNN2P47fSQpnwzS7ip+tSr7uu4Zlvrpr4B1V4UoiA4jJgjFcWzF/ts/wirIkAwEDvtXns97BOxAnNEXADZhx6nGUiqM9+Vp9U9Q5C5mmByDT679sVXDVw8I9hbcb/J5DLOtHhGUSt+2k5VFKEbWm7M5hWtrphPJ1GxeVJUkFFvqvDJyzI8IuXfRRQ+v8qUd9PNfoRynzqzL3SZInXGiCAmbSyEwikb+mOA6DPN1lNxR9Wz0XJfcTKF6pl8owqYUN9J2Lw/QJOOuhpFbVM0c50KsrMfpVz+06qvhEyqzL3Isiu64ZnU5MqA5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec8d277-b01c-4e10-3f3d-08de7f35e3cd
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 06:17:36.8558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gs9qHR7ujTnJwTm89n0jXGxTANDt4ZTMhEoPjOyj/m4m3+uVqO9CnBw0j9lfeVrsgnihHThXkarJQNBzGUZHtqoF7Bjz5c4LomXmk8H5BRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9279
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


On 3/11/2026 11:19, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>
> Add NVL-P device info.
>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>

LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   lib/intel_chipset.h     |  2 ++
>   lib/intel_device_info.c | 14 ++++++++++++++
>   2 files changed, 16 insertions(+)
>
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index cc2225110..5df7349df 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -94,6 +94,7 @@ struct intel_device_info {
>   	bool is_battlemage : 1;
>   	bool is_pantherlake : 1;
>   	bool is_novalake_s: 1;
> +	bool is_novalake_p : 1;
>   	bool is_crescentisland: 1;
>   
>   	const struct intel_cmds_info *cmds_info;
> @@ -213,6 +214,7 @@ void intel_check_pch(void);
>   #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
>   #define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
>   #define IS_NOVALAKE_S(devid)	(intel_get_device_info(devid)->is_novalake_s)
> +#define IS_NOVALAKE_P(devid)	(intel_get_device_info(devid)->is_novalake_p)
>   #define IS_CRESCENTISLAND(devid)	(intel_get_device_info(devid)->is_crescentisland)
>   
>   #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 89fa6788f..b44b24223 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -551,6 +551,18 @@ static const struct intel_device_info intel_novalake_s_info = {
>   	.cmds_info = &xe2_cmds_info,
>   };
>   
> +static const struct intel_device_info intel_novalake_p_info = {
> +	.graphics_ver = 35,
> +	.graphics_rel = 10,
> +	.display_ver = 35,
> +	.has_4tile = true,
> +	.has_oam = true,
> +	.has_flatccs = true,
> +	.is_novalake_p = true,
> +	.codename = "novalake_p",
> +	.cmds_info = &xe2_cmds_info,
> +};
> +
>   static const struct intel_device_info intel_crescentisland_info = {
>   	.graphics_ver = 35,
>   	.graphics_rel = 11,
> @@ -681,6 +693,8 @@ static const struct pci_id_match intel_device_match[] = {
>   
>   	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_s_info),
>   
> +	INTEL_NVLP_IDS(INTEL_PCI_ID_INIT, &intel_novalake_p_info),
> +
>   	INTEL_CRI_IDS(INTEL_PCI_ID_INIT, &intel_crescentisland_info),
>   
>   	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
