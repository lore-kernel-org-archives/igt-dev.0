Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D2DCCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 18:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AAC10E2ED;
	Wed,  5 Nov 2025 18:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ppj7YRPP";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B0B10E2ED
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 18:30:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tutwO0U1CLPCnPZcnhtcGNvTNBvInQnlZM828q/ea1quOwAFmKEPI8CE2EoaPUho4SBxtr9fJbeLPnayNwzl3H7SV/I9w58DB03qLOz50ofaBtzNAted6ufkLuEEXmP0sfE9IbmSWqk6RD6iL+t6tnN9aF4EYOX4sgY+joVZLFjZu9GWQaVI6PiMTCgO2YRggxrHf7ZPKSYGSMnpZOkAKzwEBjxL/uUysbdHMrtpLsUiXKFFZzc/Mt/nhKCz4EX8Nyvl7dCN5h0vIUVNPtzgPH5s6NJPM/0BDXqPomRWFbiHIi9kPsLHOX8qEd9IQRxU4vNBqIjBqLzwxBn8wuAA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAYiIJUjbPGQoNX68aUi9Y9de5LUq7gWJdxm/Ik/O4E=;
 b=EDjNK+YYrX+++t5XO826fQeSxp//Kt/95BaTbT+e89VPuAdoT/BVvBRVWz16iCs7ZBvYuq2he0WJCNr+Ag77hPiNhCoQZC+xCB3xlpvyUuBi//Z3WZ6WxebrN4s8x/fhtE60IvlLJ2XlmboBjxLNGpkguoHZLa3fCKktzTEUjglXzWpuLriJ41JWtL6vYF+uPd8DwtXQmEVgcS+jjmrYd7DGb2QGMIYU3K+ZcVKc2VvksHUvE2f0JVMVCvVAj6/A2cFUzAR/Ezrpo9RZaVTYzAS3bEx/Z2gtaQi7i5rKFtpo2vf/Pt+t/oeFoiz7IroiSIYOpxNICbaU7DdFX7DNCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAYiIJUjbPGQoNX68aUi9Y9de5LUq7gWJdxm/Ik/O4E=;
 b=ppj7YRPPcUTVVX2aBLPKxR0k1mzRtWUQ0jZUsIXJoN0HN5PH6RvIzKDUJFra9bSmZDi58ImA3jjWkzJq85nX5Ho0LUaEyUPbOCx9pdjAPkKv36A1HpJkgPpLWpyTSZ4/tgr6o2bHYlWSAUwzdqOLiL8txUjyoVsCGuMKDqlzDAU=
Received: from SN1PR12CA0102.namprd12.prod.outlook.com (2603:10b6:802:21::37)
 by CH3PR12MB8533.namprd12.prod.outlook.com (2603:10b6:610:159::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 18:30:26 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:802:21:cafe::1c) by SN1PR12CA0102.outlook.office365.com
 (2603:10b6:802:21::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 18:30:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 18:30:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 5 Nov
 2025 10:30:25 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Nov
 2025 12:30:25 -0600
Received: from [10.254.40.35] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 5 Nov 2025 10:30:24 -0800
Message-ID: <ac2f9737-f6d8-48ae-a310-c267f92b880f@amd.com>
Date: Wed, 5 Nov 2025 13:30:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 20/32] lib/igt_color: Add PQ variants for 0-1 and
 0-125 range
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-21-alex.hung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20251030042801.2315866-21-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: sunpeng.li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|CH3PR12MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e778b2b-5067-48a0-6424-08de1c99639a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|42112799006; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1R4YnJKZnJ4S095Z3dpZkFwZ2JEUFd2eERFQ2t2cVlNbWtFUXd4eWJJZWVS?=
 =?utf-8?B?eDRyNlRRaWVPRkFocE1ZQnJMMjdjdzJUUXNCM1pneE4zTkpqVDNBY1dGcTlW?=
 =?utf-8?B?d2YrZ2JycGxCUkgxVDhKdzFOb2ZmV05vaUhvL25mOXFWTklZQnY0OGdxVExY?=
 =?utf-8?B?TWFYL2ZrQWdlYjFsam8vNm8yZEloSStoRGx0STVJcTRKelJDb2E2Ukdta3Z6?=
 =?utf-8?B?YkN3NHJ2YzMrb0c4VEU4Y0EwUVN3U1AxRTVUYnhydk4xWlZvVmNOTXQrKzl0?=
 =?utf-8?B?NTh1N012YlpRSkp3Y1phQU1KODAvajdBdXZ3QnoxR0tHSmpYcjRHZXYxQjlO?=
 =?utf-8?B?aHYvdlpOR1NyRG1xQVVNWlhISVZrUGZSb3RrNGxCUDRoNkRac3c2VTBmVUhT?=
 =?utf-8?B?Vk5kTEJRVEhCcGtrOFFhWVlNb3JLVXp6MHlLb3U1VlByUGJrcFZ1L2VNK2Vl?=
 =?utf-8?B?aC84TDNsWncvek9GMm0xNEtHdGQ2dDl5a2xQOThZayt3UWRweWZWL0xqL2o1?=
 =?utf-8?B?YVBJeWM1Q2FlVmp2QnJRcnBDUk9ETHJIMjJsTVNPRy9lZVl3WUdPYjRkcTZL?=
 =?utf-8?B?aVFoWUN6aXcwdzJzcjYrcS9QRFNQelZZQ3d3Smt2OERxTjMxV2h6aEk2b1A2?=
 =?utf-8?B?dW94UWFEZzBmam1PT3JZQmdhbytLcGhRQzFEOUoxNFNFa3N2Um8rV05XdnRm?=
 =?utf-8?B?NFY5NklDZ2NhWmV1NVBrVmhCY2o2ckZFT2N0NS9XUmZYcGZINlplOFRYb1FX?=
 =?utf-8?B?M0NLUWlpdmlGWXdnTlEyK1N1VXp6ZFZrSTd5ZFFFL0hHeEVXbXM2c0FiaUlu?=
 =?utf-8?B?aktuMndyMXg1eitBdUVieGFQMTZPL1NYeGgzVkt0Nm1mK0lqV3FNekE2SXAz?=
 =?utf-8?B?MHV0VkZCSlVWWTZaQTZrSmVNZ0tyUGN3V2txVEdpbU1WR1hHQ3VwT25YRU5r?=
 =?utf-8?B?T3dkNzVGdHNlR1RJNVpKNkFrVTVlUWRlOGpvMzJ6Z0poeHBEQUZXVDlzVStJ?=
 =?utf-8?B?L1RTN1BZZGRTZUpjTkZRMGxUa21aWlBDZ040cTg3NkFFeUJtbzZKZUdyS2NG?=
 =?utf-8?B?clJoYk8wQ1VpRGgvNCtTY2toN1BUaGlnaUxmdnBUMmNISzhRV2lSUWs4YU8r?=
 =?utf-8?B?S2U2WnBaL3k0TVRVSldycFpMcmRUOVFIVzFkK3MyTFNSWEdJM0N1VnVyT3FV?=
 =?utf-8?B?RE9oWjFJWjBxOWxZS2c3REVhUFBiREU2bnI0TStmN0FFbEV4UkhkVWNOdGk1?=
 =?utf-8?B?Ny9mUklFSzdNM0dFbjE0b2lEZ0RvSWpwTENoR3daa2pKODJSK0thRVJHKzdP?=
 =?utf-8?B?VlpNWTlLNkJNQll0VG5jMWc0T0psN08xc3BwejdFN2tWVWcwR0VPZm94cGpZ?=
 =?utf-8?B?eTdzYVBpaWE2UGl2UDRzUDZNQ2Rvbk9XenJ3eHNXMlM1ZDdYT0I1eERnL09p?=
 =?utf-8?B?S2cxZWdTbEtWVk5VSUZxMjRsWWt2bExWQ2Y5YUZuWWczdDNUS0RQeC9IcHpB?=
 =?utf-8?B?QU1CNFNmVkpTUmpUOGVYUFlmT1A3N3BoQTRob2lwWVpwcW8ybTM3eEF1VGhz?=
 =?utf-8?B?bDlFcmo2ZmY4aXZrcmtVbHluM1czd1lsN3FPVHFjaGN4dWV0R2JmMmZGWk1x?=
 =?utf-8?B?Ym9naVhLdVJXNGFHcEFINlZlZTF5T1VMYVRObWlZb1B0NVVzTTZBWnV2Vzdu?=
 =?utf-8?B?ZHFNUkFScFZIdWJSdjcrUkQwMWNmaGRsT1BwamIxQkhsM1BWOUFIcE00aGs0?=
 =?utf-8?B?OTlSVXNsWHA0ZWR0bEdaTzNRL0JYV0lqNW1TMWJtRjh5eDV1UTk3eWpQREJW?=
 =?utf-8?B?WmNYZDNQcEowNXdGbTBRZVM1U00rbU9tQk1QSEMvVHJnSE1SM0xTL3JzSDNY?=
 =?utf-8?B?YWFjaUJXbm5aSUdmMEl0MGQraVhBNnl2NG1BWkErelI2OXdzQUtmUjVJU1FV?=
 =?utf-8?B?Zkoxdkp5UXpJTjRQL20xSHVGUjdRUFJwS1QzYzkwZ2NQL2xGZW1vbXc1ZGJo?=
 =?utf-8?B?S0FZa1pEZTZUb3Q0RlpuMUphYUYzR0JOSlYxSk5MRmRVMEZpS2RiSUNOZDFu?=
 =?utf-8?B?RStXQXRyOFVObC9aZnBMWlBobTFhMlg0UzROSmRtU3RIN1pwcEdaSmI1dGZI?=
 =?utf-8?Q?BEUE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(42112799006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 18:30:25.9200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e778b2b-5067-48a0-6424-08de1c99639a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8533
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



On 2025-10-30 00:27, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> Add PQ SW transforms. The most obvious to do the PQ EOTF
> is to transform [0.0, 1.0] non-linear values to [0.0, 1.0]
> linear values, and same in the inverse. So we add transforms
> that do this.
> 
> Some HW (like AMD's) has scaling baked into the PQ EOTF
> and will scale [0.0, 1.0] non-linear values to [0.0, 125.0]
> linear values when applying the PQ EOTF. The inverse will
> take [0.0, 125.0] linear values and output [0.0, 1.0]
> linear values. We're adding a transform that can handle
> this variant as well.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  lib/igt_color.c | 79 +++++++++++++++++++++++++++++++++++++++++++------
>  lib/igt_color.h | 13 ++++++++
>  2 files changed, 83 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/igt_color.c b/lib/igt_color.c
> index dac016755..e0b285162 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -22,6 +22,13 @@ static float clamp(float val, float min, float max)
>  	return ((val < min) ? min : ((val > max) ? max : val));
>  }
>  
> +static void igt_color_multiply(igt_pixel_t *pixel, float multiplier)
> +{
> +	pixel->r *= multiplier;
> +	pixel->g *= multiplier;
> +	pixel->b *= multiplier;
> +}
> +
>  static float igt_color_tf_eval_unclamped(const struct igt_color_tf *fn, float x)
>  {
>  	if (x < fn->d)
> @@ -57,24 +64,78 @@ static void tf_inverse(const struct igt_color_tf *fn, struct igt_color_tf *inv)
>  	}
>  }
>  
> -void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
> +static float pq_eval(const struct igt_color_tf_pq *pq, float x)
>  {
> -	struct igt_color_tf inv;
> +	return powf(fmaxf(pq->A + pq->B * powf(x, pq->C), 0)
> +		       / (pq->D + pq->E * powf(x, pq->C)),
> +			    pq->F);
> +}
>  
> -	tf_inverse(&srgb_eotf, &inv);
> +static void pq_inv(struct igt_color_tf_pq *inv)
> +{
> +	inv->A = -pq_eotf.A;
> +	inv->B = pq_eotf.D;
> +	inv->C = 1.0f / pq_eotf.F;
> +	inv->D = pq_eotf.B;
> +	inv->E = -pq_eotf.E;
> +	inv->F = 1.0f / pq_eotf.C;
> +}
>  
> -	pixel->r = igt_color_tf_eval(&inv, pixel->r);
> -	pixel->g = igt_color_tf_eval(&inv, pixel->g);
> -	pixel->b = igt_color_tf_eval(&inv, pixel->b);
> +static void igt_color_tf(igt_pixel_t *pixel, const struct igt_color_tf *tf)
> +{
> +	pixel->r = igt_color_tf_eval(tf, pixel->r);
> +	pixel->g = igt_color_tf_eval(tf, pixel->g);
> +	pixel->b = igt_color_tf_eval(tf, pixel->b);
>  }
>  
> +static void igt_color_inv_tf(igt_pixel_t *pixel, const struct igt_color_tf *tf)
> +{
> +	struct igt_color_tf inv;
> +
> +	tf_inverse(tf, &inv);
> +	igt_color_tf(pixel, &inv);
> +}
>  
> +static void tf_pq(igt_pixel_t *pixel, const struct igt_color_tf_pq *pq)
> +{
> +	pixel->r = pq_eval(pq, pixel->r);
> +	pixel->g = pq_eval(pq, pixel->g);
> +	pixel->b = pq_eval(pq, pixel->b);
> +}
>  
>  void igt_color_srgb_eotf(igt_pixel_t *pixel)
>  {
> -	pixel->r = igt_color_tf_eval(&srgb_eotf, pixel->r);
> -	pixel->g = igt_color_tf_eval(&srgb_eotf, pixel->g);
> -	pixel->b = igt_color_tf_eval(&srgb_eotf, pixel->b);
> +	igt_color_tf(pixel, &srgb_eotf);
> +}
> +
> +void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
> +{
> +	igt_color_inv_tf(pixel, &srgb_eotf);
> +}
> +
> +void igt_color_pq_eotf(igt_pixel_t *pixel)
> +{
> +	tf_pq(pixel, &pq_eotf);
> +}
> +
> +void igt_color_pq_inv_eotf(igt_pixel_t *pixel)
> +{
> +	struct igt_color_tf_pq inv;
> +
> +	pq_inv(&inv);

Not a blocker for merging; for optimization, it might be better to define pq_inv as a static matrix instead of recalculating it for every pixel.
- Leo

> +	tf_pq(pixel, &inv);
> +}
> +
> +void igt_color_pq_125_eotf(igt_pixel_t *pixel)
> +{
> +	igt_color_pq_eotf(pixel);
> +	igt_color_multiply(pixel, 125.0f);
> +}
> +
> +void igt_color_pq_125_inv_eotf(igt_pixel_t *pixel)
> +{
> +	igt_color_multiply(pixel, 1/125.0f);
> +	igt_color_pq_inv_eotf(pixel);
>  }
>  
>  static void igt_color_apply_3x4_ctm(igt_pixel_t *pixel, const igt_matrix_3x4_t *matrix)
> diff --git a/lib/igt_color.h b/lib/igt_color.h
> index cb4cd00e8..96bc9db5a 100644
> --- a/lib/igt_color.h
> +++ b/lib/igt_color.h
> @@ -21,8 +21,15 @@ struct igt_color_tf {
>  	float g, a, b, c, d, e, f;
>  };
>  
> +struct igt_color_tf_pq {
> +	float A, B, C, D, E, F, G;
> +};
> +
> +
>  const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
>  
> +const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
> +
>  typedef struct igt_pixel {
>  	float r;
>  	float g;
> @@ -90,6 +97,12 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
>  void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
>  void igt_color_srgb_eotf(igt_pixel_t *pixel);
>  
> +void igt_color_pq_inv_eotf(igt_pixel_t *pixel);
> +void igt_color_pq_eotf(igt_pixel_t *pixel);
> +
> +void igt_color_pq_125_inv_eotf(igt_pixel_t *pixel);
> +void igt_color_pq_125_eotf(igt_pixel_t *pixel);
> +
>  void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
>  void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
>  void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);

