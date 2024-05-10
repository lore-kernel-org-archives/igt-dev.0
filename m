Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416C7C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 07:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EB710E00C;
	Fri, 10 May 2024 07:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MK+37tzE";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8601010E00C
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 07:23:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjMzRiGbLjtkaAcNmayjWGSzTVz5NGgF7mewbIm3W+qPsmudH71RmEbZTgSv4fC0bpffIOvOBEv97uIqpyjHuIL2l2jAlSdUU12M26C4Zn7lNiZ/2PH0WGXzZ+w48x8KlWV4fKw99fgSJM3k2QDhQuv6/HdjhwuUH8/WUsGa2c265otYZh8gckjxqQgPVTMsji0hEBM0lNoFb1c6fHgIifmsuvkFPfJhK1lpeiN3zp2M15Opl9MPCgCbJDAqVsSeGyjyGN+OnnpyijHeBGOsMAWGkJS4AsgOqHpNhkptvWjddzmG9uL+Q42vyY+zrRBYwbzEVD4AARl79fIost9XXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRPbZrI7ezFuZ7E1fAKM7Yz38m1TWoJgO+f39G5bLM4=;
 b=TMULp0AqyaWKcneZTNOzO6tw5opG+pIFF6SRjTUf7ytyyEn6h4fatemQgXXTer3Bpw6XRhavbb5a4lSNhobP51z/vAU2hmBnsA3/HQi1/UNezwop7JkJoor6uqGZyp0g3Mj/EPpRWSmlzDdB5Jb1FV3Epb6EUsUTlbKxIttJlmCWqcvFdnE6sEsNLX6uqSbz6F4oma4roMTBqm7bozF8bszPz/+tQnPQt/I3R3JwscjqY+OciccC8MDpIuOjivE6YHtW3oU2sRjiYnKMpCA+z/rNO3A9QGczNuPhy1qGaECj63F+gJddomhWKP3N7LmtziJ7hmdnVRu9QaGiBvpYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRPbZrI7ezFuZ7E1fAKM7Yz38m1TWoJgO+f39G5bLM4=;
 b=MK+37tzEaC+f/u5XP6wO4ZYpiAz8qYIdhp3V+q7mL/T/xcgtVqLBSbEkekGETahJyAQutuz65BFJnEvxrtJZCpECkm+LxR0Lbo4pFU3FDvve5jbOOmvUhc3/gqkCjFVrj17qTs/a+OxYsuG/sjwYmoInTFMs+PjQB4DLn06lzbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11)
 by DM4PR12MB9069.namprd12.prod.outlook.com (2603:10b6:8:b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Fri, 10 May
 2024 07:23:35 +0000
Received: from PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::76d1:e471:c215:4381]) by PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::76d1:e471:c215:4381%4]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 07:23:35 +0000
Content-Type: multipart/alternative;
 boundary="------------kpV36r0nUKBmH8yrW1wG7mSt"
Message-ID: <3a8368a6-5001-4926-9df5-436f7511cf14@amd.com>
Date: Fri, 10 May 2024 15:23:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_replay: Add amd_replay IGT test
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Rodrigo.Siqueira@amd.com, alex.hung@amd.com,
 sunpeng.li@amd.com
References: <20240503090854.13663-1-chiahsuan.chung@amd.com>
 <20240506170532.gekeyla3d2vd2x7n@kamilkon-DESK.igk.intel.com>
From: "Chung, ChiaHsuan (Tom)" <chiahsuan.chung@amd.com>
In-Reply-To: <20240506170532.gekeyla3d2vd2x7n@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To PH7PR12MB6611.namprd12.prod.outlook.com
 (2603:10b6:510:211::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6611:EE_|DM4PR12MB9069:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d2ee51-c07f-4197-608f-08dc70c21aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGY2bGg3eWZsZlhmOHNEcWUreStJb1IySlAzNTJBdDVZWTNXMms0dTZsU0kw?=
 =?utf-8?B?S255Z21SR1R4V21hcGhBNURnMy9aTE1XZDVIOEhibktKMXFYR0NNbzFUOXM1?=
 =?utf-8?B?NVBXZW9lN3NUOTNPbzl3RDNydFRUZkJTMUp3SEljN2Flc1FvSFBZNnJ2UmVv?=
 =?utf-8?B?eVd5b096TDgvKzVXZVN0alNvV05yRkN5M1Q1UFB1WnAzWUxOQmFlSGZ6bS90?=
 =?utf-8?B?bTZsQks3bVN2S1l5bG1GNVpnT05nOVRWckFwRlBWd3ordSs4RTE5cTNPc1pr?=
 =?utf-8?B?VXdsU0xpYXFTRGJmaGo2d3FuZE9aR2ZacnVqNTc0YzdKeUxmejloenRCUmFh?=
 =?utf-8?B?ZFRVN2cyTk1qWm8vSGgycWlMbWJMa0g2Y1c1eVhJSGRRUnd4RDdNS1BZeWdr?=
 =?utf-8?B?bk1FKy9MQk90RE1DRkRjWFJNZHNveHVHZWxwUjJUU1FVNUlTQ2Vsa3BwRmVQ?=
 =?utf-8?B?TGxFT29ZUUdQNmp0SkF4a0VadUgvcTRSZmFmczdvTlQ2RGE5M2I4N3U4YXR6?=
 =?utf-8?B?cEZXMm9hQlVtRkQyVjVRN2MzNWVKSEF2bnNZNU9xSUJmeGloNlV5eGJxVjZM?=
 =?utf-8?B?eW12OE42a2hwVHhsNi9vc3pGWHNSb0hFU1c5ZHFLbEcwRUxJNmQ2R2JHWGFZ?=
 =?utf-8?B?NVNwY0d5eHdkd0VOUjlVRHU5eUVrWkFKTUtoZWxMUlFyQU9rWGhIenBPT1My?=
 =?utf-8?B?aXpwTUpyaHFRMW8xa1BFVzgzRHIyUjBLaTJlWldXSXFMZ1FBeXFKdGx4RXNt?=
 =?utf-8?B?ZG5ZNXFZYVF2TXFzbisyekpvTHQzQXhoMEdLYzRUS2xvbEQ3TzJHWlh3Y2d5?=
 =?utf-8?B?d3dsWFNmRDdjWGNHamV5bzM1dGJNeTZqRWIrcEt5SVR5dGZ1cnNWNmgxdWZq?=
 =?utf-8?B?RWdvZFAwdWxKRGswZlFjRGs0MHhLSVQ3WWphdGZPOE1NTHlQQU5Pa243VDVW?=
 =?utf-8?B?R2lpN29WV3V0bHJCY0VBRWVUTzBQS0wvc2x5NGxIYjFjby9wR2Z5Z1FlSTVL?=
 =?utf-8?B?THBvNFI1VG4xRm9rOTZJQ3c0Yk9uU3VqU2NPa1RVcXpLU3Zrb0tNa3NqQjVl?=
 =?utf-8?B?UVUvbFFkd3NQTGtHeHUreE1nZjcyRGJzRC9VUldJWElrcTN0cFFVWjA1TTBX?=
 =?utf-8?B?V05hdVo2Tm1kMW5jQ3lQWjZrTzlUMjdidTMzZGx1aC93Vzl0UFVZVlc4QVIr?=
 =?utf-8?B?SlpXYUpKWER3NHc4V1J4eDZLL0ZiU3FBM0pSVUR6cmV0bjB5ZXIvL29tRitw?=
 =?utf-8?B?REdUVm8wK3R3eDNkQVgyb3ByY0JHVVVRUVhXMEFsZCtXeUdrUUh6VjZoakxH?=
 =?utf-8?B?WkIrQm1rdVd5eTVLbnFUbFUydDBlM1NTcG9pMXpkbEdJeVphY05YaWFtNFJ2?=
 =?utf-8?B?RGZ6dlNOSVM0cURuRWhORk1YZHVpZ2piMzIvUENOSW1KMnVhY0xRUk0zVDgx?=
 =?utf-8?B?Q2pZWkswSHN6Q3NrVmZmbU03VjY4TWllNkNpbFQ0RE8wQ2piNnFGMS93UHpO?=
 =?utf-8?B?bUllU01TV0c2eWdtSUVabTdQYmF4aU5Mc2hMMTMyd3RBdlhEazYwcy9TdjdE?=
 =?utf-8?B?eFpmTlNiVUY0U0t0WEhUMjkzTUgrQVZlMDg4NlRVVU1WQVZUa2UwSmhtUDNG?=
 =?utf-8?B?Q0pkQnhzbkNnTXRqbGIwdS9UamdieHY5K2VJdk9YYnlHYUJQd1lMbXdlb3pv?=
 =?utf-8?B?ZlIxSXVhMytlKzhZYW85TVRNSFN1RWVvVFJHdGwveEZaS2V3Q2pWTkFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6611.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3d4R1VnTGFlZ0pqY0trbk02bkx1RS82QXovTWsyNkFwQm5mdWpkM2F4dDRG?=
 =?utf-8?B?V0lrS1gva3JxQ0NmOTg0UFQvbGZXQ1BURGMvT240bEJnbFJKZEpnWmluQ25y?=
 =?utf-8?B?NStGUktxRkFxYnh1R3MwZVZ6SEE2YXBUL2RxRjEzeU8yQ3hvSFhKYmRIQWJa?=
 =?utf-8?B?TnRyREh0bnRWSGhna05vUUdQa1F3MVB2L1JjZDdJRGdjRTRDeGE0dkdvTDdY?=
 =?utf-8?B?NU9kaGJYWmZMRmZMNk5NVlg0RzhsUWJ0VG81bndFdmo4bll5am42cnJ6UXcr?=
 =?utf-8?B?SHZNVVMrMHpvdElTdlFlenBEUWR4UUxRMUxlVUk2SmlIcitEM1hoaEtSV0Rt?=
 =?utf-8?B?bEhUZEFEemJNK0xBV0tIbnBPRjludkUxWXZ1b3hySWZNeWVlaVpxbVA3UC9o?=
 =?utf-8?B?M3ZsZW9SOFc5d0ZLL1lxQ2pYM3V1SVRGMmU0SERLT01WVzBLT2UraVFQM3Iv?=
 =?utf-8?B?aE5mbm4weW9kMDRjSFBYcFBwRVZNTFZpdzUzMFc4VjQzTktEMWxRZWhKMUl5?=
 =?utf-8?B?RXZGcHIyTkdqRDl5TEJKL0crRDlUN20xeG1Qc2U4bHJGSWZ0RGpLc2lCZ1Fr?=
 =?utf-8?B?M0VOeFloMytNSHBNWUt0ci9HTU5NSTZoZEZYbHl4WXh4N2dSYjRKWldaWCtB?=
 =?utf-8?B?ZG00SlByKzhuaXNhcThucUNlUVljelAxcWpNci9BK3hnZzltdVJwNXl1NFJR?=
 =?utf-8?B?cG0wMFpKeHc4K0U5OGpiRmppNmFxSGJ0R3Z0RGZNQXBXeS93QWNUV0UxVTFj?=
 =?utf-8?B?cmJidUdWd3ZhL21jWHhnOHlLVEN3TzJabHlOY0tGUkF4TTFSU0E5c3EvVHgy?=
 =?utf-8?B?ZnZ3Qmd4UnF0UVgvS1MwZnRmelpMZU9UcFA5bGw0M2Q0ZGJMZEhZQkhjZkk2?=
 =?utf-8?B?cWdPWWljMG1WdEE5QTdHRG5HN2dQcjdHNEJhMDZkQzRtRWhGRHpWMlQyZHI5?=
 =?utf-8?B?ODBWMmtaVzR0ZWFuTjRFTi9pYm9VenorRDRsSkZUTHlqekJrTzROLzIrcnd3?=
 =?utf-8?B?bld0bXhJM1VmN2QweXVqOW5vQXFNQUc1Z09kZ0hpQWtramJTa0xBOVgxNmhT?=
 =?utf-8?B?anlxaEVubUxHbSt0VXY3UmpnZXBleHdzQ2pjRldvSmltV3ZSSDhvUnJESkdu?=
 =?utf-8?B?QlpZN1VRQ1g5MFlCTWRFTGQ3UDFoSy9PVjhJYy9razdhNXJ1ZjVhaC9qOVRp?=
 =?utf-8?B?RG5ZMlJsa1FwbmtTU1JUUndxSVpqaEI0VUNxVDM1NWxzVjRlTlc3WnJvTUxq?=
 =?utf-8?B?engxbW5Jcm15THFiZ1BJR2s4OGpHa0RmZlpIRC9PSUpKcWNxZ2NIUjY0S0lF?=
 =?utf-8?B?QW5zbEUwRVd1YUhiRXIydFJXZnl0eVFoVGRybGN1ZmsvRzVBRE0zcm10TjFu?=
 =?utf-8?B?M21tbkFRbStXRlNBaE4xWDFpUWdVYlplYW9hQzc0QzlUajZJUlRZSDlFQUdx?=
 =?utf-8?B?alU2SVU0elN2OFE4RVNFeE1lZnFWSkYyNUhZaS9QazhpM01wVkRIUlhGWTdo?=
 =?utf-8?B?SmtTNm5MSm1WOUFwbkcxbW5tazF1OFBmaDJ3bkFLS2pjMUlQQllGOExKMHlW?=
 =?utf-8?B?K2ZEeUNDSElhUVZDU3AyZy91MkFNd0dFTnBocWFFNnIwTWtSMExYRkVQZVhw?=
 =?utf-8?B?SjFmYnFkcU1PREV3RmpKTTZYUVl3MGZQUFB2THFyZnJpKytZOCtOemhaRndG?=
 =?utf-8?B?ZkNXaWJsMkQ4Yjg4VlZLYWxyOVdKalAxMEhEUmR2bFNPMWNJQ0tMRUlOM1lK?=
 =?utf-8?B?RTkwRnZLSzBOSG9qLzZvdVZ5UUYxdXRkZm9DQ0UvRGdBZDVlYWhFMHdSNEJO?=
 =?utf-8?B?Ty9OVEsrYldwY05uLzVLZVJSVzVnUWQ4WThOS2taQVRBRS9iWXZLRGpsQUNh?=
 =?utf-8?B?QXRpVUQ1Y1J3cUpYQTRZeFNNTTd3TTcwa0N0NlpFRTR3VVR1akxES3BNcjd6?=
 =?utf-8?B?NnpSNERVdURWam9EWjV3YnQ4bVZPdUJHVG9ERWxrVDNvWGZpd0w0T3J4emQ4?=
 =?utf-8?B?NkxXL05tM3U3MndiUmJRc1BQaVBjZEZNRS8vRmVXNEk3Sy9uMThYbm5BSUNo?=
 =?utf-8?B?RkxwdDB5WGhkRWF2c3lkbDQvK1ZnbXZsMUF6aUU3RitaRmIwTjIxN0hsVi9x?=
 =?utf-8?Q?bubNGfCNEVkrji6Kisa7Kk9X3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d2ee51-c07f-4197-608f-08dc70c21aae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6611.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 07:23:35.6114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1swldV+mR9w+xQT/J6GKIa6Vh9s7iJFCJsqTsM2mySMYU2JB5h1BhivO8pY4M3kIlJCFdVs6MJaHHxDL2AiWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9069
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

--------------kpV36r0nUKBmH8yrW1wG7mSt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

HiKamil,

Thanks for the comment. I just updated a v2 version to fix it.

Regards,
Tom

On 5/7/2024 1:05 AM, Kamil Konieczny wrote:
> Hi Tom,
> On 2024-05-03 at 17:08:54 +0800, Tom Chung wrote:
>
> I have few small nits, see below.
>
>> [why]
>> Add a basic IGT test for panel replay feature.
>>
>> [how]
>> Subtest case
>>
>> a. static screen
>>     1. Check if system support panel replay.
>>     2. Start video flip for a while.
>>     3. Stop video flip and wait for a while.
>>     4. Check if replay state is in Replay mode.
>>
>> b. Live mode (intermittent)
>>     1. Check if system support panel replay.
>>     2. Start video flip for a while.
>>     3. Check if replay state is in Live mode.
>>     4. Stop video flip and wait for a while.
>>     5. Check if replay state is in Replay mode.
>>     6. Repaet 2 to 5.
>>
>> c. Live mode (constant)
>>     1. Check if system support panel replay.
>>     2. Start video flip for a while.
>>     3. Check if replay state is in Live mode.
>>
>> Signed-off-by: Tom Chung<chiahsuan.chung@amd.com>
>> ---
>>   lib/igt_amd.c             | 102 ++++++++++++
>>   lib/igt_amd.h             |  39 ++++-
>>   tests/amdgpu/amd_replay.c | 325 ++++++++++++++++++++++++++++++++++++++
>>   tests/amdgpu/meson.build  |   1 +
>>   4 files changed, 466 insertions(+), 1 deletion(-)
>>   create mode 100755 tests/amdgpu/amd_replay.c
>>
>> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
>> index 149af5151..8bc6fdc6a 100644
>> --- a/lib/igt_amd.c
>> +++ b/lib/igt_amd.c
>> @@ -1014,6 +1014,108 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
>>   	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_ILR_SETTING);
>>   }
>>   
>> +/**
>> + * igt_amd_output_has_replay_cap: check if eDP connector has replay_capability debugfs entry
>> + * @drm_fd: DRM file descriptor
>> + * @connector_name: The connector's name, on which we're reading the status
>> + */
>> +bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name)
>> +{
>> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_CAP);
>> +}
>> +
>> +/**
>> + * igt_amd_replay_support_sink: check if sink device support Panel Replay
>> + * @drm_fd: DRM file descriptor
>> + * @connector_name: The connector's name, on which we're reading the status
>> + */
>> +bool igt_amd_replay_support_sink(int drm_fd, char *connector_name)
>> +{
>> +	char buf[128];
>> +	int ret;
>> +	int fd;
>> +
>> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
>> +	if (fd < 0) {
>> +		igt_info("output %s: debugfs not found\n", connector_name);
>> +		return false;
>> +	}
>> +
>> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
>> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
>> +		DEBUGFS_EDP_REPLAY_CAP, connector_name);
>> +	close(fd);
>> +
>> +	if (ret < 1)
>> +		return false;
>> +
>> +	return strstr(buf, "Sink support: yes");
>> +}
>> +
>> +/**
>> + * igt_amd_replay_support_drv: check if driver support Panel Replay
>> + * @drm_fd: DRM file descriptor
>> + * @connector_name: The connector's name, on which we're reading the status
>> + */
>> +bool igt_amd_replay_support_drv(int drm_fd, char *connector_name)
>> +{
>> +	char buf[128];
>> +	int ret;
>> +	int fd;
>> +
>> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
>> +	if (fd < 0) {
>> +		igt_info("output %s: debugfs not found\n", connector_name);
>> +		return false;
>> +	}
>> +
>> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
>> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
>> +		DEBUGFS_EDP_REPLAY_CAP, connector_name);
>> +	close(fd);
>> +
>> +	if (ret < 1)
>> +		return false;
>> +
>> +	return strstr(buf, "Driver support: yes");
>> +}
>> +
>> +/**
>> + * igt_amd_output_has_replay_state: check if eDP connector has replay_state debugfs entry
>> + * @drm_fd: DRM file descriptor
>> + * @connector_name: The connector's name, on which we're reading the status
>> + */
>> +bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name)
>> +{
>> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_STATE);
>> +}
>> +
>> +/**
>> + * @brief Read Panel Replay State from debugfs interface
>> + * @param drm_fd DRM file descriptor
>> + * @param connector_name The connector's name, on which we're reading the status
>> + * @return Panel Replay state as integer
>> + */
>> +int igt_amd_read_replay_state(int drm_fd, char *connector_name)
>> +{
>> +	char buf[4];
>> +	int fd, ret;
>> +
>> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
>> +	if (fd < 0) {
>> +		igt_info("Couldn't open connector %s debugfs directory\n", connector_name);
>> +		return -1;
>> +	}
>> +
>> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_STATE, buf, sizeof(buf));
>> +	close(fd);
>> +
>> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
>> +		DEBUGFS_EDP_REPLAY_STATE, connector_name);
>> +
>> +	return strtol(buf, NULL, 10);
>> +}
>> +
>>   /**
>>    * igt_amd_output_has_psr_cap: check if eDP connector has psr_capability debugfs entry
>>    * @drm_fd: DRM file descriptor
>> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
>> index 6780b99de..a41b423b7 100644
>> --- a/lib/igt_amd.h
>> +++ b/lib/igt_amd.h
>> @@ -47,6 +47,8 @@
>>   #define DEBUGFS_EDP_ILR_SETTING "ilr_setting"
>>   #define MAX_SUPPORTED_ILR 8
>>   #define MULTIPLIER_TO_LR 270000
>> +#define DEBUGFS_EDP_REPLAY_CAP "replay_capability"
>> +#define DEBUGFS_EDP_REPLAY_STATE "replay_state"
>>   #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
>>   #define DEBUGFS_EDP_PSR_STATE	"psr_state"
>>   #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
>> @@ -100,6 +102,35 @@ enum dc_link_training_type {
>>   	LINK_TRAINING_NO_PATTERN
>>   };
>>   
>> +/*
>> + * enumeration of REPLAY STATE below should be aligned to the upstreamed
>> + * amdgpu kernel driver 'enum replay_state' in dmub_cmd.h
>> + */
>> +enum replay_state {
>> +	REPLAY_STATE_0 = 0x0,
>> +	REPLAY_STATE_1 = 0x10,
>> +	REPLAY_STATE_1A = 0x11,
>> +	REPLAY_STATE_2 = 0x20,
>> +	REPLAY_STATE_3 = 0x30,
>> +	REPLAY_STATE_3INIT = 0x31,
>> +	REPLAY_STATE_4 = 0x40,
>> +	REPLAY_STATE_4A = 0x41,
>> +	REPLAY_STATE_4B = 0x42,
>> +	REPLAY_STATE_4C = 0x43,
>> +	REPLAY_STATE_4D = 0x44,
>> +	REPLAY_STATE_4B_LOCKED = 0x4A,
>> +	REPLAY_STATE_4C_UNLOCKED = 0x4B,
>> +	REPLAY_STATE_5 = 0x50,
>> +	REPLAY_STATE_5A = 0x51,
>> +	REPLAY_STATE_5B = 0x52,
>> +	REPLAY_STATE_5A_LOCKED = 0x5A,
>> +	REPLAY_STATE_5B_UNLOCKED = 0x5B,
>> +	REPLAY_STATE_6 = 0x60,
>> +	REPLAY_STATE_6A = 0x61,
>> +	REPLAY_STATE_6B = 0x62,
>> +	REPLAY_STATE_INVALID = 0xFF
>> +};
>> +
>>   /*
>>    * enumeration of PSR STATE below should be aligned to the upstreamed
>>    * amdgpu kernel driver 'enum dc_psr_state' in dc_type.h
>> @@ -135,7 +166,8 @@ enum amdgpu_debug_visual_confirm {
>>   	VISUAL_CONFIRM_HDR	= 2,
>>   	VISUAL_CONFIRM_MPCTREE	= 4,
>>   	VISUAL_CONFIRM_PSR	= 5,
>> -	VISUAL_CONFIRM_SWIZZLE	= 9
>> +	VISUAL_CONFIRM_SWIZZLE  = 9,
>> +	VISUAL_CONFIRM_REPLAY = 12
>>   };
>>   
>>   uint32_t igt_amd_create_bo(int fd, uint64_t size);
>> @@ -189,6 +221,11 @@ void igt_amd_write_ilr_setting(
>>   	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
>>   	uint8_t link_rate_set);
>>   bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
>> +bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name);
>> +bool igt_amd_replay_support_sink(int drm_fd, char *connector_name);
>> +bool igt_amd_replay_support_drv(int drm_fd, char *connector_name);
>> +bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name);
>> +int  igt_amd_read_replay_state(int drm_fd, char *connector_name);
>>   bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
>>   bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mode);
>>   bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode);
>> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
>> new file mode 100755
>> index 000000000..61894cd84
>> --- /dev/null
>> +++ b/tests/amdgpu/amd_replay.c
>> @@ -0,0 +1,325 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright 2024 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include "drm_mode.h"
>> +#include "igt.h"
>> +#include "igt_core.h"
>> +#include "igt_kms.h"
>> +#include "igt_amd.h"
> ------------- ^^^^^^
> This should be before igt_core.h
>
>> +#include <stdint.h>
>> +#include <fcntl.h>
>> +#include <xf86drmMode.h>
> These should be before igt headers.
>
> Regards,
> Kamil
>
>> +
>> +/* hardware requirements:
>> + * eDP panel that supports Panel Replay
>> + */
>> +IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
>> +
>> +#define REPLAY_SETTLE_DELAY 10
>> +
>> +/* Common test data. */
>> +struct test_data {
>> +	igt_display_t display;
>> +	igt_plane_t *primary;
>> +	igt_output_t *output;
>> +	igt_pipe_t *pipe;
>> +	drmModeModeInfo *mode;
>> +	enum pipe pipe_id;
>> +	int fd;
>> +	int debugfs_fd;
>> +	int w, h;
>> +};
>> +
>> +struct {
>> +	bool visual_confirm;
>> +} opt = {
>> +	.visual_confirm = false,	/* visual confirm debug option */
>> +};
>> +
>> +const char *help_str =
>> +"  --visual-confirm           Panel Replay visual confirm debug option enable\n";
>> +
>> +struct option long_options[] = {
>> +	{"visual-confirm",	required_argument, NULL, 'v'},
>> +	{ 0, 0, 0, 0 }
>> +};
>> +
>> +enum test_mode {
>> +	TEST_MODE_STATIC_SCREEN = 0,
>> +	TEST_MODE_INTERMITTENT_LIVE,
>> +	TEST_MODE_CONSTANT_LIVE,
>> +	TEST_MODE_COUNT
>> +};
>> +
>> +/* Common test setup. */
>> +static void test_init(struct test_data *data)
>> +{
>> +	igt_display_t *display = &data->display;
>> +
>> +	/* It doesn't matter which pipe we choose on amdpgu. */
>> +	data->pipe_id = PIPE_A;
>> +	data->pipe = &data->display.pipes[data->pipe_id];
>> +
>> +	igt_display_reset(display);
>> +
>> +	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
>> +	igt_require(data->output);
>> +	igt_info("output %s\n", data->output->name);
>> +
>> +	data->mode = igt_output_get_mode(data->output);
>> +	igt_assert(data->mode);
>> +	kmstest_dump_mode(data->mode);
>> +
>> +	data->primary =
>> +		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>> +
>> +	igt_output_set_pipe(data->output, data->pipe_id);
>> +
>> +	data->w = data->mode->hdisplay;
>> +	data->h = data->mode->vdisplay;
>> +
>> +	if (opt.visual_confirm) {
>> +		/**
>> +		 * if visual confirm option is enabled, we'd trigger a full modeset before test run
>> +		 * to have Panel Replay visual confirm enable take effect. DPMS off -> ON transition
>> +		 * is one of many approaches.
>> +		 */
>> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
>> +				DRM_MODE_DPMS_OFF);
>> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
>> +				DRM_MODE_DPMS_ON);
>> +	}
>> +}
>> +
>> +/* Common test cleanup. */
>> +static void test_fini(struct test_data *data)
>> +{
>> +		igt_display_t *display = &data->display;
>> +
>> +		igt_display_reset(display);
>> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>> +}
>> +
>> +static int check_conn_type(struct test_data *data, uint32_t type)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < data->display.n_outputs; i++) {
>> +		uint32_t conn_type = data->display.outputs[i].config.connector->connector_type;
>> +
>> +		if (conn_type == type)
>> +			return i;
>> +	}
>> +
>> +	return -1;
>> +}
>> +
>> +static bool replay_mode_supported(struct test_data *data)
>> +{
>> +	/* run Panel Replay test if eDP panel support Panel Replay */
>> +	if (!igt_amd_output_has_replay_cap(data->fd, data->output->name)) {
>> +		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_CAP);
>> +		return false;
>> +	}
>> +
>> +	if (!igt_amd_output_has_replay_state(data->fd, data->output->name)) {
>> +		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_STATE);
>> +		return false;
>> +	}
>> +
>> +	if (!igt_amd_replay_support_sink(data->fd, data->output->name)) {
>> +		igt_warn(" output %s not support Panel Replay mode\n", data->output->name);
>> +		return false;
>> +	}
>> +
>> +	if (!igt_amd_replay_support_drv(data->fd, data->output->name)) {
>> +		igt_warn(" kernel driver not support Panel Replay mode\n");
>> +		return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +static void run_check_replay(struct test_data *data, enum test_mode test_mode)
>> +{
>> +	int edp_idx, ret, frame_count, replay_state;
>> +	igt_fb_t ref_fb, ref_fb2;
>> +	igt_fb_t *flip_fb;
>> +	igt_output_t *output;
>> +
>> +	test_init(data);
>> +
>> +	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
>> +	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
>> +
>> +	/* check if eDP support Panel Replay. */
>> +	igt_skip_on(!replay_mode_supported(data));
>> +
>> +	for_each_connected_output(&data->display, output) {
>> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
>> +			continue;
>> +
>> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
>> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6,
>> +				    0.6, 0.6, &ref_fb);
>> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
>> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0,
>> +				    0.4, 0.14, &ref_fb2);
>> +
>> +		igt_plane_set_fb(data->primary, &ref_fb);
>> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>> +		flip_fb = &ref_fb;
>> +		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
>> +					flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
>> +		kmstest_wait_for_pageflip(data->fd);
>> +
>> +		/* Panel Replay state takes some time to settle its value on static screen */
>> +		sleep(REPLAY_SETTLE_DELAY);
>> +
>> +		/* Check Panel Replay state */
>> +		replay_state = igt_amd_read_replay_state(data->fd, output->name);
>> +		igt_debug("replay_state static mode before flip = 0x%X\n", replay_state);
>> +		igt_fail_on_f(replay_state < 0, "Open Panel Replay state debugfs failed\n");
>> +		igt_fail_on_f(replay_state < REPLAY_STATE_2,
>> +			"Panel Replay was not enabled for connector %s\n", output->name);
>> +
>> +		/* Do some page flip and let the replay go into live mode */
>> +		for (frame_count = 0; frame_count <= 20; frame_count++) {
>> +			ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
>> +					flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
>> +			igt_require(ret == 0);
>> +			kmstest_wait_for_pageflip(data->fd);
>> +
>> +			if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
>> +						&& frame_count > 5) {
>> +				/* Panel Replay state needs few frame to enter the live mode */
>> +				replay_state = igt_amd_read_replay_state(data->fd, output->name);
>> +				igt_debug("replay_state live mode = 0x%X\n", replay_state);
>> +				igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
>> +						"State should be REPLAY_STATE_4 (Active with single frame update)\n");
>> +			}
>> +
>> +			if (frame_count % 2 == 0)
>> +				flip_fb = &ref_fb2;
>> +			else
>> +				flip_fb = &ref_fb;
>> +		}
>> +
>> +		/* Check Panel Replay state in static screen */
>> +		if (test_mode == TEST_MODE_STATIC_SCREEN || TEST_MODE_INTERMITTENT_LIVE) {
>> +			/* Panel Replay state takes some time to settle its value on static screen */
>> +			sleep(1);
>> +
>> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
>> +			igt_debug("replay_state static mode = 0x%X\n", replay_state);
>> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
>> +					"State should be REPLAY_STATE_3 (Active)\n");
>> +		}
>> +
>> +		/* Do another page flip if we do the replay_intermittent_live test */
>> +		if (test_mode == TEST_MODE_INTERMITTENT_LIVE) {
>> +			for (frame_count = 0; frame_count <= 30; frame_count++) {
>> +				ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
>> +						flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
>> +				igt_require(ret == 0);
>> +				kmstest_wait_for_pageflip(data->fd);
>> +
>> +				if (frame_count > 5) {
>> +					/* Needs few frames to let state enter the live mode */
>> +					replay_state = igt_amd_read_replay_state(data->fd, output->name);
>> +					igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE during flip = 0x%X\n",
>> +							replay_state);
>> +					igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
>> +							"State should be REPLAY_STATE_4 (Active with single frame update)\n");
>> +				}
>> +
>> +				if (frame_count % 2 == 0)
>> +					flip_fb = &ref_fb2;
>> +				else
>> +					flip_fb = &ref_fb;
>> +			}
>> +
>> +			/* Panel Replay state takes some time to settle its value on static screen */
>> +			sleep(1);
>> +
>> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
>> +			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
>> +					replay_state);
>> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
>> +					"State should be REPLAY_STATE_3 (Active)\n");
>> +		}
>> +
>> +		igt_remove_fb(data->fd, &ref_fb);
>> +		igt_remove_fb(data->fd, &ref_fb2);
>> +	}
>> +
>> +	test_fini(data);
>> +}
>> +
>> +static int opt_handler(int option, int option_index, void *data)
>> +{
>> +	switch (option) {
>> +	case 'v':
>> +		opt.visual_confirm = strtol(optarg, NULL, 0);
>> +		igt_info("Panel Replay Visual Confirm %s\n", opt.visual_confirm ? "enabled" : "disabled");
>> +		break;
>> +	default:
>> +		return IGT_OPT_HANDLER_ERROR;
>> +	}
>> +
>> +	return IGT_OPT_HANDLER_SUCCESS;
>> +}
>> +
>> +igt_main_args("", long_options, help_str, opt_handler, NULL)
>> +{
>> +	struct test_data data;
>> +
>> +	igt_skip_on_simulation();
>> +	memset(&data, 0, sizeof(data));
>> +
>> +	igt_fixture
>> +	{
>> +		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
>> +
>> +		if (data.fd == -1)
>> +			igt_skip("Not an amdgpu driver.\n");
>> +
>> +		data.debugfs_fd = igt_debugfs_dir(data.fd);
>> +
>> +		kmstest_set_vt_graphics_mode();
>> +
>> +		igt_display_require(&data.display, data.fd);
>> +		igt_require(&data.display.is_atomic);
>> +		igt_display_require_output(&data.display);
>> +
>> +		/* check if visual confirm option available */
>> +		if (opt.visual_confirm) {
>> +			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
>> +			igt_skip_on_f(!igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_REPLAY),
>> +				      "set Panel Replay visual confirm failed\n");
>> +		}
>> +	}
>> +
>> +	igt_describe("Test whether Panel Replay can be enabled with static screen");
>> +	igt_subtest("replay_static_screen") run_check_replay(&data, TEST_MODE_STATIC_SCREEN);
>> +
>> +	igt_describe("Test whether Panel Replay can be enabled with intermittent live mdoe");
>> +	igt_subtest("replay_intermittent_live") run_check_replay(&data, TEST_MODE_INTERMITTENT_LIVE);
>> +
>> +	igt_describe("Test whether Panel Replay can be enabled with constant live mdoe");
>> +	igt_subtest("replay_constant_live") run_check_replay(&data, TEST_MODE_CONSTANT_LIVE);
>> +
>> +	igt_fixture
>> +	{
>> +		if (opt.visual_confirm) {
>> +			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
>> +			igt_require_f(igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE),
>> +				      "reset Panel Replay visual confirm failed\n");
>> +		}
>> +		close(data.debugfs_fd);
>> +		igt_display_fini(&data.display);
>> +		drm_close_driver(data.fd);
>> +	}
>> +}
>> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
>> index d7152a356..e8854c5fa 100644
>> --- a/tests/amdgpu/meson.build
>> +++ b/tests/amdgpu/meson.build
>> @@ -30,6 +30,7 @@ if libdrm_amdgpu.found()
>>   			  'amd_prime',
>>   			  'amd_psr',
>>   			  'amd_ras',
>> +			  'amd_replay',
>>   			  'amd_security',
>>   			  'amd_uvd_dec',
>>   			  'amd_uvd_enc',
>> -- 
>> 2.34.1
>>
--------------kpV36r0nUKBmH8yrW1wG7mSt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi<span style="white-space: pre-wrap"> Kamil,</span></p>
    <p><span style="white-space: pre-wrap">Thanks for the comment. I just updated a v2 version to fix it.</span></p>
    <pre class="moz-quote-pre" wrap="">Regards,
Tom
</pre>
    <div class="moz-cite-prefix">On 5/7/2024 1:05 AM, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240506170532.gekeyla3d2vd2x7n@kamilkon-DESK.igk.intel.com">
      <pre class="moz-quote-pre" wrap="">Hi Tom,
On 2024-05-03 at 17:08:54 +0800, Tom Chung wrote:

I have few small nits, see below.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">[why]
Add a basic IGT test for panel replay feature.

[how]
Subtest case

a. static screen
   1. Check if system support panel replay.
   2. Start video flip for a while.
   3. Stop video flip and wait for a while.
   4. Check if replay state is in Replay mode.

b. Live mode (intermittent)
   1. Check if system support panel replay.
   2. Start video flip for a while.
   3. Check if replay state is in Live mode.
   4. Stop video flip and wait for a while.
   5. Check if replay state is in Replay mode.
   6. Repaet 2 to 5.

c. Live mode (constant)
   1. Check if system support panel replay.
   2. Start video flip for a while.
   3. Check if replay state is in Live mode.

Signed-off-by: Tom Chung <a class="moz-txt-link-rfc2396E" href="mailto:chiahsuan.chung@amd.com">&lt;chiahsuan.chung@amd.com&gt;</a>
---
 lib/igt_amd.c             | 102 ++++++++++++
 lib/igt_amd.h             |  39 ++++-
 tests/amdgpu/amd_replay.c | 325 ++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build  |   1 +
 4 files changed, 466 insertions(+), 1 deletion(-)
 create mode 100755 tests/amdgpu/amd_replay.c

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 149af5151..8bc6fdc6a 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1014,6 +1014,108 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
 	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_ILR_SETTING);
 }
 
+/**
+ * igt_amd_output_has_replay_cap: check if eDP connector has replay_capability debugfs entry
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, on which we're reading the status
+ */
+bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name)
+{
+	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_CAP);
+}
+
+/**
+ * igt_amd_replay_support_sink: check if sink device support Panel Replay
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, on which we're reading the status
+ */
+bool igt_amd_replay_support_sink(int drm_fd, char *connector_name)
+{
+	char buf[128];
+	int ret;
+	int fd;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	if (fd &lt; 0) {
+		igt_info(&quot;output %s: debugfs not found\n&quot;, connector_name);
+		return false;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
+	igt_assert_f(ret &gt;= 0, &quot;Reading %s for connector %s failed.\n&quot;,
+		DEBUGFS_EDP_REPLAY_CAP, connector_name);
+	close(fd);
+
+	if (ret &lt; 1)
+		return false;
+
+	return strstr(buf, &quot;Sink support: yes&quot;);
+}
+
+/**
+ * igt_amd_replay_support_drv: check if driver support Panel Replay
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, on which we're reading the status
+ */
+bool igt_amd_replay_support_drv(int drm_fd, char *connector_name)
+{
+	char buf[128];
+	int ret;
+	int fd;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	if (fd &lt; 0) {
+		igt_info(&quot;output %s: debugfs not found\n&quot;, connector_name);
+		return false;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
+	igt_assert_f(ret &gt;= 0, &quot;Reading %s for connector %s failed.\n&quot;,
+		DEBUGFS_EDP_REPLAY_CAP, connector_name);
+	close(fd);
+
+	if (ret &lt; 1)
+		return false;
+
+	return strstr(buf, &quot;Driver support: yes&quot;);
+}
+
+/**
+ * igt_amd_output_has_replay_state: check if eDP connector has replay_state debugfs entry
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, on which we're reading the status
+ */
+bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name)
+{
+	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_STATE);
+}
+
+/**
+ * @brief Read Panel Replay State from debugfs interface
+ * @param drm_fd DRM file descriptor
+ * @param connector_name The connector's name, on which we're reading the status
+ * @return Panel Replay state as integer
+ */
+int igt_amd_read_replay_state(int drm_fd, char *connector_name)
+{
+	char buf[4];
+	int fd, ret;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	if (fd &lt; 0) {
+		igt_info(&quot;Couldn't open connector %s debugfs directory\n&quot;, connector_name);
+		return -1;
+	}
+
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_STATE, buf, sizeof(buf));
+	close(fd);
+
+	igt_assert_f(ret &gt;= 0, &quot;Reading %s for connector %s failed.\n&quot;,
+		DEBUGFS_EDP_REPLAY_STATE, connector_name);
+
+	return strtol(buf, NULL, 10);
+}
+
 /**
  * igt_amd_output_has_psr_cap: check if eDP connector has psr_capability debugfs entry
  * @drm_fd: DRM file descriptor
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 6780b99de..a41b423b7 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -47,6 +47,8 @@
 #define DEBUGFS_EDP_ILR_SETTING &quot;ilr_setting&quot;
 #define MAX_SUPPORTED_ILR 8
 #define MULTIPLIER_TO_LR 270000
+#define DEBUGFS_EDP_REPLAY_CAP &quot;replay_capability&quot;
+#define DEBUGFS_EDP_REPLAY_STATE &quot;replay_state&quot;
 #define DEBUGFS_EDP_PSR_CAP	&quot;psr_capability&quot;
 #define DEBUGFS_EDP_PSR_STATE	&quot;psr_state&quot;
 #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT &quot;allow_edp_hotplug_detection&quot;
@@ -100,6 +102,35 @@ enum dc_link_training_type {
 	LINK_TRAINING_NO_PATTERN
 };
 
+/*
+ * enumeration of REPLAY STATE below should be aligned to the upstreamed
+ * amdgpu kernel driver 'enum replay_state' in dmub_cmd.h
+ */
+enum replay_state {
+	REPLAY_STATE_0 = 0x0,
+	REPLAY_STATE_1 = 0x10,
+	REPLAY_STATE_1A = 0x11,
+	REPLAY_STATE_2 = 0x20,
+	REPLAY_STATE_3 = 0x30,
+	REPLAY_STATE_3INIT = 0x31,
+	REPLAY_STATE_4 = 0x40,
+	REPLAY_STATE_4A = 0x41,
+	REPLAY_STATE_4B = 0x42,
+	REPLAY_STATE_4C = 0x43,
+	REPLAY_STATE_4D = 0x44,
+	REPLAY_STATE_4B_LOCKED = 0x4A,
+	REPLAY_STATE_4C_UNLOCKED = 0x4B,
+	REPLAY_STATE_5 = 0x50,
+	REPLAY_STATE_5A = 0x51,
+	REPLAY_STATE_5B = 0x52,
+	REPLAY_STATE_5A_LOCKED = 0x5A,
+	REPLAY_STATE_5B_UNLOCKED = 0x5B,
+	REPLAY_STATE_6 = 0x60,
+	REPLAY_STATE_6A = 0x61,
+	REPLAY_STATE_6B = 0x62,
+	REPLAY_STATE_INVALID = 0xFF
+};
+
 /*
  * enumeration of PSR STATE below should be aligned to the upstreamed
  * amdgpu kernel driver 'enum dc_psr_state' in dc_type.h
@@ -135,7 +166,8 @@ enum amdgpu_debug_visual_confirm {
 	VISUAL_CONFIRM_HDR	= 2,
 	VISUAL_CONFIRM_MPCTREE	= 4,
 	VISUAL_CONFIRM_PSR	= 5,
-	VISUAL_CONFIRM_SWIZZLE	= 9
+	VISUAL_CONFIRM_SWIZZLE  = 9,
+	VISUAL_CONFIRM_REPLAY = 12
 };
 
 uint32_t igt_amd_create_bo(int fd, uint64_t size);
@@ -189,6 +221,11 @@ void igt_amd_write_ilr_setting(
 	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
 	uint8_t link_rate_set);
 bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
+bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name);
+bool igt_amd_replay_support_sink(int drm_fd, char *connector_name);
+bool igt_amd_replay_support_drv(int drm_fd, char *connector_name);
+bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name);
+int  igt_amd_read_replay_state(int drm_fd, char *connector_name);
 bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
 bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mode);
 bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode);
diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
new file mode 100755
index 000000000..61894cd84
--- /dev/null
+++ b/tests/amdgpu/amd_replay.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include &quot;drm_mode.h&quot;
+#include &quot;igt.h&quot;
+#include &quot;igt_core.h&quot;
+#include &quot;igt_kms.h&quot;
+#include &quot;igt_amd.h&quot;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">------------- ^^^^^^
This should be before igt_core.h

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#include &lt;stdint.h&gt;
+#include &lt;fcntl.h&gt;
+#include &lt;xf86drmMode.h&gt;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
These should be before igt headers.

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+/* hardware requirements:
+ * eDP panel that supports Panel Replay
+ */
+IGT_TEST_DESCRIPTION(&quot;Basic test for enabling Panel Replay for eDP displays&quot;);
+
+#define REPLAY_SETTLE_DELAY 10
+
+/* Common test data. */
+struct test_data {
+	igt_display_t display;
+	igt_plane_t *primary;
+	igt_output_t *output;
+	igt_pipe_t *pipe;
+	drmModeModeInfo *mode;
+	enum pipe pipe_id;
+	int fd;
+	int debugfs_fd;
+	int w, h;
+};
+
+struct {
+	bool visual_confirm;
+} opt = {
+	.visual_confirm = false,	/* visual confirm debug option */
+};
+
+const char *help_str =
+&quot;  --visual-confirm           Panel Replay visual confirm debug option enable\n&quot;;
+
+struct option long_options[] = {
+	{&quot;visual-confirm&quot;,	required_argument, NULL, 'v'},
+	{ 0, 0, 0, 0 }
+};
+
+enum test_mode {
+	TEST_MODE_STATIC_SCREEN = 0,
+	TEST_MODE_INTERMITTENT_LIVE,
+	TEST_MODE_CONSTANT_LIVE,
+	TEST_MODE_COUNT
+};
+
+/* Common test setup. */
+static void test_init(struct test_data *data)
+{
+	igt_display_t *display = &amp;data-&gt;display;
+
+	/* It doesn't matter which pipe we choose on amdpgu. */
+	data-&gt;pipe_id = PIPE_A;
+	data-&gt;pipe = &amp;data-&gt;display.pipes[data-&gt;pipe_id];
+
+	igt_display_reset(display);
+
+	data-&gt;output = igt_get_single_output_for_pipe(display, data-&gt;pipe_id);
+	igt_require(data-&gt;output);
+	igt_info(&quot;output %s\n&quot;, data-&gt;output-&gt;name);
+
+	data-&gt;mode = igt_output_get_mode(data-&gt;output);
+	igt_assert(data-&gt;mode);
+	kmstest_dump_mode(data-&gt;mode);
+
+	data-&gt;primary =
+		igt_pipe_get_plane_type(data-&gt;pipe, DRM_PLANE_TYPE_PRIMARY);
+
+	igt_output_set_pipe(data-&gt;output, data-&gt;pipe_id);
+
+	data-&gt;w = data-&gt;mode-&gt;hdisplay;
+	data-&gt;h = data-&gt;mode-&gt;vdisplay;
+
+	if (opt.visual_confirm) {
+		/**
+		 * if visual confirm option is enabled, we'd trigger a full modeset before test run
+		 * to have Panel Replay visual confirm enable take effect. DPMS off -&gt; ON transition
+		 * is one of many approaches.
+		 */
+		kmstest_set_connector_dpms(data-&gt;fd, data-&gt;output-&gt;config.connector,
+				DRM_MODE_DPMS_OFF);
+		kmstest_set_connector_dpms(data-&gt;fd, data-&gt;output-&gt;config.connector,
+				DRM_MODE_DPMS_ON);
+	}
+}
+
+/* Common test cleanup. */
+static void test_fini(struct test_data *data)
+{
+		igt_display_t *display = &amp;data-&gt;display;
+
+		igt_display_reset(display);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+}
+
+static int check_conn_type(struct test_data *data, uint32_t type)
+{
+	int i;
+
+	for (i = 0; i &lt; data-&gt;display.n_outputs; i++) {
+		uint32_t conn_type = data-&gt;display.outputs[i].config.connector-&gt;connector_type;
+
+		if (conn_type == type)
+			return i;
+	}
+
+	return -1;
+}
+
+static bool replay_mode_supported(struct test_data *data)
+{
+	/* run Panel Replay test if eDP panel support Panel Replay */
+	if (!igt_amd_output_has_replay_cap(data-&gt;fd, data-&gt;output-&gt;name)) {
+		igt_warn(&quot; driver does not have %s debugfs interface\n&quot;, DEBUGFS_EDP_REPLAY_CAP);
+		return false;
+	}
+
+	if (!igt_amd_output_has_replay_state(data-&gt;fd, data-&gt;output-&gt;name)) {
+		igt_warn(&quot; driver does not have %s debugfs interface\n&quot;, DEBUGFS_EDP_REPLAY_STATE);
+		return false;
+	}
+
+	if (!igt_amd_replay_support_sink(data-&gt;fd, data-&gt;output-&gt;name)) {
+		igt_warn(&quot; output %s not support Panel Replay mode\n&quot;, data-&gt;output-&gt;name);
+		return false;
+	}
+
+	if (!igt_amd_replay_support_drv(data-&gt;fd, data-&gt;output-&gt;name)) {
+		igt_warn(&quot; kernel driver not support Panel Replay mode\n&quot;);
+		return false;
+	}
+
+	return true;
+}
+
+static void run_check_replay(struct test_data *data, enum test_mode test_mode)
+{
+	int edp_idx, ret, frame_count, replay_state;
+	igt_fb_t ref_fb, ref_fb2;
+	igt_fb_t *flip_fb;
+	igt_output_t *output;
+
+	test_init(data);
+
+	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
+	igt_skip_on_f(edp_idx == -1, &quot;no eDP connector found\n&quot;);
+
+	/* check if eDP support Panel Replay. */
+	igt_skip_on(!replay_mode_supported(data));
+
+	for_each_connected_output(&amp;data-&gt;display, output) {
+		if (output-&gt;config.connector-&gt;connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		igt_create_color_fb(data-&gt;fd, data-&gt;mode-&gt;hdisplay,
+				    data-&gt;mode-&gt;vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6,
+				    0.6, 0.6, &amp;ref_fb);
+		igt_create_color_fb(data-&gt;fd, data-&gt;mode-&gt;hdisplay,
+				    data-&gt;mode-&gt;vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0,
+				    0.4, 0.14, &amp;ref_fb2);
+
+		igt_plane_set_fb(data-&gt;primary, &amp;ref_fb);
+		igt_display_commit_atomic(&amp;data-&gt;display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+		flip_fb = &amp;ref_fb;
+		drmModePageFlip(data-&gt;fd, output-&gt;config.crtc-&gt;crtc_id,
+					flip_fb-&gt;fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		kmstest_wait_for_pageflip(data-&gt;fd);
+
+		/* Panel Replay state takes some time to settle its value on static screen */
+		sleep(REPLAY_SETTLE_DELAY);
+
+		/* Check Panel Replay state */
+		replay_state = igt_amd_read_replay_state(data-&gt;fd, output-&gt;name);
+		igt_debug(&quot;replay_state static mode before flip = 0x%X\n&quot;, replay_state);
+		igt_fail_on_f(replay_state &lt; 0, &quot;Open Panel Replay state debugfs failed\n&quot;);
+		igt_fail_on_f(replay_state &lt; REPLAY_STATE_2,
+			&quot;Panel Replay was not enabled for connector %s\n&quot;, output-&gt;name);
+
+		/* Do some page flip and let the replay go into live mode */
+		for (frame_count = 0; frame_count &lt;= 20; frame_count++) {
+			ret = drmModePageFlip(data-&gt;fd, output-&gt;config.crtc-&gt;crtc_id,
+					flip_fb-&gt;fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+			igt_require(ret == 0);
+			kmstest_wait_for_pageflip(data-&gt;fd);
+
+			if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
+						&amp;&amp; frame_count &gt; 5) {
+				/* Panel Replay state needs few frame to enter the live mode */
+				replay_state = igt_amd_read_replay_state(data-&gt;fd, output-&gt;name);
+				igt_debug(&quot;replay_state live mode = 0x%X\n&quot;, replay_state);
+				igt_fail_on_f(replay_state &lt; REPLAY_STATE_4 &amp;&amp; replay_state &gt;= REPLAY_STATE_5,
+						&quot;State should be REPLAY_STATE_4 (Active with single frame update)\n&quot;);
+			}
+
+			if (frame_count % 2 == 0)
+				flip_fb = &amp;ref_fb2;
+			else
+				flip_fb = &amp;ref_fb;
+		}
+
+		/* Check Panel Replay state in static screen */
+		if (test_mode == TEST_MODE_STATIC_SCREEN || TEST_MODE_INTERMITTENT_LIVE) {
+			/* Panel Replay state takes some time to settle its value on static screen */
+			sleep(1);
+
+			replay_state = igt_amd_read_replay_state(data-&gt;fd, output-&gt;name);
+			igt_debug(&quot;replay_state static mode = 0x%X\n&quot;, replay_state);
+			igt_fail_on_f(replay_state &lt; REPLAY_STATE_3 &amp;&amp; replay_state &gt;= REPLAY_STATE_4,
+					&quot;State should be REPLAY_STATE_3 (Active)\n&quot;);
+		}
+
+		/* Do another page flip if we do the replay_intermittent_live test */
+		if (test_mode == TEST_MODE_INTERMITTENT_LIVE) {
+			for (frame_count = 0; frame_count &lt;= 30; frame_count++) {
+				ret = drmModePageFlip(data-&gt;fd, output-&gt;config.crtc-&gt;crtc_id,
+						flip_fb-&gt;fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+				igt_require(ret == 0);
+				kmstest_wait_for_pageflip(data-&gt;fd);
+
+				if (frame_count &gt; 5) {
+					/* Needs few frames to let state enter the live mode */
+					replay_state = igt_amd_read_replay_state(data-&gt;fd, output-&gt;name);
+					igt_debug(&quot;replay_state TEST_MODE_INTERMITTENT_LIVE during flip = 0x%X\n&quot;,
+							replay_state);
+					igt_fail_on_f(replay_state &lt; REPLAY_STATE_4 &amp;&amp; replay_state &gt;= REPLAY_STATE_5,
+							&quot;State should be REPLAY_STATE_4 (Active with single frame update)\n&quot;);
+				}
+
+				if (frame_count % 2 == 0)
+					flip_fb = &amp;ref_fb2;
+				else
+					flip_fb = &amp;ref_fb;
+			}
+
+			/* Panel Replay state takes some time to settle its value on static screen */
+			sleep(1);
+
+			replay_state = igt_amd_read_replay_state(data-&gt;fd, output-&gt;name);
+			igt_debug(&quot;replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n&quot;,
+					replay_state);
+			igt_fail_on_f(replay_state &lt; REPLAY_STATE_3 &amp;&amp; replay_state &gt;= REPLAY_STATE_4,
+					&quot;State should be REPLAY_STATE_3 (Active)\n&quot;);
+		}
+
+		igt_remove_fb(data-&gt;fd, &amp;ref_fb);
+		igt_remove_fb(data-&gt;fd, &amp;ref_fb2);
+	}
+
+	test_fini(data);
+}
+
+static int opt_handler(int option, int option_index, void *data)
+{
+	switch (option) {
+	case 'v':
+		opt.visual_confirm = strtol(optarg, NULL, 0);
+		igt_info(&quot;Panel Replay Visual Confirm %s\n&quot;, opt.visual_confirm ? &quot;enabled&quot; : &quot;disabled&quot;);
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+igt_main_args(&quot;&quot;, long_options, help_str, opt_handler, NULL)
+{
+	struct test_data data;
+
+	igt_skip_on_simulation();
+	memset(&amp;data, 0, sizeof(data));
+
+	igt_fixture
+	{
+		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
+
+		if (data.fd == -1)
+			igt_skip(&quot;Not an amdgpu driver.\n&quot;);
+
+		data.debugfs_fd = igt_debugfs_dir(data.fd);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&amp;data.display, data.fd);
+		igt_require(&amp;data.display.is_atomic);
+		igt_display_require_output(&amp;data.display);
+
+		/* check if visual confirm option available */
+		if (opt.visual_confirm) {
+			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
+			igt_skip_on_f(!igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_REPLAY),
+				      &quot;set Panel Replay visual confirm failed\n&quot;);
+		}
+	}
+
+	igt_describe(&quot;Test whether Panel Replay can be enabled with static screen&quot;);
+	igt_subtest(&quot;replay_static_screen&quot;) run_check_replay(&amp;data, TEST_MODE_STATIC_SCREEN);
+
+	igt_describe(&quot;Test whether Panel Replay can be enabled with intermittent live mdoe&quot;);
+	igt_subtest(&quot;replay_intermittent_live&quot;) run_check_replay(&amp;data, TEST_MODE_INTERMITTENT_LIVE);
+
+	igt_describe(&quot;Test whether Panel Replay can be enabled with constant live mdoe&quot;);
+	igt_subtest(&quot;replay_constant_live&quot;) run_check_replay(&amp;data, TEST_MODE_CONSTANT_LIVE);
+
+	igt_fixture
+	{
+		if (opt.visual_confirm) {
+			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
+			igt_require_f(igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE),
+				      &quot;reset Panel Replay visual confirm failed\n&quot;);
+		}
+		close(data.debugfs_fd);
+		igt_display_fini(&amp;data.display);
+		drm_close_driver(data.fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index d7152a356..e8854c5fa 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -30,6 +30,7 @@ if libdrm_amdgpu.found()
 			  'amd_prime',
 			  'amd_psr',
 			  'amd_ras',
+			  'amd_replay',
 			  'amd_security',
 			  'amd_uvd_dec',
 			  'amd_uvd_enc',
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------kpV36r0nUKBmH8yrW1wG7mSt--
