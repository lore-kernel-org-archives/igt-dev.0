Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03890C54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 05:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845B910F2C0;
	Mon, 18 Mar 2024 05:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFD8SMHv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37E310F2C0
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 05:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710739605; x=1742275605;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X65VfBe15av886cMAVjjTQK8g2x8xgMN+p6GEGuyFYk=;
 b=XFD8SMHvS4ilE6mej9nTuqVX0zAudclPs2OvQ8EO40e1mGxyUUZ/Agmm
 2rD/CCQA0JlEqHTnRrDbxZLVAihDmL+R6sKSp2tspJ8qmDIYTRc1UY1LG
 V5Yo/UEdPfpN42iqzNgUeAuQInxlx5ZOVEQVk53Y0ge+Mm3aCTv10MDpl
 hVUV0ZnQ9wrbghmMNI7Knb1b6obOr98TELtyMJDjkqD6jpaT2NuSaIQ2e
 u+kim7qmBfASe8SiIvMZBtOHtuo62tuDcuAfh/RP1duuyzAtId157aKgn
 EilsXRhX1QPDDjamHmwR3UcCRQjsofq8N5dh19YCOrbXX7E4Zz2ozCga7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="8476035"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="8476035"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2024 22:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13295415"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Mar 2024 22:26:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Mar 2024 22:26:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Mar 2024 22:26:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Mar 2024 22:26:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdqOycKvacThE/Cq9s/++PPUxhVAExDxAQuIpGi2/AAOACbxL4cJA6PfCE1/UFE0wB/Rwzmaug2ulsWYAgM50jiMJrIClxAkClia1tRwZ80x70eA3u4ZQDk1PgxF2orOwQEoKf0e+yC3Mz/Ydh3FNgunmj5SYOLpG3IBw58ulvLjrVp4HL/sQER75Ex6At81kpi9K3lQJYbxpWbJa7EPpy4dguoOLBf6hxuGXFIrOURa4ZqM/rClyWk675fiHxtlKr/ORjifc68j6Aqm5F63VLbSAeN/rPoZG4uNxQHmcU7pomhd3RTEY63pOxaSxeqNxhTqM3DlrD6z9FAfxD6h6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izBwdVxpqp4MwTDAz3IWqhC8vgC3HHtOPnc08Q5fQag=;
 b=YLP807jMR2u69pxgqYMWiqRbZIGn3b6/jpDwSzem2JzvXR/jRQD1o28IhL0lbnb2cZ6WSnnNv5y/v9GUYPM6n9aHzL6XeS8aPzTF6fNHZbFJUmjYejwO+X2kOef3qCyIwHNVq78xPJsFe07F58tcT5RShFu0ICoN5Y1Rk+57TTkHdzwP3V4WmNq4ugUrhDw1aNgxoY8HZFZMTQTebcA8FmLs6JsPypISq1kibmm1xWfcA/yIooeTBkxekaZNo+d5TQuRIFT+DxLyYV0W8BmgkIYAAVOzEQydbXjrXMx7MsCmazKI13ckilmWMDE/3D31V5c4dQ/3H/8jCwfyeU65Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by SJ0PR11MB5021.namprd11.prod.outlook.com (2603:10b6:a03:2dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.10; Mon, 18 Mar
 2024 05:26:20 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 05:26:20 +0000
Message-ID: <cf8ce918-5210-4373-9b31-95043ebf9f99@intel.com>
Date: Mon, 18 Mar 2024 10:56:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/kms_big_joiner: revamp bigjoiner
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240310142721.874315-1-kunal1.joshi@intel.com>
 <20240310142721.874315-3-kunal1.joshi@intel.com>
 <1f851af4-6634-490b-9535-d8297c0f3624@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <1f851af4-6634-490b-9535-d8297c0f3624@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::14) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|SJ0PR11MB5021:EE_
X-MS-Office365-Filtering-Correlation-Id: 4170af10-ab58-4056-7123-08dc470bf167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K9eqUpdTHcIqvVlw9U6Yms0/p4palDMEeH+7ryuoJ/bfp7HwSspcqsuPO+rxTlbn8TumYeM3Tu3Td8DbgLwPhr9/m95ze50vSxiYJkGcMw4pSrAwkvENG48fPiE3aAVPOwrKVq8R2CJtL0UwxarpSfmFhGTF9qhYdE1DPBlLYK5h3+bD9JuMbp5Ao3qLxoyS41XON0PqKqawT4UczbAENMhZwXPEHFOAOyoebaZyLKtzF3c61sdHN6npKoopZl/E4fBJCKcuv8NqrzQJpjiGy4jm1AQJc5ceO5OLqlN07x754fxmzNMHddgBNpTVeVgnpyH0dpHgzqwB7Gi0g0+BFZISaXM4Ex89OvDbC+QV6fF/FPfnzj8ec7O+QnBZCd6Gd/b4xL8lbeOyO3m0y6s4d/tcZaZsfCp9YYTAFdfVsxvRLSmrJ8P2d7jqJC6s4u0Cg0wykjQ1MJQCtxsLgS3oonLmJsUqCQNwFDJeqEMMuUE64QrZCjFssxuKM9GIa2F0FPFKU8tm6b/1T4QppomawcAOXMru2Yt+hW7TN7jQSpXe6zfHllq5ILONABbPVEJ2dsammycI11bG94/iycVgcfjBdzPmUBJxXG8llFbTBkZIssp9r4JflcwpqB2e0s8aFx05VJVnCRiPxAqXnJYFH0UC55JPB5bWUjwcYXWQw24=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qms3YThiWVF6VlVmN1dyTUM2d0FKVjUzNXhoSlZkTitCN255cjBvOStKN29I?=
 =?utf-8?B?RThxQW9WQTVuMUxyd1RmRTYzRDZnZTNkbGVRWk51cGhXeGhTU1hxNzJ2TnVX?=
 =?utf-8?B?dk1xcUp5bGRVVDlEbGh0ODlGcWFOekp6Z21TbzBMM0JJVlpMNkhldEJSWWNo?=
 =?utf-8?B?MjRyejB6Rll5RDZ5Nzh2Q3czRXd0R3JnYy94SFB1UDM4ektFcVgwWjlybVBs?=
 =?utf-8?B?TlVtenpRbk1nbzJMWWJGc2s1WmYycXZlK2lObktVcUN0ZHpBbUQ1YkNoUTNu?=
 =?utf-8?B?MWZSd20vbnloYlVqMURZdytGNnNHUWtTRFZBc08rK1R2c1lybElXazZyV09v?=
 =?utf-8?B?dVdNeTBjSmRGSk93cHVOTjJiRmQ0dVNXYW9TY2xlcFVMYU9VQ2VoSjErdHdS?=
 =?utf-8?B?VFZwM1QrUTIvMERUVVk5b0E2K3pLd1hHQUtSWUJld29YTUhIc0p6MUNLZ25t?=
 =?utf-8?B?RGJPanE0NUJPbHBaR2w4OEZSN0t5K0ZIdDRXMmtycGJ5Qm5DdVFpUW5FYXN4?=
 =?utf-8?B?Ti9IaExNRHdNSWZqL2h4OWx2aVRVemk1TGJFSGtqSU01OEIxekRDNHF0allF?=
 =?utf-8?B?UXJNMytvN3BWTjRLK2gydG9HdlZST3NaZUw4d3hveHJyb0pucE1kVzRrRld5?=
 =?utf-8?B?cGErZytBRVI5dTM3OWgyMXpXM3NlTHRSTk82aGFUOEU1RFNOMS8yNDJtY3Vp?=
 =?utf-8?B?WVA1YXZmZ0M0SGo3NnJtQjFiNXprRkFMcDE5dldoVnowY1A0TTZtV0NVQnQ3?=
 =?utf-8?B?N0FXWGVvTGVCYjdza2FpYzRjM3pvR0VDako4QkdldUQzT0lraXd2Z3J4M3lF?=
 =?utf-8?B?Vm5DSkg4ZVRDR3N0dnUzRWE2b3YxTGtZZDI5WXUrTS9SN0NuVDhVbVEwZk43?=
 =?utf-8?B?YndaOFdBZU5sNmd1ZWV2RG5QS3NNbXdWSWNWUEl6aTBhMnpvOFJaL3Z5bloy?=
 =?utf-8?B?VGp3SUVYb0JTeGpMNDMwNmk0K1BjdDVJMno5QW1uR0NmbEM5MnBhRGR3cjJJ?=
 =?utf-8?B?V2hEM1dHSkNmRmloNDFFV2xwNGVTSUE2RnYvNHloRXI2UUdyZWdpODNOTzl4?=
 =?utf-8?B?NzRuRlZXTVVOVXpwcHhCTFJuQ2pMdGt6YlVmRFJPS29ZbG44eWN4c0hKT0Z6?=
 =?utf-8?B?ekx6K1pDbHlWK3ZJT1VxZ3RtYXhUS2p1S3BoZ1A1NDBWVGpQY2NRY1M4U2sr?=
 =?utf-8?B?VmtTbnRITlliSkFpLzFzNWJ1VmR2RUFKdjVEeERuSkFlR3NWN2RGVTFvQW93?=
 =?utf-8?B?RWc1NzVjNTIwcDdSV0NaVUxJRENoVkt1SnBzQmEzNVo1ejhnT2pHa2ZEMGhm?=
 =?utf-8?B?T3pVc0JnTmNOQkdQWUlBK2hLS0ZueE9qRlJaN3FGekZ2bGppUWplb1orNS9V?=
 =?utf-8?B?ZnBkOGs3dlhIcUxRaGI0WFExUHUyb0FVSCtSRE9abGxJVW8wamRVc2NyOVZw?=
 =?utf-8?B?RHF0bVB0d0tvR1pBQzVkVmFSYmdxZEhuRFpGVjdjZHUxSUJIeWRyblRhMVJR?=
 =?utf-8?B?SDZLajhGQks3MnVsNzEvdUErRmpwMlEydzgxdytwTXRpMzFGVEdIYWh0YnVm?=
 =?utf-8?B?VVdBTnJhcklhNkRYQTN2Rk1GK0FERVQzMnVsVXFXbnVHUzFWaURLc1REZCtx?=
 =?utf-8?B?YmVIbElPQUVHczEvVjc0SlI3RFNJY2lqNWZ6UU04SFl2U3Q2NDBQcVdPckNE?=
 =?utf-8?B?R2ZjY3R2NUovcWtLRnUyZTRGRWlCMHhrWlZwdk40WVl4UWFYcTRISks2cktS?=
 =?utf-8?B?N09QSEwxcStaOWdpNzNCbHlNaEFwRVVJNTJPYi9MNnI0ekh3QWV1ZDc3czE5?=
 =?utf-8?B?ZzdObVJzd0N1TjZtRndtTVU4UzJxL2FlVzU3YTdzUThQSlFxR1l1a3kwcXh4?=
 =?utf-8?B?aUh3VWsrRHlNdFlSTmxjc0Q4ek9QYmduQnVjOFhJZGp3Wm1RUGt4YTZwL1BH?=
 =?utf-8?B?VUNiQ1A4MVdoSmxpWTRYVFVTUWN1MHpPSzJnblB1cFhNV0d6aG4vWTNpSHZ0?=
 =?utf-8?B?enNpN3FuTXNkbE9SeVJyeTI2WDlaNExZT25EUGFxNWhodUw4WE96bjd1T0F3?=
 =?utf-8?B?bzBrZkpveUl0d2E5bzhLNlpLNzJLQjMyRERCVWg1a1JrL1N3Q1lGc2Z2cWlW?=
 =?utf-8?B?bWhxVkgrMTIxWlI2cHp2dndCbTdmUjY4QnN6WUJtZXN0OGVWcVdmZWRQSDRZ?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4170af10-ab58-4056-7123-08dc470bf167
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 05:26:20.3637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FiM7FwrKnvbC5gJehqh0+zMypwDSiodtoL1NWqEmZnZBF+1wBi4QjQKWu9k3xpbBysVC84hDnXC0PKi292UGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5021
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

Hello Ankit,

On 3/14/2024 2:13 PM, Nautiyal, Ankit K wrote:
>
> On 3/10/2024 7:57 PM, Kunal Joshi wrote:
>> modify test to support simultaneously testing multiple bigjoiner
>> output and ignoring fused off pipes.
>
> I think there are a lot of changes in the patch, changing the basic 
> test, removing the 2x test, adding multiple bigjoiner tests in one go.
>
> Imho, this should be broken into smaller patches.
I tried thinking of ways in which this can be divided into smaller patches.
But i think its not feasible since whole test is rewritten again.
>
>>
>> v2: Don't change license (Bhanu)
>>      Print the pipe name (Bhanu)
>>      Remove unwanted commit (Bhanu)
>>      Move combine output logic to igt_fixture (Bhanu)
>>      split revamp and force joiner (Bhanu)
>>
>> v3: Ignored fused pipes (Stan)
>>
>> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>> ---
>>   tests/intel/kms_big_joiner.c | 398 +++++++++++++++++------------------
>>   1 file changed, 195 insertions(+), 203 deletions(-)
>>
>> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
>> index 28678b958..d4b0d1100 100644
>> --- a/tests/intel/kms_big_joiner.c
>> +++ b/tests/intel/kms_big_joiner.c
>> @@ -37,184 +37,227 @@
>>   #include "igt.h"
>>     /**
>> - * SUBTEST: invalid-modeset
>> + * SUBTEST: invalid-modeset-bigjoiner
>
> I think this can be retained, this doesn't seem necessary.
Ok sure ankit.
>
>
>>    * Description: Verify if the modeset on the adjoining pipe is 
>> rejected when
>>    *              the pipe is active with a big joiner modeset
>>    *
>> - * SUBTEST: basic
>> + * SUBTEST: basic-bigjoiner
>
> Same as above, also it already has subtests with single joiner, multi 
> joiner.
>
>
>>    * Description: Verify the basic modeset on big joiner mode on all 
>> pipes
>>    *
>> - * SUBTEST: 2x-modeset
>> - * Description: Verify simultaneous modeset on 2 big joiner outputs
>>    */
>>     IGT_TEST_DESCRIPTION("Test big joiner");
>>   -struct bigjoiner_output {
>> -    uint32_t output_id;
>> -    drmModeModeInfo mode;
>> -};
>> +#define INVALID_TEST_OUTPUT 2
>>     typedef struct {
>>       int drm_fd;
>> -    igt_display_t display;
>> -    struct igt_fb fb;
>> +    int big_joiner_output_count;
>> +    int non_big_joiner_output_count;
>> +    int combined_output_count;
>> +    int output_count;
>>       int n_pipes;
>> -    enum pipe pipe1;
>> -    enum pipe pipe2;
>> -    struct bigjoiner_output output[2];
>> +    int master_pipes;
>> +    uint64_t big_joiner_output[IGT_MAX_PIPES];
>> +    uint64_t non_big_joiner_output[IGT_MAX_PIPES];
>> +    uint64_t combined_output[IGT_MAX_PIPES];
>> +    enum pipe pipe_seq[IGT_MAX_PIPES];
>> +    igt_display_t display;
>>   } data_t;
>>     static int max_dotclock;
>>   -static void test_invalid_modeset(data_t *data)
>> +static void set_all_master_pipes_for_platform(data_t *data)
>>   {
>> -    igt_output_t *output;
>> -    igt_display_t *display = &data->display;
>> -    int ret;
>> -
>> -    igt_info("Bigjoiner test on ");
>> -    for_each_connected_output(display, output){
>> -        enum pipe p = output->pending_pipe;
>> -        drmModeModeInfo *mode;
>> -        igt_pipe_t *pipe;
>> -        igt_plane_t *plane;
>> +    enum pipe pipe;
>>   -        if (p == PIPE_NONE)
>> -            continue;
>> -
>> -        mode = igt_output_get_mode(output);
>> -        igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), 
>> igt_output_name(output));
>> -        kmstest_dump_mode(mode);
>> +    for (pipe = PIPE_A; pipe < IGT_MAX_PIPES; pipe++)
>> +        if (data->display.pipes[pipe].enabled) {
>> +            igt_info("Found master pipe %s\n", 
>> kmstest_pipe_name(pipe));
>> +            data->master_pipes |= BIT(pipe);
>> +        }
>> +}
>>   -        pipe = &display->pipes[p];
>> -        plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> +static igt_output_t *get_output_by_id_or_assert(data_t *data, 
>> uint64_t id)
>> +{
>> +    igt_output_t *output;
>>   -        igt_plane_set_fb(plane, &data->fb);
>> -        igt_fb_set_size(&data->fb, plane, mode->hdisplay, 
>> mode->vdisplay);
>> -        igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>> +    for_each_connected_output(&data->display, output) {
>> +        if (output->id == id)
>> +            return output;
>>       }
>> +    igt_assert_f(false, "Output not found\n");
>> +    return NULL;
>> +}
>>   -    igt_assert(!igt_check_bigjoiner_support(display));
>> -
>> -    /* This commit is expectd to fail as this pipe is being used for 
>> big joiner */
>> -    ret = igt_display_try_commit_atomic(display, 
>> DRM_MODE_ATOMIC_TEST_ONLY |
>> -                        DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> -
>> -    igt_display_reset(&data->display);
>> -    igt_display_commit2(display, COMMIT_ATOMIC);
>> +static enum pipe get_next_master_pipe(data_t *data, unsigned int 
>> available_pipe_mask)
>> +{
>> +    if ((data->master_pipes & available_pipe_mask) == 0)
>> +        return PIPE_NONE;
>>   -    igt_assert_lt(ret, 0);
>> +    return ffs(data->master_pipes & available_pipe_mask) - 1;
>>   }
>>   -static void test_basic_modeset(data_t *data)
>> +static void test_single_joiner(data_t *data, int output_count)
>>   {
>> +    int i, ret;
>> +    enum pipe pipe, master_pipe;
>> +    unsigned int available_pipe_mask = BIT(data->n_pipes) - 1;
>> +    unsigned int attempt_mask;
>> +    igt_output_t *output;
>> +    igt_plane_t *primary;
>> +    uint64_t *outputs;
>> +    igt_fb_t fb;
>>       drmModeModeInfo *mode;
>> -    igt_output_t *output, *bigjoiner_output = NULL;
>> -    igt_display_t *display = &data->display;
>> -    igt_pipe_t *pipe;
>> -    igt_plane_t *plane;
>>   -    igt_display_reset(display);
>> +    outputs = data->big_joiner_output;
>>   -    for_each_connected_output(display, output) {
>> -        if (data->output[0].output_id == output->id) {
>> -            bigjoiner_output = output;
>> -            break;
>> +    for (i = 0; i < output_count; i++) {
>> +        output = get_output_by_id_or_assert(data, outputs[i]);
>> +        for (pipe = 0; pipe < data->n_pipes-1; pipe++) {
>> +            igt_display_reset(&data->display);
>> +            attempt_mask = BIT(pipe);
>> +
>> +            master_pipe = get_next_master_pipe(data, 
>> available_pipe_mask & attempt_mask);
>> +            if (master_pipe == PIPE_NONE)
>> +                continue;
>> +            igt_info("Using pipe %s as master and %s slave for 
>> %s\n", kmstest_pipe_name(pipe), kmstest_pipe_name(pipe + 1), 
>> output->name);
>
> In case a pipe is fused off we are ignoring it for master pipe, but 
> since we cannot have it as slave also, we need to ignore pipe-1 also 
> as master.
>
> I think similar thing is mentioned by Bhanu too in last version.
>
> So we need to change set_all_master_pipes_for_platform accordingly.
>
Yeah right, will address in next revision.
Thanks :)
>
>> +            igt_output_set_pipe(output, pipe);
>> +            mode = igt_output_get_mode(output);
>> +            primary = igt_output_get_plane_type(output, 
>> DRM_PLANE_TYPE_PRIMARY);
>> +            igt_create_pattern_fb(data->drm_fd, mode->hdisplay, 
>> mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +                                  DRM_FORMAT_MOD_LINEAR, &fb);
>> +            igt_plane_set_fb(primary, &fb);
>> +            ret = igt_display_try_commit2(&data->display, 
>> COMMIT_ATOMIC);
>> +            igt_assert_f(ret == 0, "Commit should have passed\n");
>
> Do we need try commit here? We can directly use 
> igt_display_commit_atomic.
>
> Same in other places.
I can change to commit from try_commit.
>
>
>>           }
>>       }
>> +}
>>   -    igt_output_set_pipe(bigjoiner_output, data->pipe1);
>> +static void test_multi_joiner(data_t *data, int output_count)
>> +{
>> +    int i, ret;
>> +    unsigned int available_pipe_mask;
>> +    enum pipe pipe, master_pipe;
>> +    uint64_t *outputs;
>> +    igt_output_t *output;
>> +    igt_plane_t *primary[output_count];
>> +    igt_fb_t fb[output_count];
>> +    drmModeModeInfo *mode;
>>   -    mode = &data->output[0].mode;
>> -    igt_output_override_mode(bigjoiner_output, mode);
>> +    available_pipe_mask = BIT(data->n_pipes) - 1;
>> +    outputs = data->big_joiner_output;
>>   -    pipe = &display->pipes[data->pipe1];
>> -    plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> +    igt_display_reset(&data->display);
>> +    for (i = 0; i < output_count; i++) {
>> +        output = get_output_by_id_or_assert(data, outputs[i]);
>> +        for (pipe = 0; pipe < data->n_pipes; pipe++) {
>> +            unsigned int attempt_mask = BIT(pipe);
>>   -    igt_plane_set_fb(plane, &data->fb);
>> -    igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>> -    igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>> +            master_pipe = get_next_master_pipe(data, 
>> available_pipe_mask & attempt_mask);
>> +            if (master_pipe == PIPE_NONE)
>> +                continue;
>>   -    igt_display_commit2(display, COMMIT_ATOMIC);
>> +            igt_info("Using pipe %s as master %s slave for %s\n", 
>> kmstest_pipe_name(pipe), kmstest_pipe_name(pipe + 1), output->name);
>> +            igt_output_set_pipe(output, pipe);
>> +            mode = igt_output_get_mode(output);
>> +            primary[i] = igt_output_get_plane_type(output, 
>> DRM_PLANE_TYPE_PRIMARY);
>> +            igt_create_pattern_fb(data->drm_fd, mode->hdisplay, 
>> mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +                                  DRM_FORMAT_MOD_LINEAR, &fb[i]);
>> +            igt_plane_set_fb(primary[i], &fb[i]);
>>   -    igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
>> -    igt_plane_set_fb(plane, NULL);
>> -    igt_display_commit2(display, COMMIT_ATOMIC);
>> +            available_pipe_mask &= ~BIT(master_pipe);
>> +            available_pipe_mask &= ~BIT(master_pipe + 1);
>> +            break;
>> +        }
>> +    }
>> +    ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>> +    igt_assert_f(ret == 0, "Commit should have passed\n");
>>   }
>>   -static void test_dual_display(data_t *data)
>> +static void test_invalid_modeset_two_joiner(data_t *data,
>> +                        bool combined)
>>   {
>> +    int i, j, ret;
>> +    uint64_t *outputs;
>> +    igt_output_t *output;
>> +    igt_plane_t *primary[INVALID_TEST_OUTPUT];
>> +    igt_fb_t fb[INVALID_TEST_OUTPUT];
>>       drmModeModeInfo *mode;
>> -    igt_output_t *output, *bigjoiner_output[2];
>> -    igt_display_t *display = &data->display;
>> -    igt_pipe_t *pipe;
>> -    igt_plane_t *plane1, *plane2;
>> -    int count = 0;
>> -
>> -    igt_display_reset(display);
>> -
>> -    for_each_connected_output(display, output) {
>> -        if (data->output[count].output_id == output->id) {
>> -            bigjoiner_output[count] = output;
>> -            count++;
>> -        }
>>   -        if (count > 1)
>> -            break;
>> +    outputs = combined ? data->combined_output : 
>> data->big_joiner_output;
>> +
>> +    for (i = 0; i < data->n_pipes-1; i++) {
>> +        igt_display_reset(&data->display);
>> +        for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
>> +            output = get_output_by_id_or_assert(data, outputs[j]);
>> +            igt_assert(output);
>> +            igt_output_set_pipe(output, data->pipe_seq[i + j]);
>> +            mode = igt_output_get_mode(output);
>> +            igt_info(" Assigning pipe %s to %s with mode %dx%d@%d%s",
>> +                 kmstest_pipe_name(data->pipe_seq[i + j]),
>> +                 igt_output_name(output), mode->hdisplay,
>> +                 mode->vdisplay, mode->vrefresh,
>> +                 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
>> +            primary[j] = igt_output_get_plane_type(output, 
>> DRM_PLANE_TYPE_PRIMARY);
>> +            igt_create_pattern_fb(data->drm_fd, mode->hdisplay, 
>> mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +                                  DRM_FORMAT_MOD_LINEAR, &fb[j]);
>> +            igt_plane_set_fb(primary[j], &fb[j]);
>> +        }
>> +        ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>> +        igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>>       }
>> +}
>>   -    igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
>> -    igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
>> -
>> -    /* Set up first big joiner output on Pipe A*/
>> -    mode = &data->output[0].mode;
>> -    igt_output_override_mode(bigjoiner_output[0], mode);
>> -
>> -    pipe = &display->pipes[data->pipe1];
>> -    plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> -
>> -    igt_plane_set_fb(plane1, &data->fb);
>> -    igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
>> -    igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
>> -
>> -    /* Set up second big joiner output on Pipe C*/
>> -    mode = &data->output[1].mode;
>> -    igt_output_override_mode(bigjoiner_output[1], mode);
>> -
>> -    pipe = &display->pipes[data->pipe2];
>> -    plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> -
>> -    igt_plane_set_fb(plane2, &data->fb);
>> -    igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
>> -    igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
>> +static void tets_big_joiner_on_last_pipe(data_t *data)
>
> Typo: test
>
>
>> +{
>> +    int i, len, ret;
>> +    uint64_t *outputs;
>> +    igt_output_t *output;
>> +    igt_plane_t *primary;
>> +    igt_fb_t fb;
>> +    drmModeModeInfo *mode;
>>   -    igt_display_commit2(display, COMMIT_ATOMIC);
>> +    len = data->big_joiner_output_count;
>> +    outputs = data->big_joiner_output;
>>   -    /* Clean up */
>> -    igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
>> -    igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
>> -    igt_plane_set_fb(plane1, NULL);
>> -    igt_plane_set_fb(plane2, NULL);
>> -    igt_display_commit2(display, COMMIT_ATOMIC);
>> +    for (i = 0; i < len; i++) {
>> +        igt_display_reset(&data->display);
>> +        output = get_output_by_id_or_assert(data, outputs[i]);
>> +        igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
>> +        mode = igt_output_get_mode(output);
>> +        igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",
>> + kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
>> +                 igt_output_name(output), mode->hdisplay,
>> +                 mode->vdisplay, mode->vrefresh);
>> +        primary = igt_output_get_plane_type(output, 
>> DRM_PLANE_TYPE_PRIMARY);
>> +        igt_create_pattern_fb(data->drm_fd, mode->hdisplay, 
>> mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +                              DRM_FORMAT_MOD_LINEAR, &fb);
>> +        igt_plane_set_fb(primary, &fb);
>> +        ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>> +        igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
>> +    }
>>   }
>>   +
>>   igt_main
>>   {
>> -    data_t data;
>> +    int i, j;
>>       igt_output_t *output;
>> -    drmModeModeInfo mode;
>> -    int valid_output = 0, i, count = 0, j = 0;
>> -    uint16_t width = 0, height = 0;
>> -    enum pipe pipe_seq[IGT_MAX_PIPES];
>> +    data_t data;
>>         igt_fixture {
>> +        data.big_joiner_output_count = 0;
>> +        data.non_big_joiner_output_count = 0;
>> +        data.combined_output_count = 0;
>> +        data.output_count = 0;
>> +        j = 0;
>> +
>>           data.drm_fd = drm_open_driver_master(DRIVER_INTEL | 
>> DRIVER_XE);
>>           kmstest_set_vt_graphics_mode();
>> -
>>           igt_display_require(&data.display, data.drm_fd);
>> +        set_all_master_pipes_for_platform(&data);
>>           igt_require(data.display.is_atomic);
>> -
>>           max_dotclock = igt_get_max_dotclock(data.drm_fd);
>>             for_each_connected_output(&data.display, output) {
>> @@ -228,105 +271,54 @@ igt_main
>>               found = bigjoiner_mode_found(data.drm_fd, connector, 
>> max_dotclock);
>>                 if (found) {
>> -                data.output[count].output_id = output->id;
>> -                memcpy(&data.output[count].mode, &mode, 
>> sizeof(drmModeModeInfo));
>> -                count++;
>> -
>> -                width = max(width, mode.hdisplay);
>> -                height = max(height, mode.vdisplay);
>> + data.big_joiner_output[data.big_joiner_output_count++] = 
>> output->config.connector->connector_id;
>> +                igt_output_override_mode(output, &connector->modes[0]);
>> +            } else {
>> + data.non_big_joiner_output[data.non_big_joiner_output_count++] = 
>> output->config.connector->connector_id;
>>               }
>> -            valid_output++;
>> +            data.output_count++;
>> +        }
>> +        if (data.big_joiner_output_count == 1 && 
>> data.non_big_joiner_output_count >= 1) {
>> +            data.combined_output[data.combined_output_count++] = 
>> data.big_joiner_output[0];
>> +            data.combined_output[data.combined_output_count++] = 
>> data.non_big_joiner_output[0];
>>           }
>> -
>>           data.n_pipes = 0;
>>           for_each_pipe(&data.display, i) {
>>               data.n_pipes++;
>> -            pipe_seq[j] = i;
>> +            data.pipe_seq[j] = i;
>>               j++;
>>           }
>> -
>> -        igt_require_f(count > 0, "No output with 5k+ mode (or) clock 
>> > max-dot-clock found\n");
>> -
>> -        igt_create_pattern_fb(data.drm_fd, width, height, 
>> DRM_FORMAT_XRGB8888,
>> -                      DRM_FORMAT_MOD_LINEAR, &data.fb);
>>       }
>>         igt_describe("Verify the basic modeset on big joiner mode on 
>> all pipes");
>> -    igt_subtest_with_dynamic("basic") {
>> -        for (i = 0; i < data.n_pipes - 1; i++) {
>> -            data.pipe1 = pipe_seq[i];
>> -            igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
>> -                test_basic_modeset(&data);
>> -        }
>> -    }
>> +    igt_subtest_with_dynamic("basic-bigjoiner") {
>> +            igt_require_f(data.big_joiner_output_count > 0,
>> +                      "No bigjoiner output found\n");
>> +            igt_require_f(data.n_pipes > 1,
>> +                      "Minimum 2 pipes required\n");
>> +            igt_dynamic_f("single-joiner")
>> +                test_single_joiner(&data, 
>> data.big_joiner_output_count);
>> +            if (data.big_joiner_output_count > 1)
>> +                igt_dynamic_f("multi-joiner")
>> +                    test_multi_joiner(&data, 
>> data.big_joiner_output_count);
>>   -    igt_describe("Verify if the modeset on the adjoining pipe is 
>> rejected "
>> -             "when the pipe is active with a big joiner modeset");
>> -    igt_subtest_with_dynamic("invalid-modeset") {
>> -        data.pipe1 = pipe_seq[j - 1];
>> -
>> -        igt_display_reset(&data.display);
>> -        for_each_connected_output(&data.display, output) {
>> -            if (data.output[0].output_id != output->id)
>> -                continue;
>> -
>> -            mode = data.output[0].mode;
>> -            igt_output_set_pipe(output, data.pipe1);
>> -            igt_output_override_mode(output, &mode);
>> -
>> -            igt_dynamic_f("pipe-%s-%s",
>> -                      kmstest_pipe_name(data.pipe1),
>> -                      igt_output_name(output))
>> -                test_invalid_modeset(&data);
>> -        }
>> -
>> -        if(valid_output > 1) {
>> -            for (i = 0; i < data.n_pipes - 1; i++) {
>> -                igt_output_t *first_output = NULL, *second_output = 
>> NULL;
>> -
>> -                data.pipe1 = pipe_seq[i];
>> -                data.pipe2 = pipe_seq[i + 1];
>> -
>> -                igt_display_reset(&data.display);
>> -                for_each_connected_output(&data.display, output) {
>> -                    if (data.output[0].output_id == output->id) {
>> -                        first_output = output;
>> -                        mode = data.output[0].mode;
>> -
>> -                        igt_output_set_pipe(output, data.pipe1);
>> -                        igt_output_override_mode(output, &mode);
>> -                    } else if (second_output == NULL) {
>> -                        second_output = output;
>> -                        igt_output_set_pipe(output, data.pipe2);
>> -
>> -                        break;
>> -                    }
>> -                }
>> -
>> -                igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
>> -                          kmstest_pipe_name(data.pipe1),
>> -                          igt_output_name(first_output),
>> -                          kmstest_pipe_name(data.pipe2),
>> -                          igt_output_name(second_output))
>> -                    test_invalid_modeset(&data);
>> -            }
>> -        }
>>       }
>>   -    igt_describe("Verify simultaneous modeset on 2 big joiner 
>> outputs");
>> -    igt_subtest_with_dynamic("2x-modeset") {
>> -        igt_require_f(count > 1, "2 outputs with big joiner modes 
>> are required\n");
>> -        igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are 
>> required\n");
>> -        for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
>> -            data.pipe1 = pipe_seq[i];
>> -            data.pipe2 = pipe_seq[i + 2];
>> -            igt_dynamic_f("pipe-%s-%s", 
>> kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
>> -                test_dual_display(&data);
>> -        }
>> +    igt_subtest_with_dynamic("invalid-modeset-bigjoiner") {
>> +        igt_require_f(data.big_joiner_output_count > 0, "Non big 
>> joiner output not found\n");
>
> I think we just need to check if there are 2 outputs or not.
Ankit there are two dynamic tests inside invalid-modeset-bigjoiner
last-pipe     (Require 1 output)
two-joiner  (Require 2 output, (either 2 bigjoiner or 1 bigjoiner and 1 
non bigjoiner )
>
>
> Regards,
>
> Ankit
>
>> +        igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are 
>> required\n");
>> +        if (data.big_joiner_output_count >= 1)
>> +            igt_dynamic_f("big_joiner_on_last_pipe")
>> +                tets_big_joiner_on_last_pipe(&data);
>> +        if (data.big_joiner_output_count > 1)
>> +            igt_dynamic_f("invalid_combinations")
>> +                test_invalid_modeset_two_joiner(&data, false);
>> +        if (data.combined_output_count)
>> +            igt_dynamic_f("combined_output")
>> +                test_invalid_modeset_two_joiner(&data, true);
>>       }
>>         igt_fixture {
>> -        igt_remove_fb(data.drm_fd, &data.fb);
>>           igt_display_fini(&data.display);
>>           drm_close_driver(data.drm_fd);
>>       }
Thanks and Regards
Kunal Joshi
