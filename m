Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E7BC61DD3
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 18:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36F610F717;
	Thu,  3 Sep 2026 18:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pTHMhVQ/";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010024.outbound.protection.outlook.com [52.101.85.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36ED10E173
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 18:29:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/ixAL0Q7QRs5NMrgg38mCnkCLaGvqow4l2i/Rt5EmhDJz4fG+SkSKBfPsHnxQ0YYXfWMYe7067zdB95XiDshjZRNXYLd5PiLn28eXuyCZxDh7cqgToV3cp4oEhiI30nOcdYVzcZDjtKbBjWsxHFE2VZRtUMDgw1jgM37QpgndndF3aZj24nermCYVFbBG45h5RXikV0epxVohmraD9wBgG0NYjqLgPc37F7PVghzEDxE+PAiI7vTIQkd/WIfflZpMEyZDIcn6wglOG6ZqG+nS9GIi+m2DSgs/9vgrKmAVdFVibDvyPDaHyN1n5KLhx4zZK6Hc94CiCcLVRLcHgFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1HCHo7cA+xlO4Qoeib6ecVbvStaImkrIqh1PjNVWuQ=;
 b=v6CZ44HJ9jMtfouhuGBHzyExUnfVP1aleU1XN7EDnOM4jnxCZqIMp3xlH1ic9MoOe44Jo8yx+cyfjir64Rd5T+KNc7Z4bDj3i04NJeRlaYMxOM1MtxRQA+mCz3IXPcGmWdOpsRns15oK0it/Vv1WKbchmtkuLqsAqwbuxlDBfStnEIm2WjYyPDWrNYk0vV4eqNs46ak4bQxGGVzAajYeeyR6zRR/EumXT5bHCqf8EMufetStVJ7Amom8W+1rhl+9HOD31Cz1iD8JKytjZpTK2yT1BH5Ih26AM6H/tG6g0lKh1bb+1mSNGyo/gaeqR86f8FOg/CF7wnNX7fpjlKGshw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1HCHo7cA+xlO4Qoeib6ecVbvStaImkrIqh1PjNVWuQ=;
 b=pTHMhVQ/V/XHo6MfY+bLwaMmtVWfHKseJd6Pv0paOa5IxbY23wfA79ZUBcIajqk+NpiVVIRztqCt7p7KCdtU3Bi+RZJh3jgGoozcTY3bm2kEFAuMQdj4K88D+kuLIrawrRbYSPNi3LqfmB8UTVXLSaoVVoFt/9vO73y10r5x3j4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA1PR12MB8222.namprd12.prod.outlook.com (2603:10b6:208:3f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 18:29:14 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 18:29:13 +0000
Message-ID: <09d35970-0397-45b2-8226-f4063fa5a942@amd.com>
Date: Thu, 3 Sep 2026 12:29:12 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t 1/2] tests/amdgpu/amd_dp_dsc: Do not disable DSC for high
 bw panels
To: George Zhang <george.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Fangzhi Zuo <jerry.zuo@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
References: <20260902155742.990457-1-george.zhang@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260902155742.990457-1-george.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0266.namprd04.prod.outlook.com
 (2603:10b6:303:88::31) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA1PR12MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd7ba04-cbde-4259-9a71-08df09e94141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8Xlk0vC57N1NRsiHYGyzLojMebGE+29wmroOIAqdEd2YrHVXdr3hr1AVP2uN2ycHUG82iiJ1bHAD3WYKOtvNm5pw3/UJDeTGhcuAhZ/eHejw5hWYWHzMPrlrT6CdGDudq2hcrczSVLRADGYw5Yj0NO+UHBbasCxucUCswgI/hz0MafT5QexQLmhQeXurXWDjaornRj3Ha6BvrxEeSfQ7mc5/KSGGzxGBSZorX7bIqRxsZ9XFCe6WKWw2Uix8R4m0xGH14lXUaUbYuL+idW4OCIMK/IvpCnBc//oPzR4Iwinq+gL3ivMIMusouPBrVnHSZDtWyrKsfuCdvmIJsxit1qkRljRHQXMSWlOvDVqk+1ogW0Owmdela5nJ0jyNtrO++/7TYQIe4W6H8O/iffK7SzvT3VUg3w4qFbaaGs0/1i5dBhr3SG/kv596tAnEEcm5xHLkvDWi4IU9NQPjN5tSqtE4+0iu+rGDpsEjQSyCr502zlfZgAnv6u7oVQd/hJRZ2Cw9MqD9FYRMxXtTwU7QtcSAS7G4COYAhmaV5qAzDZktC+qsZxtbwS7I85Lvj0gFJ91dPzAE4KNPezpsvezZRYgR8WDwix4oNNoQjB+gi89Zi+iSXYJZN92c8eVw4zbh4o5Hmzf2JiqushWsNe6BIwYCtJI3Im0Rp+pYmkARSso=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlgvbzFLcUJZUjRmREJtaW9jUGFVVVhmZ0Uyd2crTTlNYU0vV3o0ZWRkbjF6?=
 =?utf-8?B?MXNQRldvMDVONUJBalhXYklUVkJCSUhzdSsxUEZrKzNwYU9LMkpmRy9tMTlx?=
 =?utf-8?B?T0F1alhrbmIrb01hT0hlTk1xWGxwS0l1WjdzdzJWZGQySDgzNDNwMnNzTkx1?=
 =?utf-8?B?QzlLMDNxSTkzeVBkTDJUaDBZUG55aUVsb0lMZWg4blJDNW9VcmxBZk5XZWFS?=
 =?utf-8?B?Q1RWRUEwQndVdXA5TStzRmVpdFJqeEdFaHBhUlZSUHdHMXJybkNucmFqZkpp?=
 =?utf-8?B?c054TDlUS0lNYXNVK0JoSUpxUjJuZWQ2UytHQm5MM01BSXYzK3hVd2NBWngz?=
 =?utf-8?B?bWV1ejQwM2cxSFZ4SXBDanhYajRzaGFhalFNNHJsQ2RETVlFWW5DUE5iZWJq?=
 =?utf-8?B?bFJpQ3hzV1lnT1VTUWFYKzFER1BHRytqNXBPekx4SDZqd2FDa09LTFZxMFEw?=
 =?utf-8?B?eDN6a1dEaUorVUh5L3Z6QjAySmdpQnhZTlFnUS9YUi85RWsyTytWZHY2aHRn?=
 =?utf-8?B?RUNBZzhoLzNqRi9rZDlPMEFqcWJaRXlDY0k4MmYwQmRtUHVqQWhZZlVlZVBx?=
 =?utf-8?B?Uk9jTFl5ZmZwR0xKSlo1Y2d1QWwxV2VSM1ZqSVA0VmNwMjd4MzJiQTVhMmtJ?=
 =?utf-8?B?cFBKb1dYaXF6ejIrRnU5QUZIRE9IdVpGS0pmTXREQ09qKzBxVUN4d0gwMk8v?=
 =?utf-8?B?TElKUjRncHoydzNNMWtrZHFxL2xxdEI3Nis4YXZiMjZUODI1WDlXWiszR1Rj?=
 =?utf-8?B?QU8wSG45OHdVdWg1Y3E1Q2p3QUNxM05wd1psdTZpSVRZTWt3YkNBcFVTVDF2?=
 =?utf-8?B?dWNWUzVXU2dZeTUzazVvUW9XRncweGhzYXowQVVzNmxMaHV1ek5Kbk0xRnll?=
 =?utf-8?B?QkZsako0UEM0VTVEa2FlN2pveFRaSk5DbEdtRDl3dXNXM25oRWtGR1pzbXFD?=
 =?utf-8?B?SGZ6bW4yOEJXYm9mUG5STUo0TzVWT1Q3R2g4NGxKaGxHVHkwVW5BcDg4QUp6?=
 =?utf-8?B?OWJHTUlpNWpFeHVwOURZRGg1Y1NzTktRVXc0QXFqdWh2cHN4SXFkNS9jeHhr?=
 =?utf-8?B?blN3YTBLaUV6VVM5cEFDZEhyRC9yRnhLUDVuS0trTzlzQkxJM2JwbWhnWVpw?=
 =?utf-8?B?L3gycHRnUWpiMDl6bWNOQlRGMXVpNE9ZVkJvTHpDNVkwc1V2N2dKNnJrRlhR?=
 =?utf-8?B?Tk9DdGVNMW44SjFFUU5OVXR2cVJhZ0xyQTlENUZSTmQrQzNEZ3JMS2hOUXoz?=
 =?utf-8?B?SmNJakNhaytmTW1RZnVVaTlkZ0ptYnk5L1U0aU41azZvdzBLVHVQZ0VvQXBC?=
 =?utf-8?B?Mis0ekxCWjJpeFNRWXMrNUs2eFAvSUxIWDRObFVOdlFkVmJ4K1Zya2k1cmJj?=
 =?utf-8?B?T0tlQThEcTNqblpPR1MwdGt1eVJlMlN5SURRdys1Wkd4MmQxblZDNHh2ays0?=
 =?utf-8?B?Yno1ZE53NlRORSs0OC9wWjYwdXNLWlJISFZiTzhYS0UreTlDTjJIZ3ZEN1Ns?=
 =?utf-8?B?VXFDOVRoWE43eGxZZ2ZaTktWdCs2OHAzUmtaWVlHT0p1aTU4eG4yWXlsUzNH?=
 =?utf-8?B?SnhDR1g4d29lUmxhY0ZSVG44NGFZZHdIdU90QjNTS1V4QkRwOGFNNk05cW1t?=
 =?utf-8?B?N1ZILzN2S003U0FyUFZvQmFGaHFnaElLU2M1Wi9mbFY1M04renQ2cmcwSkdu?=
 =?utf-8?B?L3Q0MjJKem9hSkRsZ0xHdWNadTU5M2tYcUo1Yk1aQkZ0ZmpyNEU4RHRVWHFr?=
 =?utf-8?B?eTZPRGdUT0d5ZmFNbFZZZ2wwMi9DV2dCTzZ6NnB3V1RvZngwcDB6bHhybW11?=
 =?utf-8?B?SWZobkhCVXQ5bG9iTGVWRi9QMEZMMFprcXo1UDZqSVlVU3pXVTViYUlFSzhF?=
 =?utf-8?B?VmcwWWV5RTRJVmc3Q3dkaEhwLy9nbUlkZ1FzYzl4MFVJWDNQVzl4YWs3QVdY?=
 =?utf-8?B?RlRsR0c0aGJ1NmhjMUVSV0tNRzd0MDlPMVBzNk9zTHZrS0ZhUjU3dDRHSmxv?=
 =?utf-8?B?VVZDSklqZVZPaDJ2ZlJDZ0RhbFVaUTZjV01vb1E0ZDU1M1JFRHNTL2NCMFA2?=
 =?utf-8?B?MEM3bHRJZm1wTVBOR1h5NnFzSzNERWtWWksxZmZNV2R6UkZGdTdkUDN3aXN2?=
 =?utf-8?B?d1NUNEdMQThYeFY4NC9zdUpzRHorMzd6MjBRUTMrRk1HWStXc21SYlRvOHZL?=
 =?utf-8?B?VnRMUFVmc3JZT0hZZS8yajljT2U3amtzOG1BNjlGVTg0NnhpVUd0QWdTRjFH?=
 =?utf-8?B?Z25KS00rSXZsU0xlYXg4QjRYRklwUEFueXZlNkovMzlqVEF2MjV1TU53OFkw?=
 =?utf-8?Q?dDhOt5YVm8Q1TwnSJO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd7ba04-cbde-4259-9a71-08df09e94141
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 18:29:13.8723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRdke3KRnCcC2yqZLQ8uHUlyvUFP6+99qTlvZI4sHUu0BiyhlyVaPYJKjikZS4AipFo+6hX0ut/Wie5sc9QoCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8222
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



On 9/2/26 09:57, George Zhang wrote:
> The test previously attempted to disable DSC even on high bandwidth
> panels. This would erroneously fail the dsc_enable test even though DSC
> is on.
> 
> Fix this by checking what mode the panel defaults to when set to
> automatic. If DSC is on, then do not attempt to force it off later.

Doesn't high bandwidth panel need DSC off? How is a high bandwidth panel 
expected to behave?

> 
> Signed-off-by: George Zhang <george.zhang@amd.com>
> ---
>   tests/amdgpu/amd_dp_dsc.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index dc71e903e..ccaf64c66 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -137,6 +137,9 @@ static void test_dsc_enable(data_t *data)
>   		igt_output_set_crtc(output,
>   				    crtc);
>   		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
> +
> +		/* Make sure we are in automatic mode before we start*/
Add a space after start, i.e., "start */"

> +		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> 
>   		test_conn_cnt++;
> @@ -154,7 +157,9 @@ static void test_dsc_enable(data_t *data)
>   		dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
> 
>   		/* Revert DSC to automatic state */
> -		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
> +		if (!dsc_before)
> +			/* We can only force off if the panel allows it. If DSC was on in automatic mode, we cannot force it off. */
Break this one-line comment to multiple lines, and place it before "if 
(!dsc_before)"

> +			igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
> 
>   		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> @@ -286,6 +291,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
>   		igt_output_set_crtc(output,
>   				    crtc);
>   		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
> +		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> 
>   		test_conn_cnt++;
> @@ -317,7 +323,8 @@ static void test_dsc_slice_dimensions_change(data_t *data)
>   		}
> 
>   		/* Force disable DSC */
Please update this comment too.

> -		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
> +		if (!dsc_before)
> +			igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
> 
>   		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> --
> 2.55.0

