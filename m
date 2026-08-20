Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434EAC5DF81
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 13:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EAD10F031;
	Thu, 20 Aug 2026 13:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pXPku+99";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011014.outbound.protection.outlook.com [52.101.52.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECE110F031
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 13:31:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4DzUNu7O5eY15FqTaqX1zy4Qun1oVyRM0Dcq9YQa8c84g0fNTwXsxVBQQRkNCoib7LOC+3uJHufHIKisgkdURGY96wFSw+4U55GPTdiniVIRdtdP3/SJGnVsd3l0nRzXK07Ev+zp5h46XIr0HtPF3Pvrl4avR9209tLpbvALtIO0tjM45XsoSRCL4W3XEY3Dqg1r3HketC6NL6tdjykZeQN10I+AOTgNOHxIzfXul+yfA2HHJc6cvKlxbQgMrVCfzsYXnZZJAtSR7Wzu4mHl6D9+Dq0saTI47paE9/IK+VGgQTAGWc7ZWWMXcwUtPPxgAfVTZdUYz/CozC5LjOBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwX6isW7ln4j0SxaDTQy244d3FwF/hSAQqfGUjRvM1c=;
 b=slbT/A45l+trtIeYrbvBVaLUDKjyflFmbUuF683lJH8M9wU0PZWKZ8WF7k3vFpzJojd80v+vi3+KOgjIB3dEb7yyM3EenBv4cpbjeCm3OvGujVYZjJ00DG6eFHOavIOQxKlCdKhQpsgE8loYvW/0nvrI3bJ/Xsi8lkTHfs4xZf779ujrjIk4VdL6O7FuZ30sJ+5q/IBx/rswOzB6L/XNQtKlQ1fTuLu0ZOJp8hDLV6DstxwoeP3Cm76mN3TuA0DIrc3sjcGlrh+7S5PgjeTVYf0XY0iG8bz3DirKxdywgu00kvgt58I1J5VBfmrrgfyPVbKLBcXaw7hY4DpeQ9BefA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwX6isW7ln4j0SxaDTQy244d3FwF/hSAQqfGUjRvM1c=;
 b=pXPku+99Ft/dCcGUoXcNRdzv00dZIsg7YAY0ChsVrfe+M/gI+uzI9VGU96cm/GLy02QBUT8OhIh6mqvzAqXkYcVQUkk7wq1Jj0Js6TdSESzP9oWk5hSu7sq5vSYhWZxfYksPRcXvVBIVZcosXI3aUoLHdEgtJjUknyNFqVmUtfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by CYXPR12MB9385.namprd12.prod.outlook.com (2603:10b6:930:e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 13:31:47 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 13:31:47 +0000
Content-Type: multipart/alternative;
 boundary="------------Hyt41VSndskTksCdHldweSh7"
Message-ID: <5e198fb4-30c4-4e38-a538-6556c52dabd1@amd.com>
Date: Thu, 20 Aug 2026 09:31:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] docs: Update platform filtering documentation per
 review feedback
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "krzysztof.karas@intel.com" <krzysztof.karas@intel.com>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Pawel Sikora <pawel.sikora@intel.com>
References: <20260820012820.129589-1-vitaly.prosyak@amd.com>
 <20260820012820.129589-5-vitaly.prosyak@amd.com>
 <DM4PR12MB51529CA20E32047A1EA397BDE3A42@DM4PR12MB5152.namprd12.prod.outlook.com>
 <20260820095026.hytro4alzqbdrz2q@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260820095026.hytro4alzqbdrz2q@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: YT4P288CA0095.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::29) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|CYXPR12MB9385:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee279cd-6324-49e0-a329-08defebf61fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|921020|6133799003|18002099003|22082099003|5023799004|11063799006|4143699003|8096899003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 5ZfkQfcByb69DFHbsI77tvsxssrYfUl2qewNASEqAiG9mVViCNuOq9+UQbrEy2jsilaKs10qf94sUqLpPp7tWfebqtAM7pBptllGDRSZVhwP8u6ajlok9r4uZhPrigizjCddRS9mewRESOdZoNprQQvXPnVf1vZzk6T1DHnWT5ldc8hsqC/KNVLK26MgtbmnF2Gi6VuGbyjP8ALSnLdGDwzlC/qejDVsCS2EuIFXRBrKMOivdWYLOplOsPs3gmYxemVQmvKj9WUQBoGXxEhNFPLQB9DfwTWbBOYdQH7mJVKVl3bXXTtGYp0bqSS6uQT5ZonpgiRVhgL/f1d1uzAx25YjmTIzf2dk7PqQtJqSFzkWA7RXM1SAIiG56+PYw5+XFaUFH789c/RLjjE/2+7/RP9UvsMhZFX1xjpEDYHVoXDq9EBfDSccUprxak/svj5dPA2eaQgoAm4w0El389esxaAQ5RskFik6OGDRNtQOhr63I4E+tBW+c90zcrQRqjrryV8d9jVYFWNLyanJvpAjyUUYeET/ZSjlkZNXrfE1SK5yqD9WuaxlbMNIL+eIP/Y7w+I/tAFUaHuKkX0sHWO/iu/BwwemtHt9kFwurv/piPsq3tMZyOdrA8vV+kWLyOYIl5jCEi9JfiCZfbA1/FSglfVyrQQYKplSUD8LAANMCjWEAT8Wjv3fNHUq98Kc/TdUqw5bddApWr5rNSxG8L7Cyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(921020)(6133799003)(18002099003)(22082099003)(5023799004)(11063799006)(4143699003)(8096899003)(56012099006)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlEyeGpwcVpyYTJIUFlVUTJmajZHQ01Tc3YzZkNlRDlLMEN0d3JDNkxzbEU5?=
 =?utf-8?B?MjlwQ3F6UXdMdmk0dktGOUV2V2p4UlJQOWFpekdCQWJDUHZRREozWE1LeW5a?=
 =?utf-8?B?VDl6Vmt5Y3ZoaGVVeHBZcG5WWnAwTHlNWUlaSlR2U3Z5d0dQMzFzclNHKzlp?=
 =?utf-8?B?aUR4Njc0bFhvY3RhWlQrWnpNZUJxOFpqTVFkRlJwWjVWYzM3YWtsTm1PK0Q3?=
 =?utf-8?B?Uk0rN0UrSDhxMWdOWmZuYUJaZlRpQjdWM243WTN1bDdOcEgrK2l3YnFTdVIw?=
 =?utf-8?B?ZVVlam9CV21VZUdhL2JuQXpVMUtwaitERThHaXlleDhqUmFhMS9aeC9YKzhC?=
 =?utf-8?B?OGdzdlowSGR3Q1dMZkZCNk9HMWw5b1dRRG01dnBUTndib2FoUWNZYVpnNXFz?=
 =?utf-8?B?TlMrMUQ2cjNiZ2lla0gvdVhrWHpJUy9KckdndnQ1WVRDeGpVK2UwRytLNmdJ?=
 =?utf-8?B?M3VzaEtSOUdHcWRsUVpyQjE1RHA0L0twei94cENsUUlUM1MvOWJJUUYrMTBj?=
 =?utf-8?B?aklXb0lMVmowK2MwVVo5WjR3cGJ0eDI0aTRTM29rSkkvUkxWblhmK1Y2ZW9a?=
 =?utf-8?B?bnUzQnB3T25GWm9DZjZNT05KQkFvcTNEbm5mSW5NZU0vTkswQWFDMW5vZ3VN?=
 =?utf-8?B?NitIemVqYVMwMmoyYXRZdG5sc2NGbFZ1ejZUTVpjR3RVN0RWOFpMUjBSVklt?=
 =?utf-8?B?dGdtM3B0VUtMb1Jtallhb2llZ1lPSTFIb1ZsS2RPamU5OHdJQndWVzZUSHlv?=
 =?utf-8?B?VkpDcnhPYnlOMDhjamdMRGUyYlduZGlWRlA5U3VaUDU1S20zbzVtV3pkcnRC?=
 =?utf-8?B?bFZWU0M5QWlqT3RScjZFSlBFZG1tQUJjckJiTXBnZW5hQTlubEF5UHgyNU9M?=
 =?utf-8?B?US8zamVnV0hYZStLZ2p5ZzVEMloyQklMSmR4UnVwaXdDUWZjeXhkaDNxTjQv?=
 =?utf-8?B?ckFmSkkwTDNOTklXZm9kZDJSdmxseEcwekVpYTR4K2VGM0F2ZHdvY1RxQWhH?=
 =?utf-8?B?dHh2bUJ3b296K2ZEMkIwdHE0ZkgvSE4yemQwNGlKeDdhRHZiM1FIV1dGbGpG?=
 =?utf-8?B?VjBUaXlSL0F3M0hpRXlKZEJxY1RFRThsYlVpcWxkQW1Wb2hBS3puVTVHWDlF?=
 =?utf-8?B?UW5PL29mNUh3QnBYamZ4UlU2ajV6SU4yM3pYLzZ0UFZlSGc0SVdLSEdZVlYy?=
 =?utf-8?B?UzQ3OHljS2pUcjZtbDdCTEo0VUR6VlpoUVBkUjU1c2FDc3htMm1zT0c2c3NJ?=
 =?utf-8?B?TUl2UzBLalo5UlpkUnloNkEzUW4zRUlCU3h1UUVQQklzR3E4aFRjd3RxTnVY?=
 =?utf-8?B?Y1JjaCtMNVNEMkh5OWg1N2RSZXA3b083Y2Z4NVpsTnVlNUVBaFZwK1k5NFB5?=
 =?utf-8?B?SmY1VFV2NU1DWXc2N0VpQnFmTjNqNGxSV09oZXRUTXBERTBPZlVLemJmTjIr?=
 =?utf-8?B?V1ptZi9yZGlyVUtacGtFVmJPZXRSWXZNMVlySHRPeG5zWWZtaEV1ZzZtWG1M?=
 =?utf-8?B?MzlxU0QzakRpUm9KRElZR2pRang4akg3YWRFZnpwTzNWenRGNjlNSUhDMktz?=
 =?utf-8?B?ekl6bzR2Ny9WZXZFMElwbzM5NzU4TXZVd29YK0o3Q3JHTDUvY2t0S0EvSUlT?=
 =?utf-8?B?ZDJXMzZERTdzRHVENzR1TkNOTTczVlQ4Ukk1NjBTajd3WmVRbFUwVVdIOXhK?=
 =?utf-8?B?S2g1R3c1Wkt2YVpEYVdMZFNnZE9VYTFrcDBNQ0xFUHZDbHNRZG9hdzBZWE5E?=
 =?utf-8?B?RjU3ZUk2dzRqNGpwWUlQSjdzNHBzSHovdGtxRzdHRitWZXJscjdIM1lTV1hT?=
 =?utf-8?B?dlpUcml2bzAvd1EybnlXbGExaU1zeklGa0dOQlZ2ak43R1llbDhGTW1lblZi?=
 =?utf-8?B?THJST3VuSjRmM3I2UVJpTG9ZOFF5WHVpQTJwU1l2MGZqdjQrKzRpNjRORjRx?=
 =?utf-8?B?S2NLSUdZQUxlQ1Z3MU1JZXdHR0xqeVJvWGFVS2NMYUZVblJySmZJN290ZURj?=
 =?utf-8?B?VWRsRlp5WmFUcXNUb0tNZE9RbmUzZmI4b2hvdWdaWUl4N1Q2azl5R2QvNWVY?=
 =?utf-8?B?a2ppRithYlh2ZmZta25sdUtZbFE3TTZ4eGgzQ3F5VjhSd2V6R3dmbDhpdEpZ?=
 =?utf-8?B?bURTbkFQcVM1OXhwYkdIbENTbkxqZXpGa0V0N0hiaXR5WGFWbWQ1Mitaemk3?=
 =?utf-8?B?aDhlT0dZNURzSjN1dEpmOUlaWk5LM0cvWlBKZFRjSHY4YkdLMHNrb3prTjZN?=
 =?utf-8?B?UmRmOTc2ZWI5eFhCZ3doamh0dERZNnIwUmpVa2RkbVFlQklKU2FtdUNOT1Jo?=
 =?utf-8?B?a1UwVXBDZVVEZG5PdlNDUGErSDVoejRvcFBYbjFHQnRPT2ZuY1MzUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee279cd-6324-49e0-a329-08defebf61fd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 13:31:47.2085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sehMzftVCBo54ilb2OfRVPKbU8OYWtymDvPIisz5Dt/jgErh8z867k4yvMC/GVITzn3oS0YSJCee1pbP5M/PgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9385
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

--------------Hyt41VSndskTksCdHldweSh7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kamil,
Thank you very much for applying the patches and for making those final corrections to the subject line and formatting. I appreciate your help and guidance!
Best regards,
Vitaly


On 2026-08-20 05:50, Kamil Konieczny wrote:
> Hi Zhang,,
> On 2026-08-20 at 02:03:18 +0000, Zhang, Jesse(Jie) wrote:
>> AMD General
>>
>> Review-by: Jesse Zhang <jesse.zhang@amd.com>
>>
> Applied, thank you all.
> I corrected a subject here, please do not write about review in subject,
> so I changed it into:
>
> [PATCH v6 4/4] docs: Add platform filtering documentation
>
> Also applied few last corrections using checkpatch.pl help.
>
> Regards,
> Kamil
>
>>> -----Original Message-----
>>> From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
>>> Sent: Thursday, August 20, 2026 9:27 AM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: kamil.konieczny@linux.intel.com; jani.nikula@linux.intel.com;
>>> krzysztof.karas@intel.com; krzysztof.kozlowski@canonical.com; Zhang,
>>> Jesse(Jie) <Jesse.Zhang@amd.com>; Koenig, Christian
>>> <Christian.Koenig@amd.com>; Deucher, Alexander
>>> <Alexander.Deucher@amd.com>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>;
>>> Pawel Sikora <pawel.sikora@intel.com>
>>> Subject: [PATCH v6 4/4] docs: Update platform filtering documentation per review
>>> feedback
>>>
>>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>
>>> Update the platform filtering usage guide to clarify method priority ordering, replace
>>> Advantages/Disadvantages with When-to-Use/Trade-offs, and add runtime
>>> methods for discovering platform names.
>>>
>>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> Cc: Pawel Sikora <pawel.sikora@intel.com>
>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> ---
>>>  docs/platform_filtering.md | 351 +++++++++++++++++++++++++++++++++++++
>>>  mkdocs.yml                 |   1 +
>>>  2 files changed, 352 insertions(+)
>>>  create mode 100644 docs/platform_filtering.md
>>>
>>> diff --git a/docs/platform_filtering.md b/docs/platform_filtering.md new file mode
>>> 100644 index 000000000..7d3202a94
>>> --- /dev/null
>>> +++ b/docs/platform_filtering.md
>>> @@ -0,0 +1,351 @@
>>> +# IGT Platform Filtering - Usage Guide
>>> +
>>> +## Overview
>>> +
>>> +The IGT platform filtering framework allows tests to be skipped based
>>> +on platform characteristics without modifying test source code.
>>> +
>>> +**Key Feature**: **Automatic Filtering** - No manual calls needed in subtests!
>>> +
>>> +Tests only need to initialize platform filtering once in `igt_fixture`,
>>> +and the IGT framework automatically checks each subtest before execution.
>>> +
>>> +## Quick Start
>>> +
>>> +### 1. Initialize in Test (One Time)
>>> +
>>> +```c
>>> +#include "lib/amdgpu/amd_platform.h"
>>> +
>>> +int igt_main(void)
>>> +{
>>> +    struct amdgpu_gpu_info gpu_info;
>>> +
>>> +    igt_fixture {
>>> +        fd = drm_open_driver(DRIVER_AMDGPU);
>>> +        amdgpu_query_gpu_info(device, &gpu_info);
>>> +
>>> +        /* Initialize platform filtering - enables automatic filtering */
>>> +        amd_platform_filter_init(&gpu_info);
>>> +    }
>>> +
>>> +    igt_subtest("my-test") {
>>> +        /* No manual filtering call needed - automatic! */
>>> +        test_code();
>>> +    }
>>> +}
>>> +```
>>> +
>>> +### 2. Configure Filtering Rules
>>> +
>>> +Use one of three methods (checked in priority order):
>>> +
>>> +1. **Built-in rules** (highest priority) - Compiled into test 2.
>>> +**Config file** (recommended) - `/etc/igt/platform_skip.conf` 3.
>>> +**Environment variable** (lowest priority) - `IGT_PLATFORM_SKIP_CONFIG`
>>> +
>>> +---
>>> +
>>> +## Method 1: Built-in Rules (Highest Priority)
>>> +
>>> +**Location**: Vendor implementation (e.g., `lib/amdgpu/amd_platform.c`)
>>> +
>>> +### Example
>>> +
>>> +```c
>>> +static const struct platform_skip_entry amd_builtin_rules[] = {
>>> +    {
>>> +        .test_name = "amd_security",
>>> +        .subtest_glob = "secure-bounce",
>>> +        .reason = "Not supported on APUs",
>>> +        .platform_data = &apu_platforms,
>>> +    },
>>> +};
>>> +```
>>> +
>>> +### When to Use Built-in Rules
>>> +
>>> +- Permanent production exclusions that should never run
>>> +- Platform limitations known at development time
>>> +- Tests that fundamentally cannot work on certain hardware
>>> +- Vendor-specific restrictions that apply globally
>>> +
>>> +**Trade-offs:**
>>> +- [+] Fast (no file I/O at runtime)
>>> +- [+] Guaranteed to be applied
>>> +- [+] Version controlled with code
>>> +- [-] Requires rebuild to change
>>> +- [-] Not flexible for temporary exclusions
>>> +
>>> +---
>>> +
>>> +## Method 2: Config File (RECOMMENDED)
>>> +
>>> +**Location**: `/etc/igt/platform_skip.conf`
>>> +
>>> +**Format**: `platform:test:subtest:reason`
>>> +
>>> +**Note**: The reason field is recommended but can be empty. If omitted, "No
>>> reason" is automatically inserted.
>>> +
>>> +### Example Config File
>>> +
>>> +```bash
>>> +cat > /etc/igt/platform_skip.conf << 'EOF'
>>> +# Platform filtering configuration
>>> +# Format: platform:test:subtest:reason
>>> +# Use * as wildcard
>>> +
>>> +# Skip all UMQ tests on Navi48 during platform bringup
>>> +navi48:amd_basic:*-UMQ:SWDEV-88888 - UMQ stabilization in progress
>>> +
>>> +# Skip specific tests with ticket references
>>> +navi31:amd_basic:cs-gfx-with-IP-GFX-UMQ:SWDEV-12345
>>> +navi31:amd_basic:cs-compute-with-IP-COMPUTE-UMQ:SWDEV-12345
>>> +navi31:amd_basic:cs-sdma-with-IP-DMA-UMQ:SWDEV-12346
>>> +
>>> +# Skip tests on early samples
>>> +strix_halo:amd_basic:*:Platform not ready - ES samples
>>> +
>>> +# Skip known flaky test across all platforms
>>> +*:amd_basic:eviction-test-with-IP-DMA:SWDEV-99999 - Intermittent
>>> +failure
>>> +
>>> +# Skip entire test binary on specific platform navi10:amd_vcn:*:VCN
>>> +encoding issues on Navi10 A0
>>> +
>>> +# Skip all tests on discontinued platform vega10:*:*:Platform no longer
>>> +supported EOF ```
>>> +
>>> +### Run Tests
>>> +
>>> +```bash
>>> +# Config file is loaded automatically - no environment variable needed
>>> +./build/tests/amdgpu/amd_basic
>>> +
>>> +# Output shows:
>>> +# Subtest cs-gfx-with-IP-GFX-UMQ: SKIP
>>> +# Platform filtering (config): SWDEV-12345 ```
>>> +
>>> +### When to Use Config File
>>> +
>>> +- Managing multiple test exclusions
>>> +- Team-wide or CI/CD configurations
>>> +- Persistent filtering rules across sessions
>>> +- Easy add/remove/edit without rebuilding
>>> +- No need to remember environment variables
>>> +- Sharing skip rules across test infrastructure
>>> +
>>> +---
>>> +
>>> +## Method 3: Environment Variable (Lowest Priority)
>>> +
>>> +**Variable**: `IGT_PLATFORM_SKIP_CONFIG`
>>> +
>>> +**Format**: Same as config file, semicolon-separated
>>> +
>>> +### Example - Skip Single Test
>>> +
>>> +```bash
>>> +export IGT_PLATFORM_SKIP_CONFIG="navi48:amd_basic:cs-compute-with-
>>> IP-COMPUTE-UMQ:Testing"
>>> +./build/tests/amdgpu/amd_basic
>>> +```
>>> +
>>> +### Example - Skip Multiple Tests
>>> +
>>> +```bash
>>> +export IGT_PLATFORM_SKIP_CONFIG="navi48:amd_basic:*-
>>> UMQ:Testing;navi31:amd_basic:cs-gfx-*:Known issue"
>>> +./build/tests/amdgpu/amd_basic
>>> +```
>>> +
>>> +### When to Use Environment Variable
>>> +
>>> +- Quick one-off testing without editing files
>>> +- Temporary overrides during debugging sessions
>>> +- Testing filter patterns before adding to config file
>>> +- Single test runs where config file would be overkill
>>> +- Overriding config file rules for specific test runs
>>> +- CI pipeline job-specific overrides
>>> +
>>> +**Trade-offs:**
>>> +- [+] No file editing required
>>> +- [+] Quick to set and unset
>>> +- [+] Can override config file for testing
>>> +- [-] Not persistent (lost when session ends)
>>> +- [-] Easy to forget it's set
>>> +- [-] Inconvenient for large test lists
>>> +
>>> +---
>>> +
>>> +## Wildcard Patterns
>>> +
>>> +All methods support wildcards (`*`) for flexible matching:
>>> +
>>> +```
>>> +# Platform wildcards
>>> +*:amd_basic:my-test:Reason           # All platforms
>>> +navi*:amd_basic:my-test:Reason       # All Navi (navi10, navi31, navi48, etc.)
>>> +
>>> +# Test wildcards
>>> +navi48:amd_*:my-test:Reason          # All amd_* tests
>>> +
>>> +# Subtest wildcards
>>> +navi48:amd_basic:*-UMQ:Reason        # All subtests ending with -UMQ
>>> +navi48:amd_basic:cs-*:Reason         # All subtests starting with cs-
>>> +
>>> +# Combined wildcards
>>> +*:*:*-UMQ:Reason                     # All UMQ tests on all platforms
>>> +```
>>> +
>>> +### Wildcard Examples
>>> +
>>> +```bash
>>> +# Skip all user queue tests during bringup navi48:*:*-UMQ:Platform
>>> +bringup - UMQ not ready
>>> +
>>> +# Skip all VCN tests on specific platform navi10:amd_vcn:*:Known VCN
>>> +issues
>>> +
>>> +# Skip specific test pattern across all platforms
>>> +*:amd_basic:eviction-*:Intermittent failures
>>> +
>>> +# Skip all tests on EOL platform
>>> +vega10:*:*:Platform no longer supported ```
>>> +
>>> +### Pattern Matching Rules
>>> +
>>> +- `*` matches zero or more characters
>>> +- Patterns are case-sensitive
>>> +- Empty field is NOT a wildcard (use `*` explicitly)
>>> +- Priority order: Built-in > Config file > Environment variable
>>> +
>>> +### Example Subtest Matching
>>> +
>>> +Given config: `navi48:amd_basic:*-UMQ:Testing`
>>> +
>>> +- cs-gfx-with-IP-GFX-UMQ → **Skipped** (matches)
>>> +- cs-compute-with-IP-COMPUTE-UMQ → **Skipped** (matches)
>>> +- cs-sdma-with-IP-DMA → Runs normally (doesn't match)
>>> +
>>> +---
>>> +
>>> +## Skip Message Format
>>> +
>>> +Automatic filtering shows the source in skip messages:
>>> +
>>> +```
>>> +Subtest cs-gfx-with-IP-GFX-UMQ: SKIP
>>> +Platform filtering (config): SWDEV-12345 - UMQ unstable on Navi48 ```
>>> +
>>> +Source indicators:
>>> +- `(built-in)` - From vendor's compiled rules
>>> +- `(config)` - From config file
>>> +- `(env)` - From environment variable
>>> +
>>> +---
>>> +
>>> +## Platform Names
>>> +
>>> +Platform names are vendor-specific and defined in vendor backend code.
>>> +
>>> +**For AMD platforms**, see `lib/amdgpu/amd_platform.c` for the complete list.
>>> +
>>> +**Examples:**
>>> +- RDNA2/3 discrete GPUs: `navi21`, `navi31`, `navi33`
>>> +- RDNA4: `navi48`, `navi44`
>>> +- APUs: `strix_halo`, `phoenix`
>>> +- Data center: `aldebaran` (MI250)
>>> +
>>> +**To find your platform name:**
>>> +
>>> +```bash
>>> +# Method 1: Run any test with debug output
>>> +./build/tests/amdgpu/amd_basic --debug # Look for: "Platform detected:
>>> +<name>"
>>> +
>>> +# Method 2: Check dmesg for GPU info
>>> +dmesg | grep -i amdgpu | grep -i asic
>>> +
>>> +# Method 3: Check /sys
>>> +cat /sys/class/drm/card0/device/asic_name  # If available ```
>>> +
>>> +**Note:** Platform names may change with new hardware generations. Check
>>> vendor backend code for current platform definitions. The list above is provided as
>>> examples only.
>>> +
>>> +---
>>> +
>>> +## Best Practices
>>> +
>>> +### For Development - Quick Testing
>>> +
>>> +Use environment variable:
>>> +```bash
>>> +# Temporarily skip broken test
>>> +export IGT_PLATFORM_SKIP_CONFIG="*:amd_basic:broken-test:WIP"
>>> +./build/tests/amdgpu/amd_basic
>>> +unset IGT_PLATFORM_SKIP_CONFIG
>>> +```
>>> +
>>> +### For Teams - Shared Exclusions
>>> +
>>> +Use config file with ticket references:
>>> +```
>>> +# /etc/igt/platform_skip.conf
>>> +# Updated: 2026-07-09
>>> +
>>> +# Navi48 bringup exclusions
>>> +navi48:amd_basic:*-UMQ:SWDEV-88888 - UMQ stabilization
>>> +navi48:amd_vcn:vcn-encoder-*:SWDEV-88889 - VCN bringup
>>> +
>>> +# Cross-platform known issues
>>> +*:amd_basic:eviction-test-with-IP-DMA:SWDEV-77777 - Flaky ```
>>> +
>>> +### For CI/CD
>>> +
>>> +Deploy config file with test infrastructure:
>>> +```bash
>>> +#!/bin/bash
>>> +# CI pipeline setup
>>> +echo "Deploying test exclusions..."
>>> +scp ci-skip-rules.conf test-machine:/etc/igt/platform_skip.conf
>>> +ssh test-machine "./run-igt-suite.sh"
>>> +```
>>> +
>>> +### For Production
>>> +
>>> +Use built-in rules for permanent exclusions:
>>> +```c
>>> +// In lib/amdgpu/amd_platform.c
>>> +static const struct platform_skip_entry amd_builtin_rules[] = {
>>> +    {
>>> +        .test_name = "amd_basic",
>>> +        .subtest_glob = "*-UMQ",
>>> +        .reason = "User queues not supported in production",
>>> +        .platform_data = &all_platforms,
>>> +    },
>>> +};
>>> +```
>>> +
>>> +---
>>> +
>>> +## Summary
>>> +
>>> +| Method | Use Case | Persistent | Rebuild Required |
>>> +|--------|----------|------------|------------------|
>>> +| **Built-in** | Production rules | Yes | Yes | **Config file** |
>>> +| Team/CI exclusions | Yes | No |
>>> +| **Environment** | Quick testing | No | No |
>>> +
>>> +**Recommendation**: Use **config file** for managing test exclusions at scale.
>>> +
>>> +---
>>> +
>>> +## See Also
>>> +
>>> +- `lib/igt_platform_filter.h` - API documentation
>>> +- `lib/igt_platform_filter.c` - Framework implementation
>>> +- `lib/amdgpu/amd_platform.c` - AMD backend reference
>>> diff --git a/mkdocs.yml b/mkdocs.yml
>>> index 0abb76704..1819b7b6c 100644
>>> --- a/mkdocs.yml
>>> +++ b/mkdocs.yml
>>> @@ -29,6 +29,7 @@ nav:
>>>      - How to document tests: 'test_documentation.md'
>>>      - How to categorize tests: 'test_categories.md'
>>>      - How to blocklist tests: 'blocklists.md'
>>> +    - How to filter tests per platform: 'platform_filtering.md'
>>>      - How to get code coverage: 'code_coverage.md'
>>>      - How to port new IGT driver: 'new_driver.md'
>>>      - How to plan a new test: 'test_plan.md'
>>> --
>>> 2.54.0
--------------Hyt41VSndskTksCdHldweSh7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAIBhAB" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Hi
      Kamil,<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAIBhAE" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Thank
      you very much for applying the patches and for making those final
      corrections to the subject line and formatting. I appreciate your
      help and guidance!<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="ep" data-hveid="CAAIBhAH" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Best
      regards,<br data-sfc-root="ep" data-sfc-pl="|||[]" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">
      Vitaly<span></span></div>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-08-20 05:50, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260820095026.hytro4alzqbdrz2q@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Zhang,,
On 2026-08-20 at 02:03:18 +0000, Zhang, Jesse(Jie) wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">AMD General

Review-by: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:jesse.zhang@amd.com">&lt;jesse.zhang@amd.com&gt;</a>

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Applied, thank you all.
I corrected a subject here, please do not write about review in subject,
so I changed it into:

[PATCH v6 4/4] docs: Add platform filtering documentation

Also applied few last corrections using checkpatch.pl help.

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:vitaly.prosyak@amd.com">vitaly.prosyak@amd.com</a> <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Sent: Thursday, August 20, 2026 9:27 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:kamil.konieczny@linux.intel.com">kamil.konieczny@linux.intel.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:jani.nikula@linux.intel.com">jani.nikula@linux.intel.com</a>;
<a class="moz-txt-link-abbreviated" href="mailto:krzysztof.karas@intel.com">krzysztof.karas@intel.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:krzysztof.kozlowski@canonical.com">krzysztof.kozlowski@canonical.com</a>; Zhang,
Jesse(Jie) <a class="moz-txt-link-rfc2396E" href="mailto:Jesse.Zhang@amd.com">&lt;Jesse.Zhang@amd.com&gt;</a>; Koenig, Christian
<a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; Deucher, Alexander
<a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; Prosyak, Vitaly <a class="moz-txt-link-rfc2396E" href="mailto:Vitaly.Prosyak@amd.com">&lt;Vitaly.Prosyak@amd.com&gt;</a>;
Pawel Sikora <a class="moz-txt-link-rfc2396E" href="mailto:pawel.sikora@intel.com">&lt;pawel.sikora@intel.com&gt;</a>
Subject: [PATCH v6 4/4] docs: Update platform filtering documentation per review
feedback

From: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>

Update the platform filtering usage guide to clarify method priority ordering, replace
Advantages/Disadvantages with When-to-Use/Trade-offs, and add runtime
methods for discovering platform names.

Suggested-by: Krzysztof Kozlowski <a class="moz-txt-link-rfc2396E" href="mailto:krzysztof.kozlowski@canonical.com">&lt;krzysztof.kozlowski@canonical.com&gt;</a>
Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
Cc: Pawel Sikora <a class="moz-txt-link-rfc2396E" href="mailto:pawel.sikora@intel.com">&lt;pawel.sikora@intel.com&gt;</a>
Cc: Jani Nikula <a class="moz-txt-link-rfc2396E" href="mailto:jani.nikula@linux.intel.com">&lt;jani.nikula@linux.intel.com&gt;</a>
Cc: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:jesse.zhang@amd.com">&lt;jesse.zhang@amd.com&gt;</a>
Cc: Christian Koenig <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Signed-off-by: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Acked-by: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
---
 docs/platform_filtering.md | 351 +++++++++++++++++++++++++++++++++++++
 mkdocs.yml                 |   1 +
 2 files changed, 352 insertions(+)
 create mode 100644 docs/platform_filtering.md

diff --git a/docs/platform_filtering.md b/docs/platform_filtering.md new file mode
100644 index 000000000..7d3202a94
--- /dev/null
+++ b/docs/platform_filtering.md
@@ -0,0 +1,351 @@
+# IGT Platform Filtering - Usage Guide
+
+## Overview
+
+The IGT platform filtering framework allows tests to be skipped based
+on platform characteristics without modifying test source code.
+
+**Key Feature**: **Automatic Filtering** - No manual calls needed in subtests!
+
+Tests only need to initialize platform filtering once in `igt_fixture`,
+and the IGT framework automatically checks each subtest before execution.
+
+## Quick Start
+
+### 1. Initialize in Test (One Time)
+
+```c
+#include &quot;lib/amdgpu/amd_platform.h&quot;
+
+int igt_main(void)
+{
+    struct amdgpu_gpu_info gpu_info;
+
+    igt_fixture {
+        fd = drm_open_driver(DRIVER_AMDGPU);
+        amdgpu_query_gpu_info(device, &amp;gpu_info);
+
+        /* Initialize platform filtering - enables automatic filtering */
+        amd_platform_filter_init(&amp;gpu_info);
+    }
+
+    igt_subtest(&quot;my-test&quot;) {
+        /* No manual filtering call needed - automatic! */
+        test_code();
+    }
+}
+```
+
+### 2. Configure Filtering Rules
+
+Use one of three methods (checked in priority order):
+
+1. **Built-in rules** (highest priority) - Compiled into test 2.
+**Config file** (recommended) - `/etc/igt/platform_skip.conf` 3.
+**Environment variable** (lowest priority) - `IGT_PLATFORM_SKIP_CONFIG`
+
+---
+
+## Method 1: Built-in Rules (Highest Priority)
+
+**Location**: Vendor implementation (e.g., `lib/amdgpu/amd_platform.c`)
+
+### Example
+
+```c
+static const struct platform_skip_entry amd_builtin_rules[] = {
+    {
+        .test_name = &quot;amd_security&quot;,
+        .subtest_glob = &quot;secure-bounce&quot;,
+        .reason = &quot;Not supported on APUs&quot;,
+        .platform_data = &amp;apu_platforms,
+    },
+};
+```
+
+### When to Use Built-in Rules
+
+- Permanent production exclusions that should never run
+- Platform limitations known at development time
+- Tests that fundamentally cannot work on certain hardware
+- Vendor-specific restrictions that apply globally
+
+**Trade-offs:**
+- [+] Fast (no file I/O at runtime)
+- [+] Guaranteed to be applied
+- [+] Version controlled with code
+- [-] Requires rebuild to change
+- [-] Not flexible for temporary exclusions
+
+---
+
+## Method 2: Config File (RECOMMENDED)
+
+**Location**: `/etc/igt/platform_skip.conf`
+
+**Format**: `platform:test:subtest:reason`
+
+**Note**: The reason field is recommended but can be empty. If omitted, &quot;No
reason&quot; is automatically inserted.
+
+### Example Config File
+
+```bash
+cat &gt; /etc/igt/platform_skip.conf &lt;&lt; 'EOF'
+# Platform filtering configuration
+# Format: platform:test:subtest:reason
+# Use * as wildcard
+
+# Skip all UMQ tests on Navi48 during platform bringup
+navi48:amd_basic:*-UMQ:SWDEV-88888 - UMQ stabilization in progress
+
+# Skip specific tests with ticket references
+navi31:amd_basic:cs-gfx-with-IP-GFX-UMQ:SWDEV-12345
+navi31:amd_basic:cs-compute-with-IP-COMPUTE-UMQ:SWDEV-12345
+navi31:amd_basic:cs-sdma-with-IP-DMA-UMQ:SWDEV-12346
+
+# Skip tests on early samples
+strix_halo:amd_basic:*:Platform not ready - ES samples
+
+# Skip known flaky test across all platforms
+*:amd_basic:eviction-test-with-IP-DMA:SWDEV-99999 - Intermittent
+failure
+
+# Skip entire test binary on specific platform navi10:amd_vcn:*:VCN
+encoding issues on Navi10 A0
+
+# Skip all tests on discontinued platform vega10:*:*:Platform no longer
+supported EOF ```
+
+### Run Tests
+
+```bash
+# Config file is loaded automatically - no environment variable needed
+./build/tests/amdgpu/amd_basic
+
+# Output shows:
+# Subtest cs-gfx-with-IP-GFX-UMQ: SKIP
+# Platform filtering (config): SWDEV-12345 ```
+
+### When to Use Config File
+
+- Managing multiple test exclusions
+- Team-wide or CI/CD configurations
+- Persistent filtering rules across sessions
+- Easy add/remove/edit without rebuilding
+- No need to remember environment variables
+- Sharing skip rules across test infrastructure
+
+---
+
+## Method 3: Environment Variable (Lowest Priority)
+
+**Variable**: `IGT_PLATFORM_SKIP_CONFIG`
+
+**Format**: Same as config file, semicolon-separated
+
+### Example - Skip Single Test
+
+```bash
+export IGT_PLATFORM_SKIP_CONFIG=&quot;navi48:amd_basic:cs-compute-with-
IP-COMPUTE-UMQ:Testing&quot;
+./build/tests/amdgpu/amd_basic
+```
+
+### Example - Skip Multiple Tests
+
+```bash
+export IGT_PLATFORM_SKIP_CONFIG=&quot;navi48:amd_basic:*-
UMQ:Testing;navi31:amd_basic:cs-gfx-*:Known issue&quot;
+./build/tests/amdgpu/amd_basic
+```
+
+### When to Use Environment Variable
+
+- Quick one-off testing without editing files
+- Temporary overrides during debugging sessions
+- Testing filter patterns before adding to config file
+- Single test runs where config file would be overkill
+- Overriding config file rules for specific test runs
+- CI pipeline job-specific overrides
+
+**Trade-offs:**
+- [+] No file editing required
+- [+] Quick to set and unset
+- [+] Can override config file for testing
+- [-] Not persistent (lost when session ends)
+- [-] Easy to forget it's set
+- [-] Inconvenient for large test lists
+
+---
+
+## Wildcard Patterns
+
+All methods support wildcards (`*`) for flexible matching:
+
+```
+# Platform wildcards
+*:amd_basic:my-test:Reason           # All platforms
+navi*:amd_basic:my-test:Reason       # All Navi (navi10, navi31, navi48, etc.)
+
+# Test wildcards
+navi48:amd_*:my-test:Reason          # All amd_* tests
+
+# Subtest wildcards
+navi48:amd_basic:*-UMQ:Reason        # All subtests ending with -UMQ
+navi48:amd_basic:cs-*:Reason         # All subtests starting with cs-
+
+# Combined wildcards
+*:*:*-UMQ:Reason                     # All UMQ tests on all platforms
+```
+
+### Wildcard Examples
+
+```bash
+# Skip all user queue tests during bringup navi48:*:*-UMQ:Platform
+bringup - UMQ not ready
+
+# Skip all VCN tests on specific platform navi10:amd_vcn:*:Known VCN
+issues
+
+# Skip specific test pattern across all platforms
+*:amd_basic:eviction-*:Intermittent failures
+
+# Skip all tests on EOL platform
+vega10:*:*:Platform no longer supported ```
+
+### Pattern Matching Rules
+
+- `*` matches zero or more characters
+- Patterns are case-sensitive
+- Empty field is NOT a wildcard (use `*` explicitly)
+- Priority order: Built-in &gt; Config file &gt; Environment variable
+
+### Example Subtest Matching
+
+Given config: `navi48:amd_basic:*-UMQ:Testing`
+
+- cs-gfx-with-IP-GFX-UMQ → **Skipped** (matches)
+- cs-compute-with-IP-COMPUTE-UMQ → **Skipped** (matches)
+- cs-sdma-with-IP-DMA → Runs normally (doesn't match)
+
+---
+
+## Skip Message Format
+
+Automatic filtering shows the source in skip messages:
+
+```
+Subtest cs-gfx-with-IP-GFX-UMQ: SKIP
+Platform filtering (config): SWDEV-12345 - UMQ unstable on Navi48 ```
+
+Source indicators:
+- `(built-in)` - From vendor's compiled rules
+- `(config)` - From config file
+- `(env)` - From environment variable
+
+---
+
+## Platform Names
+
+Platform names are vendor-specific and defined in vendor backend code.
+
+**For AMD platforms**, see `lib/amdgpu/amd_platform.c` for the complete list.
+
+**Examples:**
+- RDNA2/3 discrete GPUs: `navi21`, `navi31`, `navi33`
+- RDNA4: `navi48`, `navi44`
+- APUs: `strix_halo`, `phoenix`
+- Data center: `aldebaran` (MI250)
+
+**To find your platform name:**
+
+```bash
+# Method 1: Run any test with debug output
+./build/tests/amdgpu/amd_basic --debug # Look for: &quot;Platform detected:
+&lt;name&gt;&quot;
+
+# Method 2: Check dmesg for GPU info
+dmesg | grep -i amdgpu | grep -i asic
+
+# Method 3: Check /sys
+cat /sys/class/drm/card0/device/asic_name  # If available ```
+
+**Note:** Platform names may change with new hardware generations. Check
vendor backend code for current platform definitions. The list above is provided as
examples only.
+
+---
+
+## Best Practices
+
+### For Development - Quick Testing
+
+Use environment variable:
+```bash
+# Temporarily skip broken test
+export IGT_PLATFORM_SKIP_CONFIG=&quot;*:amd_basic:broken-test:WIP&quot;
+./build/tests/amdgpu/amd_basic
+unset IGT_PLATFORM_SKIP_CONFIG
+```
+
+### For Teams - Shared Exclusions
+
+Use config file with ticket references:
+```
+# /etc/igt/platform_skip.conf
+# Updated: 2026-07-09
+
+# Navi48 bringup exclusions
+navi48:amd_basic:*-UMQ:SWDEV-88888 - UMQ stabilization
+navi48:amd_vcn:vcn-encoder-*:SWDEV-88889 - VCN bringup
+
+# Cross-platform known issues
+*:amd_basic:eviction-test-with-IP-DMA:SWDEV-77777 - Flaky ```
+
+### For CI/CD
+
+Deploy config file with test infrastructure:
+```bash
+#!/bin/bash
+# CI pipeline setup
+echo &quot;Deploying test exclusions...&quot;
+scp ci-skip-rules.conf test-machine:/etc/igt/platform_skip.conf
+ssh test-machine &quot;./run-igt-suite.sh&quot;
+```
+
+### For Production
+
+Use built-in rules for permanent exclusions:
+```c
+// In lib/amdgpu/amd_platform.c
+static const struct platform_skip_entry amd_builtin_rules[] = {
+    {
+        .test_name = &quot;amd_basic&quot;,
+        .subtest_glob = &quot;*-UMQ&quot;,
+        .reason = &quot;User queues not supported in production&quot;,
+        .platform_data = &amp;all_platforms,
+    },
+};
+```
+
+---
+
+## Summary
+
+| Method | Use Case | Persistent | Rebuild Required |
+|--------|----------|------------|------------------|
+| **Built-in** | Production rules | Yes | Yes | **Config file** |
+| Team/CI exclusions | Yes | No |
+| **Environment** | Quick testing | No | No |
+
+**Recommendation**: Use **config file** for managing test exclusions at scale.
+
+---
+
+## See Also
+
+- `lib/igt_platform_filter.h` - API documentation
+- `lib/igt_platform_filter.c` - Framework implementation
+- `lib/amdgpu/amd_platform.c` - AMD backend reference
diff --git a/mkdocs.yml b/mkdocs.yml
index 0abb76704..1819b7b6c 100644
--- a/mkdocs.yml
+++ b/mkdocs.yml
@@ -29,6 +29,7 @@ nav:
     - How to document tests: 'test_documentation.md'
     - How to categorize tests: 'test_categories.md'
     - How to blocklist tests: 'blocklists.md'
+    - How to filter tests per platform: 'platform_filtering.md'
     - How to get code coverage: 'code_coverage.md'
     - How to port new IGT driver: 'new_driver.md'
     - How to plan a new test: 'test_plan.md'
--
2.54.0
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Hyt41VSndskTksCdHldweSh7--
