Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE851C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 18:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450AF10E34C;
	Wed, 19 Feb 2025 18:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FHQVLkNP";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E196410E34C
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 18:07:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Odv2HD6Kiy9pTs060A6VfbZtpLyJtEzvuTRaHwefxwokK+scnwwJiaVDtp7ZPvkFXcWCpHxJJ6kpPho9lUWzsE/8gibY0eyYPioWwDZLaVS+YMIyJ7SchK7P5ZlL6ylbiCzfBIyvFFsrtviK1S1MroRlvMstZ3+o19fjXCpGhn9LtxDyPEibYUVkInSZKjFUAKdS2YITKOccvoKVJ9uVKoBj9y1U0Bqa8Ts/g5m6T09fLFktucnheICMPSoXKFVokhFkRLy34GraYMkQdycxWNscS33A1UkYW4UM4Cu+PcQV68zwu7QZzsB+3jS7Qcec3fuzpE0QHEpAmRWmW+zfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/4Lp/7ZJPoFoUes9W8Nd9HpxUZbS5hf1NFl6gr5OYY=;
 b=Efqt5SIQaJHv6PlAfS04fhhT+gMOi3+p5/xp8C91UWdp08T+5XljBDEyQwdNF4jN8j04mxsfp32kS7kep9hL+k/Q677aAgflBfN7r3KiZeoQiYy1avSaYYbSTrZqnfNkXCsAtEebTfWoOMz7kkWTUMeNIzEbY9gHg7AoxVsUFf+npEoX+apkLrEU+ZOYpegqRsdNfnbaQVduxzdXdyFzjoAcfqf2+vUJZC0DvjxLFf5X9E/iMm5EekuyQhvjFgJvp5WIjw8LpEy4duv/PXQaO8q2bLjxL2+PU7X5VKVJkikp93uzTKuTk/oYW1nV5GO1TXg598RD2Y/L+smsvOeU9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/4Lp/7ZJPoFoUes9W8Nd9HpxUZbS5hf1NFl6gr5OYY=;
 b=FHQVLkNPXaNCtDmQyCj2np9w547+KjFRCri7JuwPVOTT3KeneE32tn9hlKsYKBErdl9vhCBOTV+5dPYJmNH3b4kSNzsZ92V1Wz9GxSdVoL48nIhZhwij6VAE1GwdsYMMtp9dxCPeSFYOO9FXj/0uJQrCun4xVG6qqyumvO88wFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by IA0PR12MB8714.namprd12.prod.outlook.com (2603:10b6:208:488::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 18:07:04 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 18:07:02 +0000
Message-ID: <5b88ea25-c9a6-4025-8f9b-34e1b213e258@amd.com>
Date: Wed, 19 Feb 2025 13:06:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/kms_async_flips: Create subtest for overlay
 planes
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Jeevan B <jeevan.b@intel.com>, kernel-dev@igalia.com,
 "Hung, Alex" <Alex.Hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
References: <20241216202427.76168-1-andrealmeid@igalia.com>
 <20250219103703.2hbadorsyh5ezd3e@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250219103703.2hbadorsyh5ezd3e@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0322.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::24) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|IA0PR12MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: ed791f78-46a5-4043-4657-08dd5110359e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S25JVnhIbkpjRWtKU2g4cXhORXpqRTA1c2ZsaFEyR2FIamhrMEgvNVFnV0Fh?=
 =?utf-8?B?ZzliK01oeVhoNkZxNXd4WnBCcGZUSllGa2tEbUpzemVpNUgyWEZtNUZ1a0hu?=
 =?utf-8?B?THE2TXJQZkxJRm90RGZRRktjNEZZNmJYQ1dYMnYzam50NGVyK3N6TFF1Y1BL?=
 =?utf-8?B?OUwxcDdqZk02SllsTUlhVEt2cTh6UmFaZjJxakFhVzc3eFZmNmNSczM3Vjgw?=
 =?utf-8?B?aFpVUjlTL2UxeEFiQ2c5MjB2RS9RVHpWZ0YveXIyZDZBbTYrMXhPSVVMdWVu?=
 =?utf-8?B?R00ycktDdm42VkJhOWVKZFNqWkVKd2w0emJ5SDV0S0YvQWttelFzSVBlYmJD?=
 =?utf-8?B?K3JNK3hlNVd0Tyt0MGR3REI1K2M3M1ZGaTlRc1crTm16RXMwSWxHYWtwS2p2?=
 =?utf-8?B?ZUZvcUF3OHRaOWhwakcyRTkzU1IyZkgxUEZIclk4TVN5VUlLSjlkQ09TOEd0?=
 =?utf-8?B?eDlveXBna3VpeFY2TEw4OUhvYi94M0xZQ2E4RVo2OFpVZ0RCUmVLcmJWekpN?=
 =?utf-8?B?dStaY0YwSkx4dDhCZVJOWkVDNjZwWUFyd1RyanE3azVmQktvRVk2U3M0OHNw?=
 =?utf-8?B?bXBGZk8wb3Y2THh2UFh2VnEwcklTa3NSMnNpM05wT0czSXlqT1YvdlhpMXpi?=
 =?utf-8?B?YkRXQ05tOC9YN01zVEFJSURENWxaNm9YSDNrNnFYZlRVbmEyOHFuYjdUZ3hL?=
 =?utf-8?B?djdYSzMwbExaUWdyT2RXYklLUXNCWEZYbFlFeVB2S052LzNILzNRTkJyd2tr?=
 =?utf-8?B?c0RTeFkzbkp1WDNwREhuZUZPT2ViZ1JHdUd6UnJIc25SNk1NSDhqSFV5MHVx?=
 =?utf-8?B?ZnA1TFVkU1F3ZzQwN1daZHh5cXlyNldNMytiNXg3Zk5hWFMrVXhranI4a0Jk?=
 =?utf-8?B?cnhsTFhQa1NWQWczTzQvbWNzd254akIxbHcxNkR2cnh1b2QzYXBjOHNhNTB5?=
 =?utf-8?B?bk1ycUIzVXFuR3RnWlpWSUQyTXN1cEF1cHFFS2lobFJrZmFiZm0zcDZDMHln?=
 =?utf-8?B?UnFqc1gwL3RhY1hRa0xGc0FwYjZTWWE4UGVFTHZYSmxxY0R4QmVFWWpISis0?=
 =?utf-8?B?TkNyNVhIRnVCQjFXYXIrNHZFU0xFRlduS1JlV3pSTytkYUFFTEJkV3R6TFZr?=
 =?utf-8?B?ZS91aHpsd3ZqQTlwYzBzc2VSSExaVXk1RFpVKzRMTkhuUGd2L1lBa3BGTTBX?=
 =?utf-8?B?Uk1zbDA3d09TS0NnUHZiMEFvUW10bXFzeWtmaGdkYjE0ODgyVDNJTnpvb1lm?=
 =?utf-8?B?MjFHK0tUOG5DVmg0UWIrREdLcEF3bWEvN05kcktrWkF0b2xkTmxCSGNuNUhk?=
 =?utf-8?B?UFlzR29SQStISkRaWVZGOEdxNW91bCtjT2FyOFJiMGhES3paVzBsSzNoR1ZL?=
 =?utf-8?B?V3UwU2c4Q0JOYWJTY3FTOS9DeklTL2R2SStqWGRPaFJVNGM4K2M5aHI5UlJF?=
 =?utf-8?B?SDk1RjlGMTdwUlh2cWt4N3c5MzJCVDJTbWtjblV2NzIyNUZUdEhkYWovOGxv?=
 =?utf-8?B?dk02OXdxQUlCclkxWDhrK1dlYWVJKzZFNlFmMW1hcWZTQVZWb1dBRFNVSVBx?=
 =?utf-8?B?Z0JmU2FtUzF1L2pOWHJkUzFzMW9XT3hKZEIzeGo1Vk1UQzNYZXJzRVdKNkJ4?=
 =?utf-8?B?OGpEMThuZFExNVhVaCs5bXVlTXZpekF0UnFVb1E5ckp5ZncvU2JGaklqOGNl?=
 =?utf-8?B?cEN0L0lDcnpxcmlIcmtsWU5JZE8yWDBtTnREL1FkSTJoTEx2RG5ONXZSSHJI?=
 =?utf-8?B?ckcwTGNCKzVub2VGRjQrV3JlMmkrMGhwQ1VIV2F3MkZNdFoyV0crMTcxeFlQ?=
 =?utf-8?B?NXZVVk10MTBQRm5DbG4ydlJWT25wendTbUFTUGFpbXhoanhYQjBDb0VWWDgy?=
 =?utf-8?Q?WLTGbyP0G00BG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE1Jb2NldHR4Y3lIRFJRTDJJTWdteWFOUXRGNk5EQkR1eXlYa21JQnR2MDZ2?=
 =?utf-8?B?OUpiOWRmYUhzbkZ3Zmt3QUF5eUdQMCtSS2JyMmpXUWFIS0xEbHpRWndjTVdp?=
 =?utf-8?B?aXpEbFpuY1diWnVsL0VDMXMycW1jL1E3MEprTS9UbHd0c2RQZHp3dlh3WmJW?=
 =?utf-8?B?OCtGU1FhS2RDU09pSDRMTHFiTWFqUnVKTmU0YlJsVkg2eU9IRkxXWWRqc05k?=
 =?utf-8?B?UWpsNkJqajArWTFkVk1NNjJBN05TU1R4eGxaREtFVmVrQVd5cE51TmhZblg3?=
 =?utf-8?B?Q2NIUHZqRUV2dU11OG9LaVNEYi9MVkVzWG43c0hJbTMxakF3WDF0MmQyR2Y1?=
 =?utf-8?B?OHFuQ2diZUdObU5hWG9lL0JSN1lCVGtyaTV0U01pQ1puS2x6VllpTERHcGQz?=
 =?utf-8?B?SlRkbWxTSWpmQzJhUitFQVU0TU9KZFZSYmVqZUtLcVBFMjVSdWRGZTVFS25D?=
 =?utf-8?B?MUtCTVJMWVBjaCt4bEdsdFhRekt6SUcvWm5abVhMYlNHaHFWRjdkR1ZSL1hQ?=
 =?utf-8?B?NEVSNWd2OGQ4c0lWNVV2WWlHTEQ1WU9kS1lIREJXd04vUlRDbnJnRWdNeklm?=
 =?utf-8?B?QW8zTTZONWZpeXdiR0liNWJ1UituV1NKbEpSdXdXNzJDVENaSTBRZWpYaFVN?=
 =?utf-8?B?WmVpbFI1dGcyanVDS1l2M09UWHVVaEpYM2JHQmo3VVd1ek90TmhOSktwb0dY?=
 =?utf-8?B?aG55ayt2ZHJRUUYwUzNaY2RUcmllbXhKdlVFS0VreElIWUxTajlybTJmTE9x?=
 =?utf-8?B?ZFIvZHBPbjQ0VWM4UVNqQURtRkNLV1pMdFBtRXdZaDZ4VXZWK3BveEJjYTlJ?=
 =?utf-8?B?OFkyZENiNmgxeUFEaDFueHNCTXR5eWtUOUVybitPWEsxT2lMVldSdDFLb0p4?=
 =?utf-8?B?WCtLVHM3dmV2Y3pLQlQ1QUpaUEVmT2J5bDhYbzBQZkNrN0ExNlJWaytoaHFz?=
 =?utf-8?B?K1g2eXhwdUZjNWNDd3RVOFkvWGc1RnBhNmhhOFJGUXZhWldDcHpHWkJJckdy?=
 =?utf-8?B?UU9yMW9YUVBUU0xZVjVmQTJTdUdxN0JSeGdmV3QveTBoZlhFTk0rNlJ6QStm?=
 =?utf-8?B?ZnhSdEs3ZWVpUEhhS29ZTEduZ3pKa1ZOSkpnK0QvOVJJelYvUThOTll1TDJa?=
 =?utf-8?B?VWpGam96OURHREkyTDV0a0JYTXdsNzJhbmFrTENTNVlNL09vMDZPTGh6SGtW?=
 =?utf-8?B?dVRUTVREeDlkRFJ2NXVzTmoweWpoRnBDVlo3YWlJTDh2NUxyNk5HZHVTTHJL?=
 =?utf-8?B?OEVUVkFTM0djRFA5OEpKTlBMMmhkeXpnZmM4eTJHQi9WRmN0WXY1VHdnRXhl?=
 =?utf-8?B?NDduL2sxMFhOVnRTNUM4dWg3Q1RQU3hoMU5DMnkrRk0wakNqaDA5Tm9UVHFz?=
 =?utf-8?B?Zko2YkZ5L1VuNXFpcTFMeDdJYncveXRscWRtL0hCdWpra0Y1ZmJCYXhNUmJX?=
 =?utf-8?B?bXo5dEs4YnA4dEd1TWNZODF4cUdNNTJKOXBZMldCOERXQ3NmYURST0hCMnpC?=
 =?utf-8?B?Sk9MNEJ1cjdjdWJyV2VuWUlobXNNb2RoWm5QRlpjS0hoV0pjcWFtYzQzSWpL?=
 =?utf-8?B?N0NPOHZvQmVUM1pXOTFRdU9IaGl4Ylg5bmFxT0puYUcrWmZrU2xrOHFoeTAy?=
 =?utf-8?B?am1KeDVxSDJoUXBPUXU2QS9GRnhHbjAvM3p2NmdvdWJ3YkNtdm5KaVpsQzIv?=
 =?utf-8?B?NHMvblREb1NBdGRNU25CM1NlRk9XZzA1a1pZMVRsZ3NZbDdCc0pIckJVdlRv?=
 =?utf-8?B?WXduQXhKMUtoKzlJb2RrNG56M0ZQSFVsbkMrazZaLzJ3SjdCZ3pmbDliSjAx?=
 =?utf-8?B?UHdUbWd6TEpWdHNlbWttQVg4M3RpVThNZXdxbWJIWHl4eG9wby83MnhpeDJr?=
 =?utf-8?B?eldqR0dia1k1aUJGa214NUpBWHhiNWxGcWxHUVpoSEF0ZUo3QmpzaGNoTmFT?=
 =?utf-8?B?Uk1VK2Z6czNlbHBxL3FyQ3JtUlZXeTlWa1dYb0ZyUTM3RzNscFRFZzFwWGdt?=
 =?utf-8?B?SGdjaTMvSEZSRHlUOFpGQVRMWVpsdGJyaXlUT051eVJBRFhtMHA5VzlXeXV2?=
 =?utf-8?B?Um8rNmUrRThzWFIrRXdTaFBtaUxHTTJENlk1TGZKUWdJeFRRNHRlQkxZSTJ6?=
 =?utf-8?Q?Yjf27H+UtOe7r5SPsgrkQzthZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed791f78-46a5-4043-4657-08dd5110359e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 18:07:02.0035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlwSp4bj1/2EMMQnqpKIsXuVGWKouGVVEVHCVJNvX4Wln6MV+Mc+CuFdzYjUPNAXp6VKGJWviY9AthfNzFBv2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8714
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

Added Harry and Alex

Hi Kamll

Thanks for the letting us know.

On 2025-02-19 05:37, Kamil Konieczny wrote:
> Hi André,
> On 2024-12-16 at 17:24:27 -0300, André Almeida wrote:
>> amdgpu can perform async flips in overlay planes as well, so create a
>> test for that.
>>
> Vitaly could you find someone from AMD who could help with
> review and testing? Thanks!

Alex,

Can you help with DAL CI to run this patch ?
Thanks in advance

Vitaly

>
> Please add to Cc Vitaly from AMD:
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Also add Jeevan here:
> Cc: Jeevan B <jeevan.b@intel.com>
>
> Regards,
> Kamil
>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> v2: Add test description for GitLab compilation
>> ---
>>  tests/kms_async_flips.c | 45 +++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 41 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index 4a72be7b5..dd0907d50 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -89,6 +89,9 @@
>>   *
>>   * SUBTEST: async-flip-suspend-resume
>>   * Description: Verify the async flip functionality with suspend and resume cycle
>> + *
>> + * SUBTEST: overlay-atomic
>> + * Description: Verify overlay planes with async flips in atomic API
>>   */
>>  
>>  #define CURSOR_POS 128
>> @@ -109,12 +112,14 @@ typedef struct {
>>  	uint32_t crtc_id;
>>  	uint32_t refresh_rate;
>>  	struct igt_fb bufs[NUM_FBS];
>> +	struct igt_fb bufs_overlay[NUM_FBS];
>>  	igt_display_t display;
>>  	igt_output_t *output;
>>  	unsigned long flip_timestamp_us;
>>  	double flip_interval;
>>  	uint64_t modifier;
>>  	igt_plane_t *plane;
>> +	igt_plane_t *overlay_plane;
>>  	igt_pipe_crc_t *pipe_crc;
>>  	igt_crc_t ref_crc;
>>  	int flip_count;
>> @@ -126,6 +131,7 @@ typedef struct {
>>  	bool allow_fail;
>>  	struct buf_ops *bops;
>>  	bool atomic_path;
>> +	bool overlay_path;
>>  } data_t;
>>  
>>  static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
>> @@ -226,6 +232,8 @@ static void test_init(data_t *data)
>>  	igt_output_set_pipe(data->output, data->pipe);
>>  
>>  	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>> +	if (data->overlay_path)
>> +		data->overlay_plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_OVERLAY);
>>  }
>>  
>>  static void test_init_fbs(data_t *data)
>> @@ -246,16 +254,27 @@ static void test_init_fbs(data_t *data)
>>  		prev_modifier = data->modifier;
>>  
>>  		if (data->bufs[0].fb_id) {
>> -			for (i = 0; i < NUM_FBS; i++)
>> +			for (i = 0; i < NUM_FBS; i++) {
>>  				igt_remove_fb(data->drm_fd, &data->bufs[i]);
>> +				if (data->overlay_path)
>> +					igt_remove_fb(data->drm_fd, &data->bufs_overlay[i]);
>> +			}
>>  		}
>>  
>> -		for (i = 0; i < NUM_FBS; i++)
>> +		for (i = 0; i < NUM_FBS; i++) {
>>  			make_fb(data, &data->bufs[i], width, height, i);
>> +			if (data->overlay_path)
>> +				make_fb(data, &data->bufs_overlay[i], width, height, i);
>> +		}
>>  	}
>>  
>>  	igt_plane_set_fb(data->plane, &data->bufs[0]);
>>  	igt_plane_set_size(data->plane, width, height);
>> +
>> +	if (data->overlay_path) {
>> +		igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>> +		igt_plane_set_size(data->overlay_plane, width, height);
>> +	}
>>  }
>>  
>>  static bool async_flip_needs_extra_frame(data_t *data)
>> @@ -283,12 +302,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
>>  static int perform_flip(data_t *data, int frame, int flags)
>>  {
>>  	int ret;
>> +	igt_plane_t *plane;
>> +	struct igt_fb *bufs;
>> +
>> +	plane = data->overlay_path ? data->overlay_plane : data->plane;
>> +	bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
>>  
>>  	if (!data->atomic_path) {
>>  		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>> -				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
>> +				     bufs[frame % NUM_FBS].fb_id, flags, data);
>>  	} else {
>> -		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
>> +		igt_plane_set_fb(plane, &data->bufs[frame % NUM_FBS]);
>>  		ret = igt_display_try_commit_atomic(&data->display, flags, data);
>>  	}
>>  
>> @@ -772,6 +796,7 @@ igt_main
>>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>>  			data.alternate_sync_async = false;
>>  			data.atomic_path = false;
>> +			data.overlay_path = false;
>>  			if (is_intel_device(data.drm_fd))
>>  				run_test_with_modifiers(&data, test_async_flip);
>>  			else
>> @@ -783,6 +808,7 @@ igt_main
>>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
>>  			data.alternate_sync_async = false;
>>  			data.atomic_path = true;
>> +			data.overlay_path = false;
>>  			if (is_intel_device(data.drm_fd))
>>  				run_test_with_modifiers(&data, test_async_flip);
>>  			else
>> @@ -793,6 +819,7 @@ igt_main
>>  		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>>  			data.alternate_sync_async = true;
>>  			data.atomic_path = false;
>> +			data.overlay_path = false;
>>  			run_test(&data, test_async_flip);
>>  		}
>>  
>> @@ -800,7 +827,17 @@ igt_main
>>  		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
>>  			data.alternate_sync_async = true;
>>  			data.atomic_path = true;
>> +			data.overlay_path = false;
>> +			run_test(&data, test_async_flip);
>> +		}
>> +
>> +		igt_describe("Verify overlay planes with async flips in atomic API");
>> +		igt_subtest_with_dynamic("overlay-atomic") {
>> +			igt_require(is_amdgpu_device(data.drm_fd));
>> +			data.atomic_path = true;
>> +			data.overlay_path = true;
>>  			run_test(&data, test_async_flip);
>> +			data.overlay_path = false;
>>  		}
>>  
>>  		igt_describe("Verify that the async flip timestamp does not "
>> -- 
>> 2.47.1
>>
