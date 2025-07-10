Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16745C83F17
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 11:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71A910E20B;
	Thu, 10 Jul 2025 11:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cwMNCdwd";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2496710E20B
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 11:23:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoc3uq817OSH5LE4dtT5TPuBOZhJy1gq0cqxd85FQok9KiufiT6gR6Y2C+SC2/K61ExQi/+xTfZdiAYnDKzmr6tYDKAfFcqs+zk0IEPo4crLWDGC1aoAPg62LPR1aXL0ZNZdpvShQ0sm4FAC1jesdQJ18Df1pFCmkG+JqIYJHmboSdXxKcOLEOql+ArbPQ2KKLmTBlw5mWcx//Oes9A8SbXiu5JhuWM5wzMeCq6bKebRSYRboBt+xguXMtAsWvruKSaV1oD71bJXeTTjGsKbbZdaD0AstV+1uz7gAcUtlEGhRrbB4NE+c7qZunWCYW87vOlrD1WwlM0lWX1a9ZvI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiBqXV4lnxSESN01/21CH7xCd7eUUsIJYpHwDoqqRG0=;
 b=xjpjtV2kM7rx4YCWN3HrqV7Btm4CvhzmgLL7wn0GXmpEWt8pJ8Gn2J0OC0q8im8wW0YGzj/xI/5w3tNwq61QSB1DuRGKaCO+gzJX4DBvCus12llx8eyeIStNDD0pjQdau+aEXXdOGlMLZdUsvShL8Sct2vxgrlj8+d3NhdWPHpLFXA+DPK2Oz10+fwJ+Is/xFvW0cnumW6piUGWbFyeZVQ5HFMtQHgi2iV7VybwSUPW9QvppXqXzWLRfhXw3gKJKKpvNAKeOWPaqeU/EwWi1U6BfQCes8tXnPMMxwsnSEpq5rXrlrcrr5KMyeUOC6kRF1mDEbeGoo7/T+Mvz2Jv3Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiBqXV4lnxSESN01/21CH7xCd7eUUsIJYpHwDoqqRG0=;
 b=cwMNCdwd+T0N7Pp81o7MusJK37Mk+LwTtv36+AiSzv/7rejJDwC4NFfVTaR849Tf8yEAn3YwxhSzT7AqzWMWmeDnJZyS428kvY0mrudVbS4Yt05nkJU2IetuuwkYJcE4TRLTiVpkNNiIT4B5ye38rH4ZYG+gUFU0JGS1C88cOtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 11:23:55 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 11:23:55 +0000
Message-ID: <3263d175-1f98-41ac-a46a-f446f54ba0e7@amd.com>
Date: Thu, 10 Jul 2025 07:23:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/amdgpu: Add test coverage for all
 user-mode queues across IP blocks
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "Jesse.Zhang" <Jesse.Zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20250708074819.624367-1-Jesse.Zhang@amd.com>
 <20250708074819.624367-3-Jesse.Zhang@amd.com>
 <85tt3kk2o3.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <85tt3kk2o3.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1P288CA0001.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::14)
 To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: 226bf241-5daf-4f5b-8a4c-08ddbfa44197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3dUL01GaVdMVDZHTlNvSFVLTWpOWk40MVlEeFRvbGtFQzNJV1liSmd6SzZk?=
 =?utf-8?B?U2tmcHpiaHBFMWhBMlI5cjN2MlNrakZZbXVqRXZFWVcyNDV5dnFiU3p4c0NC?=
 =?utf-8?B?Y0l1TzkvMmI0TUpQRmNVamZuWE5iUmJJN0VIWUIzOGZwaFhWUzdLZzZTNXA0?=
 =?utf-8?B?dGtwZDJicmRRM201QkMxMkdXYWo5b3NVVTA1RkxYdGJnWWw3bmhWdjdtN1ZS?=
 =?utf-8?B?Z1lRdTU2cEU2WDFnUUlEZWxJa254TjIyUW92Q3REbGVMK29IOTlhaWc2Z3Ri?=
 =?utf-8?B?bjFXUW9KMGMzME9VWTdQQXVBb212ZzBEMkdDK1czb1pxdDNYNW5td3QvMUNs?=
 =?utf-8?B?U1FocUh6VnJuRTBCanlaUmxwTGtQdjhSRW5CK1dwYXlLTlAybnlQaGExYmgv?=
 =?utf-8?B?Wkx1bnVvYVNFZnRPaWx3Q0N6TmRrSmgwcm1OZTlGR1FHVmFHNEJzelRvcENS?=
 =?utf-8?B?ek0waXplZnJqWHExR0xodVhWSFp2empMWW9MSmtOQVMzNzlMNEpTb0Z6dGFC?=
 =?utf-8?B?L2xiTThWckxZZ0tFbDNjcVYveGlzMjNMN1dFQmVLZXl6M1BxU2QvVEFzR3BO?=
 =?utf-8?B?OWF3ZXcrbVdUR0ZqSjIwYnl5RGw0Ry9hWWQ5NytYdCt4c1Y5OEl4K0F2dm1E?=
 =?utf-8?B?YmpNOGpIaEZEQjFUUFVZNjRqQ3RLaE9jVHZ1clZpb2JWc3B1UE5aazZrZWg2?=
 =?utf-8?B?bG9wdkRsVlBQVkVRZWFzVUtYamZGaHowYldnTkNvT0JsbWlrSjhPUTB6ZDNQ?=
 =?utf-8?B?enhpREdaWHNzd1JJckxqSmsrR0dkQml6THpSTkhHZmZNTU5SVHlzL2x6WDgr?=
 =?utf-8?B?QmM4NWZDRmVUeitidmNJd1dDTlFPRllIbUtLR2pzWDdKeEhXK2IvQkwybjNj?=
 =?utf-8?B?RmdmejBlMHd5TVFZZkxxMkUyTUREcXpZOGZGVWlaR2J0WEo1UGdSQnhRSmtI?=
 =?utf-8?B?UGJUdkk3WDN0MkQvS1N5WEVDYVJodGxQUHFCMmtlZk4wamFUYWsvL3ZGcDI1?=
 =?utf-8?B?U0VIZjNwaUxvZXRtU2lsdVZndURQdlNBUkxRWHVLU2pXSzczc3hNUDJtR1Rq?=
 =?utf-8?B?SHBhbWZ0MlU5ZHh1cUROWlZhVkJDK3A0NjJlaUF1TGRVSGxKYkZQWU5LWFpk?=
 =?utf-8?B?RlZOek1xdGFRbmdod0hmZjlSVTVlQkhlQ3pmREdReG13NjQ5TExSNVkwOWhW?=
 =?utf-8?B?TjQ3ZDFSdkk5cUNmZkR5NDl0NmNkNnkzNU42dGNXbHRJSUdyMTE0cEY3NlBL?=
 =?utf-8?B?Z3JuUGs1T0lBbWU5Ymt5VVZoTEJ6R3pGS0orc3FoZGJzSTY4WStJSmtHeHl1?=
 =?utf-8?B?Y3NZSEd2a1I0dDI0ZU9aUGUzeDQ2ellDdXhOeTBVcFZwMjF6VnRDbFdGRko2?=
 =?utf-8?B?QzRJTUVRS2ZmQm9Cb3MzMU1YY0c3RHRBSWxhTEQ3SGk0M0dRKzMxWnJHRVV2?=
 =?utf-8?B?TzhXQnZ1VnV4REdKUE5QZVBIZWxuRkN0cVFxTWEyT1U2QWpxcHpiejdsK2ZO?=
 =?utf-8?B?N0xnR1E4MXF5Mnl6WEpPbVlWV0YzbXl1a3VTRlVHSE4xQ1BCSWRSSG11Wklx?=
 =?utf-8?B?SlhHN1lWeGtaaFhLcDlrZUVQaUdtVjEvMTYreW95dGRKNGo1ZU9uNyszL1Qr?=
 =?utf-8?B?c1lGVVc4RjBCaFpHY3A0TjZpampxc2ZSa2NPK3duYW5rWnBhUi95RndqL2RD?=
 =?utf-8?B?SFVWcTlyRVhNYnExRHJJOG9xbVB0YTBIemF6alBXYTNMNnJSZmlDbXBvNE9Q?=
 =?utf-8?B?NjFHUEU4TS9FOFdXZlNvTzg3c3lDbEI3ZVNEa1FEcmRRQUducXNhdGJwN0Uy?=
 =?utf-8?B?OEF0QzBLTUZDVUpYN3diWE1wcHBrT24xTEkzUnl3TFdrVnJrempOYk9LZnV1?=
 =?utf-8?B?NVBtSFVkRk1jOHJaU1JWeW5xb3N2bDhSWGFtU1dLQW82Sk1EZjcyMzhjcTBK?=
 =?utf-8?Q?dJH1EFU08Y8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clR2RStVMzUrTS9pWDhTZlpOSi9QSmFXY3VhcnM0ZnVGVGQ1aTV3RDgzK3dJ?=
 =?utf-8?B?WDVkQk9qQWhwbFVwaldtRVNkZGsxVmg3RGU0RXVVTG1WMlo5S3VWNnBrSnV3?=
 =?utf-8?B?Y1JWUUpJNTF0aHRxbGpzcStiWFc5MFJUNzNqTU14M1dyR0NMekZIY3dRQnpi?=
 =?utf-8?B?endKaVdsVGVrNUsvZEtDQVV5VE9PdXNCZjh0RlB6MXd5TE1lZ1BJV1g5dDdL?=
 =?utf-8?B?RkVQcjllaTM5MlpIS2ZMZitHZzZRMytlMkFlNmpkZGNZNGhmVFo5Rnh5Mmhp?=
 =?utf-8?B?MEtKYWRnUUFTTS8zOG5nUDJvV2FiK3V6TnVMdkl2MjZ2UjQzMTI2VGpuVDZQ?=
 =?utf-8?B?amNvZ1Jmc0JLS2FrbEVkNHpKVU9aaUYySVNIUm9GUVVQZE1yMGE4WGNPclNI?=
 =?utf-8?B?ODRkVjNhTDEwYXpraU95dkNJaXh4VEMvZTZrOWRrRFZGSFlyQm5lbzZpbnNs?=
 =?utf-8?B?Q3JSTEc2bFR0TEpVdzZsL2JkSkxJWVgzZ29SUTV4RzNaazNKc0wxVlF1OHl0?=
 =?utf-8?B?ZmlpMnlnMEZUVmFvT29nWEFHbGplS3FiRFNQMjJhUXpzY2ZvRmY0S29hTkVS?=
 =?utf-8?B?SlZyOWdPeSs2elJqeWlHTllKeXNUVnlab0NRaEorVW9zWUhiRXliR1czSnB3?=
 =?utf-8?B?OGs4OWg4Z1NzQkswakg3MVRveG9rUHNMY3I1V2hpZWcvT1ZYNWx2S25WS3Aw?=
 =?utf-8?B?WDVBNmhlalJDM3RQdERYb0N5bWxUVjJQUFRaa0Fud3l6TzVFYVdpZnF3N2VG?=
 =?utf-8?B?SWdjbXhyQjRHUFNaOGloZnJhc09PYXMrUWYwK203WnkwT1FJOTZHWEVoY29Z?=
 =?utf-8?B?RWJUWEFQWnIvOUFGQUw5bVByc21jblprbXpYbEdLYzM5MUhSK2F1WmJuWGo1?=
 =?utf-8?B?dko0WkU4Z1lmdXU1OEdVbXQ1eFhOS1VkaktlUjZqdUIwVHNRMGJuVVVvZ3N4?=
 =?utf-8?B?NFI0endrQTlEcSt2RzMrdGhHQk5rczZXUXgyVTBKTUVWUkdLblBqcldwY25E?=
 =?utf-8?B?K2VKcG1rWEhoOW40M0FqaGgyQTVieCtVeTJnMEdPM0JpWkJRek1QdFkyN3JQ?=
 =?utf-8?B?Vi9wSGlSazlYSnBKeit3aUliVU9aWkFaVmozc1k2ZHE2QUk1MVZpdkl5UkdD?=
 =?utf-8?B?UGJ5bFFudXpoM3ZFYzcyVXJjbWZ0Y3o1NzdKZUFDODE2TGhZSGw3ck1VZmQ4?=
 =?utf-8?B?emRFVWg1bnIrUUhJSTVIa1ZubERkMmhoV0lRTENLS0orMTVNNnRLYkcydmZl?=
 =?utf-8?B?a2hLOXZGakVQMW51Yi82T1grMkFaemRrMnpGaXB4R0cvelIzWitDZ01hUXQr?=
 =?utf-8?B?YVFTcTVneG1ncnZVNWVDdUNicG95WlFJaUNqSEtLeVpRTVlGbGJNc3BraTBr?=
 =?utf-8?B?MFdWNGNzZzZLVVRMYUtSUjlMVXU4ZWNPbVUrZXo3cnBmbHdIcXZLRThBWFFv?=
 =?utf-8?B?T0RTT3ppdGEzajRoUHRRQjZrSC83Y2lqTTh5OHM5WjhsRzkyMnlua3BkL3B2?=
 =?utf-8?B?VXNPVUJoVDZGYkoyd2c5anBJNDhLVEt0YkpJZll3bkdqcnE2NnlUdUZzMHU4?=
 =?utf-8?B?MUZYcmdIaE9jdkRNc2JDNEgyZWRKWEtiaUhXNTg4M2lVZmtaZjc0RUU5aGhn?=
 =?utf-8?B?WVZuZTZPclBWMFFPTjhsa0RhT3FsN0JZNFJwL2t1cVFEcThXVnBtVzR6N016?=
 =?utf-8?B?bXBFTUU0b2YrV3VaNlQycTJ4azc2MFNubmxud3JDN21OTmZFNEx3eFRHU3kx?=
 =?utf-8?B?dmptWit2MnE1R0xjZ043MElmSkdCeGlvNE5UQVBzVG9Qa3Z2WHJLeFAzVlc4?=
 =?utf-8?B?d0hWS0hPb2xLNGduTjM3ZmFBYU94NzJzOHM1WUxrMnFZWkVJMit6NVZ4eE1S?=
 =?utf-8?B?VWZ2elFKNEhnUGRTSmE4S0Y2OWJlZHNGWXFVRnlydXE5VHF5VEY4Q0I0aEp6?=
 =?utf-8?B?SEZ5MForOU9WQnREbXZmbHZ6aUNISnB6NUxvc3ZHSEZaYjBibTJyMHVyN1RY?=
 =?utf-8?B?T3g4WXlvekU2cGtCSE8zbkNYSzdraU9KUUJyb05FV3BOYmVlemkzZDNmbWI2?=
 =?utf-8?B?MGZ2c0VJOHhtbFRDTUh6VEdIaGk5RmJ4NStPL2duUjdlek51ZWVKL2x6K05p?=
 =?utf-8?Q?T23ry20PnBci8+T8dmRjrFtF/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 226bf241-5daf-4f5b-8a4c-08ddbfa44197
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 11:23:55.5358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yf23LJhPpSSP9SqIx4YNLjffr7Rndjj9ykZ1afskN48FV96C0JQuVGo7glx1dUVdQQG8JBpyghak00pdXclniw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198
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


On 2025-07-10 01:58, Dixit, Ashutosh wrote:
> On Tue, 08 Jul 2025 00:47:49 -0700, Jesse.Zhang wrote:
>> Introduced a new test function, amdgpu_test_all_queues(), to validate
>> write-linear command submission across all available IP blocks (GFX, Compute, SDMA)
>> with user-mode queues (UMQ).
>>
>> - Adds a dynamic subtest "all-queues-test-with-UMQ" under amdgpu_basic to ensure
>>   all supported IP queues are exercised individually and in combination.
>> - Uses the newly added helper amdgpu_command_submission_write_linear_helper2() to
>>   manage setup, execution, and teardown across multiple IP types.
>>
>> This improves test coverage for command submission paths involving user queues
>> and multi-IP coordination.
>>
>> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
>> ---
>>  tests/amdgpu/amd_basic.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
>> index 8c6b466ce..100a634ce 100644
>> --- a/tests/amdgpu/amd_basic.c
>> +++ b/tests/amdgpu/amd_basic.c
>> @@ -139,6 +139,14 @@ static void amdgpu_command_submission_sdma(amdgpu_device_handle device, bool use
>> 	amdgpu_command_submission_nop(device, AMDGPU_HW_IP_DMA, user_queue);
>>  }
>>
>> +static void amdgpu_test_all_queues(amdgpu_device_handle device, bool user_queue)
>> +{
>> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_GFX, false, user_queue);
>> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_COMPUTE, false, user_queue);
>> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_DMA, false, user_queue);
>> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_GFX |AMDGPU_HW_IP_COMPUTE |
>> +							AMDGPU_HW_IP_DMA, false, user_queue);
>> +}
>>  /**
>>   * SEMAPHORE
>>   * @param device
>> @@ -830,6 +838,16 @@ igt_main
>> 			amdgpu_command_submission_sdma(device, true);
>> 		}
>> 	}
>> +
>> +	igt_describe("Check-all-user-queues-for-write-operation");
>> +	igt_subtest_with_dynamic("all-queues-test-with-UMQ") {
>> +		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
>> +				userq_arr_cap[AMD_IP_COMPUTE] &&
>> +				userq_arr_cap[AMD_IP_DMA]) {
>> +			igt_dynamic_f("all-queues-with-umq")
>> +			amdgpu_test_all_queues(device, true);
>
> Please clean up this warning without AMDGPU_USERQ_ENABLED:
>
> 636/1531] Compiling C object tests/amdgpu/amd_basic.p/amd_basic.c.o
> ../tests/amdgpu/amd_basic.c:142:13: warning: ‘amdgpu_test_all_queues’ defined but not used [-Wunused-function]
>   142 | static void amdgpu_test_all_queues(amdgpu_device_handle device, bool user_queue)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> [1526/1529] Generating docs/testplan/intel-ci-tests with a custom command

Thank you very much for the email. I’ll proceed with another patch today, as this one has already been merged.

Vitaly

>
>
>> +		}
>> +	}
>>  #endif
>>
>> 	igt_fixture {
>> --
>> 2.49.0
>>
