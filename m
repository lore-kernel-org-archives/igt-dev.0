Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71116C021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 21:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308F410E7F8;
	Tue, 25 Feb 2025 21:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D46DNwqW";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2079.outbound.protection.outlook.com [40.107.102.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577B710E7F7
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 21:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNTf1eDriAEqDOJvEyTDguhouKaKJ8Nrq+j9lMGLK82UBRLLNdzrUTqd0K08Sdx5kETj8+dMmxoxB7CoHG9V5S/UeGXRZNenSIzUUGm/8Nrocc8ZSU7HYq/Zw2BCpANeGRyg5fO6NaC5VylXt9PXmGY351FT10DC6XEKUiYMBt1ABQRK8wfAa9R+ebn/8FrikM3Y2i4flsFrEauXIbMGO7IC5+G/3FAlUzBA4IRCBwU2ukjQRE57YyOBNTzts33mvtgKfzvv+U3WgNaKFHp+TRJDoYavAeC2aJDbYlvfEE1TJEZRr3QAFeGTqVz188gFTS0ULTFeLimGZ1CSHn6mdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Wc28TWB05Zh3YC8ThbIfRIKn6T8RiTLyffuwU816aI=;
 b=dQssnzh39wPne84WgeeycegglR58e/naKSeZUZRDQXRNjbKh8SVJNqRgNp6RqQ0PD2ZvTIlBz+jlm7CE2EmnK+sl9dyFd4O2OlMtMvHt3XVsQh09r2s5ibualKBEgD9VTcaKXxv4b3EOl814qqTASGlFKZRFsgbdc4jVBjvWn5NrQtgwQC+8Rj5fsaupUOmgOrM+WbxKEG687FMO1wMT9x2eWPGyYFHrqJEgIHSZUAD3z05CgP5WAuOy6B8iLdzd7u6Glwyt1AGcgln4lCWdwAflKgvbn7V8m68aasmZkTTjHui1cTs9xnig0Xj3zMEL9iH4+eaZ7bvcqCyiIUlg3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Wc28TWB05Zh3YC8ThbIfRIKn6T8RiTLyffuwU816aI=;
 b=D46DNwqWFF1iX7LAzMRWf8lm5VkSd30ZO6gGY/rjEUPQA1Jnj85xbo/5wihrHVDy7YwGUellVcMcnz3tcXQDIvPKxft4R/HX+bfR4kzT9gZIqh15WhjFfontVBRsNtz+QcyeGe/0v8U+K63uS1VWLY2jJ+uApMs+jd9l1J25nmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 21:40:41 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 21:40:40 +0000
Message-ID: <ebe71668-236c-4f6d-bcf3-82b8c2c63d02@amd.com>
Date: Tue, 25 Feb 2025 14:40:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/kms_async_flips: Create subtest for overlay
 planes
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 vitaly prosyak <vprosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Jeevan B <jeevan.b@intel.com>, kernel-dev@igalia.com,
 Harry Wentland <harry.wentland@amd.com>
References: <20241216202427.76168-1-andrealmeid@igalia.com>
 <20250219103703.2hbadorsyh5ezd3e@kamilkon-desk.igk.intel.com>
 <5b88ea25-c9a6-4025-8f9b-34e1b213e258@amd.com>
 <78c0bb06-fb95-443c-a16c-9478daa11562@igalia.com>
 <a8fc5cef-5ccf-486d-b401-f587e500746d@amd.com>
 <41966687-e25e-42eb-a6b3-fba5d6c85e16@amd.com>
 <96660957-4656-4a48-9df0-bf62f7aa5433@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <96660957-4656-4a48-9df0-bf62f7aa5433@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1P288CA0026.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH2PR12MB4152:EE_
X-MS-Office365-Filtering-Correlation-Id: 02823f3a-db93-4b60-b15c-08dd55e50cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGdPeitQL1g5SVlxcVl6TkJ5ZkcxanBNd3haVVdqMi9rQnFVRjZLSGRXRUhG?=
 =?utf-8?B?OWhia0NIaGlKeFB4QzJNdVFCNlJydEVmRnlSTnY1KzQrc0Y2UVl5WmYzUnBv?=
 =?utf-8?B?UFo1QXc4SkI5eUZWSVFHazdHOXNTRTg0aDk0eEpwSklsMUM5N1ZZM2F3WGlC?=
 =?utf-8?B?TUNTcWM4NWRaQ2xlbXRtUDE1WncrQmNqYWY3SUNzVGh6dUpQNmZtM25DK1hJ?=
 =?utf-8?B?Ym0xR2pzdG5ObXBFWG9aa1NPeXZiSmxDaktkN2FRNWlGZDhOSTdtYTArZk9t?=
 =?utf-8?B?ekhGVjdLeTE0MXVNQXdnWTFRT3dGRlkybDRUR1lWYzVmWGh4bW1FRXBQam9Z?=
 =?utf-8?B?R2xJck1JREtBK0k2WFpQN0h0ZDhKR0ZSZythK1JMMXZrRzFLMTNDbnQ1b2ZL?=
 =?utf-8?B?U3gvUWw1bEU5dTl6aDRybEcrc1gydkhqUGlWREFNRmpQa1o5WXFTSXpHN3Zm?=
 =?utf-8?B?Z0NFejdGMXRvNjE5ZW5NZm00WGptdWdCM2VMODhaeXA2L3o0b2pYVk1YMExl?=
 =?utf-8?B?ekxRT1lHNlNnN0JTOUQrc25iaVozUG5MTFZJeUJSK0NoRW16OEVYakdhRU1O?=
 =?utf-8?B?bWdkczI2VkR4ZHU3ZGhLc1I1eW03VGN1MzgxRCtrdElqcXBSU0JPZTBUUURk?=
 =?utf-8?B?YXN1K0N0NENJTWg4QXRLRnNoLzNnZFFnZE80VnhHUFc5amtKQjd5QXFQQjRI?=
 =?utf-8?B?cytXOTd0NkJmOWJKNHA1SG9uVzI3dEVHMkl5SFF5bVhGcExjSHh5NWUvd0hF?=
 =?utf-8?B?Z1FUczhSQ2wrVHc5c2kzYTZqRnJpTEMxWTFHZlhwVkNCeUpjZUhuVDhWa1J3?=
 =?utf-8?B?cjRFYUxvalI3T1k1TUZuYkdocURQcE5wcVBFS1NBamVsVVp4T1ZKazNMK3hL?=
 =?utf-8?B?aEpmamhlVysyRXE0QVFPSGtpN2ZjMTc1OWg0VGNucnI3aVJOTVpLQkdDZHVh?=
 =?utf-8?B?Y2NVVXR4NFh6UEl4UWpHZEp3NS9Xdk9lUUpxOTRSMmpGbkJnNlV4RVk0NFZj?=
 =?utf-8?B?NG1ZUDFTZnQ0eWtDNWpXeHBPdXFIWWVPdmdwaFE2dTN2SkxjTWxLWDVOOHZS?=
 =?utf-8?B?aFBaNk4wQjF4ekR1anN5bFo4ZGdnK2ZnWFphVEh0MnJidGwxTXpkMFlkdzFl?=
 =?utf-8?B?Z2RzQTJ3cUY0YzM5MEc3eklyM2RTcDdTOTFPQ3FHY1Z3SUFvc2tITkdjMzBZ?=
 =?utf-8?B?RVpxbjR0ekNPd05ha0hoYXVJdDRzczBIZGtmWU1UZ1hSZjRMVnJZOFJOdjl4?=
 =?utf-8?B?czdabjNNSVFyeG5RL3VYbGlla3d4cW5mN3dNUERRMU4vQ3o0SmRWTzY1Z3pS?=
 =?utf-8?B?OENTSHR2L3lpNm0wZWFoenFpNmhCOGhxOGdMWHlYMExrRkZNZHlKTjl6bEor?=
 =?utf-8?B?bVZNYStkQmZDdWdWeXFJVURtRjFuTTZvTGNBUlpVQ2F1M1dIb1BWcCtEQVZY?=
 =?utf-8?B?ZG80ajBVZTNtZlUyRGp5VnZSY0l4WmJSejZHNE80d0kraGdDMHQ2b0pvWWVo?=
 =?utf-8?B?eFBjQ1htZjVxa2NiOU1LUkNKWkgwSC9EV05HVnRkdWFGRDFxYWhuWTBEZlZB?=
 =?utf-8?B?RTI5WmlZZ2xtNnNyY3B6WEg1aVNrS3crMVppaVhuTTVsQXVrZzVJQlN4M010?=
 =?utf-8?B?alg3MndiYThYRGl2Ykc1ODBpNFRoZzZHOFBDSmU5ZHJtYXJLR2Z0ZzlkRGtH?=
 =?utf-8?B?aDUwbFpZd2t2ZzlBRlg5RkFzUkhXdDF3eFJGTG1BdFE4ZzMrUnNybHFGQnNM?=
 =?utf-8?B?OHdjaXo4SWtHeW1TdlQyWjNGYUx0UHRJZlNuWlVQbVVpWHl5Y0M5dDlkbU5u?=
 =?utf-8?B?ODFrais2TjB4SDdDb0JRbmdLQzFuejF4NUFueDZKQ3RMTWlzdHA2VFY1N0U5?=
 =?utf-8?Q?qZF5mpZQsbXH7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXd4MU9ZbjNHZ1BjdFNKL3ZaclNOMm4wbzhGWEJUNG9GR0hvUm1MSkxvcU5T?=
 =?utf-8?B?ZFNzNERaMDVGeWhxekNhS1BNdE9CT1ZIYk91SjJscVkwbGJvVnVtVmYxbjZC?=
 =?utf-8?B?N1hoek5kNmxCVEYzRktMQ0tGRU5QSXluamM4UGYxRjlIOU1ZSGxIdmZSQ3pl?=
 =?utf-8?B?NWd1aEVXTmNsTFV2SkJPbmxZcVZWblBGSjJCd3pobmp1SG9XOTd4ajhCMUxD?=
 =?utf-8?B?Q1RQWTkwY0VPZzJ0YysrRUFpb3pYRTllaGtkUXhOb0d4clFEVWhaNjJKSzYy?=
 =?utf-8?B?T0lSYnpGK21kUm5DN292Nmt3bWxPZkZMWGlJZ280aVcrSmVZZ3l4VFVBL2N2?=
 =?utf-8?B?bitERmlJZExzblhCeERIWkdLVHp3M3dHWTBPekR1Y1dEN0VjWVdiRHNTamFq?=
 =?utf-8?B?Vk1jL1hUTENQY2k3bkdwWW14OWxEdVZzNURHU284L2R1MFFMcWc0YldNSEtR?=
 =?utf-8?B?NXRwdzVXZ2MxcWtrSmRUQWxwSFZDL1FJa253YVZuQU9kZEFFcVFmTWd5anpP?=
 =?utf-8?B?aTJ6NEtxUm9tZ3F6ZnJvVHd3THZ4K2FBZ2ZxQjV1MW1EbXE5eGdmb2wyQmto?=
 =?utf-8?B?Q3J6N1JPMjJSRXNxaVRiRWJJS0oycnFiV3plU3hxNWlLd2ZCMytsYW9SakJz?=
 =?utf-8?B?eU1GUzd2K0ozU1g4UUxWZDNLMU1nejNocXp6eXA4YUMxZ3VTbml1UmVnc1N6?=
 =?utf-8?B?Rm40aW9ZZm1ONWwvOERHWWV1dTBkdnRWSnNXb2JuanR6L2RKd3gwcWlMVEVU?=
 =?utf-8?B?RjQwNlQ1MDJ2bGhxSlptRHBWQ285UjVhTVBGZVNSMDRCQmt1dXZYQnRVZDND?=
 =?utf-8?B?d09tQ2ZIK0JyWVBlOC8zdlhLRWxzS3VoSXRqbVkyQWo4S3pLaEFUUnNkT2M2?=
 =?utf-8?B?a3grWHhxcFBIejNSbEVWWGZqVkcvc3M5emsrNnM1Umlpa3ZPV2pZbFdTYjlT?=
 =?utf-8?B?dE1WUGxVZk9pdkpxWkhvQVMwNVRER2VYZG5hSVN1aDV3cjZVODlwTk5JNTJ6?=
 =?utf-8?B?WXZ0alkydlVxTU0wcHRoclhEeFNRNk1MNGdHc3hjMWd3cVY1aGllRDA2bmdC?=
 =?utf-8?B?TTFoUXJ1REVoMkwyaGlUbjZ3TGJjc0QrbFBreWt4L0V4WlJweXRJYmg3cDVM?=
 =?utf-8?B?Wk54VFN0Q29xMWxsSXU4dVVpclB6L055ZnRrekxCbm1kOHFPbkdtQ3VGWXo1?=
 =?utf-8?B?SVNyUHpvbnA5YllzRDRvV1JwSlNMUzdsM1dQMjZHV0FMQlVXUEpUUUp3WERO?=
 =?utf-8?B?dzdOczVvV2g0MFBaYlNCRiswemlQQktoS1l1RlphVjFZWGVZME9jRHV4MEhl?=
 =?utf-8?B?TVQvRE9RRnpFOHAweG1SUE0vRHpLZEwyN21DQjhPTHYwTWRRQ3pOZUtZdm5q?=
 =?utf-8?B?dWpsSFpXRW1ucDlTbjFPRDlYWXZyTENsTVpDRzFnd0g4ZHNTaFovVTZhbUpZ?=
 =?utf-8?B?RXdEWkxCRUV0Z3RGUEVxRDY2eUwxcmpLb3M2Z0h3OUttclQ2cU8xMC9sQzdz?=
 =?utf-8?B?Tjk3cUVkdFBzb2N6L3I4RS8rVG44MjcwVng2eEkxRG9idUcrSXlHUFVka21E?=
 =?utf-8?B?dEZtbWJUWkZod0tFRWNMV3JkUnRoUy9XWU1YVjBNNzRWeE9VclhVLzQ2ZHVI?=
 =?utf-8?B?WUUzdk9pOG82Y1hFQUM3cWZLUURYQk5hMmZIOXBLTWY4ZmlVd3I0TnVSb0tE?=
 =?utf-8?B?Z1dqVWlEaXEwSVN0OWI4Sy9taUQ2bzNDVFh0OTFTcjdCOXRPL0I5dVZpU3Ex?=
 =?utf-8?B?b1NOK09RcTRvNTJKeGl5cWFpWWlIVFNpYzY4dHczTkxKUnlITXN4TFM5K0I3?=
 =?utf-8?B?bVA5MHgyd3VyZitqWFE0SjgzUTgxeDU3RDlyU1VKVk04SCtKcDR6VWtVL2ds?=
 =?utf-8?B?YzRCaU1OSWZKUXJmMWFMSjAzZXFoK2hRakJoRVRVYnJBUmlPemhKV0tFNnlX?=
 =?utf-8?B?bVhlUk5lbDBZc1V1MFk1N2hVejJibWM5blBzTmpHc0d4aDRNcVhwN29HWG5S?=
 =?utf-8?B?R1IxZWVvNGxzQm56dm1jNW53cTlSNHlIQ1hyT2VVWWJwU2tHRDZQTzZjUDFE?=
 =?utf-8?B?TWF0Z1RMSVAxUUhsNHVUV2ZpWjVPbzByV25OQ1VkSzRZN3dEZllhVTM5MUNs?=
 =?utf-8?Q?mZrkchEYfXDKkHFzYsnjg/ssi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02823f3a-db93-4b60-b15c-08dd55e50cbb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 21:40:40.8368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UO6sOxa9c0DcArRhNXSObvBgroDyH+P7hj7ebCtcP8nY5dkfyQUYiAiOKoSRvHb7XNWOifbCc68/5DA1LJ/Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152
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



On 2/25/25 13:16, André Almeida wrote:
> Hi Alex,
> 
> Thanks for testing it.
> 
> Em 25/02/2025 16:06, Alex Hung escreveu:
>>
>> We don't have a CI to test individual IGT patches so I tested this 
>> patch on an APU and dGPU with kms_async_flips
> 
> [...]
> 
>>
>>
>> If I run overlay-atomic alone (i.e., --run-subtest overlay-atomic), 
>> overlay-atomic fails as below (partial outputs only). Is this an 
>> expected result? Does overlay-atomic need to run along with other 
>> subtests?
>>
> 
> This is not the expected result, I tried to reproduce here but it worked 
> fine. Tested on Steam Deck, rebased on current igt master (commit 
> 6cdff4099c6c95e):

I also have IGT rebased to current commit (same as yours)

db3a185f3 (HEAD -> master) tests/kms_async_flips: Create subtest for 
overlay planes
6cdff4099 (origin/master, origin/HEAD) lib/i915/fbc: fbc psr combo 
support update for xe3

The kernels I tried are
- 6.11.0-18-generic (from Ubuntu's current)
- 6.12.0 from amd-staging-drm-next

> 
> sudo ./build/tests/kms_async_flips --run-subtest overlay-atomic
> IGT-Version: 1.30-g19c7e62ea (x86_64) (Linux: 6.14.0-rc4-00318- 
> g72d0af4accd9 x86_64)
> Using IGT_SRANDOM=1740513273 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: overlay-atomic
> Starting dynamic subtest: pipe-A-eDP-1
> Dynamic subtest pipe-A-eDP-1: SUCCESS (2.124s)
> Starting dynamic subtest: pipe-B-eDP-1
> Dynamic subtest pipe-B-eDP-1: SUCCESS (2.101s)
> Starting dynamic subtest: pipe-C-eDP-1
> Dynamic subtest pipe-C-eDP-1: SUCCESS (2.101s)
> Starting dynamic subtest: pipe-D-eDP-1
> Dynamic subtest pipe-D-eDP-1: SUCCESS (2.101s)
> Subtest overlay-atomic: SUCCESS (8.950s)
> 
> However, I saw this type of error before where the first flip is refused 
> with -EINVAL. That usually happens because we can't change most of plane 
> properties with the DRM_MODE_PAGE_FLIP_ASYNC flag and the previous state 
> was somewhat different from the one that we want to present now, so we 
> need to do a sync flip to modeset, and then do the async ones.
> 
> Is there anything particular from your setup so I can try to reproduce 
> here? I see that you have more than one card attached, what did you run 
> prior to the test on that card?

I tried on phoenix APU and dGPU Radeon RX 6800/6800 XT, and both of them 
have the same results.

> 
> Alternatively, adding the following lines in the begining of 
> test_async_flip() should force a DRM_MODE_ATOMIC_ALLOW_MODESET and allow 
> the next page flips:
> 
> igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
> igt_display_try_commit_atomic(&data->display, 
> DRM_MODE_ATOMIC_ALLOW_MODESET, data);
> 

Like the below changes? It doesn't fix the error messages for me, and I 
saw some SIGSEGV.

--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -326,6 +326,9 @@ static void test_async_flip(data_t *data)
         struct timeval start, end, diff;
         int suspend_time = RUN_TIME / 2;

+       igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
+       igt_display_try_commit_atomic(&data->display, 
DRM_MODE_ATOMIC_ALLOW_MODESET, data);
+
         igt_display_commit2(&data->display, data->display.is_atomic ? 
COMMIT_ATOMIC : COMMIT_LEGACY);



If either alternate-sync-async-flip or alternate-sync-async-flip-atomic 
is run before overlay-atomic, overlay-atomic will SUCCESS (tested on 
phoenix APU)

Cheers,
Alex Hung

> Thanks,
>       André
> 
>> IGT-Version: 1.30-g8fee6d12c (x86_64) (Linux: 6.11.0-18-generic x86_64)
>> Using IGT_SRANDOM=1740510058 for randomisation
>> Opened device: /dev/dri/card1
>> Starting subtest: overlay-atomic
>> Starting dynamic subtest: pipe-A-DP-1
>> (kms_async_flips:3180096) CRITICAL: Test assertion failure function 
>> test_async_flip, file ../tests/kms_async_flips.c:361:
>> (kms_async_flips:3180096) CRITICAL: Failed assertion: ret == 0
>> (kms_async_flips:3180096) CRITICAL: Last errno: 22, Invalid argument
>> (kms_async_flips:3180096) CRITICAL: error: -22 != 0
>> Stack trace:
>> Dynamic subtest pipe-A-DP-1 failed.
>> **** DEBUG ****
>> (kms_async_flips:3180096) DEBUG: Test requirement passed: ! 
>> (is_joiner_mode(data->drm_fd, data->output))
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>> format=XR24(0x34325258), modifier=0x0, size=0)
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(handle=1, pitch=13824)
>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>> passed: igt_has_fb_modifiers(fd)
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>> format=XR24(0x34325258), modifier=0x0, size=0)
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(handle=2, pitch=13824)
>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>> passed: igt_has_fb_modifiers(fd)
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>> format=XR24(0x34325258), modifier=0x0, size=0)
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(handle=3, pitch=13824)
>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>> passed: igt_has_fb_modifiers(fd)
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>> format=XR24(0x34325258), modifier=0x0, size=0)
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(handle=4, pitch=13824)
>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>> passed: igt_has_fb_modifiers(fd)
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>> format=XR24(0x34325258), modifier=0x0, size=0)
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(handle=5, pitch=13824)
>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>> passed: igt_has_fb_modifiers(fd)
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>> format=XR24(0x34325258), modifier=0x0, size=0)
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(handle=6, pitch=13824)
>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>> passed: igt_has_fb_modifiers(fd)
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>> format=XR24(0x34325258), modifier=0x0, size=0)
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(handle=7, pitch=13824)
>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>> passed: igt_has_fb_modifiers(fd)
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>> format=XR24(0x34325258), modifier=0x0, size=0)
>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>> igt_create_fb_with_bo_size(handle=8, pitch=13824)
>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>> passed: igt_has_fb_modifiers(fd)
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: plane_set_fb(151)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: plane_set_size 
>> (3440x1440)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>> fb_set_position(0,0)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>> fb_set_size(3440x1440)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: plane_set_size 
>> (3440x1440)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: plane_set_fb(151)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: plane_set_size 
>> (3440x1440)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>> fb_set_position(0,0)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>> fb_set_size(3440x1440)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: plane_set_size 
>> (3440x1440)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: commit {
>> (kms_async_flips:3180096) igt_kms-DEBUG: Pipe A: Setting property 
>> "MODE_ID" to 0x96/150
>> (kms_async_flips:3180096) igt_kms-DEBUG: Pipe A: Setting property 
>> "ACTIVE" to 0x1/1
>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
>> data: A.0, fb 151
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>> "SRC_X" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>> "SRC_Y" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>> "SRC_W" to 0xd700000/225443840
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>> "SRC_H" to 0x5a00000/94371840
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>> "CRTC_W" to 0xd70/3440
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>> "CRTC_H" to 0x5a0/1440
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>> "FB_ID" to 0x97/151
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>> "CRTC_ID" to 0x5b/91
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>> "COLOR_ENCODING" to 0x1/1
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting property 
>> "COLOR_RANGE" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
>> data: A.2, fb 151
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "SRC_X" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "SRC_Y" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "SRC_W" to 0xd700000/225443840
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "SRC_H" to 0x5a00000/94371840
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "CRTC_W" to 0xd70/3440
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "CRTC_H" to 0x5a0/1440
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "FB_ID" to 0x97/151
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "CRTC_ID" to 0x5b/91
>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
>> data: B.0, fb 0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane B.0: Setting property 
>> "COLOR_ENCODING" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane B.0: Setting property 
>> "COLOR_RANGE" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
>> data: C.0, fb 0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane C.0: Setting property 
>> "COLOR_ENCODING" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane C.0: Setting property 
>> "COLOR_RANGE" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
>> data: D.0, fb 0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane D.0: Setting property 
>> "COLOR_ENCODING" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane D.0: Setting property 
>> "COLOR_RANGE" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
>> data: E.0, fb 0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane E.0: Setting property 
>> "COLOR_ENCODING" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane E.0: Setting property 
>> "COLOR_RANGE" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
>> data: F.0, fb 0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane F.0: Setting property 
>> "COLOR_ENCODING" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane F.0: Setting property 
>> "COLOR_RANGE" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     DP-1: preparing 
>> atomic, pipe: A
>> (kms_async_flips:3180096) igt_kms-DEBUG: DP-1: Setting property 
>> "CRTC_ID" to 0x5b/91
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: }
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: plane_set_fb(154)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: plane_set_size 
>> (3440x1440)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>> fb_set_position(0,0)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>> fb_set_size(3440x1440)
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: commit {
>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating plane 
>> data: A.2, fb 154
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "SRC_X" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "SRC_Y" to 0x0/0
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "SRC_W" to 0xd700000/225443840
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "SRC_H" to 0x5a00000/94371840
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "CRTC_W" to 0xd70/3440
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "CRTC_H" to 0x5a0/1440
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "FB_ID" to 0x9a/154
>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting property 
>> "CRTC_ID" to 0x5b/91
>> (kms_async_flips:3180096) igt_kms-DEBUG: display: }
>> (kms_async_flips:3180096) CRITICAL: Test assertion failure function 
>> test_async_flip, file ../tests/kms_async_flips.c:361:
>> (kms_async_flips:3180096) CRITICAL: Failed assertion: ret == 0
>> (kms_async_flips:3180096) CRITICAL: Last errno: 22, Invalid argument
>> (kms_async_flips:3180096) CRITICAL: error: -22 != 0
>> (kms_async_flips:3180096) igt_core-INFO: Stack trace:
>> ****  END  ****
>> Dynamic subtest pipe-A-DP-1: FAIL (0.227s)
>>
>>
>>
>>>
>>>>
>>>> Thanks!
>>>>
>>>>> Vitaly
>>>>>
>>>>>> Please add to Cc Vitaly from AMD:
>>>>>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>>>>
>>>>>> Also add Jeevan here:
>>>>>> Cc: Jeevan B <jeevan.b@intel.com>
>>>>>>
>>>>>> Regards,
>>>>>> Kamil
>>>>>>
>>>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>>>> ---
>>>>>>> v2: Add test description for GitLab compilation
>>>>>>> ---
>>>>>>>    tests/kms_async_flips.c | 45 +++++++++++++++++++++++++++++++++ 
>>>>>>> + +++----
>>>>>>>    1 file changed, 41 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>>>>>>> index 4a72be7b5..dd0907d50 100644
>>>>>>> --- a/tests/kms_async_flips.c
>>>>>>> +++ b/tests/kms_async_flips.c
>>>>>>> @@ -89,6 +89,9 @@
>>>>>>>     *
>>>>>>>     * SUBTEST: async-flip-suspend-resume
>>>>>>>     * Description: Verify the async flip functionality with 
>>>>>>> suspend and resume cycle
>>>>>>> + *
>>>>>>> + * SUBTEST: overlay-atomic
>>>>>>> + * Description: Verify overlay planes with async flips in atomic 
>>>>>>> API
>>>>>>>     */
>>>>>>>    #define CURSOR_POS 128
>>>>>>> @@ -109,12 +112,14 @@ typedef struct {
>>>>>>>        uint32_t crtc_id;
>>>>>>>        uint32_t refresh_rate;
>>>>>>>        struct igt_fb bufs[NUM_FBS];
>>>>>>> +    struct igt_fb bufs_overlay[NUM_FBS];
>>>>>>>        igt_display_t display;
>>>>>>>        igt_output_t *output;
>>>>>>>        unsigned long flip_timestamp_us;
>>>>>>>        double flip_interval;
>>>>>>>        uint64_t modifier;
>>>>>>>        igt_plane_t *plane;
>>>>>>> +    igt_plane_t *overlay_plane;
>>>>>>>        igt_pipe_crc_t *pipe_crc;
>>>>>>>        igt_crc_t ref_crc;
>>>>>>>        int flip_count;
>>>>>>> @@ -126,6 +131,7 @@ typedef struct {
>>>>>>>        bool allow_fail;
>>>>>>>        struct buf_ops *bops;
>>>>>>>        bool atomic_path;
>>>>>>> +    bool overlay_path;
>>>>>>>    } data_t;
>>>>>>>    static void flip_handler(int fd_, unsigned int sequence, 
>>>>>>> unsigned int tv_sec,
>>>>>>> @@ -226,6 +232,8 @@ static void test_init(data_t *data)
>>>>>>>        igt_output_set_pipe(data->output, data->pipe);
>>>>>>>        data->plane = igt_output_get_plane_type(data->output, 
>>>>>>> DRM_PLANE_TYPE_PRIMARY);
>>>>>>> +    if (data->overlay_path)
>>>>>>> +        data->overlay_plane = igt_output_get_plane_type(data- 
>>>>>>> >output, DRM_PLANE_TYPE_OVERLAY);
>>>>>>>    }
>>>>>>>    static void test_init_fbs(data_t *data)
>>>>>>> @@ -246,16 +254,27 @@ static void test_init_fbs(data_t *data)
>>>>>>>            prev_modifier = data->modifier;
>>>>>>>            if (data->bufs[0].fb_id) {
>>>>>>> -            for (i = 0; i < NUM_FBS; i++)
>>>>>>> +            for (i = 0; i < NUM_FBS; i++) {
>>>>>>>                    igt_remove_fb(data->drm_fd, &data->bufs[i]);
>>>>>>> +                if (data->overlay_path)
>>>>>>> +                    igt_remove_fb(data->drm_fd, &data- 
>>>>>>> >bufs_overlay[i]);
>>>>>>> +            }
>>>>>>>            }
>>>>>>> -        for (i = 0; i < NUM_FBS; i++)
>>>>>>> +        for (i = 0; i < NUM_FBS; i++) {
>>>>>>>                make_fb(data, &data->bufs[i], width, height, i);
>>>>>>> +            if (data->overlay_path)
>>>>>>> +                make_fb(data, &data->bufs_overlay[i], width, 
>>>>>>> height, i);
>>>>>>> +        }
>>>>>>>        }
>>>>>>>        igt_plane_set_fb(data->plane, &data->bufs[0]);
>>>>>>>        igt_plane_set_size(data->plane, width, height);
>>>>>>> +
>>>>>>> +    if (data->overlay_path) {
>>>>>>> +        igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>>>>>>> +        igt_plane_set_size(data->overlay_plane, width, height);
>>>>>>> +    }
>>>>>>>    }
>>>>>>>    static bool async_flip_needs_extra_frame(data_t *data)
>>>>>>> @@ -283,12 +302,17 @@ static bool 
>>>>>>> async_flip_needs_extra_frame(data_t *data)
>>>>>>>    static int perform_flip(data_t *data, int frame, int flags)
>>>>>>>    {
>>>>>>>        int ret;
>>>>>>> +    igt_plane_t *plane;
>>>>>>> +    struct igt_fb *bufs;
>>>>>>> +
>>>>>>> +    plane = data->overlay_path ? data->overlay_plane : data->plane;
>>>>>>> +    bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
>>>>>>>        if (!data->atomic_path) {
>>>>>>>            ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>>>>>>> -                      data->bufs[frame % NUM_FBS].fb_id, flags, 
>>>>>>> data);
>>>>>>> +                     bufs[frame % NUM_FBS].fb_id, flags, data);
>>>>>>>        } else {
>>>>>>> -        igt_plane_set_fb(data->plane, &data->bufs[frame % 
>>>>>>> NUM_FBS]);
>>>>>>> +        igt_plane_set_fb(plane, &data->bufs[frame % NUM_FBS]);
>>>>>>>            ret = igt_display_try_commit_atomic(&data->display, 
>>>>>>> flags, data);
>>>>>>>        }
>>>>>>> @@ -772,6 +796,7 @@ igt_main
>>>>>>>            igt_subtest_with_dynamic("async-flip-with-page-flip- 
>>>>>>> events") {
>>>>>>>                data.alternate_sync_async = false;
>>>>>>>                data.atomic_path = false;
>>>>>>> +            data.overlay_path = false;
>>>>>>>                if (is_intel_device(data.drm_fd))
>>>>>>>                    run_test_with_modifiers(&data, test_async_flip);
>>>>>>>                else
>>>>>>> @@ -783,6 +808,7 @@ igt_main
>>>>>>>            igt_subtest_with_dynamic("async-flip-with-page-flip- 
>>>>>>> events-atomic") {
>>>>>>>                data.alternate_sync_async = false;
>>>>>>>                data.atomic_path = true;
>>>>>>> +            data.overlay_path = false;
>>>>>>>                if (is_intel_device(data.drm_fd))
>>>>>>>                    run_test_with_modifiers(&data, test_async_flip);
>>>>>>>                else
>>>>>>> @@ -793,6 +819,7 @@ igt_main
>>>>>>>            igt_subtest_with_dynamic("alternate-sync-async-flip") {
>>>>>>>                data.alternate_sync_async = true;
>>>>>>>                data.atomic_path = false;
>>>>>>> +            data.overlay_path = false;
>>>>>>>                run_test(&data, test_async_flip);
>>>>>>>            }
>>>>>>> @@ -800,7 +827,17 @@ igt_main
>>>>>>>            igt_subtest_with_dynamic("alternate-sync-async-flip- 
>>>>>>> atomic") {
>>>>>>>                data.alternate_sync_async = true;
>>>>>>>                data.atomic_path = true;
>>>>>>> +            data.overlay_path = false;
>>>>>>> +            run_test(&data, test_async_flip);
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        igt_describe("Verify overlay planes with async flips in 
>>>>>>> atomic API");
>>>>>>> +        igt_subtest_with_dynamic("overlay-atomic") {
>>>>>>> +            igt_require(is_amdgpu_device(data.drm_fd));
>>>>>>> +            data.atomic_path = true;
>>>>>>> +            data.overlay_path = true;
>>>>>>>                run_test(&data, test_async_flip);
>>>>>>> +            data.overlay_path = false;
>>>>>>>            }
>>>>>>>            igt_describe("Verify that the async flip timestamp 
>>>>>>> does not "
>>>>>>> -- 
>>>>>>> 2.47.1
>>>>>>>
>>
>>
> 

