Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE8DC624D7
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 20:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88F910E538;
	Thu,  3 Sep 2026 20:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f/Z5v5Iv";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012017.outbound.protection.outlook.com
 [40.93.195.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF37910E538
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 20:51:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gg3HxN7iGbvt3ojKXF5KI36yFk9Iz5WdqLkEw40VAZdiZXBKgAhi8eA8GE9oCF2d9o3nd7XvfcYfUeX1oLguzTpE8MszXendmV3OnD975lbO2URnZWHkitt3DtZmvJI0JIVdLLrKQcMRmiOr7U2azKM8OwuMgp0xs/9pinepuEwCLIXATIQMfCGplmEKDndyl9ATMuyIcWiApgAmKwzl8TFa2VTgLt8fWF1uhnF/C8pCWNlu+JVcDcaNQHIV+qmCMSlj4ux4F3qHBEdDQdwLfPqyZqHp2QOTKwi9BfFF6PqICZbyIPdhqQfvoBT6wfq4pndoh2P5s1omKTTuL8/ffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Y1jzDKVWGKoaqrTc8Dk8/RAAWHxFb/VROvl+WOSnSE=;
 b=aRdOzryiobWU4XISKZrmsoR0FuatNL4L4zERWfx2nkBF4S3CYFb3dYJDGgt+JBPBF4sheSO+/sfvBP1QSvc8tb8JiMwLBCvLyghpoZHLfjb2eV2uuepsmi1XMYRS8hIC2FXnnXpk6pOQIly0TNI+lG7VzJQthrPnL4lHfH8dR5rAKpi67lOdUomBphzMpy4kdyI4tBGFHC2JFjgkboOrLvNHUjeNbZDbtktnNH6K8UhfsRqACaa41almh37k5wSU0TDRJ565HdFcqO48U/agEgq+VlpNMKlN4ogdgYnjET+sDnczS6uiO01mxRkzHdISSp1BQwQffvwBNUR4o1q1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Y1jzDKVWGKoaqrTc8Dk8/RAAWHxFb/VROvl+WOSnSE=;
 b=f/Z5v5IvMmdRUmVa0j/gBifqlFR3p8UvUctm0i6aqMumCe8pnTGte/xZzQdIH4y/X3JieX+uTdd5jJmBkJ/pmDC2NLceAocFVaCVDMIPPgIc16fTzsd2qYdYd4z9tgE3TLRBJ3vOuZgxti/m1CIb+UQTY2NntqG7gMmlwphGQ74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS0PR12MB8042.namprd12.prod.outlook.com (2603:10b6:8:141::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 20:50:58 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 20:50:58 +0000
Message-ID: <dc1403aa-05fb-42fd-bc09-4f322c25f5b0@amd.com>
Date: Thu, 3 Sep 2026 14:50:56 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v2 1/2] tests/amdgpu/amd_dp_dsc: Do not disable DSC for
 high bw panels
To: George Zhang <george.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Fangzhi Zuo <jerry.zuo@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
References: <20260903192458.1149302-1-george.zhang@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260903192458.1149302-1-george.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:303:b9::11) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS0PR12MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 8553e1b5-6297-4686-4def-08df09fd0e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|3023799007|10067099003|5023799004|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: uBryr8eisgEt/4WjKyy1HKLOfgW44qgCm12YCifbNa8MnXKaAPa0IVdGwjYR8CKMnvHHLcqmXBkV/Il6Iswf7sQv/baw/MtjBsELvtTkYJUtB3laQOnQYB1FG0vulMEbzUZmg3XIuPeEPw5ksqnK+MFQn2+xlQDZpLgeLYeKCn00Y6KhVq/xJfDoK9nEc1TUdtpMXQ1WLmeKKGZJkrd4VkA8sj28gFaJWhy3tDS4x4q62fWaGsj4D+MQ8RoNWvi/JUfs4ncXYfru5S3oRv4ey3alwlqhYLPLtYP5eKpxkG1aIyfxi5ar1P1x8zkEVpwOaMMn7Lmjcq+mge8/qHyDcFAmTUoc4Pvaqd6fqjpOcWnN68TZ0VscU+kZOmr7N0JLBAA+PyAbtFSzM2CRB5+DxhqjlawY2KPC0IkOLC2/RfpZPDkJ7opIv+PIDobMfLggmi/+Y25CenR1qnDkk9JWsaYcPyPA+2Cndwp8FdMHQs+LApdBFVUwr40l/7dfJSCAI9vJvSr11bABo+vVYtHpKAKuadISW/QM2LcGr1OL5GQYTCerIN6WnEwgo7jjkJVSqGZoPpbwU3F7yBXROaiXqdborSYVrGw/EJ1M0R9x2m4qRwA9aYtTret172rS3UaMH6My70yPfp4jhyu4lhbJhndJVpGn03zEkDVb3HrXyoU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(3023799007)(10067099003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTh5bVRrVWVnclh3RUsyazFTV2pXVmI0QStFOUxkaGRKblY3UUlwTUVpdFhT?=
 =?utf-8?B?TSsxdjFxdCtDa0dCTzRvQkhoRFp3R2pxTWx2U2Y0YjUrTEFDR2x5YVJTN0lN?=
 =?utf-8?B?SGI3aC8vZGpuTmJha1cvaWhXQVhoaUJmOE5DcVlrVzByYVNTZ2hsVUpKL01l?=
 =?utf-8?B?Q243aXJDaHVsUlZUdEJwdk1PeDBXOWZ1WVlHOGh3N2J4MGdOR1ZRUi9RQlow?=
 =?utf-8?B?QkNDc1c3enRDSDZ1emNOazhEdTZZajI3UnBFaFdmOVMreUdscnhWMHNuWDR5?=
 =?utf-8?B?dVIzMWNCYUZqcDd5b0IzZXg1VThaWG9rM0oyRUl3MGZoM1oxMWNBNmJGUjZ2?=
 =?utf-8?B?YmErazFQVkg0SjlnVm4yQU9ZM2lGNkoyQmNiRjV0U05MT2F6NHBvWUprQnIz?=
 =?utf-8?B?LzluQ3dwNzdyVnJSRnRESzZoRTBiLzlUN2ZOT2I4dVVkZE5zbjdVdjgwT0ZT?=
 =?utf-8?B?d2EvamtkNEd5ZEZCM0lXVVFqSE96K0k3d0hqNnpBOCtwNE14MTcrWUZjS1ln?=
 =?utf-8?B?UFFYdHJBOWlYd01zWnp4SkVkSnJzN3p4OGVFbC9FRjFWTTdnU0xLOHFLOTM5?=
 =?utf-8?B?UVJPb2hjSHl1dGo0cGhmQXlicy9WL0k1cUNsQ0dBQ2FUUElKUHBZNnNkZE52?=
 =?utf-8?B?UmRVWmlwd0VhbWp4ZWxCeVZNbDJyR2loaGFabFFLalFvYS80d0MyUm9ySHdi?=
 =?utf-8?B?MUJhaXN3WVgxbWNaTlJuakZ3VmpVMlYxWDJ4L0Q1eDYvNnFScVNCdWsxUFpt?=
 =?utf-8?B?d2ViR1RqaEdVZmlIc0plVjhkazFZeVovZ1Zaa0I2YTYxMUJKODYzekhTUko3?=
 =?utf-8?B?dWU3Nm1sZGMzL2V5WGg0WWZ5N1ZQOEdxM2NwWDIvdTNsTEZhVUI2R0xYaU5Y?=
 =?utf-8?B?bWtOY3ZOUURGU3k4NU50T0VoZUFuUTNPTzNqMzh3WFRCOTYzOHdWR2VkZnVZ?=
 =?utf-8?B?TkhVQUdtK2pxSUloNlAybzMxYVFxU3d6MGRjb0E3NHdVTEhEb2Q3OTFyT2tC?=
 =?utf-8?B?WGNKa3UzL2VacnAwNGpwYlExL3NvSHZtRU5vVWpDWERFcFhtY1F1cnFEdVQ4?=
 =?utf-8?B?ek43L1FnOEUvU2ZOd2dpUVdMUEp4Sm13akU0aHc5ZDlhaHhwR2RWdUM4SVVl?=
 =?utf-8?B?ZElaTURZbkFONDc1QkMrQ0ZVZmRGVERBenViNW1VRmFLYXY1UW9yRWJRQUlv?=
 =?utf-8?B?MktweGRBNVB5M3VUWWYrSGhIWVE5V1pVL3NXRlFmN2VkMFJuUDR6azRudjRC?=
 =?utf-8?B?dUJUQXpFVnVNcFR2RmFwSjFERDRVZWlXaEUzMzFyVWZCK1RZZWVlREtSazdF?=
 =?utf-8?B?Wmhnc20wOGFUT2lKeWVKZC83U0NWd1haVFhtWTJtQzVxcVBxMUw3UnEya0NC?=
 =?utf-8?B?ME90UVN2OUpWb1FCdTV0WksycU5sdGdZNTlENmFJbkNYS05pNFVnQktjVHBO?=
 =?utf-8?B?OVJkWU1RVDVsVkNOanA2Y2tlVThuK0UrdXpRQ0k4NVFhY1lKNUUvUDQzYS9w?=
 =?utf-8?B?aTBKTXFVbk9LRXRjM2ZzdjNRdkVZelhkM25hdm9uU3c4NnVDNTFsV0ltbTkz?=
 =?utf-8?B?K05yWm53NDhSVEVsL1FtOUxTVE9OMnNvT1FrYUV2MGMvMnNSZGlLc1AvY0ZU?=
 =?utf-8?B?eEkyMGpmY3c0c1RqcW9JaW9jcjZrMHBQVUk3b2pHbHJ0dFVTaUp6ODgxSDR5?=
 =?utf-8?B?MzUwRUJnVVBCa1RMMjhrVkJCaWp2cS83TkFWM0VnY0R1c3ZWd2RzL3cvSDVB?=
 =?utf-8?B?VnU0N0Y5WGUxckxBZmlrUzZPTmphQnpPMlFib1cvOXM0TlVJQzhqeUhQbUhB?=
 =?utf-8?B?c3BPQjdQNjlzY0d2QVBOT0YxZ3VpZjJxTkdkRzJhT2RGL1RVSCtJRG5GbnRj?=
 =?utf-8?B?VmZtb3I1UXE3akFOKzhpRUxnQ3JXUVZZaVlWN1BsM2cwMk5VMmN5TUorT0R3?=
 =?utf-8?B?Qmg2Y2dsbCt3aE1xa2lPTW5ZU0J3SUErbWNhWUN0Z2FyYm9Vam1sQTlndG5m?=
 =?utf-8?B?RzNiRU9jVC9IcjFDWlJ5Tkc0WXpMTUVML0pMMzQxZFFLL0NaOGVZSW5rWmVS?=
 =?utf-8?B?cVdOTkJDOHV0b2p0ZUViQlJWU1M0MTF1TmVrc3ltQmJlS1RNNkRQTXVjZmxk?=
 =?utf-8?B?ZXNHajJSV3N6N3FCeitpUTg5ejY0K1R4aDdZRTJDU3VMKzFmbVdPTTZIbFZ3?=
 =?utf-8?B?aWJrdkhRQ3N6SS9LSVZ2TkI2aEptOVRyd2M0QlYvdWRVOE5pa2pVTkgyb2VK?=
 =?utf-8?B?enZUdndLcVJxOVpUanVTdkZ0V1EwL0tTMWMrK2Z1RXU0V0Z6R0VIM3o2anFo?=
 =?utf-8?Q?Gt3yVOHi62JC6aqcfW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8553e1b5-6297-4686-4def-08df09fd0e1d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 20:50:58.0191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLi0t4k4jyftoIJ/0NDGmIMX6O0Cv9CUYQfmbUnx6HLEmAgERpdsEVVZ7ft8RpNSKFeUl+Jo7hJVppZD5MbffA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8042
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 9/3/26 13:24, George Zhang wrote:
> The test previously attempted to disable DSC even on high bandwidth
> panels. This would erroneously fail the dsc_enable test even though DSC
> is on.
> 
> Fix this by checking what mode the panel defaults to when set to
> automatic. If DSC is on, then do not attempt to force it off later.
> 
> Signed-off-by: George Zhang <george.zhang@amd.com>
> ---
>   tests/amdgpu/amd_dp_dsc.c | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index dc71e903e..690a6c39d 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -137,6 +137,9 @@ static void test_dsc_enable(data_t *data)
>   		igt_output_set_crtc(output,
>   				    crtc);
>   		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
> +
> +		/* Make sure we are in automatic mode before we start */
> +		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>   
>   		test_conn_cnt++;
> @@ -153,8 +156,12 @@ static void test_dsc_enable(data_t *data)
>   		/* Check if DSC is enabled */
>   		dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
>   
> -		/* Revert DSC to automatic state */
> -		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
> +		/**
> +		 * We can only force off if the panel is capable of running with DSC disabled.
> +		 * If DSC was ON in automatic mode, we cannot (and should not) force it OFF.
> +		 */
> +		if (!dsc_before)
> +			igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
>   
>   		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> @@ -286,6 +293,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
>   		igt_output_set_crtc(output,
>   				    crtc);
>   		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
> +		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>   
>   		test_conn_cnt++;
> @@ -316,8 +324,12 @@ static void test_dsc_slice_dimensions_change(data_t *data)
>   							     ref_fb);
>   		}
>   
> -		/* Force disable DSC */
> -		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
> +		/**
> +		 * We can only force off if the panel is capable of running with DSC disabled.
> +		 * If DSC was ON in automatic mode, we cannot (and should not) force it OFF.
> +		 */
> +		if (!dsc_before)
> +			igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
>   
>   		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);

