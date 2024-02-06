Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE40C4828D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 18:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205FB10E74E;
	Tue,  6 Feb 2024 18:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Pluui4hg";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4324610E74E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2024 18:39:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcEkx77ZXZLk/eZgyXcrDgQkuCzHhdBwqur8F6vHXIN7iphQpF97/CLtKyZCXoJLQNJMvjTg/zMdy+8s0fQNjGoHgwcXGAckowlbAWrSBI9FZQpQsWNHZwduE1gp20KmxpBSudzxT0wVdngJbFbgNRkQLOKpc2WqvWmBijgTPW1l/m8mshs6Qb/ocQ7Mh+xXRm3C7jwpOdO5I4YFVv8oKKLDGZItmE5lswaHqk3vaqjOPZ3BqTjPkcTnZ2/0qhRyqpcZG8AmJ5WkWIsi1bYR5dwDCvFEwW7qHmuawL4TpVqAPEvWMxm+fBENRRqboQlGojPWxee+sDrmDcyG7+c/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=984Jh2vtx54bXBLd6EX4CB3ypMi0V24YSEjek/pDn9c=;
 b=IZEse4T5Pje2LIuXAmrJ6sMCvnCf3WGOTiIGktQfOqfbDZp+KnTGYpvxHloB2fBjdD0vxJmqyZR/M4QzpwcQLLRxBCF/3zpsKBywr20v/l3OnFtB0TifydnjjELSro4+wfa1TLNZ2V4wkgxM+/ITrUMcu2J5JAYRZjoTf7SpRdApYx+pY7q5jXctE2MFyRhbTldL9iC+1Jw5yVdxOgkcZSTZ7Kwyee6h2nCUvhO1s7he7pzxgcTdjENdWkqQSwh09Go4Vu51vzII90cr62aY6LtiWEC++ciwm0te0gh95T8KY6INouEPOXtxvw81YbZ8f3TcnAYKzodfrSCqbri+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=984Jh2vtx54bXBLd6EX4CB3ypMi0V24YSEjek/pDn9c=;
 b=Pluui4hgwznpNeZ33Rpnw5T9nrt4ME8oq8jaCtd1a5FpPnX4GQKaAatlKbTjqd4vB2rHhfkkoKJpgKgSpYB4AKyGg4W7BZgMUnqvtxAoF8QHhRBf2W2ABxvBceYSE8aoSJ9QGG5dUd82bTGXj2NL+Q1zkNnpsJUzSfrHlODAGTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by BL3PR12MB6475.namprd12.prod.outlook.com (2603:10b6:208:3bb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.11; Tue, 6 Feb
 2024 18:38:55 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e5fc:a681:fb1f:de6e]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e5fc:a681:fb1f:de6e%7]) with mapi id 15.20.7270.012; Tue, 6 Feb 2024
 18:38:55 +0000
Message-ID: <911aa7ad-eac9-47ef-a4c4-584df9b33636@amd.com>
Date: Tue, 6 Feb 2024 13:38:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] lib/amdgpu: add a CS helper function
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240125034413.232349-1-vitaly.prosyak@amd.com>
 <20240125034413.232349-2-vitaly.prosyak@amd.com>
 <20240206082805.6fuq5ph6cn4glfev@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240206082805.6fuq5ph6cn4glfev@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0176.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::19) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|BL3PR12MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 9137ea37-167d-4e88-164a-08dc2742dfd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KHoOC8OfFWU/cwbK4R8yLSBebHdMDRZj5eBQJGMplJE10On81WHMqLHXTG7/E73UMu9qvwL5igZdkF/1p6mbKqgoPzSX7XENe041/wDroEC7GYWt1S729K1G0UyKwt+bjNSo9sMzrdjM+UKEMNev7PTqBtSDNloab3VcWZpgbuHEtul2tOCc/TYQmtohUnq8jle2GaUDLnfHvRnGGUs0bkqbzKswLPwY/r1uXw/GH+TyoXIlXi06iwKUakdFhBsPI8AOoewQIwEm5UfNpuDGHB3B5YtKT7xzNzD0beDYcflYWGZdZOY3GFgxLVY8Z7bvelPQpI6KlSQQ5LPJR9lhc9wBmsyESl29AYgyL3KWgA2Gy3ixZXjjLXsVDgT8wSFlDWKLRh0uGGf4PT1utVNBBg1EbCVxq0HGbC1mvmtfLcsqHYgRegWDC5n9NDbPbpR26iuTgREDYLhFER4EPSCqMXbeVDclqzw0rWPCCXG7ns2KwlLhVZNUH+9WjrSfXr2wkPuHODWk7tcGVzJX6oyFBRZhZnEACW7+gypzWZQRNTdBqTc6mkd0yIF9bbCg472ORTYPg6pKRu4EhiJO5kg64B8+e/g1MB6fZGA28PeYrZO+TTNuDHw5ICRD+tv3JrsE7jsUKtSnSNxqPFf4s+kbAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(6512007)(478600001)(31696002)(8936002)(316002)(8676002)(66946007)(66476007)(36756003)(6636002)(110136005)(6506007)(38100700002)(2616005)(26005)(41300700001)(6666004)(53546011)(83380400001)(66556008)(6486002)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUJRUkl4LysvRU5NMmQwSWVDUGNMdzF1MUcvaVNzdEVpTFJiMGhuY2FIeFRD?=
 =?utf-8?B?bWFDNWFPanFMa0RWdmR2M1BVeldaVXg2YTg4T21yaDdtdm9JUS9wYVlzcXl4?=
 =?utf-8?B?VVlPVWhLUHEvSFlzemVsS0F4b2kxc3BxQmxJTFYwOWxtamZCU2thcVFCaVN5?=
 =?utf-8?B?YVN4aGtpMFozdUdab1M3THJNS29FWEZWUXczbWtTbUNTSlVEY1ZPRDlUM0R3?=
 =?utf-8?B?M3hwbEY1Q1o1SG13QVljZDdaUURBaktNMEFHR3pJa3ZGSkZibzFWa0lmaWVv?=
 =?utf-8?B?UDlDUVA5WHA3L0lhc3c5WHQ0ZXNoVkFXZTI5Nit4ZnFqQ1lPTERWTkZBZWRk?=
 =?utf-8?B?YTR0ajFsN2dFY0ZlQVNpMHpQNXlVRFB0eXcwd2dKSnE5aG1Jc2FlM2Zsanpr?=
 =?utf-8?B?NHBDWXlxaFY0cHBCdlRaUXJxZjZKNndqOFRkdVI5YnRGOVJCNzhacEUycTdZ?=
 =?utf-8?B?c0N2am56Zm9FMlVUTU5pZjMvUlY1M0dla3h0Mk1jdUZwQWNOK1ZNWm9HQ1lr?=
 =?utf-8?B?QkR4dGk1TmNHZUdvK1N1YlVJbkdmV1YxcC92YlZZQUZuTVZQN2krT1ZsSGtw?=
 =?utf-8?B?RUFUVENOZWtqMkxXT0dsKzYrZ0RGbHRMTEQzd0hraXl4d1F0MVQ5OUhYRnRn?=
 =?utf-8?B?MGQya0UzaThsVlpMcGZzbXN6ajhjZXZzaDlhODJjdWhjNG5ocGlETHlLd1JF?=
 =?utf-8?B?c1pZZ2RHQVhqaTIxbXQxK1NSbUd1ZTlodDloYUtXbjVnbGxXTld5R0VER3JR?=
 =?utf-8?B?dGtreTJkZVBpMTBiTUxReXdrWDArMmtlSG9pd0xWcVQvOSt3ZXp2VlJmM3ox?=
 =?utf-8?B?a1MzcmZrZmUzdkdpM2tZRjIxSk1ZL2c4Ty9vMGJCK1k5SzcxZEpHUXZwbHJs?=
 =?utf-8?B?MWgydEJ0cHRmLzhGZHFJQjZBOFRsSGErQUN2UXFKcHhlNVRLTlVoOEg5VExO?=
 =?utf-8?B?ZU5ER2szZytNOGhUZTdsWDA5dEJhajBOZmZnb1FQaTVXY3FHcHh0dlBBSVhW?=
 =?utf-8?B?T3pmbkRnWnBDSmt2NXE2RFBUWG4yN3hqd0k5RE1Sa1JwaFMzMUsxZktNTklI?=
 =?utf-8?B?MHE2UmFLMS9GdkdtWXE1QitxNXBiRVRMNjY3Y0RIeFFyM05vTGNkUllBUUVH?=
 =?utf-8?B?endUMWliVDlncXppanVwN25RUkdMcTdFQ2NpSGhwN0Y5cnFzZlhrakFXbVlr?=
 =?utf-8?B?Nkg2dFF2cFRyMm53ZXgxOHYrTndDUzFKNjdqSy94ZkhMSjNlWmNVV2pxYXpv?=
 =?utf-8?B?QXppYXFGbmZkTXBCMm11U1ZkVXZzZUdWc1VZa0xhUG9JVWcwektNUmdVR05k?=
 =?utf-8?B?c2tFWTF4T1cxUUMzeWlWSWR3dkNRVldzbWVzNkg4NDdHN1JsQ3JNbDNOcjcv?=
 =?utf-8?B?eDV3THFIOENWNEM1Ym4yc0NlUFZKL1dvZWErZE96RE1XdVlJdnJRdzVBcTJV?=
 =?utf-8?B?aDVzamVOQlJNTGtHSW1IVlhDVHRZejlCVUVtbGJDUlQzaXZUejdWTmhiZkdT?=
 =?utf-8?B?KytRYmVtNnBOcUs3cGlSWURwQWhLeHFrUWxDcCs2dk00OFJYQmhNOXVqMGVU?=
 =?utf-8?B?U3hpK2t1TzVqVHN2dU8wWXA4SnMwaTFHdERUb2taNVozTnEweUpXUnVmMGI2?=
 =?utf-8?B?Ky9mYjMzcGFTUzMvdHFTeDBzRVBZbUcrUThTYW8rZFRXWmlNWEsza2ZmOHNV?=
 =?utf-8?B?dVlBYnRMci9YT0VvbE9wRTEvR1NoRmFuQVBzV0ZuMXB2VFhBRFVvWW9JMkky?=
 =?utf-8?B?MEFlMDlTTTcrQko3QmtMVTZuMEdiWm1xMWRlSGY5cjNCUkNLMnc3RXk1cDNa?=
 =?utf-8?B?NWVOQUVoam44eGdEU0pCbmFSdS9OTDFpbE90QTc5NmV3V0R6Y05pbXBmQzI3?=
 =?utf-8?B?L2NSbjNmSWNGRFdyS3lIa25NWjhjYTF4SmpIbDRPNnBocTdqKzY4dHdGMVdQ?=
 =?utf-8?B?WE9mODlTcHAvbDMzOElmVFB3a1U2TW1oVmFLS2t6c1ZFell2UEdiRG9aZVZq?=
 =?utf-8?B?QmZXc0MxZmZGY1lRWGhsWVRBcDZvcUswM2t3bmlOQXJNbklvVW9LaUg1ZmdQ?=
 =?utf-8?B?S3I2eHV1bHlYQ0lsc0w3QzZqSzFRTXRKbEp1UktSMzFad2dPVnpwWVBGK1Zn?=
 =?utf-8?Q?0J2PAe2p4ZWRZJZVB5y6sNm/t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9137ea37-167d-4e88-164a-08dc2742dfd1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 18:38:55.7632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ow1nssG63HbkrUFfk0fWfc1Gls2j8bi0SXwM09jRXMiLO1nnRiUBbwG35PIwYtr1Th/ghR5JvJkQCj4/qWr/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6475
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

On 2024-02-06 03:28, Kamil Konieczny wrote:
> Hi Vitaly,
>
> On 2024-01-24 at 22:44:12 -0500, vitaly.prosyak@amd.com wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> Add a cs helper function.
>> CS helper function works as RADV
>> radv_amdgpu_cs_submit. We want to validate
>> and ensure the integrity of the following
>> functionalities when  the following method
>> is called 'amdgpu_cs_submit_raw2':
>>
>> 1. Gang submission when several different IPs are into
>>    a single command, but those IPs are shared the
>>    instance and ring numbers(ip_instance, ring).
>> 2. Use 'AMDGPU_CHUNK_ID_BO_HANDLES' vs explicit parameter into 'amdgpu_cs_submit_raw2'.
>> 3. Not use  'AMDGPU_CHUNK_ID_DEPENDENCIES'.
>> 4. User fence always present except for multimedia ring commands.
>>
>> RADV uses those scenarios.
>>
>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> You forgot about a-b from Christian here, before push to gitlab
> _check_ with 'git log' if _all_ you patches have acked-by or reviewed-by.
Thanks for the reminder, yes, you  are correct,  in addition, I forgot also remove the 'Change-Id', it looks like too many issues at the same time.
>
> Regards,
> Kamil
Thanks, Vitaly
>
>> ---
>>  lib/amdgpu/amd_cs_radv.c   | 172 +++++++++++++++++++++++++++++++++++++
>>  lib/amdgpu/amd_cs_radv.h   |  61 +++++++++++++
>>  lib/amdgpu/amd_ip_blocks.h |   2 +
>>  lib/meson.build            |   1 +
>>  4 files changed, 236 insertions(+)
>>  create mode 100644 lib/amdgpu/amd_cs_radv.c
>>  create mode 100644 lib/amdgpu/amd_cs_radv.h
>>
>> diff --git a/lib/amdgpu/amd_cs_radv.c b/lib/amdgpu/amd_cs_radv.c
>> new file mode 100644
>> index 000000000..3c51ff7ef
>> --- /dev/null
>> +++ b/lib/amdgpu/amd_cs_radv.c
>> @@ -0,0 +1,172 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright 2024 Advanced Micro Devices, Inc.
>> + */
>> +#include <time.h>
>> +#include <sys/time.h>
>> +
>> +#include "lib/amdgpu/amd_memory.h"
>> +#include "lib/amdgpu/amd_sdma.h"
>> +#include "lib/amdgpu/amd_PM4.h"
>> +#include "lib/amdgpu/amd_cs_radv.h"
>> +
>> +#define TIME_MONOTONIC 2
>> +#define OS_TIMEOUT_INFINITE 0xffffffffffffffffull
>> +
>> +enum { MAX_RINGS_PER_TYPE = 8 };
>> +
>> +static bool
>> +amdgpu_cs_has_user_fence(struct amdgpu_cs_request_radv *request)
>> +{
>> +	/* TODO */
>> +	return false;
>> +}
>> +
>> +static int64_t
>> +os_time_get_nano(void)
>> +{
>> +	struct timespec ts;
>> +
>> +	timespec_get(&ts, TIME_MONOTONIC);
>> +	return ts.tv_nsec + ts.tv_sec*INT64_C(1000000000);
>> +}
>> +
>> +static int64_t
>> +os_time_get_absolute_timeout(uint64_t timeout)
>> +{
>> +	int64_t time, abs_timeout;
>> +
>> +	/* Also check for the type upper bound. */
>> +	if (timeout == OS_TIMEOUT_INFINITE || timeout > INT64_MAX)
>> +		return OS_TIMEOUT_INFINITE;
>> +
>> +	time = os_time_get_nano();
>> +	abs_timeout = time + (int64_t)timeout;
>> +
>> +	/* Check for overflow. */
>> +	if (abs_timeout < time)
>> +		return OS_TIMEOUT_INFINITE;
>> +
>> +	return abs_timeout;
>> +}
>> +
>> +static void
>> +os_time_sleep(int64_t usecs)
>> +{
>> +	struct timespec time;
>> +
>> +	time.tv_sec = usecs / 1000000;
>> +	time.tv_nsec = (usecs % 1000000) * 1000;
>> +	while (clock_nanosleep(CLOCK_MONOTONIC, 0, &time, &time) == EINTR)
>> +		;
>> +}
>> +
>> +uint32_t
>> +amdgpu_get_bo_handle(struct amdgpu_bo *bo)
>> +{
>> +	uint32_t handle;
>> +	int r;
>> +
>> +	r = amdgpu_bo_export(bo, amdgpu_bo_handle_type_kms, &handle);
>> +	igt_assert_eq(r, 0);
>> +	return handle;
>> +}
>> +
>> +uint32_t
>> +amdgpu_cs_submit_radv(amdgpu_device_handle dev, struct amdgpu_ring_context *ring_context,
>> +		struct amdgpu_cs_request_radv *request)
>> +{
>> +	int r, num_chunks,  size, i;
>> +	struct drm_amdgpu_cs_chunk *chunks;
>> +	struct drm_amdgpu_cs_chunk_data *chunk_data;
>> +	struct drm_amdgpu_bo_list_in bo_list_in;
>> +	uint32_t result = 0;
>> +	uint64_t abs_timeout_ns;
>> +	bool has_user_fence;
>> +
>> +	has_user_fence = amdgpu_cs_has_user_fence(request);
>> +	size = request->number_of_ibs + 1 + (has_user_fence ? 1 : 0) + 1 /* bo list */ + 3;
>> +	chunks = malloc(sizeof(chunks[0]) * size);
>> +	size = request->number_of_ibs + (has_user_fence ? 1 : 0);
>> +	chunk_data = malloc(sizeof(chunk_data[0]) * size);
>> +
>> +	num_chunks = request->number_of_ibs;
>> +	for (i = 0; i < request->number_of_ibs; i++) {
>> +
>> +		struct amdgpu_cs_ib_info_radv *ib;
>> +
>> +		chunks[i].chunk_id = AMDGPU_CHUNK_ID_IB;
>> +		chunks[i].length_dw = sizeof(struct drm_amdgpu_cs_chunk_ib) / 4;
>> +		chunks[i].chunk_data = (uint64_t)(uintptr_t)&chunk_data[i];
>> +
>> +		ib = &request->ibs[i];
>> +		assert(ib->size);
>> +
>> +		chunk_data[i].ib_data._pad = 0;
>> +		chunk_data[i].ib_data.va_start = ib->ib_mc_address;
>> +		chunk_data[i].ib_data.ib_bytes = ib->size * 4;
>> +		chunk_data[i].ib_data.ip_type = ib->ip_type;
>> +		chunk_data[i].ib_data.flags = ib->flags;
>> +
>> +		chunk_data[i].ib_data.ip_instance = request->ip_instance;
>> +		chunk_data[i].ib_data.ring = request->ring;
>> +	}
>> +
>> +	assert(chunk_data[request->number_of_ibs - 1].ib_data.ip_type == request->ip_type);
>> +
>> +	if (has_user_fence) {
>> +		i = num_chunks++;
>> +		chunks[i].chunk_id = AMDGPU_CHUNK_ID_FENCE;
>> +		chunks[i].length_dw = sizeof(struct drm_amdgpu_cs_chunk_fence) / 4;
>> +		chunks[i].chunk_data = (uint64_t)(uintptr_t)&chunk_data[i];
>> +
>> +			/* fence bo handle */
>> +		chunk_data[i].fence_data.handle = amdgpu_get_bo_handle(request->fence_info.handle);
>> +			/* offset */
>> +		chunk_data[i].fence_data.offset =
>> +					request->fence_info.offset * sizeof(uint64_t);
>> +	}
>> +
>> +	bo_list_in.operation = ~0;
>> +	bo_list_in.list_handle = ~0;
>> +	bo_list_in.bo_number = request->num_handles;
>> +	bo_list_in.bo_info_size = sizeof(struct drm_amdgpu_bo_list_entry);
>> +	bo_list_in.bo_info_ptr = (uint64_t)(uintptr_t)request->handles;
>> +
>> +	chunks[num_chunks].chunk_id = AMDGPU_CHUNK_ID_BO_HANDLES;
>> +	chunks[num_chunks].length_dw = sizeof(struct drm_amdgpu_bo_list_in) / 4;
>> +	chunks[num_chunks].chunk_data = (uintptr_t)&bo_list_in;
>> +	num_chunks++;
>> +
>> +	/* The kernel returns -ENOMEM with many parallel processes using GDS such as test suites quite
>> +	 * often, but it eventually succeeds after enough attempts. This happens frequently with dEQP
>> +	 * using NGG streamout.
>> +	 */
>> +	 abs_timeout_ns = os_time_get_absolute_timeout(1000000000ull); /* 1s */
>> +
>> +	r = 0;
>> +	do {
>> +		/* Wait 1 ms and try again. */
>> +		if (r == -ENOMEM)
>> +			os_time_sleep(1000);
>> +
>> +		r = amdgpu_cs_submit_raw2(dev, ring_context->context_handle, 0,
>> +				num_chunks, chunks, &request->seq_no);
>> +	} while (r == -ENOMEM && os_time_get_nano() < abs_timeout_ns);
>> +
>> +	if (r) {
>> +		if (r == -ENOMEM) {
>> +			igt_info("igt/amdgpu: Not enough memory for command submission.\n");
>> +			result = ENOMEM;
>> +		} else if (r == -ECANCELED) {
>> +			igt_info("igt/amdgpu: The CS has been cancelled because the context is lost.\n");
>> +			result = ECANCELED;
>> +		} else {
>> +			igt_info("igt/amdgpu: The CS has been rejected, see dmesg for more information (%i).\n", r);
>> +			result = EINVAL;
>> +		}
>> +	}
>> +	free(chunks);
>> +	free(chunk_data);
>> +	return result;
>> +}
>> diff --git a/lib/amdgpu/amd_cs_radv.h b/lib/amdgpu/amd_cs_radv.h
>> new file mode 100644
>> index 000000000..8b6dcaaa2
>> --- /dev/null
>> +++ b/lib/amdgpu/amd_cs_radv.h
>> @@ -0,0 +1,61 @@
>> +/* SPDX-License-Identifier: MIT
>> + * Copyright 2024 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef AMD_CS_RADV
>> +#define AMD_CS_RADV
>> +
>> +#include "amd_ip_blocks.h"
>> +#define AMDGPU_CS_GANG_SIZE	4
>> +
>> +struct amdgpu_cs_ib_info_radv {
>> +	int64_t flags;
>> +	uint64_t ib_mc_address;
>> +	uint32_t size;
>> +	enum amd_ip_block_type ip_type;
>> +};
>> +
>> +struct amdgpu_cs_request_radv {
>> +	/** Specify HW IP block type to which to send the IB. */
>> +	uint32_t ip_type;
>> +
>> +	/** IP instance index if there are several IPs of the same type. */
>> +	uint32_t ip_instance;
>> +
>> +	/**
>> +	 * Specify ring index of the IP. We could have several rings
>> +	 * in the same IP. E.g. 0 for SDMA0 and 1 for SDMA1.
>> +	 */
>> +	uint32_t ring;
>> +
>> +	/**
>> +	 * BO list handles used by this request.
>> +	 */
>> +	struct drm_amdgpu_bo_list_entry *handles;
>> +	uint32_t num_handles;
>> +
>> +	/** Number of IBs to submit in the field ibs. */
>> +	uint32_t number_of_ibs;
>> +
>> +	/**
>> +	 * IBs to submit. Those IBs will be submitted together as single entity
>> +	 */
>> +	struct amdgpu_cs_ib_info_radv ibs[AMDGPU_CS_GANG_SIZE];
>> +	/**
>> +	 * The returned sequence number for the command submission
>> +	 */
>> +	uint64_t seq_no;
>> +	/**
>> +	 * The fence information
>> +	 */
>> +	struct amdgpu_cs_fence_info fence_info;
>> +};
>> +
>> +uint32_t
>> +amdgpu_get_bo_handle(struct amdgpu_bo *bo);
>> +
>> +uint32_t
>> +amdgpu_cs_submit_radv(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
>> +		struct amdgpu_cs_request_radv *request);
>> +
>> +#endif
>> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
>> index 4cad30d1e..97a9ad489 100644
>> --- a/lib/amdgpu/amd_ip_blocks.h
>> +++ b/lib/amdgpu/amd_ip_blocks.h
>> @@ -20,7 +20,9 @@ enum amd_ip_block_type {
>>  	AMD_IP_UVD_ENC,
>>  	AMD_IP_VCN_DEC,
>>  	AMD_IP_VCN_ENC,
>> +	AMD_IP_VCN_UNIFIED = AMD_IP_VCN_ENC,
>>  	AMD_IP_VCN_JPEG,
>> +	AMD_IP_VPE,
>>  	AMD_IP_MAX,
>>  };
>>  
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 0fc11b26c..6122861d8 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -144,6 +144,7 @@ if libdrm_amdgpu.found()
>>  		'amdgpu/amd_memory.c',
>>  		'amdgpu/amd_command_submission.c',
>>  		'amdgpu/amd_compute.c',
>> +		'amdgpu/amd_cs_radv.c',
>>  		'amdgpu/amd_gfx.c',
>>  		'amdgpu/amd_ip_blocks.c',
>>  		'amdgpu/amd_shaders.c',
>> -- 
>> 2.25.1
>>
