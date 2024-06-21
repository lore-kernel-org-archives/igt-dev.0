Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249F9C2BA18
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 03:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF18810E913;
	Fri, 21 Jun 2024 03:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LjQ/nhNK";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A7610E913
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 03:06:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkRRjSIygjha8uOS0KarrQh0j0Op0+eLYMWxib/yxjjivStXJkQjxlf/b3UvprAkZdhzAcuZprQuCogZOB/b7UvnPNQ9+2Qn+qW5sIR+T1X4FGU7n7oXSDPN/EZYEG1QMWqWZrDl4puKncJdwTZjG1k3PoF3jpMz3ZccCaGvVdSNYWOXisatHkLqjvrtJP35hzFi6Tb8erFgxUki5t3RrD7sDijJcWKfekPWGCeCOGH4Eksa0x2ZRJaO+Yiw2WaxaQ66/iQ+id2qZJeXrvI2bx44znPEKPLzGRjpovYD3vtwE1ggFJzVBOTOCS4Nj9Mj0oM3c47DJLKfORIOo+tTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymc5w3TJlOVfS5OLns+5SHet8EHNdW/GyxKjAwtaJLk=;
 b=niAshmo+SZXciTr15vB9j/aPgFzIjadEHrcsbivkrJ4+FOoea9XT5qNE63uXFot7tX10h7i+pIuKSCzkCfzZiccV3WrI7I0AUTbUoAtsihtzmep1MOqzyTXrf/O+ZHHlbtO8IbIe5/qvFHSsLS1Hs2k34sg2F+tKTZFoHyRc2o6rcnmpLV7ODXKob+bw/YgXCDSQl7NaYF4jXID1WRDmwl9irdZ/9u0RSrN2A8BZwTuXpsbtb4f2mYdaZe1NwdxFxzpqHCPIgQFkPSK491eYVYErydq/CBqAyNsfFiaIItpONzG8j4nmGrDPz+XLHuTV5DyRifWM2xDNHL6AxvKeWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymc5w3TJlOVfS5OLns+5SHet8EHNdW/GyxKjAwtaJLk=;
 b=LjQ/nhNKVBIvcqKMviLY19Ke+7n0QtZOiLQb19C8DjgnMJysWONZbtobpoftflTomkzMYSRYSv9Cpneas9Vy9DIn4rVYdRxVcybxFV50jSUGLTVgycrLRjqdBSzbxvtNjWbdEKTXn3EoToK8FzO8SgQSPgvopV82Srv88Nx1E3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6401.namprd12.prod.outlook.com (2603:10b6:208:3b1::8)
 by MW4PR12MB7168.namprd12.prod.outlook.com (2603:10b6:303:22d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 03:06:18 +0000
Received: from BL3PR12MB6401.namprd12.prod.outlook.com
 ([fe80::8c97:7b76:6800:ae9e]) by BL3PR12MB6401.namprd12.prod.outlook.com
 ([fe80::8c97:7b76:6800:ae9e%4]) with mapi id 15.20.7677.030; Fri, 21 Jun 2024
 03:06:18 +0000
Message-ID: <2536a582-5206-4b51-b71a-daa8cd48d777@amd.com>
Date: Thu, 20 Jun 2024 23:06:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] lib/amdgpu: fix gfx11 issue about amd_dispatch
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jiadong Zhu <Jiadong.Zhu@amd.com>
References: <20240621025043.2294053-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240621025043.2294053-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0009.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::20) To BL3PR12MB6401.namprd12.prod.outlook.com
 (2603:10b6:208:3b1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6401:EE_|MW4PR12MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f2e204-202d-459e-ab41-08dc919f1f00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3BUaGczMVZYZk85R29ISDNIME9lRERNa09sQkxuUWRNTmZxdTFuRitvbXc0?=
 =?utf-8?B?dnFveFJkTTQrampUeDZTcVZTYzV5ckp3SGZyQjA5c2tndlN1QzR3N0FUVmJu?=
 =?utf-8?B?RlpzaVNzRUdUcnh6SWN5TTdRczhId3c2elY5Mnlia1JTVGx6VU9VNWNockxo?=
 =?utf-8?B?UmZzS2tsKzJjKzBLbzV5Q21OdkphbzFmbjM3N2NwRDNRTEx0MVhlakxIamFP?=
 =?utf-8?B?VDBpRGUyUjNTVy9jaHJ4a1lSdERZaFF4b2xmaW5ieU1Xb3FyZmZUeDRQTDVi?=
 =?utf-8?B?NU0vUm83UnlSR1dZZDhBcU50VFZabjFiUTdJeER6RzJaSDlFZmQ0UzllWFpi?=
 =?utf-8?B?TGVOMDdFQ0gvZ25LYzQxT1I2RWNDWXQrMFNzWlNkeTUvaWkwdFFZQmJoM2RS?=
 =?utf-8?B?dnNyZSt1eGppZU9iUytKZSsrUTFZcVBRZGNTSXJLMkYzQ0xKQ0lEdGtPU281?=
 =?utf-8?B?Z3M3Vmc1aWlHZEZXSHhvYS94SGNDNFBIZEREeUl5Tk83QVhYY3EvcXZndnJE?=
 =?utf-8?B?ekhJT2JxUUgvWGQxM1BNemt2Nk9ZSUIvN2JLZWp6Q1RGemErRWlTc3MrWDNy?=
 =?utf-8?B?ajdOSzBzRUlEcG1GVDZyeHlEczkwZEp2OCtycTRhbklRd2IyQ1FYZjZ0bkha?=
 =?utf-8?B?VjFXbEpRRm4xcjhWQlRHclprVTJQTmo1K1NTMlBYbmhPSjVDbmlReFBqL0o3?=
 =?utf-8?B?REVYam0zdmpBcW9rdmV1ZjZFR0FoUk1CbElFbDAyUFZ0ZXh6SDlyNWdUYk94?=
 =?utf-8?B?SDRzc2g1R3JuaDlRVldjUWdPeWF3cVROMlRYS3Rwb1NiMVB5VEwvRXpDVSsr?=
 =?utf-8?B?VjZidlRSWkFhMlcxbEU3RTNOdWszSE53MVpVbEpWaTVlNitrbUhhSU02dG8x?=
 =?utf-8?B?NkpBcHZweTdFMDNVMGUvQUswd1dPcWlpQkVNcWVEN0wyYnhaMUJaVzhGSlpn?=
 =?utf-8?B?ZnNud2NVZFB6VWpQVGswaU5SZ3cwSFlwd3h2Tk9Ed2FZUnd5bzY1Z3IyTlRC?=
 =?utf-8?B?R2toUVo1OXR1WGtlUnIwcmFRODlZZHY4MGFPTnJwVEJ6QXQrRkpIWHA4Qi9F?=
 =?utf-8?B?ZUFhM21LdFpzcTVnNFpVdmlSRVMzMG82bytpbnB5RmhSWFVVaVhEZlJNbmdo?=
 =?utf-8?B?aTMwdlFIc0NPRjRPNXgvSDQ2VnpiSEpvYXF5M0hkRjFZN1V5bmYrbDJ1OGt0?=
 =?utf-8?B?VHRDNlQ0bWpXTVlRTnp5QVRmaE5SbTFxMUcrTzdFbkFPaTByNDU3bVh6bzUy?=
 =?utf-8?B?V2lETXludEFlc0tQekhrSmdqREJuY1VRbEpBbHRpcitGK1Y1ZWU5ZzBYVjFI?=
 =?utf-8?B?a1AyeHUzdExRR0I1VHdMUmJzSTluRGRHaTJXWlM4RGNlYzhJUXFQVHc4blVC?=
 =?utf-8?B?WlJuN25MOU01TytXMUpOUlMzYU5LYzBOV2VJUDRORnYvOHBOeUJVRmZjV2J5?=
 =?utf-8?B?SkE2QWl5OUZCeWFnOGI1N1VTYS8xc0RXRXdCbVNEb2xrZGhxamJsNG1qWkRF?=
 =?utf-8?B?Sk5reE5PR21iaTFWU3ZEMVBQRDNTQXFhdFJkWCtISEgyMC9uQnROSk9lWXBJ?=
 =?utf-8?B?M1JQYktJZkg1b0FaQk9HWEJzTWtzQnZrYjlnWVI3emhrM05Bck1HRnprc0xR?=
 =?utf-8?B?RVVaYyt6MlBMNm9STE9mQkFBa2Y0bFU2OGZueHBPUDdjT2d4TklIb1Excmpl?=
 =?utf-8?B?ZmE3dktJM0o0V0ptdEtGRkptMk9zTFBuRTRVbVpkQWVzNlBUN0xsOENiWkR3?=
 =?utf-8?Q?PCYGBez8saIMSqwbmpqwvCDVtzwj0hPZPITs1mx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z01LbFNnZ3Y2akFHTGh1TWhwRnErR1VSSHJrVWszbHpRUUQrNUlXZ3pXUFdw?=
 =?utf-8?B?dlVGc3RkZDN5RWtGbS8rTXJyV1JKRGtiTnJocHIwN0JkTW9XREJDd0tTakpD?=
 =?utf-8?B?QnBhelh0cmJkRnBEZnZnWmxhUTZzRGNJK0FLOCtxbGN4NjY5VnBvbXNCc0hw?=
 =?utf-8?B?MkJXcUVFTUV6cVMrM2FnSkovRGNLVFpPbEtUWkplN1VFdHhQMC84NzkyT2FU?=
 =?utf-8?B?ZE50L0xSOXBGY1lRNFRidDB1NGNIYnpiV3BIY21hWEx4RFRBWktJUW5Jd3VC?=
 =?utf-8?B?aEh6Vzh4aFA3bm05MXN4c3Q4RXM1TXVyNTR4aWI5T3VqQWpQUUFKZzgzTUs2?=
 =?utf-8?B?R1ZnSVNaZFd3VTl0RVI2aEs0bEZZOGJVOEVka0RTT0Ryb3dVVGxBUU00dk5P?=
 =?utf-8?B?UHdaWDhuVWhwcnE1L1RXQ1BPdGdCNitKYTFEZ1BRVUVvajZDY1EwM1BUL1Yr?=
 =?utf-8?B?QzA1T3d0U1kxWCtMUldOUU1ZSnh5VHRLNytqdkJJcnY1Z3UzNElZcmJiKzV5?=
 =?utf-8?B?VU9Fa3luNll1Y1l1UEROK01WMmNDWlRYSUZXenJMYzF5cG15OXZ5b0RIa0Ri?=
 =?utf-8?B?NzdWdTlOTlh3ZHI2QWZnOGdvYWhLTXp4OUtPRkcrVHRpMk8yTXA5T0ZXZzRL?=
 =?utf-8?B?V3FJL1lRcU1oeVA0d2k4alRIMGRXdFpxTWZzTy8zelFxdmhLZGtDWTNtSys4?=
 =?utf-8?B?OWdaSGVkcW0xVjV2NE1aNEw0MU9NVGZMUkxVcUEzWkl2R0V3cmdTRUt2cEk1?=
 =?utf-8?B?bWk3WmhxQmx1anUrQXJJenE0RTB4T3pVM3hNcTAxcC91dUZ1eUo0L2ZaeXE4?=
 =?utf-8?B?OUxuN01NN1BlbEpOOEdqdVNxa1YzcDFxOUhud3Z2cDU4Q1czbnBPb3RyZ0c0?=
 =?utf-8?B?OVFBcTJIbVBITklqR1dNazZTcW4xbGlhbG96VlYxUHZRekJzd2JDVlBSNVRC?=
 =?utf-8?B?YVJMSFAwOGIyOXozdklwenAxNmFIczBqS1Z0QWZSRGEzM2krR1NlcUowK0s2?=
 =?utf-8?B?OXAyMDhtRkNPRWRHN3l5Y25SOURhbjVqMzVDeUtwekY5MnVhdE15eGVscklq?=
 =?utf-8?B?MGVtTnJyNWNET2ZDN2MxK1FnMkJLb2pIRG1zMUJHakQrYi96NWlJbHExTzdD?=
 =?utf-8?B?c21HVW4vSHQvTUVFc0w4K1JlbXZWVVJXQlFsZkR5NG9IeXg5MUJsKzA1bFhS?=
 =?utf-8?B?Ykg3cGVvakFmV2lOWC9iOGtFZmIydkFHMGQrdk91aURlZjdvVVBhZUoxZGYr?=
 =?utf-8?B?RTd4bE9LdjVwUmgzKytDTjA2SmxXaUJQVmNGVTFOcXZRODZKQW5tUVRHUXRj?=
 =?utf-8?B?cDNQT1RVMFVYd0VldUZKZjEzWUZiaU5vWjh5M25Dd2tvdEx2Ky96YVJwVUR6?=
 =?utf-8?B?OE42cUl6TCtKU2dZMlh4UGF3aHN4azZsbHhFcFEzaUZhRkdHZWFYM0F6a2N1?=
 =?utf-8?B?UjJCeFAzRFN3VEVOZ1ZpcmJCZExPYmNZWWVqNXpVcldNNVR2amlPYmNzTk5G?=
 =?utf-8?B?SGd1TTJ0YXZOd3ZMUlNwS0hPUWpuZE9uZVNZdlYwZ20yeEJkMjdITDZ1Nngz?=
 =?utf-8?B?UytqQ0JSUFNOUFl1a3JnVCtZdzVieWlEV2hFelYyU1gxSUF2Rkg1Szg1Mzgz?=
 =?utf-8?B?SUwwWmJkZzJIOUM2NmQvbHpvVzFOT09XcG5UMjJrWEh3VitFb3hXSnVSNHNP?=
 =?utf-8?B?aFQ4MXNyTC9QbEhtVVZhMUJWbDV5T0FjbGdpekJoSXZvY08rT1VrL3VFcEdk?=
 =?utf-8?B?bE4yYzlBRVR3VncxdzdtbW9WcEh2TUhsOUVPZUMwR252UmxCUXVna2JadlRy?=
 =?utf-8?B?SCthTHJzQ0pKdWJEQTN6S1poRHBnbXpram0zU2dmaGlNcE1YNFI1OEFSdDVP?=
 =?utf-8?B?UXNycGdNVG1DUlk0NlQydUZMVjJjSkVOR3Y2OHh2WG11aloxTm4wTU9WcVg5?=
 =?utf-8?B?UERCNHp4ZTViUU1KK2NaSHovQnMxUUFwT3BHY2l2SVFhR2NIZHhURlpmTTlR?=
 =?utf-8?B?cVlVV1AxdG41UnYydDBZTUQ3ejVOOVNqMEtoSzJIOCt3RCtSUk5GVjBhdzVv?=
 =?utf-8?B?K1MvNTFOY0J2NkwxRTZQY1VwV1pHK05ZNlExcm95TmlHYzNLWVpkZS9xcnVt?=
 =?utf-8?Q?0B2RzCHJSsoLt7+CnAE/ILsly?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f2e204-202d-459e-ab41-08dc919f1f00
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 03:06:18.6474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CixVpcHjkK2dhX6ANrcP0IDvwk8UDxpHU/g33YzMcGdecbw8gp51HIrfEYL28TgrevkOD/pb4ms4jrrbHJGPxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7168
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

Looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-06-20 22:50, Jesse Zhang wrote:
> add some initialized register and fix some uncorrected register setting.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Signed-off-by: Jiadong Zhu <Jiadong.Zhu@amd.com>
> ---
>  lib/amdgpu/amd_dispatch.c         |  2 +-
>  lib/amdgpu/amd_dispatch_helpers.c | 34 ++++++++++++++++++++-----------
>  lib/amdgpu/amd_shaders.c          |  3 +--
>  3 files changed, 24 insertions(+), 15 deletions(-)
>
> diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
> index b739ce64d..df7d56ea7 100644
> --- a/lib/amdgpu/amd_dispatch.c
> +++ b/lib/amdgpu/amd_dispatch.c
> @@ -345,7 +345,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  	int r, r2;
>  
>  	int bo_dst_size = 0x4000000;
> -	int bo_shader_size = 0x400000;
> +	int bo_shader_size = 0x4000000;
>  	int bo_cmd_size = 4096;
>  
>  	struct amdgpu_cs_request ibs_request = {0};
> diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/amd_dispatch_helpers.c
> index 1c7413922..b0a5f550e 100644
> --- a/lib/amdgpu/amd_dispatch_helpers.c
> +++ b/lib/amdgpu/amd_dispatch_helpers.c
> @@ -70,8 +70,20 @@
>  		base->emit(base, PACKET3(PACKET3_SET_UCONFIG_REG, 1));
>  		base->emit(base, 0x7b);
>  		base->emit(base, 0x20);
> +	} else if (version == 11) {
> +		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> +		base->emit(base, 0x222);
> +		base->emit(base, 0);
> +		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
> +		base->emit(base, 0x224);
> +		base->emit(base, 0);
> +		base->emit(base, 0);
> +		base->emit(base, 0);
> +		base->emit(base, 0);
> +		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> +		base->emit(base, 0x22a);
> +		base->emit(base, 0);
>  	}
> -
>  	return base->cdw - i;
>  }
>  
> @@ -85,27 +97,20 @@ int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base * base, uint32_t version
>   		base->emit(base, 0x216);
>   		base->emit(base, 0xffffffff);
>   		base->emit(base, 0xffffffff);
> - 	} else if(version == 10) {
> +	} else if((version == 10) || (version == 11)) {
>  		/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE1 - mmCOMPUTE_STATIC_THREAD_MGMT_SE0 */
>   		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
>   		base->emit(base, 0x30000216);
>   		base->emit(base, 0xffffffff);
>   		base->emit(base, 0xffffffff);
> -		/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE3 - mmCOMPUTE_STATIC_THREAD_MGMT_SE2 */
> - 		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
> - 		base->emit(base, 0x30000219);
> - 		base->emit(base, 0xffffffff);
> - 		base->emit(base, 0xffffffff);
>  	}
> -
> -
> - 	/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE3 - mmCOMPUTE_STATIC_THREAD_MGMT_SE2 */
> - 	base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 2));
> +	/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE3 - mmCOMPUTE_STATIC_THREAD_MGMT_SE2 */
> +	base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
>   	base->emit(base, 0x219);
>   	base->emit(base, 0xffffffff);
>   	base->emit(base, 0xffffffff);
>  
> - 	return base->cdw - offset_prev;
> +	return base->cdw - offset_prev;
>   }
>  
>  
> @@ -161,6 +166,11 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
>  		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
>  		base->emit(base,0x228);
>  		base->emit(base, 0 );
> +	} else if (version == 11) {
> +		/* mmCOMPUTE_PGM_RSRC3 */
> +		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
> +		base->emit(base,0x228);
> +		base->emit(base, 0x3f0 );
>  	}
>  	return base->cdw - offset_prev;
>  }
> diff --git a/lib/amdgpu/amd_shaders.c b/lib/amdgpu/amd_shaders.c
> index fad6dbced..e4931961c 100644
> --- a/lib/amdgpu/amd_shaders.c
> +++ b/lib/amdgpu/amd_shaders.c
> @@ -132,7 +132,6 @@ int amdgpu_dispatch_load_cs_shader_hang_slow(uint32_t *ptr, uint32_t family_id)
>  	    0xd7460000, 0x04010c08, 0xe00c2000, 0x80000100,
>  	    0xbf8c0f70, 0xe01ca000, 0x80010100, 0xbf810000
>  	};
> -
>  	struct amdgpu_test_shader memcpy_cs_hang_slow_nv = {
>  	        memcpy_cs_hang_slow_nv_codes,
>  	        4,
> @@ -140,7 +139,7 @@ int amdgpu_dispatch_load_cs_shader_hang_slow(uint32_t *ptr, uint32_t family_id)
>  	        1
>  	};
>  	struct amdgpu_test_shader *shader;
> -	int i, loop = 0x10000;
> +	int i, loop = 0x100000;
>  
>  	switch (family_id) {
>  		case AMDGPU_FAMILY_AI:
