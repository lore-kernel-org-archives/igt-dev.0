Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58FFC43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 09:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E0610E0CA;
	Tue,  7 Jul 2026 09:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wUlgfM3a";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013053.outbound.protection.outlook.com
 [40.93.196.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3456E10E0CA
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 09:51:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOgPgdGTURgBZXgWM5K7VLjE4q8OH5//B5ydA9r5NbQu8er/9GBtiYiBowxAP/lIVu6hDrJ/KtQ6G/IrgK2h0/hOZLDZe1VzyzQZkrILtASJ/lctx+a+Y+XVMNhB6pzcRMBY8eazipuAJ7UYbWsgrkJ0mV3zw0ZjQMxxEFR3SZ0cIOFNXgEM2o+HNSOOl6la2dbZJbOaE2FbNZWQ+QLL8jnkkP/ZlZPBswIF4olhiaIIXYWJAzmfg305WQK2ZgPLL7d3S1ow1H6eY7e3ToTompo8wo+UZxD/9A/2P2xWy3tbEHa2cD6PfBXC3SWsThKTcSjn1Msbww5IjCFHxHGwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDFtCphq88dEqM7oZoxISOMC+QJJ+23G6MET2izHlDU=;
 b=GlzeSuqWvtztLMkygHZsskvYeJmQ0t76SXMd6PowTF+6OpQDCwrMxyR68TnYDB16G1rQPdm/G3Jsj+AVJQvjNv6BAQ3KKcyqVkps5AGl9JKjFAydW2Lz6IkBNg0asa9uTfqp55RM/FqZ2dDVLLzMgoIpUgBrU0+EhiFNoE8WnPhcvQ2AYoGja+hGZ1Fi6crfa+zK34RMzSbT75DDURiEm7e2gjzzFJ2QVTOO6GdEwUIpY9yhTBIdVYkPMv9CRcz3TpbvoVNc5rYpAiQOcwhOkwH4QxEcjwwMcqpuH9kizif5avnLAiS74OX4Rr4w5hYEa0cbHBruiahFXx4rxsWLDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDFtCphq88dEqM7oZoxISOMC+QJJ+23G6MET2izHlDU=;
 b=wUlgfM3aI+8HuFvHyIF+1cm9uK7tQB/r0ST1tR8ft9JMCfDp72x4816gqJmq0hKkLA7FwLCkdY4Yw1oMnA80c8QCwuF6E31cMtdT8V+6isQnxWAAw1HcCXnKBXQ1a9J1VrjMo1LSgvnHo2ZBhbpnxGZ1hInSp/YHsh9tjKGyg2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11)
 by SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 09:51:03 +0000
Received: from PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::4f70:b453:55c9:a190]) by PH7PR12MB6611.namprd12.prod.outlook.com
 ([fe80::4f70:b453:55c9:a190%5]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 09:51:03 +0000
Message-ID: <9ad89e27-c14c-4ae5-92a6-84d00a7ecc83@amd.com>
Date: Tue, 7 Jul 2026 17:50:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: Tolerate bandwidth-limited MPO scale
 combinations in mpo-scale
To: James Lin <PingLei.Lin@amd.com>, igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, sunpeng.li@amd.com
References: <20260707074312.3492-1-PingLei.Lin@amd.com>
Content-Language: en-US
From: Tom Chung <chiahsuan.chung@amd.com>
In-Reply-To: <20260707074312.3492-1-PingLei.Lin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:405:372::16) To PH7PR12MB6611.namprd12.prod.outlook.com
 (2603:10b6:510:211::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6611:EE_|SA0PR12MB4397:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c8a7ab8-a476-4ac4-a878-08dedc0d41ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Zxp5gXC4Ax24FTbnjy7Bjxxj5epE3QGV5CiYg3ZTLEEHp1HhW3xGbki9zCDd17SFeS3BabYvRm0cdrS/SntKYsvoLfJnEXW6oU67dmCyPhgtxknKhCGrwKckIpmdof5SrC5Y7oa1NVR7ttWjbiy4ebSrG3qY/hDUv8vF3lQk+oAE31cvpN48NTwmFdZZ7D9mi8ThRLLbIWqkPdg82AJfuPfXgS4YUJ+MtjYu3c8W76LCfHcvdNv38dWb5XSgI7nt8n+2HvkoFqyYiuTI9M/nhxMgeGUqjsfanEXCAbnKGMBhAyLKXS8fyAu+xvxDCtrPbYQ4NS+iJVDpzSK/Pam6sZ2caiagLIERGE1/imjv2ks1qxhibDbzwT2k2gcUgejcvWF81FwUYlWmUEodmjsDMsZzi4eZgO2RkthpjG2MZdhkzIRhBzZ+ZjAL+nHWQTT6wqYeugQIeoix8S8ZV/p6sDZV1lbNoUeT6YNnujLjb8cBW6cdxcb4XMYxsQglWvwlJcnzjaHMPdxheOxsYYbQ5iCYBm+wOLVFYxNysO0IS83gpu6PICoXtz2tWcj1ezmeutUMAYc89Zd6N5uVNNjaUqKj9nOG2+/gL41CIuwnZ/4mgHRZdu19auCmqGXdW2aYEQrhsuO9DQAr+Qid052dg+41JQA3MnmFUEnk+1GjgFE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6611.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aklVVnFyVmFwR1N5QXNHUU50MEh0V1ZBMGVjTGdYeWwrL2VhS0RNUlJjRmVW?=
 =?utf-8?B?QkdiMExZVkRpYnBlVlJkTTZ4NU9kSkdJdGJYcEF0bXE5VVJIMjZETWZNRzJJ?=
 =?utf-8?B?c3VWTkJBb3lONURzMnJXNFJhQklsVEUyZzU4clkyMEx2R2lLeFNCY2lqb3ht?=
 =?utf-8?B?WDhQcHp2VjRscU5LRlVLLzNBNlBueDh4UmNKOFpQVTU4RDNGZEJzT0xORHlq?=
 =?utf-8?B?bUs5M1g0NzROZU1wYktvRU82anRFUEJuL1J4ZTZMOTRpSHdlN1RWdEIwNGl1?=
 =?utf-8?B?dHV3dkJmSUhDbFk3K3ZZcFd2NUtEbXQrUytuUkl6K1FvM3h2cVhkMUZ3UVc0?=
 =?utf-8?B?Z1NidW4reXRUd2U0WHhMd0RKRzJLM292UWdMQ0o5Nm5rVHNWQlhpMlNaSFlZ?=
 =?utf-8?B?dHJveCtyaGdBTUZBc3V0L0dOVWlBYmZoQnhVZlpzVURNMHZyVStPQndEc09S?=
 =?utf-8?B?UTlZV1YvZStmeWEwVXRmeTJEM2RCM3lJNmhQTXJ3b1Zpd0xvREczdjcwWGtM?=
 =?utf-8?B?UWdhRHlEaWJwZGVXSUNHcHZ4bm1XSFVHOHNSbzI2dWU3dXpxdWdOemFjeHVW?=
 =?utf-8?B?NnFza0daQmtBWUo3ay9GcmRzaDZ1a1Yvak9vTktNelJsYUhIclJGUFViRUhQ?=
 =?utf-8?B?bTBtRXVmZTF4NVk0a0JBZ3VOY3JQWU5TcnhPTHlha2REVFJEZzZxbzZ4LzZX?=
 =?utf-8?B?V1lIZUhoT1B3ZVRTNXQ4SVpyQ2cvaUFQaXJGb2d4WjFDT2dyaUxGSmIvVGt1?=
 =?utf-8?B?bFRrNi9OQnJrcFhjdU96eEVkZGpYSkxCM0cwTGd1cE9RM2dWTEdNbWdQV1JM?=
 =?utf-8?B?Z0Z1akxGbnRGSU9MRW9YeHRwVUZkclc1dm1QZWpoSmpLSExHanBWQ1EydHd3?=
 =?utf-8?B?dENYUERPbG0veDkvc2p6b2hEU3F2ZTBoWWFxREZvMVNTSzliRFliV2ZraW5K?=
 =?utf-8?B?SlQ4eFBCVTdLb1M0ZEVVY2wybWJIWjF1YmV2YnIzdGlmYVJVRkNYUEpXSVpa?=
 =?utf-8?B?RDJGZmVwelF2TW90VVFjY1lhbFlna05XaW81WEd0MFZKZXVjUWpOOEhCdC9o?=
 =?utf-8?B?bGNKQ0thQUJubVo1ZDlFRzBYKzZvTExEbGFZQmlqK1I1NmVSOU5XUGQwMVd1?=
 =?utf-8?B?OFAreDNYODFldjZ1dTNYUStZengzSG1SaWZQYytTZmlvUFJlenRML25WdndH?=
 =?utf-8?B?cjBXTks4NXg5Q3MxZXdCUWZiMGROYnR0RkRock1mMS9CS09TL1RkUjZYYjdl?=
 =?utf-8?B?ejZrK0orcVo3MFhjcDFOR2psNHJZU2E0aFhIRHpCV1ovY1hTV1BiVTNOK0FK?=
 =?utf-8?B?VEtVK0VMbllUUzN5ZGd6YWZEOHZoSkF4aE9ITEM0a2hnQ0xFQlpsMTN1amx4?=
 =?utf-8?B?b0FlT2g1b1dlMkF3ODdUQ0Fob1AwMllUUVFSWnhMWi8wNzNaaGpmcGduTk9B?=
 =?utf-8?B?bnhrSkhyM3ZTWGtQek1OZ0VaOEVYQWh0MytMZkJOVTRqVXk5VUd0YnFEWDJi?=
 =?utf-8?B?MGR3Zll3ZGk1TWt1QnhHZ21IakNhNFNxM0FPTm92cEdLWkp2UjFvb0Fjdkx4?=
 =?utf-8?B?Q2c4MUNBbGJpNVdwUytSR3dWTTROcTA5RHBIYVg2M0hjRXdHRXo0YU5YMkdO?=
 =?utf-8?B?UHBKKzJmT0V4aG5acjAvOWJvaWJTMGJzL1hWNC9QY0hYdEhRZ2cvMkxmVklh?=
 =?utf-8?B?Q3REOFNXbWZTblNsTVVQNkJ1cGV0bVltYWM3M2ZPTXR6SC9obC9QQjV0Q1dN?=
 =?utf-8?B?MW5zZmlCVmw1OE1XNFh4UWhqKzhtR0ZCWlZVRlNScElXUjhrbEdEb2RiZVpa?=
 =?utf-8?B?eXowYTRKWGpCNTZtc0xzT0hqQ1BQQXdORURPRVZpeW1qVDU0TE16Vllnc1lL?=
 =?utf-8?B?NnVXOU40Tm4xWEN0WXlZSmk0SVdHYVN2TkE4dE1tUTgvYmlJMXZHNHhvVVVI?=
 =?utf-8?B?MmJIN3FmWDZOM0dyK21SMzBmOWUxNWgvZjhEZXFhNmlFSzFGR0RhV1NEVnMx?=
 =?utf-8?B?MitwUUlTb2U1R0ZDRW53NnFzeXFEaEtYYlVIcHo0c204czJFYmhZUnVoWHVm?=
 =?utf-8?B?bjlOd1I3eFYrejd1Kzcwa1IwWHoram5QNDZlNHpSMDB4akFUbEF4c2tKV3ps?=
 =?utf-8?B?RXg4TURUQjl1Skk0ME5DRXRnVDZUd0Q1VUFkcFQzR0Y0cFlRTGZ2NjNrU3hk?=
 =?utf-8?B?U2loYW92MHNhTVZNWkowb1QrbERDcDlwZDgyQWZhUzlEQ1U0SEJNM1VRTkZK?=
 =?utf-8?B?bGRXVUJMM2xDODU3MDBmTHJLVjl0Q0NMOWZzb0VVYWptaWZKZ0JJd0dBM09V?=
 =?utf-8?B?aFhvdnJsMWVoaVZjUkdjQmY4WFpieXNvR1Z4SHFvZEZYaUdrVVo1dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8a7ab8-a476-4ac4-a878-08dedc0d41ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6611.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 09:51:03.1869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAnVWutFB6/8G8KH2owKCd6/FBEHTIlqvT7w8WfaYtdS84KaCLNj0WRs4LkaDc34E2kp9tjcskk8pJBwA0RnGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397
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

Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>

On 7/7/2026 3:42 PM, James Lin wrote:
> [Why]
> amd_plane@mpo-scale-* iterates every source size (up to 4K) and scale
> factor and performs a hard igt_display_commit_atomic() for each MPO
> arrangement. Downscaling still reads the full source surface, so a
> heavily downscaled large source (e.g. 4K at 0.30x) costs as much display
> read bandwidth as a full-size plane. Combined with the full-screen
> overlay and DSC at high refresh rates, the configuration can legitimately
> exceed the display controller's bandwidth and be rejected by the driver
> (DC_FAIL_BANDWIDTH_VALIDATE -> -EINVAL). That is a hardware limit, not a
> scaler defect, but the hard commit turned the legitimate -EINVAL into an
> unparsable test failure (the run aborted during commit with no result
> line emitted).
>
> [How]
> Replace the hard commit in test_plane with igt_display_try_commit_atomic
> and tolerate only a legitimate rejection: a downscale (displayed area
> smaller than the source surface) rejected specifically with -EINVAL. Any
> other errno, or a failing upscale, still fails the test. Bound the number
> of tolerated skips with MPO_MAX_BW_SKIPS so an unexpectedly large number
> of rejections is treated as a real regression rather than isolated
> bandwidth limits. Skipped combinations restore the reference primary
> plane so subsequent iterations start from a committable state;
> configurations that do commit are still fully CRC-validated.
>
> Signed-off-by: James Lin <PingLei.Lin@amd.com>
> ---
>   tests/amdgpu/amd_plane.c | 57 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
> index 9a08f8e29..0e849b9b4 100644
> --- a/tests/amdgpu/amd_plane.c
> +++ b/tests/amdgpu/amd_plane.c
> @@ -28,6 +28,14 @@ IGT_TEST_DESCRIPTION("Tests for Multi Plane Overlay for single and dual displays
>   
>   /* Maximum pipes on any AMD ASIC. */
>   #define MAX_PIPES 6
> +
> +/*
> + * Upper bound on how many scale/source combinations may be skipped because
> + * the driver legitimately rejects them on display-bandwidth grounds
> + * (DC_FAIL_BANDWIDTH_VALIDATE). Empirically only the heaviest downscales of
> + * the largest sources hit this; many more than that means a real regression.
> + */
> +#define MPO_MAX_BW_SKIPS 4
>   #define DISPLAYS_TO_TEST 2
>   
>   /* (De)gamma LUT. */
> @@ -50,6 +58,7 @@ typedef struct data {
>           int w[MAX_PIPES];
>           int h[MAX_PIPES];
>           int fd;
> +        int bw_skips;
>   } data_t;
>   
>   static const drmModeModeInfo test_mode_1 = {
> @@ -382,6 +391,7 @@ static void test_plane(data_t *data, int n, int x, int y, double dw, double dh,
>   
>   	igt_crc_t test_crc;
>   	igt_display_t *display = &data->display;
> +	int ret;
>   
>   	/* Reference: */
>   
> @@ -404,7 +414,48 @@ static void test_plane(data_t *data, int n, int x, int y, double dw, double dh,
>   	igt_plane_set_position(data->primary[n], x, y);
>   	igt_plane_set_size(data->primary[n], dw, dh);
>   
> -	igt_display_commit_atomic(display, 0, 0);
> +	/*
> +	 * Downscaling reads the full source surface, so a heavily downscaled
> +	 * large (e.g. 4K) MPO source costs as much display read bandwidth as a
> +	 * full-size plane. Combined with the full-screen overlay and (on some
> +	 * panels) DSC at high refresh rates, the resulting configuration can
> +	 * legitimately exceed the display controller's bandwidth and be
> +	 * rejected by the driver (DC_FAIL_BANDWIDTH_VALIDATE -> -EINVAL). That
> +	 * is a hardware limit, not a scaler defect, so skip such combinations
> +	 * rather than failing the test. Configurations that do commit are still
> +	 * fully CRC-validated below.
> +	 */
> +	ret = igt_display_try_commit_atomic(display, 0, NULL);
> +	if (ret != 0) {
> +		/*
> +		 * Only tolerate a *downscale* (displayed area smaller than the
> +		 * source surface) rejected specifically with -EINVAL, which is
> +		 * the DC_FAIL_BANDWIDTH_VALIDATE path. Any other errno, or a
> +		 * failing upscale, is a real bug and must fail the test.
> +		 */
> +		bool downscale = (dw < fbc[n].test_primary.width ||
> +				  dh < fbc[n].test_primary.height);
> +
> +		igt_assert_f(downscale && ret == -EINVAL,
> +			     "atomic commit rejected unexpectedly (ret=%d, downscale=%d): n=%d dw=%.0f dh=%.0f src=%dx%d pw=%d ph=%d\n",
> +			     ret, downscale, n, dw, dh,
> +			     fbc[n].test_primary.width,
> +			     fbc[n].test_primary.height, pw, ph);
> +
> +		data->bw_skips++;
> +		igt_assert_f(data->bw_skips <= MPO_MAX_BW_SKIPS,
> +			     "too many MPO scale combinations skipped (%d > %d); likely a real regression, not isolated bandwidth limits\n",
> +			     data->bw_skips, MPO_MAX_BW_SKIPS);
> +
> +		igt_info("Skipping unsupported scale (likely display bandwidth limit): n=%d dw=%.0f dh=%.0f pw=%d ph=%d (skip %d/%d)\n",
> +			 n, dw, dh, pw, ph, data->bw_skips, MPO_MAX_BW_SKIPS);
> +		igt_plane_set_fb(data->overlay[n], NULL);
> +		igt_plane_set_fb(data->primary[n], &fbc[n].ref_primary);
> +		igt_plane_set_position(data->primary[n], 0, 0);
> +		igt_plane_set_size(data->primary[n], pw, ph);
> +		igt_display_commit_atomic(display, 0, 0);
> +		return;
> +	}
>   	igt_pipe_crc_collect_crc(data->pipe_crc[n], &test_crc);
>   	igt_plane_set_fb(data->overlay[n], NULL);
>   
> @@ -616,6 +667,8 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
>   
>   	test_init(data);
>   
> +	data->bw_skips = 0;
> +
>   	/* Skip test if we don't have 2 overlay planes */
>   	if (test == MPO_MULTI_OVERLAY)
>   		igt_skip_on(!data->overlay2[0]);
> @@ -662,6 +715,8 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
>   	for (int n = 0; n < display_count; n++)
>   		igt_pipe_crc_collect_crc(data->pipe_crc[n], &fb[n].ref_crc);
>   
> +	igt_kmsg(KMSG_WARNING "MPOSCALE setup done (ref crc collected), entering scaling loop\n");
> +
>   	for (int i = 0; i < ARRAY_SIZE(videos); ++i) {
>   
>   		/* Video(mpo) should be in the middle when it transitions between displays. This
