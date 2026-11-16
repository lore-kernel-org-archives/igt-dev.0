Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F90606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 19:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4deMVZuc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5403910E440;
	Mon, 16 Nov 2026 19:53:43 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013021.outbound.protection.outlook.com
 [40.93.201.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2B010EF65
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 19:52:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOmBP4U4dBmdt9f2m/vjYK3u4aF+FEuoY7NI68OJW5Yf9GuyBvM5kkAB73aOQoUZVQGtxcqn2W0UxB8lxZuXfCFe5RQGqd4GfZGMDM/1n84w9GQ83NN57O6Epl28IqFqTmtiFD1B2FjdvH94PBwhbvCM8i99kvBWt0+jG2vVRKqQwdOWqwMvrFoWzCY4fqey/+bf1ywVpUcCclGgLlEHARaNeutui4jGCiibgd82isZVGwo+uoM2Yy8sJruTq8rzC+8zUYbhSRWXv3srruqgnuyYxWJ57bdFN67M7dKbmXkzxkK3lrH5yyvRZN2x2mvoSVLUpdOVWL1pxA9rn2Gk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9Wa6uQb02k4HPEC3zk1zkbnH2QN9Isa8G7YAkqfiUg=;
 b=CTG3ikPNsgT7Tq4MI+cDYfNM4vJyfbq+89lkLqQpnD3Ah+p7URdLD164TNaGrcvBl0eYG6Kl0xNbBA/FI+h6JJ8aUfS8LQDeOmiSqvaGFKYIC1u7RTMejtehZJtl4z0Way32qi6rv2oHvlsptX3A/cPz91ywc0QveMA+axRDwAN1PMy1QdOfsZYQFexM//NefSFkC+rI5PLNjhhwRPfWdl4krqwsCmyAoLiXo2hJnHesi1o+8+s48361BU9YmLKHwLLQE3MrlRsRBHAgh1eWc9wU05sh7Mn9b8ZdQorsr+gtT46UlNhJr5ZCtJ61Qs47322Qdl0AQuVbWbFA+yuP3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9Wa6uQb02k4HPEC3zk1zkbnH2QN9Isa8G7YAkqfiUg=;
 b=4deMVZucybaDd4QCQ26CMkxYgXYZgDardzVeezXRJFPBx7adTpvfPqhT8k/4bVMs0rOtERuKCjBPHGnn+w5k2nf4VIKJU5URC92VNOT3XkxjSi6uD6GchnAnrERfJuPxRo/4v8bN720cLAwEkug0p/w+tkRTq4uqYu0QE2QP1w8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA6PR12MB893085.namprd12.prod.outlook.com
 (2603:10b6:208:601::18) by CHXPR12MB999246.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 19:52:35 +0000
Received: from IA6PR12MB893085.namprd12.prod.outlook.com
 ([fe80::3f4e:1f38:3db2:270a]) by IA6PR12MB893085.namprd12.prod.outlook.com
 ([fe80::3f4e:1f38:3db2:270a%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 19:52:35 +0000
Message-ID: <e5c80c9b-b58b-4d99-87ca-73731a826010@amd.com>
Date: Mon, 16 Nov 2026 14:52:33 -0500
User-Agent: Mozilla Thunderbird
From: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 2/3] tests/kms_colorop: set up subtest groups on demand
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, Haoming.Qi@amd.com
References: <20261114020614.830491-1-alex.hung@amd.com>
 <20261114020614.830491-3-alex.hung@amd.com>
Content-Language: en-US
In-Reply-To: <20261114020614.830491-3-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0035.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::12) To IA6PR12MB893085.namprd12.prod.outlook.com
 (2603:10b6:208:601::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA6PR12MB893085:EE_|CHXPR12MB999246:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e343238-f6cf-48e1-2f60-08df441b28ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|5023799004|10067099003|4143699003|11063799006|56012099006|261026121527099003|261026135527099003|261026130827099003|261026140227099003|261028144727099003|261022115727099003|261021135927099003|261021130227099003|261021133027099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261022113327099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: M+l33qOoOMoN8+rFMenRB6TKuls9ItY+LTjZmUjcYRA37SlMkLiGpnqyWyLUGupXcCWE1EWk3DdKhK/lkSKsMvS29utY0YMZHAx7C+TTt9S0eFABshz1QlVmK9FZe7utpq+GDCZZW9Unr0VaCt3m+H5cH9jhtM82ESYoL2LqUJ0EBk5NML3EBWM+HCc8ULw0jONm6wP7txMBbgarkg3Uh2DLQpda288GS99CJEU0yrugMQoIx/c/FqN/jzrIx0ESalCuc/VZroTYo5vIK+U5q1m5YmOXcSO4+y+DWzzKtPDItywMTLGfYMS9je+WCyQADQ3lfdpVCACldQ+xupAC9EHr7gK4LdQaY5fPZyWc4LYM3FnENoPvAv02Zl1HNelJLf4oPMaO0I8yJhuCzqZ2RFt+IBSELcEi/NITl2lxamIK7bhXDzsWqOPy5A141sW1NddP+w9UyKwOIsyOeb3jOt362uK6q1ZGUzRPt2KvCFBwuILHnkvOqrU1/6VoyD9hDzEkIPsGfotcPPjHlYh+OvtfcjpJ3KK3ybD7REKBkvd6je8AzmLI7ljW57ZBcSMrN8wkeV0bsFOPpB9hQvHQ8UHBcbAXjbzXtQ8bXUcHO+rg6Mdv2SbHz2HQu2LTt1KoaqoD4rYxg/H/rLRuVxg4wXh/7bTy4tkuhT7i6CO5qZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA6PR12MB893085.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(5023799004)(10067099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026135527099003)(261026130827099003)(261026140227099003)(261028144727099003)(261022115727099003)(261021135927099003)(261021130227099003)(261021133027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261022113327099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHJJc1hjaWlTc1lPb0JBajg5dEpRdk5jb1NoK2sybzVzZ3l5c1JhcUdKZDJh?=
 =?utf-8?B?ZTdlbkJaeGhSMWkxWjVvTHFXSGkvbHJnRGMrT1FXVE4rcXI4VTR2aHdFNnUx?=
 =?utf-8?B?ZjZpOWo5eWVvdVFQSm1TdEh6ajRXUHM1R01wcmNrSTVuTlNCR1JhaXhrNFZk?=
 =?utf-8?B?ZWdXWnhYZDdIOXRQNjNwRDVrSU9KRTBWRHFOUkw1UGhEMkhCa3dTZDVIRTZE?=
 =?utf-8?B?WWFGZTI0T2RmbUxNSE41cWI3WDFVaTdKK3A0VkpPbWg4R2EyZVA5VzFuVGN1?=
 =?utf-8?B?d2NndWc5STdRSU85V2RTR28vemk3ZzVEcGxhVDZXUHBzOVN6ZUJJTVhlOTYy?=
 =?utf-8?B?bTE1b2pNUUIxdkd6bzdITmE5ZkhqbkQyOXZGNytZTHZ3dm9XOUFzSWhrcFNT?=
 =?utf-8?B?LzI2aDlIK1dBR1NSMHl5OTkvQnFpbXBiZ2Y4N1BJdGNQd2xUZXNBekwzNjJV?=
 =?utf-8?B?bEtTb0w0R0k3c1RyS2k0cWY1SUFxMlE5REk5cXIxcjFCRTJoU3QyQVNrNGlF?=
 =?utf-8?B?cmlqaGxuSERiMS80SGdpSlBCdk82K0lRaWIxeFNySG8xa1I4emhCL3FtV1Bs?=
 =?utf-8?B?aklGVTI1RU05T1BoYTZFdFFVblcxbklxUm5qVlMyNkJJWDJLbmdjS1UrY3NM?=
 =?utf-8?B?bEVNbGdxWGxYZmdaWGxXd3BlT2g2YVRpWkp6UlFtSXU4dFNrZ2pjMjhNcm9Y?=
 =?utf-8?B?V205Q1FkU3NHQnQ4dWxpQ20wd2VteWlhdkU3d1kxQjVHVlRwdGRBOVVkYjdp?=
 =?utf-8?B?enRTaHR0TlB4OThsekorOVZzMGluRHpiUU54U1U0UmhldGNrS3JQTWQ1bGRx?=
 =?utf-8?B?NnJicmhDd2RZT1FraUhmcGY5b3FFNU80NUY0R3Z0Z3N4MzQ0dmFrSHNMVk5a?=
 =?utf-8?B?eSsxakFGaHltVEJ3SjNiVTNvZitiNXZub0xGQTN5bzRGOVhlYy9ES3liemtr?=
 =?utf-8?B?dTJZQzZEU29TY0Z6RGU2RUozd1RubzVHWEhoZjhlVFU4OW04TlNPMjdPMlJQ?=
 =?utf-8?B?SzgxL2pHaEtzb1hjZWI2cVl1WkFYSGZ2M1RTRytqNE9jTFN5bzQ0Rk5ycVJt?=
 =?utf-8?B?cGlpTXk4bytDNnp1VDNtSDlrYTlqQVJ1OGZibTE1c2xNQTJsUUJHZXBrTTNx?=
 =?utf-8?B?cXhjbkNXYTlrNVAvMzcvYkloZDU2L0ZZT21DVlVjM3lIZ3kwWWdCbUdaMHV6?=
 =?utf-8?B?TWJIL0N3SGRRdTNIYXBuaHFiUFBtRDg1a0d3MmgrSDA4ZlhuZ3I3SE4zbU1z?=
 =?utf-8?B?SnJGcWxJWVNWVHhpbGVQckx3OFY2bUpQU2U3OHU3NTRhWUZ6MllTMnpKYjhm?=
 =?utf-8?B?TVRja1FHNE5lU29qUjZmMld1cnRrQUU0ak9rdDdWZWhTOHBSVDlUR1VXaDNo?=
 =?utf-8?B?dEI1S0pCNUVtT0tSTWl0TUxDblQ3OURibUV4cnFsZ29BcXhQT1ZYTjZTQzlH?=
 =?utf-8?B?eGlwYXRjREFyVUtpbmZrUHp6NTJOTGlVc2RJWkxrVkFPMHdReFdkL0wxY3E5?=
 =?utf-8?B?YVp3a0ZWQzBUWWtPclRDYjdPbHRhZm1iQ29FRVhMa09pMTNlV2JrQ2FadU9N?=
 =?utf-8?B?KzcxTGY5OENnZmI0ZXhINWUzUW9Qcnh6UWJITEZBT0VLMEszajFHNUxPTTZR?=
 =?utf-8?B?b3NhbzhYWEpUVVJRQUxuRVgwcG5pcmxwL3duU05NMWwrY3RjQUdKVGR6eTky?=
 =?utf-8?B?WlREUjVqdm5LVyt3Rk93Vk9nQmRCUWJXVHdTemkvWGZqNmRubGlkM0NqaHNH?=
 =?utf-8?B?ejlWaFNXT3pjb0JFV2FMWStORTBjZm1BbG1KdW9XcUd1N1VOeXhMUHZqNTV4?=
 =?utf-8?B?Z0dlcWhqNjhxMEtib1JiMWc3ZXB4bnFhNFhaTEJCR0hYWWFJUUFWck5zVW1s?=
 =?utf-8?B?NmhqaUpjRnZLR2lOQXNjUVBRZytyTFBaT1kweGx4S2xJUlBNUXhrbWpPZWND?=
 =?utf-8?B?bGdwWDhJZWxUV2pvbDc2OExDVlRqY0ZKSVByWUhpWW5OUVdzaTVHNHpPUTBv?=
 =?utf-8?B?emxwM2g3emhMdGRFblVQZ0d4R081Mkx4Z1hNT21YMnBRdkR2NCt5eG5lQTEx?=
 =?utf-8?B?czBIWHVwRVRmN1ExR3pHdXQ1dDRpamYwUHRncmk3WUthT2FBTDN3ZXllZlZS?=
 =?utf-8?B?WTloQ2hHdkUrZ0R4R24za2ZqRDFzSXBjdEdYNXljMmt6Ykg3aUVnb3Fwdy92?=
 =?utf-8?B?bVdxbEVnaWZlelIrNERBUnVRSldSOGpJREhqZi9WM3F1eGdEMDZ0cFlIOEtS?=
 =?utf-8?B?TVc1VUxjaGY4akdsR1JHQjVXQnpuNWx6L3lETXUrd3piQUR2bjFYakVKZWxM?=
 =?utf-8?B?OXNaRGRqN3gxRWxwTTgxV3NXVFZxeGxqTEFNK3BMWklkUE9NQ3E0QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e343238-f6cf-48e1-2f60-08df441b28ec
X-MS-Exchange-CrossTenant-AuthSource: IA6PR12MB893085.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:52:35.2203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQ27DWs3xW9zmlFFqbzsT2jEH2QHXj58Cs0hPcQfBT8Zb20chomb3RnxF4dU3jufMgW2PO3/CRrkJh7YOZ3nSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR12MB999246
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 21:06, Alex Hung wrote:
> Every kms_colorop process runs the setup fixture of all subtest groups,
> even with --run-subtest. Each fixture probes the writeback connector,
> does a modeset and creates the input and output framebuffers, so
> igt_runner pays for every group in each of the ~90 processes. On
> HW where CPU access to VRAM is slow at low memory clocks, this
> adds ~10s per process.
>
> Move the group setup into a helper called by each subtest. The first
> subtest of a group that runs does the setup, and the result (including
> a skip) is cached for the rest of the group. The cleanup fixture only
> releases what was set up.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_colorop.c | 245 +++++++++++++++++++-------------------------
>  1 file changed, 105 insertions(+), 140 deletions(-)
>
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 970594a2d..284e08b1c 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -360,6 +360,76 @@ static void colorop_plane_test(igt_display_t *display,
>  	}
>  }
>  
> +/*
> + * Per-group state. The setup is done on demand by the first subtest of the
> + * group that actually runs, so running a single subtest doesn't pay for
> + * the writeback probing and framebuffer creation of every other group.
> + */
> +struct colorop_group {
> +	igt_output_t *output;
> +	igt_plane_t *plane;
> +	igt_fb_t input_fb;
> +	igt_fb_t output_fb;
> +	bool setup_tried;
> +	bool ready;
> +};
> +
> +static void colorop_group_setup(igt_display_t *display, struct colorop_group *group,
> +				__u32 fourcc_in, __u32 fourcc_out, bool pattern)
> +{
> +	drmModeModeInfo mode;
> +	unsigned int fb_id;
> +
> +	if (group->setup_tried) {
> +		igt_require_f(group->ready, "Subtest group setup failed or was skipped\n");
> +		return;
> +	}
> +	group->setup_tried = true;
> +
> +	group->output = kms_writeback_get_output(display, fourcc_in, fourcc_out);
> +	igt_require(group->output);
> +
> +	if (group->output->use_override_mode)
> +		mode = group->output->override_mode;
> +	else
> +		mode = group->output->config.default_mode;
> +
> +	group->plane = igt_output_get_plane_type(group->output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(group->plane);
> +	igt_require(igt_plane_has_prop(group->plane, IGT_PLANE_COLOR_PIPELINE));
> +
> +	if (pattern) {
> +		/* RGB input fb shared across the group's subtests */
> +		fb_id = igt_create_color_pattern_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
> +						    fourcc_in, DRM_FORMAT_MOD_LINEAR,
> +						    0.2, 0.2, 0.2, &group->input_fb);
> +		igt_assert(fb_id > 0);
> +		igt_plane_set_fb(group->plane, &group->input_fb);
> +
> +		if (data.dump_check)
> +			igt_dump_fb(display, &group->input_fb, ".", "input");
> +	} else {
> +		/* YUV subtests create their own input fb, keep the plane active in between */
> +		fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay, fourcc_in,
> +				      igt_fb_mod_to_tiling(0), &group->input_fb);
> +		igt_require(fb_id > 0);
> +	}
> +
> +	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay, fourcc_out,
> +			      igt_fb_mod_to_tiling(0), &group->output_fb);
> +	igt_require(fb_id > 0);
> +
> +	group->ready = true;
> +}
> +
> +static void colorop_group_fini(igt_display_t *display, struct colorop_group *group)
> +{
> +	if (group->output)
> +		igt_detach_crtc(display, group->output);
> +	igt_remove_fb(display->drm_fd, &group->input_fb);
> +	igt_remove_fb(display->drm_fd, &group->output_fb);
> +}
> +
>  static void check_plane_colorop_ids(igt_display_t *display)
>  {
>  	igt_plane_t *plane;
> @@ -539,177 +609,70 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>  
>  	/* RGB format tests */
>  	for (j = 0; j < ARRAY_SIZE(formats_rgb); j++) {
> -		igt_output_t *output;
> -		igt_plane_t *plane;
> -		igt_fb_t input_fb, output_fb;
> -		unsigned int fb_id;
> -		drmModeModeInfo mode;
> +		struct colorop_group group = {};

igt_subtest_f() returns through siglongjmp, including on success.
colorop_group_setup() writes this automatic group after the sigsetjmp,
so setup_tried, ready, and the framebuffer pointers are indeterminate
when the next subtest and colorop_group_fini() read them.
In all three loops, keep the object in static storage and zero it on
each format iteration. A static initializer runs only once:

	static struct colorop_group group;
	group = (struct colorop_group){ 0 };

Harry

>  
>  		igt_subtest_group() {
> -			igt_fixture() {
> -				output = kms_writeback_get_output(&display,
> -								  formats_rgb[j].fourcc_in,
> -								  formats_rgb[j].fourcc_out);
> -				igt_require(output);
> -
> -				if (output->use_override_mode)
> -					memcpy(&mode, &output->override_mode, sizeof(mode));
> -				else
> -					memcpy(&mode, &output->config.default_mode, sizeof(mode));
> -
> -				/* create input fb */
> -				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -				igt_assert(plane);
> -				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
> -
> -				fb_id = igt_create_color_pattern_fb(display.drm_fd,
> -								mode.hdisplay, mode.vdisplay,
> -								formats_rgb[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
> -								0.2, 0.2, 0.2, &input_fb);
> -				igt_assert(fb_id >= 0);
> -				igt_plane_set_fb(plane, &input_fb);
> -
> -				if (data.dump_check)
> -					igt_dump_fb(&display, &input_fb, ".", "input");
> -
> -				/* create output fb */
> -				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> -							formats_rgb[j].fourcc_out,
> -							igt_fb_mod_to_tiling(0),
> -							&output_fb);
> -				igt_require(fb_id > 0);
> -			}
> -
>  			/* Run RGB tests */
>  			for (i = 0; i < ARRAY_SIZE(tests_rgb); i++) {
>  				igt_describe("Check color ops on a plane");
> -				igt_subtest_f("plane-%s-%s", formats_rgb[j].name, tests_rgb[i].name)
> +				igt_subtest_f("plane-%s-%s", formats_rgb[j].name, tests_rgb[i].name) {
> +					colorop_group_setup(&display, &group,
> +							    formats_rgb[j].fourcc_in,
> +							    formats_rgb[j].fourcc_out, true);
>  					colorop_plane_test(&display,
> -							output,
> -							plane,
> -							&input_fb,
> -							&output_fb,
> +							group.output,
> +							group.plane,
> +							&group.input_fb,
> +							&group.output_fb,
>  							formats_rgb[j].fourcc_in,
>  							formats_rgb[j].fourcc_out,
>  							tests_rgb[i].colorops,
>  							false);
> +				}
>  			}
>  
>  			igt_fixture() {
> -				igt_detach_crtc(&display, output);
> -				igt_remove_fb(display.drm_fd, &input_fb);
> -				igt_remove_fb(display.drm_fd, &output_fb);
> -
> +				colorop_group_fini(&display, &group);
>  			}
>  		}
>  	}
>  
>  	/* Bypass transition tests - RGB formats */
>  	for (j = 0; j < ARRAY_SIZE(formats_rgb); j++) {
> -		igt_output_t *output;
> -		igt_plane_t *plane;
> -		igt_fb_t input_fb, output_fb;
> -		unsigned int fb_id;
> -		drmModeModeInfo mode;
> +		struct colorop_group group = {};
>  
>  		igt_subtest_group() {
> -			igt_fixture() {
> -				output = kms_writeback_get_output(&display,
> -								  formats_rgb[j].fourcc_in,
> -								  formats_rgb[j].fourcc_out);
> -				igt_require(output);
> -
> -				if (output->use_override_mode)
> -					memcpy(&mode, &output->override_mode, sizeof(mode));
> -				else
> -					memcpy(&mode, &output->config.default_mode, sizeof(mode));
> -
> -				/* create input fb */
> -				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -				igt_assert(plane);
> -				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
> -
> -				fb_id = igt_create_color_pattern_fb(display.drm_fd,
> -								mode.hdisplay, mode.vdisplay,
> -								formats_rgb[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
> -								0.2, 0.2, 0.2, &input_fb);
> -				igt_assert(fb_id >= 0);
> -				igt_plane_set_fb(plane, &input_fb);
> -
> -				if (data.dump_check)
> -					igt_dump_fb(&display, &input_fb, ".", "input");
> -
> -				/* create output fb */
> -				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> -							formats_rgb[j].fourcc_out,
> -							igt_fb_mod_to_tiling(0),
> -							&output_fb);
> -				igt_require(fb_id > 0);
> -			}
> -
>  			/* Run bypass transition tests */
>  			for (i = 0; i < ARRAY_SIZE(tests_bypass_transitions_rgb); i++) {
>  				igt_describe("Test color pipeline to bypass transition");
> -				igt_subtest_f("plane-bypass-%s-%s", formats_rgb[j].name, tests_bypass_transitions_rgb[i].name)
> +				igt_subtest_f("plane-bypass-%s-%s", formats_rgb[j].name, tests_bypass_transitions_rgb[i].name) {
> +					colorop_group_setup(&display, &group,
> +							    formats_rgb[j].fourcc_in,
> +							    formats_rgb[j].fourcc_out, true);
>  					colorop_plane_test(&display,
> -							output,
> -							plane,
> -							&input_fb,
> -							&output_fb,
> +							group.output,
> +							group.plane,
> +							&group.input_fb,
> +							&group.output_fb,
>  							formats_rgb[j].fourcc_in,
>  							formats_rgb[j].fourcc_out,
>  							tests_bypass_transitions_rgb[i].colorops,
>  							true);
> +				}
>  			}
>  
>  			igt_fixture() {
> -				igt_detach_crtc(&display, output);
> -				igt_remove_fb(display.drm_fd, &input_fb);
> -				igt_remove_fb(display.drm_fd, &output_fb);
> -
> +				colorop_group_fini(&display, &group);
>  			}
>  		}
>  	}
>  
>  	/* YUV format tests */
>  	for (j = 0; j < ARRAY_SIZE(formats_yuv); j++) {
> -		igt_output_t *output;
> -		igt_plane_t *plane;
> -		igt_fb_t temp_fb, output_fb;
> +		struct colorop_group group = {};
>  		unsigned int fb_id;
> -		drmModeModeInfo mode;
>  
>  		igt_subtest_group() {
> -			igt_fixture() {
> -				output = kms_writeback_get_output(&display,
> -								  formats_yuv[j].fourcc_in,
> -								  formats_yuv[j].fourcc_out);
> -				igt_require(output);
> -
> -				if (output->use_override_mode)
> -					memcpy(&mode, &output->override_mode, sizeof(mode));
> -				else
> -					memcpy(&mode, &output->config.default_mode, sizeof(mode));
> -
> -				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -				igt_assert(plane);
> -				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
> -
> -				/* Create temp fb to keep plane active between tests */
> -				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> -							formats_yuv[j].fourcc_in,
> -							igt_fb_mod_to_tiling(0),
> -							&temp_fb);
> -				igt_require(fb_id > 0);
> -
> -				/* Create output fb shared across tests */
> -				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> -							formats_yuv[j].fourcc_out,
> -							igt_fb_mod_to_tiling(0),
> -							&output_fb);
> -				igt_require(fb_id > 0);
> -			}
> -
>  			/* Run YUV tests - create input_fb per test */
>  			for (i = 0; i < ARRAY_SIZE(tests_yuv); i++) {
>  				igt_describe("Check YUV CSC colorop");
> @@ -718,6 +681,10 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>  					enum igt_color_encoding encoding;
>  					enum igt_color_range range;
>  
> +					colorop_group_setup(&display, &group,
> +							    formats_yuv[j].fourcc_in,
> +							    formats_yuv[j].fourcc_out, false);
> +
>  					/* Extract encoding and range from first colorop (must be CSC FF) */
>  					igt_assert(tests_yuv[i].colorops[0]);
>  					igt_assert(tests_yuv[i].colorops[0]->type == KMS_COLOROP_FIXED_MATRIX);
> @@ -725,11 +692,11 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>  					encoding = tests_yuv[i].colorops[0]->fixed_matrix_info.encoding;
>  					range = tests_yuv[i].colorops[0]->fixed_matrix_info.range;
>  
> -					igt_skip_on(!get_color_pipeline(&display, plane, tests_yuv[i].colorops));
> +					igt_skip_on(!get_color_pipeline(&display, group.plane, tests_yuv[i].colorops));
>  
>  					/* Create input fb with matching encoding/range */
>  					fb_id = igt_create_color_pattern_fb_yuv(display.drm_fd,
> -									mode.hdisplay, mode.vdisplay,
> +									group.input_fb.width, group.input_fb.height,
>  									formats_yuv[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
>  									encoding, range,
>  									0.2, 0.2, 0.2, &input_fb);
> @@ -739,17 +706,17 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>  						igt_dump_fb(&display, &input_fb, ".", "input");
>  
>  					colorop_plane_test(&display,
> -							output,
> -							plane,
> +							group.output,
> +							group.plane,
>  							&input_fb,
> -							&output_fb,
> +							&group.output_fb,
>  							formats_yuv[j].fourcc_in,
>  							formats_yuv[j].fourcc_out,
>  							tests_yuv[i].colorops,
>  							false);
>  
> -					/* Switch plane back to temp_fb to keep CRTC active */
> -					igt_plane_set_fb(plane, &temp_fb);
> +					/* Restore the group's input fb to keep CRTC active */
> +					igt_plane_set_fb(group.plane, &group.input_fb);
>  					igt_display_commit_atomic(&display,
>  								DRM_MODE_ATOMIC_ALLOW_MODESET,
>  								NULL);
> @@ -759,9 +726,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>  			}
>  
>  			igt_fixture() {
> -				igt_detach_crtc(&display, output);
> -				igt_remove_fb(display.drm_fd, &temp_fb);
> -				igt_remove_fb(display.drm_fd, &output_fb);
> +				colorop_group_fini(&display, &group);
>  			}
>  		}
>  	}

