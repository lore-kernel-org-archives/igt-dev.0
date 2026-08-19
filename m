Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34444C5DF81
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 15:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1A810EB9C;
	Wed, 19 Aug 2026 15:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oIoFZGlr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D273A10EA73
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787153942; x=1818689942;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xzHpC/pRIONFsvb2+WIn5rmYBr+wnmZ+d24rD6pemH4=;
 b=oIoFZGlrRKHJoC2rP8zBFI26j8eapsEN1WyJAn0zBJXJtSfe02uou+JN
 MB0IQtUqXCZ5TI/SnO2a4bDlIMqaIMX6WIa3loGXRugIZg++XhqNlh3tV
 cP1pyBV01ePeqbUAxR/wclNAC3OZPvcacYNbv5pC9TtZUElXigkGBd7MO
 Htz5ui6ORH03xJ0Rm0g9lXQlzYoOeYlM2c4dN7tjsVjNch8kDXVhACg0c
 zDtbRkAZlBvRIRIVpDTdb43kyEY1oXdIW+V5iAGv55VQMJD6hIuULgD+5
 pGNc0ENdAmqlLPEWWCEB9QyhY8VzT9hCZJcc6LP4UM5aSAcEL+qICf7y6 Q==;
X-CSE-ConnectionGUID: p3AeMjrqTj+Z45fqjVK3cg==
X-CSE-MsgGUID: zgLZ2rFeQNul9twQd7nrEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="91485754"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="91485754"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 08:38:57 -0700
X-CSE-ConnectionGUID: KB3uCodvQbalrrSupkv9yg==
X-CSE-MsgGUID: ZKdMZYkhQkCgfHR6FdUHTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="266189021"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 08:38:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 08:38:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 08:38:55 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.18)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 08:38:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVWSzP0moIgX/+twqQ/mOXBMFGa+UCC572i/Zeo2C0VrXmP7tEbSRbFjro1wlfxzGW6k2tff/L8N3xqsb6dnw+VXsUHZ7++boNVz2LeOIvRNpLW5bTQK7GjQzGi05F9oq0O3iq9jk6gtzRJwXGeITEVuqn5TuKEgj/OzcBiwTfdqKyw+5mGNpaQ63lTBJ98t5ciP/senQDHgI123XdMx/U/mI2cJeQZogWF0TAxn4Df5owdS7rqSr1aDF4aqybO6lpvnZwVLXfMInaUz538t1lFUoskhQ8JJBZUismZpHP4eqKsiVUn0m+mBNy4fLgD0gr+guwwMikQ2aMZDqr62lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vO0jyR8ePHLxwf37wjMuRWxWbqCADVZRiETZz3rr08=;
 b=LJYSDjt0PTvHx8wrtQpCvgScpfXLlAu5Emo8izFmgVPO/irj5yq0P+O7JRkv1XPMVTnCNk6TgGiNCv8fNW2C+6JeROuEqxyF+bCcNgFo2IDTtKpgqfI6mRCEEHfTfwq+Biv3GqE+ayjahTLK/ifAqImrmnWfdVmMZPiiRjXeE7UDH7H2ftu503omtF1mFOHNlayvw3DmAUxIOTTB1mE4Yk3KKIzs2U9+UU76sb2w5dNOo1vcbW/AZmO5+R7kK99kncVoRJ60z+2HOWmDSJPo05xDE+BiTQaUHrMx2AXsiQiL2F1dyOVohJvoUrGaNrsaF2dQQRWTgWw/HL7Fj00PMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 15:38:52 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 15:38:52 +0000
Message-ID: <39f548e7-2ce3-46b0-8f38-02a6eb93a0eb@intel.com>
Date: Wed, 19 Aug 2026 21:08:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "tests/intel/xe_prefetch_fault: add L2 prefetch
 fault subtests"
To: <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260819153658.18373-1-nishit.sharma@intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <20260819153658.18373-1-nishit.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::13) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|PH7PR11MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 2834740f-7e10-4164-8cf6-08defe07f8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|5023799004|11063799006|3023799007|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VBiIQazY+FwDC32H0O/jDD8A6LC+r4scX4Ht8zCoPlWNggTxPfdO7AmVuxci6ZRg7cMzHFj2ahCmPdUewLaCvGrd2PkMU+JvA1/rK3ITpCwsnF+tu8ez00G8DWCAxYDPwKymwlUOk2NPY2J3/TPeGFw27Huqq27L0i5toTlJ0J/TY5+oAtjZIfNz6VORTcGCdNqNi1lDqGVZ6b98pqsj8RqygPLRRDnmJMczdYhk8T/SXaYfsFzVD3PvZDngFhxWvTPkfDc+/az5R2XGklY2vlxOZCMqE9iG82OQewa1DTnDJMUMP1gHYMY2/PRfLhg8w7DLCKPAS/VqxzjxvEsznYVvWjf2qlTkTSSTWGPG2yXdur2lRgd1xZ79B1uZoeFpKK2pP7tkiIYBhNCrJGfpgH3Iai5zgR2aM+pXSuA3YIjAYa2CKuA2etW95ZaxYQFM/AiiMUROYaldcHwbLFACj9Nkt6f5nccsQI0IpR7HYvUyhJB3pqRw39oarSvyUTXl3QTSNimV8VPYn365mWpkqH3a++XdoOViZVYTRjJEEuQRNTB9Ifwwlf1eHxhRB1iRBIZWD6Fgb5PLOs04HAcPkvxIJoYeI2khcMuM/WQMNDRuR1uJurtlM2iwdceXp8JTiy+9CbFYOHYHanFZ2qDjd0nitafFj83W/Z7tFMIwXcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(5023799004)(11063799006)(3023799007)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUNGc3o2R1FNdXRMMEs5UnZqS1NIaENCUnliNFN0VW12WnRiZjlDR3MvYk5j?=
 =?utf-8?B?TVlabXZ6elR2aXpVRW9DQWd3SjAweHpscHVVNWlLTzZsMlpPNlVOU0UyQnBo?=
 =?utf-8?B?eFA4aW5sOFd5UW9GZ1MzeXgxWFVJOU52ejhYWENPYW93TjMxc3EwS2FYYnVq?=
 =?utf-8?B?aXExMkVBbjdCbmlTMXZwclhLSWN6dUhRV0JqbDNiVG1TQ0pWWVdqUDBpSW9U?=
 =?utf-8?B?cXV5OFh2M3p6QTY0WStXMTc4RVBOUUsvNk92Q2EzejBHaWJ2aVhqeExwQURw?=
 =?utf-8?B?azZqL0ZPMzNMTmJhZG44VmpzSCtFOEsvMFd0YXNjZTVmbng1SUVkYmhUYjg1?=
 =?utf-8?B?UGtEUUcyMEZYV0k5elBJcDNDRXlheGlRNzEyczJOVGVudzZ4VFJ1bzJmS2py?=
 =?utf-8?B?dGxJaFJ1bTJ1V1JvcVpISnhGNURmMU9OM3ZjdHpzbitVQWJ4ZHExb3BDYUhu?=
 =?utf-8?B?VWxVQ3Y2WkpsUENHZzVsanZ0N09PTzNWK3Q3RW5jZk9vUitnS0hyUTBmZDdr?=
 =?utf-8?B?bUR6V2IrVHk5anRUU1lIU2NTbXgrTlhCUWpYY0FEL1N2eDhFY1VKRnlscUZ5?=
 =?utf-8?B?a3JsU1JkVGNMYzNNaXU1bGVJc0RjaUxNUUJTd1pBVHlmL0o2RGxIc0tLcm9x?=
 =?utf-8?B?cHJCOWxYOHJpblVwd0pJd0E5RDFWaEtrTzVXK0o4eFBSZDlJQkxDWEJZcWZv?=
 =?utf-8?B?eU5HbVdoTy9HQkhJK0pOcFYwQTJwMFpXQ0RzRUFNVW1FVmZSY3NHYjc5TE1P?=
 =?utf-8?B?ZENSL0NvSjBOR3VnUEVaME1JTmlPNjZUdlYxNzlvK0kvQmR0K0NpQ1lZUE1Q?=
 =?utf-8?B?UVErc3B1YTdnWkx2ZnB0NW1jTE5PQkR6a0MyUjlTeUpEeTl6UjNoZ2NTUDRy?=
 =?utf-8?B?VEJSdDR6d3V4VXMySGVYQ2ZVU2JmcUpKOEs3R2tBc2hVc0RSMzAxVms4Znkw?=
 =?utf-8?B?YUpyY0tUK29CQzRWNjhKLzNrN0xNUkFGRDhNcXArUXB2ZzBYamFtOUpzTzF0?=
 =?utf-8?B?R3RXMjBZUzA4NTkyRWhHaU90OUM4OXdNY0ltV2ZzTmVGMnZ6QzQ1ZExNa0J5?=
 =?utf-8?B?NS9pZ1ZNZTVscGNDL1B1alRIc1Z4WmdvZStpY1dJbW40bG5ZNmdpUTljRnYy?=
 =?utf-8?B?bFpNSFc1bjJiN2s3Mzg1OEREWnBzMi90UkxvRG9jUW0yMitjOXNqQk14Z0pV?=
 =?utf-8?B?VmhOdzYyT0FtZFVlT2YxVHNIWU5ISkNhaWpIR1dPd05VQkJia0c2V1NKc1o3?=
 =?utf-8?B?aUdEaU04N0xiK0E1YTV1VDZmOXNtMWJqU1RESDJHeC9yYVM0bjRVcll4aUVo?=
 =?utf-8?B?bWRUc09VNlMxaER4ZVd4WSswNjRwOVNTZXpQaTA2d0lNcXcrWjBlUGxTOU80?=
 =?utf-8?B?SytEQ205NUg0V1FCL3h5SkhFUG1wVU1qcDRoSlFQM0NLUTJjOFdkUkY2UUZP?=
 =?utf-8?B?QU11UWJWRFZhYjV3OSs1Y1l5SlZNU2hBV0xBcDQrSXVxbEZYV251a1Y1Y01a?=
 =?utf-8?B?NCtTS3pqOStabDNPRjQ2WGpDdVpDRGw3WTByNUZaNWh1MFFJZ1lCZ1pDRXFH?=
 =?utf-8?B?QXVidFRsbXdScjNHREJ1WjBDaEdxR2xVTU1xTWo1d3VhYm9vSmliYXBzZmFE?=
 =?utf-8?B?Wmd3ZkJ6VC9mRDFOT1BaUElrTFhaYTJ1YTg5UDFRZ2ZkODl0WXpFSGZNbWs5?=
 =?utf-8?B?UmZ2SHk1Tm8vdGNzSkFOZ3Zyd3YxWnZSV2J5dnloV2xOS0hUdWxXcWJaYytp?=
 =?utf-8?B?dklTU0FTT25kbzZPM2IzUk02UUxmYUVKZGxOQTg4REgzczlQWEV3K001bEVU?=
 =?utf-8?B?ZE0yRzB3RmRncGNlTHdYZ2hzSDBvM0MxZTJPWEtyellBUTFYejh1dUVhVjVH?=
 =?utf-8?B?RWJvUWEvbVcwVXU3MWx4WVBRMkhFUUtnUWJma3JuOVZjVzBwaXExZjl5bzl2?=
 =?utf-8?B?c3ZUbGJrU1dwYTFPUVlFdk1qbHZhUmFtejB2S2FIRTRjbWlmMmhoMUdCa29v?=
 =?utf-8?B?K01qSi9aRFVrQ1UrckptMU5yNzNzYm51Um1kb0RkYTYyTTFRQlA5NkI4c0s5?=
 =?utf-8?B?WG9jVmk3ZUszRVBhR0NnUVVaL3RuVXZ3dWxkbk9Xa0RuT1FSUHo5SHM3ZlBi?=
 =?utf-8?B?ejBld0k1bzhqZmNXdjJscmxqVU9sUmdCNVRPQVljTG5Tc0oybDVpMy9Bb3Qx?=
 =?utf-8?B?YWFLT1FDU0EzTmdnYi9YenAyWC85anNuY1JDN3FUbG9YTDZzSDFnNExGU0Nz?=
 =?utf-8?B?M3ZHY3dOdzd1bk1FNHR5Q0JoMkM5OUJnc0dUTVY5T0tEWmFrbkduQTJCem5t?=
 =?utf-8?B?cFNYS00rU3hrSnZOVzdBY3NZcGdoblB2OGV3VXdsWTRLUStKdlZyUT09?=
X-Exchange-RoutingPolicyChecked: YkLe9409WHf3W6yftaDM4ZzE3iy6ChAGu4h5H/ClPf1UuQzUnAoYU/ek9oCv7ztXcSLG+jZJ7A4CamlPxCFYf9M8uDmLhbzQjkG4PMmwRnjgrliqUbUzsJmJ0bOxWudLg0sMMS/g2XTzCbtIfJrj8L/mN0it8/aLO79i3ZaF/h8tcWhdtXY0vq8aopzsS8dnT+Pe9+0dj9RZY7KccyCRW26WlklvhUM3COdgwr8X+PVx2ai0oInl2Pq6/7m6vPCnvuejNbbIMxD5gGXvWcy7nhBot6dn/VNZFFgZUsv+0b0NNVqBuOJ6GNWWZ16zP8hcxn8DiAOhGG4FlcXcei+YYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2834740f-7e10-4164-8cf6-08defe07f8b3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 15:38:52.6950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Frh1BsyhGgZXz+I5dPwgD+vtAypuQOonm4FIwRuY7yfUgKn7CBJsi06y0+pprL495E24gOspxqQkKOgavoAggQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
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


On 19-Aug-26 9:06 PM, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
>
> This reverts commit aa452bd41aaa95d4090a34b1d6705c646778ee57.
> Commited wrong patch revision. Reverting this and will merge correct
> version
> ---
>   tests/intel/xe_prefetch_fault.c | 97 ---------------------------------
>   1 file changed, 97 deletions(-)
>
> diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
> index 4843f56fd..e86cd68d9 100644
> --- a/tests/intel/xe_prefetch_fault.c
> +++ b/tests/intel/xe_prefetch_fault.c
> @@ -81,56 +81,6 @@ L0:
>   	)", lower_32_bits(addr), upper_32_bits(addr));
>   }
>   
> -/**
> - * gpgpu_shader__l2_prefetch_fault:
> - * @shdr: shader to be modified
> - * @addr: ppgtt virtual address to raise L2 prefetch fault
> - *
> - * This shader can only be used when in efficient 64bit mode.
> - * For a given arbitrary ppgtt virtual address, it raises an L2 prefetch fault
> - * using load instruction with L1 uncached + L2 cached cache policy.
> - * With L1 uncached, the prefetch bypasses LSC and is sourced from L2.
> - */
> -static void gpgpu_shader__l2_prefetch_fault(struct gpgpu_shader *shdr,
> -					    uint64_t addr)
> -{
> -	igt_assert_f((addr & 0x7) == 0, "address must be aligned to QWord!\n");
> -
> -	emit_iga64_code(shdr, xe_l2_prefetch_fault_prefetch, R"(
> -#define IGA64_FLAGS ""
> -#if GFX_VER >= 4000
> -#elif GFX_VER >= 3500
> -L0:
> -// Set base address with scalar register
> -(W)	mov (1)		s0.0<1>:ud		ARG(0):ud
> -(W)	mov (1)		s0.1<1>:ud		ARG(1):ud
> -
> -// A64 offset
> -(W)	mov (8)		r30.0<1>:uq		0x0:uq
> -
> -// efficient 64bit Read with uncached L1, cached L2 and uncached L3
> -// sendg ugm load - L2 prefetch (L1 bypass)
> -// Message Descriptor
> -//      DP_LOAD_STORE_STATELESS_DESC (HAS:2209865465)
> -//      DP_CACHE_LOAD (HAS:2209865465) value 4 = L1UC_L2C_L3UC
> -//      0x49C00 =>
> -//      [45:44] Offset Scaling: 0 (disable)
> -//      [43:22] Global Offset: 0
> -//      [21] Overfetch: 0 (disable)
> -//      [19:16] Cache: 4 (L1 uncached, L2 cached and L3 uncached)
> -//      [15:14] Address Type and Size: 2 (Flat A64 Base, A64 Index)
> -//      [13:11] Data Size: 3 (D64)
> -//      [10:10] Transpose : 1 (enable)
> -//      [9:7] Vector Size: 0 (Vector length 1)
> -//      [5:0] Opcode: 0 (Load)
> -// Prefetch operations are implemented using a NULL destination register.
> -// L1 uncached forces the prefetch to bypass LSC, making L2 the fault source.
> -(W)	sendg.ugm (1|M0)	null	r30:1	null:0	s0.0	0x49C00	{A@1,$5}
> -
> -#endif
> -	)", lower_32_bits(addr), upper_32_bits(addr));
> -}
> -
>   static struct intel_buf *
>   create_buf(int fd, int width, int height, uint32_t color)
>   {
> @@ -180,17 +130,6 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
>   	return shader;
>   }
>   
> -static struct gpgpu_shader *get_l2_prefetch_shader(int fd)
> -{
> -	struct gpgpu_shader *shader;
> -
> -	shader = gpgpu_shader_create(fd);
> -	gpgpu_shader__l2_prefetch_fault(shader, xe_canonical_va(fd, PREFETCH_ADDR));
> -	gpgpu_shader__eot(shader);
> -
> -	return shader;
> -}
> -
>   /**
>    * SUBTEST: prefetch-fault
>    * Description: Validate L1 prefetch fault and hit-under-miss behavior with
> @@ -201,16 +140,6 @@ static struct gpgpu_shader *get_l2_prefetch_shader(int fd)
>    * Description: Validate L1 prefetch fault and hit-under-miss behavior in SVM
>    *		mode with L1 cached, L2 cached cache policy (fault source: LSC)
>    * Run type: FULL
> - *
> - * SUBTEST: l2-prefetch-fault
> - * Description: Validate L2 prefetch fault and hit-under-miss behavior with
> - *		L1 uncached, L2 cached cache policy (fault source: L2)
> - * Run type: FULL
> - *
> - * SUBTEST: l2-prefetch-fault-svm
> - * Description: Validate L2 prefetch fault and hit-under-miss behavior in SVM
> - *		mode with L1 uncached, L2 cached cache policy (fault source: L2)
> - * Run type: FULL
>    */
>   static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe,
>   				bool svm, get_shader_fn get_shader)
> @@ -367,32 +296,6 @@ int igt_main()
>   		}
>   	}
>   
> -	igt_subtest_with_dynamic("l2-prefetch-fault") {
> -		xe_for_each_engine(fd, hwe) {
> -			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> -			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
> -				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
> -					      hwe->engine_instance)
> -					test_prefetch_fault(fd, hwe, false,
> -							    get_l2_prefetch_shader);
> -			}
> -		}
> -	}
> -
> -	igt_subtest_with_dynamic("l2-prefetch-fault-svm") {
> -		if (!svm_supported)
> -			igt_skip("SVM not supported on this device, skipping.\n");
> -		xe_for_each_engine(fd, hwe) {
> -			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> -			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
> -				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
> -					      hwe->engine_instance)
> -					test_prefetch_fault(fd, hwe, true,
> -							    get_l2_prefetch_shader);
> -			}
> -		}
> -	}
> -
>   	igt_fixture() {
>   		drm_close_driver(fd);
>   	}

LGTM,

Reviewed-by: Varun Gupta <varun.gupta@intel.com>

