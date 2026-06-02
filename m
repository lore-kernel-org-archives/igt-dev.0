Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8A9CD6E4A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 05:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CA8113876;
	Tue,  2 Jun 2026 05:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZi7gKKv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F62113869
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 05:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780379467; x=1811915467;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DIvyNVgYKzo4SLUyVvcXxLorz8GvMnwi1eg8jIUbmjg=;
 b=MZi7gKKvO0Wv0WSvm8gr0xFlq4/pL24ZBGpPEw3Lvfp9R4ArxSLqrkce
 klQe7DkaqnSA1b0T3eGnrHMc9FWvqgDWYYv2fZFU2BRtMg8fHIIJHqzQA
 m8AfJx3Mm7JJ82ZNl9Jk1hsczrDuZ+b/JbFf5kuFUNgwjpHh2OgxDbjQ/
 9ljaDJ83lVhRGpAo92RpX5REEBUHfrOg5fNPa/S1AkU2Q5OhMGUBRl8k0
 dqAichokpnXtm+bjqCFw5moSdaI5U1QYLis1iOt7oN0xd+VeZqgY1K9Jt
 kHiUKGp9peo+AbkA4AHNl3siCpVsaAntdoHhzplTsMVilUyIV2NvVkqUz w==;
X-CSE-ConnectionGUID: Xmou2+cmRB6ciPjvoIS2Yw==
X-CSE-MsgGUID: 75INor2eS8+HA6vPGNiy/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92267864"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="92267864"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 22:51:06 -0700
X-CSE-ConnectionGUID: DJbTxkx1QPad2oTFe7bxGQ==
X-CSE-MsgGUID: caJjUxZNRc6H/93vJ8bq7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="248889066"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 22:51:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 22:51:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 22:51:05 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 22:51:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/mAaTQUmZ2o2PK5JKvfZ4MrD65rFZq1zK+o+JkYc08FmprjhkdsIVtm8wF3znh06/HyqGcGRlVDFjT8dzDSYSSiCFnt8bLBWmCMzA3i64a4qjpcWVPlNMcjj0ssFk+6LVKc6BNXJ0lVUVPOKQ+TQCA8rNia5kWjLWvNNQFmb18DOQ9TrYc7LaU5TsBbVOJub6VZE5SWuyCoJC3HAuRIXZ4YRY3VpvjYOzndIPwYsoAP6mz3FpUa7zjaqXAtFgvYRHNYSzmJpZF5DzMieNJLgfDpqxd5okfKb9ADfyA7nBJzq8DF1oLHI95aJmE5JBmuMO3wlRKJxFQ9G5IEBoTqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gg6cl7SYeHVqDRls74V1dedADZWkW/7d1+YPWC6+cLI=;
 b=l54hKApe2LiMh4Lm5gjozjtSONIoDDRzShKJAswQ840sSCAm8w57HudcZa5ywFmGuBZPzq0/Hbxt0RdzDMIO3UtF4QF2YShu4oiqb+YZhzcuQSoWtmnt1hR8+0SvdCZmZjeLw8TlV5CfY87UnzH7poOVF2dDCRpvOaqEwvZcZJ76rIAdKOQjogKu4jgZ2EzKSef3PldO5eS92GkvIaxMBoEdyPWIBrhsu4yZ1joH9RYjASNJsUIhuVk+vJwl+gv0yvMNVnTrI2sY1dl9/xYiWDibX6S+GjtZtuFWIsE1lF3ka/AvHx5HddcPEIOkSIg2ijWT56N7PvdEkp+W0/JlYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 05:50:55 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0071.011; Tue, 2 Jun 2026
 05:50:55 +0000
Message-ID: <aaa80c76-18b7-45eb-9be8-de7a2aa7b2b0@intel.com>
Date: Tue, 2 Jun 2026 11:20:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/3] tests/intel/kms_pipe_stress: use
 ARGB8888/LINEAR for cursor framebuffer
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <ramanaidu.naladala@intel.com>
References: <20260527071940.3285269-1-sowmiya.s@intel.com>
 <20260527071940.3285269-4-sowmiya.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260527071940.3285269-4-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::18) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eafd4bd-8d2e-47cf-41f6-08dec06ae9b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 4i3roMTMupK+CDUujZJ0Es+pdCVSUznmXhW/sAmRt2mPKnbWzesBd/IBH3acIHF5q+A8fMlQqv417gqo0b38drA6Tn821Oc6qWQmQMKvPUTtGunCpvdOv2Mg1NfJ+P2Oj0wBJqimbyFs7ulw83gX1TitjY4m5msjiVjPZT/KA3fOc9RgnUGwGbM34HpMklRJVzQ+DFJzqSTfd2iUPQe7KwAdQEgjYCiCU5B4/QRt9xG473B3eNmkciZZTJ/MyNJD9MQq+Ht2WfJO6oWFGHzt6GpUdJJwF+UQ5WRKSCtXulX6M19WBbMpoXTNr646EWZ88W9+tmVmO9Dfjg2/29uWOawVIZkYo+wRPIfi+CPiu8mGHTawjdjgbdX5Z5QQTGaWzS0BydTN7JbfZ/TK6b1AtbILS3LR3hZ5HY3dEVCbew+MFykucFITS8JSEifmnmy1mbnv+YsGXHd/6OHKigh/i/FAUU+7IYNz/ijIXxOfcARjK87ZL3XXRUhCXySaxuXpZbKijhftRAtuu+HQrLcbN1mk1TRMmMi7X3nETT/VM349J47qa8XWSCDU2AwgDaFBrxD8chdIVdU75WMHrqSDRcTsIhhB+O6/B3KpiCg2AKgk0X/v/2MCOz57gXI9HKoadizwUF8JGVChH89QC3alAgUtm613z8mAXDWuGuevjuZSqfw97zZUNbPf4/QLiJzg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0p3U1NDVERyNWNsTlA3eENNYitPWDF4eWRHeEVHTmF4MnhBZUNnNDlkQU5a?=
 =?utf-8?B?OE16ZVVFYVY2YlZwbjdDUUczWHRoc2JVSmpRaW9LblFtZWR3Q3gzb2VwK2tK?=
 =?utf-8?B?SDRsQ0JyTVBlRTIwNnlsM2dvWlJlSms3by8xSUlYUFNBaXJlTWlMZlJDeGRx?=
 =?utf-8?B?SVROamdFKzd4RmxLVkduRkkwRjVLWGZRamlXMGJoNWhNZTFqaGRFNndOZnpo?=
 =?utf-8?B?QnY0czhjMENpS1VOWXVwOGNQanJDU0crNXpWdG12bWE0YjJOVW5qZTQ3b200?=
 =?utf-8?B?N2Z2MnZDUXZmcDFiYzB5dlRVOEpCWFpiNnphUXNqMnRPbUIrd3B6UERYdC81?=
 =?utf-8?B?Z2FrZ283NEk5U0VqZzN3MzRUaDY2WTQ3RVYwV3FVdHl6M25OUXlXVTk5My8y?=
 =?utf-8?B?UjE0YWl3TEExVER6cTRuWW5aQXF4NXhEQjY5ektzVmd0TTFjNFRNVGRTa2dj?=
 =?utf-8?B?NEZCdWg1VmFyUG4rdXdDUFhjY2FCMkZuQ01TamtXM2VkcFRQUHhGUU5aYTY5?=
 =?utf-8?B?ZjVMVWZrNUhibXdYMWRLT1FSMCtvajNUNzk2UUtDbloyQVROSFJieUVXSE55?=
 =?utf-8?B?OE84Uk1VNFlTUW5FN2N6ZGNvU0J3NTFJTGs1YUlBaDJmM3VER2I1NCs2c2ZX?=
 =?utf-8?B?MUZTaklnNFpyYVpRQVBwYk9wSGNBUmVpZU1XOTJUZzZDSTY5ckVUUVhyMmw4?=
 =?utf-8?B?c2xjTW1HQVpDSmQ1dS9oSS93b1doemdXV203b0RhejVOYTVmZTBnNEZQeExh?=
 =?utf-8?B?RDUvOFV2WHZFM0t5aWNmRDhaU20zZVFEZ2dFR2ZVaHEwK0dyaUxQVkVhaXJs?=
 =?utf-8?B?all4N0pVeHNoSURMVEpsNEh2ZEhrd1BtRTRJbUhBS3FESTIzc1oyQWZ0Ni9M?=
 =?utf-8?B?RU5SdVZ0N2JhNmZidDhOcEluaWphSlM1UUlXV2xERzhKb0JHUVJZR21zaGla?=
 =?utf-8?B?WFRQQlVNdzFDWnFuK2hFQW93WGRVOTJpTjVpSVZYUWNxclk5YWc4WTJHVmFI?=
 =?utf-8?B?WmRvdDNTR3NneEh6R1E1Q2g3aU9qZjlmc3V4cVRXdzZsVEd1MFlrQlpPOE94?=
 =?utf-8?B?SGhiQVJJME5TZ015SG5mdVBLazI0QXVLWjhidGZ5bk9hQis4d21ydjFHb0hx?=
 =?utf-8?B?ZEtqbVppUFhMakNIeXR5d21XYjgydHFHc2E1bFZlZDhmL1NvejI1eVpLM3VB?=
 =?utf-8?B?N2V1NnVOVXNxSzU4QTlnUFE1azcvNzRUZHFLUURGdUp1R0ZEaSt1RUdlY1Nu?=
 =?utf-8?B?WGVBdnVlUEVTSHhDZTJwUnRuQ1NhYXdnalhEUUE3ODJhQUxtT1lrQVNJeW5O?=
 =?utf-8?B?dkZCQjZia3JPOE5jOWpLbjU3aTRqUmxFZFFxTHlzVTFxWmVvc21UV1FLK0RR?=
 =?utf-8?B?VytZTWRIYUdhcVB2eVpvZWtNTVJTUDloWkMyV3hhYU8wbEZDSVFpZWp3NXZS?=
 =?utf-8?B?a0x4ZmlFbHFqY3N2Sitxb0l6clRZakRmNlMvREdRM0VvNkZVSWdYNWVCWDZW?=
 =?utf-8?B?V1ZLanR0OHFKL1k1QWhLa0RORmRDUmJ3UmdKSHNmMHRydTNkcmo4bEdFR0Vj?=
 =?utf-8?B?OHlwRzMzcUg0N0NyOUd1Mjd3YmQzNkFNR0o3dTA0Wmtra2tEcURlR1IvTU1y?=
 =?utf-8?B?dVNQM0JqUVB5Z1BEV0d6M0krc3RBUWxGVlFPQUJPRlUwNWZ6eWhrREZLbXdV?=
 =?utf-8?B?R3RwcmhLZm93OXJWbFRXZm5nSE8wcGhLaGRCT1ZBbHpyTjZKMXZqa0FLYzBS?=
 =?utf-8?B?VmxQOTNJeitzQkQveDBQZW4yV1Y5SGZtYjdidVFRRmdDTlRiQnZMajJrNXVi?=
 =?utf-8?B?MHJEb0tibDFhbWg3MjJRVjRwRm4yWkJ3bHhEVFNldngvMHdMTnRHT0ZheUNT?=
 =?utf-8?B?ZnhzbERxU1hzbEVmY0R4VzN1VWwxRjRod1ppUWUzckN5cEIzSkJqNnR3ZElU?=
 =?utf-8?B?Y3Qwa1d5RExVaXA1NVFReFRIZlF3QkljNE1vK0M1bkJBbGZpdER4N1pSWmFa?=
 =?utf-8?B?eTVJTHZDdmE3bm4rOTgvY0VJTTNoZldNdWdVYWVuQVMxMmFvZC9aU1hHVEV4?=
 =?utf-8?B?amhETlhIME05OHQvZ2FSWHoxei9ZMTR5cW0xVlh5cTJPaFIvSG9ReE1QeFFk?=
 =?utf-8?B?U0VqS2sxNWRIVythL0tFbjluR3FKREpuU3Njd0pyd0xoOGQ2dkovQlUvOFZv?=
 =?utf-8?B?blpMM3FBRnJuWjRnaDJ6TDAxRlEzOFh1TEFZQkZzTHluc1h2UVV1TGNzSUt4?=
 =?utf-8?B?cDJBYW5BOW05T3NjYzFzcGVLT0c2K09iSVpHa2l5Q1B4eldqeEdlajhTY3V1?=
 =?utf-8?B?TEJIMWRQU0h3MHA3OEw2K3ROaFFKZ2t0RTN0NHB0L2phaExob04rQT09?=
X-Exchange-RoutingPolicyChecked: ZEjzWDZPYaeu0NeOMk6WBOhBBGI2CMkb8wVYi/Ol+S78ZTum4cThMMLC6RAsIN0SHEhtYLEiJxwPOf+OIY61H0LOL06oLQ4rFuTMql7DhC65Zu+nWQh/jp/0x0kGd8KN63U5dhKW9vbZJJ6HH9ze4amdaNoId8isUERFrtzoiBNBlJ5LaW3dFt/3XTV0cEh8aRt0SDqFqqNnwwUwAYwICcJBxU70YHa+CuTZa9ZhOQ7nZcdEDbVnFO+9POKaVketPUKPuw613Xs8swRQZcumfNqcujyxu9bpEcrYjTGdFZ+1/sH3YRFgyekeLjKfFc4PmDgH5XSpzUis+SLKu5oEAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eafd4bd-8d2e-47cf-41f6-08dec06ae9b4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 05:50:55.4538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvtuCKnmAdPJZxuwUwsqu6U94ZRAooHn2vDiDAmrNW69gYVP389DDafNmS6zgkbMpxbkcXE1oTS02qPHt4+/rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
X-OriginatorOrg: intel.com
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

Hi Sowmiya

On 27-05-2026 12:49 pm, Sowmiya S wrote:
> Cursor planes on Intel hardware accept mostly
> DRM_FORMAT_MOD_LINEAR, regardless of the overlay
> format and modifier used by the test variant. Using
> data->modifier (e.g. 4-tiled) caused -EINVAL on the
> cursor commit.

Please add bspec link

Overall change LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   tests/intel/kms_pipe_stress.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index a84433b9d..5362fe9f3 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -736,8 +736,8 @@ static void create_framebuffers(struct data *data)
>   		if (!data->cursor_fb[i].fb_id) {
>   			igt_create_color_fb(data->drm_fd,
>   					    cursor_width, cursor_height,
> -					    data->format,
> -					    data->modifier,
> +					    DRM_FORMAT_ARGB8888,
> +					    DRM_FORMAT_MOD_LINEAR,
>   					    1.0, 0.0, 0.0,
>   					    &data->cursor_fb[i]);
>   		}
