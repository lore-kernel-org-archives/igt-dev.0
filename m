Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E697C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 13:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C3610F64C;
	Thu, 28 Mar 2024 13:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Vr/thBk4";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C996B10F64C
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 13:04:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5I8EbtYipQg/h7JKIu95r4ACo1tSTo6i7zjljg9hcjbYNrDo9nq0H8vfyIK20BwTpBVXoJ5thwXChVZs2/Jhc19NKLIyyLBJdH9rbfQXt4waj7vFjbijciRbBMZqnLkXYahZrFo+iXZeib0mI5Mz5fu6K/c+5l+22E2Amipq7t3AyWIvhWvwbSMnn+ty1oywOtHEC+hwNAaCOJJR0TSl/OqOThGWqLmDQJzLqKc8Z/YDLDkW9hIWq4D5l1Bl7O7byXqta7RCVylqZJ3fWxPgsuLJRQWEsWSYJJwCP/3VgbISzmluwMYn5jp6W+oxW7XuBQBnf0Qxyhmtkf6mEjNHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWgOXSBh7qhCBg6FeNzoMmH3hEMVC+m5ROL7BODQRt8=;
 b=fgRPUQsG09rn7gU+JJ4aGqboaJyIb2XFzTIBvQspss6R9dsUagBsX4bTQCzDw8aBCSnUnfdIGjYpTXtEr9q6XFD4CfDNT+svGbBUvteYzmFR5ZJ+m10g2vDLMyx59MJBMv3dJ71AdxKmmlzZKMXYTEkqiNZ1yudgjpSGPy7MXhoUmgCtiFZF3Xp4o5GdPVf1BJKXgfVKd5twG3lq6nuZMVsA5Usrv1BPNEmGWLRexpamyZ1lswf8WOQJ4n1wmwuaTGsHajXu81/WsIDvdQ6rzUfBm9XHlt5DmtnPDXAI5bJFW0J3tVcNw6SoH5ZvP0HAFw2ZtbILVcxQ7rAg7QJ6cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWgOXSBh7qhCBg6FeNzoMmH3hEMVC+m5ROL7BODQRt8=;
 b=Vr/thBk4wAhyJ4dDmsjvpwPqo9PZMeLZavjkCA65FlWbTVgMmeEKhC06FOqROxwhtjG7+PceDLraKdbUTrk1t5PkdA6i/GyjGmDB2v81uEScWpeUGvcCy4DwOtpuk3i+VojcAbSOjzZQdp0tbX9XWuYHykUWJ/BzgDZqQ/JMQNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 13:04:27 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::ee1b:768b:715f:e5b5]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::ee1b:768b:715f:e5b5%5]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 13:04:27 +0000
Message-ID: <4caf8ccb-b403-41a9-bde7-e7895761221a@amd.com>
Date: Thu, 28 Mar 2024 09:04:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu: add gem create fuzzing test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>, Jesse Zhang <Jesse.Zhang@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>
References: <20240327042703.471787-1-vitaly.prosyak@amd.com>
 <20240328130141.whwcrpyud4kt7zcf@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240328130141.whwcrpyud4kt7zcf@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::46) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eb37436-e3bf-4bab-817d-08dc4f27991b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HV0VEY7vW83V04Sox3jzxlbARuHRlMLfL6WVg3IlbbY0CKGTk7wxu3T+pUJyMMZ3VEaQjILFAWNmMJlGFJEp9RDw5UmPX8eHHF2hRVU5ac+wVujS9RTQ+2MtSemcH4E7rnXN520+h9JsFCYSUbGAWRT7qJ07/J/R0y/2AKu/ljFwqqh0B6woDsbiiPevYtO7F+OYuDd7L16jDHyKcGtbfT2v5/UHKS66FV+pDyFModUphx4thZh59kKrXXq6+uVxXdUXWy75gVC6fD+uDcLI9wPYcxBkP685/EN8eDAF1lSWREDZexzm+erZLUolvv14KoD3FtPge81Th30WOS8mUfHJbmbAoz2OUOmFNjL+NKkjPV9JT7wKebOEguGnl08S3TTbRzqdFYOLje+FxuCacMC+MkXPb/4nrg7C/OY310idbXwPNSFATvtGuD7CgpQMZvM57+XOHV0yda2RH10vHMUCuzRxY99E0f59O/RXDXBkFDYK/Bl+ahnR4ztzDCo42Sybk73qJspH3anlmlrKeYAdt+ejbn5v0iOp+XhMn9E/e2hK3bWBTzstTfehr8xD/Sz8Xnk054XAtgQz3lIdVS1Ri76BnWsZNFX01D7Pm+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXhvN3BOZFNCaXM4Y1N0KzNpaFhNQVlZZmw0Uk5EdzN4R2VibmFlaTJRRGNK?=
 =?utf-8?B?N2tpdkI5WSsyYTFrK1UxSXZEdlZhd050Umd0K2ZNSUhrTnFKRjBPbnpucExS?=
 =?utf-8?B?U2V3cVRnMWxRVWZvN1U1VndGdHlNZk0yeC9zcElTZkMxaHRaRC9IL0UrNWU5?=
 =?utf-8?B?L2dqSHljRGRtU3J4REU0aXM3L2JpaGVoRHdaOUdkMkI0YUZydlZ6RHVtQzlz?=
 =?utf-8?B?NktXK3g1WGNrWmdNNjViMkdqcjNMZDFWOERSMU9zUE5zQWdURVFzTk0zek8x?=
 =?utf-8?B?cWljcU1IMGo2aWI4UEFNQW0zMFJsaFVMbWFleEd6cFE5UmR1UHF3K01GSU1Q?=
 =?utf-8?B?U0FBY2ZGQ2JBVGhLODhXVVBOV0l2QmlzR3AyVHp3ZEhNTE9sdXcvVE1NT3p0?=
 =?utf-8?B?ZDJwMjlGY0VualhnNDV6YW5udWRqTm9GeFo2by9DSU1BUmVmbXluUlFTY2da?=
 =?utf-8?B?cVQ5QjJDdXVQV01CaTg0azR0NkhYRkMwaUczWVlaTzBYUXc5UFJXdVFzK0hB?=
 =?utf-8?B?MUVUeGdxV1dhNjBaSk42ai9uR0R0SlZwNmIrdFJadThuZDU2ZGRrdmlhQ1cw?=
 =?utf-8?B?TTN2Q3YwZTlNMmMxN0VJM1ZhcWlkRExyS1NTM085dDJMcFd1YjRmbG8wVHNw?=
 =?utf-8?B?Q1EwdVY0MnlmWHZvaVByZzRBZGJwQ1FVNjNnYTRlUU5YKzJZNlNUR2E2L0I5?=
 =?utf-8?B?Z2lrMXZxMzFXTHBxcDhCOWJKWUJzejA2MkV1c1RCb3E0dnBaQktmdFd1Vndx?=
 =?utf-8?B?V3piYXBXdzBKd0NORlI1M3c1Q0Y1ZFBucm03cGQ2SkhaclVQaUJTRWFCbm5z?=
 =?utf-8?B?SHhscHlhL2xrdllKV0RoTk0wbStnNXNyb3RCQ0FndjBHay9QbFlCSmVZbmpW?=
 =?utf-8?B?eGxGSDlZKzJMRjFVc1ZDREY1NVJWd3pWdk45OEMvTWQ3aExieEJvSHJ1SmNx?=
 =?utf-8?B?T1diNUNCL1RHb01yQ3ZvbDJVRE5YbEJOZnIyVnM5YmZYaHZPTUh5bGN5cGlB?=
 =?utf-8?B?NE5lWXB6VEJ0R3l2SzJuVEd2SkNsMGl4QnVTQlNEbFp1M21IeXhCMEk5VVJn?=
 =?utf-8?B?TFJQNWcvT1lUc3V1d0hMZVFsRUVRdU9HNkFwS0ZIb3c3Tlc2SExEMHN5bXNS?=
 =?utf-8?B?azJidGlwS0NjaVJCOE1FT1kzakpYM3JDRTNXdmZ6ZVk3SjFPbjRqRExpZ3R6?=
 =?utf-8?B?UUhLKzBTZXhhcWlhUnZGZHdQUUhMVFBPcFZ1eVpxbmJMeTlvblpXa2x1KzM5?=
 =?utf-8?B?a1BmYXQ4V2xHVjg4SjlwdjlrTVJqK054TUZRL2d3R21aU0VMTG52K2kwUWlM?=
 =?utf-8?B?N0FQUEdqYWtrNnZuS3cybDh0Ykd6Rm1vK2pTZEV5WE5ZdGFlMDhxSUJGTGRu?=
 =?utf-8?B?MXloNFVDZzltQ0YyT2RZUW5CR1BacGVJREZQc2IrK0JJc2trNnE2QVpTTkN6?=
 =?utf-8?B?R2VGYjhmMXZ5bElTamdSY0FPVjl0RGhsTUdzcUw4ZzhaVWFZSUtpTlMzYkF1?=
 =?utf-8?B?Sy90QlVqVnBXQTJNVU9TbmhXamQ0RlhXQlpBNkd1N0NOOWpScHk3WTI0MzJD?=
 =?utf-8?B?UkRWQkZuOWtRekcyd2pETUdKMkpSVjdzY3Q4eDN4aVdFWGZWN3BLZm1vSjNU?=
 =?utf-8?B?MVFGY2RKNEpsTk55Yjc5cUt5VnhJRFJIdjFpbXcyZ0tGTGZ2S2h5UGZtRk1u?=
 =?utf-8?B?aW00SWxHbHVSTVExVHdKTkxweFhTdHhpNzlCcVpLVUxxTFRwN3JnTzdXcG5X?=
 =?utf-8?B?VW1IenlsVDA4M3pBeXlaMTF4dmo0MmJPRzNGdUg2UGdubkFCdmVqeUg1S3N4?=
 =?utf-8?B?TUhGaktINGV3K24zblprdENVTmF5dERxTlhjZE5OMVBXaW5xU2ZCc24vdXoy?=
 =?utf-8?B?UDRSN3d2ZnlmNVEwbnRiMTdUVjFPM3QrYVBzeElKV0h5NVByM2V4a3U1YlM5?=
 =?utf-8?B?RlhjSE1sTlhnUFVKc3Y1b1Bqd253UkhCUklQZ2JyS3BXVG5ySXBQY0VwQ3JX?=
 =?utf-8?B?TVh2WkYza3lGT0REZjBXUTg4by85VWVrcURMeXYzcDEwQXV1YmRTV0tZTUFJ?=
 =?utf-8?B?MExLM1I3SG0yY1E4L2RnM0M3V0g2UU5ZZnZCamZ2YldMSEpjQVZFcGhLMncz?=
 =?utf-8?Q?+WbL52WXykGLU96snZWa/a1Kf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb37436-e3bf-4bab-817d-08dc4f27991b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 13:04:27.3301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htwySl0lx4XUo0HnHhlAIRUOexVyE60XWOkS7OVZUvgVKSHVkdYvvx42IZrTJz5yVMpl8P6mZjkbcEJVz/yaQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949
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


Thanks for your email!

On 2024-03-28 09:01, Kamil Konieczny wrote:
> Hi Vitaly,
>
> On 2024-03-27 at 00:27:03 -0400, vitaly.prosyak@amd.com wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
> You didn't address my comments, I have also more nits, first is
> your code fails in GitLab check:
Sorry for delay, i will do
>
> meson test -C build
>
>> The bug in amdgpu was found using customized Syzkaller and with Kazan enabled.
>> Report a slab-use-after-free bug in the AMDGPU DRM driver.
>> Ftrace enablement is mandatory precondition to reproduce the error once after boot.
>> The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
> - ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Instead of this write it as Reported-by: before your Signed-off-by:
>
>> The following scenario is a different reproduction of same issue:
>> BUG: KFENCE: use-after-free read in amdgpu_bo_move+0x1ce/0x710 [amdgpu]
>> https://gitlab.freedesktop.org/drm/amd/-/issues/3171#note_2287646.
> imho (note final dot removed) it is better:
> https://gitlab.freedesktop.org/drm/amd/-/issues/3171#note_2287646
>
>> Fix Christian König ckoenig.leichtzumerken at gmail.com
>> https://lists.freedesktop.org/archives/amd-gfx/2024-March/105680.html.
> Same here (final dot).
>
>> The issue is visible only when Kazan enables and dumps to the kernel log:
>> BUG: KASAN: slab-use-after-free in amdgpu_bo_move+0x974/0xd90.
> Add newline here.
>
> Regards,
> Kamil
>
>> We accessed the freed memory during the ftrace enablement in a
>> amdgpu_bo_move_notify.
>>
>> The test amd_gem_create_fuzzing does amdgpu_bo_reserve 2 times.
>>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Joonkyo Jung <joonkyoj@yonsei.ac.kr>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Jesse Zhang <Jesse.Zhang@amd.com>
>> Cc: Tvrtko Ursulin <tursulin@igalia.com>
>> ---
>>  tests/amdgpu/amd_fuzzing.c | 69 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 69 insertions(+)
>>
>> diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
>> index 69c9e8dad..dccac8cc1 100644
>> --- a/tests/amdgpu/amd_fuzzing.c
>> +++ b/tests/amdgpu/amd_fuzzing.c
>> @@ -95,6 +95,67 @@ void amd_cs_wait_fuzzing(int fd, const enum amd_ip_block_type types[], int size)
>>  	}
>>  }
>>  
>> +static int
>> +amdgpu_ftrace_enablement(const char *function, bool enable)
>> +{
>> +	char cmd[128];
>> +	int ret;
>> +
>> +	snprintf(cmd, sizeof(cmd),
>> +			"echo %s > /sys/kernel/debug/tracing/events/amdgpu/%s/enable",
>> +			enable == true ? "1":"0", function);
>> +	ret = igt_system(cmd);
>> +
>> +	return ret;
>> +}
>> +
>> +/* The bug was found using customized Syzkaller and with Kazan enabled.
>> + * Report a slab-use-after-free bug in the AMDGPU DRM driver.
>> + * Ftrace enablement is mandatory precondition to reproduce the error once after boot.
>> + * The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
>> + *
>> + * BUG: KFENCE: use-after-free read in amdgpu_bo_move+0x1ce/0x710 [amdgpu]
>> + * https://gitlab.freedesktop.org/drm/amd/-/issues/3171#note_2287646
>> + *
>> + * Fix Christian König ckoenig.leichtzumerken at gmail.com
>> + * https://lists.freedesktop.org/archives/amd-gfx/2024-March/105680.html
>> + *
>> + * The issue is visible only when Kazan enables and dumps to the kernel log:
>> + * BUG: KASAN: slab-use-after-free in amdgpu_bo_move+0x974/0xd90
>> + * We accessed the freed memory during the ftrace enablement in a
>> + * amdgpu_bo_move_notify.
>> + * The test amd_gem_create_fuzzing does amdgpu_bo_reserve
>> + */
>> +static void
>> +amd_gem_create_fuzzing(int fd)
>> +{
>> +	static const char function_amdgpu_bo_move[] = "amdgpu_bo_move";
>> +	union drm_amdgpu_gem_create arg;
>> +	int ret;
>> +
>> +	ret = amdgpu_ftrace_enablement(function_amdgpu_bo_move, true);
>> +	igt_assert_eq(ret, 0);
>> +	arg.in.bo_size = 0x8;
>> +	arg.in.alignment = 0x0;
>> +	arg.in.domains = 0x4;
>> +	arg.in.domain_flags = 0x9;
>> +	ret = drmIoctl(fd, 0xc0206440
>> +			/* DRM_AMDGPU_GEM_CREATE amdgpu_gem_create_ioctl */, &arg);
>> +	igt_info("drmCommandWriteRead DRM_AMDGPU_GEM_CREATE ret %d\n", ret);
>> +
>> +	arg.in.bo_size = 0x7fffffff;
>> +	arg.in.alignment = 0x0;
>> +	arg.in.domains = 0x4;
>> +	arg.in.domain_flags = 0x9;
>> +	ret = drmIoctl(fd, 0xc0206440
>> +			/* DRM_AMDGPU_GEM_CREATE amdgpu_gem_create_ioctl */, &arg);
>> +	igt_info("drmCommandWriteRead DRM_AMDGPU_GEM_CREATE ret %d\n", ret);
>> +
>> +	ret = amdgpu_ftrace_enablement(function_amdgpu_bo_move, false);
>> +	igt_assert_eq(ret, 0);
>> +
>> +}
>> +
>>  igt_main
>>  {
>>  	int fd = -1;
>> @@ -114,6 +175,14 @@ igt_main
>>  	igt_subtest("cs-wait-fuzzing")
>>  		amd_cs_wait_fuzzing(fd, arr_types, ARRAY_SIZE(arr_types));
>>  
>> +	igt_describe("Check cs wait fuzzing");
>> +	igt_subtest("cs-wait-fuzzing")
>> +		amd_cs_wait_fuzzing(fd, arr_types, ARRAY_SIZE(arr_types));
>> +
>> +	igt_describe("Check gem create fuzzing");
>> +	igt_subtest("gem-create-fuzzing")
>> +		amd_gem_create_fuzzing(fd);
>> +
>>  	igt_fixture {
>>  		drm_close_driver(fd);
>>  	}
>> -- 
>> 2.25.1


Thanks, Vitaly

>>
