Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7364FC531C9
	for <igt-dev@archiver.kernel.org>; Sat, 25 Jul 2026 07:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065BF10E0F4;
	Sat, 25 Jul 2026 07:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u/GM3dNf";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012044.outbound.protection.outlook.com
 [40.93.195.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B9410E0F4
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Jul 2026 07:04:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIA7tXU65gFmXc8s+h2+cnSsvsvXQrqcPlmmJWO7ZW32MRdRgtd15FfB9cH/iv4GEIud0iyWgMMuMQHlTUxBlJCG/7MjMIwmgNr59t/YcsFdYpsZFm296YRUZe2nVkNMN9H4O7W1EKz5b+x71SnboIjJlieIkDUD1VT6N8BBpJQ8jad5HrcJZprH+QPUfINXH6LM2+8TbkLKTVro5KW5XEBq/yjKSAKJbFd5DB4UYeSnzSeJLRTQBhugqfyoMlyvHy+WFc6OuS0K5D60iOaM4G8UgwcO6+vBvUmJeKUt3FUc//Hn+/uh3tfYysc73bbaZH6qwgtxkeIvRBeOpkZukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTgJOKwDkHmrhgPRZJpT571rsMGeD6eWGorskTFlvfY=;
 b=g2jdSBHPwihwbmPwz8GVpS3ri8nXGScI8zwpF90eeXTehYrDtI6AJ/LyYmefFvxJjXP4g5x4o0WKRma7rPsLB6RO0ogFrKh30ncSnvtyrM5b6Vb6iMjLd8pdl1PlWkW4M6gMTQ5pgFGle8L0e9zmFibtoiCmhz5o64AmdpLuSTS0J1oml/+/TbWdAFtsJw79T3aF6aiF4dWA8wrOXMgZ8D5oMvp62HqkGDtcE1WayRMrwAyOibwUutqGKQmk78xstDffUp4HLTkxLtXdz0S09exOhoo8VCzuxaFdP6+LqXlTrgZ8sCwhCw0o0sGyfOd/bsWn2ZtSz/niES1e9jhHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTgJOKwDkHmrhgPRZJpT571rsMGeD6eWGorskTFlvfY=;
 b=u/GM3dNfug/WJbNKkia3huwtGhnPkXAS6yat2w/yfBvspLh428lsNw//c22TXGh1FqBy5RBxrkzoiK4zZFwmxTTa3SoqcEOteuwjvvuapie5lBI9+pg05T+1IdyJTOficoYOwS7f2k7Vr5ml5EpksTJchJWBsu1tVlZc47oc9gc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS2PR12MB9664.namprd12.prod.outlook.com (2603:10b6:8:27b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 25 Jul
 2026 07:04:12 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 07:04:12 +0000
Message-ID: <bd708653-c058-4b1f-a67f-d457b5166796@amd.com>
Date: Sat, 25 Jul 2026 01:04:10 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] tests/kms_colorop_helper: Add helpers to get
 encoding/range from FIXED_MATRIX name
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-5-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623175737.171142-5-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS2PR12MB9664:EE_
X-MS-Office365-Filtering-Correlation-Id: ad88afd8-39dd-48dd-a870-08deea1aee56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YjP/9CphfwSgWIlGdH0w85nEvvXCguU9hQVzRY9uWJDvHxq32jfGbb9HmKQUnjAVPQGjddwu0tCB5M88xyBzZYCE9cD85gRm+K7S1z9Masq0bQmt+P9CvViulPqEAAWmDzb6WahvXhVS886zzz2v5sS/x+qU4BgWGnV1111E0HLBy4pK4ZhDN4Lv+FkJdyEMZgwqFfSB7vV6r8vHp/zGT3M+9saQrqMVpYF8gYtr8caIrDTSvlEmDG59x0DdbgjUmOEHKMWsy43s0wG2tHQRJdffp1EmZ2lN06pIDM+M6Bs+bNW3fbpxq0VRC36EfopKs+JttCckSZZDPH6X2ub5sO4AWToUnYG8fsbIbx3xAhWI62WBZl5t+OkDYetCC772JIXIHDTlCaN3Rch64HRZTAp+S0NwwUAIxZ4FxI+pk0CFEDH42ulkCSZJki+N5E9OSGNLnAqw4saq5ExZexpogSLM+B6crG+Kaw5IeP6mDiLZCok0ISYf4PdSOzRkER0B7iFQgZvHrNvDu35JU2dESwRMN3wydKXSETE1M57izWSMhcrqQcodbS9ZuN3po+zAMBhAgIamaN/Y/HuNwYQRjsJTwnSPKVGacIoOvRSDMs1E9+8UNRjVZRP/blYAZJZc/Uuxn2Yx9abuOzVYFIz4wiY6BGypKTzTe+pWX3EFxrQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmFsdXhDS2dXRllHUjhOaWN1Sis3RW9TMVJOM1JYOVo4V2pyTy9FZkpqM2xG?=
 =?utf-8?B?NCt1SU1hSjJKd0dwNlRGc1J5eEl3Y3BCN2VMdTFZVUE4UWdKcGVGOFhHNk1J?=
 =?utf-8?B?YUJJdFZCWFBrUHVCOXlxY0dsM1FndU5kS0FJWGE4a3dBcUVoTnN6SmNoaDln?=
 =?utf-8?B?RDNWSCtvR1RCdzdNNXJLa0RsZUJQclJHaUlCb2VLSFVvcUxZVVRJdXEyZ1hV?=
 =?utf-8?B?dWljNE91ODJlVDRvbE8yL25XcHVWSFRqb2F3TFNBMVpRTFVOZFRCbm1YaDB0?=
 =?utf-8?B?dmFrWXZRUlNIcytjVEUyMHlzSEdKU2NLMHBjTXgxcW9zUGtmQyswZzdVb3VI?=
 =?utf-8?B?UmM2aitoU0hPV3JIMUpubER6QmthRFJZTXNLWmovWUVTYVJIUGdYT1piYUs5?=
 =?utf-8?B?OHF0dzIvdnM2SXRWSEJoQzVNU3R4RW9WeVdIZVdDQWI2NFJzZW1ibTJSR2pO?=
 =?utf-8?B?aGJYeFJabDNlTG0xUkVDeC9BclRHaU45Qmp4YnY0N3owbU1kZ3V6U2p4ZUJD?=
 =?utf-8?B?Vk9kTTgvV1Q1OU10d0M3SEdSSnVIdnlydnBCZEREV1FXUlRLdXFKNGllVUVB?=
 =?utf-8?B?NkVnZGUxL2pRQTR5NmJTZzBzbmE3NTVuMzVYc2VIcGpic0pKaWZXT3FSbER4?=
 =?utf-8?B?Y284YkZrcjVDYllIeW44bTk0OTFqU3dTSmpCZ042OTltUVRjenhFaEZGMktI?=
 =?utf-8?B?d20yUU1PaG5jWmZIZXY5L0VLeFFDT0w5ZXVUQytTdU9EaGlVTlNXV3FhRUFR?=
 =?utf-8?B?WkswNUpOellNVllaNHJ1MTF6SzhCMXdrWTFqL1NjOW5jb0dMcHBMTk5rTkdt?=
 =?utf-8?B?SWFvc0ZNZ21lMGFpYkN1RXc5aVRWalhxRG1Jc2pwblNKTHBEamdvRVZmT25i?=
 =?utf-8?B?cmhpenQzTDNlOW9kckdyZm1iamI5Z3pCNno0ZUlrbzEvOWovaGRvNFdGeHh0?=
 =?utf-8?B?Z0t3eExYeVpQcEhoSXhNM0p1TFVodW1EZlFvRWdZZzU1cVhYSk9Kd2srVDZ6?=
 =?utf-8?B?OTEvSGtCZkdINExQU2RzMWIwWmx5bDNjdzl0SVRUeldNNzJ5MnpMRW50emRF?=
 =?utf-8?B?L3ByWUc0Sm9nWURYRHVVZHVYRWR5VU5oaHQ4aUNhMFV0a3BFcmwzMXpQNmlt?=
 =?utf-8?B?YkRFWmdReVFKajdORzJOQ2UxUlRKMEVxMzBUeTRVenhJVGg5VGw5SFphZXJX?=
 =?utf-8?B?b25UM3RRNEwzTEVuTFBLMmQ1R3V4UnRuQkpiYTFPRkFWSlpnbFlSMjRORVpR?=
 =?utf-8?B?cXYxS1ByNUVMamsvOE9jck1jSEdLWGJCWTZEdWgwdTArbUtnaTZ3aGRWUUZp?=
 =?utf-8?B?Nm91dFNGTE8ranJqeE9vMFJXWnF0ckxScXNTdXAyMlJpWm5nTXJuWS8rS2J6?=
 =?utf-8?B?WjVEL1BBNjM1VG40WmxhdEc0Y09QTEtoNEpjQm13Ny9LZW9jbGthQ3pob1ZL?=
 =?utf-8?B?NXdPVzZSMU5yTkpaVzYzcEhzc1hUbm04UVlrU2V0cHUvVGp4RnhpT29hWnB1?=
 =?utf-8?B?aXBsK2k0SDQ1ODc2YnlYMkFaS3NTN2h0ZytGL0ZIbDdpbGVUSXdrZjJ6VE9X?=
 =?utf-8?B?VFVaalBsVXdFb2lYNjd0Q0ZLT2ZBRWJ3dmxZcThhNVVaaGlHRERCbjU3MlhH?=
 =?utf-8?B?OUlrUUprZi9sR2QyVHZHTHVObVZ5T0R6T0UvMGZBSEZDQnpsL3pvT2RoOVNC?=
 =?utf-8?B?V3ZINTcvTFRUZTI4blpKMFA1eWNLbkM2QjZiUVFxT2UyKzdwdmwreFIxeEZH?=
 =?utf-8?B?U0xsZFA1SEJ1TWI0aWN1anAyZm4vb2llU1ZMdlBlMCtoSURJNXI4dUYyalIw?=
 =?utf-8?B?dFNyYkVTaWpJanU4ZXgxRXlxVWtZWFJnVnRPOXQ4WE1OL0RmS3hZWDVxdTBF?=
 =?utf-8?B?NGRaV1IxMEcrd0UrOUdwdU5lMjM3NTR2bkNjS0Z4cHdmUUMwckxKYkp0UURR?=
 =?utf-8?B?VUQ5YUNDcnRKTG01UCt5enJ0ZTVnM0Y5R0Zzakw2Mjk2eUlvVW5nL1pUc2Ir?=
 =?utf-8?B?ZXBFeVNIckF3UDV0eGFHSDRtVzVGMG96S2xmNWhHU1pjY1JXUnFJTVVmS2xV?=
 =?utf-8?B?bThWVkNsYzNWMFV3R3FtOXN4M2JLZG1xdmI0SEJTbHNvajYyQjkvV2tITmUv?=
 =?utf-8?B?NWxXM04yV1dlekNNdGkzeHp0eFB1bDNSTy94czZyTzMydzNldVM0T1FWQ2hG?=
 =?utf-8?B?bnNRazVCUEhLME0vd0lnRG1YWTRvcUZaZ05QZFI4ZWUxNGtZencvN2RWR3VE?=
 =?utf-8?B?WUp0OWNweVBreHR2S2VFQTRGdSs3NEsyMnpteTU4ZWF5SGRBdDFaaHEwUFpF?=
 =?utf-8?Q?YkZpbDf8SR0hO8HOQ7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad88afd8-39dd-48dd-a870-08deea1aee56
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 07:04:12.3206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /kPQ80EUZmdESIpImr5PVizdLc2ug28gacvnagsLFYUmMe8o0fFMspakBCS1g0nCKNQf8TW/ki4jkFrMsesknQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9664
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



On 6/23/26 11:57, Harry Wentland wrote:
> Add fixed_matrix_type_to_encoding_range() to map a FIXED_MATRIX colorop's
> DRM enum string name (e.g. "YCbCr 709 Limited to RGB") to the matching
> igt_color_encoding and igt_color_range. This lets the tests derive the
> encoding/range needed for the software reference CSC directly from the
> colorop the hardware advertises.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   tests/kms_colorop_helper.c | 30 ++++++++++++++++++++++++++++++
>   tests/kms_colorop_helper.h |  4 ++++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index d12584c9adb1..e589fa5c99a9 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -473,3 +473,33 @@ void reset_colorops(kms_colorop_t *colorops[])
>   	for(i = 0; colorops[i]; i++)
>   		reset_colorop(colorops[i]);
>   }
> +
> +static const struct {
> +	const char *name;
> +	enum igt_color_encoding encoding;
> +	enum igt_color_range range;
> +} fixed_matrix_type_map[] = {
> +	{ "YCbCr 601 Full to RGB",		IGT_COLOR_YCBCR_BT601,  IGT_COLOR_YCBCR_FULL_RANGE },
> +	{ "YCbCr 709 Full to RGB",		IGT_COLOR_YCBCR_BT709,  IGT_COLOR_YCBCR_FULL_RANGE },
> +	{ "YCbCr 2020 Full to RGB NC",	IGT_COLOR_YCBCR_BT2020, IGT_COLOR_YCBCR_FULL_RANGE },
> +	{ "YCbCr 601 Limited to RGB",	IGT_COLOR_YCBCR_BT601,  IGT_COLOR_YCBCR_LIMITED_RANGE },
> +	{ "YCbCr 709 Limited to RGB",	IGT_COLOR_YCBCR_BT709,  IGT_COLOR_YCBCR_LIMITED_RANGE },
> +	{ "YCbCr 2020 Limited to RGB NC",	IGT_COLOR_YCBCR_BT2020, IGT_COLOR_YCBCR_LIMITED_RANGE },
> +};
> +
> +void fixed_matrix_type_to_encoding_range(const char *fixed_matrix_type_name,
> +				   enum igt_color_encoding *encoding,
> +				   enum igt_color_range *range)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(fixed_matrix_type_map); i++) {
> +		if (!strcmp(fixed_matrix_type_name, fixed_matrix_type_map[i].name)) {
> +			*encoding = fixed_matrix_type_map[i].encoding;
> +			*range = fixed_matrix_type_map[i].range;
> +			return;
> +		}
> +	}
> +
> +	igt_assert_f(false, "Unknown Fixed Matrix type: %s\n", fixed_matrix_type_name);
> +}

Can "igt_color_encoding encoding" and "igt_color_range range" be 
included in kms_colorop_fixed_matrix_info_t like below?

typedef struct kms_colorop_fixed_matrix_info {
	const char *fixed_matrix_type_name;
+	enum igt_color_encoding encoding;
+	enum igt_color_range range;
} kms_colorop_fixed_matrix_info_t;


and

kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb = {
	.type = KMS_COLOROP_FIXED_MATRIX,
	.fixed_matrix_info = {
		.fixed_matrix_type_name = "YCbCr 709 Full to RGB",
+		.encoding = IGT_COLOR_YCBCR_BT709,
+		.range = IGT_COLOR_YCBCR_FULL_RANGE,

	},
	.name = "YCbCr BT.709 Full Range to RGB",
	.transform = NULL,
};

then we don't need fixed_matrix_type_to_encoding_range()

> diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
> index 68ae1dd05c6f..539067b5a494 100644
> --- a/tests/kms_colorop_helper.h
> +++ b/tests/kms_colorop_helper.h
> @@ -115,4 +115,8 @@ void set_color_pipeline(igt_display_t *display,
>   void set_color_pipeline_bypass(igt_plane_t *plane);
>   void reset_colorops(kms_colorop_t *colorops[]);
>   
> +void fixed_matrix_type_to_encoding_range(const char *fixed_matrix_type_name,
> +				  enum igt_color_encoding *encoding,
> +				  enum igt_color_range *range);
> +
>   #endif /* __KMS_COLOROP_HELPER_H__ */

