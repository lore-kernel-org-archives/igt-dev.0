Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97135C02183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 15:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5295E10E5A0;
	Thu, 16 Jan 2025 15:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="smheU6D/";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D367710E5A0
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 15:43:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjP0spbkFwXXpyoTYL3Pd4JZr3QTjS26rSova2t6qOMBkCk29zxNdaZRvNxYunvt3h81DyAOIEhaOyKf0CWU2A6ydnvt3Tb8C88p3tw/KTuEASwiEzMWGdvVBlV/aH77Ulm/1Id6/mrZBdpLMnBFO7yLmyMCVpKbaC0ogsieh/srj2o1jupbc4hzbiDFlHT1zMiXoRSZ78P02uH7KjoqZvXipx/tA3ofdKzmluZainJvnkmJY6tPMHUoYFY8KXTcyXdpt7OHgbEmv6+Y/iJI0/Vem9AstjvROpO4JIn/8usa5Yb4uoWxHI+aRKQka37A63HQAgxY/d5dWgSVAeXm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjV8Ec7Ho38gKToXh0/oE49Y4vzKAAb5SQXbMBPQ72g=;
 b=GlX9jUJm+zBzqIeXSh5ZkSM6xRjj6GEb9RLDAgmEuCBxnY8uXuKqDtFhWY/sEKrjsVaIK5BMsN/GUOr+EewNKuz8wT2Jr8YA5Sn6wifzCpO6Dl8xUtJmvYpjGuloi4GSwUHItFLnWcCtigD/ra3b/IlkxyJ5FDudx1Qs4DxRgJtOU+7+VeppMbiqiugB1bH+LprkFJIYouU2vh4I+ai7qa066i8OBipjUAfHsllGRuTiNWNLoEXbM/8F6MAN6uX1vnBgQad/Wydc+15m/G/2ji/AR/R0XaQe4znbfyvHy9WM1yfKfO0c1wufZXffMoinTNF4xGEx5ky4/X1GxQa5Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjV8Ec7Ho38gKToXh0/oE49Y4vzKAAb5SQXbMBPQ72g=;
 b=smheU6D/7lJcXGdxckvf1khInMF0iqQqPkrh5RGcAS+3RZUkugCyt/fSpEwpib4/WOZZmW2p7e+D/p9fVKOy2z2ZO7a9ZGDP4Q0hT9l5zlShkUB6h+/v7nIXjouimCFssdWSb+fRhT6QI9tJ5PHXjZ4ploSZI1wQdcFSlkIHJbQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 15:43:15 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.8335.017; Thu, 16 Jan 2025
 15:43:15 +0000
Message-ID: <23b97017-9074-44f3-9248-5341aedb7f2f@amd.com>
Date: Thu, 16 Jan 2025 10:43:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] lib/amdgpu: Add user mode queue support in ring
 context
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Strawbridge@rtg-sunil-navi33.amd.com, Michael <Michael.Strawbridge@amd.com>
References: <20250116065211.1882469-1-sunil.khatri@amd.com>
 <20250116065211.1882469-4-sunil.khatri@amd.com>
 <20250116115150.ma35lvddby7647it@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250116115150.ma35lvddby7647it@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0352.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::6) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DM6PR12MB4299:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f16b07-a08f-42cf-9f6c-08dd36447daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWw3ZE12WnhoZm8xMitxZHA0L0E3MzdhTWxCbHdXNGNuTlJtWjd0aGFwOHFM?=
 =?utf-8?B?U05BckdaNkZLU2pvTEtTcUtzNEt4ZFdkOVVvMWRzNm03czFBNEpwb2dsL0Jr?=
 =?utf-8?B?UFJnU01Zd0dLVUlmWkc0elRDdEUyNVhzb05EMGxyb04xeFZNS3I0czdrZ2R5?=
 =?utf-8?B?WXFKaW8yeGRIemxxK1d3M0RqV2xSdEtHbEdVbjNxazdiR1VKTU1RMWtLNHNR?=
 =?utf-8?B?RVExY0c1WEs0MmFhSXRFMU5SakpVWUkyWHpjZTlGcGFRdTJ2Q2drL3ZYenBE?=
 =?utf-8?B?TmJLb0NvOWcySHRHRy9vcWJzbG0xNmN1bEFTN0YvWm5ZQXJGalRCTUs1ZzZm?=
 =?utf-8?B?TmZMTTJFNlRycCtlSlVtSm1ZRS9zZXZzU2Z0Njl6UG1UNzcydGRzRTVqS2ha?=
 =?utf-8?B?a0tKaHVrT3lkYk00b3Y1SVdTdTdyVkJxbTF2SXNEUzRNQkNRdTFqeEpmMlpw?=
 =?utf-8?B?ZnAra0JDYU52cGN3SnRTZTNuem42ZlpjeWpFUHpUVnNRYXZoL3ZnTGZhZUVL?=
 =?utf-8?B?NkNhWVJMVkswdHpkejBtL1d3MmlkOVFzVTBqSmJ1STBMb1lvL3VvS3JhZG1H?=
 =?utf-8?B?VjMvd1RYSDVUYjFnaTl4ajlYQXNFdUJjNEVLNDZjYy9iMWg1WVVnOW1jRlBh?=
 =?utf-8?B?em5tbDBORlE4bXpUd0l6OFVlYWhZNjIvMWtWa0dUV0UwdWowSG5IeE5Cc2FS?=
 =?utf-8?B?WTlqSWhLOU00LzZ1RVZlZVBjQk5CTEFzT00raE5DKzZ2MGJoNnZGTUFsdklX?=
 =?utf-8?B?K3d5L2NaVzRNaW5oOVdZMy84eU5MWXE1SDZ4ODErMW8ybkU2M3BDVnVRWEt2?=
 =?utf-8?B?YVIyR3FVYXNITExGSVhvTzZ4RlppVEFna0NDR3lYZnlNU1RPN2VHclNHb2Qv?=
 =?utf-8?B?ZjJxSlMycDJUMjJpS1B1Z1I5b2JuUUVvMjlSbFpNTE9lbk0wYzVEMFhkZWgr?=
 =?utf-8?B?TDlrUG96MlZQRlhQUGhCQzZ5RzJ1dmpyRDdXSEZnUzFkalNKcVVWSVBReWVS?=
 =?utf-8?B?ZFh3bXY4WE9JaUl2aWxMVSt0ODRyZVdPN2h4cUhqQW5BdXRpNlJCOWxuMTFF?=
 =?utf-8?B?czdnYldETzNPTWR0TjQ0QTdXczl0U3pZSkM4QXRDZkVUZWV6WEZ5RUNXaU5R?=
 =?utf-8?B?b09QMUpwT0lzQ3J3dnRXR205aUtIMVNJNGlOY0dzeTVZLzdGblJUNy9jZCtu?=
 =?utf-8?B?WmRpS2w2U3dQNCtUMzd4MlJxakVJWHg3YSt5d1EzSVg3YnhQcGkzcEtOTmNC?=
 =?utf-8?B?YVB3b0xyd1BqaDRxY0FuTThsYXVQT205SlVKZUhudG5WdnVhOHI5RHJhVExx?=
 =?utf-8?B?akthVjFnV2lZRzRBQythdzFuMVNIZGxoeC8yNXBJMDhvRHU0MDllQWhtakFa?=
 =?utf-8?B?MjBaWURFdzNUSTBMUGVaa201QTdDZS9BNzR2VVV4SUlLSHgxcDhScTUrQXFv?=
 =?utf-8?B?dXJVbEZNYzd0Zm94WG4zRkVwUkNRUFZIYmM5VHIvTUdta3pyOEg3WlNFSC9L?=
 =?utf-8?B?Q2F6ZnN6cWhMQjc5LytIV041SGdNOG91a3B5TUFQUyt5bUxRV0pabWZFZGxS?=
 =?utf-8?B?WVBZdXl4Zml5TGs0S09WcFdyck1BMW1Zc1BhbjRuN0xqVnlMc0EvemRIYThq?=
 =?utf-8?B?OUZtK1lkMDRZWndvR05Da0ZUU1FrTGVSNE5ybG4ySmh6ekZOZ3VSandXN3lp?=
 =?utf-8?B?SVdhM09XNTZJemFFNDEvbm5oeW5kQ0NqQ3ozcnRwejBUNVRwYWNCc1hmcUF4?=
 =?utf-8?B?TlVvN3pIdGtrTGI3clFZY1VlZm5lTHA5TTlXQlpmY0NuSnJqSWNWanQxSER5?=
 =?utf-8?B?ZDVhU2FQQVB5WjUyQ1U2dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3ZhbVVNUVRtOHZ5WUsxaVlkNHYxM0FKV0RDK0wxNWtEVWdnb2N2N3E0VENZ?=
 =?utf-8?B?WTNvd3dVZ3VMWlhUb0xyVVNwSUlaT0hEOHhGM3dWaWFLVnV2UUVEdG1teXZs?=
 =?utf-8?B?amxYZ1A2c1JONFJqZXBUdjJoMHg2WXhuR1owYjVKcjRBU3ZvRUhZN2JBREVH?=
 =?utf-8?B?czVEUG0zZEQyREZYRkNzQzhWcmNBaUM5TUhoVjdRODZYbG8wN1NJUWlSbzlE?=
 =?utf-8?B?SDJoTEVLdVR1TWlGd2tVZVF3OUFXdzF0dmZZZzhiS0IwQy9aeU4wN2ZnVWNU?=
 =?utf-8?B?Y0pJNE4xZXlCTFIycEh3WWk1Yk0ya25xQTRyblcyOXp4M0thK3N1VkkxeElN?=
 =?utf-8?B?Zjh2ZmZ5Q0xUM2puQ0VnRkFITG5Tdk8ycklFN05FME5rcCtnYmF5b25IaU56?=
 =?utf-8?B?Ui9RTFJXcjhzV2VuVVN4aXZ6M3BKYWhSWnU0dWRubXFQaHJuY0NUUzNyUWwy?=
 =?utf-8?B?QkNNcDdCZy9DaEJwcXRmVWRHazRSM0xVem9QaEpmdHZuYkFRZUk0Q25hc0ph?=
 =?utf-8?B?aFJaR2RoUXA4SmNRaDBkbkNqUEhLZ1Avc3BXYjBmVnZNL05mMDA3QlcwOEx6?=
 =?utf-8?B?NWQ0M1BTWkpRNzJPT0JnS2xicDJWYm8vdXJkWFVLVEtJUjhiaTZ4OXNmcVhr?=
 =?utf-8?B?MUdEZDN4ZDlBOUdSdXhrL0VvSXkwcDQ2NDB1NjJxT3dMTkYrcTFtNGZ4alFP?=
 =?utf-8?B?S0owSzdUQkwvVnd0TDRLMi9NMSs4S2RVQnI0bE1WdVRlVDRGa25PVzBJOVN5?=
 =?utf-8?B?SERQbTgrdEM1cUdiUDJHLzJMVDVTcitMZlV5MGYxaTZoSjhYYmduYVZpZk1s?=
 =?utf-8?B?TGFDY01BSlplSFM0SmdOUE15T2djdithamlheXovZ2lVeVRUK0g0M2xXRVZ3?=
 =?utf-8?B?L3pRd0tqWkExaklOYjRJQTN3cDRkYjJiWmpuUU9BKzNIRXJtUjV0cXRVbjVF?=
 =?utf-8?B?cE9QS0xiWVZ5eDhCcFdEK3FoWU9VdXBxRnUxOGVJUDVJQWNQM0VsZGZNa0Z6?=
 =?utf-8?B?Y0luTE5CUEk2Zi8xamZpcmlOb1N4eHkwUDEyVkhiWXFmVEJqODFTWlk2NzJX?=
 =?utf-8?B?eDVXdHVodnN5Q1dDZkFmQzNyMWFyMHluRElyWW1Uc2RhVEFONFBXdzRmaW1i?=
 =?utf-8?B?RUdVNk5BS0JONXJuNXNoa1RDaDJNeWtBbDZvSkdFZDZqYTBTR3N5K0VtZmZs?=
 =?utf-8?B?VE1mT0RWTG9sTEpXcUtGWlJhdXQvM0dPdVc2cVRhKzMxKzFjbjZTOSs5ZU9W?=
 =?utf-8?B?aFBsZXVna0lpaW5tcTF5aHMzNTVyaThmZlVEcHYzd2Y2S0trVFdlYlovOUtZ?=
 =?utf-8?B?aHFOdkgrNWFlOG5DeUt6R2FFUjdvOEJQV1M5bDJwSzhXT25KSndQcXU0MlQ0?=
 =?utf-8?B?UEplT0Y2SFFoVzBITGtjR09sYW1aT0ovWmZmMG5POUFuOWZGODIwQXdSY2hk?=
 =?utf-8?B?K0xGbUtsMHhZU1UzYVA1NWE1MDlPNjI0ZGtYUEk0a0FwNnlacGRuTjN1YWtD?=
 =?utf-8?B?VFRBN3o0L3RZbjhCalNtVHVXcFpxL1ptZWVpdVdvUzRRQ3JkMk43anFQVDE0?=
 =?utf-8?B?UEQxblQ2Sk5ETWEybGo2Y0hiQVBhdEdmbmh5N1A0NUtaVnhkQ3FXZkRncjhv?=
 =?utf-8?B?akptWlZ3MG9kT2l2RmpUbU9laTdibXBoV0N1ZGpSMjM3OS9DVDZZM3NuV3Ft?=
 =?utf-8?B?WnJVcU5nRVZKRE4vZzh2aHgvc1J3TGhjVElyT0pXWGg3T1lEZ1hIcmNCY0JT?=
 =?utf-8?B?SFpHVXo2aTNaNEdHc2hWYlpkT1dtMk9CN04vMzZXTzVpbk9jQmllVUtlZ2NR?=
 =?utf-8?B?c3A3WFVpYjB1TkNBdEd1Vkp3UnQwY2JwTTI5aUtzMXNWTFZJdW1YMlpmWUIw?=
 =?utf-8?B?cEJPTk1jWlJ6Ym1mL09OTWtCdnpzWGdhVkFsQ3greHZ3amhVMHpLamlrK3VP?=
 =?utf-8?B?T0NWME5iWFlrMmIyY3M4cWpnL0VONnd4bXFYWGJZcUZCaVlDd2FmUVJZY09o?=
 =?utf-8?B?QXFOaGhJbG8vTXBKU1JQM1JVMmRhOGd5bnN3NzVTZ1hqbzB4RVo0YXdWeWNz?=
 =?utf-8?B?NmZmdnlKVndBdFpOejFPeVo1UzUrcU05ZE5aR09XaXZ0T3pneUR2Y3BHVzF4?=
 =?utf-8?Q?JVQNV8Iky656guVqd4O1vn17s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f16b07-a08f-42cf-9f6c-08dd36447daa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 15:43:15.2804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tnab+bshIQOqvEk7SAIeQpP2nJxSeZ54viYscnHyWZzuyT7SeggSEWD05qIK8BsG9KQGU0ZIeyG8mVkq3jCTNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299
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

Hi Kamil,

I have sent the review to Sunil, but we were using the internal review process. I believe Sunil is aware of the build failure, and we discussed how to address it. Until the build failure is resolved and the header is updated or the new code is guarded, we will not proceed with the merge.

Thanks for your help!

Vitaly

On 2025-01-16 06:51, Kamil Konieczny wrote:
> Hi Sunil,
> On 2025-01-16 at 12:22:06 +0530, Sunil Khatri wrote:
>> Add the meta data to support the user mode command
>> submission in the ring_context.
>>
>> User mode command submission methods needs these
>> resources to be initialized and to create/destroy queues.
>>
>> Also once we have the queue created the queue id is
>> used to submit the work load to the h/w.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com>
> Why do you send it here with r-b already added?
> Was is sent in some previous series and got r-b on mailinglist?
> I do not see any info about this in cover letter.
>
> Before merging please address build failures:
>
> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1346611 for the overview.
>
> build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69437776):
>   ../lib/amdgpu/amd_user_queue.c: In function ‘amdgpu_user_queue_destroy’:
>   ../lib/amdgpu/amd_user_queue.c:183:6: error: implicit declaration of function ‘amdgpu_free_userqueue’; did you mean ‘amdgpu_open_devices’? [-Werror=implicit-function-declaration]
>   r = amdgpu_free_userqueue(device_handle, ctxt->queue_id);
>       ^~~~~~~~~~~~~~~~~~~~~
>         amdgpu_open_devices
>   ../lib/amdgpu/amd_user_queue.c:183:6: warning: nested extern declaration of ‘amdgpu_free_userqueue’ [-Wnested-externs]
>   ../lib/amdgpu/amd_user_queue.c: In function ‘amdgpu_user_queue_create’:
>   ../lib/amdgpu/amd_user_queue.c:387:7: error: implicit declaration of function ‘amdgpu_create_userqueue’; did you mean ‘amdgpu_cs_create_semaphore’? [-Werror=implicit-function-declaration]
>   r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
>       ^~~~~~~~~~~~~~~~~~~~~~~
>              amdgpu_cs_create_semaphore
>     ../lib/amdgpu/amd_user_queue.c:387:7: warning: nested extern declaration of ‘amdgpu_create_userqueue’ [-Wnested-externs]
>       cc1: some warnings being treated as errors
>    ninja: build stopped: subcommand failed.
>     section_end:1737012393:step_script
>     section_start:1737012393:cleanup_file_variables
>     Cleaning up project directory and file based variables
>    section_end:1737012394:cleanup_file_variables
>      ERROR: Job failed: exit code 1
>
> Regards,
> Kamil
>
>> ---
>>  lib/amdgpu/amd_ip_blocks.h | 31 +++++++++++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
>> index dc4d87151..9d110d402 100644
>> --- a/lib/amdgpu/amd_ip_blocks.h
>> +++ b/lib/amdgpu/amd_ip_blocks.h
>> @@ -86,6 +86,14 @@ struct dynamic_test{
>>  	bool support_sdma;
>>  };
>>  
>> +struct amdgpu_userq_bo {
>> +	amdgpu_bo_handle handle;
>> +	amdgpu_va_handle va_handle;
>> +	uint64_t mc_addr;
>> +	uint64_t size;
>> +	void *ptr;
>> +};
>> +
>>  #define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
>>  
>>  /* set during execution */
>> @@ -141,6 +149,29 @@ struct amdgpu_ring_context {
>>  	struct amdgpu_cs_ib_info ib_info;     /* amdgpu_bo_list_create */
>>  	struct amdgpu_cs_request ibs_request; /* amdgpu_cs_query_fence_status */
>>  	struct amdgpu_cs_err_codes err_codes;
>> +
>> +	/* User queue resources */
>> +	struct  amdgpu_userq_bo queue;
>> +	struct  amdgpu_userq_bo shadow;
>> +	struct  amdgpu_userq_bo doorbell;
>> +	struct  amdgpu_userq_bo rptr;
>> +	struct  amdgpu_userq_bo wptr;
>> +	struct  amdgpu_userq_bo csa;
>> +	struct  amdgpu_userq_bo eop;
>> +
>> +	uint32_t *queue_cpu;
>> +	uint64_t *wptr_cpu;
>> +	uint64_t *doorbell_cpu;
>> +
>> +	uint32_t db_handle;
>> +	uint32_t queue_id;
>> +	uint32_t npkt;
>> +
>> +	uint32_t timeline_syncobj_handle;
>> +	uint64_t point;
>> +	bool user_queue;
>> +
>> +	struct drm_amdgpu_info_device dev_info;
>>  };
>>  
>>  
>> -- 
>> 2.34.1
>>
