Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486BDC83F17
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 18:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F380F10E940;
	Thu, 10 Jul 2025 18:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zMQbtosL";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5B010E940
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 18:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LC3ZWrB6/VLnZLEZUng6aNaDVKVSAlxQac3wttiZZ27gpg7QwaLlk6e4My3rSB4CUP1VOhID3Vyjs7n5LpMjl32/siCAR+U6qSMNbPDLNZUdU83VKFwD1qIm2WSL7nmtNPV/hV7aMCCjUJJRnAN6h+Pn3WlIYYaDeAo9jmkZoZ2prvsZdBWT4Vxd7Z8ABFnF1C29YxgtiiYSE7tdou2APMw2FPRYTnqcBPbQPYFJbsUm5MWFVA5vIPMUJMsTXjMyF+TSN6t1s8c+LmQIf6/uTMKZtsGIkEviNf+ufXCfRyhLhCFg1ht7tVS+TJSTYaWdl1I65U/gP+ydrS6mK2wY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRILEe0gM80yT0EZhzW80BTnvthlbct/HnbN10SHDg8=;
 b=CV52dKgTdLDWQWQ2Gtz3kHeoz5FWUQtLSWnwPaDMXdPcWQMl6M6hTOHluBE0CgEFOMc8fQmigbARxLfDu3EbonZWIAIXyupo3o8yejzwHazd/LIcmwKKh28kl58fOn2yZP/ftVgXrFLLheriIxTbB6sbkFeXvsz8sBU6HNyC+uVcnEG4TKUf4u0wXRKGtEwst5SPKXJaUfMbG1EGo2DD7AQgoyFOvrfE7Asi1eXqhbdyNk2H5Xu8ZngvX4k3vOfMKwJDIhpe/9ZcVv3odXOJYh/LMj65D3Bn3wYipGtQsCbRhXHT7F58rQSmN6J71nSqQekOF3JBP2hbK8F49rhh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRILEe0gM80yT0EZhzW80BTnvthlbct/HnbN10SHDg8=;
 b=zMQbtosLT+1IwBfPXV7zuOn0xe7YEjEyw+cD1S05+FM2vGsSX5bfxZxF6kxBpeXvcarL9lt4+iYaTiLKi2I51TRGYqo+PCLAanUvwXFMUT9yaEuLKCXcXy5lcn6GAD4JJpC/JH75jT4NZprINQ4K+gOy9wdY/PbjKi1bu8+OWM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SN7PR12MB8603.namprd12.prod.outlook.com (2603:10b6:806:260::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 10 Jul
 2025 18:05:47 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 18:05:47 +0000
Message-ID: <87c40728-6032-41e3-9d6f-93b97eba45bc@amd.com>
Date: Thu, 10 Jul 2025 14:05:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_basic: fix compilation warning
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Jesse Zhang <Jesse.Zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250710123406.84306-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250710123406.84306-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0349.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::24) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SN7PR12MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: cb22e4cd-9b47-42ef-58a8-08ddbfdc659b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWZxbk1OeHRHbDlKMkNRMnhKVlM4T0x1L2xtZ1M5TVhpazB5RHdFNWF5SGp0?=
 =?utf-8?B?R0tTcmtzU3plbkxXQytqT0ErNGdPTXdaNFR6OURPUE42UW9BOUtWWDgzRDMy?=
 =?utf-8?B?Z3hJR0VQaHpkZmhmUjVqd2ZTYUx4TXlYVXJaUk9FQTFCakdldmxFRXdMSnVo?=
 =?utf-8?B?dlRORUpCV2l5YmRWOExJR3BvOGtvUm02amNlajJpVFJ2b0tBcTV1SFh3Zm9T?=
 =?utf-8?B?VVcveC9uN2h4SVZ1QzRwUmFkaFovQ1V0V2RYVUNxdU84cTB0UFlZaU5tS0h0?=
 =?utf-8?B?YkYxQTEzREhLR2ZhaEN1enM0ODhyem1rK0lRbndhaENuL0JtdFpQTXcyTHdo?=
 =?utf-8?B?VkZmM0JCcnJ3cHpUWjBHNGRObG8vQ2drOCtxTGxjbUkvbmdCblN3QUcxaUNQ?=
 =?utf-8?B?SzBmbm9FUncxWkRxRzZML1ZTMkpVTCtGRWkwTjJYM2hXRjdjOFl1VHZvbDJs?=
 =?utf-8?B?dWZmT3g1dW16b0ZlS2k1bnJMZmlaNEZZZFBDcU8xajhzV3RiT1d4aWJiR1RL?=
 =?utf-8?B?VlhvMEMxbWNSRCt0NFpiT3NhK1VFLzBEekZFTmpISWI1YVpxRG5sV3JkN1FS?=
 =?utf-8?B?TzBFTzluMk9iNmw0ZTZEbUlFSFh3azdja01XRXZUTDJnR1NEZGIybGhmUHlp?=
 =?utf-8?B?eGVoV29HV2tTLzl4U04xSEdQQ3FlaGYvVlBZVVd1cFVKSk5MTmZBQTV2SVM3?=
 =?utf-8?B?djFXcXdEU1A5dnhXelY3WGIveGF6ZGg5MTNPTk5ScGRPT0hVS1NwTnhvdkVJ?=
 =?utf-8?B?R005MWxYNTBVRW1TcUxUN1czN0x5bFRpU1ZkTmVvbFZPSW1FNnZQU20ybmhR?=
 =?utf-8?B?bVB5Tk00NEVaaTJpb3d5NFNXTTUxRnZPeGk5Q3VPbkdtUUhqUStrVk0vR3pC?=
 =?utf-8?B?QmwydUJ0VU1lUXBiZGhoUjZrMlNjanhIZkJUSkUydGRhMFRLYnAxMWVWNlZ1?=
 =?utf-8?B?OEZVY05TYzBZVWY4Vm4yMWpMUlA3MlE4R0s1Y2VNMGlXZzYzRmM2dmw0R3VQ?=
 =?utf-8?B?RFVmVGJVWjFBSHNTY3A2NkhFZFBQV2htOWFINStaNU1ST0xmcnQ0ak5mOVY4?=
 =?utf-8?B?eWcrVWJPT0I2cmNHYXNvM1VIK1ljSmFtOVNpcitrSG9GTWRDVHhYdzMzTkZH?=
 =?utf-8?B?NHMyaE5wSDBFdG9QTDJPYnF0LzlBbFUvclU3dFU4VkNmVk9mZm5rZEloYzFr?=
 =?utf-8?B?bndPWUVlVnpvYUNyY3FBT2RMMjZKU1VKS3NIanIza1dubXFBN2hsU2JKK1ZR?=
 =?utf-8?B?VnRzWDc4ek0xOFpsbWVxNDM4dkNwVEJORjV3OEZOS3lvVkd0cDhjWVYxam9L?=
 =?utf-8?B?T1Q1RXdhTWVMdjFhZnFyY3J6c1cwVTVUZXp2Z0dRNktZUGc0dlJ5ZXFaTWRz?=
 =?utf-8?B?Z1JzTTU5ZzBLR2IrbTNYYWJ4ekI2OEFIc2s1V3RZUmpDQmJ5NmM5R3pRMS93?=
 =?utf-8?B?MWw5d0VVaVdXNFh5bEVXa25qNmFhVVZ2UmFRRHozZGJJWDhaMk05U2ZLVTF2?=
 =?utf-8?B?U3pveE0yVW83UEJJaVk2WXhNcVUxaGNyMEpyeXY2Z0xObW1xVHl2bUZBREkx?=
 =?utf-8?B?cnUvUXd0Smo0TTZPbmc1cVlvRGhiQ0hPS3ZwWm9iRUVtdmUyMmlGbzlmdmJQ?=
 =?utf-8?B?N21wa2E1Y1Q0cDVzRTZLRHBaR29BZVVxUVZOeUlRcjk2SkY0SllzTTByMUgv?=
 =?utf-8?B?ZWI3UEk5UVhKVXdqcWs5U1lSdWZGMmRvTzVVV3dvM3c2MEZTbll0Sm13RXAw?=
 =?utf-8?B?RW9DeXIrRklEYWF3TXVNSUJjd1lsRUpMd2huakplak92NVU2YW9ybG1BTE1J?=
 =?utf-8?B?eXNNbEpMSHJJQjE2T1loMFhBcHcrSFcvc29aNE42elE1bTBCV25xVGRTWVoy?=
 =?utf-8?B?OGpqd0ZWQ1JFKy9lSUZ1QzZ0dFBzN1VCdkYyMGVtZStKY2pNd0ZoMm1STWp4?=
 =?utf-8?Q?xZPgic9TH34=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDBEaC9hbXNmOTM4L2pyb1MrVGVYTGsrQW5HOVBEL1prcmpIOXBwK2xaSGFm?=
 =?utf-8?B?QkF2UHMrSExOM2xoVkltdjB6QWg2LzRGRTU4RXhXdzdsZlVRR3hxQ0Y4NlNv?=
 =?utf-8?B?cXY1YjUxSWlza2NCYlVZT0cvNDFIMk5LeHdqMXM4eFdOY0g4Q0RXZ085T3oy?=
 =?utf-8?B?dXNyVzJkQnVCdzBSMElDV1cvMUFuUXc2RTd1TFhFd1pHclo1bVZGSnhuUmg0?=
 =?utf-8?B?R3JURC90YjRrT1I1eUtmMk9xbWxsbkI4VUs0WTBSNzhiRnExcVZKU01pWGd4?=
 =?utf-8?B?ZHlPdzR4K2JnSGllaEJNOXNSTlhnQ1BHdTlSYWVwdjFvOUpuUmRRQSt5QXU2?=
 =?utf-8?B?aTIvY0VOOGtvRkk2d2xhYlg3QkpmaUdwakZzNDlaY1Q2aklacVBsVC8xRjEx?=
 =?utf-8?B?VWlJZlA0cGNqV0FVNENrYUtXc1lNamxRSnh1YlVMRWF0N0c3dGp5WHFNOVdF?=
 =?utf-8?B?Q3JmQTh2VFBWa09ibVAxUVdLdFZ6U1pXa0dNN2dNYzBaSGt4RnBxaWpmV2kv?=
 =?utf-8?B?dVE2bk1LL2hveWVWYmYvN2hROGYzV2wwelNMQVN3N2lodUJnMlRFLzk0ckZ3?=
 =?utf-8?B?Nk43dVVZVm5ueERNZXJzOU1yMk5INDg3aHhHRGZCOUpqQjIyMGU3ZkZ1VjhH?=
 =?utf-8?B?Ym9pTkltQlpQbFlTREcyS00rdExoM0xaRHRMYkRScWYwUnZGREdOay8wdUtH?=
 =?utf-8?B?by9jSHl1VE54a29iMHg5Y3RpVERKeFE2SmNaSWErSStPVXhxVEpaY1pLeDdO?=
 =?utf-8?B?MUE1U2JtWW5qVEpZS0t3MFA0T2ZyNG9nYjd2TmUwZE42TnBpOUlYSHM3c3A2?=
 =?utf-8?B?c2d0MHc1NytxaGx2V2YzVUR5czNmM2MxREk3WjJ0NEhnbzB3K0dxM1FmUzBP?=
 =?utf-8?B?S3lwMXZRT1RmeFFONlY1QjB5bXVFMnMxT3V4ZVhqb2Zwdk53dlBNVnErODc0?=
 =?utf-8?B?ei9nTFFXK3dRcHpXK2luQ1NQcXFRY3dhYzJEbXFlUk9xVVhQSzVkUmxKaWdD?=
 =?utf-8?B?U2VPWXcxVkxOQUV0UTBPQWUvTnZEQXZRZmx0U081N0Y2azNkQ3VaMlFybFdO?=
 =?utf-8?B?QVh1MmsydVZadjlqdjVRTVJROU1MaWxLREpnck0xR1prRTVyNmVYRWxJM2NG?=
 =?utf-8?B?NGJpZ244MkVpdUhpZVA3OFVwREVPUW1PUXZFa1NCWFNqSmlZRGlWTEFMTGtE?=
 =?utf-8?B?Q1lTcUVJb010b2JaMFBaV3dWOGJNTDZtNlVVYmxNQVd3OWl2Q0JTZk4wZk5o?=
 =?utf-8?B?K3doenNZdDh0NUVxTjYrTGMzS3U0MThYOFc1ZkZqcjVwbFdNYitXRENwUHpO?=
 =?utf-8?B?LzhIcWg2cjYxL3hoMUFXcE1qaklNdHBvQzhDdVZ4YXJ0NW80cWdyZGNvTjd2?=
 =?utf-8?B?V2VCdnp6WVZiSm8zN0dtSnpjK0RMd3JGR3N5dDh3c21WUkdHczNBS3J5YVRo?=
 =?utf-8?B?dnkvNVhvM2NVYkkrOVV6QXpQSUk2TFlVaFNabEFnalgwcmdaYTRuR1gyZk9s?=
 =?utf-8?B?MGpYbi8yck9OT3RPZ1ZtZS8yNWRTcHdjaUhKZTV1N0pUQ2tPc3FUazh5VlRh?=
 =?utf-8?B?V0x1ZTcyRS83aUdqZjB6TXNpVDJpY1UxK2JaSXQxSE1HcWNpbzMwR05OUUlw?=
 =?utf-8?B?VTN1QUF6V0xRWkJxRnpYZTJ2aTRDcmMreG1SMWZncUhaTWcxRnlQdjNqYU1t?=
 =?utf-8?B?bDFXQVZLVVdEZExkeXF3MjFoQThpaFZ2b1c5bXlVUjNkVTBGSnVLUHRyeWJW?=
 =?utf-8?B?ejFlOUNxcHplVjVUZGU3YkpZUGxna0pNdVZtMWc2RnlINUU5Z1Z1VGlYNzNa?=
 =?utf-8?B?U0Frb0ZMV3JzbGg4Z0xEdWJjc29MUVdXTGVQc2lkMVRQMUJqUlNsby9yejF6?=
 =?utf-8?B?bFZuMVg1Ui9QMWEzYlRPMjgzemF4TmpvTXRIRGg4MTN1d2hLa3MySkxJbmZq?=
 =?utf-8?B?ZnBPbTZCNFNweXVnVVNrUDkwZ1lmUkFUMjY5SENsNkNDa1B6R0NvMkxtRXU3?=
 =?utf-8?B?VTF6K3lwUzNpd28vYVZUbCswU3ZCcWdxUG5BYW56bW9tdHFPUXgwODdNR1Fn?=
 =?utf-8?B?cW4wcllpT29VWnUzNi8xN0QxQkVuQ0RONkhZOXdEQXN0ODNPWnhlYVY3eDFX?=
 =?utf-8?Q?JDS+nAlbvWYQW36DJwJfXxo0w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb22e4cd-9b47-42ef-58a8-08ddbfdc659b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 18:05:47.7324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfKHtT0iVsY9oj6sGZY0wS9XfnwCziQITKB4xuciQiiNRuIVMhlrCIqgRe1pXT5QuRp17ePRxwfUpWPIJ52mnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8603
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

The patch looks great to me — much appreciated for your quick response via email.

Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com

Are you planning to merge it yourself, or would you prefer that I take care of it?

Thanks!

On 2025-07-10 08:34, Kamil Konieczny wrote:
> Fix compilation warning:
> [1564/2025] Compiling C object tests/amdgpu/amd_basic.p/amd_basic.c.o
> ../tests/amdgpu/amd_basic.c:142:13: warning: 'amdgpu_test_all_queues' defined but not used [-Wunused-function]
>   142 | static void amdgpu_test_all_queues(amdgpu_device_handle device, bool user_queue)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
>
> Cc: Jesse Zhang <Jesse.Zhang@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Fixes: b195a6c65cdd ("tests/amdgpu: Add test coverage for all user-mode queues across IP blocks")
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/amdgpu/amd_basic.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 100a634ce..45cf64251 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -707,8 +707,8 @@ igt_main
>  	int r;
>  	bool arr_cap[AMD_IP_MAX] = {0};
>  	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +	bool enable_test = false;
>  #ifdef AMDGPU_USERQ_ENABLED
> -	bool enable_test;
>  	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
>  
>  	enable_test = env && atoi(env);
> @@ -805,11 +805,9 @@ igt_main
>  		}
>  	}
>  
> -#ifdef AMDGPU_USERQ_ENABLED
> -
>  	igt_describe("Check-GFX-CS-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
>  	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX-UMQ") {
> -		if (userq_arr_cap[AMD_IP_GFX]) {
> +		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("cs-gfx-with-umq")
>  			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, true);
>  		}
> @@ -817,7 +815,7 @@ igt_main
>  
>  	igt_describe("Check-COMPUTE-CS-for-every-available-ring-works-for-write-const-fill-copy-and-nop-operation");
>  	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE-UMQ") {
> -		if (userq_arr_cap[AMD_IP_COMPUTE]) {
> +		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
>  			igt_dynamic_f("cs-compute-with-umq")
>  			amdgpu_command_submission_compute(device, true);
>  		}
> @@ -825,7 +823,7 @@ igt_main
>  
>  	igt_describe("Check-sync-dependency-using-GFX-ring");
>  	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX-UMQ") {
> -		if (userq_arr_cap[AMD_IP_GFX]) {
> +		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("sync-dependency-test-with-umq")
>  			amdgpu_sync_dependency_test(device, true);
>  		}
> @@ -848,7 +846,6 @@ igt_main
>  			amdgpu_test_all_queues(device, true);
>  		}
>  	}
> -#endif
>  
>  	igt_fixture {
>  		amdgpu_device_deinitialize(device);
