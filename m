Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D386C0218A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 20:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B4410E07F;
	Tue, 28 Jan 2025 20:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bt+OjHf+";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B520A10E07F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 20:44:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpmzg9NgH6GUSiCaNUIut97DJt0MidpLZVlrLsRdNDcLGQqBmi3KhtN6e37HlT4nXpYg+t0ltWZsMcLSOl9pKoK6OBBqO6gC13mHBHCGSH2aq/V7QuSfa9W1LRslBs1gZIaH9Lq8CoiksuBtIW6v0XnxbhU52DV+4G88DOUfds+/pfIygvDftmf2sEWipfPa1sX3rRYbmkuurrXQD2TiCnYOaKm95OE87yWYlYVC0yR2dRC0Jn2Rx5RtBbTF+erVL56MlmeoCvUvI2DDY0YwWaQJG7bfxmj0/iwju47/uAPuqZW5i4+HVb+xOsmRpvd9TyamZ/67pLo0+qlRiIr6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jIvvw/SSYJZnXePlBFOGEzJ7AWSKeAxOpXtUdVLUEY=;
 b=Hr/+HllntKwTRehb803sSQpRyDZZOpfRMLs2t2UJQPIxn90GH83KtzcK8Hw7MNrGc4EoXJtVWC14a0gSZYzydFUrRgO/FMEvZH2JLbYN+YbuI+efHbifDgxAP/496Zz6lAkRtHcOa9ApV3F36kfX35uAZ957rbny07trhkTN4cDFKifkHlC0qG3Yj34vhb6gdpVjXGUoqlpmT+hF7Q1sDJjxaPLsKOGIewinUAv5CEzy6VzSCsTjgmqpI+ic5G/Fi7glxtCJyqi/9/hbHBi+80F5AGcFPNecqHAIEA6oYA08WnYTfeLPLRagR8tDbGYsgRAuT2c5hsIjyL7u5PeAkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jIvvw/SSYJZnXePlBFOGEzJ7AWSKeAxOpXtUdVLUEY=;
 b=bt+OjHf+iN0F6Cet8d4Br5qwGfwNUJPjsJqYCsfMFSdjnlMHrl7zphS42FibRmsF9YAZ92yLFTf8Kt8Sgd6oRjjI8CmSwm92Lq00urFJS/n+z78+Ti9MbaeK5OqVg/QhXnR/DgaFPfkfRP0rNqxde5avPSwvke/5ONZZXqoLZOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) by
 IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 20:44:01 +0000
Received: from DM6PR12MB4356.namprd12.prod.outlook.com
 ([fe80::4941:67c5:fcd5:325a]) by DM6PR12MB4356.namprd12.prod.outlook.com
 ([fe80::4941:67c5:fcd5:325a%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 20:44:00 +0000
Message-ID: <49ab2d75-3a6a-4e60-9271-f4049bc1de20@amd.com>
Date: Tue, 28 Jan 2025 15:43:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amd/lib: refactor function is_reset_enable
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
References: <20250128192442.61513-1-vitaly.prosyak@amd.com>
Content-Language: en-US
From: Michael Strawbridge <michael.strawbridge@amd.com>
In-Reply-To: <20250128192442.61513-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0048.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::25) To DM6PR12MB4356.namprd12.prod.outlook.com
 (2603:10b6:5:2aa::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4356:EE_|IA1PR12MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d267c2-3f30-41ed-27b1-08dd3fdc7e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mzc2SHhXRllDcCs4VGljUW1EcDNrTXM1MjhXZC9NdFpPKzltUzU0cHhWMXFq?=
 =?utf-8?B?T3owTFM0STdDbkhtUm14eEI1RVljN2NTbmd2V2prSFVkdXpxNllnODJRN3ln?=
 =?utf-8?B?aTdlTldvR2ZyeUVENTRHL004aHg5ZSs2T3k1R2N2SWFrZW1PT0FHbmdHWm5a?=
 =?utf-8?B?UGZxNmNxWEF4TVhrRjNhWjZOM2FLVU9mSUlwL1MyMUlqa0JoUVFCZXJyTXI2?=
 =?utf-8?B?OUVtNE9rbW9GTHhyMGZUUW9TVm1hT2VpQWJQb0hFUnVMQnhLd1pBNkxPcDhQ?=
 =?utf-8?B?MmV4bENSOXlXeVF4eHcva2xjRnJYdmpXU09mVkRrRmpmRHNwTURkL0NGZlUz?=
 =?utf-8?B?bXF6dHZUbGJWZ20vRHJHdEswdHB3Zm9Xb09IYTI1WkkvUWIzdkxDZVMzRWlz?=
 =?utf-8?B?Q3RCSnhJZVlDNjJ3K3lOYVZRYVNWc3RraU1zaTlvLzI1cnUvL2U5UFBnVy9r?=
 =?utf-8?B?V3YxcHh2K2FsaUEwaDFETDdMN1JCckd2Uit0dFN0b0h4MFVJRnYxOENTYnRX?=
 =?utf-8?B?OUY1cnVvMnFkMy9iamk1T1k5bUtqQUhkdnJQTTkwSEEyMEtUelpDYlhCMUFR?=
 =?utf-8?B?ZnBTUkdYLytxa1VkR25Jc2p3TzhxK3B6aW9VY0lwVjMvdDE1WGd2WEJoT1Zm?=
 =?utf-8?B?R05MMEVBam1LWm9iNHp0UDFIUmFsYjRacWorVDk4cDFBSnFRMDhKZS9Cdmdi?=
 =?utf-8?B?eHZNajdxQ3JSb3NKZzM0am5yMm5CSEZSSlRneHNEYnBrWXBXYkxTeVVlbVZV?=
 =?utf-8?B?a0hCRlBhYURpcFlnK3JzY1EyMGJ6WVFEM2w2UXlaUHVGYUVwTU94SUsyZHpo?=
 =?utf-8?B?Y2RXNXRRU21IZzNuU3hlNkdseThFUlFhbGpPOXYxYmJrMHJQZklPNmRlK2pN?=
 =?utf-8?B?YkFIQ3VjSENKT0pxNkRtaWpTL0RjUklub0FQZkludGlQQzMyZXN6eis5Y3do?=
 =?utf-8?B?a3VqdzNIMjllSjFTZUIyaUNIdklydmZ2d0d2b3h1YndlK2Y5Z2wrb0prYjU2?=
 =?utf-8?B?MVJBclV6T0RDR2tGU0Y1akxUcGNxaGZ6cGZXSEYwOG0zL2NObkZoRHlqcVY2?=
 =?utf-8?B?T3ZKdkxFeloxWEFqS0pQTkVNamY0S0k2WE5ocmpKaXJjaVBEb0ZjcDFIRGZk?=
 =?utf-8?B?OGZXcGhQKzREdmp3Y25CV2RsajQzcGgyV3NKTzQrczNySXB2VDNlTkhsZ1Fm?=
 =?utf-8?B?ZW5Jay9PUVdlWXA5RUozYkx1ZVh2UXJZZi94ejBBS3FGTHVSakdPbTFoTXFZ?=
 =?utf-8?B?U1lVOFQ2eHBOU09ZYVluTzFKdkJlbUpzQ1llT0c3SGJKcEhzeTNwSUM5Mnpw?=
 =?utf-8?B?WjFTaXV1LzdXdEdLMmp3WUZ4S0gwZEUxek9pVXJYODFDc1RFczVkZ0NXVVBo?=
 =?utf-8?B?KytVUmpXdDBhMXJWeUozS2IrUkFNdVlGMWJhQ3BEWFRDRGhGY1FPUVlTVXZJ?=
 =?utf-8?B?M1F0UnBYeE1EeTU4QU5GRkowZmQwY2lQSDErSjkvc0cxVEhBZENITFpybC92?=
 =?utf-8?B?WnRFOExGRyt6RlhxQWxiS3pQYW5FOW14YjI3YTdwWm05MFRDT2NYbmV5azY5?=
 =?utf-8?B?UkE4MWlSYVQwdlU2bHNRNGJMd0VwVlBtS2lpSVNLVjlOd3dSa241M3k4K3J0?=
 =?utf-8?B?T2gwZlkwZC9pcVpGU08xT1VDMjJ5UlloRnZERlhwQ3hWNnFrbGFiek8yTkEy?=
 =?utf-8?B?WkdWN0liVFM4YlBUMGxSbDBrbFA3aGc4NFpnZnlFbHZNVi9FZno4K0hpRURh?=
 =?utf-8?B?cGt2aVh2MERjMCtRZk15UHpmYXcxQWJIL29sMXE4TjVCd0haSTRZZ2I0enEv?=
 =?utf-8?B?Q1Y4bmtJVVV2WGxHNVFZY3RCNnJwVWtIWlZKMWR0OUhNTjh0cHkzY2FQOUJ1?=
 =?utf-8?Q?lmWk7tAxitKRH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4356.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUtyN1RxbUVjdXA3a2xwL0lWeEl4eFMrRkpyL09vK0lwNU83RWRoZVBsV0dL?=
 =?utf-8?B?ZGtIZ0lKM2h6T05ZNlFSdTJvTUl3VEJ3eVdNRlRNMCtiditMZmVNczhWRHMw?=
 =?utf-8?B?NTd4QUwvbGE2elkraGlqR0hxbTFtczJrQm9iUXVxcm00ajBiOStib0pEL2lC?=
 =?utf-8?B?dUcrcVdseXJENU1PeHN6NStYTUFac2xVY2xZM3czeVJWeVVVaE5aMjg0cFB3?=
 =?utf-8?B?c2lhekhUdlBUbHdBSUgvcGRVTEJhdlN1T3V2R2xtWkU5M2htMEQ0VnFRaTI3?=
 =?utf-8?B?eXJZQ1YzQmRpK2daVnlGTG9aOFExKytMbjdiWE92YzYwMERCUDFXTUtLM1Vr?=
 =?utf-8?B?RUVBcmMyVHY5VjgxdHVCUENkMDFPU3lWb3labHFXOFcwNGJROWxITGtNY0dY?=
 =?utf-8?B?WlNua0xRNittOG1FR2hsNjc2SDhWWGhma0IyOWRtTHg3eE5jVWtnQnpOMHlh?=
 =?utf-8?B?RWxwcktQaHlyNm0yejFJNU5YZUlGdTgxdEZrY1AwcXZMMWcva0JDOGxTZFA2?=
 =?utf-8?B?MDFtUks5MVVKU2pmM0FLcm4xZDJGZ0ZoZHMxekNnOG5tdllwRDR5L1lINEx4?=
 =?utf-8?B?RXhmMWQ4cDMrN0xJd0YzYk9Uem5WR2FDVEg5d0xYZm84VFpQRFRkUFlvNlBr?=
 =?utf-8?B?dDZPdWxYUFJiMVJOQ1VwYk1LL1RkRHIyREFIb0RQNjRMdmdQN3JJaldPcDdK?=
 =?utf-8?B?ZDVsaUhJZXVQVWZLUGNaQk5jNlFVMlRWbHNGZUJtME5JMDBNUStKZWo2WVo3?=
 =?utf-8?B?bElVc084ektleHV3bFdORyt3YXdBek9OQWpjaW0rM0NGY2NDK1pqRVFzNm1Y?=
 =?utf-8?B?Y1NRZ2V5SHEwalVjbVA3U2VoRnZxUXY0RHlYQUxxTkhyQnNoYjlqaDR6anlE?=
 =?utf-8?B?RERuWk8zYnNGaDlvRlpSQWJSU2w2U1FVSlRNdkVMTnV6TnJRdFdHWDJBSzBH?=
 =?utf-8?B?dXM1NEVxYjk5QlBEWDN6S1FtY2NNS1lVZXhZQVV5c1ZpNks4bmc4ZmFjSnFW?=
 =?utf-8?B?cld4OUltMWFpM0graGx5QjVDOXJxRlJ4RkFWN2xoQVZvQ2hONllCQS9nbWZv?=
 =?utf-8?B?cEE5Si83aHJuYmZxVHNmY2ppa0Q2WW1LekdyNURMdmxjNitQcXBMdjJiNFNv?=
 =?utf-8?B?UEY0NDRsNXB0ckxWTSsxaHdtd3QzMHBFTGNmVVREZmtjaVBZN3FURmRhYjNx?=
 =?utf-8?B?aUJPaFZGc21aMGtxZ0tHVklCUDBic05QZGJIR0x1ZThmTXZSeitOV2xGczNq?=
 =?utf-8?B?VSs1dmtMMlV1dWlHYW9XU2VyL0ZRM1d6bkd0SWVYYnpNRExGNUFhbmJUQ0U3?=
 =?utf-8?B?QUNEUXlyWmI0bUNFaFlJWTBTV3cxcXBvZlBMSU9YWWhWRkV2b1dtMDRweldp?=
 =?utf-8?B?WTdRQlBCakEvRDBhNkt0cFFkQk1uY0JBa3ZLT3VHcjZYbnVRWmtXVndObGtm?=
 =?utf-8?B?RDgxRlREVFYzZzE5aVJNSkUvSDBsalQ3UHBOczhTT0JiUXZ5TGs5TlNrSFRY?=
 =?utf-8?B?QjZ6anZLZ3AwQ2Q4UnJhRTE1cjE2TSsrM1FrL1VPbUV4NCtPVnhqT0QzRVNC?=
 =?utf-8?B?QlVGdkw1Z0dtZ3hWNGhGU29Kb2YzaklUSFdtMS84YnEraTF5OGg0eUVRRDU5?=
 =?utf-8?B?bms1VDlHTnNhcWFZbHVYVC81QTBlWHJLVWNER3oxMHFxMmthWE5RMkh0NmFE?=
 =?utf-8?B?RlRaNjVmcFRURksvdVJidDdTWjRCSC95bE01V1MrRVlHQ0FpckV4Ykluc3Ay?=
 =?utf-8?B?blc3bkVLa3lBcTAyVVhNRzltSUNzakVlR0VaYmxYOGtYNFRXMlB4QXEyVmsy?=
 =?utf-8?B?alh5am42Rnh5ekxrT1djRWM2SGx1OHB2YUxjTlgrd2o0UmI4WXljbk1Sams5?=
 =?utf-8?B?dE93NG9pN1ROdEozQktVUlg4K0wyczREMG5BaXZSK1JBaGdyYlM2c3JQTThu?=
 =?utf-8?B?UjBaZmM0YTBOSWl3dGxHN3ZzMzBOMS9kcnZ2TWc5TnpTcHltUHhhbS9taG9W?=
 =?utf-8?B?ckVpVE9JVmQ1bnFwU24vdm1FVmhTTEFiektqcGlTRm8vVU1hSlRNblVNa1ZW?=
 =?utf-8?B?MkQxTElVck55NnlMakpJMVAyQkdHSUpkT2FuVDRycGxzZWhsS2FTMnJSVlRD?=
 =?utf-8?Q?wym+mAqaHuxXFSo/yhBE/nGEW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d267c2-3f30-41ed-27b1-08dd3fdc7e9b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 20:44:00.8190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNMIkbpiJkL8lFg5Laf79ZdlxxKhX45sDeG0Df2KT987KrFbLcnGYMJ31CTljYa8a60h/7/KaV3p2XQ3JkLGWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6532
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

Hi Vitaly,

One small thing below.

On 1/28/25 14:24, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> This function takes a reset type mask (`AMDGPU_RESET_TYPE_FULL`,
> `AMDGPU_RESET_TYPE_SOFT_RESET`, AMDGPU_RESET_TYPE_PER_PIPE
> or `AMDGPU_RESET_TYPE_PER_QUEUE`) and attempts to open and
> read the corresponding sysfs file, e.g.,
> `/sys/bus/pci/devices/0000:08:00.0/gfx_reset_mask`.
> It then iterates through predefined keywords such as `full`,
> `soft`, and `queue`, validating whether AMDGPU exposes the
> requested operation. If the requested operation is not available,
> the test is skipped.
> 
> The previous implementation included redundant steps and failed
> in certain cases. This refactored version simplifies the logic,
> improves reliability, and ensures consistent behavior across various
> scenarios.
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alexander Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Michael Strawbridge <michael.strawbridge@amd.com>
> 
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c | 79 +++++++++++++++++++++++++-------------
>  1 file changed, 53 insertions(+), 26 deletions(-)
> 
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 2b1b84414..f063ad0ab 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -1006,11 +1006,27 @@ asic_rings_readness(amdgpu_device_handle device_handle, uint32_t mask,
>  bool
>  is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struct pci_addr *pci)
>  {
> -	char cmd[256];
> -	FILE *fp, *fp2;
> -	char buffer[100];
> +	const struct reset_arr {
> +		const char *name;
> +		unsigned int reset;
> +	} reset_arr[] = {
> +		{"full",	AMDGPU_RESET_TYPE_FULL		},
> +		{"soft",	AMDGPU_RESET_TYPE_SOFT_RESET},
> +		{"queue",	AMDGPU_RESET_TYPE_PER_QUEUE },
> +		{"pipe",	AMDGPU_RESET_TYPE_PER_PIPE },
> +		{NULL, 0}
> +	};
> +
>  	bool enable = false;
> -	char reset_mask[100];
> +	char cmd[256];
> +	FILE *fp;
> +	char buffer[128];
> +
> +	char *token, *buf;
> +	char reset_mask[32];
> +	uint32_t mask = 0;
> +	int found = 0;
> +	int i;
>  
>  	if (ip_type == AMD_IP_GFX)
>  		snprintf(reset_mask, sizeof(reset_mask) - 1, "gfx_reset_mask");
> @@ -1019,33 +1035,44 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struc
>  	else
>  		snprintf(reset_mask, sizeof(reset_mask) - 1, "sdma_reset_mask");
>  
> -	if( pci)
> -		snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/%04x:%02x:%02x.%01x/name |grep -oP '(?<=dev=)[0-9:.]+'",
> -			pci->domain, pci->bus, pci->device, pci->function);
> -	else
> -		snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/0/name |grep -oP '(?<=dev=)[0-9:.]+'");
> +	snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/bus/pci/devices/%04x:%02x:%02x.%01x/%s",
> +			pci->domain, pci->bus, pci->device, pci->function, reset_mask);
>  
>  	fp = popen(cmd, "r");
> -	if (fp == NULL)
> +	if (fp == NULL) {
> +		igt_kmsg("***FAILURE popen %s LINE %d FILE %s\n", cmd, __LINE__, __FILE__);
>  		return false;
> +	}
>  
> -	if (fgets(buffer, 13, fp) != NULL) {
> -		snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/bus/pci/devices/%s/%s | grep -oP '%s'",
> -			buffer, reset_mask,
> -			reset_type & AMDGPU_RESET_TYPE_FULL ? "full" :
> -			reset_type & AMDGPU_RESET_TYPE_SOFT_RESET ? "soft" :
> -			reset_type & AMDGPU_RESET_TYPE_PER_QUEUE ? "queue" : "pipe");
> -
> -		fp2 = popen(cmd, "r");
> -		if (fp2 == NULL) {
> -			pclose(fp);
> -			return false;
> +	buf = fgets(buffer, sizeof(buffer)-1, fp);
> +
> +	//igt_kmsg("cmd: %s buf: %s LINE %d FILE %s\n",
> +	//		cmd, buf != NULL ? buf : "NULL", __LINE__, __FILE__);

Did you mean to keep the 2 above commented lines?

Besides this you can add:
Reviewed-by: Michael Strawbridge <michael.strawbridge@amd.com>

> +
> +	if (buf != NULL) {
> +		token = strtok(buf, " \n");
> +		while (token != NULL) {
> +			for (i = 0; reset_arr[i].name != NULL; i++) {
> +				if (reset_type == reset_arr[i].reset &&
> +					strcmp(token, reset_arr[i].name) == 0) {
> +					mask |= reset_arr[i].reset;
> +					found = 1;
> +					break;
> +				}
> +			}
> +			if (!found)
> +				token = strtok(NULL, " \n");
>  		}
> -
> -		if (fgets(buffer, 13, fp2) != NULL)
> -			enable = true;
> -		pclose(fp2);
> +	} else {
> +		igt_kmsg("***FAILURE fgets %s LINE %d FILE %s\n",
> +				buffer, __LINE__, __FILE__);
>  	}
> +	if (mask == reset_type)
> +		enable = true;
> +	else
> +		igt_kmsg("***FAILURE mask found 0x%x requested 0x%x operation is not supported LINE %d FILE %s\n",
> +				mask, reset_type, __LINE__, __FILE__);
> +
>  	pclose(fp);
>  
>  	return enable;
> @@ -1105,7 +1132,7 @@ int get_pci_addr_from_fd(int fd, struct pci_addr *pci)
>  
>  	if (ret != 4) {
>  		igt_info("error %s Unable to extract PCI device address from '%s\n",
> -				__FUNCTION__, buf);
> +				__func__, buf);
>  		return -ENOENT;
>  	}
>  

