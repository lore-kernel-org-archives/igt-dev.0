Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CC5CA5FC1
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 17:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D39D10E320;
	Wed, 30 Sep 2026 17:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FltVqWO1";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010017.outbound.protection.outlook.com [52.101.46.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F2110F21D
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 17:39:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=querSGvj1CIQDUU3IhYEAZ+STG3/ajnXtqfHyofpIxyw5b44VYaiBfxpLZ7fcBT+sq+odySx1AXjPzaAZnYjTDHqDysfBhjcFvNRnYpgnkOhnRh4yuEcwzkue3Z26TTRwZGZVhmVnSApiNC98w2qlBweUoE+6tA0efYd3Atkqr3C7y1vvouHQDQxPG4HAkE1HO6XVdDKfH61Rpnl50pwahDtC/YRaOju7mUxCZVghJjBFJCUxd8U30CkEhCbuKXlitEISBtp1GziybBd/Ow4ncr13tJ8rqceOm67S1JFTrc2PARWp3wkZXqMHz/4+ODbQeTXjjK5UKwzP31OY2+z2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3mu/Q/efT9lWemcVsYTawIIyIV9p3KAtAR2ZlQdxWM=;
 b=QOOUpmD99976hzIAv1uKUxgXZjrNL1CyHmuJEqRLNaBhHSJTiZoftP/Ck35VLKfOViGJGrC4ew+ZAat/qTNsu3AhRAhmsiMlbM2KhEtB/6fo6xuGmrDdWQSpYctMO2HUr+FQx3WQlPkJRZUaX35tFNUqPJN0+aRz3JyOV79vv9x5FYCMCa+XIgt5IG/0ZIL1qLyewGrWocPub+Kx3kzNK06S/uszh6l2XfzkoqOQcbh6mFWzOoke22IqTohDUwsZZP1jA7ZmqJEgpp4tmjma3vOA0v7MBJns99Gqrz9ag63epmfE0jp94pwQJU8ff6f4lWFQSoF1/S0ftK+e+/4KvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3mu/Q/efT9lWemcVsYTawIIyIV9p3KAtAR2ZlQdxWM=;
 b=FltVqWO1HtAVjB5o0M92NdhKw4cP44vaCLHckBI/2jLcetuVM0ECbs/zQr1FB8k/PnHj0NmRpX8vM7ifDZ+AFWvmfVHX6Kt4iAGTjDGvgRnr1OJPIcDiEUDkulv25GcYTGXidoMCARyKV65iGlBVEwp1liCnvrmg7lHtBzZ3yO4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by DS7PR12MB5790.namprd12.prod.outlook.com (2603:10b6:8:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 17:39:30 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 17:39:29 +0000
Message-ID: <ba96be44-c871-4c66-9b9d-7d5996ac642f@amd.com>
Date: Wed, 30 Sep 2026 13:39:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/amdgpu: fix checkpatch errors in
 amd_fuzzing
To: Jesse Zhang <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20260929030131.3415475-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260929030131.3415475-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0242.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::21) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|DS7PR12MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c26db4-b8e4-4075-336c-08df1f19c752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: TIWlhowG5gJE3lr5O4hcmbURzyW+5nkvNHafWAoGOq+oprncGHSOWAjlLLwtCHEIbxDdrypQgKeJtORLCA/KB5r2n37zxYlmkKwusESp1/JQyCTxxrh8wu3XpgxZd55nl0HiyxmI6I980j2IJp1OzhFOcAm4Gz/KCu0QhhSAot8KUdhsg0GuicWY5nbQodLD67LPEshKVq9w3wmSKu38oWC0hLXWxNxQKJ5XmGNZh1SYONsYPIa3JhQCkj7XcgYN+uNVfgvkaBPpk0qMGgHBoSsWVVlyibGSOD+ew69msgZA5gAx0jSdTUocff3lGzRztX2P+jwncK888b1pQEy0V/AhGhlSTCq7uPI7Xp366QkZ3GjQbp96qqi63OTLO2t9czhvSkXwdEOmzHLSB/z8IBNvHGtbqDbzub0yVX+Kud7jCBNk/uPgWOIGp1MSgFXx2b75BcdF8W42PcCzoTCjhBV44d9oV/BGYKTshQXAL8/3Yivs4WDJGxSZuBHLxmS2kJoSaAB+KXgAOF1Y9ec8/lxLpmqLYP9nOR40S3CThuGmp+7I52E01ket03SIKs3GSV2PZ34c3lhcBw9ha55/53FbgRYbRVhFsR8mI7bsUAu1tUuMhIOAu5+dT5tv6zqcxUI9GiVrjyIKatBAO/VLSWCiLbQiVwb+7mXE8J3hpXI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm00bmtvbHZ1aENoOGpobW9nWjcyd1RtTjhVbzIwdFpFbmJ1U05QNE16QWJm?=
 =?utf-8?B?WVZxQUpZQzNFdVVBRzNhOWo5TlFQdVRqS2trd2wvYk41UzB4WmJTaEs4NFhn?=
 =?utf-8?B?SjFTVWI5MndKQWprZ3ZGM0ZrUmJsT2ZmditVa1lQNjBHNjZBUDlxVHRDQTNq?=
 =?utf-8?B?cEJFcWZMSjhHSjgzMWVSVTF4cGEyRVp6QWJIODZNNjhvenNPUm5LcDZLTlhu?=
 =?utf-8?B?bjNOQXUzcjRkM2ZjU3I3dzNyaVY3MFhDQS9FeG9CNmVuV0ExWnlqVS9aSDRv?=
 =?utf-8?B?LzlIT2RpcWg5L1hneGdlczloU1l3YThubkh6YlZBSTNWZlJjdDMrejVybGYz?=
 =?utf-8?B?TGNlbGMxOVFXZExFV24rQmlodVUwVGU2N1IwdUdJVlR1aSttRzkrMEl3bGRR?=
 =?utf-8?B?OEdJNUY3UDdXYXd0OEo5NGNwZURLQzF1RndOWGNtaU45ZjBxL0Q5ODJkWnVv?=
 =?utf-8?B?TjBKN1dSQ241QnBxblM1SW9QcGRWWUxwOXA5MzNyK0poeXUyc2txRVIvMjR5?=
 =?utf-8?B?S0FxMTNQaHRUSjY2UGpoaWFyWWtrVTQxQ2tldnp0b3ZTNzRKak5RdWYwWGh0?=
 =?utf-8?B?VGlkZ2V5ZGR4UVY0d0F0RGw2ZmtkZXoxWnpOMXo0NWZpbnY1OXJNWjBQR0R5?=
 =?utf-8?B?N3BDNEFZZzI5Y3g1WDExM3Fhb1A3cDNjbTF1djFBdmJQWTYvOWNsbTNqZStI?=
 =?utf-8?B?cjNpZDVZaFRVZ0VJMXBDVWNVSFR2Uk13VXJOSVVwcEVvNzdzWUlnV3F6RmJh?=
 =?utf-8?B?MEV4QXNvNjNDSzNBTFIrMlc4T1Q5QXpWM0VEd0hBZFJsNW9RVlB1eDljSnM1?=
 =?utf-8?B?US9ZRE1LS2RDdjE2a3JTNllMaTVMS0phRllqWWJBcXdBbFlicE5wWVFCUGxw?=
 =?utf-8?B?MFlCNXdXSXNWMk5KbjdPWlNKWWtBc0R4dktiWm8vL3dUV2Fkb2dWc1RZU3Av?=
 =?utf-8?B?MjY0S0dWNURmN0pPRW5EKzZmOVB0SXNWYnpUUE0xV3V4VmRPWWowNlBmcTda?=
 =?utf-8?B?R3NRZWJReHloK3paZUNqeUxicGtUMUxlV2l0Z0xoOGV5bkRBVUV3ZzltNmJo?=
 =?utf-8?B?OFhaK1R0bk1rS1k4U1NibXhld01ReVRaWjdzaE5pWGFkU0V1SjBlVXgza3Fo?=
 =?utf-8?B?cm0yQnNmTW9GU3VleUNUZndxV1Vxdy9lcDB3ZlZZUVhScSszeExwNm9EWWZv?=
 =?utf-8?B?ZjhNT1ZRanZ3Wng0MGVEY2RxYWx3OUNTUmhZSVRpc2ViZ1VTMnU0KzdFMHlm?=
 =?utf-8?B?Y3EyejBxbnovT3VnLzliSnZRejNzS1VaaFZtaUFjaTNVWjJhdFY4V21IRzUx?=
 =?utf-8?B?aWtpbEw0N2FVVmNxaDFpdnBlVFAyQUcwMGFhRm9peHVqSzZ3RG1RM3c3Q3Bt?=
 =?utf-8?B?VVNjTnpRTmcvQnA1REhRcXFNN0NjenBxbWRxeDg1YnFhc1RCVGRVYWZUdnJk?=
 =?utf-8?B?WnMremQ2VUw3RDZCTTJNZkZhUnhxb0o5WEFpRG5Cb245UE1IcXNsZFVmaVBG?=
 =?utf-8?B?bDJwQUtjNVdRditzZjI4cEhITnhZSGFGZnJ3RUQ0OTlOdkxMY1YzM1hpYnlv?=
 =?utf-8?B?aFI0SGZ2R01Lc0pqRmdxWjVJelMrenhKOHBPZjJIbXF1NmRSZ3Z5WnpmRFlN?=
 =?utf-8?B?bVhMQVhqYWRhQzIzUlQxbi9oaVdQVjdqank0ZVh6U3hsbUQ1Q1ZEWFd2ZnZH?=
 =?utf-8?B?V3FrZ1ZPQmhRayt3QVFHQ0pjNXBtM0pHWnoyb2VBUUh6VDR5Mk1SWHF2QlpE?=
 =?utf-8?B?eERveVJPY0dBWDhsakdPWXBZMnFsa1MrcEVYbDQ3U0hKWFpqZzdtOVk0U2lK?=
 =?utf-8?B?SjFZTVlFbG5sc0tRVUM0Z0tCcWNxTURkRGxvVkNSVXpVV005MERUL0d4UU9q?=
 =?utf-8?B?NE0wRUZIekhMK0NaVTlla0owWTBTcDJ2MDJaQzBSS1U1RXNGV3gxTFNQNVpD?=
 =?utf-8?B?bFdIR0lHNzF6WW1rQUcwbEVkZVNjZjNDOXR0SFFqQ2NUU3NSZ0hyZXM1eTg5?=
 =?utf-8?B?b2haSGNsSVIxM3d6UGt5U2IrTThTVjllcXltaWZBOXRjVURGWjQxTVRiMnQw?=
 =?utf-8?B?YmMyM1Fqd290ME5WMlFoYzlzbzB3cVRkZ1poY21oeXRlbFhKdHY3clRzMEMv?=
 =?utf-8?B?dUN3amRLWnRnMjhQbVBBOENwais4ZFpyZVVLN001Rm5XMzN0M1g2R2pCYlhX?=
 =?utf-8?B?TDhaZllrT1VFQ0lIU3lsNlpReGVwTEZuc0FDelhiSUVOQTlBYysrSUtZMmlD?=
 =?utf-8?B?aTloZUJNSVJ5dUxLcnJZN2V3RlBlNFVsOU9FVmh4MXQ2RWY2MElQcjdFMEFZ?=
 =?utf-8?B?LzdXSHgvZjNjZjRnZndYWmwvOGFHbUJxK3NEazJCRVFDaXlwaU1QQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c26db4-b8e4-4075-336c-08df1f19c752
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:39:29.2453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3vjyEB03sozeRIlz7sKs9CGQleVaMAvIg+Pn4rvw/vxKc2CStRotDDUL43e/i0aSxINfyI9ztu/Ks4W9jTrbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5790
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

Both patches look good to me. I will modify the subject line based on Kamil's suggestion.
Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com

On 2026-09-28 23:00, Jesse Zhang wrote:
> Fix all checkpatch ERROR-level issues in amd_fuzzing.c:
> - CODE_INDENT: use tabs for igt_assert_f() continuation-line indentation
> - OPEN_BRACE: put the if-statement opening brace on the same line
>
> No functional change.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_fuzzing.c | 103 ++++++++++++++++++-------------------
>  1 file changed, 51 insertions(+), 52 deletions(-)
>
> diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
> index 36dd5d388..bcd3d66e0 100644
> --- a/tests/amdgpu/amd_fuzzing.c
> +++ b/tests/amdgpu/amd_fuzzing.c
> @@ -291,8 +291,8 @@ run_drm_ioctl_field_cases(int fd, const char *ioctl_name, unsigned long request,
>  		errno = 0;
>  		ret = drmIoctl(fd, request, buf);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     ioctl_name, cases[i].case_name, buf);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     ioctl_name, cases[i].case_name, buf);
>  	}
>  
>  	free(buf);
> @@ -452,8 +452,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		{
>  			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &base);
>  			igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_number.huge", &base);
> +				     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +				     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_number.huge", &base);
>  		}
>  
>  		/* bo_info_size cannot be zero. */
> @@ -466,8 +466,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		{
>  			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &base);
>  			igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_info_size.zero", &base);
> +				     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +				     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_info_size.zero", &base);
>  		}
>  
>  		/* DESTROY should not require bo_info payload fields for a valid handle. */
> @@ -747,8 +747,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		{
>  			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &base);
>  			igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero", &base);
> +				     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +				     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero", &base);
>  		}
>  
>  		/* fence_count=0 must be rejected regardless of wait_all selector. */
> @@ -758,8 +758,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		{
>  			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &base);
>  			igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero_wait_all", &base);
> +				     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +				     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero_wait_all", &base);
>  		}
>  
>  		/* Non-zero fence_count with NULL fences pointer must fault copy-from-user. */
> @@ -770,8 +770,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		{
>  			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &base);
>  			igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fences.nonzero_count_null", &base);
> +				     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +				     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fences.nonzero_count_null", &base);
>  		}
>  	}
>  
> @@ -924,24 +924,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.zero_count_nonnull", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.bo_read_handles = 0x1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.zero_count_nonnull", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.bo_write_handles = 0x1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.zero_count_nonnull", &arg);
>  
>  		/* non-zero count + NULL user pointer must fail in copy-from-user path */
>  		memset(&arg, 0, sizeof(arg));
> @@ -949,24 +949,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.nonzero_count_null", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.num_bo_read_handles = 1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.nonzero_count_null", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.num_bo_write_handles = 1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.nonzero_count_null", &arg);
>  
>  		/* queue lookup path: invalid queue_id with no dependency arrays */
>  		memset(&arg, 0, sizeof(arg));
> @@ -974,8 +974,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.queue_id.invalid_empty", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.queue_id.invalid_empty", &arg);
>  	}
>  
>  	/*
> @@ -997,8 +997,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.zero_count_nonnull", &arg);
>  
>  		/* syncobj_timeline_handles: non-NULL + zero timeline count */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1006,8 +1006,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.zero_count_nonnull", &arg);
>  
>  		/* syncobj_timeline_points: non-NULL + zero timeline count */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1015,8 +1015,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.zero_count_nonnull", &arg);
>  
>  		/* bo_read_handles: non-NULL + zero count */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1024,8 +1024,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.zero_count_nonnull", &arg);
>  
>  		/* bo_write_handles: non-NULL + zero count */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1033,8 +1033,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.zero_count_nonnull", &arg);
>  
>  		/* out_fences: non-NULL + zero fence count */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1042,8 +1042,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.out_fences.zero_count_nonnull", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.out_fences.zero_count_nonnull", &arg);
>  
>  		/* non-zero count + NULL user pointer must fail in copy-from-user path */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1051,16 +1051,16 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.nonzero_count_null", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.num_syncobj_timeline_handles = 1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.nonzero_count_null", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.num_syncobj_timeline_handles = 1;
> @@ -1068,24 +1068,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.nonzero_count_null", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.num_bo_read_handles = 1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.nonzero_count_null", &arg);
>  
>  		memset(&arg, 0, sizeof(arg));
>  		arg.num_bo_write_handles = 1;
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.nonzero_count_null", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.nonzero_count_null", &arg);
>  
>  		/* wait queue lookup path: invalid waitq_id when out_fences requested */
>  		memset(&arg, 0, sizeof(arg));
> @@ -1095,8 +1095,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>  		errno = 0;
>  		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
>  		igt_assert_f(ret != 0,
> -                     "%s unexpectedly succeeded for %s (arg=%p)\n",
> -                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.waitq_id.invalid_out_fences", &arg);
> +			     "%s unexpectedly succeeded for %s (arg=%p)\n",
> +			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.waitq_id.invalid_out_fences", &arg);
>  	}
>  	/*
>  	 * USERQ_WAIT timeline points are 64-bit in UAPI.  Verify that the
> @@ -2209,8 +2209,7 @@ amd_test_try_create_userq(int fd, amdgpu_device_handle amdgpu_dev, uint32_t ip_t
>  
>  	(void)fd;
>  
> -	if (!amdgpu_dev || !userq)
> -	{
> +	if (!amdgpu_dev || !userq) {
>  		igt_info("userq create failed: invalid args dev=%p userq=%p ip=%u\n",
>  			 amdgpu_dev, userq, ip_type);
>  		return false;
