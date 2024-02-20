Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90F8C48BF8
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 02:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAA410E044;
	Tue, 20 Feb 2024 02:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3H/JKJxU";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B0A10E044
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 02:07:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2MMvfKNE1qYBmoNFDgYY74NE9sVQWCZRjA5dSmTGlEkXFeU9RHoX8yQ+8HIznuiT9FGeXEBBXwmiI38mK73rNsJc6GF3/4wE5J5h17F6TZsH2c4dc3GCSG91E5+mDL3EWeULtUlolwf1niRcMeA0+mrcidIKbSZnIuSxM2FAJh3yqAPp1MR9bnfKlOhvMjcm2sRyZLCnfrMl5bkushsgp9cET+DleZk4w13KznodTchDhSxAlPgibMD+9AJJZh7lDDkwk3b6MjIT4V3u4MvmKXAEypwByekRNYN5j250ywwNnPDfeGIYbTjQQ204a3qRZMwWc08faJfIzNTR4y1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bb2mTX5XqATToWlU1OhxXGfkZ6u5WDgCpf6j8ZAtrsk=;
 b=jShLy1dSloujhdrSXBj7bVpedvCpxPLfJ1wWYE37Qz/LzU8KGx1+Id+BjDgPKrrWh8cDdZDT7Nn40aurDJBe9GEN2Yx3Af9UsoXZ9FShtMoegQGuXMgB6HH1m6jCZiJ6AIdcpVXiGncRLAT5AveEgErHF8F8LD/6Y89PjRMMGSBV1dsbh46naaQRXWUSBiNq5Fvu8TyuM7hyvBZ1FI5tXm6yLSTytF1pboYzGS5znlCywnMVFauOymnksoQr1+GMkpYbrG2T0SaM6txDGAmm8VDdPclFx2CZ7Z5ZPsTIlMhOTs7fmNdMfYISybwN7H2Yfn57bN6NeOvuUshvxhfG5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bb2mTX5XqATToWlU1OhxXGfkZ6u5WDgCpf6j8ZAtrsk=;
 b=3H/JKJxUeAx6iXtS+8wYLy5ZzDNmX7KjQLWLMTt+0AljPKk7w0np0pfu2C5a122AC0iVPOjTzn8zQCgA8IxFnDw4l2AHf/5564W54Y2jqMeU0/+Eorp7NLpvsyizww5j3tKtHPi4FryEfenZPTVuIrVO3IArEZ8hwqhA1OCV+hE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by MN0PR12MB6003.namprd12.prod.outlook.com (2603:10b6:208:37f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.17; Tue, 20 Feb
 2024 02:07:18 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::ee1b:768b:715f:e5b5]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::ee1b:768b:715f:e5b5%5]) with mapi id 15.20.7316.012; Tue, 20 Feb 2024
 02:07:18 +0000
Message-ID: <3c94c068-0188-4957-894f-be44e4c9edf7@amd.com>
Date: Mon, 19 Feb 2024 21:07:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/amdgpu: add GC 11.5.1 to GC 11.5.0 family
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240218051955.2280087-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240218051955.2280087-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0095.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::28) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|MN0PR12MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: de1e0b66-b9f4-4f2c-f66a-08dc31b8aa5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vVjtDEotwqdlZ9mqRHTzPLRDxdWvJtC3t6uoorcjDAaQ7GNl+ze/2iOXuZXtSVASO+p0mtsnmKlbwPL4/bAqRLPDtpeJtJsGlsQuf55RP2iO4MUE7fe51JSD65le4BFqjbYuHrfOW1nBR0sqGR+p78uI4Llxfgb+ptxKgylvexfInjOp5bDC8Wptfd9c5ce3W3w/RKKSYTwcjd2yiSK8F/7ns/SvhCuVjkZGX5m3zPPjFxBIKCtr04nTiQrDzHU+EfJjzLTbskv9kBS3liDFBEvWhsJe6zTdlRk8cdtUvfFM9zpVc3fSksFHcORhqzV2RoSJPRgcKELcqprTKZIgb0jWHaljkcQw6Dq3TKY8qA1qhuKmQjF99i2G9vI/9dj0oJnjTdDXa1lFAuHyMpCPKJrwfhSBjfZ33chH0fno1AMTEuUhjgdAL1Z2BOD2MXGzY0akCkIjXJdIa3QBNIMP/kP8rHatILzoUF9+XkmKkW00SS0nrmHOvxJBoy6jHBgty11wlLdKF/cH9/3JiG63eIKBpyDSFW+wjtDIR9kgIHk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUNCSExwcUVjcnpxM2JSZXpGWXBTR0hEUHRKUTZuOXEyN3o1M3BtM2w0eXhx?=
 =?utf-8?B?bGhubk9FK0hBSjlIUkR3cDFQVUI3Z2dJSW9UZHJIempsWHF0ZWk0NGdvSy9s?=
 =?utf-8?B?T0lJUmpEaDVqaEhLKytoL0hRWk1xZU9DKzk1cStacTFRRTY1bXJ1dytmaXg4?=
 =?utf-8?B?aWtmYmp2Y0QzN3cwRUZIVUIybVRDRDNaZ2NMWVc0RERORE1PTytZMXlGVnJT?=
 =?utf-8?B?QmRpTWNLL0taeWZuMTE5ZDduRkdMRk9BaW1TcjN2VUZFUnl4SXdCTlN0TjhM?=
 =?utf-8?B?RklvUGhVYkJhTU94Z1FaM0tXNTI2NDF6aG1UVjd3MG9CR2hZOUlZVVV4UlJW?=
 =?utf-8?B?RFVCN2xuN0VuZkQ5bVFhSnN3NGlFbS9UMHFMV3RGNGJ4bTIybzI3cC84YzZy?=
 =?utf-8?B?SVVqSUZPYVU3TGtzU1NDNkZVWVdmQWR3b0h6ZXM4alZKVktVMFNZQ25zNHpE?=
 =?utf-8?B?UTFKTDRsZHcxKytaWTlJRjFRdW5LQmJZOWFUSU1IQ2dWY0xpelVXdm9KaVNS?=
 =?utf-8?B?dGhjYlZxay9nSEplem52cS85Q2NTcm5NNk9zMENYSGJyeXczRjRtbVVTN01l?=
 =?utf-8?B?REEyZDFiZEM1Sk9ub05EZlNHR1FzcDc3Qzd5NEUrY2ZJSUF5ZlZRaDRVWjZ1?=
 =?utf-8?B?K1U2UXMvRnFUMFBQZ24zbUZOUW11cXFNclNld01BN3o0eE01MEVoZ1Zkc2pY?=
 =?utf-8?B?RjJyMmZManhHNGh0Y0VEZ1lrUTJzZ1NsYXhld0dLVVk4RzRHRWdFSlptalB3?=
 =?utf-8?B?K3d2M2dRb29JWUZRSHQydk9Yd1lDeUJ1UmNUNmhpNjhUWElDK1JRY1NUVTJC?=
 =?utf-8?B?K3R6d0dFZElyWU5USlp1QlN3VGgySDhIZW5ENnF3ZzlqZDRLUHplaWVqU2I1?=
 =?utf-8?B?azhjVzVsUS81UDhiV3J5di9SVW0wZXAxeVViRGZrUkptS2N3K1llSDdPNllv?=
 =?utf-8?B?UzFzSDFZSWc1OWxuK0JlMllnbnFhTGc1SmdobHhlM1UwTUVIOEpORDdVQ01Y?=
 =?utf-8?B?RzZYSm52R1B6TlJTb08wbmNJM0FpbTFESVRYdUx1RmlFdEJQNmJNVXBKcTEv?=
 =?utf-8?B?SXVhSk8xVmxDelZ3TUZPS1VEVGZJK3hEbk9SRUxLQWtLbFlkOVhOUlpXZHdW?=
 =?utf-8?B?c2Q0Rk1GOU1QeGZ4RnFIRWNtTzFmVlVOeVVnOWtLNlJTdndYSnV1NERCR3ZG?=
 =?utf-8?B?eTN5bElmdFRWSTFpSm5MREljMVJWZ2NFTW5aKzdUQlBXT05TdmFzWXNWQzFt?=
 =?utf-8?B?cm9vTS9lMm1XaC9GSldYNlZ3Yk01akNLZ1lNeHRQNUNlQWJ2RE1RVnY0V2Nk?=
 =?utf-8?B?bWx1bzNUU1hoSUloMlMybW9meEEyVXRSdDUrVHN6VlpFcndzUVRhbnhNOGow?=
 =?utf-8?B?Z1dodktUdnFyNmZtdDlLMHhQSm1kTUQ3ZnVRTExUenhRS3ZQN0JRcTJaMkxl?=
 =?utf-8?B?em9BdGo1MHMrUHlNNko2dmgvRVd5ZWJIc1RCWFA3Rml1VEtTWnJGQjFnMm80?=
 =?utf-8?B?MUJtNVo2RGI4L0FpN29pYXMvdVRRQU9vUHZodHg5Ulk0OExPemdJNXB5VlR1?=
 =?utf-8?B?V0gvYnBySkRNbW1SU3ZzckwwTUtoY3grRUgvOXJLbFQ3U1ArZTZpdHRTSS9H?=
 =?utf-8?B?MmVkUEFKcWo4NWdSVGxxaW1Wem5veGszR0JBdndHMjJTT0JMVmV5eTVlT1cw?=
 =?utf-8?B?RWlPYVhzQTZuQVBMSCtqVzJuam9mSFAwZ2loaG93SEk5KzFhOGZEbTgwNE85?=
 =?utf-8?B?aVpNV29KWGxRelIwTHR0RFdQRG1RL1EyU3VSUG9KNlpqT21oN2pwckVrdWtl?=
 =?utf-8?B?Ykg1Qk5xWGxTc3dEUm56aEt5S0Vhc3hic3J0Q0lKNHloQS9xeXdlQm5ldGVu?=
 =?utf-8?B?NjBaa3R2SzhhSkQ1Y2lqbWYwU3JpNmlMRmY4QzdxM1hyeHg1NlFrRm1nWFBS?=
 =?utf-8?B?YVY0bjlYNE5NYW9vcGFnWDdXZTZUM2tyQ0N4NmxLZHQxbytOWXFlbW83d3h4?=
 =?utf-8?B?aXpWN3RldlNVNFN4QWJzelhvZGx6RytmTk5pdW40RXh0V0p2OEx0YkRaZ1hj?=
 =?utf-8?B?M3FHZTR1V3FwM2dzQXpYbnJOcFhqT25pWmJhMnpBVE1vM0tuaHJpNk9zV3pP?=
 =?utf-8?Q?o6esaMTnzUunwUJP9u6nDW0nc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1e0b66-b9f4-4f2c-f66a-08dc31b8aa5d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 02:07:18.3033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSoXYlPA+Q+QQF7YD2fqmode7L0lH/KbT/J8wELSSHotI2RvQcObFbIyXt3oE1LTHamxqHwp9jIyU7cgesI2Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6003
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

The change looks good to me.

Reviewed-by: Vitaly Prosyak<vitaly.prosyak@amd.com>

On 2024-02-18 00:19, Jesse Zhang wrote:
> add GC11.5.1 to match the amdgpu kernel.
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_family.h       | 1 +
>  lib/amdgpu/amd_ip_blocks.c    | 1 +
>  lib/amdgpu/amdgpu_asic_addr.h | 4 +++-
>  3 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
> index 847fb0375..bce2c6c2e 100644
> --- a/lib/amdgpu/amd_family.h
> +++ b/lib/amdgpu/amd_family.h
> @@ -105,6 +105,7 @@ enum radeon_family {
>  	CHIP_GFX1103_R1,
>  	CHIP_GFX1103_R2,
>  	CHIP_GFX1150,
> +	CHIP_GFX1151,
>  	CHIP_LAST,
>  };
>  
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 79ce7b5a8..2ee94105c 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -693,6 +693,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>  		break;
>  	case FAMILY_GFX1150:
>  		identify_chip(GFX1150);
> +		identify_chip(GFX1151);
>  		break;
>  	}
>  	if (!info->name) {
> diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
> index 0130ae2f0..cbe02871e 100644
> --- a/lib/amdgpu/amdgpu_asic_addr.h
> +++ b/lib/amdgpu/amdgpu_asic_addr.h
> @@ -106,7 +106,8 @@
>  #define AMDGPU_GFX1102_RANGE     0x10, 0x20 //# 16 <= x < 32
>  #define AMDGPU_GFX1103_R1_RANGE  0x01, 0x80 //# 1 <= x < 128
>  #define AMDGPU_GFX1103_R2_RANGE  0x80, 0xFF //# 128 <= x < max
> -#define AMDGPU_GFX1150_RANGE     0x01, 0xFF //# 01 <= x < 255
> +#define AMDGPU_GFX1150_RANGE     0x01, 0xc0 //# 01 <= x < c0
> +#define AMDGPU_GFX1151_RANGE     0xc1, 0xFF //# c1 <= x < 255
>  
>  #define AMDGPU_EXPAND_FIX(x) x
>  #define AMDGPU_RANGE_HELPER(val, min, max) ((val >= min) && (val < max))
> @@ -171,5 +172,6 @@
>  #define ASICREV_IS_GFX1103_R1(r)       ASICREV_IS(r, GFX1103_R1)
>  #define ASICREV_IS_GFX1103_R2(r)       ASICREV_IS(r, GFX1103_R2)
>  #define ASICREV_IS_GFX1150(r)          ASICREV_IS(r, GFX1150)
> +#define ASICREV_IS_GFX1151(r)          ASICREV_IS(r, GFX1151)
>  
>  #endif // _AMDGPU_ASIC_ADDR_H
