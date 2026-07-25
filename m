Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5C2C531C9
	for <igt-dev@archiver.kernel.org>; Sat, 25 Jul 2026 06:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6839010E0F4;
	Sat, 25 Jul 2026 06:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YtCqvFPh";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C020710E0F4
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Jul 2026 06:56:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGJQDDswulSm3e/N+n2z7cc2EQ7xy6KD3XDFm0oTxO/AAzPIqU5cfxtH0d9p3YkzHAbfPac08cpaS7skaCy8u13J5FSn18Vd8aluGuM5ozMQtan3CIWYlRC5KLsS/3YLySWwhZIjin9B7vo+V3CXpGL76vwohimnHn/Zup9FabbgGx/i0qL5vQUGAq4dR5a3XC3+XXDQqYWyjNM5u2eOjcw4BkVPC6tgGxoQEhr98yb9V8jOmttDSxqqauOTmDjJrGHEZoqMfHN82Fmk4ESCIgKkzPlWFxjS8pS2xGB+dD7kJlovCGPZ/bLoDK4AMUX5eACuCn6c+LstAzuXH5f0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pwi+4NG6SGBCUr6V3kVns5mYGjL51WHQCHbXqEdV5Rk=;
 b=FAm/94lJGm9qv79eA33VioRi3wQjHjcHPaPQ2R/v+Mu7KNPL5Go9PPMEtOC3F0HRr0sEWFoTG+UGyxExvCmYZCMaGljKRQM8Uf1LEH2uEbt1dHeCvnhPmleiJbrO1LEAIRNeCSMDhs9UfOoJyXhiMh21gC7U2zPcN1c3/LxeQhqebbm2a/Bi3wZiNvIXkbTw9x4Gd54LMXgpBVBJkQt0h+UaPQ6lB43otimJN7ET4HcMHi9OLOs2qkLJY7msdWu2uCcbilBCkNYAIRI6GPA9hQmR003wI5H+vG94LMyD4RU15LJwxJNW2LQJtHAv+xCTjztO7+mXhKmT2Z5QqAfwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pwi+4NG6SGBCUr6V3kVns5mYGjL51WHQCHbXqEdV5Rk=;
 b=YtCqvFPhltODOL0fM9yxjwD22BKeRjnzjgnn8ITygOVOFVCAbo0vuEmkUaMZVRmoMIQmcDMAkQLa9I0pf69XqHOmRLCgdeaa45cus9qie7DRjki1pttiXsscINYPodtIxiSb3P/97Up9uMHNqKjddyKE7F13wUVgP98+6zvCuW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA1PR12MB8857.namprd12.prod.outlook.com (2603:10b6:806:38d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 25 Jul
 2026 06:56:42 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 06:56:42 +0000
Message-ID: <e1e8a069-cd96-4c0b-9e57-15f2f20042ef@amd.com>
Date: Sat, 25 Jul 2026 00:56:40 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] tests/kms_colorop_helper: Add Fixed Matrix
 colorop infrastructure
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-4-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623175737.171142-4-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::23) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA1PR12MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: 665f9dae-48da-467a-698d-08deea19e1f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|3023799007|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: CprernPn68oNHYuZ8NMHcABF9qg52XON84vfRDpxrk38B4N+29Gi27nM1cy7rmsuJiAbrRkxqFBP6h5hpyj0mYxNXbR/asQoQmsoPJ0RqdbkxVE+5GuRj7pGf3qu9gJYhbu0kwAoIc6fYADEe3dEqtYuT/O3bNMEuousucqXd0ihgP6dudnz/W6TYeWeFdwWwUj7LRvkhEXDQjbQgpO1WQQfoq5MzSddP4g3a3CQaJOytZiJ+srag7PwAu7SIeWdV7ySM3hqbIDTKWn6Z9NYaT6git7j0oS96x0Y49MpjUXzeQYNpEz5YMqpRjEHcmr5usojR+/aA1x76OJhPERp6JifCki5Yeav5m4kNDWiswboDskzSXSlQ6EGLLzdeqUkoXeiWM4QAw2/JC37AE1oHf2c8xx9bGfIV2OXlcC/vsUDxEqSwlJ9f5BwMOYd/4122Mx55L+GMVJRgUxzvdox3osSW6OclSkZXN4mWveXGaCa3cTnFxV7WS8886BJE6rOLT3O1/QtbBztgzKLBEA5dkUIx8Vwwc5C0Xjn9mQhnCub8uBP+/wfdl99GYb1fwIbtI/xmbwrRaxgOl/RHED4BpLPflvECUI3cpp33nuSiUXfQW4dPstlYiWsWJyukusfSjEdxj5By+ok5w0BUvSU9pXkNMmLYnoqviyvG9ferQA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2pCbkNwMUxlcStET3p2ODg0NUxOQ1pDeXFtOXV5eVdWeTdJNS9RUUlqd2tN?=
 =?utf-8?B?RnY5ZWJpdFpMQmtqT2VvZE9HZysrWkFsKzdOdGQ3YTdpenRJamJ1YWNXV3or?=
 =?utf-8?B?eWV6cmpQeG5uaWRWdDNiWmN1NGFiY2xlUlI2K2VKSlNpank0RnVxcm5reEUz?=
 =?utf-8?B?L3VjOG5mMEltZWJDS1JNaU9VMWpBbXltc25zdmFLRWIwTzJSbFdMdGFHWVB6?=
 =?utf-8?B?RHRsMks3WDRWRFFhbTB6b053blBnQVhtZzZEUU5mRHVlYXNlMDA3YzV4UVdu?=
 =?utf-8?B?ZWNwbEEzRkk0eGk4L3JHR0I3SFhHV2M5MytLT0p4bTZxL21ITytlTE1MQlJw?=
 =?utf-8?B?Y0QzU1ZkdHQ3UDYyVUZ4b2V3UmsrRFNoOFpLN0t5V1liZlpCbnhiSkhIUlJ5?=
 =?utf-8?B?WDBGemZPcWJXdEZqcm5scFhvalhiQU5UMWRsWGJHSkFCOHlXNzMrdm1EWmp5?=
 =?utf-8?B?U2g5OU9SeU9GNENoTVVSTi83WHFKRURrUDZ6SU51WHd1OEpveW5Td1JmNy83?=
 =?utf-8?B?cVE4MWRUQVNPRHVZOWcwSkxzV3ZHdVZRUzdGWDRVU3dCNGRsZ3dZemdobGZu?=
 =?utf-8?B?RktTQi9DamMwWmUybmlycldWMG5iQnJuRkJlbGJJK25PUlJZcGFzWDhmNGJm?=
 =?utf-8?B?VWdFdk5mMWJueTRZNGdvck8vZ1RJV3hZb01FMHI0K0Q2d2dmNU9VYXFvaUJo?=
 =?utf-8?B?cjhXVWdvQkFsdmNicnFhN3VWU2dFaWRWUy9JL3VVY0NSQWwzYUE2cktqRGFr?=
 =?utf-8?B?TjJURnNtUWFPai9WMU4wZFFXV3lWczdZS0hPMjRtRllGSWl6anpnd2RzdEdL?=
 =?utf-8?B?YXUrbWRWeHdzVTNEclVvd0JkRy9ZYWxmTnRpWHZxd01tTVJsbVBQV0N0VGpD?=
 =?utf-8?B?WXg3Nkppc3B5ck0xOHRHL1o2NHNCbFA5YnFEWlY3ZFBkekg4VFVtVTNLM3lI?=
 =?utf-8?B?M25DaDh1TVl0VTlmaHFkNEFZUEwrN3BEeVJHWkQyNGtibmxTR1FBQU5OS2xj?=
 =?utf-8?B?cWV2MmQ2V2JyZUFucTBZZ3lhUkxKMEVnSS9kczdCYjYrVzkxM0FBQzBmVEgv?=
 =?utf-8?B?NXB0d3VPVUQ5RzV2M3p6V25SUHpNTFNPYnA0YjRMN0xWczlTTjBqdFpPT2p5?=
 =?utf-8?B?QUxoMDNFK1IrYVRxOThkRGJzTnU5QXR3dVhoaER1cjBycWR2V1JSNkhSSTJa?=
 =?utf-8?B?cCtkVGd5N0l5SGhXRU96QVoyVDNzNEZHQkFYckEwSWllcDVtb3QwcVBwdG83?=
 =?utf-8?B?bytXYWJicCtkZzBTdzZnZFdQeDVpbjJITlFWbUdtRWNWWUVvb0RFRDQ3S1Jt?=
 =?utf-8?B?UjJKYXI0OEdjWnJUMXVhVFc0YlAwdktIZVAxNWpMaUpMK0xpMmJOU1hSQ2ZF?=
 =?utf-8?B?ZHRxSVpyc2wycGtoU3lRaEUvUS9uRWl6M3ZJcU5Wd3k2YWlCVlF0UFhkTTV3?=
 =?utf-8?B?cWhkSjZzejM0NXRzSXNoSkZxeDRYU1FNRHIyZmt4RXJrMmkwbWJzSmNEMGxQ?=
 =?utf-8?B?V2FtUkVHUW1TNnh2ZzhmNVhJT0RtMk91VXQ2dllscVlqK1hMa1NGcTNLajNK?=
 =?utf-8?B?QklhcWd0Mml2OVFGS0Z2TW5ZMGY4cHE1SWNteitzZVNOS2Y2bytkaU04eDBr?=
 =?utf-8?B?WDhNR1lXT3Rmek5RS3lhTnZoRHVIRnludkdJTXNyWHFtanRoSENXVm5iUGdJ?=
 =?utf-8?B?d3hIeklESml3R2NCZkd6MXlIYVdRSFNTQlp4NDNmNlM4V20zOEVBMUNQV0xL?=
 =?utf-8?B?eEYxUnkvQkE2Y1c2dzlZYjRQVXpDenN3TjcwZVd1QWdKL0xaWlAxMjJzVTg4?=
 =?utf-8?B?NFBaWlM1bkFOSXlyZXdVd3RNeTNFOUdONXVsU281bXlPSHF0cUpNeGhqSnd2?=
 =?utf-8?B?N3F5WXRkMmdLWUYvaUI3QnErQzJUeXpjYVU3cnBqNVhhWEZjSHNNMjlZcCtm?=
 =?utf-8?B?L1lvNHYycDBPZ3E3VzNzeHFSN2p3Snp0SzhWSEZOOWdBaTlEWUJIN2lIUVd1?=
 =?utf-8?B?aCtQZGhxOWZZNFVHZmZIYW52YkUzd1NmZXRwdHFrcUJvdUE0OGpKMGRIZ3RH?=
 =?utf-8?B?SEQyZ2NYeERJOFdnTU1aODV5aWRzRGtQVTVGZE5JVXViNjBDVHRqUVo0SGFz?=
 =?utf-8?B?SFJiTjk4SWJQcnJSdzZWMHR1cnBtZUZqQ1VuUXhwVkVNMk01Skh0NU1yb3pz?=
 =?utf-8?B?aFJwL01UYUNpMDFRa0phZ1dHNU15VlVhYVpOQmNlMGhrWXBYem1scU5iSjlS?=
 =?utf-8?B?MW1ERXdHbnRzMUNzMkN4bDFZeFZLMTl3WGlZTjNGVkRTSlFCRHhpZ2svNUZZ?=
 =?utf-8?Q?NHDlzZMA9leUv3Zf1M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665f9dae-48da-467a-698d-08deea19e1f7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 06:56:42.0723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/ubYQSVmCpn08Yv9kV8XxQ3ikUvKuvRhV9dkihtKNjVp8+qf/e8X1oGFxHOYFuXJSTk45oYe3rxIS1c+CjXmQ==
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
> Add support for Fixed Matrix colorops:
> - Add KMS_COLOROP_FIXED_MATRIX type to the test colorop type enum
> - Add kms_colorop_fixed_matrix_info_t struct carrying the DRM enum string
>    name plus encoding/range for software reference transforms
> - Add can_use_colorop() handling: matches DRM_COLOROP_FIXED_MATRIX type and
>    verifies the specific FIXED_MATRIX enum value is supported
> - Add set_colorop() handling: sets FIXED_MATRIX via single enum property
> - Define four FIXED_MATRIX colorop instances: BT.709 limited/full, BT.601
>    limited, and BT.2020 limited
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   tests/kms_colorop_helper.c | 45 ++++++++++++++++++++++++++++++++++++++
>   tests/kms_colorop_helper.h | 12 +++++++++-
>   2 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index aaee4e567ef6..d12584c9adb1 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -200,6 +200,42 @@ kms_colorop_t kms_colorop_3dlut_17_12_rgb = {
>   	.transform = &igt_color_3dlut_17_12_rgb,
>   };
>   
> +kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb = {
> +	.type = KMS_COLOROP_FIXED_MATRIX,
> +	.fixed_matrix_info = {
> +		.fixed_matrix_type_name = "YCbCr 709 Limited to RGB",
> +	},
> +	.name = "YCbCr BT.709 Limited Range to RGB",
> +	.transform = NULL,
> +};
> +
> +kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb = {
> +	.type = KMS_COLOROP_FIXED_MATRIX,
> +	.fixed_matrix_info = {
> +		.fixed_matrix_type_name = "YCbCr 709 Full to RGB",
> +	},
> +	.name = "YCbCr BT.709 Full Range to RGB",
> +	.transform = NULL,
> +};
> +
> +kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb = {
> +	.type = KMS_COLOROP_FIXED_MATRIX,
> +	.fixed_matrix_info = {
> +		.fixed_matrix_type_name = "YCbCr 601 Limited to RGB",
> +	},
> +	.name = "YCbCr BT.601 Limited Range to RGB",
> +	.transform = NULL,
> +};
> +
> +kms_colorop_t kms_colorop_bt2020_limited_ycbcr_to_rgb = {
> +	.type = KMS_COLOROP_FIXED_MATRIX,
> +	.fixed_matrix_info = {
> +		.fixed_matrix_type_name = "YCbCr 2020 Limited to RGB NC",
> +	},
> +	.name = "YCbCr BT.2020 Limited Range to RGB",
> +	.transform = NULL,
> +};
> +
>   static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
>   {
>   	switch (desired->type) {
> @@ -218,6 +254,11 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
>   		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
>   	case KMS_COLOROP_LUT3D:
>   		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
> +	case KMS_COLOROP_FIXED_MATRIX:
> +		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_FIXED_MATRIX &&
> +		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX, desired->fixed_matrix_info.fixed_matrix_type_name))
> +			return true;
> +		return false;
>   	default:
>   		return false;
>   	}
> @@ -362,6 +403,10 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
>   
>   		configure_3dlut(display, colorop, lut_size);
>   		break;
> +	case KMS_COLOROP_FIXED_MATRIX:
> +		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX,
> +					  colorop->fixed_matrix_info.fixed_matrix_type_name);
> +		break;
>   	default:
>   		igt_fail(IGT_EXIT_FAILURE);
>   	}
> diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
> index a081fa02db8e..68ae1dd05c6f 100644
> --- a/tests/kms_colorop_helper.h
> +++ b/tests/kms_colorop_helper.h
> @@ -22,7 +22,8 @@ typedef enum kms_colorop_type {
>   	KMS_COLOROP_CUSTOM_LUT1D,
>   	KMS_COLOROP_CTM_3X4,
>   	KMS_COLOROP_MULTIPLIER,
> -	KMS_COLOROP_LUT3D
> +	KMS_COLOROP_LUT3D,
> +	KMS_COLOROP_FIXED_MATRIX,
>   } kms_colorop_type_t;
>   
>   typedef enum kms_colorop_lut1d_tf {
> @@ -50,8 +51,13 @@ typedef struct kms_colorop_lut3d_info {
>   	enum drm_colorop_lut3d_interpolation_type interpolation;
>   } kms_colorop_lut3d_info_t;
>   
> +typedef struct kms_colorop_fixed_matrix_info {
> +	const char *fixed_matrix_type_name;
> +} kms_colorop_fixed_matrix_info_t;
> +
>   typedef struct kms_colorop {
>   	kms_colorop_type_t type;
> +	kms_colorop_fixed_matrix_info_t fixed_matrix_info;
>   
>   	union {
>   		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
> @@ -94,6 +100,10 @@ extern kms_colorop_t kms_colorop_ctm_3x4_bt709_dec;
>   extern kms_colorop_t kms_colorop_multiply_125;
>   extern kms_colorop_t kms_colorop_multiply_inv_125;
>   extern kms_colorop_t kms_colorop_3dlut_17_12_rgb;
> +extern kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb;
> +extern kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb;
> +extern kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb;
> +extern kms_colorop_t kms_colorop_bt2020_limited_ycbcr_to_rgb;
>   
>   igt_colorop_t *get_color_pipeline(igt_display_t *display,
>   			          igt_plane_t *plane,

