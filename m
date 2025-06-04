Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEF3C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 23:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A3810E79A;
	Wed,  4 Jun 2025 23:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4Hok3Jvz";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DDC10E79A
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 23:50:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0UvlpB/x1BqRlKuF5LAc8wtqW6AfnwM+U1aCZa8QFF/s5EHeqemgDsHvJl6ztvha20Q+guQFooOAUfpGVIt8R+gqtKZ8oncI02rcPbO8odaZTMfCPOCSFTHRxzFYBhZcG9OybW7YLJ5vQZmAFpJzBeQh4NFTGW4c7/aD4vKFrw2OpNMbXiVoa1mq15EaEffGFT0FRGnf489K6UMAkujIokfxCTaViwPZSJXYKmqIaNy+h1KK6YQTevn8WcupMUjDdx38t9lscQ0OXOXJ0lLB4TijwjC9/tYJNcoj2V5ZW8vBeB/ZxGa6Pa3809mu04nc9SRGOuxebK3IFS3vpxYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9jTS6FE7chnn950K4ellY+ZQEZTDTfCgJu1WThcSFE=;
 b=i1lwlpFggMymeYaBQl9sR/FkBZpV/I2Ay08qrcyYXDZC2DW/ZIxE9qvbm8W0MuGNwtWPRAJte35a/8eA9cwEfx94oCNJlGIo8k8OtU1wedmFMyr2uOMfvJ2nrUc0B6qLP/sAr7qzLpYzTjPMDrZpl5aivVIWYRpcwZbYKumgiivGIjjZ8yO+yi401KCiqPhn6k8Y2J5wJb+Ddq8eNw4SEIpFw2zREF4XixyFO0OexE+KrZivtRi+yKTQFis+X3Vg6GK71ndVUVPDSmH7d8lKBM6NXBnWnFMSvxv7mP9kKEFcAQdaW7KjGU8htx3QNpA2wJ9eUHlCA7lr6vzj1t1tRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9jTS6FE7chnn950K4ellY+ZQEZTDTfCgJu1WThcSFE=;
 b=4Hok3Jvzm7fAI1ZvnGKybTaV4b5YwICK8VDANhV5UCyRmnpR7pzA3rVAqYElsjpilQMUulqQBX5qfNgVvvjgMsRKTQj7GNGprcyKOQK74d1DBFO5nsW3m7pJNMZgz7qrGUoQNrT3aJSudYF5FsyQgx5RqWpltmyowH/xv3L9EM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Wed, 4 Jun
 2025 23:50:25 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 23:50:25 +0000
Message-ID: <bd7d7b93-360f-4e21-acb6-11a0fe8e55f8@amd.com>
Date: Wed, 4 Jun 2025 19:50:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] test/amdgpu: implement jpeg queue tests
To: Ruili Ji <ruiliji2@amd.com>, igt-dev@lists.freedesktop.org
Cc: Ruijing Dong <ruijing.dong@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250604234652.2715698-1-ruiliji2@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250604234652.2715698-1-ruiliji2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0039.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::22) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CY5PR12MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: cdad64e9-229f-4102-3e82-08dda3c2936a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N21yaHlzUGF4WkExbVZFK0d1SzBaVzZ5cFlidTlBMzNnL3ZQYm1SVzZsYTJY?=
 =?utf-8?B?Sm5FZzJYVDhRNCtUblRSb0ZoR0k1WEtOdXBvT20wbjFDb1JlQ0tBRU5mam1q?=
 =?utf-8?B?VnJBS3FzVkRqblowQnByN1lQMXNHRGZ1M2VRYkVma0NUTmVLQzg1c3Bya3Fk?=
 =?utf-8?B?NHhDWUp6TGR2U1FVd2ZGVDROVU9kOVREMEFUNXlidEZ2bFcydFRFOEptQ2ZK?=
 =?utf-8?B?SzhYd0xNMkYyZ3R4aFVxajZjbVdFY09POW01M1FocHd3OE51ZG1YWTY0ZmF1?=
 =?utf-8?B?clM5M080R2dKYXBwdFNZTkJ1Y0NYbnlVUWxxQVVuaWU4a2lhNk1CSlNpT040?=
 =?utf-8?B?UXVLMWxJM3hrdHIzc1FsUERsSldhUE44SDliNFVnRTFrQmJQUHNzYWlqbUlT?=
 =?utf-8?B?TC9rUHZXMzlnTzJiQ2pjcCt0S2M1ZCswNU1iazNlVFlyalh2d2xTQjBkd3Zp?=
 =?utf-8?B?bmxHRDJ3ZjZHQ1FobXN0SXlmQW5nZFpGY2ZjOUo4SU1BaTFkT040U3BidFNu?=
 =?utf-8?B?cEtmQ1UyeTEya2JnY1I0T1lxU01VUEowYmx5NTVOcVl0cjUvKzduelcrdHBX?=
 =?utf-8?B?UitXNkE1d0ZxYzhCaE1ObXhtMjh1eS9TVDZFd000am5Da0FEZ0VQeDYxMzVm?=
 =?utf-8?B?dmdBQUhrb3RlbjcwZmpES3dOTlFadjBsdEJPSDJqS2xqbFI2emVKMFRmek9x?=
 =?utf-8?B?QlliNisxczZhdXlxR0FKd1llYUpBR24xWWtyaGQ4VkNzaWMrTmduTDdFZlcz?=
 =?utf-8?B?VGdvM0hwZ0U3LzJubHJYT2x5b1M3ZzdqNTFVMXgxU1NFSU1tNE1qdnJqU3or?=
 =?utf-8?B?R1JLSHowU3lMNjV3cFA3SE1yU25aL3ZaRTMyVWQ3L1JZOERIeWV5S2dsWk1o?=
 =?utf-8?B?YldTZDR0Y25JRXl2dHgrbzd5R0ovbEF5ZlpZeU5uRlNUT3UyRmpLTGh5UWxx?=
 =?utf-8?B?WS9kRHdxRy9sR2ZidGJmdVlRa3hsTHl2Z2IwTkd0THg2SlR1V3ZtdEJiOUls?=
 =?utf-8?B?ZGFzeVpDTmh6RU9TRGdmR2c5MlVXUy9JemlUVkhWbXNUWmxtVHpMTWJhSDU0?=
 =?utf-8?B?dW9FQXAwTUJpeXdUZHBQYnRRQ1hISFBhRkJxTkNzQTg1NTQxQTV5b2NZVEFX?=
 =?utf-8?B?ZEtpRk8rY0hKbUJMTlpkMmg2MVlOcFhEQ3pZSyt2RjFkdjN6RDVianFXbzFN?=
 =?utf-8?B?Z1V5WEl1VFpmaG5tVDdNdjVoWnk0WjZWVEZmalJLZ1pML0RDaDJOUXR0OSts?=
 =?utf-8?B?ZzRmd0JMZzJQVHRMVkdvTFBvTEovemZKY0RQVnNBTDI3aHNYNFF3bjRkamNB?=
 =?utf-8?B?OFlRNHYyTkdlZHhKWXR2eHRNRGpXRk8xb2FEYzkydmFCMURibHlSYUhCS0ha?=
 =?utf-8?B?SHhmeHNLNDJIV0pKOUV1REs3UVdWSXBJbVNLNC9TL2d1MUh1SExtZ0ZHMDdq?=
 =?utf-8?B?cFdCWkRyOTZVc1dDcWNuMzc0Y1VXbU93elFFalgrbnlPYXVqMkFSWUN1MW9u?=
 =?utf-8?B?NWFpcGhiUDlVUVNGdFZLbEozZTlhQzZteWdCVTFjN0x5MExvWVNuZkJSUlhQ?=
 =?utf-8?B?NVZ1WlArSWRCcDJrWEVCS09Pb082TVB3dndxOGloaHE2QXFFYllvWmNCUXlS?=
 =?utf-8?B?b0d5OHhYR2J0RHFVWitZZHNGeEhtMCtBRGx6NlBzT3JzUjB0dVdvNW1pZUdX?=
 =?utf-8?B?b1lTQnNBSUxkSVY0WmFKRXZWV1NkQUVNelVXVGZ6TlljSm9pblFQSTNUMmdq?=
 =?utf-8?B?Q3YrSC96aXJtY3A5eDlUTTZFOGlWdk1POVV2UzQwN1JDSDZTb0VyanZKdDFF?=
 =?utf-8?B?ZjN6QTZoK1kyeGgxVEo5ejROcExlTXlaUml4U0ZZSUljenlaYVJVN09McGNl?=
 =?utf-8?B?clRTR2lDQVc2blNlcGJSaTBBbGV0L21jQXVhM004eG0rYWgvZFduY2NEZVAw?=
 =?utf-8?Q?VWcCEtVHzp4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVhGWGFNazhnUW1MRTh1bjJKN3E1UEswZVhDYmx3NXJBbDhjNUFSVFJmY2Vv?=
 =?utf-8?B?Z2U5MU1UOEg1VFZ6VWx3S3NENFBvczNUVjJ3WkFJbEdXUlNjNDFBRVZ6K05I?=
 =?utf-8?B?Z1pMSE5DQ0hybU5oamNaOWh5dXBMaVBlMGJmMEVSUHcvZzVUQy9rRW9jLzNJ?=
 =?utf-8?B?M1FUemt3N0EzRnJ5dVVZNmlOak53VkNmNUhDbTA1U3VyMjYrT2RFOEh4aE1M?=
 =?utf-8?B?SGFIQ3UvNzhXZzVTc01DeGZpVkhxRWFqWUFLR2ZqdG9GU3craEVUMlh3VDR5?=
 =?utf-8?B?R3NnVGowN0tvVjg4OWZtYUxpTU11RHBEVUhuTDhoN094MmZvNG94YXNHeGYv?=
 =?utf-8?B?ZDh1NTNMbUppQzJvVzNpMlAyc2lYN0pXODFCOGpWRjRUN2FzRHhuYW9GejNQ?=
 =?utf-8?B?UGRVSlBwb2loQUs0WWFYNUk4UUpTV2NiODNjZW1UcVEwejBYaVpWd2MyejNt?=
 =?utf-8?B?RFVzZVZSMDQ5cEkvY1JpNGwxY200QnllbmNBTFQ4SWxsMWgycDJ5L2VJcCs3?=
 =?utf-8?B?ME9kSnhyVmxoQVczNW9WeWg5d0FtRkZTZTFEN0hrcW4xZWdOM2h0TVdFNGdT?=
 =?utf-8?B?NVEwQ3VUb1hKQ2d3aEo5RzRPaWIzWSt5RjVXOVZHTExxa3pUZFZrc0s0RGVl?=
 =?utf-8?B?VWZIVVJKTmN4SThSU2c1SjQvbDBia0xMNldTYk5rZ1FYM2FOcWVaT0p0UGtM?=
 =?utf-8?B?K3pVT29GSVFQbWdtbEJwN0hoOGYyZkt2d24zWm5WMzBRWjhJRjAxcVNjMTh0?=
 =?utf-8?B?TTVoZ05xaXNCRmNPSWhBTFBRZDE1aHJIc3BhcmkvbHdXRGlRQnlmQWdHUUwr?=
 =?utf-8?B?YTVtY1NIZkRtajlCREVsZ0w5UnZhcDUrUjhvTVBBTHh3SjlNcUJjNkpjQlZ0?=
 =?utf-8?B?L0NISHVjMUROREJzLzNEU2d3K1I5bk1iY0RCNUVRbytLZTZhMVNCZDZrMGhq?=
 =?utf-8?B?U3FSYm9wRGlhZGFBZHNFQzc2VmkwSWluM25nVG83UklCTkpGdUY5WFk2Q01h?=
 =?utf-8?B?M0VFK0lBNktkZ0ZVK3FiTEFPSlZjcmVORnNHZ3c2WExUVHNwZXBuR0JiWkE3?=
 =?utf-8?B?eGxQMU9CeDVOemRIVG9ZRlhMdW1SMDlIYXRpZXVHRnNNSWliQS9IT3F5YjVJ?=
 =?utf-8?B?VmVycTQ5MTVDMUs5dUtpUUxvdktIRVljNStscGhyVE9teGVpbU9DNjd4QlZr?=
 =?utf-8?B?ZjEzc1dEMVlaU2E4ZmlUTmxrZ2lQQVQ3RjBKbjEzdFBuRFNheloybmo5ZXpO?=
 =?utf-8?B?dnRtdUVjUUFpeEhtNGNYMHBGQ1lhUU5veEI1bkNrWEo0M2dEb1FESWo1Y2tj?=
 =?utf-8?B?SnQ4THd3TVBlZ3UzVDV4Z0tHenRXZXJueXo3TkZkVVFsTUM2bTZLS0pCU2px?=
 =?utf-8?B?MHlnME5Fa0ZuMFZZd1NkWHRacVJ3VHlJL1ViWmJvMW9GREUyYnAyTk5jWndF?=
 =?utf-8?B?MUdwajJtSEdnRDFRZ3IwNW1kTVVVSzVNbUR5Q0I2clp2ejFGWEtwU1Z6amx2?=
 =?utf-8?B?dCtDUXA5MmtWRzltSzZmdENmeWc2M3ZXRWlrQktmM1I3OWhxRC9NWk45ajA2?=
 =?utf-8?B?MEtONE5ORmpJcXJWOG95bGo1NURoSlBZWTh6eWlwOUUzYWxmZlRwb3Z0QlAx?=
 =?utf-8?B?RFI1ZkJLcVVYd1F1YjhUN1FXc3RyWUtQcXBTTzNjamFZMVlLaUgzNGF0Yzhr?=
 =?utf-8?B?bzV2czFQcExCREk0Y1oya3hlanFOY3FEcDhBN3AreW1LcC9hVGFJQ2Y1ZHh6?=
 =?utf-8?B?VVpHelpnV1ZtTVhSMFdBZi9hZUM2UTBiY21ab0dQL0E0ZWhxS0pNSjFxZHV0?=
 =?utf-8?B?Ykl5RTJwVW1ldUxDNmFpMkdrVzUrTHBTdEtRd2xGSXMvVmd5cy96YlpnNFVp?=
 =?utf-8?B?UFhuNjlGRk9md2xCMWRHclNTMWdEVktWbitpby9WeVpKekg5U29JY1pnTEly?=
 =?utf-8?B?d3NjdDFRMkg4ak53UTJEUkJqR080ZUlZUG1Od1lHam5KNnFvK0FSMTZ4SjVk?=
 =?utf-8?B?L2hvR1QyWE1DdjNybXBjSzB1RDBXRWlaZUE5eW5EdEV1MnlDYlcrL2lJdUh2?=
 =?utf-8?B?VG9sU0tTbWZXdE0xZFRpbjE4R2JBM0YxRWdHU0xaUG8yNk53WEpveVoxQ29H?=
 =?utf-8?Q?HlIkqCLXIoAKobWbxaHgajVJc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdad64e9-229f-4102-3e82-08dda3c2936a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 23:50:25.1308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBrjXKLn0icIBdDfhyI1MiHVGPxVeYa76e3fsoB7z0aflqu7/60joV8nPB7YVZ68lcksMxjOQtLQnRzeRnAT5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276
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

All four patches in the series look good to me —Reviewed-by Vitaly Prosyak ,vitaly.prosyak@amd.com>


Thanks, Vitaly

On 2025-06-04 19:46, Ruili Ji wrote:
> The jpeg queue tests are used to verify the resiliency
> of GPU. If there is job timeout on a jpeg queue, driver
> could only reset this jpeg queue with other queues (like
> gfx/vcn/jpeg queues) unaffected.
>
> Brief description of queue tests:
> 1. Query the queue sched mask info and select one ready queue.
>    If there are multiple queues, the following steps will be
>    executed on per ready queue (1: ready, 0: not ready).
> 2. Insert invalid content into the normal decode flow
>    and check the result of jobs submit.
>    If submit returns without error, there is no job timeout.
>    If submit returns with error, there is job timeout
>    and driver will reset queue.
>
> Signed-off-by: Ruili Ji <ruiliji2@amd.com>
> Reviewed-by: Ruijing Dong <ruijing.dong@amd.com>
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  tests/amdgpu/amd_jpeg_queue.c | 115 ++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build      |   1 +
>  2 files changed, 116 insertions(+)
>  create mode 100644 tests/amdgpu/amd_jpeg_queue.c
>
> diff --git a/tests/amdgpu/amd_jpeg_queue.c b/tests/amdgpu/amd_jpeg_queue.c
> new file mode 100644
> index 000000000..82d8679cc
> --- /dev/null
> +++ b/tests/amdgpu/amd_jpeg_queue.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: MIT
> +// Copyright 2025 Advanced Micro Devices, Inc.
> +
> +#include "lib/amdgpu/amd_jpeg_shared.h"
> +#include "lib/amdgpu/amd_ip_blocks.h"
> +
> +static bool
> +is_queue_tests_enable(amdgpu_device_handle device_handle,
> +		struct mmd_shared_context *context, struct pci_addr *pci)
> +{
> +	bool ret = is_jpeg_tests_enable(device_handle, context);
> +
> +	if (!ret)
> +		return false;
> +
> +	if (!is_reset_enable(AMD_IP_VCN_JPEG, AMDGPU_RESET_TYPE_PER_QUEUE, pci)) {
> +		igt_info("The ASIC does NOT support jpeg queue reset\n");
> +		return false;
> +	} else if (context->vcn_ip_version_major < 4) {
> +		igt_info("The vcn ip does NOT support jpeg queue reset\n");
> +		return false;
> +	}
> +
> +	return ret;
> +}
> +
> +static int
> +jpeg_queue_decode(amdgpu_device_handle device_handle,
> +		struct mmd_shared_context *shared_context, int err)
> +{
> +	struct amdgpu_mmd_bo dec_buf;
> +	int size, ret;
> +	uint32_t idx;
> +	struct mmd_context acontext = {0};
> +	struct mmd_context *context = &acontext;
> +	int64_t dec_buf_addr;
> +
> +	ret = mmd_context_init(device_handle, context);
> +	if (ret) {
> +		igt_info("mmd_context_init fail!\n");
> +		return ret;
> +	}
> +
> +	size = 32 * 1024; /* 8K bitstream + 24K output */
> +	context->num_resources = 0;
> +	alloc_resource(device_handle, &dec_buf, size, AMDGPU_GEM_DOMAIN_VRAM);
> +	context->resources[context->num_resources++] = dec_buf.handle;
> +	context->resources[context->num_resources++] = context->ib_handle;
> +	ret = amdgpu_bo_cpu_map(dec_buf.handle, (void **)&dec_buf.ptr);
> +	if (ret) {
> +		igt_info("amdgpu_bo_cpu_map map dec_buf fail!\n");
> +		goto err_handle;
> +	}
> +	memcpy(dec_buf.ptr, jpeg_bitstream, sizeof(jpeg_bitstream));
> +
> +	idx = 0;
> +	dec_buf_addr = dec_buf.addr;
> +	if (err == INVALID_DECODER_BITSTREAM_BUFFER)
> +		dec_buf_addr = 0xdead;
> +
> +	send_cmd_bitstream_direct(context, dec_buf_addr, &idx);
> +	send_cmd_target_direct(context, dec_buf_addr + (size / 4), &idx);
> +
> +	amdgpu_bo_cpu_unmap(dec_buf.handle);
> +	submit(device_handle, context, idx, AMDGPU_HW_IP_VCN_JPEG);
> +
> +	/*
> +	 * For job timeout test case, submit job will return error,
> +	 * here needn't return error.
> +	 */
> +	ret = 0;
> +
> +err_handle:
> +	free_resource(&dec_buf);
> +	mmd_context_clean(device_handle, context);
> +	return ret;
> +}
> +
> +igt_main
> +{
> +	amdgpu_device_handle device;
> +	struct mmd_shared_context shared_context = {};
> +	int fd = -1;
> +	uint32_t major, minor;
> +	int err;
> +	struct pci_addr pci;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_AMDGPU);
> +		err = amdgpu_device_initialize(fd, &major, &minor, &device);
> +		igt_require(err == 0);
> +		igt_info("Initialized amdgpu, driver version %d.%d\n",
> +			 major, minor);
> +		err = mmd_shared_context_init(device, &shared_context);
> +		igt_require(err == 0);
> +
> +		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
> +		igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
> +				pci.domain, pci.bus, pci.device, pci.function);
> +		igt_skip_on(!is_queue_tests_enable(device, &shared_context, &pci));
> +		shared_context.ip_type = AMD_IP_VCN_JPEG;
> +	}
> +
> +	igt_describe("Test whether jpeg queue");
> +	igt_subtest("jpeg-decoder-queue-reset") {
> +		err = (int)INVALID_DECODER_BITSTREAM_BUFFER;
> +		mm_queue_test_helper(device, &shared_context, jpeg_queue_decode, err, &pci);
> +	}
> +
> +	igt_fixture {
> +		amdgpu_device_deinitialize(device);
> +		drm_close_driver(fd);
> +	}
> +
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index d3f301e9c..421e686d3 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -19,6 +19,7 @@ if libdrm_amdgpu.found()
>  			  'amd_ilr',
>  			  'amd_info',
>  			  'amd_jpeg_dec',
> +			  'amd_jpeg_queue',
>  			  'amd_link_settings',
>  			  'amd_max_bpc',
>  			  'amd_mem_leak',
