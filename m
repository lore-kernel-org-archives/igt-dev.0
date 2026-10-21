Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A93D606A319
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CEJE81Ge
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B533F10E316;
	Wed, 21 Oct 2026 14:59:46 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013028.outbound.protection.outlook.com
 [40.93.201.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5754D10E207
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 14:58:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fI3+FCfFO+3sP4kX9y3Rh4v0KRWpUxFwpHP41t4kfswY4soTW9kTc63Co/btrtxo9AC1Np9fk8TrRXyf9FOnyZWmuZtzrzH1Yz1N7lm27mzlXCMnMU/pXrJkuSoBUB1dLAlxgtZq730VFHDXxXIKxazhEWa+7Hsb4a4yqNQg/HYphCuuHza5ThzuUfd7ktPXiOmyVl+klPXgCrteq81X38fv6NvU3T+1n19z+NX+R6FDPZRcuNYLAqUPvuSH/GsqH0sA7aAgo3UM5FX1RVQxAzuEohOym7ve1Bg7JMdcu7jTJxf0/7x+g9vUPzvdb2fyX80/wGGxmDzhp+tCZkd0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bg8qoK9FWcykcn65JoOrymas1r5J6Edc7NKloeHiTiI=;
 b=USJ/0xeD91NJQD5uiA3g8GTjQYvog6ccLQGmsOERgvOqJI1UG7OcgOtVT5NQskH82tGV/SvVQAStyPyuWnsPoRrERFvgzQHDpT15c0QB4PTH2PCzsDvKXhrlEUfieV2tGPqGZhcblRUx4WVbnc0gP5EcKQQAM5VmGn/j3+UpJYZETsVvNPaClbqU1U+HSXqqxZN985ZJkVt2Hk/41kWxwPGtdQdrCU2iBP/xirhZZjOwxIHx5IpcrQQHKZ6+toHalZzPvYgiU/q7055/CxnmoPmbp+i4w7EeagsE202UWFMLd90dxQbLp+j4PxjyIynVFkYKIf2fb9ujN4MCWTp6zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bg8qoK9FWcykcn65JoOrymas1r5J6Edc7NKloeHiTiI=;
 b=CEJE81GeU8jGdlg5x7xz2dn6oaIHYkn6oBfcvM9RLT6isb5lwnYVaDPwTW28JxG2PQJwtbXJ1o4kGmNwFM9VLzSdjp2RK5HoCUaikdN9zXkFQQ0iLGytF8RCK70BLX2xd+7744hBQvZhKmcmqUt621drQAGnGWC2ud7QyGyDoB4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB449095.namprd12.prod.outlook.com (2603:10b6:8:4fe::22)
 by MW4PR12MB6999.namprd12.prod.outlook.com (2603:10b6:303:20a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Wed, 21 Oct
 2026 14:58:46 +0000
Received: from DSVPR12MB449095.namprd12.prod.outlook.com
 ([fe80::76a6:7a4f:a0a5:18c0]) by DSVPR12MB449095.namprd12.prod.outlook.com
 ([fe80::76a6:7a4f:a0a5:18c0%4]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 14:58:46 +0000
Content-Type: multipart/mixed; boundary="------------6wi0Xqa60RW2i9xX5yjbb0Hq"
Message-ID: <81a6187d-0454-4188-b655-e3eee2063a80@amd.com>
Date: Wed, 21 Oct 2026 10:58:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: insert pause mnemonic only on x86 /
 x86_64 platforms
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20261002191401.469214-1-dmitry.baryshkov@oss.qualcomm.com>
 <20261006142929.v262wmhkjaia2jmf@kamilkon-DESK.igk.intel.com>
 <ced89749-5a9e-494c-9283-59c9cb6c9eae@amd.com>
 <20261020193135.zyucqqpy75yopzsg@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20261020193135.zyucqqpy75yopzsg@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: YT1PR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::10) To DSVPR12MB449095.namprd12.prod.outlook.com
 (2603:10b6:8:4fe::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB449095:EE_|MW4PR12MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a4ad4bd-b53a-4797-ed3c-08df2f83ceab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|6049299003|23010399003|56012099006|4143699003|11063799006|261009223027099003|18002099003|10067099003|22082099003|4013099003|4053099003|3023799007;
X-Microsoft-Antispam-Message-Info: voTZwVFLQSET0fqlyg4vwc/R5waWB/YfVwtyUhUP7ZPHYWQEFElTpBa92g1BNSxVmzVDAMrq6l9F0dEIhGyslB7li005vAzDuIybjwsAQ4WQ6PrKFAI/Ed2Ir7wCiK0zr3OkjObEeTNOOZ3tBwulGfhmA1z2Uei13ArLLtbGSbUpl8YT0DJxYIIF18YbgCnU0ahJC6JhOkZ/TKCOprN2BVncMgEITXVZVUfKAZqHdhqEmS1ayuCyOwJLz+xJo+Jh4txbB7RbEPVp4SAraLleuaOnigTWSmhI5JQfYcclodL0JLnvfaPXkAK8uAjr4pZiFVnzYgcs6jevapOl5pHdzeXIkjPOEZdb0UFOm8sRu5fnYM7t4KSGb/9L7GG0meNKCD3q4IpYU6x1QGYAv8/3DPNX4H9kyyoLnxeN4J6xd4U/uLYmZEMqkcZXGYlwXJSw5rJsuJdoskE0faEVVRnz7YG7t5lh/TiYMjM6yGGv7qmpxgsRkn3jB4l8YrDgwfwROGvb9/pyyHAJS8IhRzx+RILE+WW+TOd4g4tV39jLImD72uNz6ZoYQssOv/5p9AsLYWccxTNx480MD9I838b1LkZ3lX0sANvkFCvg2DjQvQYT7mxD3YHG8BlBd7FOviCKK3Nn0F2kMR34sffDioYiggJoPtK8Rv/TMMxLOaE1xS0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DSVPR12MB449095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(6049299003)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(18002099003)(10067099003)(22082099003)(4013099003)(4053099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWtEZHpyT1BZdnZ3SU9QSlRncFRDcDNNM1JteXZ5UmhqY3pld1FUbzR6Ny9M?=
 =?utf-8?B?blIzQkZZeWdFank5NGkxZ2xXd2lNTkxzU1lOUi9zdUVpUzBBN3AyL3UyUk9w?=
 =?utf-8?B?Z3YwN3IzQ3JMcXpaZjM2Rnh3dGhzcnJkeDhHVFhOL0FNYVg2Z2dGUmxoM0hR?=
 =?utf-8?B?TjZaNEgvT0ZvQzdvT1JZZ09tSDBiR2lVVE11K2RFZDl2RzJ1QlhMTUJPZzlx?=
 =?utf-8?B?VS9pc0ZlUXhia3JyZkpyb1RGTkYxRitZZlNidEpXVk1YTmN0b0pOUTl1OFE0?=
 =?utf-8?B?TXY3c3RJYlZ5MFJUUEJoNlErSUlIMlpqU3NtbmVMY1l1ZkNiQUdzQkRnMlNw?=
 =?utf-8?B?dk5ldU9aME5HbHVEd1NKbnpaTjFOY2E3Uks5aTFMWXdSSDRUR25LNUNxSUlj?=
 =?utf-8?B?czAyMjZkRTNKM0tXTThCbXlJbStjV2RpT01YdW8weTNnZXRsU0krSzQxb3gr?=
 =?utf-8?B?L2VZdWY5MjVnNVZkejgvdjRSYzVmK1h2ZVNHMjRKRHBmSzM1NDdwZjZGVEQ2?=
 =?utf-8?B?OWdGRk1Ta0pjcHN6ZERBVDdybzd0NnQ0YWMrUm5iWWZ5RnppdUo0cGpZdGxv?=
 =?utf-8?B?RU5adnFKZGRoWkRUWS91dTJOblY1VUtSZCtHYUZ5K0hlR1d3TmMxNWJGQ0k5?=
 =?utf-8?B?TmRDeE85WWdkL091WGJ0aVNwUjlyc3o2eUhJTEZzQUJjTFR6RVZDK2ROR2dP?=
 =?utf-8?B?Nzc4amxqUHZGeTRscDY3MndQR1cxb1RWbEVINms2NmFseko1MmlwSDArM2tO?=
 =?utf-8?B?T0txQ2xGNTNtL3o2YmJzUXRmOWtPd2Jic2VjZHNPQWhBUWI0YWFWWGpGT04y?=
 =?utf-8?B?bDJvbndHM0NPR2Q1dm1HQ1lSTW8vaXJseVEyQ0c0eUkyVTZBN2pXeTNCaWV4?=
 =?utf-8?B?ZWF6WXNQdFZxaktCZlBkcWRENnhNZnNKVTRKSk8vVGp2YW1MVGpIZUJPU3Rx?=
 =?utf-8?B?R21HZmNleWNITCtYakt1VEJYSUZDRkNYYXg3T3dWTmZ1Zzk2R0FZaldJY2xJ?=
 =?utf-8?B?Z2RTSW92N2ZLUkhrN2pQSVF5a0pHMWhTSkhiYmdlN1pvd0hBbkRHNlJLdXNR?=
 =?utf-8?B?RUJjVEgyeGFEbG5Ub0RmWHFOdWhRQlo0UW9JNDExdlFUcG5iZUVNS0o4aVlw?=
 =?utf-8?B?ZHdvd0paRzdLazB5VW91UmZXVHFvT1RsNzQ4OThtQU5HdjFQa0dTY05xUE85?=
 =?utf-8?B?NVJPQzEzTlFSd3JQZ1ZCMnF4Mk9GZjFVaGVub2tabXQ3bk5pL1BSalh5KzNs?=
 =?utf-8?B?NjJPbnpvT3J4U2VONXRzeTZuTURyRzlGSXBkOEREUGZ3ZXNnM0NRbUNSOHNJ?=
 =?utf-8?B?c0UwZzlTbjBFeXMxMVB1NEVMM2pQZm9LSEpBMXJKV0FpRSszTW5zT0MzcmVP?=
 =?utf-8?B?NFd3dWxKM2tHOGk0dkxBMkVjTmdVaG1lSmFyMS9lZThGOEo3emlFQ1RnaVZH?=
 =?utf-8?B?OUJuQXo5ZHZvZkxnR3Rudlo3bDczRU04aFQrOFRoVVFHU25UdUpPenJSNy92?=
 =?utf-8?B?d2ZMQThsTi9aRGpra0NHbHc3b1ovR2IxODZZekxLdk5vc290aENuRjFGNEpI?=
 =?utf-8?B?VDdRN1hkNnArTC9FUEs4SlNuMlJzMTgzK1QvV3h4dHJUQjExNy8rWm4xRzg5?=
 =?utf-8?B?L3lTbkVLa05xVmpZWEVPVUhyQzFqVVBCVWgrQUQzeUdyOE1KQWJGdVRiektI?=
 =?utf-8?B?OWU3Ny9HT1lZYmFUdk56NVRHRkNmRkZSR05nZDdGUy9GaHVVWGFreFNBM1BG?=
 =?utf-8?B?Y21ZdzF1VHV2OXVaWXpkSzZVdVRIbklvS1krb3J3eGt0ME9UQmhJUzVMaUJZ?=
 =?utf-8?B?RGZES3ZvalZ6ZHE2MlJKaHZLSHZGZ1VTejc3ZVhyYm8wYU5nemRBRVQyRkc4?=
 =?utf-8?B?blRSTmZjWnBxRkFrejY1WGhLMEpCdi8yaG52ekRkbDJQaXZkQVFTY05aNUVD?=
 =?utf-8?B?S01hVTMzYzZRbzJESHBkWWhqOUlvRHNWNjBtQURPTGJkRlNVenhPQ3BLV1ZG?=
 =?utf-8?B?b1RYUHRFZnYrSHpsN3AwdDJKdHl2dGFMcFEwVStUOUhSa1pFVEl6Y1VrM2d3?=
 =?utf-8?B?SGYrYTRYenVabXFkWGUwaWlPcHhKV2llanNaZ1dwT0tva0RlQ0V1UHBNTzNW?=
 =?utf-8?B?ckNXUnlJUURwWHJ5TkhKN1lHZVd2aGxEZkN2V3NkOGZWc1hPY3VwSVlma2w0?=
 =?utf-8?B?N3dKOEpLWmJscEloTk1JRmx5djE2Rm9yaHNTZ3hwM2ozRUVEQjIxQkQySEV4?=
 =?utf-8?B?dzNETVhHWWw3TEFpSk01Tk85U2NsRGdMeDhGM3ZXZEtudVhwY1ZQanMxMGF3?=
 =?utf-8?B?YlJjZGhBbnppcE5PYVZXUlQ3UFMvcnArS1BwdFpnVVl2dlpOZ1BYZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4ad4bd-b53a-4797-ed3c-08df2f83ceab
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB449095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:58:46.5514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oSmKbSJUfbRRrQA0L9pl13YntsPJNjVwiggI0zvkIPcIVDcmJuKhuqOrt0/NYEP30za/5Wr3nFD6NGPMV444w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6999
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------6wi0Xqa60RW2i9xX5yjbb0Hq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kamil,

Thanks for catching the incorrect macro names.

As an alternative to correcting the guard, I've prepared a patch removing
the optional x86 pause instruction and its architecture guard from
wait_for_value64().

The sleep path, volatile polling reads, and timeout handling remain
unchanged. When no polling interval is requested, the function continues
busy-waiting without a CPU hint.

This simplifies the helper and removes its x86 assembly dependency, at the
cost of losing the spin-wait optimization on x86. I verified that amd_basic
builds on x86_64; ARM/AArch64 cross-compilation remains untested.

Would you accept this approach instead of correcting the macro names?

Regards,
Vitaly


On 2026-10-20 15:31, Kamil Konieczny wrote:
> Hi vitaly,
> On 2026-10-06 at 19:08:58 -0400, vitaly prosyak wrote:
>> Thanks Dmitry!
>>
>> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> On 2026-10-06 10:29, Kamil Konieczny wrote:
>>> Hi Dmitry,
>>> On 2026-10-02 at 22:14:01 +0300, Dmitry Baryshkov wrote:
>>>> The "pause" assembly mnemonic is only available on IA-32 platforms,
>>>> breaking e.g. debug IGT builds on ARM / AArch64. The issue manifests
>>>> only with -O1 or -O0, the default -O2 seems to optimize the condition
>>>> away.
>>>>
>>>> Guard this inline assembly with the preprocessor checks, making sure
>>>> that other platforms don't see the invalid assembly.
>>>>
>>>> FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
>>>> Assembler messages:
>>>> {standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
>>>>
>>> Please add in Cc amdgpu devs, found by git log -- testname.c
>>> here
>>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> LGTM
>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>
>>>
>>> Regards,
>>> Kamil
>>>
>>>> ---
>>>>  tests/amdgpu/amd_basic.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
>>>> index 418db286f81f..494934c1c321 100644
>>>> --- a/tests/amdgpu/amd_basic.c
>>>> +++ b/tests/amdgpu/amd_basic.c
>>>> @@ -705,8 +705,10 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
>>>>  		/* Sleep if interval specified, otherwise tight loop */
>>>>  		if (check_interval_ns > 0)
>>>>  			nanosleep(&sleep_time, NULL);
>>>> +#if defined(x86_64) || defined(i386)
> Our AI review pointed out that there are no such defines used
> by gcc, they should be __x86_64__ and __i386__ respectivly,
> so this commit 125c0289617f ("tests/amdgpu: insert pause mnemonic only on x86 / x86_64 platforms")
> should be fixed. Sorry for this, I should cross check it with
> simple
>
> #else
> #error "Unexpected"
> #endif
>
> and see this error pop-up.
>
>
>
> Regards,
> Kamil
>
>
>>>>  		else
>>>>  			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
>>>> +#endif
>>>>  	}
>>>>  }
>>>>  
>>>> -- 
>>>> 2.53.0
>>>>
--------------6wi0Xqa60RW2i9xX5yjbb0Hq
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-tests-amdgpu-remove-the-x86-pause-hint-from-value-po.patch"
Content-Disposition: attachment;
 filename*0="0001-tests-amdgpu-remove-the-x86-pause-hint-from-value-po.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA3NDVmZWRjMWFjM2ZlYmQxM2YzZmE0MjNmYzQyMTZkYTc3Njg0YTA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaXRhbHkgUHJvc3lhayA8dml0YWx5LnByb3N5YWtAYW1kLmNv
bT4KRGF0ZTogV2VkLCAyMSBPY3QgMjAyNiAxMDo1MDozOCAtMDQwMApTdWJqZWN0OiBbUEFUQ0hd
IHRlc3RzL2FtZGdwdTogcmVtb3ZlIHRoZSB4ODYgcGF1c2UgaGludCBmcm9tIHZhbHVlIHBvbGxp
bmcKCndhaXRfZm9yX3ZhbHVlNjQoKSB1c2VzIG5hbm9zbGVlcCgpIHdoZW4gYSBwb2xsaW5nIGlu
dGVydmFsIGlzIHJlcXVlc3RlZAphbmQgb3RoZXJ3aXNlIHBvbGxzIHVudGlsIHRoZSBleHBlY3Rl
ZCB2YWx1ZSBpcyBvYnNlcnZlZCBvciB0aGUgdGltZW91dApleHBpcmVzLiBUaGUgcGF1c2UgaW5z
dHJ1Y3Rpb24gaXMgYW4gb3B0aW9uYWwgeDg2IHNwaW4td2FpdCBoaW50LCBub3QgYQpyZXF1aXJl
bWVudCBmb3IgZGV0ZWN0aW5nIGNvbXBsZXRpb24gb3IgZW5mb3JjaW5nIHRoZSB0aW1lb3V0LgoK
VGhlIG9yaWdpbmFsIHVuZ3VhcmRlZCBhc3NlbWJseSB3YXMgcmVqZWN0ZWQgYnkgQVJNL0FBcmNo
NjQgYXNzZW1ibGVycwppbiBkZWJ1ZyBidWlsZHMuIENvbW1pdCAxMjVjMDI4OTYxN2YgZ3VhcmRl
ZCBpdCwgYnV0IHVzZWQgeDg2XzY0IGFuZCBpMzg2Cmluc3RlYWQgb2YgdGhlIGNvbXBpbGVyIHBy
ZWRlZmluZWQgX194ODZfNjRfXyBhbmQgX19pMzg2X18gbWFjcm9zLiBUaGF0CnNpbGVudGx5IGV4
Y2x1ZGVzIHRoZSBoaW50IG9uIG5vcm1hbCBHQ0MgeDg2IGJ1aWxkcyBhcyB3ZWxsLgoKUmF0aGVy
IHRoYW4gY29ycmVjdCB0aGUgZ3VhcmQgYW5kIHJldGFpbiBhcmNoaXRlY3R1cmUtc3BlY2lmaWMg
YXNzZW1ibHkKZm9yIHRoaXMgcG9sbGluZyBoZWxwZXIsIHJlbW92ZSB0aGUgb3B0aW9uYWwgaGlu
dCBhbmQgaXRzIGd1YXJkIGVudGlyZWx5LgpLZWVwIHRoZSBuYW5vc2xlZXAgcGF0aCwgdm9sYXRp
bGUgdmFsdWUgcmVhZHMsIGFuZCB0aW1lb3V0IGhhbmRsaW5nCnVuY2hhbmdlZC4gV2l0aCBubyBp
bnRlcnZhbCByZXF1ZXN0ZWQsIHRoZSBoZWxwZXIgY29udGludWVzIHRpZ2h0IHBvbGxpbmcKd2l0
aG91dCBhbiBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgaW5zdHJ1Y3Rpb24uCgpUaGlzIGRlbGliZXJh
dGVseSBnaXZlcyB1cCB0aGUgeDg2IHBhdXNlIG9wdGltaXphdGlvbiwgd2hpY2ggY2FuIHJlZHVj
ZQpzcGluLWxvb3AgcG93ZXIgY29uc3VtcHRpb24gYW5kIGNvbnRlbnRpb24gd2l0aCBhbiBTTVQg
c2libGluZy4gSXQgaXMgbm90CmEgcG93ZXIgb3IgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQ7IGl0
IHRyYWRlcyB0aGF0IG9wdGltaXphdGlvbiBmb3IgYQpzaW1wbGVyIHBvbGxpbmcgaW1wbGVtZW50
YXRpb24gd2l0aCBubyB4ODYgYXNzZW1ibHkgZGVwZW5kZW5jeS4gUmVsYXRpdmUKdG8gdGhlIGV4
aXN0aW5nIGluY29ycmVjdCBHQ0MgZ3VhcmQsIHRoZSBoaW50IHdhcyBhbHJlYWR5IG9taXR0ZWQu
CgpUaGUgcmVtb3ZlZCBtZW1vcnkgY2xvYmJlciBpcyBhIGNvbXBpbGVyIGJhcnJpZXIsIG5vdCBh
IGhhcmR3YXJlIG1lbW9yeQpmZW5jZS4gVGhpcyBjaGFuZ2UgZG9lcyBub3QgYWRkIG9yIGNsYWlt
IGNyb3NzLWFyY2hpdGVjdHVyZSBtZW1vcnktb3JkZXJpbmcKZ3VhcmFudGVlczsgaXQgcmV0YWlu
cyB0aGUgZXhpc3Rpbmcgdm9sYXRpbGUgcG9sbGluZyBhY2Nlc3Nlcy4KClRoaXMgaXMgYW4gYWx0
ZXJuYXRpdmUgdG8gY29ycmVjdGluZyB0aGUgYXJjaGl0ZWN0dXJlIG1hY3JvIG5hbWVzLCBub3Qg
YW4KYWRkaXRpb25hbCBmaXggdG8gYXBwbHkgb24gdG9wIG9mIHRoYXQgYWx0ZXJuYXRpdmUuCgpB
Uk0vQUFyY2g2NCBjcm9zcy1jb21waWxhdGlvbiBhbmQgR1BVIHJ1bnRpbWUgdGVzdGluZyB3ZXJl
IG5vdCBwZXJmb3JtZWQuCgpDYzogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGlu
dXguaW50ZWwuY29tPgpDYzogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3Mu
cXVhbGNvbW0uY29tPgpTaWduZWQtb2ZmLWJ5OiBWaXRhbHkgUHJvc3lhayA8dml0YWx5LnByb3N5
YWtAYW1kLmNvbT4KLS0tCiB0ZXN0cy9hbWRncHUvYW1kX2Jhc2ljLmMgfCA0IC0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2FtZGdwdS9hbWRf
YmFzaWMuYyBiL3Rlc3RzL2FtZGdwdS9hbWRfYmFzaWMuYwppbmRleCA0OTQ5MzRjMWMuLjU5MDE2
M2I3YiAxMDA2NDQKLS0tIGEvdGVzdHMvYW1kZ3B1L2FtZF9iYXNpYy5jCisrKyBiL3Rlc3RzL2Ft
ZGdwdS9hbWRfYmFzaWMuYwpAQCAtNzA1LDEwICs3MDUsNiBAQCBzdGF0aWMgaW50IHdhaXRfZm9y
X3ZhbHVlNjQodm9sYXRpbGUgdWludDY0X3QgKnB0ciwgdWludDY0X3QgZXhwZWN0ZWQsCiAJCS8q
IFNsZWVwIGlmIGludGVydmFsIHNwZWNpZmllZCwgb3RoZXJ3aXNlIHRpZ2h0IGxvb3AgKi8KIAkJ
aWYgKGNoZWNrX2ludGVydmFsX25zID4gMCkKIAkJCW5hbm9zbGVlcCgmc2xlZXBfdGltZSwgTlVM
TCk7Ci0jaWYgZGVmaW5lZCh4ODZfNjQpIHx8IGRlZmluZWQoaTM4NikKLQkJZWxzZQotCQkJX19h
c21fXyBfX3ZvbGF0aWxlX18oInBhdXNlIiA6OjogIm1lbW9yeSIpOyAvKiBDUFUgaGludCBmb3Ig
c3Bpbi13YWl0ICovCi0jZW5kaWYKIAl9CiB9CiAKLS0gCjIuNTUuMAoK

--------------6wi0Xqa60RW2i9xX5yjbb0Hq--
