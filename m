Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177D6C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 05:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F9810E103;
	Fri, 16 May 2025 05:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wSAzf8ag";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7949010E104
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 05:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMR0T91NPjA9FIRgg76/qd7OTFSfHpHshOkx0ma7ChRAMlYZPPMUQMzDW/BSEsZHzlwlCyQOMBfK3qr3XqGponVLAGnHZU6I9uxC2Y4s+2RWlMh+FNDNlbmd/E1kQc2O8897jzOcrEMGsaGM/i1pjV9F+GzPLDmqNUwQttsmL9qf84zqCMrN2JgP9dyYC5taHnpZkJ9V1lu0gs7InALYg1wI6c8KS6+SOWCX6b7xSJZzc61S2+a/lxt3thep7fcJ/CummJB6HdDHSLHLwGGHhj/hcITq2NcjFnph6Nf5p2zm+5gcloTJk/zQ3U5QTaen7NlDqW/IckrVXjDWHY/pCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5fQ631l9NRf5OWTS2YrsMZrOTnFByU4C80V8fqFvCw=;
 b=W4El5HiuvvT1ky16/Bc+INI12KIc0/azZEwE70LHeiXRXkUKJAz85xpnHu0IXnftVv7v9svHcAOhzT8VSGIft0bfkWkDN1EIvUG8y5JRv4RH2K8tm0lP+vNO4nIqD6FFP20tPGbPigT6jF54msWcBeHbTZFJYAMTvBWgvTVk/LMXQ8cTGkYL/uYJRGwNvBjb/5o3w9r6TwzmabNT4a+bHrN7puLDcmB3fdeB0hRwF0sEHEw48mgjOfGH029Xj8QxH3BvXF6aBpa9ujyw6/I6Ahtp1ekNaCmYWlRyF475NpnYA5xYWFOnUQEiI+YDrf9iB40YPiq5uTInNCJ3qd4Rgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5fQ631l9NRf5OWTS2YrsMZrOTnFByU4C80V8fqFvCw=;
 b=wSAzf8agows+krx4sG7ZEjhXorc9gtQB8DGXwb6EBYa01xrLOzeuQ/gxQMqWvKrPVKZSuywrEXyLWyNB0RS8biX1Y8Ib3EcRs38nvQtm2b48FWcTLXtI68kyLnLDiD20Z8+b4fx/boXJyJxu6+wArYNN08LPsjMuEorBtLmlpBA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 05:43:02 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 05:43:02 +0000
Content-Type: multipart/alternative;
 boundary="------------dCpnb8sLp0UZyCKeiciAxMs3"
Message-ID: <4628ecc6-9303-4c8a-9e30-0f504307ebfa@amd.com>
Date: Fri, 16 May 2025 11:12:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/amdgpu: userq skip waiting for signal
 fence
To: "Mohan Marimuthu, Yogesh" <Yogesh.Mohanmarimuthu@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <PH7PR12MB663304D0B79D9251B8660EA0FF90A@PH7PR12MB6633.namprd12.prod.outlook.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <PH7PR12MB663304D0B79D9251B8660EA0FF90A@PH7PR12MB6633.namprd12.prod.outlook.com>
X-ClientProxiedBy: PN4PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26d::14) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|DM6PR12MB4217:EE_
X-MS-Office365-Filtering-Correlation-Id: 55051070-27c0-4baf-f982-08dd943c8595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnRyOENRUndPS3JzL3JGcC9EYlB6UGJZNGR2NkpOWUVxa2ptcFpoTzRJOHFt?=
 =?utf-8?B?Tnk5aDlZNlYzWGpuNW9RTC9JZ1NNbTZIdU5JaG1yS0hOUUpFWE1WZGxUaEcy?=
 =?utf-8?B?TGNZNkpXMXJ1cEsvRmtBLzdDMzUzbTJLMjM4N3dmSm0xcE43U0JmWm1pa2xk?=
 =?utf-8?B?cks3UWMyTE9Nc3VRSXloVU5sS1AyTzlSdU8zRjQxUkdPc0h1OUhPTDN1TVNz?=
 =?utf-8?B?eDloMjRtVUdPYW9nKzZxNml6QjlLQXUzUGVidmh2dVdaL1VoWkxHQjUxb21U?=
 =?utf-8?B?dncwZ2xtQWp5T1VXYmZPMUNUSDZHWEYvRWxUVm5lOUtkd1JFWU1yRVpXUjUv?=
 =?utf-8?B?UHlZb3BnZXVIclBMQlNBejFjNkJEZHhXVndRMFlaYkxKbUZPSk5Zd3BRdjlp?=
 =?utf-8?B?Mnd6T3BDTkY1bktscm5lbDA0V2p0VHlxU0x1eG9xRGhoSjkzMVV6MFV5MWdM?=
 =?utf-8?B?b3NyWkNBdkZaK0ljWDV1UXlZMGNnVGR5SUJyUVN6OXZ4Q0tWM3hCZVl1RnB1?=
 =?utf-8?B?Rkx4Q3NzcnkvdG9HbllIemQ5c0Y0S1JPVFgyOG5FQzNZQ1hidWpRcnlQSVhu?=
 =?utf-8?B?YVd3TUk3cVB0WFgyamtiUkxndjdPUS9sczVOQ0l6WC9sczZPSHM3aXlxeFBU?=
 =?utf-8?B?c2V4Y1N3TGtIWE5UeUlZTkRpS1hDQjl1dnRFbWV2eXoxcUFyeTlvVFA5M1g4?=
 =?utf-8?B?eGduQ3hQSWVqQUZpck5xR1ZNMG9weGFQNi9NUUszY0xXcVJRdGZuZm1xZ0lC?=
 =?utf-8?B?dkk2RjJTeUVMNjMvMmM3Vng5K2hhU0FSNWw0NThPdHpzOUNveDh3ajZGZDJF?=
 =?utf-8?B?VXl3QTU2YXM5d1ozWERkeTFHcUJ0Z3pTWWU2cHNBN3BXSkJ1Z0dnMW05UXZ0?=
 =?utf-8?B?N0xnUmkzcWlOZWhaK2FaWktscWJqcnJYQnErY1JqanYzTkZKUkN3ZXlCYitN?=
 =?utf-8?B?SWlqMGIrS3ZyYW1ES1dGUk54NzBtZVd2L0c5UVFyVEZKai93WFdoelkycU9p?=
 =?utf-8?B?THBITkdPclhVTUNvc0N3TE5STkZoU3BUdW9FNzFBbGw0eUhtdDlUV0hNT2VJ?=
 =?utf-8?B?RHNsZmhxbm5DNXdEV0xKWjNwL2o0ZTdma3lUdkszVmlqaUhRZ3U1UDdwc1BF?=
 =?utf-8?B?SVY3bnFBK3dRVGdsUldHVktpYk9oVkRUZGdqMlZSMzI5M0l3NlhWYXYxS0FR?=
 =?utf-8?B?c0hiL1BSUW5CNTg2YXR0NnFQT3M0SVdxeXlMNHpTM0dHbS9QbG5KcVFCK01R?=
 =?utf-8?B?b0FJZjlETjR3a1ErM1JZWFlnL2ROdXA3Z0dycnVCeG4vYmo2dHBWZERpUVR4?=
 =?utf-8?B?RGZHNHlncHpmY09VKzZiQXhKbjVSR2xBbXUwR0ZSQWVWQ1kxNkxrdzg3Ukla?=
 =?utf-8?B?c1h3aUYrWXg1U2UyeHpaY3RFaHdJZHZzLzd1cE9yZWtBK2s5R2R5S2xiZVcv?=
 =?utf-8?B?L2MvTVRMQzJTZ1lCREpLd2M4OE1zS2tFRVhiUDlkOU9lOEFjQkVqeG1EdUpr?=
 =?utf-8?B?ZWh2WjJmNXlZdUVaMlRoMlFrcEh0eXQwek1sOWlqdGwxVXZpcHVOSEM5L053?=
 =?utf-8?B?N3RYV3h3WWJrMWtxWWx2cUJBWFlnY0lGZDFxSFRhMmVwWUtMaTJLRk5vcW4w?=
 =?utf-8?B?UU94ZmtwVy9WMnBZcW1WN1hXRnZiZjdza2o5UTliSU1Edm0zV0JiSHk3blBI?=
 =?utf-8?B?ZVVIVUVXTWhTenUrNXA4bVlyNkM4U0d3dFZwR0VvRmgvZUVtSm50aFlZTzZD?=
 =?utf-8?B?bnhIT3A5MGFqRTFSMmVkcWo0dUlXdGV6M01OM0ZaM3Bsak41amhGVWRxanNK?=
 =?utf-8?B?SDNZNFB3ZjFNa2xHWUZtdUExQk9qeVhuZWhuNXVuMTd3Ujd6WWlDR25yTlVZ?=
 =?utf-8?B?STVhdEtoV3lvQkpvRXR0ZGd0ZmVhSDFPSmRzTlBtTDdYZmVuaU12YU9naTNL?=
 =?utf-8?Q?AoJV3suw81w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDJCOWU3dS95di9zMTk2dzkyK0ZKU0xNc1d2WGZDdHFHRGJGeGt4RzJoUW94?=
 =?utf-8?B?MEF5K2VkV1JaeXExMUxsVW5VTVErbUttRGx5Y01TS21IaVIvQWdIT2E4Q0hn?=
 =?utf-8?B?ekZCMlVzWEpiWFN0WkFBN1JLbG9ZZTQ2MHpMV0s0TFFjbnI2RUZIK2lYa0JR?=
 =?utf-8?B?Vzdpd2VTaDhXQnJpNnY0MSt5R0RSZU1YdjJDZitGa25oYkJWVkVWQzNiNTdH?=
 =?utf-8?B?UDJZSmJ5T0JuaUxKZWU0bDlLRzFIaitSZFYwQ2ZtczQwV2JVWTMzUWcvaDhZ?=
 =?utf-8?B?eTl4ZndqbTZrMFhXSEsyRE51VEloV2xKSWRobXlBWHhBSjhyY0JvOGhxZExm?=
 =?utf-8?B?c1d0bmp6MFlxRGk2NzMrT2dhS00rNVp5cEFoU1RrSTlHc2JaOGY5QnpSQ1Bi?=
 =?utf-8?B?b0IwSnVsNFN5QytYVzQ3UjFRVFh0Y1k4QUlHbDZWV0ZJb1Vuc2hvQzd1REVR?=
 =?utf-8?B?aWFvYXd2OGJpc0h1NS9yU2w2WWZOTkdHMDlCYnBDbGJBVnlJeGhRc3NLMkJi?=
 =?utf-8?B?aUpwcXB4dmVKUEFBMkZST1B6STlEQmlzYU9kRzFTdmFSTEhuemVLVklLWHR2?=
 =?utf-8?B?SlVCMW43Z3kySmZqaEk2eWU4S0lUSWU2eVFQRWVWMWF4ZkRtaTUxRnA1U1FZ?=
 =?utf-8?B?L1Z2eUh4YUdiMHZXY05FaVZHU3B1M1FmL3VsODhJMFVZUUdRNXEzUmZxL3VD?=
 =?utf-8?B?NmxLVDlHNmtrRzRTS3Q0R1VOQ0VNSUhXd2xGcmFZUjJIQjFib01iZ1RZMnUw?=
 =?utf-8?B?Rm9hNzJacVExK3ZFcVJlZExGMkE0M2xhQVozdjhyK3lRTndSdlAvTWg5Sm9j?=
 =?utf-8?B?OERzYUtMdDFxSUlIaFU1YWNKeHhKWkFOUmhLUEVrMFovQ0I4Q0VkdEFUZVg2?=
 =?utf-8?B?RCtDSUIyMTVGL0VHalNlVWdRaTBYQ2dERUROWi9YcU9oWWQ2bXJLQkNXTGNj?=
 =?utf-8?B?alVwZm9WQjRRZENGeUZMRVl4dHk1SkJtMGZ1Y1JLV2s1SkdNVHBub1ppdmdP?=
 =?utf-8?B?K1l4MytQMUNYSHd1MTVVb2ttNG1mZFIxYlBtSG00RitsWlk0VDVvQi9BZmVN?=
 =?utf-8?B?elY1N1lJNis4eitNSGs1eHlFcHVqQmZLNFl5VWxNL0RCQUdTcG9sVDFYUzly?=
 =?utf-8?B?M1dieHZSU2FIcFNNbWVuamprZ2NqRlJnazNldTd1MUtoRkQ4WFFHUmhma2Uw?=
 =?utf-8?B?WG1sY0hYc1IyOGUzanlSNjNhOXJKV216Y3hrRHpUakk2dXB6cW8rSHNabjRp?=
 =?utf-8?B?SGtWNWErWnZFb0VzdElNd2RSTHJ3Q1dXZm5aaWhHMEt4UHpjaEFBZ1N0RW42?=
 =?utf-8?B?WGNvdFN3Q2NvQ3V1ZHZjSUVmb1dicmpBM2RLY0VtNkNWbzRjN0d3am05L2tD?=
 =?utf-8?B?cHgxT0RrYXkzM2JBdEdlU1V0VGh1Rkl2bDF3aUdDSSt4R1BkZzJ0N1oxYWZm?=
 =?utf-8?B?RGVRamQxb0l4Q1oyMVdneURvOU1XRE10c0ZNakgrZDk3QTY3eWdrZ3NtalRw?=
 =?utf-8?B?NE5SY1JWc0hxem9ObHZqV1g2TytWaTN5aW9NNWlHZnhzYzdpRGlDUE0zZGxJ?=
 =?utf-8?B?SmtCNXJwUTd5RkRQWDVvU09FdXl4ellmRTN5Y3BuYW9VSEtZcjN4RjgvQjdo?=
 =?utf-8?B?VTFSVWRaL09rR0FZUFFCSmdFWis5L1FxRWYyYXcxZExRTll4U2dCQ0dlL29p?=
 =?utf-8?B?MmJUWHlVb282eHZtMFhISUdpTHFQekJ3QWsxVGQ5Z0lMQWtBQWdSZGRZNS84?=
 =?utf-8?B?WUZUSFlzd0FMR29tTkdqWTFGQnBWaGJZcWt6WUc3R3NXQ25wMUE5OFI2VjJp?=
 =?utf-8?B?ZXBXell4WjQzYTlRbzdzamRiLzJnZmZyYmEzV1dpUGVGT3UyZ1dyY0VQWXhV?=
 =?utf-8?B?V0NwZzJFaG5VVzI1cG12alVuK1E3YnB5MEY4OHJLMDlUMFY4QVoyOHpCMXF1?=
 =?utf-8?B?NzNkTzM5TGxhZVpob3lFMWxtbTRMeW1NYS93ZTdQNGQvanNLUThNM2NpQ3Uy?=
 =?utf-8?B?bnFROWF5a2xsNXJ3MFBjL1d1c282czljQnl4TVllaThCZHhGbmdlNTRsRW5Q?=
 =?utf-8?B?WUd5akVjSHl3bStYK3FaS3ExQzlNVDZxMHFkQVZLemJvWFpNMFd4REFBV25S?=
 =?utf-8?Q?lu8TgQEz+w1lpzyXqwM1QcHMe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55051070-27c0-4baf-f982-08dd943c8595
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 05:43:02.0718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZ3UdwfZn+boORMrQxDcpNV2gCzpz3stoCoyjSjK71mg3eHg+bs55zuBF0XRfFAwdSQugSW2TgjqZYBSCxjhxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217
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

--------------dCpnb8sLp0UZyCKeiciAxMs3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

@yogesh

Functionally code looks good to me but i have a question,

Have you validated the any test case with the skip flag set to true. 
Test should not fail with that as its a negative test.
How the igt test work here is that when you return from the 
amdgpu_user_queue_submit function the next function checks the value 
written in the memory and test might fail if the values dont match.


Also, Indentation seems little off to me.


On 5/15/2025 12:13 PM, Mohan Marimuthu, Yogesh wrote:
>
> [Public]
>
>
> [Public]
>
>
> For negative test cases where the job will not complete need to
> skip signal fence. Pass a flag to amdgpu_user_queue_submit() to
> skip signal fence wait.
>
> Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c |  2 +-
>  lib/amdgpu/amd_compute.c            |  2 +-
>  lib/amdgpu/amd_userq.c              | 36 +++++++++++++++--------------
>  lib/amdgpu/amd_userq.h              |  2 +-
>  tests/amdgpu/amd_basic.c            |  4 ++--
>  tests/amdgpu/amd_cs_nop.c           |  2 +-
>  6 files changed, 25 insertions(+), 23 deletions(-)
>
> diff --git a/lib/amdgpu/amd_command_submission.c 
> b/lib/amdgpu/amd_command_submission.c
> index 80d03a498..74091da5a 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -68,7 +68,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle 
> device, unsigned int ip_type
>       memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw * 
> sizeof(*ring_context->pm4));
>       if (user_queue)
> -           amdgpu_user_queue_submit(device, ring_context, ip_type, 
> ib_result_mc_address);
> +           amdgpu_user_queue_submit(device, ring_context, ip_type, 
> ib_result_mc_address, false);
Indentation here
>       else {
>             ring_context->ib_info.ib_mc_address = ib_result_mc_address;
>             ring_context->ib_info.size = ring_context->pm4_dw;
> diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
> index 95bfa53aa..008186049 100644
> --- a/lib/amdgpu/amd_compute.c
> +++ b/lib/amdgpu/amd_compute.c
> @@ -91,7 +91,7 @@ void 
> amdgpu_command_submission_compute_nop(amdgpu_device_handle device, 
> bool use
>             if (user_queue) {
>                   amdgpu_user_queue_submit(device, ring_context, 
> AMD_IP_COMPUTE,
> -                                    ib_result_mc_address);
> +                                    ib_result_mc_address, false);
>             } else {
>                   memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
>                   ib_info.ib_mc_address = ib_result_mc_address;
> diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
> index 50d058609..727df8222 100644
> --- a/lib/amdgpu/amd_userq.c
> +++ b/lib/amdgpu/amd_userq.c
> @@ -127,7 +127,7 @@ int 
> amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
>  }
>  void amdgpu_user_queue_submit(amdgpu_device_handle device, struct 
> amdgpu_ring_context *ring_context,
> -                       unsigned int ip_type, uint64_t mc_address)
> +                       unsigned int ip_type, uint64_t mc_address, 
> bool skip_signal)
Indentation here too.
>  {
>       int r;
>       uint32_t control = ring_context->pm4_dw;
> @@ -166,22 +166,24 @@ void 
> amdgpu_user_queue_submit(amdgpu_device_handle device, struct 
> amdgpu_ring_co
>       /* Update the door bell */
>       ring_context->doorbell_cpu[DOORBELL_INDEX] = 
> *ring_context->wptr_cpu;
> -     /* Add a fence packet for signal */
> -     syncarray[0] = ring_context->timeline_syncobj_handle;
> -     signal_data.queue_id = ring_context->queue_id;
> -     signal_data.syncobj_handles = (uintptr_t)syncarray;
> -     signal_data.num_syncobj_handles = 1;
> -     signal_data.bo_read_handles = 0;
> -     signal_data.bo_write_handles = 0;
> -     signal_data.num_bo_read_handles = 0;
> -     signal_data.num_bo_write_handles = 0;
> -
> -     r = amdgpu_userq_signal(device, &signal_data);
> -     igt_assert_eq(r, 0);
> +     if (!skip_signal) {
> +           /* Add a fence packet for signal */
> +           syncarray[0] = ring_context->timeline_syncobj_handle;
> +           signal_data.queue_id = ring_context->queue_id;
> +           signal_data.syncobj_handles = (uintptr_t)syncarray;
> +           signal_data.num_syncobj_handles = 1;
> +           signal_data.bo_read_handles = 0;
> +           signal_data.bo_write_handles = 0;
> +           signal_data.num_bo_read_handles = 0;
> +           signal_data.num_bo_write_handles = 0;
> +
> +           r = amdgpu_userq_signal(device, &signal_data);
> +           igt_assert_eq(r, 0);
> -     r = amdgpu_cs_syncobj_wait(device, 
> &ring_context->timeline_syncobj_handle, 1, INT64_MAX,
> -                          DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
> -     igt_assert_eq(r, 0);
> +           r = amdgpu_cs_syncobj_wait(device, 
> &ring_context->timeline_syncobj_handle, 1, INT64_MAX,
> +                                                                 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, 
> NULL);
Indentation.
> +           igt_assert_eq(r, 0);
> +     }
>  }
>  void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, 
> struct amdgpu_ring_context *ctxt,
> @@ -456,7 +458,7 @@ int 
> amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
>  }
>  void amdgpu_user_queue_submit(amdgpu_device_handle device, struct 
> amdgpu_ring_context *ring_context,
> -     unsigned int ip_type, uint64_t mc_address)
> +     unsigned int ip_type, uint64_t mc_address, bool skip_signal)
>  {
>  }
> diff --git a/lib/amdgpu/amd_userq.h b/lib/amdgpu/amd_userq.h
> index b29e97ccf..dc39c1ca4 100644
> --- a/lib/amdgpu/amd_userq.h
> +++ b/lib/amdgpu/amd_userq.h
> @@ -50,6 +50,6 @@ void amdgpu_user_queue_destroy(amdgpu_device_handle 
> device_handle, struct amdgpu
>                          unsigned int ip_type);
>  void amdgpu_user_queue_submit(amdgpu_device_handle device, struct 
> amdgpu_ring_context *ring_context,
> -                       unsigned int ip_type, uint64_t mc_address);
> +                       unsigned int ip_type, uint64_t mc_address, 
> bool skip_signal);
>  #endif
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 97a08a9a3..914d27909 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -607,7 +607,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle 
> device_handle, bool user_queue)
>       if (user_queue) {
>             ring_context->pm4_dw = ib_info.size;
>             amdgpu_user_queue_submit(device_handle, ring_context, 
> ip_block->type,
> -                              ib_result_mc_address);
> +                              ib_result_mc_address, false);
>       } else {
>             r = amdgpu_cs_submit(context_handle[1], 0, &ibs_request, 1);
>       }
> @@ -647,7 +647,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle 
> device_handle, bool user_queue)
>       if (user_queue) {
>             ring_context->pm4_dw = ib_info.size;
>             amdgpu_user_queue_submit(device_handle, ring_context, 
> ip_block->type,
> -                             ib_info.ib_mc_address);
> +                              ib_info.ib_mc_address, false);
>       } else {
>             r = amdgpu_cs_submit(context_handle[0], 0, &ibs_request, 1);
>             igt_assert_eq(r, 0);
> diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
> index 268bc9201..658c8d050 100644
> --- a/tests/amdgpu/amd_cs_nop.c
> +++ b/tests/amdgpu/amd_cs_nop.c
> @@ -108,7 +108,7 @@ static void nop_cs(amdgpu_device_handle device,
>                   if (user_queue) {
>                         ring_context->pm4_dw = ib_info.size;
>                         amdgpu_user_queue_submit(device, ring_context, 
> ip_type,
> -                                          ib_info.ib_mc_address);
> +                                          ib_info.ib_mc_address, false);
Not sure if its the mail editor or what i see its shifted by one. But 
make sure indentation is correct and you run checkpatch.pl.
>                         igt_assert_eq(r, 0);
>                   } else {
>                         r = amdgpu_cs_submit(context, 0, &ibs_request, 1);
> -- 
> 2.43.0
>
>
--------------dCpnb8sLp0UZyCKeiciAxMs3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>@yogesh<br>
      <br>
      Functionally code looks good to me but i have a question,<br>
    </p>
    <p>Have you validated the any test case with the skip flag set to
      true. Test should not fail with that as its a negative test.<br>
      How the igt test work here is that when you return from the
      amdgpu_user_queue_submit function the next function checks the
      value written in the memory and test might fail if the values dont
      match. <br>
    </p>
    <p><br>
    </p>
    <p>Also, Indentation seems little off to me.</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/15/2025 12:13 PM, Mohan Marimuthu,
      Yogesh wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:PH7PR12MB663304D0B79D9251B8660EA0FF90A@PH7PR12MB6633.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <p style="font-family:Calibri;font-size:10pt;color:#008000;margin:5pt;font-style:normal;font-weight:normal;text-decoration:none;" align="Left">
        [Public]<br>
      </p>
      <br>
      <div>
        <p style="font-family:Calibri;font-size:10pt;color:#008000;margin:5pt;font-style:normal;font-weight:normal;text-decoration:none;" align="Left">
          [Public]<br>
        </p>
        <br>
        <div><span style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">For
            negative test cases where the job will not complete need to</span>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            skip signal fence. Pass a flag to amdgpu_user_queue_submit()
            to</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            skip signal fence wait.</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            <br>
          </div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            Signed-off-by: Yogesh Mohan Marimuthu
            <a class="moz-txt-link-rfc2396E" href="mailto:yogesh.mohanmarimuthu@amd.com">&lt;yogesh.mohanmarimuthu@amd.com&gt;</a></div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            ---</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;lib/amdgpu/amd_command_submission.c | &nbsp;2 +-</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;lib/amdgpu/amd_compute.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;2 +-</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;lib/amdgpu/amd_userq.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 36
            +++++++++++++++--------------</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;lib/amdgpu/amd_userq.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;2 +-</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;tests/amdgpu/amd_basic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;4 ++--</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;tests/amdgpu/amd_cs_nop.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;2 +-</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;6 files changed, 25 insertions(+), 23 deletions(-)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            <br>
          </div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            diff --git a/lib/amdgpu/amd_command_submission.c
            b/lib/amdgpu/amd_command_submission.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            index 80d03a498..74091da5a 100644</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            --- a/lib/amdgpu/amd_command_submission.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +++ b/lib/amdgpu/amd_command_submission.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            @@ -68,7 +68,7 @@ int
            amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
            unsigned int ip_type</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     memcpy(ring_ptr, ring_context-&gt;pm4,
            ring_context-&gt;pm4_dw * sizeof(*ring_context-&gt;pm4));</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     if (user_queue)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -           amdgpu_user_queue_submit(device, ring_context,
            ip_type, ib_result_mc_address);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           amdgpu_user_queue_submit(device, ring_context,
            ip_type, ib_result_mc_address, false);</div>
        </div>
      </div>
    </blockquote>
    Indentation here<br>
    <blockquote type="cite" cite="mid:PH7PR12MB663304D0B79D9251B8660EA0FF90A@PH7PR12MB6633.namprd12.prod.outlook.com">
      <div>
        <div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     else {</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;           ring_context-&gt;ib_info.ib_mc_address =
            ib_result_mc_address;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;           ring_context-&gt;ib_info.size =
            ring_context-&gt;pm4_dw;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            diff --git a/lib/amdgpu/amd_compute.c
            b/lib/amdgpu/amd_compute.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            index 95bfa53aa..008186049 100644</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            --- a/lib/amdgpu/amd_compute.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +++ b/lib/amdgpu/amd_compute.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            @@ -91,7 +91,7 @@ void
            amdgpu_command_submission_compute_nop(amdgpu_device_handle
            device, bool use</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;           if (user_queue) {</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;                 amdgpu_user_queue_submit(device,
            ring_context, AMD_IP_COMPUTE,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -                                    ib_result_mc_address);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                                    ib_result_mc_address,
            false);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;           } else {</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;                 memset(&amp;ib_info, 0, sizeof(struct
            amdgpu_cs_ib_info));</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;                 ib_info.ib_mc_address =
            ib_result_mc_address;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            index 50d058609..727df8222 100644</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            --- a/lib/amdgpu/amd_userq.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +++ b/lib/amdgpu/amd_userq.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            @@ -127,7 +127,7 @@ int
            amdgpu_timeline_syncobj_wait(amdgpu_device_handle
            device_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;}</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;void amdgpu_user_queue_submit(amdgpu_device_handle device,
            struct amdgpu_ring_context *ring_context,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -                  &nbsp; &nbsp; &nbsp;unsigned int ip_type, uint64_t
            mc_address)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                  &nbsp; &nbsp; &nbsp;unsigned int ip_type, uint64_t
            mc_address, bool skip_signal)</div>
        </div>
      </div>
    </blockquote>
    Indentation here too.<br>
    <blockquote type="cite" cite="mid:PH7PR12MB663304D0B79D9251B8660EA0FF90A@PH7PR12MB6633.namprd12.prod.outlook.com">
      <div>
        <div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;{</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     int r;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     uint32_t control = ring_context-&gt;pm4_dw;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            @@ -166,22 +166,24 @@ void
            amdgpu_user_queue_submit(amdgpu_device_handle device, struct
            amdgpu_ring_co</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     /* Update the door bell */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     ring_context-&gt;doorbell_cpu[DOORBELL_INDEX] =
            *ring_context-&gt;wptr_cpu;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     /* Add a fence packet for signal */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     syncarray[0] =
            ring_context-&gt;timeline_syncobj_handle;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     signal_data.queue_id = ring_context-&gt;queue_id;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     signal_data.syncobj_handles = (uintptr_t)syncarray;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     signal_data.num_syncobj_handles = 1;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     signal_data.bo_read_handles = 0;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     signal_data.bo_write_handles = 0;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     signal_data.num_bo_read_handles = 0;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     signal_data.num_bo_write_handles = 0;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     r = amdgpu_userq_signal(device, &amp;signal_data);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     if (!skip_signal) {</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           /* Add a fence packet for signal */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           syncarray[0] =
            ring_context-&gt;timeline_syncobj_handle;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           signal_data.queue_id =
            ring_context-&gt;queue_id;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           signal_data.syncobj_handles =
            (uintptr_t)syncarray;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           signal_data.num_syncobj_handles = 1;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           signal_data.bo_read_handles = 0;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           signal_data.bo_write_handles = 0;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           signal_data.num_bo_read_handles = 0;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           signal_data.num_bo_write_handles = 0;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           r = amdgpu_userq_signal(device,
            &amp;signal_data);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     r = amdgpu_cs_syncobj_wait(device,
            &amp;ring_context-&gt;timeline_syncobj_handle, 1, INT64_MAX,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -                        &nbsp; DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL,
            NULL);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           r = amdgpu_cs_syncobj_wait(device,
            &amp;ring_context-&gt;timeline_syncobj_handle, 1, INT64_MAX,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+                                                                 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL,
            NULL);</div>
        </div>
      </div>
    </blockquote>
    Indentation. <br>
    <blockquote type="cite" cite="mid:PH7PR12MB663304D0B79D9251B8660EA0FF90A@PH7PR12MB6633.namprd12.prod.outlook.com">
      <div>
        <div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     }</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;}</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;void amdgpu_user_queue_destroy(amdgpu_device_handle
            device_handle, struct amdgpu_ring_context *ctxt,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            @@ -456,7 +458,7 @@ int
            amdgpu_timeline_syncobj_wait(amdgpu_device_handle
            device_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;}</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;void amdgpu_user_queue_submit(amdgpu_device_handle device,
            struct amdgpu_ring_context *ring_context,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -     unsigned int ip_type, uint64_t mc_address)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     unsigned int ip_type, uint64_t mc_address, bool
            skip_signal)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;{</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;}</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            diff --git a/lib/amdgpu/amd_userq.h b/lib/amdgpu/amd_userq.h</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            index b29e97ccf..dc39c1ca4 100644</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            --- a/lib/amdgpu/amd_userq.h</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +++ b/lib/amdgpu/amd_userq.h</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            @@ -50,6 +50,6 @@ void
            amdgpu_user_queue_destroy(amdgpu_device_handle
            device_handle, struct amdgpu</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;                  &nbsp; &nbsp; &nbsp; unsigned int ip_type);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;void amdgpu_user_queue_submit(amdgpu_device_handle device,
            struct amdgpu_ring_context *ring_context,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -                  &nbsp; &nbsp; &nbsp;unsigned int ip_type, uint64_t
            mc_address);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                  &nbsp; &nbsp; &nbsp;unsigned int ip_type, uint64_t
            mc_address, bool skip_signal);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;#endif</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            diff --git a/tests/amdgpu/amd_basic.c
            b/tests/amdgpu/amd_basic.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            index 97a08a9a3..914d27909 100644</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            --- a/tests/amdgpu/amd_basic.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +++ b/tests/amdgpu/amd_basic.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            @@ -607,7 +607,7 @@
            amdgpu_sync_dependency_test(amdgpu_device_handle
            device_handle, bool user_queue)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     if (user_queue) {</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;           ring_context-&gt;pm4_dw = ib_info.size;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;           amdgpu_user_queue_submit(device_handle,
            ring_context, ip_block-&gt;type,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -                              ib_result_mc_address);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              ib_result_mc_address, false);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     } else {</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;           r = amdgpu_cs_submit(context_handle[1], 0,
            &amp;ibs_request, 1);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     }</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            @@ -647,7 +647,7 @@
            amdgpu_sync_dependency_test(amdgpu_device_handle
            device_handle, bool user_queue)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     if (user_queue) {</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;           ring_context-&gt;pm4_dw = ib_info.size;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;           amdgpu_user_queue_submit(device_handle,
            ring_context, ip_block-&gt;type,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -                             ib_info.ib_mc_address);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              ib_info.ib_mc_address,
            false);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     } else {</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;           r = amdgpu_cs_submit(context_handle[0], 0,
            &amp;ibs_request, 1);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;           igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            diff --git a/tests/amdgpu/amd_cs_nop.c
            b/tests/amdgpu/amd_cs_nop.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            index 268bc9201..658c8d050 100644</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            --- a/tests/amdgpu/amd_cs_nop.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +++ b/tests/amdgpu/amd_cs_nop.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            @@ -108,7 +108,7 @@ static void nop_cs(amdgpu_device_handle
            device,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;                 if (user_queue) {</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;                       ring_context-&gt;pm4_dw =
            ib_info.size;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;                       amdgpu_user_queue_submit(device,
            ring_context, ip_type,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            -                                         
            ib_info.ib_mc_address);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                                         
            ib_info.ib_mc_address, false);</div>
        </div>
      </div>
    </blockquote>
    Not sure if its the mail editor or what i see its shifted by one.
    But make sure indentation is correct and you run checkpatch.pl.<br>
    <blockquote type="cite" cite="mid:PH7PR12MB663304D0B79D9251B8660EA0FF90A@PH7PR12MB6633.namprd12.prod.outlook.com">
      <div>
        <div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;                       igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;                 } else {</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;                       r = amdgpu_cs_submit(context, 0,
            &amp;ibs_request, 1);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            --&nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            2.43.0</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            <br>
          </div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------dCpnb8sLp0UZyCKeiciAxMs3--
