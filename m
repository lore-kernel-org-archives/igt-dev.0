Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF093C531C9
	for <igt-dev@archiver.kernel.org>; Sat, 25 Jul 2026 07:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887A610E0BA;
	Sat, 25 Jul 2026 07:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JpBFJOpU";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012065.outbound.protection.outlook.com [52.101.53.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDE410E0BA
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Jul 2026 07:15:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmTa81eTymSmNhF/8ojjTSwzZlDKGacESreBZo/2AXp2zaMZMFaHHyZ8117J4z6Poc+MMu9Aqcx7x7Z7yTgMHr4JpnCJJtfJvPUKv5aJo/AlNzUwuNFJVAsGnS2hH8p9OkihutXqyLhbEetDI22su4GZI5BgW0AwcC3iGmrTkT4SoFtAYCy9nk4NrRM5P8+9h9w93oh2NowD56hNj1lDoT0HmONgV7Njz9dWVu/GJSlD3NNepW7zp/v0QAGYMB/7ftXJxf3leCioFQqJE9wQ/Qf8LPU+xhvvlWg1KNfZiEOmeYbDSqw1yP0tyy4u1D6VFOmLSiXwE8+gGwaooVqSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=on2bno3FpWToyCwW1qapUuZNvwzFK7j/zFlxfc0dCwA=;
 b=n8DaISyPnCQAAWNe9ko2woRadr70/XiHMZR/dXGMO/fujoEiR1JBvgo7MnzlP8HCLafSffZ37jXmhHygyO6ZaXCa7c1FR2D1W4apG3Bm2JLBjhmIzqMwWFWpk11EyQ8wk33u0RjZF1/iR1CZtU7v+ZIWSM4aLGhR2rKHMVVdFHomlE7TzSUiNv982RqQVU/rxUm9zQUe92vTQs9R0xVYrZip2Z75sdKR7w+moY+cIHYV35HnnFlIIMMRXT4kXP/vEjGdtS5OD9rn0N3+iyPuuI+JD4qGb2s1tkGRtcrn9dgF4RZx/1AEQhCFRwSrsprlIBvi7g/CwnNnkYfi2ilLjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=on2bno3FpWToyCwW1qapUuZNvwzFK7j/zFlxfc0dCwA=;
 b=JpBFJOpU982eNQoA0XvJ7wAPDhAmVNjmj0gVnJUkXgGk3fWf2TWIV2SyI4v6PW8vGyz2/OQnd1xV7CFKE0BVfN/YWcUv+iODXkxHDk9Q9bRHRnN8hq0fYScgPMyxX6V7LGJhk3F3ljO2tdDRt5MzdotQjYJktR0ZdzXR8nGb96E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MN6PR12MB8566.namprd12.prod.outlook.com (2603:10b6:208:47c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Sat, 25 Jul
 2026 07:15:53 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 07:15:53 +0000
Message-ID: <7cfa1a19-60e5-4f51-93ad-ff1e290bf1ea@amd.com>
Date: Sat, 25 Jul 2026 01:15:51 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] tests/kms_colorop: Add FIXED_MATRIX colorop tests
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-10-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623175737.171142-10-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0298.namprd04.prod.outlook.com
 (2603:10b6:303:89::33) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MN6PR12MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3f4ff5-0cda-4e40-6839-08deea1c8fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|11063799006|10067099003|18002099003|4143699003|6133799003|56012099006|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: 3VM8yolpHlb8+1WYenrbvFleZ9KRmt7l/baQbzxL79BRjvB3Gq3Jgb9UrtNUVdYGDJUlZ8kbVio1aobGDggVCIdKiaEEefQX5jmhc6TAjs3TtdApmjcBuvBmpvzERf8ORxo62+3XrhK3JI/l9xo23+hv5fIB78WOe17r7q3TYpCVamCHBSWn58g/NMk6eX9nb8XI8EwYd79X0GvlGqDvYFRfEMelvUw8o2wpk8HtG0/jI9SRWEPEc9UwqTZZsk9CShogc6q1SsT1NJk+ZetL18DIe1FblsnJ2cPhGfkHlNtTiSiMgy1xjrsNgmdnnbu+rDiBkSdYYZP7S19iKnhlXGHx8a4d/F9ErDSlUBzVGdY6TBDqzrds2dYH6Ea39HO3/6ANLMDwvjKt2VDht1hQzX26bIKun0GsUiL9f6qi8EvcaQ7ae67wANwYhfBVc2r0By946XLARH1p9uDEQzbCabLx2/ILqahjureUPERX9B7nQCwiST1nfAkbksUmgKP8JnadWa4p1ZGe5xImOVGuQoNADfcy8gH2H/Ub1pwvi7Gc8oohn+MoP6Lu59MjfFx0TTqasoeuCfTtAVW3OLwdwLmiMlDy2BFOdSSmKiXFhEytP1IrUlIDRC4Jsud0oBDxJ4kGfcuHuP1SH2P42CmJlev73Dy28F5pbUhG5F01HSs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(10067099003)(18002099003)(4143699003)(6133799003)(56012099006)(3023799007)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW1wQ3YvWGlSRWNidlJETW95WU14Y08xVnloWnZMV01VaWovWW1KMXVvVi9X?=
 =?utf-8?B?b2k3ZDlpbVRSZE9TbkpnS3RaL0FFTkRET240MjRpMTBzdFcvcnVHTHNzeGRE?=
 =?utf-8?B?VkdWcVk1a2Y3QVFGa0wzcDJtWkFmOW1aZUZ1UVZqY01yd0NiL3VHRXVNcEIx?=
 =?utf-8?B?T2JJNXRLZHlKY0RTNXkxUUNDVTJSMFViamhvditySTBnL3d3UzNzK3U1NThV?=
 =?utf-8?B?cmhLaXJvVDRqOHVZMW1qaXF2bjJaTk1JSHByY3lsR1kwMmxjemdnNHNZdmVX?=
 =?utf-8?B?ejlQcTJtOWtjZHhjYzU1ZHRKMDNjYUEwS3dQRjcxd3ZQYkI4RmRyRUdoQU44?=
 =?utf-8?B?Z241bFZsRnlOcENmZWkwSm1FRzBzYWlLVmRIS3F0OWdFeEkwUW96L0xxOEFD?=
 =?utf-8?B?dkd6d2RyVXp1dXJUdjdSTzdjUnFjVzlzRTBrYWU2eHRsOGU4UHNTMy9qeHVN?=
 =?utf-8?B?YmZJaDdZTWtkUWNUblVqb09EemQ0dXdIY0hLT2MwdnJHNk55V0tWNENnNnAv?=
 =?utf-8?B?Q0h2YVRJb1ZRR3JhWWxBY1RjVXhlTkdwc3p0UW9GR3JSNXZlOEt2MGRJS0Uv?=
 =?utf-8?B?cGFSd2hIT3FiRmN5T3JxbmVwQ1NYV0xDZ1c0YXEzL3F2S1B3WDZaL2VQbWxp?=
 =?utf-8?B?U2dsQTlwcE1VTW9XZEp0aERJazMrZk5uMEhrTy80dXFHcXRZTVN0MENKOUVi?=
 =?utf-8?B?TTV5Y3MzWE16K2lidjV4UnEwakZNQ0pjWHFCMmN6Y21mcnRqWWdDVjZFZHFL?=
 =?utf-8?B?N2l0R3l2aE1NNnNONGt6SUZ0R2FmcFBCYk52VGIzWnFlTTREeUZISG1XdCt2?=
 =?utf-8?B?Zmw1ZlQ5bmZveDBPZWRaUTNITDF1Ulp3QzJQdVFVYUtBUGllK1hFbGtWNFVq?=
 =?utf-8?B?bEdSOXhGN1pYRENmVG90TTBNVCtYOTFybEtJWnpPamhMdFl5VHZzTllqd2Fk?=
 =?utf-8?B?WjM3UllKbzFmTkhKZWZCU3JoOUpsWmN0aGpkb3JDKzFNbVlqcW4zMjQ4MllJ?=
 =?utf-8?B?Nmc4dXMwWGFzTFZVTURKcHZQZTB6eG9EMTlLVUtsTHFNU1hhMEJlT3BjV1lJ?=
 =?utf-8?B?a3dzR3N3VzZOUlM2dXFMVmhwSWZMYWRrU0Nmd2hXdjMyZytXblFETy9NbUN4?=
 =?utf-8?B?dVEvUUFyYm9VdzB3OUNBdUZRWDZpREVEbERPZnpPT2x5ZnZaVzZBaURJbTNl?=
 =?utf-8?B?elNraEE1cExoQ0VQaUhDMlJuSXdpaEgxNUU0citndFFVREdqOXpsZzNJQSt4?=
 =?utf-8?B?L0xlWWxTS041QVlvdm01S0ZkelBMWHJYSHlDcytZV3VQV0w5RlFQaU9xTlhN?=
 =?utf-8?B?RVErUjBhYlVwaENweHM3N2N2K2JvNTEycW5GaCtjYlhmNi8zZC9CdFlDeGpz?=
 =?utf-8?B?UGNDVFFFMWJuZzNkVjNtcUlzQWRndGVLN1JSbG8rYXRWenRyMW1iR1Z3cmk2?=
 =?utf-8?B?bElWSkM5ZFN2U3hQM3VYcnpjNnJxckpFU1F3TnFWa0tXYWxrU29TdzVHSUND?=
 =?utf-8?B?eUMydjEzaUZZZE1qaUxxSjg0SHR6K1Mvd1pIRUtVTTlwbHM0M016bWZjcGt4?=
 =?utf-8?B?K0cyK05NMEtHWTlLYjFpbExPc2c3RXp2Y1U1M0tyODREcjdETU5NWkFUYitB?=
 =?utf-8?B?K0RBaEFURUFMZDl2YUxYMGUzWTltZnA2MlcrTEZhU3hpa3ZUZkR1d1lVcWd6?=
 =?utf-8?B?Rlo0UkxyUzVhWHhjMElTYlpKU1hlRlI0cmx3MXcrM2o4Y0pTN2lWVGhXcS9H?=
 =?utf-8?B?b2ZFeUJRU1ZXNGs4TVFRM2FicVhxUG5CK3kzMTRUbFhuR1dwZitpMGNiQ2Ro?=
 =?utf-8?B?TVQ2T3l6cVVJV1Z5WHUvSGZ3aDlQeVBZN1I1WjN3OXMyaW9jSVE3OWRZOW9T?=
 =?utf-8?B?a05hd1IwTW80VFoxSGMxM2dUOFVjV05YOVBQbGJTVDNydk9nZGYvUU5XVGF5?=
 =?utf-8?B?NFFzYlpjMm9WbUFoNURmZC9GWUtad3U4KzN1clo5ZC9hbmVadDVYakZzN0N1?=
 =?utf-8?B?dW5oa3ZKeHlvNnJJWmFOZGhnOEQ5Y2tWT3pqYjFONitFQktvSllXT2NralBs?=
 =?utf-8?B?aEJrUmlvV0lBd1RadWRXbHc3MjZ5bUdscUUyRmZIMC83bjZGU0NCdFY0dzBn?=
 =?utf-8?B?TWZnT2F3dFAwcWdkSU02M3NLdllqZ091TUVxZC9SekdjUTNDVnpmMXlmQWpj?=
 =?utf-8?B?b2E2RWczUVVuR29mMGEzck5Sa2R4RkcrSTFiaW8vY0VPZVJFR2MrdmFZZzJs?=
 =?utf-8?B?RERoMW1vVkY0aStnK3ExUXl1a1ZEV2VTbkp5cVFCak5hZUJuNklhSVZ4RWNm?=
 =?utf-8?Q?BJKnnb1IVlQHgCoKsu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3f4ff5-0cda-4e40-6839-08deea1c8fed
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 07:15:53.0274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFNH/S8HHyFmJfP+dvK7bZYrA+OZfSszYD7teSv9q8VA+2uoG5xGIZgdoi6HnkfG0oGcRqgoGQGu/BAj8lHs0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8566
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
> Add comprehensive test coverage for FIXED_MATRIX colorops for CSC:
> 
> Test cases:
> - NV12 (8-bit YUV 4:2:0) CSC tests
> - P010 (10-bit YUV 4:2:0) CSC tests
> - BT.709, BT.601, and BT.2020 encoding tests
> - Limited and full range tests
> - CSC combined with additional colorops (sRGB EOTF, 3D LUT, CTM)
> - Organized into separate RGB and YUV test groups
> 
> The tests verify that FIXED_MATRIX colorops correctly convert YUV input to
> RGB output by comparing hardware CSC results with software reference
> transformations using the igt_color_encoding matrix library.
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   tests/kms_colorop.c | 256 +++++++++++++++++++++++++++++++++++---------
>   1 file changed, 205 insertions(+), 51 deletions(-)
> 
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 5cf1f688832f..1d30d2538574 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -20,50 +20,95 @@
>    * SUBTEST: check_plane_colorop_ids
>    * Description: Verify that all igt_colorop_t IDs are unique across planes
>    *
> - * SUBTEST: plane-%s-%s
> - * Description: Tests DRM colorop properties on a plane
> + * SUBTEST: plane-XR24-XR24-bypass
> + * SUBTEST: plane-XR24-XR24-srgb_eotf
> + * SUBTEST: plane-XR24-XR24-srgb_inv_eotf
> + * SUBTEST: plane-XR24-XR24-srgb_eotf-srgb_inv_eotf
> + * SUBTEST: plane-XR24-XR24-srgb_eotf-srgb_inv_eotf-srgb_eotf
> + * SUBTEST: plane-XR24-XR24-srgb_inv_eotf_lut
> + * SUBTEST: plane-XR24-XR24-srgb_inv_eotf_lut-srgb_eotf_lut
> + * SUBTEST: plane-XR24-XR24-bt2020_inv_oetf
> + * SUBTEST: plane-XR24-XR24-bt2020_oetf
> + * SUBTEST: plane-XR24-XR24-bt2020_inv_oetf-bt2020_oetf
> + * SUBTEST: plane-XR24-XR24-pq_eotf
> + * SUBTEST: plane-XR24-XR24-pq_inv_eotf
> + * SUBTEST: plane-XR24-XR24-pq_eotf-pq_inv_eotf
> + * SUBTEST: plane-XR24-XR24-pq_125_eotf
> + * SUBTEST: plane-XR24-XR24-pq_125_inv_eotf
> + * SUBTEST: plane-XR24-XR24-pq_125_eotf-pq_125_inv_eotf
> + * SUBTEST: plane-XR24-XR24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf
> + * SUBTEST: plane-XR24-XR24-gamma_2_2
> + * SUBTEST: plane-XR24-XR24-gamma_2_2-gamma_2_2_inv
> + * SUBTEST: plane-XR24-XR24-gamma_2_2-gamma_2_2_inv-gamma_2_2
> + * SUBTEST: plane-XR24-XR24-ctm_3x4_50_desat
> + * SUBTEST: plane-XR24-XR24-ctm_3x4_overdrive
> + * SUBTEST: plane-XR24-XR24-ctm_3x4_oversaturate
> + * SUBTEST: plane-XR24-XR24-ctm_3x4_bt709_enc
> + * SUBTEST: plane-XR24-XR24-ctm_3x4_bt709_dec
> + * SUBTEST: plane-XR24-XR24-ctm_3x4_bt709_enc_dec
> + * SUBTEST: plane-XR24-XR24-ctm_3x4_bt709_dec_enc
> + * SUBTEST: plane-XR24-XR24-multiply_125
> + * SUBTEST: plane-XR24-XR24-multiply_inv_125
> + * SUBTEST: plane-XR24-XR24-3dlut_17_12_rgb
> + * SUBTEST: plane-XR30-XR30-bypass
> + * SUBTEST: plane-XR30-XR30-srgb_eotf
> + * SUBTEST: plane-XR30-XR30-srgb_inv_eotf
> + * SUBTEST: plane-XR30-XR30-srgb_eotf-srgb_inv_eotf
> + * SUBTEST: plane-XR30-XR30-srgb_eotf-srgb_inv_eotf-srgb_eotf
> + * SUBTEST: plane-XR30-XR30-srgb_inv_eotf_lut
> + * SUBTEST: plane-XR30-XR30-srgb_inv_eotf_lut-srgb_eotf_lut
> + * SUBTEST: plane-XR30-XR30-bt2020_inv_oetf
> + * SUBTEST: plane-XR30-XR30-bt2020_oetf
> + * SUBTEST: plane-XR30-XR30-bt2020_inv_oetf-bt2020_oetf
> + * SUBTEST: plane-XR30-XR30-pq_eotf
> + * SUBTEST: plane-XR30-XR30-pq_inv_eotf
> + * SUBTEST: plane-XR30-XR30-pq_eotf-pq_inv_eotf
> + * SUBTEST: plane-XR30-XR30-pq_125_eotf
> + * SUBTEST: plane-XR30-XR30-pq_125_inv_eotf
> + * SUBTEST: plane-XR30-XR30-pq_125_eotf-pq_125_inv_eotf
> + * SUBTEST: plane-XR30-XR30-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf
> + * SUBTEST: plane-XR30-XR30-gamma_2_2
> + * SUBTEST: plane-XR30-XR30-gamma_2_2-gamma_2_2_inv
> + * SUBTEST: plane-XR30-XR30-gamma_2_2-gamma_2_2_inv-gamma_2_2
> + * SUBTEST: plane-XR30-XR30-ctm_3x4_50_desat
> + * SUBTEST: plane-XR30-XR30-ctm_3x4_overdrive
> + * SUBTEST: plane-XR30-XR30-ctm_3x4_oversaturate
> + * SUBTEST: plane-XR30-XR30-ctm_3x4_bt709_enc
> + * SUBTEST: plane-XR30-XR30-ctm_3x4_bt709_dec
> + * SUBTEST: plane-XR30-XR30-ctm_3x4_bt709_enc_dec
> + * SUBTEST: plane-XR30-XR30-ctm_3x4_bt709_dec_enc
> + * SUBTEST: plane-XR30-XR30-multiply_125
> + * SUBTEST: plane-XR30-XR30-multiply_inv_125
> + * SUBTEST: plane-XR30-XR30-3dlut_17_12_rgb
> + * Description: Tests DRM colorop properties on RGB formats
>    * Driver requirement: amdgpu
>    * Functionality: kms_core
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> - * arg[1]:
> - *
> - * @XR24-XR24:				XRGB8888 framebuffer and writeback buffer
> - * @XR30-XR30:				XRGB2101010 framebuffer and writeback buffer
> - *
> - * arg[2]:
> - *
> - * @bypass:				Bypass Color Pipeline
> - * @srgb_eotf:				sRGB EOTF
> - * @srgb_inv_eotf:			sRGB Inverse EOTF
> - * @srgb_eotf-srgb_inv_eotf:		sRGB EOTF -> sRGB Inverse EOTF
> - * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
> - * @srgb_inv_eotf_lut:			sRGB Inverse EOTF Custom LUT
> - * @srgb_inv_eotf_lut-srgb_eotf_lut:	sRGB Inverse EOTF Custom LUT -> sRGB EOTF Custom LUT
> - * @bt2020_inv_oetf:			BT.2020 Inverse OETF
> - * @bt2020_oetf:			BT.2020 OETF
> - * @bt2020_inv_oetf-bt2020_oetf:	BT.2020 Inverse OETF > BT.2020 OETF
> - * @pq_eotf:				PQ EOTF
> - * @pq_inv_eotf:			PQ Inverse EOTF
> - * @pq_eotf-pq_inv_eotf:		PQ EOTF -> PQ Inverse EOTF
> - * @pq_125_eotf:			PQ EOTF for [0.0, 125.0] optical range
> - * @pq_125_inv_eotf:			PQ Inverse EOTF for [0.0, 125.0] optical range
> - * @pq_125_eotf-pq_125_inv_eotf:	PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
> - * @pq_125_eotf-pq_125_inv_eotf-pq_125_eotf: PQ EOTF -> PQ Inverse EOTF -> PQ EOTF with [0.0, 125.0] optical range
> - * @gamma_2_2:				Gamma 2.2
> - * @gamma_2_2-gamma_2_2_inv:		Gamma 2.2 -> Gamma 2.2 Inverse
> - * @gamma_2_2-gamma_2_2_inv-gamma_2_2:	Gamma 2.2 -> Gamma 2.2 Inverse -> Gamma 2.2
> - * @ctm_3x4_50_desat:			3x4 matrix doing a 50% desaturation
> - * @ctm_3x4_overdrive:			3x4 matrix overdring all values by 50%
> - * @ctm_3x4_oversaturate:		3x4 matrix oversaturating values
> - * @ctm_3x4_bt709_enc:			BT709 encoding matrix
> - * @ctm_3x4_bt709_dec:			BT709 decoding matrix
> - * @ctm_3x4_bt709_enc_dec:		BT709 encoding matrix, followed by decoding matrix
> - * @ctm_3x4_bt709_dec_enc:		BT709 decoding matrix, followed by encoding matrix
> - * @multiply_125:			Multiplier by 125
> - * @multiply_inv_125:			Multiplier by inverse of 125
> - * @3dlut_17_12_rgb:			3D LUT with length 17, color depth 12, and traversal order = RGB
> + * SUBTEST: plane-NV12-XR24-fm_bt709_limited
> + * SUBTEST: plane-NV12-XR24-fm_bt709_full
> + * SUBTEST: plane-NV12-XR24-fm_bt601_limited
> + * SUBTEST: plane-NV12-XR24-fm_bt2020_limited
> + * SUBTEST: plane-NV12-XR24-fm_bt709_limited-srgb_eotf
> + * SUBTEST: plane-NV12-XR24-fm_bt601_limited-srgb_eotf
> + * SUBTEST: plane-NV12-XR24-fm_bt709_limited-3dlut_17_12_rgb
> + * SUBTEST: plane-NV12-XR24-fm_bt709_limited-ctm_3x4_50_desat
> + * SUBTEST: plane-NV12-XR24-fm_bt709_limited-srgb_eotf-ctm_3x4_50_desat
> + * SUBTEST: plane-P010-XR30-fm_bt709_limited
> + * SUBTEST: plane-P010-XR30-fm_bt709_full
> + * SUBTEST: plane-P010-XR30-fm_bt601_limited
> + * SUBTEST: plane-P010-XR30-fm_bt2020_limited
> + * SUBTEST: plane-P010-XR30-fm_bt709_limited-srgb_eotf
> + * SUBTEST: plane-P010-XR30-fm_bt601_limited-srgb_eotf
> + * SUBTEST: plane-P010-XR30-fm_bt709_limited-3dlut_17_12_rgb
> + * SUBTEST: plane-P010-XR30-fm_bt709_limited-ctm_3x4_50_desat
> + * SUBTEST: plane-P010-XR30-fm_bt709_limited-srgb_eotf-ctm_3x4_50_desat
> + * Description: Tests DRM colorop properties on YUV formats
> + * Driver requirement: amdgpu
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
>    *
>    */
>   
> @@ -371,10 +416,11 @@ static const struct option long_options[] = {
>   int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   {
>   
> +	/* RGB tests - for RGB input formats only */
>   	struct {
>   		kms_colorop_t *colorops[MAX_COLOROPS];
>   		const char *name;
> -	} tests[] = {
> +	} tests_rgb[] = {
>   		{ { NULL }, "bypass" },
>   		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
>   		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
> @@ -407,15 +453,42 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   		{ { &kms_colorop_3dlut_17_12_rgb, NULL }, "3dlut_17_12_rgb" },
>   	};
>   
> +	/* YUV tests - CSC FF colorop with various encoding/range combinations and optional additional colorops */
> +	struct {
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +		const char *name;
> +	} tests_yuv[] = {
> +		/* CSC only tests */
> +		{ { &kms_colorop_bt709_limited_ycbcr_to_rgb, NULL }, "fm_bt709_limited" },
> +		{ { &kms_colorop_bt709_full_ycbcr_to_rgb, NULL }, "fm_bt709_full" },
> +		{ { &kms_colorop_bt601_limited_ycbcr_to_rgb, NULL }, "fm_bt601_limited" },
> +		{ { &kms_colorop_bt2020_limited_ycbcr_to_rgb, NULL }, "fm_bt2020_limited" },
> +		/* CSC + additional colorops */
> +		{ { &kms_colorop_bt709_limited_ycbcr_to_rgb, &kms_colorop_srgb_eotf, NULL }, "fm_bt709_limited-srgb_eotf" },
> +		{ { &kms_colorop_bt601_limited_ycbcr_to_rgb, &kms_colorop_srgb_eotf, NULL }, "fm_bt601_limited-srgb_eotf" },
> +		{ { &kms_colorop_bt709_limited_ycbcr_to_rgb, &kms_colorop_3dlut_17_12_rgb, NULL }, "fm_bt709_limited-3dlut_17_12_rgb" },
> +		{ { &kms_colorop_bt709_limited_ycbcr_to_rgb, &kms_colorop_ctm_3x4_50_desat, NULL }, "fm_bt709_limited-ctm_3x4_50_desat" },
> +		{ { &kms_colorop_bt709_limited_ycbcr_to_rgb, &kms_colorop_srgb_eotf, &kms_colorop_ctm_3x4_50_desat, NULL }, "fm_bt709_limited-srgb_eotf-ctm_3x4_50_desat" },
> +	};
> +
>   	struct {
>   		__u32 fourcc_in;
>   		__u32 fourcc_out;
>   		const char *name;
> -	} formats[] = {
> +	} formats_rgb[] = {
>   		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
>   		{ DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, "XR30-XR30" },
>   	};
>   
> +	struct {
> +		__u32 fourcc_in;
> +		__u32 fourcc_out;
> +		const char *name;
> +	} formats_yuv[] = {
> +		{ DRM_FORMAT_NV12, DRM_FORMAT_XRGB8888, "NV12-XR24" },
> +		{ DRM_FORMAT_P010, DRM_FORMAT_XRGB2101010, "P010-XR30" },
> +	};
> +
>   	igt_display_t display;
>   	int i, j, ret;
>   
> @@ -442,7 +515,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   		check_plane_colorop_ids(&display);
>   	}
>   
> -	for (j = 0; j < ARRAY_SIZE(formats); j++) {
> +	/* RGB format tests */
> +	for (j = 0; j < ARRAY_SIZE(formats_rgb); j++) {
>   		igt_output_t *output;
>   		igt_plane_t *plane;
>   		igt_fb_t input_fb, output_fb;
> @@ -452,8 +526,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   		igt_subtest_group() {
>   			igt_fixture() {
>   				output = kms_writeback_get_output(&display,
> -								  formats[j].fourcc_in,
> -								  formats[j].fourcc_out);
> +								  formats_rgb[j].fourcc_in,
> +								  formats_rgb[j].fourcc_out);
>   				igt_require(output);
>   
>   				if (output->use_override_mode)
> @@ -468,7 +542,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   
>   				fb_id = igt_create_color_pattern_fb(display.drm_fd,
>   								mode.hdisplay, mode.vdisplay,
> -								formats[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
> +								formats_rgb[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
>   								0.2, 0.2, 0.2, &input_fb);
>   				igt_assert(fb_id >= 0);
>   				igt_plane_set_fb(plane, &input_fb);
> @@ -478,23 +552,24 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   
>   				/* create output fb */
>   				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> -							formats[j].fourcc_in,
> +							formats_rgb[j].fourcc_out,
>   							igt_fb_mod_to_tiling(0),
>   							&output_fb);
>   				igt_require(fb_id > 0);
>   			}
>   
> -			for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +			/* Run RGB tests */
> +			for (i = 0; i < ARRAY_SIZE(tests_rgb); i++) {
>   				igt_describe("Check color ops on a plane");
> -				igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
> +				igt_subtest_f("plane-%s-%s", formats_rgb[j].name, tests_rgb[i].name)
>   					colorop_plane_test(&display,
>   							output,
>   							plane,
>   							&input_fb,
>   							&output_fb,
> -							formats[j].fourcc_in,
> -							formats[j].fourcc_out,
> -							tests[i].colorops);
> +							formats_rgb[j].fourcc_in,
> +							formats_rgb[j].fourcc_out,
> +							tests_rgb[i].colorops);
>   			}
>   
>   			igt_fixture() {
> @@ -506,6 +581,85 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   		}
>   	}
>   
> +	/* YUV format tests */
> +	for (j = 0; j < ARRAY_SIZE(formats_yuv); j++) {
> +		igt_output_t *output;
> +		igt_plane_t *plane;
> +		igt_fb_t output_fb;
> +		unsigned int fb_id;
> +		drmModeModeInfo mode;
> +
> +		igt_subtest_group() {
> +			igt_fixture() {
> +				output = kms_writeback_get_output(&display,
> +								  formats_yuv[j].fourcc_in,
> +								  formats_yuv[j].fourcc_out);
> +				igt_require(output);
> +
> +				if (output->use_override_mode)
> +					memcpy(&mode, &output->override_mode, sizeof(mode));
> +				else
> +					memcpy(&mode, &output->config.default_mode, sizeof(mode));
> +
> +				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +				igt_assert(plane);
> +				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
> +
> +				/* create output fb */
> +				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> +							formats_yuv[j].fourcc_out,
> +							igt_fb_mod_to_tiling(0),
> +							&output_fb);
> +				igt_require(fb_id > 0);
> +			}
> +
> +			/* Run YUV tests - create input_fb per test with correct encoding/range */
> +			for (i = 0; i < ARRAY_SIZE(tests_yuv); i++) {
> +				igt_describe("Check YUV CSC colorop");
> +				igt_subtest_f("plane-%s-%s", formats_yuv[j].name, tests_yuv[i].name) {
> +					igt_fb_t input_fb;
> +					enum igt_color_encoding encoding;
> +					enum igt_color_range range;
> +
> +					/* Extract encoding and range from first colorop (must be CSC FF) */
> +					igt_assert(tests_yuv[i].colorops[0]);
> +					igt_assert(tests_yuv[i].colorops[0]->type == KMS_COLOROP_FIXED_MATRIX);
> +					fixed_matrix_type_to_encoding_range(
> +						tests_yuv[i].colorops[0]->fixed_matrix_info.fixed_matrix_type_name,
> +						&encoding, &range);

above fixed_matrix_type_to_encoding_range() may need changing according 
according to patch 4; otherwise

Reviewed-by: Alex Hung <alex.hung@amd.com>

> +
> +					/* Create input fb with matching encoding/range */
> +					fb_id = igt_create_color_pattern_fb_yuv(display.drm_fd,
> +									mode.hdisplay, mode.vdisplay,
> +									formats_yuv[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
> +									encoding, range,
> +									0.2, 0.2, 0.2, &input_fb);
> +					igt_assert(fb_id >= 0);
> +
> +					if (data.dump_check)
> +						igt_dump_fb(&display, &input_fb, ".", "input");
> +
> +					colorop_plane_test(&display,
> +							output,
> +							plane,
> +							&input_fb,
> +							&output_fb,
> +							formats_yuv[j].fourcc_in,
> +							formats_yuv[j].fourcc_out,
> +							tests_yuv[i].colorops);
> +
> +					igt_remove_fb(display.drm_fd, &input_fb);
> +				}
> +			}
> +
> +			igt_fixture() {
> +				igt_detach_crtc(&display, output);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +
> +			}
> +		}
> +	}
> +
>   	igt_fixture() {
>   		igt_display_fini(&display);
>   		drm_close_driver(display.drm_fd);

