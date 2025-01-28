Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B052C0218A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 20:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF3510E335;
	Tue, 28 Jan 2025 20:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mSLgFFq5";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8D710E335
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 20:48:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUhC8N/WJKaJxY/L/Be3I9L5Wy6LDVF7w7J/tH7ZKSzF23evy4geB3OisDRnK4yoQomH3P/bZVjhXbbbdMl+Klgpaihd6EPaAWKyM/vNZtlOHmjt9Pr3UW4/xd9+vsg0pBWmeCoNh+Lfxkmkh4aeuz1SYAgMreywsYOXK9r2OQxJGmGwV5xSf5lcLvYvZvMl55UT2+0apB6y40rfBK4BqPnkncj1bD+nAS6miiXFL7Rq7xP0UhkpcDkV9Hf2YqO7xyK1SdIduxk576RwKmLbLraGkrcb5Gt7nq78nj9UlEp2Nf9Xujx+Tlu4mCkHH9z/GuBVv/IJPn+WGyKoG3NiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RStmYbpDXANXhcROrXdBHLUfmuWPdslTbCqRO+GtBnQ=;
 b=ypSjAwDuzBM4O3T/DUs6+G+r7ODgx9uhTm7p1LLLgUSGZ8R2ZniwC0Oau8noKpLeaNRTimpmA60nl9hMoCNC1JWLuLQYcC90OiTNHqHNKKZLaTRWiI/F8i08qfPbTnLu6FneaL7x2/i8icVo6t7o7lRJsivEc2r5wZZ6UZks+VjQY9l7WuabOlmV4P1yF88loQ8I1EP/JGqqV9VW1YXlLW41iey3Zkl8iiMRYOaZu05ETTNyJqzv1Aibkuy9kIigi0aGu2l5l/1d7NL/IP87CfjThSCvmFnflwmeA659hLjiAzKtpdmOw9L1oiVVGLupPqyWHIc6YoCa3Tu7tw/RzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RStmYbpDXANXhcROrXdBHLUfmuWPdslTbCqRO+GtBnQ=;
 b=mSLgFFq5jbISFHN/bMxLdiHzCoONJDUNe4ZawsWYAJEXOU7qrF3srA42i+DpttKJokSFP9uEYLxGU+PkEccb2d8Xdu/s5v5G6TEaNtzIe8eBeBq0B79ZlBXd7JTIdb684b4bxL3LYRXAvk9wFghdVdyMMoUTzLeJonWFRSg1T/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by LV8PR12MB9405.namprd12.prod.outlook.com (2603:10b6:408:1fa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Tue, 28 Jan
 2025 20:48:26 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 20:48:26 +0000
Message-ID: <bff92674-8da9-4b86-9d34-01b601b802cb@amd.com>
Date: Tue, 28 Jan 2025 15:48:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amd/lib: refactor function is_reset_enable
To: Michael Strawbridge <michael.strawbridge@amd.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
References: <20250128192442.61513-1-vitaly.prosyak@amd.com>
 <49ab2d75-3a6a-4e60-9271-f4049bc1de20@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <49ab2d75-3a6a-4e60-9271-f4049bc1de20@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTBP288CA0007.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::20) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|LV8PR12MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 972752a2-fcbd-4fe5-6e20-08dd3fdd1c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHErTzhKeHFtK1MrRkJlMGlCcjNpZGwxZDlMSzltNU96cWh5ZFZWcGN1OW4z?=
 =?utf-8?B?NWZ2c3BjWW11dFJrRlJCVkhBeVB2cG9rNFcyZXY3eWxibnR2Sm42MkM3ajFw?=
 =?utf-8?B?U0ZNTTZaQ0FPWk1Nd1pTQThEa0tzQVZ6ZUdjM3RISnJtZENXL3JiNFhvR25C?=
 =?utf-8?B?RStodjIyN3pFdWt0bnpDYlhKbWJ5UmVUemlhanFnVGVuaG00K3FleEZ1MlZj?=
 =?utf-8?B?YVBqNFlQMU15S3lrRmRvUDkrRmVWd3VDR09RS0xINE5LVlgzZmR4KzIxUkJs?=
 =?utf-8?B?R3N0MnN4RlhMK0xhWE5hQml4UzQyVDhIRDJub3g2aytFVEJ5ZjNQanBTOThX?=
 =?utf-8?B?TDgyK0EwNXp4QnByanI1TG4yMExYb0E4a3RrQUVrMjVpNmE3R0pyUXBvZlho?=
 =?utf-8?B?UGVTb1l6YWNlb0E3cUNjcUw0MTlScXE5NHliWGlBc2MvZnRJOW5NSDVYM0Qx?=
 =?utf-8?B?MmVPaVlpbDlDS0FyMGtvK1lDREtmMm42SEtMVG1DZENrQ3RuOExqY2d6bmRN?=
 =?utf-8?B?UVdSOEtoK2I1MkEzT2RqTjgxbDdkcVhGUjR5bVlySk9HaUkzZk5PaURuZ3NI?=
 =?utf-8?B?SnpHSGd1UDNPdWVRdXpIMDd0ZlJOTC9UbC8xeUsrYUpBOVY0M0l5L3dOSEQ1?=
 =?utf-8?B?TXJaVlBBS3dxQm1uNHdLaFA2Rm9oeE5scm5YcGVsbXdibXREcklORkh1bWlV?=
 =?utf-8?B?UUpKeFRndjZCUUxwbEZJMjY3UEw4a3FuNWtZMDV1MVpxUGt3eTZhQW9QWXlD?=
 =?utf-8?B?SVVoQW5oZlVBR0Z4bXhhNzdjeWN0bTNUUlNhaUhhWWxWcE5od1JZOEFvSFlC?=
 =?utf-8?B?cERoZTZEZFcxdTBBTjk4TFoxWnFHdlU5d3ByZnNnQWhBcXh1NSt1eWYyTzQ5?=
 =?utf-8?B?Yys5dmVVR3J2RkFCUzJMQUxTVXdsWlJwUVVGYW1vWjFoR0IrTC9VN2ZGOW5I?=
 =?utf-8?B?VEQ1YzNBSEkwT0ZaVGxsbkM1Rk5zRVh1ZnoxTFI5TFBZSXYySnVQaWpsTTd1?=
 =?utf-8?B?VEhtd3IvaEw1ZGtubzF5aTBsalRBWmpjbk5xNHpWUy9wVGo4a1ZaU2pncEM5?=
 =?utf-8?B?TVpOa29tS3NpcEdSa0Z6aTVtR29FVUt2bDRzeGVpQXlWMFRRQmdPakM2ZHVV?=
 =?utf-8?B?czBsNzdlV0xlNmtDaWRLWXErSzI2NHNyYnN4NmNremtqMGVuWU8wTmVtS29B?=
 =?utf-8?B?UGFtQnpTVEpzTE10R29FMGRmTTJaVkY1WWY2OHJNT2pmbmtqR09sdTlsaERI?=
 =?utf-8?B?NS9Zc2pHUUVsdExnZTNaZ21uVFRTTXVDRWVNQ0sycEIwTnJ0WTh0WWZSWkJ5?=
 =?utf-8?B?ZTAyTXVDUmhZSWRmNnoyQkxZOHF3MnVDWXNSako4SGN1ZXVWWGdpUlQwU0Ex?=
 =?utf-8?B?KytpbVRQZ3NOejYwZ01RamdhRExuM0RVaHRYY0xNMStMbmpxRzBJM2RUaDJM?=
 =?utf-8?B?NFAvQXgrTHRvOW9mcDhuN21PNmozeHp6VVh2SlRVZ09rcWVsTWtvaWszakVP?=
 =?utf-8?B?dXpsOGVRVTA5NzRmMHVPWEllNUNGR3hDeHdTQUhlMzUzRS9LYjNhbjdkZUlz?=
 =?utf-8?B?TytER1RNYjZNNW9zSkFlNzZHUS92elQ3N29zNllLdjBWY2FrazA5Nm8zS1hy?=
 =?utf-8?B?ZGRxYlArUE1vYklXL3BacU1WV09CbzRmNnl3d0FVdU1pRDZKOGIrdzg4L054?=
 =?utf-8?B?Y2J3d05DM1hjVWl3ZWo3aHpndnhpdjM3ekExMUdEdk8yTGVKL2lYZStnTTZI?=
 =?utf-8?B?bGduaG1peEtYNWlWR09kS09kajdXNHI0S2xsRHJYSTQ2MVJib2o1M0dmK3ZP?=
 =?utf-8?B?L281TCtyRU9zWitPUkdkTG9lK25hVVBNL0lrR3pkRjkvcWY2eGhiU09KWXVa?=
 =?utf-8?Q?QI06IkbQc7NyS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUNoNjUyaldnNlBHU255ZGpxN2NJcnNIK3ZCYkVOQWUycFMwSk56U0JGSkYr?=
 =?utf-8?B?YXBoK3Q3dWc3TmdNU0EyOGYyYUNRT2NLSlE2UXY2VkdWL1NVeWQrSmRJbFE1?=
 =?utf-8?B?U1FCZitmT3BQcWE5b2l6dVJPZlVRVlNXcTl0b3ljWW9Obmg1TGNzT2NGU29D?=
 =?utf-8?B?djdYTUZNak5pNHdpRzdzOHJJRVdSTHl4VDNPdkRNeFFyRHlLZzRsYnJ5YkIw?=
 =?utf-8?B?YWJtK3VwWG1CVEpaWVhUWCtreTYxbkEwL05EZXl6ajRZZVpGNzU4QUt6ekFz?=
 =?utf-8?B?NHlOVlplbjdvbEhRN0hDZTVRdHRPdWFwOEtRMFZDbSs0bHpCVjVIblJuQy9h?=
 =?utf-8?B?dDZYQnVOd0xBbEZyeHFyNGJ0OG1TMVZoTTRyL0RYTEMrMVpLM1RmOFBJazVG?=
 =?utf-8?B?c0Y3eFRDaVFQNys5L1F6OWljRmVDY3JnZFVuQkNvM01mbVh4UjhsNU1kQ1Ro?=
 =?utf-8?B?MTNtQ0o0VjlyZDRjNXlnTjlzVjYxbnZUK3hZZUxpbC9RNVlPVDFJQ3lkNU5X?=
 =?utf-8?B?SjNORXQrNU8xYXZNRmRGdG53MFdLTW44czJtRjRNaUJHeDRuSWo2eEZWalFP?=
 =?utf-8?B?eDZndnU1QVlQQ2tEUU9sQm1IM20wVEpXMnVhT3V0a3FLaitIdHVZOXFYeEFC?=
 =?utf-8?B?dGp2Z0IvVTBnaHV1aGZZelRpZUo0OUJIZ1BvQlNsRndaazJ5Yjk1QStwcVFn?=
 =?utf-8?B?UGlLb1RydllFL0dXWm1MelBCaUNpWURlMkE5Z1Z0N01ETXNRUjBDNHpxcndn?=
 =?utf-8?B?UTlIeG5DOUpkcXBqdnBDV0NqNk4wZ3A5RkVVRUFrczZkbzc3RVpPQTJ0Uk4x?=
 =?utf-8?B?aGgvOWN2d1JudWdVTGhDTjJzNDE5dm1CcFJGYkhLb3hrQzdYRkxaM01mN3RP?=
 =?utf-8?B?Ujk4UHBwaGd0U0Rta1dIcjZQYmlqVTRuK3VWbURWbEd1T0FGb2hYMkxSdHY1?=
 =?utf-8?B?V2hVajdEdXc0RjNacysvTmlxU1NoREhWbzZpOUg1RWxPdjdyU2dwWkdQbWUv?=
 =?utf-8?B?S0t4eS9UandRZjFPa01OcW00VzhqNWlFNDBoN1NzTUxvSjhDWC81alF6YnZE?=
 =?utf-8?B?Smk4eWJTK3BwSE5ObkxnMXladEFCaDErSVIvUmxjU0NvWndWaFl6WjFPcFFM?=
 =?utf-8?B?MGtZWnFyMUE3UDdOTlhRVEhiYXlHb20xUkgwQzROMENGMmZyaGhOakZibHVX?=
 =?utf-8?B?cUhmSnl5NGcyUjVwS1VCNDhHc2xxMU9kenhqQlk2ZHZhVitXczRpa202YVY4?=
 =?utf-8?B?NlpRQjdKa0xoZGl2YUhOSDRva1loSE5mSE9Ha3ppaGorZ1RiM2l3bzUyTUE2?=
 =?utf-8?B?ancwTTliL2ZhcDN0SFVNdDhlczZoM1Z2TnEzZlhKZkw2YXozZVN1b2pGaXll?=
 =?utf-8?B?RkFvNEt3VWE0M0c1NmtPZTJWQjRkTU0xTncwRVE5VW4rK0FqbkpIS0tmOGgz?=
 =?utf-8?B?WTVyaTJkekVkVWo1SDN5VW5ia2x6dGF4QjJMZHpBY2NralY4NmZDRWIwY2gz?=
 =?utf-8?B?Z2Z3Z240ZjUxbHQwV0VFRXFqcG0vUzVyUDVVamVnYVQzWEcxVnE4MFIrd3BK?=
 =?utf-8?B?U3FhdmNhdVJoKy9ldll6akx1THpPMXJhRjBrMDBGeU1FTG9iOTF4ZXlJelU2?=
 =?utf-8?B?T2RBMVc4UE5jMHZIZFFOTis2azNsUTNoZ2o0VVdkZHhiTDEzOEY5RUdyeVVW?=
 =?utf-8?B?MXRWNUMwSGJremVBRVZyMkU1amszbVcxZjIvZkdUT2g5RGx1eWdhU3M3QTY1?=
 =?utf-8?B?RkVaUXdscWlrVml1ek5xTzRRSWhEL2NNbDRDeUREYklIdjFMemZQN2RSaXFG?=
 =?utf-8?B?U3VQTndJMW40REl6ejI0eTg0RUwwcXVkdGpaYTB1VTkrQU5XSHhMYUJvSlU2?=
 =?utf-8?B?Zml3MStYMXFwQi9nVzNVN3hTaGdyYzBpb29kaW9sdzZ4NHRYM3JKb3RmTWtP?=
 =?utf-8?B?cDlyNUZEMW9jd2xqUUw5Y2pvNWNReDBvdUFKS0xVb2MwbGNLK0R3YUZGUWx4?=
 =?utf-8?B?Q3BZTXlmbkJNWUZsYzVidjdCaVBGTWlnUWlLMk84anpSd3hIdWFqWTA3d0lH?=
 =?utf-8?B?anlDRHFkZmZMTE1GVjVIcGkya2p3Vk1pZ1drTW9xa2RGZXNEbTc5Mkxld0ps?=
 =?utf-8?Q?uVYUtEYth6GJz/7q3waiqKFDl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972752a2-fcbd-4fe5-6e20-08dd3fdd1c95
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 20:48:26.0079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c98C1pXymF5Ivxp9D6v6zoe+PK0uKohJlfCDQn0OMOsev1NjjS8YwjEUtTqqIQgkdR1eQrF03Fw2AAciKuvCjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9405
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


On 2025-01-28 15:43, Michael Strawbridge wrote:
> Hi Vitaly,
>
> One small thing below.
>
> On 1/28/25 14:24, vitaly.prosyak@amd.com wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> This function takes a reset type mask (`AMDGPU_RESET_TYPE_FULL`,
>> `AMDGPU_RESET_TYPE_SOFT_RESET`, AMDGPU_RESET_TYPE_PER_PIPE
>> or `AMDGPU_RESET_TYPE_PER_QUEUE`) and attempts to open and
>> read the corresponding sysfs file, e.g.,
>> `/sys/bus/pci/devices/0000:08:00.0/gfx_reset_mask`.
>> It then iterates through predefined keywords such as `full`,
>> `soft`, and `queue`, validating whether AMDGPU exposes the
>> requested operation. If the requested operation is not available,
>> the test is skipped.
>>
>> The previous implementation included redundant steps and failed
>> in certain cases. This refactored version simplifies the logic,
>> improves reliability, and ensures consistent behavior across various
>> scenarios.
>>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alexander Deucher <alexander.deucher@amd.com>
>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>> Cc: Michael Strawbridge <michael.strawbridge@amd.com>
>>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> ---
>>  lib/amdgpu/amd_ip_blocks.c | 79 +++++++++++++++++++++++++-------------
>>  1 file changed, 53 insertions(+), 26 deletions(-)
>>
>> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
>> index 2b1b84414..f063ad0ab 100644
>> --- a/lib/amdgpu/amd_ip_blocks.c
>> +++ b/lib/amdgpu/amd_ip_blocks.c
>> @@ -1006,11 +1006,27 @@ asic_rings_readness(amdgpu_device_handle device_handle, uint32_t mask,
>>  bool
>>  is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struct pci_addr *pci)
>>  {
>> -	char cmd[256];
>> -	FILE *fp, *fp2;
>> -	char buffer[100];
>> +	const struct reset_arr {
>> +		const char *name;
>> +		unsigned int reset;
>> +	} reset_arr[] = {
>> +		{"full",	AMDGPU_RESET_TYPE_FULL		},
>> +		{"soft",	AMDGPU_RESET_TYPE_SOFT_RESET},
>> +		{"queue",	AMDGPU_RESET_TYPE_PER_QUEUE },
>> +		{"pipe",	AMDGPU_RESET_TYPE_PER_PIPE },
>> +		{NULL, 0}
>> +	};
>> +
>>  	bool enable = false;
>> -	char reset_mask[100];
>> +	char cmd[256];
>> +	FILE *fp;
>> +	char buffer[128];
>> +
>> +	char *token, *buf;
>> +	char reset_mask[32];
>> +	uint32_t mask = 0;
>> +	int found = 0;
>> +	int i;
>>  
>>  	if (ip_type == AMD_IP_GFX)
>>  		snprintf(reset_mask, sizeof(reset_mask) - 1, "gfx_reset_mask");
>> @@ -1019,33 +1035,44 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struc
>>  	else
>>  		snprintf(reset_mask, sizeof(reset_mask) - 1, "sdma_reset_mask");
>>  
>> -	if( pci)
>> -		snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/%04x:%02x:%02x.%01x/name |grep -oP '(?<=dev=)[0-9:.]+'",
>> -			pci->domain, pci->bus, pci->device, pci->function);
>> -	else
>> -		snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/0/name |grep -oP '(?<=dev=)[0-9:.]+'");
>> +	snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/bus/pci/devices/%04x:%02x:%02x.%01x/%s",
>> +			pci->domain, pci->bus, pci->device, pci->function, reset_mask);
>>  
>>  	fp = popen(cmd, "r");
>> -	if (fp == NULL)
>> +	if (fp == NULL) {
>> +		igt_kmsg("***FAILURE popen %s LINE %d FILE %s\n", cmd, __LINE__, __FILE__);
>>  		return false;
>> +	}
>>  
>> -	if (fgets(buffer, 13, fp) != NULL) {
>> -		snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/bus/pci/devices/%s/%s | grep -oP '%s'",
>> -			buffer, reset_mask,
>> -			reset_type & AMDGPU_RESET_TYPE_FULL ? "full" :
>> -			reset_type & AMDGPU_RESET_TYPE_SOFT_RESET ? "soft" :
>> -			reset_type & AMDGPU_RESET_TYPE_PER_QUEUE ? "queue" : "pipe");
>> -
>> -		fp2 = popen(cmd, "r");
>> -		if (fp2 == NULL) {
>> -			pclose(fp);
>> -			return false;
>> +	buf = fgets(buffer, sizeof(buffer)-1, fp);
>> +
>> +	//igt_kmsg("cmd: %s buf: %s LINE %d FILE %s\n",
>> +	//		cmd, buf != NULL ? buf : "NULL", __LINE__, __FILE__);
> Did you mean to keep the 2 above commented lines?
Thanks Michael , i will remove.
>
> Besides this you can add:
> Reviewed-by: Michael Strawbridge <michael.strawbridge@amd.com>
>
>> +
>> +	if (buf != NULL) {
>> +		token = strtok(buf, " \n");
>> +		while (token != NULL) {
>> +			for (i = 0; reset_arr[i].name != NULL; i++) {
>> +				if (reset_type == reset_arr[i].reset &&
>> +					strcmp(token, reset_arr[i].name) == 0) {
>> +					mask |= reset_arr[i].reset;
>> +					found = 1;
>> +					break;
>> +				}
>> +			}
>> +			if (!found)
>> +				token = strtok(NULL, " \n");
>>  		}
>> -
>> -		if (fgets(buffer, 13, fp2) != NULL)
>> -			enable = true;
>> -		pclose(fp2);
>> +	} else {
>> +		igt_kmsg("***FAILURE fgets %s LINE %d FILE %s\n",
>> +				buffer, __LINE__, __FILE__);
>>  	}
>> +	if (mask == reset_type)
>> +		enable = true;
>> +	else
>> +		igt_kmsg("***FAILURE mask found 0x%x requested 0x%x operation is not supported LINE %d FILE %s\n",
>> +				mask, reset_type, __LINE__, __FILE__);
>> +
>>  	pclose(fp);
>>  
>>  	return enable;
>> @@ -1105,7 +1132,7 @@ int get_pci_addr_from_fd(int fd, struct pci_addr *pci)
>>  
>>  	if (ret != 4) {
>>  		igt_info("error %s Unable to extract PCI device address from '%s\n",
>> -				__FUNCTION__, buf);
>> +				__func__, buf);
>>  		return -ENOENT;
>>  	}
>>  
