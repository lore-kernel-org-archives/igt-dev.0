Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0683CC02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 15:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8978810E588;
	Mon, 10 Feb 2025 15:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p4kYujQI";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAF910E099
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 15:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQLyGa/rv94gRMOXBU2Tn0jlrtxu/R8wZWf2gRwD0omAnJMkVfIMhqiDoZemlDaSel7zI+JLlcOtZVRDSox87EubkaXE1jjIrfoZw2IgfbmTu9hmEni4sNCPR6XlZBCcsdixmseR4xFo/F66qXffhfcNjjo3pFfEaBpv3dbomBbBqEEbtLH3A5i/FmAGCboKmg17Q4VVXqh+gnmVAtwNBlQ+Q6XhG2Ey00m9UhTY1L9DTiKo7lY3lZu9gE00STiWLUvPuGZu7URhcD8zv635bNcXMsbEilL5zMQb4Z0BeR3yO7kMDdXmmNBD8nAEN+0Z/f3zH6M774mFUmpiLTuT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUK0ahuNec32itD4+vwLVdWqCMkf49EZ2ndL7N3pvbA=;
 b=TxJv0hbeflWJz74rmEQlu27zdZ30TP1w+KQROlDOdYPMLWOU0YoqIopvu6A7aaUj4HZDP+Vj+XXTEdhMPeAwffsxaV4a0xXNnAB1HoK6z6cShiWHP3yTDixrjQ2OnZQeD07cKOloL4lV22Wy9+Z6G/adR300VoFlry3JqELEeM9et/hWdmClx+cvPLNAAGx5t0BO4uOqlJbOfuvHajhZMVBaVUBlnRK+2H/mIITiJZH4YR6H9NLB6srgqIJtzpOVF75PrxzinA0DDB5XA3Jb7ck1Bgk9q4vRrFbqZQfXiTC9X8WyIYfAjm3MJAL1VWuL3ZHPBN66LcWroCOunnTcig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUK0ahuNec32itD4+vwLVdWqCMkf49EZ2ndL7N3pvbA=;
 b=p4kYujQIi+1vUW9s55H75v1Yag+FW/8OoXSgsg6WSc1aZQr2oLhy2DrsKOH4Dxmfio8gkTCT/jUH55XkBeQZUbdCjRUXe3rWAN9WpfeLZ3mgQrjk11PuwB/INFRQ8IgzAMAWyj+K3qekjdBQJTZMF8CYMx1eSQmcWCBZ8AlR6mk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.16; Mon, 10 Feb 2025 15:11:46 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%7]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 15:11:45 +0000
Message-ID: <abf8b026-20b6-4566-9823-bb558deb97a7@amd.com>
Date: Mon, 10 Feb 2025 10:11:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Reduce debug loglevel
 dynamically
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
References: <20250128052825.424586-1-pranay.samala@intel.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20250128052825.424586-1-pranay.samala@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0126.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::14) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc96e64-7cdd-45c8-d8d4-08dd49e53bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2ZWY1lWeTlSSjdZTm8yYUFOT0dZanBqUGN3SDVidnRncTYvcnFrelJlaDdY?=
 =?utf-8?B?c3I4L3JtQkk1MU8vcmZnNG1MM1E4ZTk5eEZqUjRyTE54d2hucU80Zm03RFFU?=
 =?utf-8?B?NTd4QVh4U0Z5NU9UT2VkRkZMMHgwS1VXYk8zaGhRZ1A3YlNyOUZuamFrVTIr?=
 =?utf-8?B?MGpBbCs0TzNpZEQxcUFOZXNmWG03a2tpdDM3RGpLdkJoMTVEaFRsTmsyZkk4?=
 =?utf-8?B?SFE0ZVBXM0lXL2EzTElCOXNzK0dXUjlET3NIN0FLTWlkRWFQN1RZWElYNTRa?=
 =?utf-8?B?OC9qZjArWEgzRlNWWkNuRXE3Tkt4cWRoWXBVZDVOSmJ5SHVydUdJekRDdWky?=
 =?utf-8?B?S3dkV0UydkRsTnd5bmUwY3JDYktVVUZmSDhWVy8zVGdVTURNTkNZZ2RxejZz?=
 =?utf-8?B?aHp1Tm5SU2twemZTY2QrVmJNRlI2eGtKdHNmb1NFbU1YUklmN29nTVNlUGgy?=
 =?utf-8?B?WDRBUkhCZFYvUkoyZGp1eDQ4SzBEOVZvZGlWSWd3M0FsZWJOVXEzQkZmYTBt?=
 =?utf-8?B?ZXZ2THEzNEkxYWN0QzdaNWwzVGlBT1I0QmZ5WHJ2MS9QUkp0NW9LaEJUYzRY?=
 =?utf-8?B?ZEU4dDBPVnYwY1VmQjdNejlXTUpVQk0yL2Z0NmVrazk0YkZrU1BqTi9CTzlT?=
 =?utf-8?B?bWpkRXg4bUZ0T0VnVWN6RURxUTZnTG1FZmNqRUpJL0l4QnBrd1ZhY3ZUb1VL?=
 =?utf-8?B?cWhqUnl5R3ZTYkZieVVOUGladjU3Z3lnd3ZwUlpwbVQzbUY4Tks5OC9GZjEx?=
 =?utf-8?B?ZkNJQlp3NW1HVTBYNlRpc0I4cFNiY1dZUjJiTDYxSnF0amtRUmprTEZlMTVF?=
 =?utf-8?B?YkRMTFhNQnFXREJZZUJoVWxHZC93Zis5RTc3M0NMaVdlWTQ2WmZJV2ExQmQ5?=
 =?utf-8?B?bTU4TnpzYVI2SjVNYWxhQ281Y2xkbmJjZit4cjZac0FNNjlwOTRZdGlBTSt5?=
 =?utf-8?B?WVowVncyR1BGbVY0VkVZZGs5OVQrSmlEYzJnb2JTV1YwcHdFUnNEL2dtY0Ry?=
 =?utf-8?B?aXZ3NDBnZlFUUDVEVUYrSjl2MWZXS3h5Q1F3bTZWTEw0Vk41NmpLZVJtMERl?=
 =?utf-8?B?V3RzaDlSNTRORUJjMkVOWlB2aGtRZkNUOWV5Rk9HTnZ5UVhtT2o3N3FVRXd4?=
 =?utf-8?B?bCt1Y1M0N1FoanZ1SmNmak1LTjdUTE5HNkorc2JUQ2xLSWN4YmxLdW41TnJL?=
 =?utf-8?B?UGlKcS9KS1owOGNyS3hTR1c4UGJhRHdQamNKQkl0Nm5EZk93VjlWbEpEUXJW?=
 =?utf-8?B?SCtpT21TY09FNjlKK0RtM0wwT1NXZEJtcmdodW9ieHB6SElPUkVtTE5HYjVv?=
 =?utf-8?B?dFpoMVJHSG5TWXlLRStTcG1sdUpvS0Jvc20zdkg3WkxkZ1ZNRnRDS0xod0dp?=
 =?utf-8?B?ZWUxM0pnUEQxd0Q2VVp2TUZqK1BaQTBOeENvQlBwcnp1NzNCWWRPSEpxamNW?=
 =?utf-8?B?OC9XTy9NbFB4MHdaWmxOM05FOGR6VlMyUmhyNHFZYWFLaGxGWjR3WnlrMElh?=
 =?utf-8?B?MUV0dCtTU0EyaEJvbkVSZGIzOW9zWHVscXdpcGw0ajZJTGg3dThwQkx5aUJM?=
 =?utf-8?B?enZTWllZZlVQaVVRVjNVZ1BFWFc3ZUdBK05SWTB0Y21NVVk3anJkQWp1TXZR?=
 =?utf-8?B?TkI0WnlRYzVnRUI4WmNlK05rQ21EU2h6TFdnbS9yY1M2SHFBNE5zcm5mbnB6?=
 =?utf-8?B?Vm56Z2NibGRqK1RyTnJrZUNvR3IxaURPY21RWnhkdE1yK05VV3ZSWk12WXNx?=
 =?utf-8?B?QWhONk9OKzI3bnN1by9oV1h3WW5oQ2JOMFFWVWZLM05yMnY1MzlQZU4wRlp2?=
 =?utf-8?B?TFhRVTZTTElac21XcnM4Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzJ4MklYWUxXRXpQaVg4bWVTTFkzTXBzMlp0eXI5Q2pHcVRDa0NEUGFYWk5N?=
 =?utf-8?B?L3pRODBDM0FIZFNjdGhHQ2Z3VkN3aXV3aWdJNm04ZXB3NEVyWGxYeUV1R3Az?=
 =?utf-8?B?UlJsMmFIUDVrZlZkcDc3T1dHcHJsYlFhcVRabE10Ri9mTVdHUW54NVpPZUMw?=
 =?utf-8?B?ZnU5bWZUeWRsbWJ5QXRSL3dxSk16M2IrVXFHNVZhUXN5QmZrOEFrcjhDVk9T?=
 =?utf-8?B?ZTZvbm1DRDhhcFp5YzlNODJHOFBiNnJycEhsV2JsQkpvbm5PcHdEVS9HMG10?=
 =?utf-8?B?clFrYUZQVm1BOG83bVQrTUx3dGJKblZjYldXd0tvQjRxZC9EMTZUSjlHRFlL?=
 =?utf-8?B?c2hBNHhpSlZXeWtGb2RPdXRlODBrQ3RPZ3JscWdnOHRzZk1HT0w5M1lmeC9n?=
 =?utf-8?B?RnRERHRDZGhlNWFBdGdHYkxOQ1pQZGxyclRORmY5c2hIRVBjSWtJUFVlcjYv?=
 =?utf-8?B?MWgrY1pMMVhGTjJnVjZteHl1MDlUMkdMQzA0ZFZsRm14Q0JKWE1vOUtxNmJR?=
 =?utf-8?B?bGFwTmZWVm8wK2E5aEx4ZEFsckxIWlRrUmc5M25BL1Y0N1NEekdmMCtHYnhq?=
 =?utf-8?B?cnNkK0drQkNTM3hEMDBpZERFSU5uY1hSTFl1NE5NbFdGY2ZKb1Y3RmVXNGlW?=
 =?utf-8?B?WGt5bUtuWWlpYVQ0V2tLZGxMNmNuV3J4RDAxc0hhT3BnUjZsQXlEODR6MS9p?=
 =?utf-8?B?NDhmRVR5NUY1Tmx2alA1dW1EY1Q4S29ESlU1bjRwdU9OOEJteHY3M0RJTW8y?=
 =?utf-8?B?WkpWeDdlUmx0QS9BaDlqb01Oa1RHalpuSFVZU05tVlZzajRCaWxmemROa09a?=
 =?utf-8?B?VHpEWmpYcGdkeEc2bitvUkkrZm13ZDRTL1QvQnFndVo5STUyWXJXOUFmOG1Q?=
 =?utf-8?B?bUhZdDVzWWpoQUtPSlU1YlV1M0t0RjJGcGoyWkVwREdyVGFoVTV2blQ2ZXlj?=
 =?utf-8?B?WTVIWEs1Z2Jmdmt3UkZhTmRyWEdYbUhTejJKSjBKUjRCdzN3SHZuRTh2WkVN?=
 =?utf-8?B?REw0TFRMRGdwQStDOGlIVGRtMU5vZjh4TVI4S1R0YUdIOVhibmw0RFRRQnM0?=
 =?utf-8?B?VGE0RWVzNmtFTTBUcG9QeFE5bjBqTXovUTlVb1VUNVVIcFNSUERjNDRPT0tO?=
 =?utf-8?B?MFVFUk9kazg5TFlTak9Xa3drcXpybktieTB3M0Ria1VuR2RpMjc0UUh1MXRw?=
 =?utf-8?B?RzZLWHB6MXpXaG05RG9jMUo0ZzIwWjJKZEp4NGhBYkJ1ZFhQbjNaN29DVkxD?=
 =?utf-8?B?d2M2YTVDTkFvdjR3bm9TUDVxQnQ5R1hETjYxK3MxVDlnR0x5Q0xJNkRCTFZt?=
 =?utf-8?B?TXNTY2ZobmZEeThtb3M3a2wxbDBhaC81OEt5MHl3dkc4dFQvcEhXQU9YZTZn?=
 =?utf-8?B?K3pjaENwSGJ6MXYzaHNYZGxQYnFqZkJwOG91Ymc1cUJPUlRFOWlCSE92N1Jv?=
 =?utf-8?B?ajBSSkdMR1pzS2lGWEpFMktrRnFsTzZQMm51N2xHR3h3TWdsNVI3Y2d3Ykk1?=
 =?utf-8?B?LzNyNVo4dEZTRHNyQW5TSjBMVFlrdWpoR0JrUFJhektBdzVHQXlTcWQxZkd2?=
 =?utf-8?B?UzJDSmp6L3gyRmVKWlVUQlZFY2NhRlBOd3EwQUxadlBzaE10OVFRREpiSHVM?=
 =?utf-8?B?TUcvbFErekZ4RFJlZ1psQk91SldpVHIvbkpXSHRsSzJ3MW4rVHgvN2hmc3cv?=
 =?utf-8?B?THZrYk9LL3dTalBZM01aUkxpV29ZNDBYQXdsRFdhOVlCU3BSWEZtRDhSM0Fp?=
 =?utf-8?B?dHQwbVVlYzRtdWl3SHZSdGpTdStpaVhLV0xpcGZYWURTQnpmVGc0T1N5bHZD?=
 =?utf-8?B?d3BTbTNWQ3ZKTGxmV2xqV1RhQlQyQ0Jydkd4WDNDcFJxcFRONWhQMzdNOTMy?=
 =?utf-8?B?Y0pyZ0xlOStxaitsRysyS2lOSStKalhqKzVublZ6VUlON3MxanphYkRsNEdm?=
 =?utf-8?B?Z3VOMHI4SVVrMWFGREI2aUNRUjZyazR5cmtlV1NZWWVoVHpWMG5Jc0FUV0du?=
 =?utf-8?B?K1BlNHlEdlVPNXNCV2JPZURHY3JUR3NuVU9oTVphbm1mZHQ1eDhFekpLQTlw?=
 =?utf-8?B?RW9uS3pCb3ljYnBseGY1WnlVb1BHdEwwaFJlL1NlOUVYNzBoZzhkOFdrd1VG?=
 =?utf-8?Q?DtMY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc96e64-7cdd-45c8-d8d4-08dd49e53bc8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 15:11:45.8714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+Pamz2HC01iDc6IJ/9hCn906/AarnxMg7wXpj5hwsZvISdMTjiFwV/mLbxJv2hS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943
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

Hi Pranay,

This change can also increase log verbosity; we observe this with amdgpu.
Details inline.

On 2025-01-28 00:28, Pranay Samala wrote:
> This test is getting killed due to exceeding disk usage
> limit on CI environment because its logging to many logs.
> 
> So dynamically reducing the debug log level to 10.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_cursor_legacy.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 1f082df2d..533972cd4 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -40,6 +40,7 @@
>   #include "igt_psr.h"
>   #include "igt_rand.h"
>   #include "igt_stats.h"
> +#include "igt_sysfs.h"
>   
>   /**
>    * SUBTEST: %s-%s
> @@ -1840,6 +1841,7 @@ igt_main
>   	};
>   
>   	igt_fixture {
> +		int dir, current_log_level;
>   		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   		kmstest_set_vt_graphics_mode();
>   
> @@ -1850,6 +1852,15 @@ igt_main
>   		 * fetch is enabled, so switching PSR1 for this whole test.
>   		 */
>   		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
> +
> +		dir = igt_sysfs_drm_module_params_open();
> +		if (dir >= 0) {
> +			current_log_level = igt_drm_debug_level_get(dir);
> +			close(dir);
> +
> +			if (current_log_level > 10)
> +				igt_drm_debug_level_update(10);

Isn't the DRM debug mask a bitmask?
https://elixir.bootlin.com/linux/v6.13.1/source/include/drm/drm_print.h#L97

So setting 10 isn't guaranteed to reduce verbosity, depending on how the DRM
driver uses the various drm_* debug prints.

What is guaranteed to reduce verbosity is to unset unwanted bits. Maybe that is
the better approach?

For example, instead of
`if (current_log_level > 10)`,

Do

`igt_drm_debug_level_update(current_log_level & !(DRM_UT_CORE | ...);`

Thanks,
Leo

> +		}
>   	}
>   
>   	igt_describe("Test checks how many cursor updates we can fit between vblanks "

