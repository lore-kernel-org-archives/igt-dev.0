Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FFCC79FA0
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 06:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5141510E092;
	Tue,  8 Sep 2026 06:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cy7ASECF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932E310E092
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 06:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788850457; x=1820386457;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cWjhwRtcHvh7n4oM9rZDknbb4Q21cF0aFq+iv7YdCR0=;
 b=cy7ASECFeDNTglS6LSTKQlkUdD6hhHluosBb8mROdySkBcv5/xRFe4lz
 wexlC2j+Lb6zVtR15ej5+nh0vasxkLRZPQ6hq7P+6AROf6NiGJfxRup4W
 h44d8Aqn9QuY5jmPZpo4dR0J59/FRUcUI8WgHOy+YQmn9aKhKPIvp29Ep
 X3mgwXBZmyijPR8G1TRQIrK+L7LvQbeAoyNl3Nww/c4FVhiKhs410CBsB
 TXXISi7SAGfoZutNivY+JCvOlR4zd6uMPuqzW/qi/G5ZyRaFZ0pdxc9zF
 1TbTSh2HUhVMlPir8w7TbDOx4ShTS6GuqyRsjinum6gDsVKYvK+8hzwwD g==;
X-CSE-ConnectionGUID: IFX5aFwbRmOsje47suOBiw==
X-CSE-MsgGUID: Kr0oenFVQCmv+hS3TlCnxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88392617"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="88392617"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:54:16 -0700
X-CSE-ConnectionGUID: PSTWUaJ1SQqPu5UkRVv83A==
X-CSE-MsgGUID: zqDtDd5xSRKf1fTPyV+mtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="274426843"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:54:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:54:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 23:54:14 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:54:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSuN8gfDtYYddj1ZSxSWSEdQF4gUElz84TzOofevBYHfip+TlXap5iVLGcTR9qC8gMGdsuWkYzWCFk+MGJtAT9ggSTCNa3+QPSazfvgKPSsyUZlwfV6gOBPMeURMu+HTMLaIS5Rjsu1uO1XpGugQ0twpSpPi15vkoHsJIe096LB0WosYUGhUAsGGuViQDt3/k4gaK0GynZMckKloMisW1Oh9nZRuf26n4AS9IDC7JcDkqk8Qj0aHYL+iYK0T65sBiEKX+wwA5/AUXvKuslJdC2f+qXeB8p41lMTLaboYkAc1xFb+cWV992FVUjbwFKcKweggAbuzR/0SpkTkfL8hLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVe6MnN10adtBsGtDxhxPU2MTZMLHII2wGiZJZWTjqI=;
 b=uW0NEHXkcRWLkBuzIauxld9cIYeY2S297fQ5U8gmQWin2MsMOEAD1d4wZVS4zVj6DcHdvQ9Br9ftqQ7buOhE4udWiFQWBU5rYL3Odf5s0//+JC0LYG2TOqXWBqu/QAtsEgI8JDXLYW6HMHiBW+S9+p/d7H/I8Xt2G+fAqYZfpa8ZgvZFXHZSarWaw5wEIlq7wKDOAO69AxQz7hF51ksADpkc1oALZvPILI8OV/Vl+S40r/cYPFG9nX727H/qrlBtjDsMWe4AJNGhJXz3ndQ1yFCjp8IrmYrvYMJdyCUxOZyBteJjuHtq5vz4xZJNjizmYrY1HRhKq6XWz6hWTMOWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DS6PR11MB371697.namprd11.prod.outlook.com (2603:10b6:8:4a5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 06:54:13 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 06:54:12 +0000
Message-ID: <40cf20af-d61e-4776-b8c2-310967cf2fde@intel.com>
Date: Tue, 8 Sep 2026 12:24:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_eld: Fix 88.2kHz/176.4kHz sample rate
 parsing
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Simon Ser <contact@emersion.fr>
References: <20260901113313.627816-1-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260901113313.627816-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0326.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::7) To MW4PR11MB5871.namprd11.prod.outlook.com
 (2603:10b6:303:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DS6PR11MB371697:EE_
X-MS-Office365-Filtering-Correlation-Id: d002c950-897a-4513-abe0-08df0d75fce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: bdt1rfmmCKTqgzRvOG61CRO3uoS/Pd1WKA4HCvvzMWUAG73UZ+bAOpFS6Qv1R6iUUgKcoIJOqSCwc/2cCHJFrEjX/flFqWaW36WGl8ghjFpfgjdXbTjKTiM1o00h/w/jWlbVf2kvpK88jM55M2kXJ7sPgrHI4sVkxcb7G5HT8zlrBVuQJ0guVRYOmzPtxQ2MzX44yU2eO0px8xKjUiC+Qm1CS7XE2ztPO2Kfs8nNApBmaib5xR6C/elx3kkuHu47CRQYP2DSsrpQIQUsUaimJfM3MDEmgT6Jr98nLON2nkAzYNA8e91SeP30A6i+PwSDC5ZN0GKeT2m/c6/VeH5SMPM3usPZPTpGiAX6RRG/+pl3sO2fz5BvNDPuMFgB4zyGluUNnR/tMwGaLzEpw7V4iBeyTN+mlRHJ0PGx3HIxzKjEibvJ1O20cvaByucBDTFjvy87c/nP51rzJuNjtlR2RBi+tzt30Ch6to3dIkYVZQZdXALcU+rUlhhwQnsLGhOGuTAgykwo5OuzgYt3evCtyH4jXzc505GEu9qY7+VXwlxUfuSY/yqckCVJ6Rma89IvAWhAys7HUEGTQJv+vYh5RdpV7U88InFuC5X+VRsWeJ0XvA37ezww8qYBIPeFOpp9zq2tQYNlDC+tlh+7brdoUnPFQKVjJFYwnh91TArdBdA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzdaRVRlaCtVT2RMbVJjbVgwYjNYSGFrbzFVb1FnMmJoZU4xMVJjRENiclls?=
 =?utf-8?B?VE4rZHNZa01XZlhzSW1VRFgyd1Bxd2Z3QzBZMmNENXljc2JOZmtGcmF5Rm1G?=
 =?utf-8?B?SHFqSjFyZXJ1eXFEQnFqMDJteGNRN1Q3YkFnZksvTVlDZGZkU3VjK1FLd0do?=
 =?utf-8?B?ZlAwNlFlQ0hMbjdBUUNOVjVoMjl6aU1LOVl5U21YMmYvdy9RSm9xcDF3TEQy?=
 =?utf-8?B?cFNqbUFlVlV4bDhOSHBwTU9vWXBSVHNPWDVRbHp3Yzhyb0gyaGVZOVlHNUp3?=
 =?utf-8?B?YUdoc2ZESkkreG1DUm5GaHB5Z3VGZjBuWGtvLzdZN2ZGMFpjZ3QyaVY4NGFJ?=
 =?utf-8?B?dWR2NjdyOHlySG9jcmR4aFZQOW9JNVlSSjFlMkp3SFdkTDh5TlBYMTJnbW8y?=
 =?utf-8?B?ZllLNXpxWVY1Qk8yTzd6Ry8vVnZFUERqcUdseCtiYjFtb2cweW5pd2t0bGFj?=
 =?utf-8?B?YkVHSWpkWFBHVS9jYkVIWURqWFowMXpGczd6eFFPL2YyYkNacmNXTVp3N2x4?=
 =?utf-8?B?N25pZm5BcnR1SytZS2NoeXFXQmprYS9zMi9zb3RzcXBjVFJWTjdlSVN4RlVC?=
 =?utf-8?B?TkVIdDVvRzl1REpwendFcGtnM0pZa09JakkvekVzbCtLTk4wa0V5aDRkN0Jy?=
 =?utf-8?B?K1RWei9mWjVERndTR3RoRkpmaGwvM0YvdHora2JiMzZwV1NqUmsxQTE1UUNS?=
 =?utf-8?B?TnBOcnY1d1I4aGtwWmp1QU1TRTlvRVlyYkdONjdzaGZLRkJFSGY1QjdPbGUy?=
 =?utf-8?B?M09YbXZLQkZUYkZ5Sk1PeHM5cGtCYjh2UVNwSmpqVmdvUEo2WitXL0t3cWRo?=
 =?utf-8?B?L3AwVFpOL1ZJcm1PYWp3ZnR5SS9xNnVodDRFanJSUEhsZ2dLcGFodUJGMGpx?=
 =?utf-8?B?ZGxwRU0vZkVkSHhIMlo3TjJHV2NXenBpbkQxQUtHaWFWRSt3YUpYQXpsUHpk?=
 =?utf-8?B?UnNsNHlDeUJLZm9GV25QclFrMkFlWE9QYUIrY2VtK0o5WWJ5Wk1DaHdpQjdL?=
 =?utf-8?B?R0QzYWlGWTJRY2V6K3N3MGtaOW5SSEdkektQSHpiM2t3WkkvRDZHVkFHL0h6?=
 =?utf-8?B?RjBMYUxRZDJHemxRdVU0MjRoOC85aTBGbGJCaDhDL240cVJPMVJad2RTaVZQ?=
 =?utf-8?B?RlRlYTVHNkdSTnVXRktqWmNDRWF1UmlSNTZpZEo5Rm5oM0ViOUl3aXhPVVpm?=
 =?utf-8?B?SVJYQXNpenZrMWdWL1RxemR4Nmh0M29VeFoxREFVdzlSc1NiQXZGSVpaUGtU?=
 =?utf-8?B?cE1UTUE3T0xNMDVWdHJzdHU4b1NpRUZMb3BPRzR6d3JRbWl6MHBHUnBzbkFC?=
 =?utf-8?B?VjBmZFpQcDNoUUVVMEI1K25TR0pCOWtIVGxJeDZITThGL09DOTRvYUlSanVm?=
 =?utf-8?B?ckFBWEdaMUViQXQ1K2NIMGM0a0Y3Y2Q5bEQ3ZEF0TVFIcWxGSzk1MHNEU1k1?=
 =?utf-8?B?blEyRVRmTjdWbVhndEJua3BSUThoUWhkS3Q2VU45QTFrUDM0OXJXRmM5eUFQ?=
 =?utf-8?B?VmdUSVM4aUIyV0huZ3I5alhPNUw4RkVOS0JXa0o1cGNpdUlpUXcwd2dpUkpL?=
 =?utf-8?B?Mlg3UFZyYytvc2U4UWthdkZVTXN1d3Vkd1FFd1NpZURRYzJRRDg1aXRTdVZq?=
 =?utf-8?B?TDFGeDl6bVo3bVg3bGtNRXNYQUxrK0R4cW5xKyt6czd4ak9PMlhud2E0Vi9T?=
 =?utf-8?B?dWV4QTZ3aFZPYlRuaFhnYVRwT0YwS3VraW5uZjRWWjA1YjM0eUdIMEdDc1pH?=
 =?utf-8?B?SGZmZ24rRUhuWU54MnJUckNsT2lIbURSM2ZzZm5LU0drbGRjL0g2dHA0L3VT?=
 =?utf-8?B?ZFg5OVg2T24rOTY1VUI0V1dUcHZLcGZjUEU0a1hNK3VUT0JwT1ZMYUJ3WG9v?=
 =?utf-8?B?cFFDZGFkUFRXY1dXK2lQRjRaak1uRjZnNS9oUTM4dUd2Z0N4RTUvZlNoOEVI?=
 =?utf-8?B?RTNrQlBOVzJWTFFqbUpyenU3aC9GaEtXL0RCWjQ5NEhBZVFZTXZxdGVKUUpK?=
 =?utf-8?B?K2pxOXFjSG1ISDVpR1Rjc3ZuTkFFbUdyODc2WGl4SjRHZWxMS0N2dmU0cFAw?=
 =?utf-8?B?czBwQldNeDNvdEZIRkhMRDR5YnNJeEdOVkhCd09pYXNnQU9KVGxVUXdtMmRV?=
 =?utf-8?B?dVpKL2FxaHRjRmo2MjFpY3JieVp1Q2ZjLzlRRlMwZlVKV1hBWkkrejhRejBU?=
 =?utf-8?B?ZXVnaHhvRFRWRTVRbzRySXdwZVVaak0zQjNxMXVQeThOSC9GNHJ1OWhRMFda?=
 =?utf-8?B?UWdXSXRqSHRkblhCdmRkVlA1MS9UeVFUenpheFVMdWd1U2Fmay9ZTm02MGtx?=
 =?utf-8?B?bXNjYXpwQk9ienIxMFhCd01SbFgrYzN2L3F4OUdKc1lPUktjbTM0UT09?=
X-Exchange-RoutingPolicyChecked: YxjC1ZPOqczyDulEs/ghrohb2LgYunge571i7CeeYAviscZImaO76iDaEzLtaGD5JiCmLaasHrIPbuvjeT2xzWgtwSmPbgllPHq1KJJ1i4jSfmb0aF6v5WfiKeNKaE0/+/Eqwnm+QoDka4njJZ2xPSXw1CZBIKwN12fU6dvkQAmnCbXvUD2IJKqyWX5yA8/E4kjxG/5Wh8wo81YirzoIXGdXW05jDppVikOGmtXLZvBighskiGAL8Fn/MzwoxoU7FDI1RDnaqvH94JN2FY+MmSZIbwI2Bdvcdw87sFP7c9XSUesT9z0KByxN1zv+S464Bs8utfIXU0br1q0GsM6DKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d002c950-897a-4513-abe0-08df0d75fce4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5871.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 06:54:12.2051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXrFVM3SW9rwdn9kLW2r3mHf5jmo4ICWO3wf7uDeVyAqWero+Fv2Gu6Yy5Aa1P7dN4+cNzxvVkMrXu8gB1nlVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB371697
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

Hi Chaitanya

On 01-09-2026 05:03 pm, Chaitanya Kumar Borah wrote:
> parse_sad_rate() matched the rounded labels 88000/176000, but ALSA's
> eld proc file reports the exact rates 88200/176400, so those never
> matched and were silently dropped even when present in the ELD:
>
>    $ cat /proc/asound/card0/eld#2.4
>    [...]
>    sad_count               1
>    sad0_rates              [0x1ee0] 32000 44100 48000 88200 96000 176400 192000
>
> Match the exact rates ALSA reports instead of the rounded ones.

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   lib/igt_eld.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_eld.c b/lib/igt_eld.c
> index 4a6f867ab..896ab0e6b 100644
> --- a/lib/igt_eld.c
> +++ b/lib/igt_eld.c
> @@ -76,11 +76,11 @@ static enum cea_sad_sampling_rate parse_sad_rate(const char *value)
>   		return CEA_SAD_SAMPLING_RATE_44KHZ;
>   	case 48000:
>   		return CEA_SAD_SAMPLING_RATE_48KHZ;
> -	case 88000:
> +	case 88200:
>   		return CEA_SAD_SAMPLING_RATE_88KHZ;
>   	case 96000:
>   		return CEA_SAD_SAMPLING_RATE_96KHZ;
> -	case 176000:
> +	case 176400:
>   		return CEA_SAD_SAMPLING_RATE_176KHZ;
>   	case 192000:
>   		return CEA_SAD_SAMPLING_RATE_192KHZ;
