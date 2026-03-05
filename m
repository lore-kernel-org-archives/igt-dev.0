Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67748EDEC05
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 05:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD6C10E1FF;
	Thu,  5 Mar 2026 05:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgHkU6Zx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BF410E1FF
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 05:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772688808; x=1804224808;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XJyzCPp/6+qK5uzBr9fsmuM7GRn4kAC5V8MY0x64fE4=;
 b=dgHkU6ZxtRc1SS+MzjqvLfmmP8eDfJhK6Y/OHyB4chLW+r7wtaxO4MwK
 m+awv9TIkyDwLFHXn8xbRPcAMS6qyAD1A80txDWOZmXfktEaopYgQ1tnz
 k6igsYY12JdODCZCGCc3rScSJ2d3U0hcLKIZ66MduiDvkZHHM3rEjluIJ
 2FQotjXpOGVWM7YYqCw42EQhZEOZI0bjdI9Sa7ce38/nlM+Y18wIEUgt5
 noaUnAYZgfxAf0q3wVzYFASs/sUEjXhF3YIwbKjFtgQ3O6xfk9r/43ryD
 sjUgvNSwgydqq/N488xkotpazdDnIBNRR6OwJNpgsYfMOPkO89TRrOYWw A==;
X-CSE-ConnectionGUID: tq7paVSvQkq4fvjNEMzHow==
X-CSE-MsgGUID: DwgjmCBzSu2QxR7ithF9/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73833620"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="73833620"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 21:33:27 -0800
X-CSE-ConnectionGUID: EmzgSDlQSVW+IFUDQ70XMQ==
X-CSE-MsgGUID: xSrm6uEuRjmjiAGMoWaArw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="216388661"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 21:33:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 21:33:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 21:33:26 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 21:33:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnGsKXYCktip6wmT2mPb/UMc3bqnRenYRAeGHR6iKxWS1964OOAEWi//XqfIQ/aFOLHvBic9uj0WAVoltzZ442eAomdQm1AKRvUSD+h2CBmekiYUHJmIzZok2F6cN+AM2HZkmXSAGXjA7v27++PvSgno+o4E9F/0iI9Huejvp1SJsv3UMTKMWo7xZbYe49ZwC5Fx9W78d/Q/+SSQ1PxyPfLvzXGPo0Ud6Pbw0m0qUycOFkCnPu727jKFOImwDUwindP4ifoBYnElLmI/D7CcbN5gxJ049UymKNrR/I+IvOdPXHLsDaaISnKbFRrLh7RTKqZHW5gVBANy9w7ViTvdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7Z2aOsb6aqTu1mlYYoYvTRaI9JeEUxazQQLf7H+gf4=;
 b=b31jo5B/8oJMn7Yexu5fgvt+WkaN/EBldEmNkiJ+d5fRTBjCu3zyYq6ZrJw19Nl0QvAEwSah24lcgQ2KyHFwPKcqTcqW+8dPmWbe66d9ZgkmCnMTWaYeCZgJov8Pof1o15ZKMo691Xg9vzxEiXNr+Fmf711RrbsccdNIFZmY4RmyQNa82RGS2g+qMgL5SssCTyXN2G0LFnbJuq+8GlMAKZ5ZEWIJkkO+MipEdJgS2UNihhLTWfAPl2ZVpcXCoK7+kjf/Vg/5VXpQM6YLrIxlU7nj3wWMEkwDjGZ94Rb/sjgAkoWgqLPkc+JNeMpXVESJjAkOD4eQfoLbRejMg90Gtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM3PR11MB8760.namprd11.prod.outlook.com (2603:10b6:0:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 05:33:24 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 05:33:23 +0000
Message-ID: <9f0447f7-2790-4367-88ec-5f3781731a70@intel.com>
Date: Thu, 5 Mar 2026 11:03:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_plane_alpha_blend : print reason for
 test skips
To: sumit kishore <sumit.kishore@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20260303132313.225994-1-sumit.kishore@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260303132313.225994-1-sumit.kishore@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM3PR11MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: a73fb67c-7954-43ce-feb2-08de7a78b7ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info: a2Bx9ULoAr3ZOdVk6FtHtYbTbS44nsKjPX9Mpi0nsVLDCRTTNoqsxFY5Ua8t3Q2kRaCbEEPh/rqNXy/JnS2a/esOpc1kanFE0lruZpGFvO0kmHqK8rAk0D+iC0hNklMS7MegkWbV++rv9fdJojpiwZV+g1nA4hpakCJkBWzbfjo79y2DiXklLGTIXr6ZJ2I3Xbn+ykMnskA+3nHBjS1zyp2z379v1j5oAJev06unqAzebNssXENW01lWAuINJG7JVHrKwSFdt4NY7BL8FsyKpgp4rF4sG+6S4iC/eCkVgkoE/R+xCJ3UoweOcxJzMX5fAe7f6hG3BliRtAf7ogAM3iwu1Ki0hoAEZACazBikoWl9n8UXC4nIVjQSUd/VgOk56x96qb2HMApVKKuNKG7Ge1WXpw2IaPqbV89keSd6cBKhaN634IGJaJ3w9fJD4oi7PJmmmvwl+ZdvaFA6npnaW/7aK+9exsjKQPsqZNcKGc/PnrVkDdrYDJJhnPRb/Js2zTRaYs0Qmui/qOPv3KWMSd4+7zzA88fKNhtLoyraSdNcE7D2uo/MNAhOKSn5vYyRcPlMtQZ1sZqkBMR+VuBht3o+Zy5l+V11MmfcfnnKfp0Tx9Z0znhlIen/H+sWJRf30uz8ZqdA2o5FKmgvrvsoZ9cUrq/ex/Ojgrs594KCHwlEYuQPMbp1nXlk/HpeZCVeRjLCDIMWRd+s0iGn2fkYa0jhb4rRT+SwtlO27ZRg/iA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mml3Q1ViWGFIUXZoWnhEeUxWdWtkNnlCS3I3OWpzdHBJM25YOVZONER3Nmhn?=
 =?utf-8?B?c1U4bTFYMDBlWm9ZZDVNR1pMQUtVbEN6RmtWWWM3Q2pGVTNHVUVCZkNsUEZF?=
 =?utf-8?B?MElyL05YeElxd1p1dmlpNWx4bEt2NmtQdElhOWpDVkpNb2FOYTE5LzRkLzNh?=
 =?utf-8?B?d3JUT1BRK1BQanB3VDY0OWMvby92ZWJSMVRwZHJaV2VybHA5eGZzZTByLzFi?=
 =?utf-8?B?OWx4N2UwamFYN0E1YlRpNm1nckZVNlJQbFFDb2dYalFkL0piV09HRU9QYlRW?=
 =?utf-8?B?OU54TUFrRU5nL2oxRXZZVitmTUEyU3lRQmp0cE1UQytDSEJ1ZnlaamtvOXdW?=
 =?utf-8?B?R2lQK2REM1lzbDdVWWV4Z0JDNG8ycVVESkJ6WHJsMjlzREhveCtSZTZqUllH?=
 =?utf-8?B?ZHV0T0ZDVnVKbjk3VjUrOGMwcC9vdkt2RFFsbWQvKzBueG1NSEJ1UEFiUVh5?=
 =?utf-8?B?SVZtSk1wOU9EL29YT2RZb25QWHNXRlVtTWdGK2MxLy84TFJOUkpPWnNUdVNq?=
 =?utf-8?B?UFJWTUtzdUdFVStFNHpGQnZRSWF2d1lpdVhveUw2K1F2bDd5Yk01eW5vMFRs?=
 =?utf-8?B?QVhURDRtODZ5VXJ0YVl3Q1lFb284UVFObWpQL0dIYmVseFNJNm5pdjNqUzBP?=
 =?utf-8?B?bU0wdzF1UFJNN3BxMDZjSXJiS1pXbGZ1NEQxckdUbW9jbEZvL1QrdEVZN0VB?=
 =?utf-8?B?UUVMY0N0MG9tN2x0QTd4d2I0YUpyZE9IMVlYbEZMVVl6WXllbTZjQVJqVGVK?=
 =?utf-8?B?bXkzY1J1RUdsSStObWd4WnIzVUovNUMybllreUdYWWNsU1hmNGpNT0JDWUs1?=
 =?utf-8?B?ekluMWYrNTV0ZXRpbkdweXpCamJLbnc3bCtEQy83NFp1Z0xTem5xM3BUbkE3?=
 =?utf-8?B?Y1FnNWI0cG41a01LVlVIUzVDUmFDZmxpeExDUzVjT3luOVFyM2VtcHNJNy9D?=
 =?utf-8?B?dHdnK2ZlRytPMDVOM3R6Wk1naFhsSDBDT2RHQjJyVURZbmoyVFdZMHlKWjdQ?=
 =?utf-8?B?UVJBR1BwMk1lM1lkWUxpTGVJTG1ZLzg0RkovVExYV2laekV1aFBJYm1oeHY1?=
 =?utf-8?B?WXY4dTlIdWNqVTlPZUM0M1J4VWFNc3JaQ2M5MGVPNzdYd1BzZUtoUmZEKzVT?=
 =?utf-8?B?MGlwUXVMRzZqaFlCUkx3SEJlOEJ6Y3EwTUM5b3JCTk9RYU1wb3hPckR3cnl0?=
 =?utf-8?B?Z1JaZVJ4TWZqUHhqNXZDQ2ZvYUxQSTZERWltTkJrRHE1Ukt5cldzWG5YMkEw?=
 =?utf-8?B?RjBuVmIwRnMxclNybGhzYWNzMW83eWxIUk5DbSt2dHZaeENLdUlOdFlDZzA0?=
 =?utf-8?B?VjVURXMzcmlVMXFYQm1lMERnYmRabHhLUzlIY1h3WW4xY3BJUVVoUXhEY1dG?=
 =?utf-8?B?Z1lOMFVGd1VuajF5ZE5YY2JzZllxckNaOG1WR0FoYUlCRnVQWTZremZtM2xJ?=
 =?utf-8?B?MWNzUnVjWWhxSnhmSERRUmcvTUg4UWZtbXBMYzNFNm4xT29LMjV2SzJab2hR?=
 =?utf-8?B?VWJsdE5mSkgwaVhHTmFYUzdwU21wYUdRRGhVeXc3WkNpQ21oZFZGek9LeUMy?=
 =?utf-8?B?bS9ITmxIMitENVNJaTdGRGtWQ1JDdDQxSVlJcEM3Wmp4ejBSdDNYbm92emln?=
 =?utf-8?B?MkNiL1dJbnlxb3dwclBGMXFNWE9JcURhbzlnVnpEa3p0NGU4enZ0dGxlVGxH?=
 =?utf-8?B?ZFBwZTc1eDhXb1lmRkNkbW16dlVNYzlkRU0rMUR2TVU0aUdNTVBxZktXZEx2?=
 =?utf-8?B?bkJCNmNaK0NXWDZpaVBrVkVwajZHSmtPSDJ3SVQ2aTh2Z3J4M0JEQmtza0d5?=
 =?utf-8?B?WXF3Ync5b0VxV1J0bll1YW1yMllyTVJuUVZkbTN1WVZTYStaMnhqYUlRdXhy?=
 =?utf-8?B?TmxONzRmZWQyYkpJRGp1NHZvSFBBNWR0bThycVBoc29mSVdKMGY0Z2lsOUNM?=
 =?utf-8?B?WlJ4TTdiSkVLZURIdlJhcU1XNmtVR1MrSmd1Zlp2dWRjdkVUaXVlSytjMXdJ?=
 =?utf-8?B?dmxUQkUzV2NKYmFCUndPUEJnVmMzZFo0aHJWTldmNThyellnUFNuMUFINkM2?=
 =?utf-8?B?aURhZUJYazJLb0FSTkF5YUZlK3MzUkhaWk1VN1dRcE9BczdwRVJSQmxxeFZk?=
 =?utf-8?B?SDZHeFd5YmJkZ3VlSjliTnNiZkIwUnZRZE9KcmNsL2xhOENpOTlaQkk0Wnpi?=
 =?utf-8?B?bjVqc01ZUHMzTklFT2h2djhBU3FxcG1QY1VQWHYzRVNjSlRnaU5DTlp5d1Ro?=
 =?utf-8?B?NmVWWWlhYkd3OFk1SUloT2xEZDV5NWFtZG5SV0s1bWZUTDVaMldRV0lBdHZo?=
 =?utf-8?B?U3J3Uzk0ZDM2ZUdkQy9lUVZFVDY4TUlGS3FQQThnYjc1T3k0ejN0UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a73fb67c-7954-43ce-feb2-08de7a78b7ef
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 05:33:23.7569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yE3fermY2DuhEVsp8zL9ePNwB8su1AemdU1z8w63h/44wgpBTb3P8gHvnHoVmQDcgt2oDuHBFPbIMDGko1DK8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8760
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

Hi Sumit,

On 3/3/2026 6:53 PM, sumit kishore wrote:
> Print debug message when tests are skipping on headless display systems
>
> Signed-off-by: sumit kishore <sumit.kishore@intel.com>
> ---
>   tests/kms_plane_alpha_blend.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index 41a3b71c3..82d8eac62 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -753,9 +753,11 @@ const char *help_str =
>   int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   {
>   	data_t data = {};
> +	bool active_display = false;
>   
>   	igt_fixture() {
>   		igt_crtc_t *crtc;
> +		igt_output_t *output;
>   
>   		last_pipe = 0;
>   
> @@ -764,6 +766,13 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		igt_display_require(&data.display, data.gfx_fd);
>   		igt_require(data.display.is_atomic);
>   
> +		/* Check if at least one active display connected */
> +		for_each_connected_output(&data.display, output) {
> +			active_display = true;
> +			break;
> +		}
> +		igt_require_f(active_display, "No active display connected, skipping test\n");

Instead of adding a new require check, we can use the lib 
function(igt_display_require_output()) for this.

Thanks and Regards,
Karthik.B.S
> +
>   		/* Get active pipes. */
>   		for_each_crtc(&data.display, crtc)
>   			active_pipes[last_pipe++] = crtc->pipe;
