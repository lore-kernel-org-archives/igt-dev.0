Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCE6CA5FC5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 16:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584B110E250;
	Wed, 30 Sep 2026 16:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HXRXb9o6";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013026.outbound.protection.outlook.com
 [40.93.196.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E779F10E234
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 16:07:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yf9nHT4M4BqlRqWeI6oND7qNA3wBt28GiuxyQmYk7nq+3bAMidlXeJ3Msh+b0QEz00iiml2QtzkcTVQsADVNlbOIvfnb9FsQO7LaGo2vLBzLSDuTPP5js5ALeDE6wkekfJv+wFu89YepuRkNP4lrtmUmNGi/sJsGXbenuXIeANALziUwyEkcbICyrVGjQAzO0Go8VW0S1CsK4BYTi9WGzD8v1ny1toj5o1bxSymx2IHsMFX7vjL8RiRApiIxL+xgK5qZUKTtFUdDe9ynJLPoQcKWW7cEWmIZNQQLGvDsWZOx0ZVsuby5GjklfA1Gi1HcrgKbl5G5b4Bo/9xWiLtjZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBQaVLjhf3T9/6YIfAvD7xIgEIeBlKGeL+5uMdv9Hq4=;
 b=FFa667h5GofQPmDpaUNE6AHxXTfMJ1IpgYwGdQ2dqaPbelwwcqf4vP9aBvHDh8Z2Zut8PoETpuYiNuHqpurUhvLu5fMhoQk78LiJCUjV1QQaFltNUVRl/I/SzXrvTl5VXCCpCFMrSv79H10d4rr+VELP1gP3P1WxmPREn/OBcvPN72J/J8G3eGAzb81csMR0Dnk1gNq+y5KAfbn3ibke77dGb1NmQwjWVyJCsZGlDrEtaL1R16+IeIlRFfEB/aC9taY+aby7eDyxf8CR83vMIhwHp3M68TrDghZfPQkIxEeNCS/38/wdzF2dOGGcdAFw+uDY06v8nN3Ov2bcm1qNsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBQaVLjhf3T9/6YIfAvD7xIgEIeBlKGeL+5uMdv9Hq4=;
 b=HXRXb9o6wwklP9crztYFc8019BONN5toHDIaNWlV6B+0VvaGmyvBmhtvc0iVcxDaNLDnNo+t2cgIPYZlEL2ucd2Sk92ISESkQ6mnAdHaXTNH/ueFNiivuqqRg53v+nQavifwqxbZT38f6pkR/99+PmRUwKRGHg3vOHzUts8XqBo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by DS0PR12MB9345.namprd12.prod.outlook.com (2603:10b6:8:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 16:07:02 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%3]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 16:07:02 +0000
Message-ID: <a68bfa15-1a1b-4ba8-aab6-7a8089d13b3f@amd.com>
Date: Wed, 30 Sep 2026 12:06:55 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 4/8] tests/kms_properties: give non-primary
 planes their own fb
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Uma Shankar <uma.shankar@intel.com>
References: <20260902180016.303482-1-mwen@igalia.com>
 <20260902180016.303482-5-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260902180016.303482-5-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::27) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|DS0PR12MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f1c962c-7777-4197-98ef-08df1f0cdd83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|7416014|366016|4143699003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7No4BNMPjiyj03OXIVMzcVpyBmbtseYwiuXpZAuqyORitdJTfToD0WNc6s7eHTxHXwzMChDZbKdgLoEOGa7+N5WinYwjca4Z+D2FOtX7wb0/iWiiPQ+kYARSvLVdOa8tA8NKRfNo8d/Moo8t6PKWznpAYXOmBeZ0a4M0E96pJari4MK2sy7NCQGlhjJhJQfwUmkpKJcEq2DatnqZQUkfZeZHTeywjqsxMHEsBoYTKhtGRh1Oxrlmp0VcJmWH8ZzXVM5CT4ZPnFjNLd3fAEL0qOgw0jXAX8rufE53i4VC25ff0i8FQPebQRpLQVs/aZjYs0cOufvyHzDrjL3dQV2tXig+AgHiOUeRpx7j49C/Pgh1EFsAaPeNLlL+savpHyO5r9D0OSZ8tYIUmUjl3ACGLhXPZjrpoF1KXzmh4cniHCDbbjGjr6iqAOZo4C10ALOmYiZq85KrX6X1dYIRfI6px+EafaoMddIlJy+CwrhWNWqvdrTjCFxvINMV4g8l6ABiSuS10/1LqcrfcluJnUv1vRcqKL3SleEq5O3fTwWW5u8khfxZDEoOMf/1nC/vyfGEtW+MAZKbjxfYoxKjn+Mp1RzULjb2j840ihf4APAa0sW5+JeqyFLOuu+dZwVvCsilXBSz/JhA7nANxQBANFtVHM3H++P7hYZpuYifXbdyoKM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(4143699003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlZJc0RxQW5qVVU1NSs3YU8xVnhBZTBEVEhtYUF1QjYwdnI4MUdqWUd2TmhT?=
 =?utf-8?B?aDhBdlVrVzQ2NlI0WjU3ZUFFb2g3b1BvUmpUdW5DSWhaOUJiMnAyOHdkZXY0?=
 =?utf-8?B?WDdDeFVTUnpIWlk3Z29Va2NmelBrcnFkcmR3d0dldnBZT1NUREdkRmJwdlh0?=
 =?utf-8?B?M3V2MkY5R1JpaDVJdVhrRjBaemkrcnJieFhjaFJEVDhkUDRwckdRNFk4eHVD?=
 =?utf-8?B?MXJJSmttYVduN08xenpkS2lQN1Z5S3ZWV0RCSlJrOG11UCt4UHFMdjNJL3di?=
 =?utf-8?B?aHJOQ01QZ09KdmhWOXN2K2kzVGJ6dGdEaitnSGlwbndmVUFkL1JHTXMzY3ND?=
 =?utf-8?B?RVo1cGd5NDNGdG5GVDlqZUhFRDUzMWxvaUMzcU5sa1UyZnByOGprdTl5bHlL?=
 =?utf-8?B?eWUzM09HVEFoT1N5OEliUHVzL0lwZGJyblArczlpUEF3RkxPS1BlM09BZ0wx?=
 =?utf-8?B?M1ZZVjBrcXhtRk9HbSt4Vk5aUUFGSHBwdlZoTG1OOC8wMzZsMEhDclJKS2pz?=
 =?utf-8?B?c2RvWFhXOW1zSCt4MHY3bHRWRkdjZHZtU0JHR2FtSzFOa2VRQ1hQN05HenV4?=
 =?utf-8?B?dGlWVlBUd3hVZFE4bmU3VUFoZXVkTFFkU2x6Q3RPdzdodDNkZG1YV01EaDJ2?=
 =?utf-8?B?b2ViUCtnQk1YU0xJUDh2R0NxZlNYNFZJTjU3b28rbnBybHNtVWNtWnN1L0g5?=
 =?utf-8?B?ZTBGOFFyU21ZMEdZTjVWU0xqdDUvWkZNaDJIeldRUkNDK0tjY3VCSzUydmkv?=
 =?utf-8?B?VlhDYVVVcUQ4QXFXQWRGckplMEp0VllseWFKMUZpWnl3blgvUTNqeE1mQ29H?=
 =?utf-8?B?TGRmdlV6MHBFU0diSUg2QnFzaldKdmhCL1BwSUtHQnpDbjI4S3BWdXRWcEFy?=
 =?utf-8?B?Nll1dWxOalhsZVdwa0MrUWZGWEVqTUJTSEgyeElwMHJleEZubGNCSWU5VWRj?=
 =?utf-8?B?RzBrRmUwV2xDYzFyVmh6ZktGSmFsT0QvblpjaktNR1ZrTGt5Rjk5WXJMWi9k?=
 =?utf-8?B?ZWpTYWdKejFOMUJFbTBJRGgxRysyQXE3ZUNXRG1XMXJ1dHhQQzVJSmFXc3VH?=
 =?utf-8?B?aWhTSm9NblhtK3l3aUlQU2VTSUNteHUxM1pNQndScTF6MlpHdGhjR2V1K0p4?=
 =?utf-8?B?NVpyeHJhMmlOMlBXVzJ4ZmRTdnV1ajNRVXZjWEhzR01lM3M2Tkw2R0JNd1Ja?=
 =?utf-8?B?R1VqWjhqeVJOTmhwaTZtU3pEWVQzMlc4bWhVanFEYzh4NHFSOHNUTXhJWU5k?=
 =?utf-8?B?SkpnZDFrVHpIL0tYYkltM3Y0cTd2VFBiUGJ5dCtyeTJubW0zdVNSK3J2Zm9X?=
 =?utf-8?B?RUw2SWQ4N3ZjMmVOWm9NRENSVGdjY0J5UG0zd2tuSmg0bXVwMGpvRGxUek11?=
 =?utf-8?B?V1ZXRzlNNzhIM20yd3VQS2Rpc0g1enY0MFNQajNaejBYRFMxVGhyZlEvMG8z?=
 =?utf-8?B?dEttNm9kTlpzWlNmdFpVZkhlUGxIeW4weEhtWnZ0YVVqNEZUazNhWXZHZ0M1?=
 =?utf-8?B?RWE1QXpJK081MUpPenNWbzFoU2QwdnFNT1hhVmFCaFRwak9PNXRERml4UC8y?=
 =?utf-8?B?VTd2b3R2bDl3ZWpXb29VVktRQkVrdFBQc0RXa1BIUnNMM2VtTlM0VnpvT04y?=
 =?utf-8?B?OVpOb0I5WStuSG1ISHdzSStDNnAzOEhGRE03bVJWMEFzVldTMlRZNU9CQWhn?=
 =?utf-8?B?YkxBVnE2Qnk0WUZVcVVyNWY2MUdKRXdmQmxIVnM3UW1DK2R1NHplRUVVVHl2?=
 =?utf-8?B?U1ZCdllhQTdETnd3TCt6L1lKNEV2WHJWQTRVa2JXNTRReHVkZ2cxRUx4Qjdq?=
 =?utf-8?B?R2pGRGJuaFlaMnNpazd2RzRZcWx2VEswSHNQM2h2YTZUNnY4WHI0U3Bzak9O?=
 =?utf-8?B?Y0VMQldNd01uUnEwV2dHU01TcUtFR1N0U3c0aTNQR0lvVzJRNWs5VEsvRHlR?=
 =?utf-8?B?VDdocDhKUkRmRlVheGZiWDhreVBKZFdPTXJvMk1xRGdHdGcwYUNOcWNaVkZQ?=
 =?utf-8?B?dkpVbXBmM05kdFhkaTZTdlRGZGQxTlRXeGVkUWFVWFU5M2JITDZwQlJtd1pp?=
 =?utf-8?B?cHVzWFlDSGQ3ZnZWSlVNcnMvbVpJTzNBUmFVbTl2SXdEdDlBdEIxUFg4alBw?=
 =?utf-8?B?V0p4SGU0NlFweUNUWDR0bkxzRzI5SjM3aUdFNkN6cTh6NnRYbEVlMkF0RWtF?=
 =?utf-8?B?Y3BQSCtzakphcUNsck1zOGVVRUpTSTlkWmU1Q2lESXkydVZma1pBUlZOMVFo?=
 =?utf-8?B?aCtjSWU5SW5kZGdvR1JrMVU4b1RXQm5mV0Q1YmpTdzNrME5NTVNmcWNTNDFU?=
 =?utf-8?B?bXpCbnpYSW5zMk9yWVNEMjVZM3pJVlJ5eVFpRktEYXJmdEJrQTgvZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1c962c-7777-4197-98ef-08df1f0cdd83
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:02.7621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmKokzKWfZZurYAcz9mnQEEX8sOQ4IUiB4bGSJousEBGWSk2asjB3nPhemJBlYZDmnjA1D7p3l2UEjtO2Q9l4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9345
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



On 2026-09-02 13:58, Melissa Wen wrote:
> On AMD drivers, a CRTC remains active only while its primary plane is
> enabled; therefore, handing the primary's fb over to a non-primary plane
> would take the CRTC down with it. Create a dedicated fb for each
> non-primary plane before testing its colorops and discard it again
> afterward, leaving the primary plane and its prepare_crtc() fb intact.
> This is groundwork for the next commit, which checks colorop properties
> on an active color pipeline.
> 

This patch confuses me a bit. You mention that amdgpu needs an
FB on primary planes for a crtc to be active, which makes sense.
But this patch then only deals with non-primary planes. Does
amdgpu have a need for (non-primary) planes to have an attached
FB before allowing a COLOR_PIPELINE?

Harry

> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
> 
> v2:
> - detach different changes from a single commit (Chaitanya)
> v3:
> - move hunk from next patch to fix mem leak (Alex H/Chaitanya)
> ---
>   tests/kms_properties.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 2b4cb152b..c55a271da 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -237,7 +237,7 @@ static void run_colorop_property_tests(igt_display_t *display,
>   				       igt_crtc_t *crtc, igt_output_t *output,
>   				       bool atomic)
>   {
> -	struct igt_fb fb;
> +	struct igt_fb fb, afb;
>   	igt_plane_t *plane;
>   	igt_colorop_t *colorop;
>   	int i;
> @@ -255,6 +255,18 @@ static void run_colorop_property_tests(igt_display_t *display,
>   			 igt_crtc_name(crtc), plane->index,
>   			 kmstest_plane_type_name(plane->type), output->name);
>   
> +		/* A non-primary plane needs an fb of its own: AMD keeps the
> +		 * CRTC active only while the primary plane is enabled.
> +		 */
> +		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
> +			drmModeModeInfo *mode = igt_output_get_mode(output);
> +
> +			igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
> +					      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &afb);
> +
> +			igt_plane_set_fb(plane, &afb);
> +		}
> +
>   		/* iterate over all color pipelines on plane */
>   		for (i = 0; i < plane->num_color_pipelines; ++i) {
>   			/* iterate over all colorops in pipeline*/
> @@ -272,6 +284,12 @@ static void run_colorop_property_tests(igt_display_t *display,
>   				colorop = igt_find_colorop(display, colorop_id);
>   			}
>   		}
> +
> +		/* only the fb created above needs to go away here */
> +		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
> +			igt_plane_set_fb(plane, NULL);
> +			igt_remove_fb(display->drm_fd, &afb);
> +		}
>   	}
>   
>   	cleanup_crtc(display, crtc, output,

