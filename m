Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025C7CAC5B5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 21:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA71310E9BB;
	Thu, 25 Sep 2025 21:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hslyis5H";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F06810E9B7
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 21:48:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8kOFvPOMZS84rIpftTVVv+2Gs1u3xXh9EvCSrWqD3m3zp9h9UmrQT2z17B1ZBBk+OJg8lM/bJ/DhG3thA02LkfMeoCQlR4AMsWgYXU80SdERqK7V+B+YbrQVoCjtXCEO380bn0i9QtFP1nK/girdJYqJ9fh4OQb+tTeeWxGiOOg7KZz1dxmefFk0PrGYxKfUE0B0+rKRpbHW795HfjILnsU6yK9tEzyjBBkdN5kKIySuRePpqYZZSHNOEBH4cxkN9VIT65YvE9BB0oIABNnlAcNYxeE/iaFrn/e+x7IcaJmktGiP/COCRaDn7rIwmrWVAmyKlr9QvtyMuImOztQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9D74O8zfuD61UxqbE6BCHTmg7Uau8Nh9iXRnG4F7tu8=;
 b=TcmAVH8wqMdqoM9CpuUcfga6Na+Gm1xvwk47drrs6q7AU8tGflDLymVG9dCtTbyWr3r1VRjKIwyVt0S+4fT7gkpg+jKQMt2QGipSKQVRxsAvdGpsn9r1Jlf8lcTR9Pr47isMY3t2AEYnGJT93v3YHeZef/5kOix2DNEM0TGJgi08VH+naIOzBQ8wvvQYK/34l7uxuoZa5pDmtB9zLZk1wwShdULVJ60OGT0cJca/Tcj7xtsUOdEe+ilOkgIQJoHJqWSYy0Q/kxmXKNaqcqHh1nsLckTwl4uqWYFPiWah6AJWqR9yT/nZN/PlWt3VYgOZqWrVNZcwlk2Ot5aOeqCLxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9D74O8zfuD61UxqbE6BCHTmg7Uau8Nh9iXRnG4F7tu8=;
 b=hslyis5HqjvfHf/ZmcwdwuawucAmgWufaaqXGJIiYvSW3FmhCNcWI+mBPNwF0702YbOOckjd/ojVEFXKl2NZwd/Z8229CE+R5H7vPiqr2GnbgG1GcFJ6Jif4S9X+PKW/UHKOxEycvZyLnd7BMGKNdKXVYDU8/TishLb1pq76l10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DS7PR12MB8251.namprd12.prod.outlook.com (2603:10b6:8:e3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Thu, 25 Sep 2025 21:47:29 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 21:47:28 +0000
Message-ID: <1c242b0d-8629-4f23-98ed-41f27b9ad75b@amd.com>
Date: Thu, 25 Sep 2025 17:47:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] Revert "lib/amdgpu: Temporarily skip VCN ENC/DEC
 tests for RX 7600 until proper fix"
To: Yinjie Yao <yinjie.yao@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250925205946.324277-2-yinjie.yao@amd.com>
 <20250925205946.324277-4-yinjie.yao@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250925205946.324277-4-yinjie.yao@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0329.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::21) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DS7PR12MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 01d54a25-641c-4c5c-9e33-08ddfc7d1f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RURFUkh0bndKLzVoTlpaTmxmeVRTYkRDOHVwcXE1MERVMkl3VmxkYlZVSE1x?=
 =?utf-8?B?eW8wVVZjTG9xMHBsMlR1b2tWekN6cm85UDF2dWpDQUpZdTlLdEN0Um02aTYy?=
 =?utf-8?B?ejN3MStNODlTZHZtK2ROUXdURG5ZWU0yaXRkOCtZUXFaUWpFdnh2U1pVVUh3?=
 =?utf-8?B?ZmFEemhaemQ5VDNhTThpVGcrMFF4YUd0RSswZVNqRG1DTjdxZlJ6SW9SR1Q5?=
 =?utf-8?B?WXc5c2dDTGxjaGEwM3l3RnZkdHIwQU5tSEl4cm1KZXc4aVAyL2U2MEVkTEtH?=
 =?utf-8?B?eFVxd3U5L01GMm5OTnJtL1ZYWFZqV3Uwc1BJRGNCZEdUaUUrdENldWY5Ti9y?=
 =?utf-8?B?RWVyMjRUaTlXNFlWYUpUTlFDNmlST2ZDZVU0bHBWQmtNVDg5TVBwN0I2bkIz?=
 =?utf-8?B?czdQWVZ6Zk1LNzZTdy9IMXY1MTZIQzdkUExOVFNXQVdnbXVnemE2TGpOeVNL?=
 =?utf-8?B?RkNNZi9mUmNZdzd4YTYxMDdKMVlyNmxtNFl6MzZjNUx5UVlmWGxrVFk5dEIr?=
 =?utf-8?B?SXRsT2FWYTJ5MGt6ekFRVzBJVnIxRFlodGxRODdyVy9OL2dsN1NiUUYrK0xO?=
 =?utf-8?B?SUpuUVZIMFh3ZzlESGV2MHZNYitKRWFpeHlXNU55Ujhjb3lNYmxLQ3FtRXNo?=
 =?utf-8?B?c2ZWbjZxTVFPazcvd2dXSTRldjM5QzRHYWMxMmJmV2ZObXI5SDQ5SSt0bnV6?=
 =?utf-8?B?V01zTDZSTGprM2xBdERWVzlPQWhjcXhTZ0xtMSt1M1VvZHA2RmkzU2tNTGxQ?=
 =?utf-8?B?SUFPYThxZHpNMjhDWXZtYyt5ZDh5R2o4dnJ2b1IzYkRxUlNQSFN0cHd1NWFF?=
 =?utf-8?B?bmo5cTJONlVQUHlKbzgrcFEvZ0dCa3QzREZCcGs0bzROK21BUXFvTEhhVm9w?=
 =?utf-8?B?YmtxUFA4N3VBY2U3Sk9vSUJGYmpmMllZU1lzdEJEUFJJNW5lUVpyMTY0OHpP?=
 =?utf-8?B?V3RqbGtCOU1xT1NOZ3Zsbit2U0VpSzJ4akdOd1lhT05HKzJSMmY4L1JpOVpz?=
 =?utf-8?B?Q291YXhuQkhtWkRqc0FQanhnVVNrcU1haHF2U0R5cmx3WDlqUGhpclIwUWRH?=
 =?utf-8?B?WlNwVkNrUUNlKzRHRllOamNETThjRkNtS1YwUStiY2JOeU81OTBIRTVtZUpj?=
 =?utf-8?B?MHM2dXBvK0FrRm5LYnBpbzdpSHBGK3BZN0J1RTVKOTg4Z2hiRXpZdnd1dld5?=
 =?utf-8?B?T1JlMTJ1WW1CMFl6RHdNRmkrbVBoZ2NZSlZJSTE4bFNMRkxKNzFCbHczeGN5?=
 =?utf-8?B?LytvNjZVdm1YSHRyKzhHdkFUbDZ5RjF5YnhlaHFWdnNqV3R2dHYyQTNCaHgz?=
 =?utf-8?B?ZUdmQXF3TWxvT3BGS2toZHJTNW5HMU9tUzJhazJtcWZMVmhRMmRzcHdqNURh?=
 =?utf-8?B?ZzlWalZ1RHR6eDlNekpMRXNzTVFhSmZ2Nm5PdXpYelVNaVlBWjgyZXJmb0ZI?=
 =?utf-8?B?Qk4wZU9VY29SQUd2a1VFMlhVS2VRVTZWS0VwR0tIcjJZMHc5V2JaNmNKSWk1?=
 =?utf-8?B?ZnhIS0NVM041K2NRa0RvdmM3blNBM2FsUENodUhEdkpROGo1b0V0ZFRTVlhh?=
 =?utf-8?B?SE1GVkNheE8wOFdBZkN0aHFSTlZZeGxpZk9UdHhucFVjQytoeEFsUmErc25P?=
 =?utf-8?B?VmFQQzJ4L0FBVTN6SkU5d3pwejRwY1hEWlNYSkg4NGJaSVRFSG9hNzN4dFVI?=
 =?utf-8?B?WnlRalZTV1VMY3RHMUQxL1kwWnNOQlhhQS9qeU9kaklGamhvbVN6b2grUG9t?=
 =?utf-8?B?bmJYams2MFp2aHZEd0JhSUdoa1lRV2JUdmtCOWxuM1lLcHY3WU9Idm9GWjEw?=
 =?utf-8?B?MVVYaGFPVmk0QzZvbHc4b2lpSTROYndZYUlkL2FyRnNVZng0akozeDBHVWEv?=
 =?utf-8?B?ekRIREtyR3ZZUitwZU4rYmlaQ0NpMWVuNXVEdEVvN24zVnBmaEl6dWEyd1hQ?=
 =?utf-8?Q?LQkGNPJOiOg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OS9oYjZuditWWmtHQ2wyMXdpWmFuK1F6RWN3TXhETDIyRzJ4WG81NzZ0R3BM?=
 =?utf-8?B?WXJja0sxSGkrWWZrY2k4d29yZzVvVkNxVXJFenZHREZBRXZuNFJ0UHBWL2Vz?=
 =?utf-8?B?bVJ6R0daMFFEMHdNeVRZOWFmTWVDM1Uxd1hpajlWaS9mTThwVXhBSGx6U0Nl?=
 =?utf-8?B?eGRaeEM4N1h2M1VYZkNJY2JuRVR1R2xsQzdsRnlaZjhGc0gyQ083MDJsbmRS?=
 =?utf-8?B?WlgyOGQ1U3NZOTBIdkZHS1hMaXc3TzNuZXRoTmN6Yi84T3VReHV6by8vdEMz?=
 =?utf-8?B?THR5cDA4aGxxYVljOHcwc1pkTXB5Q0ZRK0JUbFdwYWN3bTRpUi9qWktIcXhl?=
 =?utf-8?B?T3E3Ry9ZVzRpUTRXaTlyRW40NDc2MXJhYVJRS01jeDROYndiNlV0ejdERDNv?=
 =?utf-8?B?eGp6bURlQytVd0E3aUhvcE5vbEdTVFNMRENFa3EwTDllSU13b3c1SzhOTnZl?=
 =?utf-8?B?K3lNUUlXV2JHQ2w5UmwwcFRNRGI3T2FFQmc1NnVvYzdmcnJNYkRUWFlaK1VU?=
 =?utf-8?B?TWdCdzJzRHlxQmZBUm5aYktMQStIb1cvTkFrRG0rNEcrQ2kyUFE5NDVMaFk3?=
 =?utf-8?B?TFl0MG12MEFEWVJjQUZ3ZVNKdHMzTDZTQk16VW5zVGRDbU9yWTFWV2srSkhQ?=
 =?utf-8?B?VG5YL2ZOSHhLVVFqallZVWpLajhkc1dhaTN1c1Z2eWh1dXppUitqc0g3cVU4?=
 =?utf-8?B?R0lpUHNyelB2Q2oxMDQzbWFLNGVHSU9VT2h3dXlab0toZ01UNCt6d2w0YTFW?=
 =?utf-8?B?VnUzaFB2VkhUU3M5aGdiUkU1VU1pczE4SWxscmYrZzFXQ1lqWnF4OGFETS9U?=
 =?utf-8?B?OW1NTjZyK1IxeGs2ZzRhd3J5TEZiY0I0RHpvQ200K3VJSTdYUm54MnFERXJ3?=
 =?utf-8?B?TTB0ZkFaeTgyM2ExMENwVmpVZC9BWDlacWpsUDA2SzM3dEVHMnFNcE00UFhT?=
 =?utf-8?B?Q1dqSEVibUFEY25GeWtjQWRnNGU5bE5IeW5RUTh0b0JOeHc2U2hVY2ZjOFR2?=
 =?utf-8?B?VE1NRDczZHBMbXJhblIrNHR3R05lZFhScTBxU2RKekEwVlNNZVFxSSt2bW9u?=
 =?utf-8?B?eVRzVlVrb1d2SEpSZnZPSGdQNXBPeEtaNUppNy85QUJSaUsyVld3S01CZitp?=
 =?utf-8?B?UTF4d0VpRUF1ZjkrL0l1cjZzTldHUUNuYkJUOW9qZ296S0psMXpHeElHNlBN?=
 =?utf-8?B?ZFd5Z0FOWmNZMkE1YWVZVGVSWkczOFFYUFRXb1lDRGNLeXhpMWRNVTlCQ2V6?=
 =?utf-8?B?YUVoSk0wVGRGeDlCakw2aXVaK2p5bFl5UUZQYVpTQkZKMEgrY1pvVVZzVkxM?=
 =?utf-8?B?aFpRMlpHMGtxMlc5cjB1R2hjdFlQTFlCL2tvQmNOT0FsS0hzRVJKTjNaZjNZ?=
 =?utf-8?B?VXRzTGdCRVl3c1k3V2Q3bzZoZU5FSDdUNXVjakNNaUJDcDhTMGkxZjFOWXZ0?=
 =?utf-8?B?Q01WK1lwU0Q3QlJyZ253UEJCQUZQR3FnbHg4VFh1NkcwbjRvYlJqdXBLclM2?=
 =?utf-8?B?N0ZIWWhLQ3JPN01GOFhsNVZJVFlpbjVGcHIxbmowMUNpejlFVzMzSjRkc1hr?=
 =?utf-8?B?SnAvUFBrWkJGbVBLNDBNVnBxQmpmUmZHTFZ1ZjU3UTRSL2tlTW54M1B4V3I4?=
 =?utf-8?B?eWtlRGlHUVRyOEpiVjlvQ2c1bGFwNXZGdkt1NTVCQi9hZEdUSHBWRWN4Z2cw?=
 =?utf-8?B?RjlIWW9zQjV1OUlJaXFJdWhCNVk5aGk2dWQxYk5MRzdlUC9HOXEyR0xIZlFM?=
 =?utf-8?B?Qy9XUDhDRjl0eEREb2dVZGZnc2paUXVnTmpPaUZNNVVlN0NQaTZvdkxsV3NM?=
 =?utf-8?B?U3FDY3M2MXg5Wno5dWpuWFJHMHVYbThuSUhKRlRUbHFITHlZTENtMDVuNXhZ?=
 =?utf-8?B?eG1uZUVoNDNTd2k5RVRabXg4WFdEUnIrcmVISjJFNGlaRVc0d3ZyeVdTYkg5?=
 =?utf-8?B?bFNjNXFvZklYR2Rac2o0b3VJM2wzRHhicGkxMXVQUWYzbjBhWmdiY1NsMElZ?=
 =?utf-8?B?V2lScDlXYUxTRDloUmFQWlJGME9nYkdVbEhwSWluN040cS9FT0t1dVJWUGJk?=
 =?utf-8?B?TVc2akRRZlRRdzN6b3V5R3VMeHBBQXJWRmtrY0tFOG9QY0Q4bDEwSldXQUU2?=
 =?utf-8?Q?hy8mNRfEIUVRbUtQ6z5zPiEy0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d54a25-641c-4c5c-9e33-08ddfc7d1f65
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 21:47:28.6720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/LQk4iKWuh1hT2/C+WQO4s0hNobufnWqlnItVoSNyGIdWwIl5SiHiW6pF7ud6VwFNrC95Vlnk3u3VnjrVlaKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8251
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

The entire series of 3 patches looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>


On 2025-09-25 16:59, Yinjie Yao wrote:
> This reverts commit 3be9db4e3fe89e35b67037cb2bdb6e34e85cae26.
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Yinjie Yao <yinjie.yao@amd.com>
> ---
>  lib/amdgpu/amd_vcn_shared.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
> index 32766c0b4..3888ec112 100644
> --- a/lib/amdgpu/amd_vcn_shared.c
> +++ b/lib/amdgpu/amd_vcn_shared.c
> @@ -59,13 +59,6 @@ is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_contex
>  		context->vcn_reg_index = 2;
>  	}
>
> -	/* Skip VCN tests on Radeon RX9000  (GFX12, family_id = 152) */
> -	if (context->family_id == AMDGPU_FAMILY_GC_12_0_0 ) {
> -		igt_info("Skipping VCN tests on GFX12 RX9000 (family_id = 152)\n");
> -		return false;
> -	}
> -
> -
>  	return true;
>  }
>
> @@ -195,4 +188,4 @@ vcn_dec_cmd(struct mmd_shared_context *shared_context,
>  	default:
>  		igt_info("Not Supported!\n");
>  	}
> -}
> +}
> \ No newline at end of file
> --
> 2.43.0
>
