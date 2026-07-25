Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C3EC531C9
	for <igt-dev@archiver.kernel.org>; Sat, 25 Jul 2026 07:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0F810E0F4;
	Sat, 25 Jul 2026 07:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0odUwfWq";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010022.outbound.protection.outlook.com
 [52.101.193.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A1210E0F4
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Jul 2026 07:19:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvl4WUDClaqZ5/K5vJtg2IwGoY6lbbftXwESxq7YKq62Ond+oFHCfiM6H6m0YuGt3oWecAV7Mi8aTyzQMrxA4KJmilBEXLTrZ0DkBvywJsMNeuXgbDjBQdfFcKXuaTB7koT2rOwCBifhKRoddxvojKroZy7VAkN2RFJM1bvAuRHlQoR0fuCOvBYCECsBxhxjoTnShFwGjTescoWPrCzkrb5EZWut42oGait6iX78KXKsw2A3PF16tY2oP6OVbBVqAEiv1Up0gy4SZ4OI7cBRjl0Hve8zt43OJzAOAvax3Qpbe4yM1Pnfm6vtV6I9mlP727EtK4vv/s+MnVSMPUG6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeCQ0LefH+Zzm4WXKQ++EKooTaK+RqVLHkxU4yimM0E=;
 b=lJLLJ71CIPwuHGoBLPv0QIaFjwOvCqexh2iHQrkSzuPL3b1Wslt2RdSSlzFocV0E/0SAASa+HXvGnkVAXveXSHf7DdvVYcUb6+9PM8WhuyHK4Slmyzj5wX3EbBcHxYPkQwGVsPfvpyGuqD9jJsY8EhFJQm6hgXlpm8EsxcmsMhkqpkD98QcHN4y3Ao1UJloGAs96eaw4fcHPeLoL541L+FFZCC6svRoJfknVAXM9d7iTZkdfZOYSpza/SesLTZYcVKNGkZNUu4l7ztZMZlDxgk/nQpsoAawcM1ue+nNe9UZ8Q+AFmSlLoe4zvRa9f79ssJ/7PK+254so+PYAEpexyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeCQ0LefH+Zzm4WXKQ++EKooTaK+RqVLHkxU4yimM0E=;
 b=0odUwfWqpyRUxwUHrbxU6QprkbjNL4Jvrvb6IlpjWGYItovBklm0u0UkCywvHwBn8sP4/JGQVwTQNzrY6UVkZxSI51hTAoa8xBKyA72wdKkTUesNQUWixNVvwIynM/KIIay7USaBC7i7w3IxauWHP8UsLydVDiM/Xr1dupN+7C8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SAWPR12MB999166.namprd12.prod.outlook.com (2603:10b6:806:4e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 25 Jul
 2026 07:19:19 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 07:19:19 +0000
Message-ID: <5dd19125-796a-4f8e-bec9-5b05c5b90059@amd.com>
Date: Sat, 25 Jul 2026 01:19:17 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] tests/kms_colorop: Keep CRTC active between YUV
 tests with temp FB
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-11-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623175737.171142-11-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:5:334::20) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SAWPR12MB999166:EE_
X-MS-Office365-Filtering-Correlation-Id: 7877b04c-f61d-4077-2d47-08deea1d0b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: X8X5dByDl5TlJpf+sVaFq3+KLN97dlVjiOZtULY2KQa6m3VnHmtpNMV1ObyW+CfclbMk51mC3EcgHRuK2mapy/kNEnuqI1nr6xGUH4iV/MmQfOkGaliwbmiYTYo04lJ4++77sz72iIOkL+zlCxqRtjWYb87Adb1ZaWQGGxsMMDT/V2PY8u99Fs80qKI6uBZmSYZ6q0k7qSGhwwf1TeE/r8G7V8i6cRee8h49bpUklWKhRE+g9TJesXFfC35+El9Hn7wuIrZUM2/aXbKjRKNvZlBsulLjWJJgMmMnLjl33x4pzfxZAXH5hc6imZzUe+dEB9O5yRJbQui+juj02euT1BsyEY71TwWwGAFwhxyYBHXwd14QyMMSdXFic09ew8OAYUAMUXj3mrs4HsI1D+B4CbMQn8dzPp7YfUysOMMOx3yk99C+5R/yjc4lmX1hyUriH+oW/IrUoLDSD1cVdtLdHHxkQoYdpkdWnD87KSc1HLT6oHVaTdSe7LaSQb2lMy2nRxBYAYiqF3cfaS0vti1j7x7RtIBvdICivr/JcEBLW5F8I/AfpxHQqEa49cjWoeJ5QQvnGM98XKCkyB+U6Sx2bVuFC58eA/Q01Ea+vs+PJQK/p4+4vSQtdOYIQpuLeM8YNCsRwQikEgm2UHuPHQ92vqpLX3PVp5jzr1gR8O4sPF4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmxRRng2WkFmRFJqK1VtNUxhZkxZcjVKNkhpVU1zSGxmS2xwNnV2Ykx0Y0Yr?=
 =?utf-8?B?Q0tTcElHZlZGc2N4VmtDRnNSc1djeEZ2L3pJaUdCaVdxUlZscXBrM2dabWkz?=
 =?utf-8?B?Q0hWYnN5RmFTS20zbG1GbW01cis0WUw2ODJHc2tVTGMyU1BRUjVueGFVY1Ro?=
 =?utf-8?B?SzRhYThNZmFIRmJZQVBTR2cvanFpRDVtWStKT1RHUE9IM1A4SHIxN1o3WHpj?=
 =?utf-8?B?WmJaK2M1YjVZMnpBMExzTjlidnVTSHNhWFFrOG5xcUxUdElmdlBKUWlWSnFP?=
 =?utf-8?B?MkZiQTAvUitUa1FzRWZRMmM0d3VrejZSb3FuV3VYUHJMZ0RwRzBNUnY0TG9B?=
 =?utf-8?B?NU95aDdZeDlzWFh6ZU1xYXphRDB4eXZjZnVpMkI3SmRoRXQzOHBkcTloZSt3?=
 =?utf-8?B?cnRnN3NWb0FQamdQZUdDbEtDZm1QZ2JoV3VxR00wR2wzYXB3Nnd5YWlPS1RB?=
 =?utf-8?B?UEwza1J1ZzBwQjJiV2ZXWHZtTFR5Tm1nL2ZLMy9TNTRRenBRRCtKVjdERkFy?=
 =?utf-8?B?QVFYNEVUTzJndVl6VlVHN2oxeVNHdHNkV2NsUFo4U2x2dUxmVFZqVkg5OC9s?=
 =?utf-8?B?RE9LS2I2dGVSb0ZPeFlOK1lSREljVStyTUYzQnlxOFU0eWxxSWlqYk9NMjZz?=
 =?utf-8?B?OHBUOGN2TDlZUW9yQUVKcDJQNGx2dXZxbTZ4WjJIc3p6LzVUamFjV2t4MUtZ?=
 =?utf-8?B?bUdWK1dBcVZZQXFxRTJhRnY4QXhkQjFTcTRtRnNEdmkyVlFLajZEbGQwUEEx?=
 =?utf-8?B?bUl1bGxNTXJVYWlnRUc5Y2oyUTBLOTBHR2x1TUtueDlPQ25JSzlHODJZT3Ez?=
 =?utf-8?B?Tkd0czdqS242WTV5SVpRcnAxL1pCeitPUUVxN3MwRDJ6MlBjZC96VUR1emx4?=
 =?utf-8?B?dXZhKy9ibC9TajdNcFpRNGxpWENVQlNJSGI3TFB2ay9QRnUvdytZbVU3clRk?=
 =?utf-8?B?aHF2em5QN2J3WStHQlRzdnMycUpzNnZPMSt2YkZ3L1gwOGttbXBkOTY5bHFJ?=
 =?utf-8?B?VjhVMEZ0WWQ0aEdyYUN2aHN3TGdRZmhMMDhYeUVuUlhmZGFzZXhFT1pHNXlF?=
 =?utf-8?B?b0VSQ2RDaWNyK1ZmcnFPcnBrUXNKVnhiazVQNWhBU0k2R3lrQlJHWjdkUkFm?=
 =?utf-8?B?WHRxVGdZTjhvVUc5WEhONlJ3dlBjdy9qMWM5Ymt0S0Y2am14bEM2SjRwekdn?=
 =?utf-8?B?NnMySVNISlFBRHVtU1RmYUJjSnl0dVB5WkcwWGUvR09jR1YvbHR1djNNYnJF?=
 =?utf-8?B?Z294TCtabS9ZQ2JHQVpwNWZ0eEIxZzVsdjhDa21sR3lnVTJRbDJvK2VLWUNJ?=
 =?utf-8?B?K1hEcjU5SGo3WWZiWDVPSnlKR2kwUnArVU1UTURPNEtadFJLWDhIb3Rka0Y5?=
 =?utf-8?B?cHU2ZDZDNXlEMVZOYXczWm50aS9tV2Ura0M3WUpvT05RdUlYZmFRN3U3YVB0?=
 =?utf-8?B?UGEvMTROTGxHQjZFK3g2U1dNaGdpNXYwTjZ3M3FyOEZHTzQ5bVd0SHE0RUlF?=
 =?utf-8?B?R3pNbE0wUjNwZDNickVDVlF6QjJSdktqcDhPblpPaVFTL3dnNWg1bGZKNXlq?=
 =?utf-8?B?QzRzYzAySkVabXNxc293Q1pVSGkwaGZsWjlDWGJKTkc1cVl1b21iZVN3SFFm?=
 =?utf-8?B?RW9jWVNnMzFPRGorTUhkaUNhWktVVGg5QTYwMXc0UU9GcHgyelIrS1MzRGFm?=
 =?utf-8?B?OC9OUVdJQkpMN1EwUnUzTmJKcUNvc3VuNDgrZENQNlU0Qys4Q2JEckxyNkxI?=
 =?utf-8?B?OHR2VmdEaW1jU2hwZ0I3MS91VXROOTdzZTZhNm44QStueDdzUUNjSWZBVGxF?=
 =?utf-8?B?RGpMaDlYQ3dTd3pEUXBXZGtEOWFDcG9ySWJ6aDJZOTRrclJLMkI5c2pyU1BY?=
 =?utf-8?B?M295QkJMVnRBbnVtTUJNcitkeDFYaXZmOW5TVk94SFZYRnFyUXo1V1FrMy9k?=
 =?utf-8?B?aEVVLzJDdnl2bllIZ1BuR0RHMGZFZTkvaWxWSkdvK3FZY0NhYjZBc1hKdU9I?=
 =?utf-8?B?K3ZtYUViWmt4RFVtV3o1ZEcyeVQzZlpHQXcwZC9YUk5IcGIrVVdlSGxWbFV2?=
 =?utf-8?B?cS9UK1N0Q3U4QnlvRzgwYTBXbWwxY1F3NHg2S0xmREVtNkNyZzlwajlKQ2dy?=
 =?utf-8?B?cUdUOWowb0IxVXFPOUN0blpGcHRSdnVlM0t6NTQ0MmRFcm9EMzdpRGNWTlpi?=
 =?utf-8?B?Sk1Mdm5Xc2RWTCtrVlo4MkpKSWgrcmtPS0xvMzlWL2RjdDlHVzNWWWtyVThn?=
 =?utf-8?B?bU05QlBLOFJuM0ozYWdxZGE0dXdkMzdIWDhmQTVSZ200cnFUNGdrU3JXQm9Z?=
 =?utf-8?Q?/LQuiIvaE+WymZFgZ9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7877b04c-f61d-4077-2d47-08deea1d0b03
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 07:19:19.4127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ey9DqNRTW8EAwqO7iw+cRH5ohttNguFO9LwAx/cwpGefe68DY/4tsYJ4Ml1rexIGeDnb6LpZ9zCQist2CwBDmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999166
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

This can be squashed with the previous patch.

On 6/23/26 11:57, Harry Wentland wrote:
> Move output_fb creation to fixture and introduce temp_fb to keep the
> plane/CRTC active between YUV subtests. This prevents the "framebuffer
> without CRTC" error that occurred when removing input_fb caused IGT to
> disable the CRTC, leaving the writeback connector detached but with FB
> still set.
> 
> Each YUV test now:
> - Creates input_fb with specific encoding/range
> - Runs test
> - Switches plane to temp_fb (commits to hardware)
> - Removes input_fb safely
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   tests/kms_colorop.c | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 1d30d2538574..4e8b2563ea4e 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -585,7 +585,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   	for (j = 0; j < ARRAY_SIZE(formats_yuv); j++) {
>   		igt_output_t *output;
>   		igt_plane_t *plane;
> -		igt_fb_t output_fb;
> +		igt_fb_t temp_fb, output_fb;
>   		unsigned int fb_id;
>   		drmModeModeInfo mode;
>   
> @@ -605,7 +605,14 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   				igt_assert(plane);
>   				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
>   
> -				/* create output fb */
> +				/* Create temp fb to keep plane active between tests */
> +				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> +							formats_yuv[j].fourcc_in,
> +							igt_fb_mod_to_tiling(0),
> +							&temp_fb);
> +				igt_require(fb_id > 0);
> +
> +				/* Create output fb shared across tests */
>   				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
>   							formats_yuv[j].fourcc_out,
>   							igt_fb_mod_to_tiling(0),
> @@ -613,7 +620,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   				igt_require(fb_id > 0);
>   			}
>   
> -			/* Run YUV tests - create input_fb per test with correct encoding/range */
> +			/* Run YUV tests - create input_fb per test */
>   			for (i = 0; i < ARRAY_SIZE(tests_yuv); i++) {
>   				igt_describe("Check YUV CSC colorop");
>   				igt_subtest_f("plane-%s-%s", formats_yuv[j].name, tests_yuv[i].name) {
> @@ -648,14 +655,20 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   							formats_yuv[j].fourcc_out,
>   							tests_yuv[i].colorops);
>   
> +					/* Switch plane back to temp_fb to keep CRTC active */
> +					igt_plane_set_fb(plane, &temp_fb);
> +					igt_display_commit_atomic(&display,
> +								DRM_MODE_ATOMIC_ALLOW_MODESET,
> +								NULL);
> +
>   					igt_remove_fb(display.drm_fd, &input_fb);
>   				}
>   			}
>   
>   			igt_fixture() {
>   				igt_detach_crtc(&display, output);
> +				igt_remove_fb(display.drm_fd, &temp_fb);
>   				igt_remove_fb(display.drm_fd, &output_fb);
> -
>   			}
>   		}
>   	}

