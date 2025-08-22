Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D26CA0EEB
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 21:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C736810EBCC;
	Fri, 22 Aug 2025 21:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4kNbp+81";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4482210EBCC
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 21:35:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjbAxosTDQOYuuWehqLGUvin1MVqykD1pdOyST/FxVYUligTtWiJPoHXZ5x8R4ChENsYP4zKh9vTX8b9ehPdzS0cXbTyuQ8c/1dA7YxCiRC13wk2kl5/B4bVgTw6XUPL1tCE7uyQJUXX3i3yI4Au+7Olrx4/xr5pm+bQytOTak8Bjg/IwMHaBn0Iv/rvb1p/G2nk/PJWdByiod1wgBGZWixvkEfpM8/IG3geHJiRK5H4Q/1atJYL76T5blaDm+O/dTAS1bleXdnjyu2TlVnKgO5LTDg1T0EmSHs59AOclNmlbD9QRpChwq1BWzrXCRNnWS1RcOw7UIjxbTQaFVlTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WB7YBXCUGHeLxRVg/qXnLgDvvHhBhal/9oW1OpypNfQ=;
 b=Ft8BtYEkh72Xe5SJpvSeyIaIGZjEncGyiQpGJ43F6ZgzbLOT5rsC0rl7wE+3BhplDFsJ9+Eq481YSEkvXy9kPgfoTth7H6oP+YmYFHGkXNj1tu+nBtMwkG/1Zzx8KJD8Z/Sp3PmgnxYzGYNIRWIqE1k9RQm3cBFwPLIrOEmGfTvfTMNu8VdF68fOOI7JA/G5+STTy+YbXZu59Q2PlxbZIrQrGztkZHpZYwYPTHqsbU2D9bEZWvrc8Pxuxan5XiUup9wWn7xPyTUJa9o06T8CgCqlggIBTXzSzOSenIWyqWbDQwZtXFjPWQXtyDaoIdpFJM9mTB5pFO2rAPG/69J+Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WB7YBXCUGHeLxRVg/qXnLgDvvHhBhal/9oW1OpypNfQ=;
 b=4kNbp+81jRnCEEq+YHZbuKbbBNdBz5lOzJJtogAhr4C8t62gqpEV/IcyBoDpXM6sQMOP9HESuBFKRim1TodfGp3UYU5Q8bp4FZNH1d8shX0R3S7aXmtiCSH5xLKAhwO7BtOl/lYEVnjuwNVqW2AbvjJZC4SCwiUH2gawGRnCVJU=
Received: from MW4P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::33)
 by SJ1PR12MB6364.namprd12.prod.outlook.com (2603:10b6:a03:452::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 21:35:21 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:303:8b:cafe::5) by MW4P221CA0028.outlook.office365.com
 (2603:10b6:303:8b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.16 via Frontend Transport; Fri,
 22 Aug 2025 21:35:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 21:35:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:35:19 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:35:19 -0500
Received: from [10.4.12.116] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 22 Aug 2025 16:35:19 -0500
Message-ID: <106c8c2f-a476-4eb0-baf7-df0f255ce32b@amd.com>
Date: Fri, 22 Aug 2025 17:35:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: Re: [PATCH V10 27/30] tests/kms_colorop: Add a 3D LUT subtest
To: <igt-dev@lists.freedesktop.org>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-28-alex.hung@amd.com>
Content-Language: en-US
In-Reply-To: <20250815040659.3321102-28-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: aurabindo.pillai@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|SJ1PR12MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ae4f5f-a667-4b4e-c70c-08dde1c3cb76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTRhREt2SjlTS1lZUVVMekViOU5WWm1BaW9wUHlpTU1jeENVOW0vNFpzNTNQ?=
 =?utf-8?B?R1lRanovVmRERFZ1VVRZTlV5VlByZkQ5SmZWOVNQZmtqVCtjVGNseW1TbTF4?=
 =?utf-8?B?V3RScm8rQ1RqREpHYUpHaHE1d1o1d1JVV3BtQVBpRkhrUUJDaFZhUHB1eFdW?=
 =?utf-8?B?TEI4RFNSd3JPaVFaZ3E2L211VU0xaktOaVlzOTVtbDBld1dKQWg2Vm1Jd2pu?=
 =?utf-8?B?RHcwa3FVMFc0c0JjR2xzaGtxR3dzdGlLQkpXakpVTWVGeUFPTVRwcFhCQTZa?=
 =?utf-8?B?K09GY1hubFhOMnpKVWdNR1hkT0FzcmliV3d2NHhGeWZ0c09Ick1PeHd4cG5w?=
 =?utf-8?B?T1l4MzJvdXJ6cDVoNTVMSkFMSC9Nc25pR2kxRVAzWVkzMCtFd0dxSUtBRS9Q?=
 =?utf-8?B?KzB4b2NURkplRng1ekVlQ0tjUSsvSVdJZStTVC8yWVZOTC9lSnpUSWozNzVU?=
 =?utf-8?B?Q2lQbmx4cDYzT2ovN2tSSENUeFB3eDhSMWJ4L0VKbVVJRzlKbUs5c0dkOTJV?=
 =?utf-8?B?U2RlY0hjZmNKaTFnT0lMaWpLUEwwNEVnWS85d2hIdHFmNEFMUWRlQjc0NUJC?=
 =?utf-8?B?YXVEcmhuUVdkcUxoSndVN2dCcjVWNWNYRm1CR2hPcU1lVEowR0x2N2VBUStQ?=
 =?utf-8?B?K3JwbzFVS0c1KzBqaW1HUXJQTVRDZlhBbzljc01JbEh4Z2tRcDh4dC9ySjlM?=
 =?utf-8?B?UTJpc2t1eWtRWGNnWG04NHlONFNYZjc3Q1ZzZ0pnVEs0OVo5Tk1IK0RON3RK?=
 =?utf-8?B?YTAxdCsreTlnVVNtMkxEWXhybFdIa3NodXBSdXJpc0E4SmNDRUkyVENMTlZH?=
 =?utf-8?B?dVVuSStmZ0lBWi83RkJ3c2d0bURaYXB4TjErYU55YVFHMDdLM29HcGhqYmpW?=
 =?utf-8?B?SG5lTkZ2b0JBaEJzK1RnY2ZITEV4NGpzeGd3VnRGbHdJQXdFUmZvdG1lRW03?=
 =?utf-8?B?dWxJaVVrODd5MnFkVWs1VE01UjFGMk40bnNYMS94MHR5L21OdUl6a2ozelBH?=
 =?utf-8?B?SGxHZWZjWlNiSEZrcE1GOFBIbk5SUnFoMkdaQjNVVENUVm9jdnpwRWdQbEYv?=
 =?utf-8?B?clBId05xeG1BeGVkdVkvYURYTGpod0NXTkswYmQwZjI1LzQ4aHJ6MnFhK3kr?=
 =?utf-8?B?TXhTY0k0WVJtRVJrV2pZSk9ZN0lZTXNaV2VSc2Y2UlZwVCtmWDNVNTBmOEJZ?=
 =?utf-8?B?TVQ0clA4NnpOSWc0dVAyYTVRZG1VMkllQlo0c3Ivc0hQdjlKeUxZOWVZTHZj?=
 =?utf-8?B?NjFGQjIvb3djZkVIcHZvM0pIenJWSG9XeE9GaDZabDFORHIwZmNENEwyRWVB?=
 =?utf-8?B?T21KYmUxdGQ4YUMveHFNUk1pamFTWXdaeWEraTFWVmt2ZWdtTVVnNDAwRFpt?=
 =?utf-8?B?V2VPTUJIaG50WTZOMm1STWZLYnB2TlJuZm1aTi9OU2tEeHpGQ1RGYi9OYUR5?=
 =?utf-8?B?MzZsNzJSUmZRWGlDVGd3U01maHNGbHBFanhzeGIxQm0wcTFqK1JtMHdCdGJB?=
 =?utf-8?B?ZTB6UEp4dHJjV1dTdGp2M0o1enBpdVVZbFBoY1J4aGZaazNlQkJ5ZjB3Zi9I?=
 =?utf-8?B?RGFvTm9GVmdEL3pLd3VxWUhzcGJraUp0OVJNMTN0VXVDYnRqd2oyQjhtRVBp?=
 =?utf-8?B?OWU0Y29QaURCU3R2dkdRRXpSajhvdkZsVHUxaEdBRnRYNVRYcXYraVY1TmdD?=
 =?utf-8?B?OVlMckZXME9HN3FUMnFwNFpBZGJ6R3U3R2M4RzRjb0hkOWpkS21kR05iQlQ4?=
 =?utf-8?B?S1NKS2hlY0pTNm1LaysvU0xKTDExU2FrOWw3ZzVQSURJQzhuMk00dFZqWGpT?=
 =?utf-8?B?dU5PWTdFc0RWNi94ZE1HbkxGNzNZNkVNWUF1SEtLd2NWU2VFVjJZWGliTGhw?=
 =?utf-8?B?ZmJyMnhCV1JyajU4eHJ3UWdhN0x3ckdMclZCdndGK3NVL0xzeXZmZ2x1OUta?=
 =?utf-8?B?UU0wOS9BbTNPK0xWbURUaHlYa1I1aFRWRHpWY3dTZmtQWmhJTWZQT2VjYm1L?=
 =?utf-8?B?bW1HaWN6SFVBPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 21:35:20.3562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ae4f5f-a667-4b4e-c70c-08dde1c3cb76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6364
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



On 8/15/25 12:06 AM, Alex Hung wrote:
> This includes a subtests 3dlut_17_12_rgb.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   include/drm-uapi/drm_mode.h |   18 +
>   lib/igt_color.c             |  186 ++
>   lib/igt_color.h             |   10 +
>   lib/igt_color_lut.h         | 4946 +++++++++++++++++++++++++++++++++++
>   lib/igt_kms.c               |    2 +
>   lib/igt_kms.h               |    2 +
>   tests/kms_colorop.c         |   35 +-
>   tests/kms_colorop.h         |   19 +
>   8 files changed, 5217 insertions(+), 1 deletion(-)
>   create mode 100644 lib/igt_color_lut.h
> 
> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> index fe3e98e20..009bb3e7f 100644
> --- a/include/drm-uapi/drm_mode.h
> +++ b/include/drm-uapi/drm_mode.h
> @@ -891,6 +891,24 @@ enum drm_colorop_type {
>   	DRM_COLOROP_1D_LUT,
>   	DRM_COLOROP_CTM_3X4,
>   	DRM_COLOROP_MULTIPLIER,
> +	DRM_COLOROP_3D_LUT,
> +};
> +
> +enum drm_colorop_interpolation_type {
> +	DRM_COLOROP_TETRAHEDRAL,
> +};
> +
> +/**
> + * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
> + *
> + */
> +enum drm_colorop_lut3d_interpolation_type {
> +	/**
> +	 * @DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL:
> +	 *
> +	 * Tetrahedral 3DLUT interpolation
> +	 */
> +	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>   };
>   
>   /**
> diff --git a/lib/igt_color.c b/lib/igt_color.c
> index aa65eac20..6a306bda2 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -213,6 +213,184 @@ void igt_color_multiply_inv_125(igt_pixel_t *pixel)
>   	igt_color_multiply(pixel, 1 / 125.0f);
>   }
>   
> +static int
> +igt_get_lut3d_index_blue_fast(int r, int g, int b, long dim, int components)
> +{
> +	return components * (b + (int)dim * (g + (int)dim * r));
> +}
> +
> +/* algorithm from https://github.com/AcademySoftwareFoundation/OpenColorIO/blob/main/src/OpenColorIO/ops/lut3d/Lut3DOpCPU.cpp#L422 */
> +static void igt_color_3dlut_tetrahedral(igt_pixel_t *pixel, igt_3dlut_t *lut3d, long m_dim)
> +{
> +	int n000, n100, n010, n001, n110, n101, n011, n111;
> +	float m_step = (float) m_dim - 1.0f;
> +	const float dimMinusOne = (float) m_dim - 1.f;
> +	float *m_optLut = (float *) lut3d->lut;
> +	float idx[3];
> +	float out[3];
> +	int indexLow[3];
> +	int indexHigh[3];
> +	float fx, fy, fz;
> +
> +	idx[0] = pixel->b * m_step;
> +	idx[1] = pixel->g * m_step;
> +	idx[2] = pixel->r * m_step;
> +
> +	// NaNs become 0.
> +	idx[0] = clamp(idx[0], 0.f, dimMinusOne);
> +	idx[1] = clamp(idx[1], 0.f, dimMinusOne);
> +	idx[2] = clamp(idx[2], 0.f, dimMinusOne);
> +
> +	indexLow[0] = floor(idx[0]);
> +	indexLow[1] = floor(idx[1]);
> +	indexLow[2] = floor(idx[2]);
> +
> +	// When the idx is exactly equal to an index (e.g. 0,1,2...)
> +	// then the computation of highIdx is wrong. However,
> +	// the delta is then equal to zero (e.g. idx-lowIdx),
> +	// so the highIdx has no impact.
> +	indexHigh[0] = ceil(idx[0]);
> +	indexHigh[1] = ceil(idx[1]);
> +	indexHigh[2] = ceil(idx[2]);
> +
> +	fx = idx[0] - (float) indexLow[0];
> +	fy = idx[1] - (float) indexLow[1];
> +	fz = idx[2] - (float) indexLow[2];
> +
> +	// Compute index into LUT for surrounding corners
> +	n000 = igt_get_lut3d_index_blue_fast(indexLow[0], indexLow[1], indexLow[2], m_dim, 3);
> +	n100 = igt_get_lut3d_index_blue_fast(indexHigh[0], indexLow[1], indexLow[2], m_dim, 3);
> +	n010 = igt_get_lut3d_index_blue_fast(indexLow[0], indexHigh[1], indexLow[2], m_dim, 3);
> +	n001 = igt_get_lut3d_index_blue_fast(indexLow[0], indexLow[1], indexHigh[2], m_dim, 3);
> +	n110 = igt_get_lut3d_index_blue_fast(indexHigh[0], indexHigh[1], indexLow[2], m_dim, 3);
> +	n101 = igt_get_lut3d_index_blue_fast(indexHigh[0], indexLow[1], indexHigh[2], m_dim, 3);
> +	n011 = igt_get_lut3d_index_blue_fast(indexLow[0], indexHigh[1], indexHigh[2], m_dim, 3);
> +	n111 = igt_get_lut3d_index_blue_fast(indexHigh[0], indexHigh[1], indexHigh[2], m_dim, 3);
> +
> +	if (fx > fy) {
> +		if (fy > fz) {
> +			out[0] =
> +				(1 - fx)  * m_optLut[n000] +
> +				(fx - fy) * m_optLut[n100] +
> +				(fy - fz) * m_optLut[n110] +
> +				(fz)      * m_optLut[n111];
> +
> +			out[1] =
> +				(1 - fx)  * m_optLut[n000 + 1] +
> +				(fx - fy) * m_optLut[n100 + 1] +
> +				(fy - fz) * m_optLut[n110 + 1] +
> +				(fz)      * m_optLut[n111 + 1];
> +
> +			out[2] =
> +				(1 - fx)  * m_optLut[n000 + 2] +
> +				(fx - fy) * m_optLut[n100 + 2] +
> +				(fy - fz) * m_optLut[n110 + 2] +
> +				(fz)      * m_optLut[n111 + 2];
> +		} else if (fx > fz) {
> +			out[0] =
> +				(1 - fx)  * m_optLut[n000] +
> +				(fx - fz) * m_optLut[n100] +
> +				(fz - fy) * m_optLut[n101] +
> +				(fy)      * m_optLut[n111];
> +
> +			out[1] =
> +				(1 - fx)  * m_optLut[n000 + 1] +
> +				(fx - fz) * m_optLut[n100 + 1] +
> +				(fz - fy) * m_optLut[n101 + 1] +
> +				(fy)      * m_optLut[n111 + 1];
> +
> +			out[2] =
> +				(1 - fx)  * m_optLut[n000 + 2] +
> +				(fx - fz) * m_optLut[n100 + 2] +
> +				(fz - fy) * m_optLut[n101 + 2] +
> +				(fy)      * m_optLut[n111 + 2];
> +		} else {
> +			out[0] =
> +				(1 - fz)  * m_optLut[n000] +
> +				(fz - fx) * m_optLut[n001] +
> +				(fx - fy) * m_optLut[n101] +
> +				(fy)      * m_optLut[n111];
> +
> +			out[1] =
> +				(1 - fz)  * m_optLut[n000 + 1] +
> +				(fz - fx) * m_optLut[n001 + 1] +
> +				(fx - fy) * m_optLut[n101 + 1] +
> +				(fy)      * m_optLut[n111 + 1];
> +
> +			out[2] =
> +				(1 - fz)  * m_optLut[n000 + 2] +
> +				(fz - fx) * m_optLut[n001 + 2] +
> +				(fx - fy) * m_optLut[n101 + 2] +
> +				(fy)      * m_optLut[n111 + 2];
> +		}
> +	} else {
> +		if (fz > fy) {
> +			out[0] =
> +				(1 - fz)  * m_optLut[n000] +
> +				(fz - fy) * m_optLut[n001] +
> +				(fy - fx) * m_optLut[n011] +
> +				(fx)      * m_optLut[n111];
> +
> +			out[1] =
> +				(1 - fz)  * m_optLut[n000 + 1] +
> +				(fz - fy) * m_optLut[n001 + 1] +
> +				(fy - fx) * m_optLut[n011 + 1] +
> +				(fx)      * m_optLut[n111 + 1];
> +
> +			out[2] =
> +				(1 - fz)  * m_optLut[n000 + 2] +
> +				(fz - fy) * m_optLut[n001 + 2] +
> +				(fy - fx) * m_optLut[n011 + 2] +
> +				(fx)      * m_optLut[n111 + 2];
> +		} else if (fz > fx) {
> +			out[0] =
> +				(1 - fy)  * m_optLut[n000] +
> +				(fy - fz) * m_optLut[n010] +
> +				(fz - fx) * m_optLut[n011] +
> +				(fx)      * m_optLut[n111];
> +
> +			out[1] =
> +				(1 - fy)  * m_optLut[n000 + 1] +
> +				(fy - fz) * m_optLut[n010 + 1] +
> +				(fz - fx) * m_optLut[n011 + 1] +
> +				(fx)      * m_optLut[n111 + 1];
> +
> +			out[2] =
> +				(1 - fy)  * m_optLut[n000 + 2] +
> +				(fy - fz) * m_optLut[n010 + 2] +
> +				(fz - fx) * m_optLut[n011 + 2] +
> +				(fx)      * m_optLut[n111 + 2];
> +		} else {
> +			out[0] =
> +				(1 - fy)  * m_optLut[n000] +
> +				(fy - fx) * m_optLut[n010] +
> +				(fx - fz) * m_optLut[n110] +
> +				(fz)      * m_optLut[n111];
> +
> +			out[1] =
> +				(1 - fy)  * m_optLut[n000 + 1] +
> +				(fy - fx) * m_optLut[n010 + 1] +
> +				(fx - fz) * m_optLut[n110 + 1] +
> +				(fz)      * m_optLut[n111 + 1];
> +
> +			out[2] =
> +				(1 - fy)  * m_optLut[n000 + 2] +
> +				(fy - fx) * m_optLut[n010 + 2] +
> +				(fx - fz) * m_optLut[n110 + 2] +
> +				(fz)      * m_optLut[n111 + 2];
> +		}
> +	}
> +
> +	pixel->r = out[0];
> +	pixel->g = out[1];
> +	pixel->b = out[2];
> +}
> +
> +void igt_color_3dlut_17_12_rgb(igt_pixel_t *pixel)
> +{
> +	igt_color_3dlut_tetrahedral(pixel, &igt_3dlut_17_rgb, 17);
> +}
> +
>   static void
>   igt_color_fourcc_to_pixel(uint32_t raw_pixel, uint32_t drm_format, igt_pixel_t *pixel)
>   {
> @@ -446,3 +624,11 @@ void igt_colorop_set_custom_1dlut(igt_display_t *display,
>   {
>   	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, lut1d, lut_size);
>   }
> +
> +void igt_colorop_set_3dlut(igt_display_t *display,
> +			   igt_colorop_t *colorop,
> +			   const igt_3dlut_norm_t *lut3d,
> +			   const size_t lut_size)
> +{
> +	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, lut3d, lut_size);
> +}
> diff --git a/lib/igt_color.h b/lib/igt_color.h
> index 761dd2f95..0e1dc84e2 100644
> --- a/lib/igt_color.h
> +++ b/lib/igt_color.h
> @@ -16,6 +16,7 @@
>   
>   #include "igt_fb.h"
>   #include "igt_kms.h"
> +#include "igt_color_lut.h"
>   
>   #define MAX_COLOR_LUT_ENTRIES 4096
>   
> @@ -112,6 +113,12 @@ void igt_colorop_set_custom_1dlut(igt_display_t *display,
>   				  const igt_1dlut_t *lut1d,
>   				  const size_t lut_size);
>   
> +void igt_colorop_set_3dlut(igt_display_t *display,
> +			   igt_colorop_t *colorop,
> +			   const igt_3dlut_norm_t *lut3d,
> +			   const size_t lut_size);
> +
> +
>   /* transformations */
>   
>   void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
> @@ -136,4 +143,7 @@ void igt_color_ctm_3x4_bt709_enc(igt_pixel_t *pixel);
>   
>   void igt_color_multiply_125(igt_pixel_t *pixel);
>   void igt_color_multiply_inv_125(igt_pixel_t *pixel);
> +void igt_color_3dlut_17_12_rgb(igt_pixel_t *pixel);
> +void igt_color_3dlut_17_12_bgr(igt_pixel_t *pixel);
> +
>   #endif
> diff --git a/lib/igt_color_lut.h b/lib/igt_color_lut.h
> new file mode 100644
> index 000000000..b5c149c3d
> --- /dev/null
> +++ b/lib/igt_color_lut.h
> @@ -0,0 +1,4946 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + *
> + */
> +
> +#ifndef __IGT_COLOR_LUT_H__
> +#define __IGT_COLOR_LUT_H__
> +
> +#include "drm_mode.h"
> +
> +typedef struct igt_3dlut_norm {
> +	struct drm_color_lut32 lut[4913];
> +} igt_3dlut_norm_t;
> +
> +struct igt_color_lut_float {
> +	float red;
> +	float green;
> +	float blue;
> +};
> +
> +typedef struct igt_3dlut {
> +	struct igt_color_lut_float lut[4913];
> +} igt_3dlut_t;
> +
> +/*
> + * A 3D LUT table with 17x17x17 entries for Traversal order RGB.
> + * It can be generated by scripts/convert_3dlut.py
> + */
> +igt_3dlut_t igt_3dlut_17_rgb = { {

This is pretty big, and assuming this doesn't need to be changed, 
perhaps make it const so that it goes to .rodata

> +	{ .red = 0.000000, .green = 0.000000, .blue = 0.000000 },
> +	{ .red = 0.175580, .green = 0.003419, .blue = 0.006838 },
> +	{ .red = 0.338706, .green = 0.015140, .blue = 0.012454 },
> +	{ .red = 0.492552, .green = 0.015629, .blue = 0.012454 },
> +	{ .red = 0.641026, .green = 0.023687, .blue = 0.013187 },
> +	{ .red = 0.734310, .green = 0.049817, .blue = 0.013675 },
> +	{ .red = 0.809035, .green = 0.063736, .blue = 0.006105 },
> +	{ .red = 0.884982, .green = 0.063492, .blue = 0.019048 },
> +	{ .red = 0.963370, .green = 0.056899, .blue = 0.028571 },
> +	{ .red = 0.993407, .green = 0.080586, .blue = 0.044689 },
> +	{ .red = 0.999267, .green = 0.099145, .blue = 0.054457 },
> +	{ .red = 0.999267, .green = 0.110623, .blue = 0.060317 },
> +	{ .red = 0.999267, .green = 0.116972, .blue = 0.064225 },
> +	{ .red = 0.999267, .green = 0.121612, .blue = 0.066422 },

< snip >
