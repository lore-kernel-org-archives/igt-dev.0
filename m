Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A58C3ABBE
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 02:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E4E10E037;
	Fri,  9 May 2025 02:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U/C30fXn";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2065.outbound.protection.outlook.com [40.107.212.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C35B10E037
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 02:41:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YK+8cqKO6krjsxezCQZQTQL1Jx1KuNPb1/RRfxQWinfaMav2hHht6ZD8/Lp2mYSP4eBLUKKxIPtFZBgq2D8kQFN4ND/Inz/p238Vi88x96m2vEPQWQvif7tcZ4wdITrDz7qZiP807kHu2DpQwRDpptgSnfnNY/uAXTmK+/qOStEzSwLtDK5kQ86uc3oTDF4YXESYu5TX60BJsfWgFSGRXwWDaLjatJbzpTRZXmZkLDbX0wiTa6D0C/Si0CCCQ/InQ4xqqgzoQ6nzrVVz0pA3HrRIyQ8GS7hu7o/jTuwbUQoLb08S5tLUMrYxbZ0kE7yZazZ/wd50uHMjVkxVNgRUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHCcIUlQz4+svA0PQbrFbiGyQJmIi+GLKelpfWseuQI=;
 b=cblJf6OLsaCxyXde4ogyx9TnqBbIdxcyegXJfxXEpUIPWgn1Bkw7w6UyXjmZt+wiqnWnvfnhqu2pBFB8TZXC3fvUAQcTPLTvynIjiMaCfnFy7s1kAdH3Iot3ja7p4JOxVG801l0ZIZOJ51RHb2vFuo/fHdFZD8HgLzVZE+SfHroOQ2FYzlXm7MFMRJ1Qzl1WJq2BFZIbSRSGNn+6709aKPHt/DYuBKob0eDRbYg2uG+Ya2NBaBC9clTFkgQNWGu6X0uW4Z6U60Y6fieQeDovP8c78fmCpv2rk/jq1Tac0EWen5xkwUihRl1K4T3mcLHAuilJrKVpiv36MO7sFzqYhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHCcIUlQz4+svA0PQbrFbiGyQJmIi+GLKelpfWseuQI=;
 b=U/C30fXnFfIdw76TDDQzn2zQ30teMmJXkVIBI6YkxAYtIgCnvDbOHeQfSDT1VArsgA6Uhw84R7m8vKpkreiQGZ9lSMgBgMamDOQtNhIZ/bUKKhnDcJBglKw1PuUN2dJDEI0hd5qTZgjbZ75itCl4XvVkp6zr/H3q2K4jGoQt/YA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CH2PR12MB4037.namprd12.prod.outlook.com (2603:10b6:610:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 02:41:17 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 02:41:17 +0000
Message-ID: <993317b3-6e5d-428c-b00c-bdeed84adc97@amd.com>
Date: Thu, 8 May 2025 22:41:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/amdgpu: enhance command submission and
 error handling with user queue support
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
References: <20250508060900.2821847-1-Jesse.Zhang@amd.com>
 <20250508060900.2821847-2-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250508060900.2821847-2-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0163.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::6) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CH2PR12MB4037:EE_
X-MS-Office365-Filtering-Correlation-Id: f88f6275-0fce-4885-2268-08dd8ea2f932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2kvNStmODFNSG9KWmRXVGZzVUxuWlRjMUpYM2pQTjVCOEVLZkM1eU1qYXF6?=
 =?utf-8?B?WlI3d3NZYmR3RzVjYS9heHdDNFBuVitrTCtkRTlrL2d3YkhCaW0ydnp1RzNh?=
 =?utf-8?B?T2ZkOXp3clMrVlMrT3hyekpXV0tZNS8yTk5nakgvNlFabjlFaFRnOGlhazY5?=
 =?utf-8?B?V2V5eFNSWTFVVGUxQjg4QWNKSTNhUDBrSjkwN3dXYXAwYXRUeWRSdXZXUFQ0?=
 =?utf-8?B?TWdIQWsxNTZZdnhnT3o3aUhtUWF2LzV3TVdXQlBMbGlxUGtmOGtDT0t3cWZO?=
 =?utf-8?B?NXVHMUVIeGk0ZzZTR0ZIUUNHZi9FeWJoMmxTWGF4Z0V4a0luc3dUbCtGWmtF?=
 =?utf-8?B?ZTJ4RzJFR1JqeXE0a2xyaVp1N1liSkkvSzNLS2RQV0hoQUFDZW16c2RyNldN?=
 =?utf-8?B?RnNQY1BRZlJnT3ZCUjVZczJ2UGk1cnl2S0tzWmNZZCt0WllHS1ZIMUxOYkpO?=
 =?utf-8?B?aWZQaHc0MVMvUzJrU2xpNEpxaEx6OTMvUUgxT05KL3Z6blBYWkt6WjZTSnhq?=
 =?utf-8?B?MGx1YVZBVG9hL2VqWFJIWHhEd0N2N1QyUzNWSnJhWjVCTTJWNHBMbkNPSFl1?=
 =?utf-8?B?WFdyNWorM2NiN3ZWMGluRkRaWm1QcldEbE0zc2xTZGp3eHNSL05PRy9tNXlw?=
 =?utf-8?B?Wmc3NGlxWm9HL25kZXl1bFdkNU5RMmhKb3RSWGdhL29kdmhPRUt4WWNjclpo?=
 =?utf-8?B?a1FsRWZONkZiZ1FLMGF2cHd4MHh2WHIwVnJhdFVzempDOFNTWERxb1UrVm9w?=
 =?utf-8?B?M3FTRFRuWDFVZEwvS1lmYzlRTWN0elNxby9EanF4K0hPTDJZWGxsR3VXLzNQ?=
 =?utf-8?B?WGxJVWMzeDNxYnhJQXQ3RVcreS80WnJ2c3RLUzJidzlCR2lmM0hPTHRyU05K?=
 =?utf-8?B?QzhFSWhsRUJ6YWhhRkRzdithYk1xQUFuTjZIUkVJMUxTbzA2c1U4dGdJZ08z?=
 =?utf-8?B?VHlmSHpXeC9hVmM1V0tuZzlIL0Rta2hMNmwyaEdHNkNkbUc3V0dzN3d2bkcr?=
 =?utf-8?B?WFdoN0hYQlV5U2kwRHJ4cjFXVTVOK0hSbGRZTWc1MktUNzhudDRidmE4M1Jy?=
 =?utf-8?B?dmZmSGNCWXpSQk1mclpXcFhMUVcxL3NxZ2Myemdvc2EyNHdlQVljTGxtU2tJ?=
 =?utf-8?B?S3VQMDJLbkZFdVFHTUVSbnpPTXdpM21kSG5KRTk4YUxXYTJ5UVJENFJOblRZ?=
 =?utf-8?B?b1M1Zzd6QktZOUZtWEp6WFFuVXRYUlBPalBaV2dVODdsNGd3cEFFVjI3bFBN?=
 =?utf-8?B?WWJlMFZzVVlpVWxqbWJxdW9VN3lkNW5VZXo2NXR6dGlHaGMvNzc1TGZjLzdS?=
 =?utf-8?B?b2M5SDYvZE5wa0hJSWIzS25Zb2x3NEtvZEc1b3lNNDhsdFg4SEZKODdUcWhP?=
 =?utf-8?B?OGcycEFRc2VrdFhwZUtLS2NXVlhLaE1vc1BUeFpOMnBMQ29pQ2NQdG1EeHZr?=
 =?utf-8?B?UC9tSVlnQWlXN0J3eUpEanMyMDBnS3dLa1FNd3h2M2xqQys0Z1JCQ2lSY3d2?=
 =?utf-8?B?UmY4V1pUOUV3OFJXTzBPeXpGSzZXMnNSTnJXZCtzU29qZmp3eUt3MzA0SGI5?=
 =?utf-8?B?c0tFRzFRdVdIenkyYnNQODFuMTRVOVRVRVEzSjllbkdoTmNZV21uTzJXdnN5?=
 =?utf-8?B?cnFDUXFZdXZuOTNJZGQ0MWp4aGdTNnVUdDJibFZCNzF3WHdUb2gwMGlSYk55?=
 =?utf-8?B?WDJpMWNiT2NtQ1ROblM5eGZPZjZzWGJFRFkwR2RhMXRYUldoQUpqQWt5SUdK?=
 =?utf-8?B?TTNCcTUxRG56MngvdFhScFlhU2k0aU82czQ3V3UvdlVPblhGNWpZVGtNdDln?=
 =?utf-8?B?NUdLRG5GUWk1dkR4RXZGakNlckZCcVpuWFl1aDM1QjlHN3ZjREMyWnU3ZWtH?=
 =?utf-8?B?WkxOangyUUdrODZ1d0plc015cXF1b0ZualNiRkkrR0Q3cVVjT2pabjJzaExE?=
 =?utf-8?Q?GreHdioT4vo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3hIY0hjWFp0blRMZ3BDREpmWGRPYkU5R1g3STZiVXUrTWZNQVgrRGU4QmI1?=
 =?utf-8?B?MmVHMkNiYyswalgyRkJPSDhZbEFHeHRTT3I2QmZZWCtVWnpuUG9HS09MSVFG?=
 =?utf-8?B?dXZOSmxaTXppQUFxeWpoQkRuVDhReXkvQUd3SCtPUHQvRjBXY3hzUEE3TU8v?=
 =?utf-8?B?bC9temE3Rk45WVZEbmtpMk1GZHllb3dEcHhxUDdqQ3lJd0ZnbzVuYllXTCs2?=
 =?utf-8?B?L0N0c2YvY25DbitQUTJBOFJPb1l0OE1EeXpyTVVKTzRzcDhldzJTSVAzWVRL?=
 =?utf-8?B?TTJSMmZEaHFVbU1zUkFHQ1ZnVXNod256b2tOeHlPTW9zUWxwV05sTVZabWZI?=
 =?utf-8?B?QjN5YVJ4T1BocWRHZS9BcDAzbGtMSUtiYmVpTXNnSDVwS3dSbjB4Qzd5emFH?=
 =?utf-8?B?TEh1enFsQ2ZqL09aNDhydi9ydkU5c0ljd2pTZHF0aGxMS1pHUUN1UmMydXZx?=
 =?utf-8?B?R0t1RERUOHlJNG8vMHBOdnZabnFiN3Z0WkdhWlRMdlNZK1FzaC9yWFdVOUFG?=
 =?utf-8?B?c1pnempqcGZxczRtV0tmZFBKN2c3ZCttN3JFa2s5R1Z6R0JMRlhmaFVIZDAw?=
 =?utf-8?B?ZDVWbDh6MS9XMG9MT0E0YTFXSXAzWk9pWHh6Z2VzNWYxYlJUZEJrQzRPL2JK?=
 =?utf-8?B?OTQ3cnBDakVwSEVIV3lwbzU1K1FFd0E1MmVDT0pKVzJqQkd0bnJGWkdDbjlh?=
 =?utf-8?B?TlhuOE5lRGR5MDAwQ29iSm5IcVRvS0FoVDVtdFZXaTFMTmJtZGEwN3FYTEw2?=
 =?utf-8?B?QjdObkxNWkgvS3VvckdQRUhYeEJqT1pyWHV6MCtNdTNBODhlRVJJOXRvR3p6?=
 =?utf-8?B?eDR6c0dOU0FSMzZNaHFqampIbXpRN1ZKTHBPU2w0QTJEMVRBK3Q2UmJveVJr?=
 =?utf-8?B?cy8ybXRhdGgzSEROSWFoSVgrQzkwL1F0MEFaL3dLYy93WjdnU2cyYWEvaG05?=
 =?utf-8?B?cVNGSnJ6WGdNQXA3YlNnelk4T1E2RWlaeDdORExWNmsyUWYxOFd2MVgvTWFj?=
 =?utf-8?B?RWYwTGE2VnBMT1FVeEk2a3gxcmduNEFDQ0ZtTXRiU0dTTmNyOEMyL21tRUtw?=
 =?utf-8?B?aEZ3UFhLNGFuK0Z6T3JwY0RyL2lpZFV1ZHl6T1RTam9vTy9uZUxPYnA2U0Fl?=
 =?utf-8?B?R1lYTHUzOE5qU0VaKzdzQStKbkgrZENTd0w2a2NISnc1cWZKNERsT0tnYUZF?=
 =?utf-8?B?c1U0MnhjbGQvd3pPLzJrYXFYNlZpUHpnWXI0UWhBTFE5dGpONERaTmhyRmhR?=
 =?utf-8?B?OXVOd1VUdnI0NC9jYUltSHkxWXV6ZWx3aXBHTCt3aGFuS01ucmY1SmRBR0V1?=
 =?utf-8?B?bjMyclp0NFZ2MG9SeWFnUUF6djNiTmJtSC81VUorK3c0d256UWxEaDAwQm95?=
 =?utf-8?B?R1hBQkJDNzZrRTI0MUpTbEZ6WGgwMmxDSzFIYXV5QW1SZTdiL1M3Wmhzd0Vk?=
 =?utf-8?B?cm9uaGZmTnRxQ0trczUxQ0pSSUpEZjNQajN0MWhNcDN4YVd0U2U2U1Urc2Jh?=
 =?utf-8?B?NnEvOHZFRG15THBJZys0REt4aGJMZGN4RlZoTzdzZjB0aFJibE45eDdvTnpi?=
 =?utf-8?B?bFgycVpwZ3NSWm5xMGpUWjJ2d2FyNXcxRVlFU1RudnljT3E1QTVXT3BhOWxI?=
 =?utf-8?B?N1FZQjNmU0ZVUWtrY0dLUklmTzY3ZzBoUFV4QjliblhqaVN3VHBBaldlRUdn?=
 =?utf-8?B?SDhxWm1ScnJwMksrRE5MRjNkY1dSbm8wZTlYdjZSbGxXL0FVeXJJMC8wdGI2?=
 =?utf-8?B?MjVpMTBzWFNib3RnSTdKMTlzRVNmTmo3NU9Wc0tIcDAzeGNJU28yUEd0NGZE?=
 =?utf-8?B?WnVzWHhETHRJbjhuZitDTEpvTVJYYk5najU3bjk2N3JoRXgxWTZlaHBXcy9H?=
 =?utf-8?B?blBaVnRjNXhPRW1iWTFhVk9wWXVRSnp1MFR2ZW81YnUyUWVVVGY1MjZsM2FL?=
 =?utf-8?B?M1FvMmpabDN2cEl6RzIzMWxtNy91SnZmaXdoQkdFVG1GUm40OUx5WUlIOVJp?=
 =?utf-8?B?TVBYNzF6REFRSEE4SzlrVDgrbFBXNW83SzVJTTdMZUFaZHlqL1ZxcUp5dVhM?=
 =?utf-8?B?S2RydFE5bHQyUUNORUxPeVRyYWhtTlJ5Z3NWaWJuUHRUSUlNeGs4VnlOZ3R2?=
 =?utf-8?Q?ujvbQ5c7slxsLoZM4Ol01uxWg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f88f6275-0fce-4885-2268-08dd8ea2f932
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 02:41:17.4546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMsvm5aKb53amFnwIFU7TuFnMfvMO+SmeFdTBmV+qsEdnhyGuScbbK87mJN0wgYAW4vdryUJ+c5VX89WTbHn0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4037
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

The change looks good to me

Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-05-08 02:07, Jesse.Zhang wrote:
> This patch introduces several improvements to AMDGPU command submission
> and error handling infrastructure:
>
> 1. Fixed typos in time_out field initialization (rint_context -> ring_context)
>    across multiple helper functions.
>
> 2. Enhanced bad_access_helper() to support user queues:
>    - Added user_queue parameter to control submission path
>    - Implemented separate handling for user queue vs legacy path
>    - Added proper timeout initialization
>    - Used sync object based buffer allocation (amdgpu_bo_alloc_and_map_sync)
>    - Added timeline syncobj wait after user queue operations
>
> 3. Updated bad_access_ring_helper() to:
>    - Accept user_queue parameter
>    - Skip ring iteration for user queues (hardware scheduled)
>    - Add version check for user queue support
>    - Pass user_queue flag to bad_access_helper()
>
> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
> Cc: Sunil Khatri <sunil.khatri@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alexander Deucher <alexander.deucher@amd.com>
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 54 ++++++++++++++++++++++++-------
>  lib/amdgpu/amd_deadlock_helpers.h |  2 +-
>  2 files changed, 43 insertions(+), 13 deletions(-)
>
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index c8a48930e..f52bf70e5 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -12,6 +12,7 @@
>  #include <signal.h>
>  #include "amd_memory.h"
>  #include "amd_deadlock_helpers.h"
> +#include "lib/amdgpu/amd_userq.h"
>  #include "lib/amdgpu/amd_command_submission.h"
>  
>  #define MAX_JOB_COUNT 200
> @@ -274,7 +275,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
>  
>  static void
>  bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
> -			unsigned int ip_type, uint32_t priority)
> +			unsigned int ip_type, uint32_t priority, bool user_queue)
>  {
>  
>  	const struct amdgpu_ip_block_version *ip_block = NULL;
> @@ -287,10 +288,14 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
>  	ring_context = calloc(1, sizeof(*ring_context));
>  	igt_assert(ring_context);
>  
> -	if (priority == AMDGPU_CTX_PRIORITY_HIGH)
> -		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &ring_context->context_handle);
> -	else
> -		r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
> +	if (user_queue) {
> +		amdgpu_user_queue_create(device_handle, ring_context, ip_type);
> +	} else {
> +		if (priority == AMDGPU_CTX_PRIORITY_HIGH)
> +			r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &ring_context->context_handle);
> +		else
> +			r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
> +	}
>  	igt_assert_eq(r, 0);
>  
>  	/* setup parameters */
> @@ -299,16 +304,28 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
>  	ring_context->pm4_size = pm4_dw;
>  	ring_context->res_cnt = 1;
>  	ring_context->ring_id = 0;
> +	ring_context->user_queue = user_queue;
> +	ring_context->time_out = 0x7ffff;
>  	igt_assert(ring_context->pm4);
>  	ip_block = get_ip_block(device_handle, ip_type);
> -	r = amdgpu_bo_alloc_and_map(device_handle,
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle,
>  				    ring_context->write_length * sizeof(uint32_t),
>  				    4096, AMDGPU_GEM_DOMAIN_GTT,
> -					AMDGPU_GEM_CREATE_CPU_GTT_USWC, &ring_context->bo,
> +				    AMDGPU_GEM_CREATE_CPU_GTT_USWC,
> +				    AMDGPU_VM_MTYPE_UC,
> +				    &ring_context->bo,
>  				    (void **)&ring_context->bo_cpu,
>  				    &ring_context->bo_mc,
> -				    &ring_context->va_handle);
> +				    &ring_context->va_handle,
> +				    ring_context->timeline_syncobj_handle,
> +				    ++ring_context->point, user_queue);
>  	igt_assert_eq(r, 0);
> +	if (user_queue) {
> +		r = amdgpu_timeline_syncobj_wait(device_handle,
> +			ring_context->timeline_syncobj_handle,
> +			ring_context->point);
> +		igt_assert_eq(r, 0);
> +	}
>  
>  	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length * sizeof(uint32_t));
>  	ring_context->resources[0] = ring_context->bo;
> @@ -320,8 +337,12 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
>  
>  	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
>  				 ring_context->write_length * sizeof(uint32_t));
> -	free(ring_context->pm4);
> -	free(ring_context);
> +	if (user_queue) {
> +		amdgpu_user_queue_destroy(device_handle, ring_context, ip_block->type);
> +	} else {
> +		free(ring_context->pm4);
> +		free(ring_context);
> +	}
>  }
>  
>  #define MAX_DMABUF_COUNT 0x20000
> @@ -419,7 +440,7 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
>  	free_cmd_base(base_cmd);
>  }
>  
> -void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci)
> +void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci, bool user_queue)
>  {
>  	int r;
>  	FILE *fp;
> @@ -436,6 +457,15 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>  	if (!info.available_rings)
>  		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
>  
> +	if (user_queue) {
> +		if (info.hw_ip_version_major < 11) {
> +			igt_info("SKIP ... as user queueu doesn't support %d\n", ip_type);
> +			return;
> +		}
> +		/* No need to iterate each ring, user queues are scheduled by hardware */
> +		bad_access_helper(device_handle, cmd_error, ip_type, prio, user_queue);
> +		return;
> +	}
>  	support_page = is_support_page_queue(ip_type, pci);
>  	if (ip_type == AMD_IP_GFX)
>  		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
> @@ -505,7 +535,7 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>  			igt_assert_eq(r, 0);
>  		}
>  
> -		bad_access_helper(device_handle, cmd_error, ip_type, prio);
> +		bad_access_helper(device_handle, cmd_error, ip_type, prio, user_queue);
>  	}
>  
>  	/* recover the sched mask */
> diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
> index 1d654c490..fdbeb409c 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.h
> +++ b/lib/amdgpu/amd_deadlock_helpers.h
> @@ -29,7 +29,7 @@
>  void
>  amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci);
>  void
> -bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci);
> +bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci, bool user_queue);
>  
>  void
>  amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type, struct pci_addr *pci);
