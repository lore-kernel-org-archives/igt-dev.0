Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E9DC88E50
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 14:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3994C10E3C6;
	Fri, 11 Sep 2026 14:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FTg/wdji";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010034.outbound.protection.outlook.com
 [40.93.198.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE86510E3C6
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 14:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryfL4wq6bHOm3cCmVIqYIDa2Twjah+0rgcFpqweyYOmxpUIDTf1aMmDEUcyMzrVa9yKwTUZeo0ucv6vFgjl6pd7s42yOh19nWW5zaEfYp5zexuBCbotu/0e80cTZ660yL9zdcBJSR/oNt3IDdNGT62YAZ8I2EoUbvyz6Z8r8+aN+48qJbijXFvGehPQU/VjJLsap03XcO//69w+N1eCUu1yUdJnwl8NZeaVJNsU+jpv+mKIKxb7gfO3ZaMF/qLRJP28MWrb7xaI1x/vBeb+TNVizbAAuuw3OAbTousw9mWYnCuJksX3TMwPLLRK7woB/u79WOeG/RSwrAIsA7JyVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9QaClo1fyRqaDlaoXTEJWwPa3RC/FPvRDPSVlrmVOg=;
 b=eJVk4U7qdJiLC+5v1IC27ThMxmQmeRLn5HyHVGjS0HnfWb1Zadu3pDqhNyTy5Tx1fNzBqiyfEK9C7syNisVs/hLe7BKhOqB2fNQxYmNrPyAMRvnpyvqoDvI81I3g0TRacNWGI9lrxcCGFeaeFZcH8cCO7fpAka/uMYWR3B2SlGFGAkbK6wHumadOrKwvB6wmmvW91/p8qHV4N4b40d7T1VW748FuWKME34WLQbcxK83yFAVPj8vDFkf2gbdcgsPRzSWgmTUbJPxYgJPFoaY8qdG6O46Sb0y21l0hxsq8vhGbNxP2vj95eQfhfLy1HZkSavAKBlBRw9pIvdo00AGG6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9QaClo1fyRqaDlaoXTEJWwPa3RC/FPvRDPSVlrmVOg=;
 b=FTg/wdjiA4RJLfBneUUaE51z5IDRI56/LdIuGZlcyM2fkQ+KQR2ZP2789ShJfkwWuQaUHavnihQutFVwBcMygDwD3xl7ugbkegoGoKvFbFHjVUw84Hdb/SJjrxsTwXzsYjCone1XkVaX6gIiq009cY7Mog8OOKGFtahNLHPmlYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS5PPF18A985A10.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::645) by CY8PR12MB7218.namprd12.prod.outlook.com
 (2603:10b6:930:5a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 14:57:10 +0000
Received: from DS5PPF18A985A10.namprd12.prod.outlook.com
 ([fe80::2359:d8c:c779:471a]) by DS5PPF18A985A10.namprd12.prod.outlook.com
 ([fe80::2359:d8c:c779:471a%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 14:57:09 +0000
Message-ID: <957de353-33b2-4111-b8c7-53b27fab5243@amd.com>
Date: Fri, 11 Sep 2026 10:57:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu/amd_cursor_overlay: skip scaling subtests
 unsupported by hardware
To: Haoming.Qi@amd.com, igt-dev@lists.freedesktop.org
Cc: Alex.Hung@amd.com, sunpeng.li@amd.com
References: <20260911143406.14452-1-Haoming.Qi@amd.com>
Content-Language: en-US
From: Ivan Lipski <ivan.lipski@amd.com>
Organization: AMD Inc.
In-Reply-To: <20260911143406.14452-1-Haoming.Qi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0024.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::7) To DS5PPF18A985A10.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::645)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS5PPF18A985A10:EE_|CY8PR12MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4e1eb7-b1cf-4e13-2e70-08df1014f454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: ibBMmhKCJEpArtnjqYsXv1dj1uMKSmGloP+ta9qXsoUG7lJ8k/PkxRH8vmcJAJy3rqQ4s2TWR+AvIwSn5Irv6H39LjMu2WYSxP2Wvirk9HDgMZ5TJBN4FyYl4glhR48q2FnTa7sAY/xfemUXMR+iy3I2U9VQ992auhifg7pjqz6mxEv0cekQClH0XWezXC/5zM80ixVXNiCZWopmXn1nBiPr5gkA0obihd41Ct345XnsHDAlCpzaIGfchKlkCE8eLHRHOVbnaSelVY8FoQa7FSqNwsZhzR+KWIJ7NhDAlbFaGlFsJenK5DuvfiY1sw97hgmA3R2BeJMmIBgrOUpzQrqhswiN29tOCS3NK4XwWW6ZbWtTGOgBv/KBdNkpsNwHJZDDwaxguWcpNvtW1Zc1bPFiLFfxYdLKwffSQayD238yLUn94Zp8q1mOjoecnxWnppH+1TlWqlEWYFClks0TdYgGEHrssqKilpkJ1awjYotoK9ozzpcLrBfOg+MUMjV5PBOxtri1LFEKfWO5WaEbD2BlFlpoXwxN1RHBR25xg0da45C90ECfb5HfS2gTwCw+73xiFUNx8VfgpE9+ar/KEUWcfYBCf1rwbY1i8PN7U/Q/ecmPfOou1GGs3TcVl2KigGrvHWxVJDsQsxXg8ujwVMIMsWL8/s0f+/Pik2og+08=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS5PPF18A985A10.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUVpNG4rOFphRGx0dHc4OFpad3ZZQmJYdnoyc096MEtWM3hyQ3Jzdm40V2Rw?=
 =?utf-8?B?TDlhT0oybm0rL2x2MzRnL2ZlTGpIU3Y1WlpFTVZOWWpvV2NqcW5zNUE1YVNL?=
 =?utf-8?B?S0djVzAvK0xDcTNTaytMbFZpRHRjOWJCWk1rdHl6Rk5OVDBCK3haVlo1NnFX?=
 =?utf-8?B?VnNHcFlzaTAwbnNETEUyc0RINmxUajlTRkF5QVZVM0N6ZzFJVTBaU0pmSGFq?=
 =?utf-8?B?MVNRcjRRSTkyRG5wZFpBRW81cW1XOWVLTnhuK2daWEtaWlc1U05ud2hzMlN2?=
 =?utf-8?B?SUhDcVU3enh5UHhDS3Z1bG1RdWUwb0dPS3RpdE43SkQ2WVo5Mys2eHd0Yll0?=
 =?utf-8?B?MVdSWkJpdFZhcy9qQWpzcFNEdFEvQjRlMkZ0QU9PUjZ1bnJpdm1QczBNZ3A0?=
 =?utf-8?B?cHVObmRsOGxhL0V6a0Y5d1VXd1Z4bW5lcnk5Z0J1NUN1R2JkdjhDVEZoR1F5?=
 =?utf-8?B?SGVIeElGUTg0Y0N6OCs3TUZoM1YyRkxxNWtZOEVsRW5uanhJeWtUeWk2eG9K?=
 =?utf-8?B?TVdSR2hKbisxVGNqRGR1UHNLYjRLNng2QnBnbEExMXJlMldxT09kc1ZEaW93?=
 =?utf-8?B?ekQyTHZZcXVOWEdnbUJMNjJtYnBlbng4cFRmOGRBM1d0SSsxeWhuTkpJb1g5?=
 =?utf-8?B?WHdIaHlvSGdBUXdTUExjdGpEdTU2d2pPelZPSkszRGtqdmtPUlMzYm04dFFQ?=
 =?utf-8?B?TzdoNXZ0MFRJNVZyaXMvTHkvSlYvWEE2TmNtNlp6bGVrc2hPZWdIOWZqRHB1?=
 =?utf-8?B?RjA0WVRRbFRtM3RZVGRhY29ySkEwRU9MRkUyVUMybHhyRzg3eHdPR1RLc2lH?=
 =?utf-8?B?bnN0RFJ5bytZVEhkVjNHKzRzSitieVQvVUxoQndDUUZqODd6UC9JYjUvZktG?=
 =?utf-8?B?SnBGeENDMnJLRUUzUHJJZ3Q5WEh3SWUvZ1c5MURKME0zY3I5Vnk0cHkrbS9F?=
 =?utf-8?B?dmNXd0lDdE1VaXNpMWhSTWdPNzRLRHdzOWFaSnp3d3NWZlk4Qm10SjNtdHJa?=
 =?utf-8?B?bGZzVFZOK1BsWFdRSUNpdnlVZU9XMXRYNk15amkybDNnSGMxbkJibkoxUEJZ?=
 =?utf-8?B?Vy95cFRCMHRLNXBtd0s0WmZOSHEvOTdHelBxUDZ5d0JGN2FlVHBReHhVbXlw?=
 =?utf-8?B?TVp1SUR5dHhUdDJmYkdoaXQ2RnRpQWN3b0lsWDNEdXl4RFJMaHpuODVOSHF2?=
 =?utf-8?B?dEUxVnMzNTRJKzBjREdnUDJCSGxQeGlBZGt1U21UYWRhellrVkd6SlpIbEZp?=
 =?utf-8?B?aUdjeVVFRWR3ZEFxM3lKREVNa0ErcnNabXR2eGJMbSt0QytpWXNyS3JQdzhu?=
 =?utf-8?B?ZE52dFU4NkI3ZnhiMWxQbk5xTTBkNW9abXExcUdCY0ZhUnd4Z2VwUXZjM2Iz?=
 =?utf-8?B?QlFtaXFKMlprT09vcFFlNDdaVnhEbGthRTBpNXU4ZnYyNUx0RFJWanJiVk1I?=
 =?utf-8?B?aFhGZkdFb3pldTJQLzBiOWsyQ1p3dUxncHFTZTVMejVBcjNsL0V2Z1RveXg1?=
 =?utf-8?B?M2JCMUVVU3lUbEJaR2NnSGNpeXU4SXEwZ2dEVFVJNjBtNTdYWnA0aFczdDVo?=
 =?utf-8?B?YWlpQm9URVErdXVxcGZSL29NNzMyZW5BalU2SjVFWS9hNCtBaWV3dUoxb1pt?=
 =?utf-8?B?eGNxQlB5VkNaYzVkMGhncW83RENuYUh1MU02RFpUWHBrZWMwaDRxU3pWRkRC?=
 =?utf-8?B?cUlsMW5WaFkrcHJVaUlJQVlEcjhEcHFxenZCNWdxbEVIY0M3MS9tWmdBVnpR?=
 =?utf-8?B?WVFrbW9UTHpVb3RXaVdqODBEV3E5U1JaK01VTDdtK0VSY2IvKzRNQ0ZZZEdI?=
 =?utf-8?B?VWx1b1ZmZ3BBdHlaV20ydThheDd2d1VYYms1TlNCSkpkTDhUaUhmb0ZwaldS?=
 =?utf-8?B?NUpYVm95dWowTFF3aEhCK1NrWXVPT3dKMHkwS0xFR0pGaHVJYlgzbWN2TE9R?=
 =?utf-8?B?RG5tSTl4NVhTa2ZZOUtTejVjdENZWmcwdXZDWGFhRlhLYlMyVWNJWU5ha2U2?=
 =?utf-8?B?dC82RDlYR2R4emNuTEpKVXI4R0lIUlB3REh0Q3ArUVhpZTFrZi9Jd25SSzJ5?=
 =?utf-8?B?eW1tZ3V3dHZ6MFJuWHhENlJTejF6Q0xCUmlsais2b3IwOU8vTlRXd1F3bEMx?=
 =?utf-8?B?dnM2TUxtWjZBenE1VTBLbGVvdFJad3VDR0FMVHpSUHJub3IrWDZ6QWtyMVN0?=
 =?utf-8?B?QU9rSkRPRjJHQWM2Ymo5bWgvViswVlltdHlHSCtRT0tYSXpZY29mRTBFSXdT?=
 =?utf-8?B?bTRQSkpvN1psOEZONzFlS0c3eFF0bEZOTDNuQ0JJYm1ZdWNrQkFna2REVEZv?=
 =?utf-8?B?OVp2VHMrSVpEdXJ5MjdVZlA5NjZNdFFPSkJCUWQwcTQ2N2craFlYQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4e1eb7-b1cf-4e13-2e70-08df1014f454
X-MS-Exchange-CrossTenant-AuthSource: DS5PPF18A985A10.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:57:09.6292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z23xmGBC5HVRPjCUQlJHafuS/oSoVr3qkX2Sm36jqA8mu5N5kyMDCr0aqboJRz0x7UUTvH1D6pTiLTVAV9b4qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7218
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

Reviewed-by: Ivan Lipski <ivan.lipski@amd.com>

On 9/11/26 10:34, Haoming.Qi@amd.com wrote:
> From: Tony Qi <Haoming.Qi@amd.com>
> 
> [Why]
> test_cursor() creates a downscaled source FB for the TEST_SCALING
> subtests (scaling-175, scaling-200, ...) and unconditionally proceeds to
> exercise it. Some ASICs impose a source viewport width limit on
> downscaling, and whether a given panel trips that limit depends on its
> native resolution. When the scaled source width exceeds that limit the
> atomic commit is rejected and the subtest FAILs, even though it is
> exercising a genuine hardware restriction rather than a defect. The
> correct result in that case is SKIP.
> 
> [How]
> Read the ASIC's downscale source-width limit from the connector's
> max_downscale_src_width debugfs file and skip the subtest when the
> scaled source width exceeds it. The skip is precise: it triggers only
> when the source genuinely exceeds the reported limit, so a real scaling
> regression (which fails within the limit) still fails rather than being
> masked. When the debugfs file is absent (older kernel) or reports 0, the
> limit is treated as unknown/unlimited and the test runs as before.
> 
> Assisted-by: Copilot:claude-opus-4.8
> Signed-off-by: Tony Qi <Haoming.Qi@amd.com>
> ---
>   tests/amdgpu/amd_cursor_overlay.c | 46 +++++++++++++++++++++++++++++--
>   1 file changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
> index b130da4ff..166f9b928 100644
> --- a/tests/amdgpu/amd_cursor_overlay.c
> +++ b/tests/amdgpu/amd_cursor_overlay.c
> @@ -340,6 +340,30 @@ static void test_cursor_spots(data_t *data, int size, unsigned int flags)
>   		test_cursor_pos(data, pos[i].x, pos[i].y, flags);
>   }
>   
> +/*
> + * Returns this ASIC's maximum downscale source width (in pixels), as reported
> + * by the connector's max_downscale_src_width debugfs file. Returns 0 when the
> + * limit is unknown (older kernel without the file) or unlimited, in which case
> + * the caller should not skip on it.
> + */
> +static int get_max_downscale_src_width(data_t *data)
> +{
> +	char buf[64];
> +	int fd, res, width = 0;
> +
> +	fd = igt_debugfs_connector_dir(data->drm_fd, data->output->name, O_RDONLY);
> +	if (fd < 0)
> +		return 0;
> +
> +	res = igt_debugfs_simple_read(fd, "max_downscale_src_width", buf, sizeof(buf));
> +	close(fd);
> +
> +	if (res <= 0 || sscanf(buf, "%d", &width) != 1 || width < 0)
> +		return 0;
> +
> +	return width;
> +}
> +
>   static void test_cursor(data_t *data, int size, unsigned int flags, unsigned int scaling_factor)
>   {
>   	int sw, sh;
> @@ -372,9 +396,25 @@ static void test_cursor(data_t *data, int size, unsigned int flags, unsigned int
>   					DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0, &data->quarter_fb);
>   
>   	/* Create a FB for scaling. */
> -	if (flags & TEST_SCALING)
> -		igt_create_color_fb(data->drm_fd, (sw * scaling_factor) / 100, (sh * scaling_factor) / 100, DRM_FORMAT_XRGB8888,
> -					DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0, &data->scale_fb);
> +	if (flags & TEST_SCALING) {
> +		int src_w = (sw * scaling_factor) / 100;
> +		int src_h = (sh * scaling_factor) / 100;
> +		int max_src_w = get_max_downscale_src_width(data);
> +
> +		/*
> +		 * Skip (don't fail) when this ASIC can't downscale from this
> +		 * source width. Only downscaling (source wider than the
> +		 * display) is subject to the limit, so the upscaling subtests
> +		 * still run and can still catch a real regression.
> +		 */
> +		igt_skip_on_f(max_src_w && src_w > sw && src_w > max_src_w,
> +			      "Source width %d exceeds ASIC downscale limit %d\n",
> +			      src_w, max_src_w);
> +
> +		igt_create_color_fb(data->drm_fd, src_w, src_h, DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0,
> +				    &data->scale_fb);
> +	}
>   
>   	/*
>   	 * Create RGB FB for overlay planes for MAX_PLANES and

-- 
Thanks,
Ivan Lipski

