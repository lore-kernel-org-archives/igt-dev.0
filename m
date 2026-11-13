Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB52606A323
	for <igt-dev@archiver.kernel.org>; Fri, 13 Nov 2026 19:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dqIvy1LU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AE410E6AB;
	Fri, 13 Nov 2026 19:33:25 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013026.outbound.protection.outlook.com
 [40.93.196.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDD210E1B7
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2026 19:32:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAwFc98O+SbR9c5guCHMbaIeETmFBJxR/cP2XtkayFNY4KFcEYExMtP6t+lUYlcrj5IA8J5zE09VofTlZjsHN/+IfQRypUvgamDtrnwrcDMiWMpkc72nGB8xyhYzaCIBKdogxqkTTAOAXLUSai3iHm1pO+ho2xZWd0nocG1RRkOZWlGA+pNxxdnw1pK7KHUsIey5nJuwX695hS9z0Nnip2jAAISdZ0hMPIAoANdRMssmVl4yHU/I+UZ7z4gAss8j+b11G1/WgaAUPwm6AES/DGHONu6HBvhaEq1cDSx8az+2Ub/p8l7VqOedJANrP0WnIA6YBKi62HwLHzOTHX4NgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5h4+60lBaabooaI5grSEEistx3NVcbwKADTrqfof2C0=;
 b=eORn2RdrXxHy9JsbnqXD0VPsWGUyK0Ggdb1r7+lkkQMsegdHC7EDtV98esrxTvuUcEK7aM3ouXLhmgSU8IniB1u3ifxUjpDKPY1NbPwJF/GqCZCJ8Af7JSXTitMTkee9l34vZsE3ioJw6pD/6gLIpEuPOL5QZguzsZ1zhY+caGMOxRtHcRFAMQXAtCn3JkBUd2jIO3kinKQ+59hk1/raazJXf3JjBNg/oS6F/KaL0nupQAiHM9+jhWzNJeyKOCQihSYJVEE4tKUxPiBM83duB0ykSIeYN+FXdnDMn9DAVW6yLCtjS1f+xoJjVB8BV2b5OGhd/6KvtWpzvpj9cwZVxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5h4+60lBaabooaI5grSEEistx3NVcbwKADTrqfof2C0=;
 b=dqIvy1LUplgf5KG8h81Ke4lFPC1JIerG9CbYiZ5abVmIqHtzp+AQZkR/WsiQikwt6Mw0qf2GSEpMmyjfQRRVGKHcPrYVZ8xSPUaDuALVeGkLWteo8EjtgBCYzuXEgpmNyVq3+vxfu5wdTns5S1v2mqmdQ8RGzDZONbjPKHpXoKA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB449095.namprd12.prod.outlook.com (2603:10b6:8:4fe::22)
 by PH7PR12MB7258.namprd12.prod.outlook.com (2603:10b6:510:206::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 17:34:51 +0000
Received: from DSVPR12MB449095.namprd12.prod.outlook.com
 ([fe80::76a6:7a4f:a0a5:18c0]) by DSVPR12MB449095.namprd12.prod.outlook.com
 ([fe80::76a6:7a4f:a0a5:18c0%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 17:34:50 +0000
Content-Type: multipart/alternative;
 boundary="------------7w0UWJ4ki3L8ogsBZ8axBRW0"
Message-ID: <bd56a21b-c71b-40cf-82ff-08fc9f4d3798@amd.com>
Date: Fri, 13 Nov 2026 12:34:48 -0500
User-Agent: Mozilla Thunderbird
From: vitaly prosyak <vprosyak@amd.com>
Subject: Re: [PATCH 1/5] lib/amdgpu: add gfx13 family id
To: Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20261112033600.701688-1-sunil.khatri@amd.com>
Content-Language: en-US
In-Reply-To: <20261112033600.701688-1-sunil.khatri@amd.com>
X-ClientProxiedBy: YT4PR01CA0268.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::11) To DSVPR12MB449095.namprd12.prod.outlook.com
 (2603:10b6:8:4fe::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB449095:EE_|PH7PR12MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a659ee-b400-488d-1c75-08df41ac6ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|18002099003|22082099003|8096899003|261021123027099003|261009223027099003|261028144727099003|261102123227099003|261026140227099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: sTUTk8xQw85Am5h9yYSNvL8clHiSxDSBzm59JgsiQZu8L9aJ8Z1pyJoYSeOIYrw8zPTnmBARylm5UUZRgg+cvieYVRSuOl/yVoGNYNwZTSMd77pofQ0oVJ/6sxtePJCTWEqIbXRDKtNBD/wcSlSb4X8KToqfrz1fiyfsJteBNtidQEIqyQCcObpCDmnLtp+rE+ivgD7vweLbN1XUTkyd1wbcHWvuQ5GAywCEcon7eJH5GMa9tBGeBDqeShCSFe5pfFKUiUdjmgB3enaysjo6pedyGdIl1+IpWfqpHzvHqyDaERuiX3ky97fYmh7HSy63KZTtjRtcM6aKro/mGtJevHWO6CSejVTJ/KdUhRkR890QhvbvoFQeH5x0/HHY9w4jwsfAtdfPjvx6+JIEuefcvruYMyEJ8Mn0CJDtzBuefBvBZ50qyieGHVrTXTlNHnXEv5S7YFt90gvFZiTezekH/yExf7xmTU8/YZJ+5V40uMJ3qMMuDIhDvfbYHyIUoSZ0zKnM0SMQmgg971ltcyADprfLNuqMPS2vSxaZA3cLavZ6w0G5NZgzdUN4PWfn4xKsANCqs9uToBAGw+wT6z9IbWBwprrprtUDGbCNUqe4YpDo8+KuBht2mZRb0n1WijgCGAfALLtFx3S7LS8vBqb7qO6hgTQtgUkjrwx6qrGDmCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DSVPR12MB449095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(18002099003)(22082099003)(8096899003)(261021123027099003)(261009223027099003)(261028144727099003)(261102123227099003)(261026140227099003)(261022105027099003)(261021121427099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVVid2xPTExsMlArMjF1V2ZVdmJabWtaVy9GMjB6cjA0SHZJNXFJaG0yTWlM?=
 =?utf-8?B?QkhzYzhJMUJVZ2N2ZlR6WnhGZXE4bHgxbGtxTW54MkVGMENTS01DSmUyR0M5?=
 =?utf-8?B?bTJVZVQvdDlDbE44VXJZcVN0R09uWDJLSlVpbjVvSFlXaWxreU05OWJzaW1y?=
 =?utf-8?B?aDhhZlU0UjhGSTRTT2VBdjJxRmtmT0VZVXRPZ2hiYXhMOXlqTkVGMXVqOHA3?=
 =?utf-8?B?bUhOdGYwZVNCZ20xMzhFYjZyZDRuQlBHOGtYUXJJWGNkOTV5SlRQcmhhS3l1?=
 =?utf-8?B?dFJISEVFOFBYV1AxS1o5aUpSbVpqc2pBcnFLbTlGNkkwUFA0K0tBWCtLbmtF?=
 =?utf-8?B?eVQ1dEs5eWNnZlNXeXF4NzcvbW9PZEcraC96b0hlR0NJNVpTOWVHT2tESDJz?=
 =?utf-8?B?cFhOdnR0QUJVRFBDNXJtM3hsOTNKeWc0UUhkV0RhcnRxUWJKR0JZOHB5ajUy?=
 =?utf-8?B?ZGd6YU9VdnVwbStqYzZKcXMvblQ4dHNlYTIwdHNTMW9BR3dpZmVhSFdEUk1o?=
 =?utf-8?B?eGd0d1NNRGZiUVR0eE1qbFJod3YreDlyNWsyZk9EcXA5TllvTVZVVHhMd0Fp?=
 =?utf-8?B?OHltN2VTS1BSMm5GYzdUOUJ1cU1PbU5Wc08zZFB0UjFVM2JNTnVLUVVrMTZO?=
 =?utf-8?B?S1hDdTBFdER3QmFnTklLWWpBV3lWb2lrZjRPb2hRQkZ0R3lmM1h5KzUyeThS?=
 =?utf-8?B?aE1ib3hsallONFlMNGlrT0FCVWoxWWZMQkc5dUdrdFBRMTVaMENybm0yaCsw?=
 =?utf-8?B?UzBLT0JrVVI4YVlTTnY2UGk4ajVWc3UwWnU5V0I4bU9YbGU3NGpHaERVd1Iy?=
 =?utf-8?B?SVZPYjFMZk9lUHF2NXIzSlVqSTNsVXVZblNYZ2Fkc3hmRnpSeTVPS1oyOUNx?=
 =?utf-8?B?dWg2U1M2czE3QWxxdVlkMUhSTGhRUE9BQW5iOXZpYnVVb0J3Tng5VnUvUTJj?=
 =?utf-8?B?ejZpb0RtSkt6bVkrV0FIMUJNSVdtdFAzelV0ak1KSE0zREhlbGtscmZXb2RX?=
 =?utf-8?B?bDdSb0tmclB4NWpqYTNiME9CM2Z4R0Zjd29LNjNMZStpaDZEd0Y4SnNicE1t?=
 =?utf-8?B?cDlibUoyWWQ1S0ZEZnlsdFdiYWdCOVdINjNvc0svd292Yks4SGV6Zk1jQzVG?=
 =?utf-8?B?SUtXL0NuZUxRQVFSYVVIREhIeUo0aWN2ZlJZQ1pDd0hQN3hJV0VYUnhHbkZE?=
 =?utf-8?B?TVNKQUM1dktMZDFKSUE2RGNycTg4QVBNSXRNckYzVThpTWlVSmN6cWlUaUVm?=
 =?utf-8?B?S2EwVHFRZEV6eVpSbVlxQlRDZVk1NHdUY0NzMzUvUjF4c1g2aGNXMUZNREpD?=
 =?utf-8?B?Vkg0Y1R4WEluV0QrOUpuRkEvT1RVSGNRam1LemJJMWhaMGlZcW9qSmZiVkdN?=
 =?utf-8?B?NWJpdUVwdlIxMVM3WWlVVGExUGg2RFZOampheGtiWEhyTWg0eVRzdXNkcS82?=
 =?utf-8?B?bzBPZllzM3luTGsxaDhOZ0xkNG5nK01QUUI0VVEvbXhYMUNxSTl6MUZBdStT?=
 =?utf-8?B?K3YxdFk2YWp5bmMveUk5c2I5Q2JwL1VLK1ljY3AybVVvcmNVd2lLa0E1SWd1?=
 =?utf-8?B?SzhkdEFoODVqNlRTdktoYXZDRzVtNVBQTW5BZDZrSlF1a2pJYVpuYlpWNWZZ?=
 =?utf-8?B?czNLbklGQlhaR2VpWXBLQ3JCNzFEZkFJdXoyRzVkdUIyUEpLbTcrQ0MrUFVa?=
 =?utf-8?B?ZjcxbnZLdGFqR1M0TzJydzN2NG9zcVNHUUpLRjZaSzlXY0FNWUlkUGQybjdU?=
 =?utf-8?B?SzVuKzlqUEhIRnRZR2MxSjNLNEZDWGhSUmsxZktCVkFFRERyYTN4UzRjZ3Bz?=
 =?utf-8?B?bnlmSkhJZmNHbW93cFZrdjQza05iMzBKQTBQbENURFRZRzIyKy9JWnBQcEJV?=
 =?utf-8?B?T1g1OHR3a2ROY3A1emUxKzF4ZFMvclhSRVlsTDk5cEtxWHBIMW1VbjhENitN?=
 =?utf-8?B?RmIrTkN2dTVKSTlXQ1B1cEE4MmtoNW4zc0I4dW96ZXZzaDJHMUJmNWVSRlhL?=
 =?utf-8?B?dVhHcHhSUnB2eWZwaEd1TUJMYnVPV0dFdEVVa3krNFVtYk1qTVp0aG5VMmZZ?=
 =?utf-8?B?STZtM2J3SVFXTkhZL0Y5NlBBekdTeERGdlBrVFlGelVrc2pVdmhJam9UZEtD?=
 =?utf-8?B?SlRkREtMb2hPdzc1anVWdnNiUFdtMkxOWDd4UkRkTWVSUGlUell0TXpPcHVo?=
 =?utf-8?B?RGRDZnQyU3VmTjdnQWl3N2U1OVc5eGFmb1hhSzZGZEp1VkZnK2tCZTRJa2V4?=
 =?utf-8?B?T2JqUmtqU1paT1VaRHZ4NjNMa1R5VnBtaG54eTdWYWNBRm1IcnhIQU8zK0lE?=
 =?utf-8?B?RkpMQmk2cklmcjgyRVZ5czRNbC9NdWQ5QzhzNmltejhKT2hWTW1ndz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a659ee-b400-488d-1c75-08df41ac6ba8
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB449095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 17:34:50.7516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSzu9csOzfT5Uts5zKAUWxc47r+hEPChQAhp6U2smj4V15YpNFQoN11QomtfVv2B+JCCJHLDAitldh8f10H97A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7258
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------7w0UWJ4ki3L8ogsBZ8axBRW0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

For the entire 5-patch series:
Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com <mailto:vitaly.prosyak@amd.com>

On 2026-11-11 22:35, Sunil Khatri wrote:
> Add support of gfx13 family ID.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  lib/amdgpu/amd_family.h       | 2 ++
>  lib/amdgpu/amd_ip_blocks.c    | 9 ++++++++-
>  lib/amdgpu/amdgpu_asic_addr.h | 3 +++
>  3 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
> index 3b1582995..b3443482b 100644
> --- a/lib/amdgpu/amd_family.h
> +++ b/lib/amdgpu/amd_family.h
> @@ -110,6 +110,7 @@ enum radeon_family {
>  	CHIP_GFX1153,
>  	CHIP_GFX1154,
>  	CHIP_GFX1200,
> +	CHIP_GFX1300,
>  	CHIP_LAST,
>  };
>  
> @@ -130,6 +131,7 @@ enum chip_class {
>  	GFX10_3,
>  	GFX11,
>  	GFX12,
> +	GFX13,
>  	NUM_GFX_VERSIONS
>  };
>  
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 8abde9228..d9374381c 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -1486,6 +1486,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>  		{"GFX10_3",				GFX10_3},
>  		{"GFX11",				GFX11},
>  		{"GFX12",				GFX12},
> +		{"GFX13",				GFX13},
>  		{},
>  	};
>  	struct chip_info *info = &g_chip;
> @@ -1578,6 +1579,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>  	case FAMILY_GFX1200:
>  		identify_chip(GFX1200);
>  		break;
> +	case FAMILY_GFX1300:
> +		identify_chip(GFX1300);
> +		break;
>  	}
>  	if (!info->name) {
>  		igt_info("amdgpu: unknown (family_id, chip_external_rev): (%u, %u)\n",
> @@ -1587,7 +1591,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>  	igt_info("amdgpu: %s (family_id, chip_external_rev): (%u, %u)\n",
>  				info->name, amdinfo->family_id, amdinfo->chip_external_rev);
>  
> -	if (info->family >= CHIP_GFX1200) {
> +	if (info->family >= CHIP_GFX1300) {
> +		info->chip_class = GFX13;
> +	} else if (info->family >= CHIP_GFX1200) {
>  		info->chip_class = GFX12;
>  	} else if (info->family >= CHIP_GFX1100) {
>  		info->chip_class = GFX11;
> @@ -1620,6 +1626,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>  	case GFX10_3: /* tested */
>  	case GFX11: /* tested */
>  	case GFX12: /* tested */
> +	case GFX13: /* tested */
>  		/* extra precaution if re-factor again */
>  		igt_assert_eq(gfx_v8_x_ip_block.major, 8);
>  		igt_assert_eq(compute_v8_x_ip_block.major, 8);
> diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
> index 8b6910751..dc6b80af5 100644
> --- a/lib/amdgpu/amdgpu_asic_addr.h
> +++ b/lib/amdgpu/amdgpu_asic_addr.h
> @@ -33,6 +33,7 @@
>  #define FAMILY_GFX1154 0x9a
>  #define FAMILY_GFX1037 0x97
>  #define FAMILY_GFX1200 0x98
> +#define FAMILY_GFX1300 0x99
>  
>  // AMDGPU_FAMILY_IS(familyId, familyName)
>  #define FAMILY_IS(f, fn)     (f == FAMILY_##fn)
> @@ -116,6 +117,7 @@
>  #define AMDGPU_GFX1153_RANGE     0x50, 0xC0 //# 80 <= x < 192
>  #define AMDGPU_GFX1154_RANGE     0x01, 0x80 //# 01 <= x < 128
>  #define AMDGPU_GFX1200_RANGE     0x01, 0xFF //# 01 <= x < 255
> +#define AMDGPU_GFX1300_RANGE     0x01, 0x50 //# 01 <= x < 80
>  
>  #define AMDGPU_EXPAND_FIX(x) x
>  #define AMDGPU_RANGE_HELPER(val, min, max) ((val >= min) && (val < max))
> @@ -185,5 +187,6 @@
>  #define ASICREV_IS_GFX1152(r)          ASICREV_IS(r, GFX1152)
>  #define ASICREV_IS_GFX1153(r)          ASICREV_IS(r, GFX1153)
>  #define ASICREV_IS_GFX1200(r)          ASICREV_IS(r, GFX1200)
> +#define ASICREV_IS_GFX1300(r)          ASICREV_IS(r, GFX1300)
>  
>  #endif // _AMDGPU_ASIC_ADDR_H
--------------7w0UWJ4ki3L8ogsBZ8axBRW0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>For the entire 5-patch series:<br data-sfc-root="c" data-sfc-pl="|||[]" data-complete="true" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(22, 23, 26);">
      Reviewed-by: Vitaly Prosyak <span class="R78TQ" data-sfc-cp="" data-sfc-root="c" data-complete="true" data-sfc-inited="2" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(22, 23, 26);"><span class="APwqaf" data-sfc-cp="" data-sfc-root="c" data-complete="true" data-sfc-inited="2" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(22, 23, 26);"><a class="gQWhZ moz-txt-link-freetext" target="_blank" rel="noopener" data-sfc-cp="" data-sfc-root="c" data-ved="2ahUKEwiKlo_bxoOYAxXbeDIDHQdbGUgQy_kOegYIAAgKEAI" data-hveid="CAAIChAC" href="mailto:vitaly.prosyak@amd.com" data-sb="/url?sa=i&amp;source=web&amp;rct=j&amp;url=mailto:vitaly.prosyak@amd.com&amp;ved=2ahUKEwiKlo_bxoOYAxXbeDIDHQdbGUgQy_kOegYIAAgKEAI&amp;opi=89978449&amp;cd&amp;psig=AOvVaw2FMezMoSh8wafM2R75CL5f&amp;ust=1794611437505000" data-complete="true"
  style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 500; margin: 0px; text-decoration: underline 1px rgb(21, 88, 214); border-bottom: 0px rgb(21, 88, 214);">vitaly.prosyak@amd.com</a></span></span><span></span></p>
    <div class="moz-cite-prefix">On 2026-11-11 22:35, Sunil Khatri
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261112033600.701688-1-sunil.khatri@amd.com">
      <pre wrap="" class="moz-quote-pre">Add support of gfx13 family ID.

Signed-off-by: Sunil Khatri <a class="moz-txt-link-rfc2396E" href="mailto:sunil.khatri@amd.com">&lt;sunil.khatri@amd.com&gt;</a>
---
 lib/amdgpu/amd_family.h       | 2 ++
 lib/amdgpu/amd_ip_blocks.c    | 9 ++++++++-
 lib/amdgpu/amdgpu_asic_addr.h | 3 +++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
index 3b1582995..b3443482b 100644
--- a/lib/amdgpu/amd_family.h
+++ b/lib/amdgpu/amd_family.h
@@ -110,6 +110,7 @@ enum radeon_family {
 	CHIP_GFX1153,
 	CHIP_GFX1154,
 	CHIP_GFX1200,
+	CHIP_GFX1300,
 	CHIP_LAST,
 };
 
@@ -130,6 +131,7 @@ enum chip_class {
 	GFX10_3,
 	GFX11,
 	GFX12,
+	GFX13,
 	NUM_GFX_VERSIONS
 };
 
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 8abde9228..d9374381c 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1486,6 +1486,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		{&quot;GFX10_3&quot;,				GFX10_3},
 		{&quot;GFX11&quot;,				GFX11},
 		{&quot;GFX12&quot;,				GFX12},
+		{&quot;GFX13&quot;,				GFX13},
 		{},
 	};
 	struct chip_info *info = &amp;g_chip;
@@ -1578,6 +1579,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	case FAMILY_GFX1200:
 		identify_chip(GFX1200);
 		break;
+	case FAMILY_GFX1300:
+		identify_chip(GFX1300);
+		break;
 	}
 	if (!info-&gt;name) {
 		igt_info(&quot;amdgpu: unknown (family_id, chip_external_rev): (%u, %u)\n&quot;,
@@ -1587,7 +1591,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	igt_info(&quot;amdgpu: %s (family_id, chip_external_rev): (%u, %u)\n&quot;,
 				info-&gt;name, amdinfo-&gt;family_id, amdinfo-&gt;chip_external_rev);
 
-	if (info-&gt;family &gt;= CHIP_GFX1200) {
+	if (info-&gt;family &gt;= CHIP_GFX1300) {
+		info-&gt;chip_class = GFX13;
+	} else if (info-&gt;family &gt;= CHIP_GFX1200) {
 		info-&gt;chip_class = GFX12;
 	} else if (info-&gt;family &gt;= CHIP_GFX1100) {
 		info-&gt;chip_class = GFX11;
@@ -1620,6 +1626,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	case GFX10_3: /* tested */
 	case GFX11: /* tested */
 	case GFX12: /* tested */
+	case GFX13: /* tested */
 		/* extra precaution if re-factor again */
 		igt_assert_eq(gfx_v8_x_ip_block.major, 8);
 		igt_assert_eq(compute_v8_x_ip_block.major, 8);
diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
index 8b6910751..dc6b80af5 100644
--- a/lib/amdgpu/amdgpu_asic_addr.h
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -33,6 +33,7 @@
 #define FAMILY_GFX1154 0x9a
 #define FAMILY_GFX1037 0x97
 #define FAMILY_GFX1200 0x98
+#define FAMILY_GFX1300 0x99
 
 // AMDGPU_FAMILY_IS(familyId, familyName)
 #define FAMILY_IS(f, fn)     (f == FAMILY_##fn)
@@ -116,6 +117,7 @@
 #define AMDGPU_GFX1153_RANGE     0x50, 0xC0 //# 80 &lt;= x &lt; 192
 #define AMDGPU_GFX1154_RANGE     0x01, 0x80 //# 01 &lt;= x &lt; 128
 #define AMDGPU_GFX1200_RANGE     0x01, 0xFF //# 01 &lt;= x &lt; 255
+#define AMDGPU_GFX1300_RANGE     0x01, 0x50 //# 01 &lt;= x &lt; 80
 
 #define AMDGPU_EXPAND_FIX(x) x
 #define AMDGPU_RANGE_HELPER(val, min, max) ((val &gt;= min) &amp;&amp; (val &lt; max))
@@ -185,5 +187,6 @@
 #define ASICREV_IS_GFX1152(r)          ASICREV_IS(r, GFX1152)
 #define ASICREV_IS_GFX1153(r)          ASICREV_IS(r, GFX1153)
 #define ASICREV_IS_GFX1200(r)          ASICREV_IS(r, GFX1200)
+#define ASICREV_IS_GFX1300(r)          ASICREV_IS(r, GFX1300)
 
 #endif // _AMDGPU_ASIC_ADDR_H
</pre>
    </blockquote>
  </body>
</html>

--------------7w0UWJ4ki3L8ogsBZ8axBRW0--
