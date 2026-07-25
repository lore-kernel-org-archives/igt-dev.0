Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4B7C531C9
	for <igt-dev@archiver.kernel.org>; Sat, 25 Jul 2026 06:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE07210E0F4;
	Sat, 25 Jul 2026 06:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mMESEi4x";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013054.outbound.protection.outlook.com
 [40.93.201.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3E110E0F4
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Jul 2026 06:52:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7jTcm1hMfYEIDiYJone+gaFThlBXOg0fHEIuM5PjYk69182Okt/QzvsDecbHjov/eiMk9M9xxzwjZyEmmi5Skm+VxF5XNk4NKAwlLUPOMQW9SZKC71X9FAAFYK8wPhwf0ibQ7GE29Pj2uwyyx5ixEOSFQuWsQngS3YlCU5/0xZReLFdCoY9gjKLWXGLpQgjWcQl675KSWCPMKqNUhn0OJ6Pj6vA69HRmW7hsD3vHwVP1Ft/TVByidzJPOaK42TGi7g28j0+5X0wbhCG9Zfw4I2JXuwYHETnYbPCm43hDersmHnn4L/rB50nD56TfpMBY7ck73SvR5cLZ7BnMaltwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqiaqUQ9yIy+nAG7o0CO/Yd45S+/U+08zEMKMizGEI4=;
 b=bWSTaEGLoY8l9fFr3XsKg4dawqP01grVl1dkCD2OH1oZEQDY4bnn/D33i8qOoQJe7CRkjQvnNERr8pDwlM4pvfsjUFUIi7wBPJAyojyIsJH6Iw0wyPut698ZoQEU4nD0I34QbIJaGsiM9LTUkylZCOgQ3ktt/GVh/pO0TgtOKVlraNfo6iiz/lFfI6vohQurOAUTukH1p+Zrjlqg2xrvf3zrWb/J4qUYGrELfNDopqL1crQwzRLTMyDNMRR+mUJm/c3PIS69vT25vEmZIbRZs8tOBJgEUWphtcUbcwXfEz0ZmXNKUgH50kdTyIRhIsKw9S/UfiUfT+14B7zC/NGM2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqiaqUQ9yIy+nAG7o0CO/Yd45S+/U+08zEMKMizGEI4=;
 b=mMESEi4xWnjyJeBpkydoY+H3LX/zo6Wk5L5WJBGxqQbmMOv4p018Rl/PJn00TXssPJIbX//UNNBN6ak+SApGXhWCWFeKHg/o1yN1x/FkqK/Kimk++lnjocY2UPZ5w503H6XWCS539d4AoEmlpK7/SD1iqcRoByTzqXGW/IISwG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA1PR12MB8857.namprd12.prod.outlook.com (2603:10b6:806:38d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 25 Jul
 2026 06:52:37 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 06:52:37 +0000
Message-ID: <32d37282-f535-40f1-ae8b-949bae8b4424@amd.com>
Date: Sat, 25 Jul 2026 00:52:35 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] include/drm-uapi: Add DRM_COLOROP_FIXED_MATRIX
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-2-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623175737.171142-2-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0068.namprd03.prod.outlook.com
 (2603:10b6:303:b6::13) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA1PR12MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: 9886ee35-a4f6-46b8-27f4-08deea195011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Jf72QnXwcPzIZ4SIWm7BPMpvdBSclL8u8dBvjw0YmnJ7qZeekbhxDmvMO4LLWZ6P8xmhBHC2Wk1mw+K4ddG9WI9AEC5TbYDOAejJKzzB0shD6pD9tRhnZ3BiCG2EvMV3AF08MI2fTmr1hAbR5QRbDmJbNeQ99qAJjDb3XuW7AoI6IzRUXKiUqgkE5Gyno5AdFrYV9guYPejckQbuEuO5GOWWd4Pw8YHDeMhbeAAiLrNKjncBNsW2ap0qMZmF/dVI20jyYpR/MlLxkQxRZS8KPjAWN/CEKESnrff8hjrnHvLUw3mSL3QQe3DiPgmGaP0TLthuJHcjbVk9oQyyy8B7rKeoH4xpItBlxTMzsR09VqWDVoYi6Gjt+aBU+RT8Fv659YAWmpQUSXQzXWH//va4oDJpcveCgI3ytTQXguDTntVoAKFcELwCr3ODYbBYF8O6CLruTwQfzK6ZiO3Qfz3aQ/VjuQApruMu+uVBxlWFV8uif79Ch7k1C4KFnKMJ0/d6hH14hR8QTlXa9608GhLahyY8fo4JF3upspKuGwKNFVZ2DzbnrSBWQ/ar4S86VQAUPl/N0Mgf/RZZFKgvqag9HEJ7awzjMJ2H+H51ZYknNSzH2kT/dy/8qEoPpDglqqFNDaj17VkqTrg++JCcLXd097hzk7KlQhneG5RSA5fdBw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWJTd1g0MVM2WXZzdXl1UTlnRFlheGxPS0o1WURhZ2oxS2dsTE9PaFVTay9S?=
 =?utf-8?B?bmZPV1FZQi9Oc3RXYTY4MkQwTzhZNDZyK1JTcVlLSDNGUGRhWWk0K1BubUhM?=
 =?utf-8?B?SGVsUVFKaVVOQml3U0VOTGFkZXVVaktPRXAxM3VHWENzUzBUTkJSS1hMWFRj?=
 =?utf-8?B?VkFwM0Fkd1JmUmpwMUl0MEdMU3RGWExIN2wyY3grNUozOFU1dk1xUHVKUkgy?=
 =?utf-8?B?Vmtsb1UyRWpnZVJ5eFpnY3FjTkwzNnR5TXBQdHYwOU1HTSttOGg5THZ6WTVN?=
 =?utf-8?B?S3gvNmtTemNKUzVmZS9KVFNPZUNyNGZ6U21RUDZadUZRbUtjZ2tkak52SW11?=
 =?utf-8?B?RGdPajNrVElLNWFKS0tNYUV3VXIxNWVxcWIxamxUZjVIZnFvMll1NlpvYyt4?=
 =?utf-8?B?VXNtNEV5cjJBcmU4c3RRcStTTlgzdm5KdGV1dlBCTHJhajl5Z1lFa2JpRks0?=
 =?utf-8?B?TUt4ZTdaUk84OHluS3NYVUdybittdTdCRlB6MnFoaXRGQTRIWDFwREFaU041?=
 =?utf-8?B?RmZUU3JTdERYL2EzTTh5cmFhS1lNbWJ2bkRnU056dG5id0hJZE4zeVJGUi9w?=
 =?utf-8?B?ejZsRzdkNjdHTS9wYTZrdTFxNmk1VitXRTdpNnhrS1VRQ0YwL0c0QzE4SnVC?=
 =?utf-8?B?V01LcEp2ZHY2by84RW0weG1UZkNsVDNCTDJyd1duZSs0RnhWejVPZ2EyRm9a?=
 =?utf-8?B?R2tZK3QrOU15akdDeGdkY3RWejFiYXlMYXlyZ2grREtXNThBOXErZkxkd0Nj?=
 =?utf-8?B?anllQjJpUUdDR2VSTFFPUmFRWXJ1VDRKNnQ5UXFVMFBRb242eTczQ2UvcDBK?=
 =?utf-8?B?RDVNSmwyN3JVUkpWOUtIdEcrWW5nVExrUmVxZHNjWWNaczMrRVNrWFAralcy?=
 =?utf-8?B?elJQVXBjUkdGTTFmSk9OdkhYYjRHeEtMV2lpVVp4WEk0UW5hV3dZbUxWcmhs?=
 =?utf-8?B?NUNaa3Vibk1WRktTcjFVOW9GRnk5eWlyV0dnYWtPVUFBVUdIOTEyTTVqR2Ur?=
 =?utf-8?B?aFFCWTE3bDlPaFFhb01aemNvTmgvRjBlM29JZU93Ung2d24zK1d4RTlNUkow?=
 =?utf-8?B?Um1NOVNnQU5IbnY2L1dzRnNaR2JLbUp5R0E4dXVLL292Yml4bDZ5bE13VjBz?=
 =?utf-8?B?TC9FV0kxM1kyZ3h6dGsybXQyYUdHOWsxMGx5NHQxZ2ZoTGhTNWh4NTlnTjRS?=
 =?utf-8?B?T2YycHJld0hJcCt3STdLci83VGxqcnpwcG5RclFIRTVaaE9nTTdTVXp4ZjRp?=
 =?utf-8?B?eEluczJPZVpRS0pmWGNCSGVDTExqRGFVU0w2dmRDYmRRamQ4OUZkMThIVzhE?=
 =?utf-8?B?aG1nQjcwZ1c4SWh2Wk9MdHcrVHdsM0p6cm1rbmZNY1J2bFUxTmcyTUZ1VDd4?=
 =?utf-8?B?cGFHK3NlRUUxSlhHOHhuMmlBd0d1eUIwMXB5ekU4Mjhuc2Zjd0tYcWtPVlNx?=
 =?utf-8?B?OWoweitkY21NWmNIbGhPcEdTN1NDaXhNbHpWMk85MmNmbjRRaXRHOFZYRTMy?=
 =?utf-8?B?VlluZE1zSHNrTFo3YU5jV1VwT1BTanliQjV1TCsvUWJjVUdQTnU4UHhSVExL?=
 =?utf-8?B?OUluM1llRW9WYmN6bk95c3VXUXBKbkV5NTU3SktlbTR2dDIrNVROY05oZ2Ir?=
 =?utf-8?B?NzMzV1JwRUdaWjhyYmhJZGM3UnpTRDFJTGV6azZoNHZTT0FMeXM1SFBISnZJ?=
 =?utf-8?B?YVA1NEZ5enFsQytWbE5oNjczbUt6MGxodXRxU0ZtSjlYWGNva3hySFY5STJE?=
 =?utf-8?B?K0QwWmZoYzdUY2NkT0VUbnZXOFNsWWE5cGNjdDBFTG40cUpCQkllMzBBZjhy?=
 =?utf-8?B?OE9pbFQzSnB4ZFNiTDliSG43aCswOXJacCsrcTNGWTlpbEJMMklnelM2dGhj?=
 =?utf-8?B?azlzMHJPcUlxNE11Q2owWXh3MFV1NkNOazc3bDFITmJiZFhJWW56dTV5QXFF?=
 =?utf-8?B?RUYwVnJuWVFKa2I2U05UT1ExQm9TREdONGNWYWVRYnpkbW9PdGNpQXN0SHJr?=
 =?utf-8?B?WnZ5SVhMbmZNeXZVc2QrSWN0Rk4xNnp1NS9rTnl6eWttRmUwUkx3VFR1UUFu?=
 =?utf-8?B?V05jc2VtVkNheEdPNElUbUpuS291Qm9URC9SV21PMzRjU21JWDJ6dnc3R1JO?=
 =?utf-8?B?TGxYeTIxNUg0aVd3MUFmMEJIc0hFVm1kWm0yaVAzNStGN3Q5VCtkQU5pYWVS?=
 =?utf-8?B?aldyMUJHaytIYXcydjZUM0p6SjduNHVQckovdXZ2MWR4SFRNOVJBSTE0V095?=
 =?utf-8?B?S25KNkJQaXd3cW9IcmtNWTVBd3NNdk9TVHZQOXdnME91V3Z4RXRjRlNlUnBT?=
 =?utf-8?Q?gfo+4I1d6O7y9I1//l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9886ee35-a4f6-46b8-27f4-08deea195011
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 06:52:37.3569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjPWr5yxKNoHIzt4l0D+YcpVE2B2p9Et5ed03ij/xXLVk8dscPB6hB/+pc4bN8rwI+0PGylBGQCx8F/EVJSmQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8857
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 6/23/26 11:57, Harry Wentland wrote:
> Add DRM_COLOROP_FIXED_MATRIX to the colorop type enumeration.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   include/drm-uapi/drm_mode.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> index de10ce859fdb..0924e38af09c 100644
> --- a/include/drm-uapi/drm_mode.h
> +++ b/include/drm-uapi/drm_mode.h
> @@ -934,6 +934,17 @@ enum drm_colorop_type {
>   	 * LUT size is advertised via the SIZE property.
>   	 */
>   	DRM_COLOROP_3D_LUT,
> +
> +	/**
> +	 * @DRM_COLOROP_FIXED_MATRIX:
> +	 *
> +	 * enum string "Fixed Matrix"
> +	 *
> +	 * A Colorop block that performs a pre-defined matrix operation selected
> +	 * via the FIXED_MATRIX_TYPE enum property. The driver advertises the supported
> +	 * operations through this property.
> +	 */
> +	DRM_COLOROP_FIXED_MATRIX,
>   };
>   
>   /**

