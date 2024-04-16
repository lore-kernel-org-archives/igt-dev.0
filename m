Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B04C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 21:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD9910EFB8;
	Tue, 16 Apr 2024 21:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ny2G8Y6e";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FC010EFB8
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 21:06:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3F99HBxzjxWGx57UXkTJsBqZikAVvt0CqDBW0QGPmr2a10xC4MJKcq5aQBqnblkqRC3+3AqyEVhUzkOWw5czzzwJ7WwP7jh0KcTo34AkNZxdt2X5/WIo2Yia5RNKTAmDuHfzB59S0dK1CVwEheWvjH2NDHyoHRwLGn4k3BQ+Uyb5948bcH6KaLbX9fh1QQVuW0GqqFvEmbqHxU87NvuUNo5P8LSIIBL76/sJdyCVcAcxmRSzLxwDMtUtbqhcKIkSTSbsIhtw05LhzcmXMPI6jAnqzAa01cfki/+0CmZntORHx986SKKhQ0+tGXA3eR6MTtXnfTlxuoFxnRcfP13GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHHQ+8N4T5JHTc3S79+WShks3A4dJWQFuLNnfwsy7MM=;
 b=aeqzdjnihKch8o9ALRgAF/xLNfMYNZbyucG5rcIVS7rNxJKQrsgGK/ILu5nSTwEyzWHZ8tgOerRxxT8Q8/ElngDXzblEKHXsNfmSVo6co/k5zVsoxdTAWL/nqXqDPBhSo08M3e/PfJ2s/J4mMCcdspE40CLkKsavIJp/MdK0trVEOpQJ/NZFDbkROe5ypkIJ/VacYKzYRrgopjbg+PdJaxLiXnWB5FQr1d8HGizwAY4kwY65cXWWcls4uVrEnFxPVP1LKFUgXX1OzCTkVOIJGWxq6C4w7/A0YdxVa7uccGC1OCnNBnapkajZMB0FmCoYwc+8shZ2nP3JDgeIUWHwVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHHQ+8N4T5JHTc3S79+WShks3A4dJWQFuLNnfwsy7MM=;
 b=Ny2G8Y6e/NTJ49S9P6T+OWeL15GcNgivztyEdZ4HioS+d1EsKR01DyQWWCVF/JBiXY4OvFNseyiylLl5b1bqOt5xF0g7pJd5LdQaT9xvk8Dw6+NdH2BwK5wT1F5f5ubADIzu3xEfBsJqKKpgQ+ix5MMaLqkb+YrFT9H5rhGNHo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 21:06:24 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::6d8c:44ea:199f:b618]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::6d8c:44ea:199f:b618%3]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 21:06:24 +0000
Message-ID: <59f370c6-7f84-4783-9ef7-4995acf8da9e@amd.com>
Date: Tue, 16 Apr 2024 17:06:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/amdgpu: add check for deadlock test
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240416020405.184146-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240416020405.184146-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::10) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DM4PR12MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: f21be412-f7a0-45cb-e371-08dc5e591308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2NydARgvd7BD1iBUI7F9tw+/MER5qZx2c/ef1ftjvKbcQlCLjZxVqQ7OCdmN9vL6QG9PDqPBbMcw7puMcHNdmL0Gq/rndXx9o0Msw5dD7zmeZr+kbnPkDNebyf1118sL+gQVXAlaDPfISjXR3CJ5bWS3WVsofIgbFR30nf6CWsTWXhjsOQwRd2aBY/JHCantNHXrptn9p+AFt5PKFCTcbRSBf3M3zEHHX9fGbj2hU21juow+zY4SRKAUv+40KRkWMytOp0jgTbl8dN8jDR9iXmJx/ALQ9N9mwQrrIBK7FqBFElL5Yfha9jIAWKWRMHPXuASpJgm0UsMrsEX7CiYuQy2Yc3d3Hx5iqesrLWLZgu0RoNQCskJgnU/ZaxmM+ExeZrN33UGKlaM9xp0DgZZqLHZBTvMui0wO3osUZxNIjYjg7X0F8S0LzftxhEkVuG7ve4nnlkCUSN/K0v5s/LUFLgTvQ1qbb8pnZ0UnuXXleMmDKwePeRr/kuVvRplG0ukaVelkNKiYWdz+C80Wu3ls7LTsRDhSAIk8jcMotTWqfFok/ADzfc3bHzkHJjezFWDb07/9Pg3jQnUW0LRIz9eNhDZ3ZEm8EmZ3Z6nOe5YhMvqVbExbCuS0yfzpXQ4UZBdEWGNS4sD7pa4M2Aw9jaVYhIHb3TpaM+zNZ+GhJzvkiE0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFZzbUlZb1JEVXl6V2gxZ1I5UVE0S3JrSVBaVzVtTEIyTjN6ZzQxQlB0c1hT?=
 =?utf-8?B?enlsYjFNZndocE9WSVdhN0l3NnladU0vS3ZaeTU0NVJMc3BFbzlkVDc0RWor?=
 =?utf-8?B?dWRuR1Q2UHZiYWJ2VEhWcWNhRVFCdEp5WExCbytxakZuNGxlTHgrU01zZUUy?=
 =?utf-8?B?QnRudnpxQnE0azVKMzQ1M2o0UWxDZWQyeWdXekJOZmJwcHVWTUk3VXhNT0Uy?=
 =?utf-8?B?VjRmYjJEamd0cDZoQm83V254RjlnbDZmcU1UT2s4ZS9EbGNjQnl3MlkwbXpX?=
 =?utf-8?B?WGpBK0dzcmpZaUdKaDUyeTRiajRZUmdOQzgvYkgybjh2Y0htM2FqdVJEczFp?=
 =?utf-8?B?RGZFZFRXb3g2c0JSd0tKV1FRcWhFcDdacWVzRTBveDRPa0lDZTJ3NEVtU0pJ?=
 =?utf-8?B?RUthTUJBb1ZWTytUWSsvL0ZET2ttK3BkRkRVWmEwSCtpbDdmSXhxMFh4eVlJ?=
 =?utf-8?B?WHQxTGI3TXZXejVJRW1vZUxCRExJSnZhVHF6WDFGKzVjdFd6R2VjSkYzOUcv?=
 =?utf-8?B?WUc3emsra29VK1NPb0E5ejhtemFPejVKWEYyMG9HU2k5NGxadmRoL2lpSVcw?=
 =?utf-8?B?a3M4NkxCWHhTeE8vN0Vqa1hTamFTcWtJMGl0TEJLdERwYk1kRk1iUm50WmVm?=
 =?utf-8?B?OVFEdDdac0VDUTkxU293SFhWTFBRMDJSRjEyd0xOc2NGczNTSlJ6R1VMTlMw?=
 =?utf-8?B?WVlKUlYvdWtrQVZWL1dzSjNNY25MbUxtVTM5ekFXZXNneU1HdEhBem8rZU5q?=
 =?utf-8?B?dnZYaUt2MG1TNVRQV3RIUlRIZlRramtLQUhnSGpRM1FuN3RpUXNSTkNPdmZW?=
 =?utf-8?B?VjVSbnd5K1VwcHlWVkovTHdkeGtyZ1NYVk5TL2szcGtSemxBclo0eWFwOWtj?=
 =?utf-8?B?bDhqUFlrWGdaRW9heVRjTGd5ZEoxRG03cWJZb2R4a3VxRlBmcFUzaTBkUjdS?=
 =?utf-8?B?cWpObkk0czVtb3Q4TzdmMThJU2RxSUQwNUNzLzVZR1ZOanBadHU1V0dwYmdO?=
 =?utf-8?B?K1F5TWF3bnp4WTZtekFZOWhncnozcTN0Vk56WEhrbTBlcHE2YURsd0w2UVNs?=
 =?utf-8?B?M0FldXU4UE9rS0V5SEFmMXZQZTRVNGk1endSS2gvaE52d0lWVk8rUEtmZXVL?=
 =?utf-8?B?YVlPVHYvK2YxQjNXWnQxMGVZaVR2V0FSekg4cXV0N0k2U093SEVIYS9RcTlJ?=
 =?utf-8?B?aXVwakpXbHJibUZuRU9iNWh6RkJWZGdSc0s5cGVYSVh2QkRGVEdONnIyUyt3?=
 =?utf-8?B?TFdsWWRPSDFYSW5OanFETFhYZlNNTVlHM09QeTgrZ0ovN2Erem5sVXJzSWhs?=
 =?utf-8?B?cjl5dkxhcDc1V3FveGpqV0ZVc2hsd3ZqZWxDYTZkREZYVHpUQkJ6ampXbUFV?=
 =?utf-8?B?SEFFQys5YUk1Ui9IZy9PRUt3MzZSTXhqNVZySGdFSWhqZ0plZU1UdG5lT0hB?=
 =?utf-8?B?ZlNQNTFWVG94US9nb3V5bFQwUURuNVJrTGZGSGJ4Z1VhRFNFc29PbmJCQWJw?=
 =?utf-8?B?QTJ0YUNCTnlZb0NGaitBVmFlZ1I1Zy8rb0FOdjBuaHZZc0lJWFdaQlh0SUUx?=
 =?utf-8?B?MlI0MmpwaGJwbXgzUmdZWjhtcVpveW8wb0hCNm9ROWIyL04zeGVsSUpNbnBh?=
 =?utf-8?B?Tit6dThCR3l4bWROM3dkblFlZ2RXRGRyc2Y5UGJWTnQyZ2twSWRkUWNEV2Jv?=
 =?utf-8?B?WkpWcTdRRk5wQzVJYnArNE9GZnh2eDkyMEZOUlBTSWp4aktRQ3hzZjc4WnV4?=
 =?utf-8?B?S1V2c2RCRTJTRGFpM2RCSDhKelhhN2hrSFQyYlBiSkVza2RCVWZXSk5GZC91?=
 =?utf-8?B?WUgzdHVxUkZFTXpLdE4zU21sZHRoYWlNV2RWZVNSVUozL1JvaktZb2JCMWg0?=
 =?utf-8?B?M2ZsNkV3SjBTZThQS0U4SFVTSlpVbFdpalJjWHRmaDEwTkZRazRMOW15LzNU?=
 =?utf-8?B?MXlDOGw0RDM0eUVwWU9YSlFyU3hMc0IyeFlEYXB3NFoxWnlweVRGWU4rTlRK?=
 =?utf-8?B?V2F6bVRQZFJDTXBFWEVSR2w1OGZHWDFPNWZCZWM0VFo1d0MzVjA1U0FHRkJT?=
 =?utf-8?B?T0JYdFVtM1ArcDc5b0M4MGpFZFRBUFl4SlBsRlZsdUd2bzRQSmd0NFFmbzlm?=
 =?utf-8?Q?HDxGsCklesvSrTeJnOrp2RBZC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21be412-f7a0-45cb-e371-08dc5e591308
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 21:06:24.6855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXNsnIFcIegDRx+HUi0fYYY/sNlDLVMEscwlhxCVSZrtPdpqo3DCPauSNmxdZCgayg/OTn0xzvsYsTW5pYcPdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6134
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

Hi Jesse,
The change looks good to me.
Please, remove links and AMD internal information within the commit message.
With this fixed
Reviewed by:  Vitaly Prosyak <vitaly.prosyak@amd.com>


Thanks, Vitaly

On 2024-04-15 22:04, Jesse Zhang wrote:
> Only enable deadlock test  for ASICs supporting GPU reset.
> The internal related tickets:
> https://ontrack-internal.amd.com/browse/LWPSWATG-6036
> https://ontrack-internal.amd.com/browse/SWDEV-112212
>
> the issue report by:GMP, Vikram <vikram.gmp@amd.com>
> The internal ticket:
> https://ontrack-internal.amd.com/browse/SWDEV-455182
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_deadlock.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index dc7ec4366..7a27fae51 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -9,6 +9,28 @@
>  #include "lib/amdgpu/amd_command_submission.h"
>  #include "lib/amdgpu/amd_deadlock_helpers.h"
>  
> +#define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Verde, Pitcairn, Tahiti */
> +#define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii */
> +#define AMDGPU_FAMILY_CZ                        135 /* Carrizo, Stoney */
> +#define AMDGPU_FAMILY_RV                        142 /* Raven */
> +
> +static bool
> +is_deadlock_tests_enable(const struct amdgpu_gpu_info *gpu_info)
> +{
> +	bool enable = true;
> +	/*
> +	 * skip for the ASICs that don't support GPU reset.
> +	 */
> +	if (gpu_info->family_id == AMDGPU_FAMILY_SI ||
> +	    gpu_info->family_id == AMDGPU_FAMILY_KV ||
> +	    gpu_info->family_id == AMDGPU_FAMILY_CZ ||
> +	    gpu_info->family_id == AMDGPU_FAMILY_RV) {
> +		igt_info("\n\nGPU reset is not enabled for the ASIC, deadlock test skip\n");
> +		enable = false;
> +	}
> +	return enable;
> +}
> +
>  igt_main
>  {
>  	amdgpu_device_handle device;
> @@ -34,6 +56,7 @@ igt_main
>  		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
>  		igt_assert_eq(r, 0);
>  		asic_rings_readness(device, 1, arr_cap);
> +		igt_skip_on(!is_deadlock_tests_enable(&gpu_info));
>  
>  	}
>  	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
