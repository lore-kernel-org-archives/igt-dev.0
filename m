Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2230CD98C7
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 22:54:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7225A10E1DE;
	Wed, 10 Jun 2026 22:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UH6sP65/";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5CD10E5BD
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 22:53:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1VGrx0lqHj7jk2ZUThHq4BPf8cjDG0qGBafvSemY6/A7dCR5MVWtK4xvL96uovcB4cSoYi1zx34rGdnrtOQR1bzC2htjFSVJ839f3244v4gU29Iv2eE/Z7XvM63505qTkZToYypTotaRrRX+o24iKcal4jFuCmYwxmsTJhTzZxDZjZ0hhjW87ZC3WFns3UJyxBuyfSwSFDq9Px4oH0fbWbJs6SKAfol3nbv3JojLNOsSu2Xx7QKBWLjAn7o1jp5AeWtctiNouIrCM+l+TCogj+yjUi6L23zImcj08G+YZohKDl5w46hOVtrGFKRc1fLvs6R0Gsudx3ryGg9cRwIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1RwVCqN1o6hNnH0HPxM8NRcgICHHI51nmi5g4uUhZ8=;
 b=AMWTeveI+hTgoHoTmahhRzf4PnCnXqIQxDd21xYQ2ZFy05/EUcT/UtCvFvke5hL/RrWPPRKT4wWbejsmmEITY2Fss05v/2qNlI2/TUF6e8+auYsK0r7Xbxe30guBFkwtcgcnb27ImBWVhgnTj0rF8VFstCWGnpQxe+9Us9gJZhjD7cm4lrVCi4qODsw35useGMq0aYxd1QWm/c8DKtV5lCaMde68e7ubfqdTy/DUn12QLeJZDm7+FqjaVmF7+J/FxorMMJd8JB0CQRhvN9/w+YpyeIjkSJazpuwKx+iWJ1zHhdGK74aSjQ34rH8TJ+XdXLsMWCTPo4fcCRAz/H4etw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1RwVCqN1o6hNnH0HPxM8NRcgICHHI51nmi5g4uUhZ8=;
 b=UH6sP65/bclfiiH4xgVMXBU+hLFuf9G9mOyCIU6kEZ1BOqSDTaXT3ZMgVB/RulA9tfZqri78SVTD+jmK0C1hwJT1lq8pmHMXbEmvdCTJzgcDiC29IZOd75EZvVdWQ1IeGHHKEr6DyYo7wGKil1JjDi+ubt08Jy3DZm50hFglnKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Wed, 10 Jun
 2026 22:53:27 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 22:53:27 +0000
Message-ID: <4ac947ed-6114-408a-a991-a8c965831b9c@amd.com>
Date: Wed, 10 Jun 2026 16:53:24 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_core: Distinguish dynamic subtest in
 finished messages
To: vitaly prosyak <vprosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org,
 zbigniew.kempczynski@intel.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20260608193807.2616777-1-swati2.sharma@intel.com>
 <20260610152928.yauflzchk2uf7szw@kamilkon-DESK.igk.intel.com>
 <d0e9c77a-c9e4-4987-90b1-6ac6e9ede7f3@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <d0e9c77a-c9e4-4987-90b1-6ac6e9ede7f3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:303:dc::20) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 18fec910-2fe7-4ed3-5e49-08dec7431544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|4143699003|3023799007|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HEuYs1GQMPPrh6wBgYxMH54rLK7QxTuFT6b0QVTUs5I2Flz0bcRrZfd3/03O/xmVI0aOLJS2nfy4pm1kmjIn6WeX7QQlzquPmbd4eXbN+Uikj41TU6pYz2p5d1utfQQdtIJP8HuUxFOucF38TDetiguzuI1fZcdSfN0xYOjdI0lDpqOnB5gmcq6X8Jz5VpwrOwa9202DaELhE60gGf8NxHDo1CaV5mf3jZaHAov5A2jIAiNMu0fyNp3+h6h067eklWZJ5deYhzNGj9kR9KLvIFu+Y57MpgMZcff1kpq8G6kT3hH+g8yYC4RzdZW3tTxLfeNhUvsyovK3LVdz2GRMOMfRGBdacE+02K0/zLRBoYne6FpuxtyxQ1L0w+y0C+KW5oimq8Fr/sxj6xz8uT/V75nESRjepcTNvQPFhyiM6YtTaRWF8tgbACoFwZdy7uH1JAXJUO6albF6o0I3DDleTdTaTo7pIc7K7lEOiUyZiUgfxvCAsecTIM+DGnAWDKljYYvluZgw9LqNuxTLF4r2vhtuzIIoAZ2Xq7NLiMaJI6610slRpsMYdk1404pNjZSvR9KWq7IrNE3VoD9kCIAz4zJg70nh9WQtMh57ToJFYt7qEbRrjcbFe9XUy2dR53L7bJ/6Qi/L11AhtmCuN3jUPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(4143699003)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDFJb0pFVWpHMC9SblU2cERRa3ZSb3JSbS9URXhkMzc2b2VSd3FtaUZlbTJP?=
 =?utf-8?B?STI0T0U0S1pyaHJCOWtidTRHbVZya0EySzczQUxRZCtGejFPbmk5VUxEMmY4?=
 =?utf-8?B?TVBlell1N2JVR0pYeVgwc3k1OVJxU01pd1NLTG1RWG4xUFluaTJYUFVaVzA5?=
 =?utf-8?B?RHJpV3pBOENhbWxmSi9CMGtIelpMaS9BRFFlTVRwMUY5NWdnQUVKMWtGMmlm?=
 =?utf-8?B?RnpMNGZFL1dHSCt4YkQzNlExS0VMb3VOMUhqQ1dnYm45aTBKUEVzTi9ZMHht?=
 =?utf-8?B?VXBJWVRDTlVnTlpGNlpDY2src2NYTDVDTXBWaFl1Vlh1ZFFnWWcvaDBwRjBF?=
 =?utf-8?B?S3VPanZRUVhFZGtsZnlRQlZWZXJtUGRhQWY1N0JhRUNhSUIrTzBNcFNvOFJX?=
 =?utf-8?B?ejJRblZ1eDJxSjF5b0tjSHJGL0czMHBrNy9hNmVMVzRmdnhTZ1ZqdFFNTEtp?=
 =?utf-8?B?MTRLUkJvVzM2emRIVnRjMFBDVWUyNlN3dVNxakgxbUtDOWpPM2JRa3Jsb1o4?=
 =?utf-8?B?a29BRm1iUXpUNitVRmIyakdiYUxjdGJnNnRLK3R3ZmRWU1BqN0dtMVYvOUtD?=
 =?utf-8?B?NDdLR0dYREZMNDdzb2ZTcHp2cEZoVk0wa1JXMitUWDNlYkpNTEw1VFU5ZXlQ?=
 =?utf-8?B?cWZWdWpQS0hrQmMwRHFROG4xTVR5YTcyemlXUVgwd0M2ejFWWE80a016V2N0?=
 =?utf-8?B?VVpwbnZIZUxrZ2N0emkyOGxSYTFMa1pMMlFScEJGcFRwSWs1Q21pMnhoanlF?=
 =?utf-8?B?OFh5THI5Vkp4cTcrK3pGVC84MndndkEzZ1pPMUI4YzMwWFZ2UzRFSjlDS2R0?=
 =?utf-8?B?b0FQbXJ1T2tucjBwV3A4THJ3ZElqbmFBUE1zVWYvektBZE1oblN2ZnJ5ZlQ3?=
 =?utf-8?B?Rll6QW5CdFBzeElOMmJ0Q3d5T3d6ZHBETHRxMThFanNwRU5HckxuVzFtQlFo?=
 =?utf-8?B?a2daOGluZlA5R3U0NUlOVm9yMWY4LzI1NXNnR2tia2xkMXJDVDg1cEN4OTln?=
 =?utf-8?B?Q0tUL05RdnFUQlRlN0FJZjF1OEdWQTFmSkc2WEY2VytEMVVSaUx5OEphUGt3?=
 =?utf-8?B?VDVlaUNORzFpTnlnK3F5eS9BTS9YTEo4bzZ1c3VKczFIK1RXdkpmZ3VRS1I0?=
 =?utf-8?B?R2QvV3hjb091dm5NZmhCTlhoN2RTTFRwdnljZDhBVmVQNlE4dmZMdUpvQUJ4?=
 =?utf-8?B?NWlkOUhWd250UnRFOTZPMlFxalZYUkZMWml0cG9BNWlNcWcvbmV1MWVKZ3lp?=
 =?utf-8?B?cVcweDZHcGkrNGg5RFFzT2p0dHJxbG9qYnJaMjVvSUhJS1luMThCT1FmODZF?=
 =?utf-8?B?b2s0SjBoSm5VVjljNE0rTnQ3bkxEUi9FcSt0ZnQyYVZHQkNwZFYzL3lBMzVP?=
 =?utf-8?B?bWFLZWRWeTQyTnVzd0tZVlZGYkU0ZlN3dUVHMm9Nak9wamZZd2N1UWQ5bUY5?=
 =?utf-8?B?TE41V0tRZndNRjlzZDM5YUtQbEVFQWpROGNyS2lUMlJheWdjbC9PcXBmSi9o?=
 =?utf-8?B?eElvMGg0YWpQNWF0NXloRXRaNzU5dWU0MVozcEE3RnoxOGpFZXN5UDJtOUcy?=
 =?utf-8?B?Um5IL29DYVpqS1cxVW50SmViNHN3R2VIVlEwSk1PMjY1Q0o3WGZZNkUybHA2?=
 =?utf-8?B?WU9aeVF2UU9VaW85NGZxaXNlZFdOc2p5aE9UOEhNYXh5a1N4RzREU0FIY3ZO?=
 =?utf-8?B?TFhEbjQ0dU5YcDgvRmhweUZwbitSWVFOK0FrNjJ3Nm91djlFK3E1ditxN2JT?=
 =?utf-8?B?cmVFUTNzK1RlT2RBemNpZTBjRHB6VXEzc1g4SlNMT21kV29jRUY0ZXJYVkow?=
 =?utf-8?B?UVpjdDg5QVVjUzV1eWROdWxnY29IK2RxUVpSSGJIMVBONVBTQkxSNmozOVcw?=
 =?utf-8?B?bzRlOFBOOVZNNmx2dDFEcVBqaE5QbVpyMmE1MHVzcENiOHBscEJtN3R3RzVk?=
 =?utf-8?B?VTlpcXJ4YnRjS1V1TkZ6U1BWMSs1WloxaGpqNTJ1clIveHZrb2VrMGltNU90?=
 =?utf-8?B?OHBONEo3dDNwcGI3ZlVFL2FSOGVzb2w0K0tQVHVXMFV3V1F3M0ZoMDhjalhq?=
 =?utf-8?B?cHNzZzkwTUhnSW8wdGdXYTBPZ3ZnR0ZaL1UxYVVOSDhybmp1aUM2VmdNbkpD?=
 =?utf-8?B?M2o2WDJCc1NzWXBPSGdBekVWeTJSdldFbENicU5hSEhWY1l5Q1lEWXpzcjdp?=
 =?utf-8?B?SVhsdU9wWWY1TkdBRWhxWHQ2b0ExSEttVUZ5L3R4ZUp4bDhFNWtIZjVYVkd3?=
 =?utf-8?B?NlJac2xDTUp5M3ZMZG5qSzNiWlNGUnFvcGJNaXhOaEYzRWZhWVlwY3ZMZ0p0?=
 =?utf-8?B?blg2QTQxVVlHYThxLzB1dzk4SFZxMFdaTGk2ZkxGMkc2ZU16VzVrZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18fec910-2fe7-4ed3-5e49-08dec7431544
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 22:53:27.0157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPSRayvvHFq+VRoOxlEM3PjYHvA84a2N0DRr9HuFgOxntKsYeeRhd3uUK36UeAyb6ztNuFrkmnXO52D3BLHWMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
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

Look good to me too.

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 6/10/26 09:53, vitaly prosyak wrote:
> Hi Kamil,
> Thanks for adding me to the thread. I don't see any issues for us with 
> these changes, since we do not parse either 'dynamic subtest:' or 
> 'subtest' strings in CI.
> I’ve added Alex to the thread just to be sure, as display tests probably 
> don't use this either.
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Vitaly
> On 2026-06-10 11:29, Kamil Konieczny wrote:
>> Hi Swati,
>> On 2026-06-09 at 01:08:07 +0530, Swati Sharma wrote:
>>> The exit_subtest() function always printed 'finished subtest' in kmsg
>>> and trace output regardless of whether it was a regular subtest or a
>>> dynamic subtest finishing. The 'starting' messages already correctly
>>> distinguish between the two ('starting subtest' vs 'starting dynamic
>>> subtest').
>>>
>>> Fix the 'finished' messages to print 'finished dynamic subtest' for
>>> dynamic subtests, matching the starting message convention. This makes
>>> syslog parsing and test hang detection more accurate.
>> Should you add Closes tag here? See
>> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/198
>> Fix multiple results from one (dynamic) subtest reported
>>
>> +cc Janusz
>> Cc: Janusz Krzysztofik<janusz.krzysztofik@linux.intel.com>
>>
>>> Assisted-by: GitHub Copilot:Claude Opus 4.6
>>> Signed-off-by: Swati Sharma<swati2.sharma@intel.com>
>>> ---
>>>   lib/igt_core.c | 10 ++++++----
>>>   1 file changed, 6 insertions(+), 4 deletions(-)
>> This could potentailly affect other CI pipelines, so
>> +cc Vitaly.
>>
>> Regards,
>> Kamil
>>
>>> diff --git a/lib/igt_core.c b/lib/igt_core.c
>>> index dc3ac5304..a0d9c9d7d 100644
>>> --- a/lib/igt_core.c
>>> +++ b/lib/igt_core.c
>>> @@ -1733,10 +1733,12 @@ __noreturn static void exit_subtest(const char *result)
>>>   				*subtest_name,
>>>   				result,
>>>   				igt_time_elapsed(thentime, &now));
>>> -	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
>>> -		 command_str, *subtest_name, result);
>>> -	igt_trace("%s: finished subtest %s, %s\n",
>>> -		  command_str, *subtest_name, result);
>>> +	igt_kmsg(KMSG_INFO "%s: finished %s %s, %s\n",
>>> +		 command_str, in_dynamic_subtest ? "dynamic subtest" : "subtest",
>>> +		 *subtest_name, result);
>>> +	igt_trace("%s: finished %s %s, %s\n",
>>> +		  command_str, in_dynamic_subtest ? "dynamic subtest" : "subtest",
>>> +		  *subtest_name, result);
>>>   
>>>   	igt_terminate_spins();
>>>   
>>> -- 
>>> 2.25.1
>>>

