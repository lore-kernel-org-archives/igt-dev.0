Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE46CC6B37
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 08:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168F110F1C9;
	Thu,  2 Apr 2026 08:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khXL07Az";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A34810F1C9
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775120298; x=1806656298;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=85Wya71KouA3ZNb0qx0hOdP5ixRwgQRWQC9z277gXtw=;
 b=khXL07AzkfkOWGKXLibdjXDOOuwLPtPB6Ingz1GWnQwIaktrDCgNDyfI
 0WxG3dqUK6hOenW/jdknbXEsh07Ra1nhkbGrKizLAUeCTqJ83dyB4OxIG
 pEwYzT0VJ76OjjmrDkWw0sDljJWUsTFX2SAtw4pQ/cbZqxa5VLgjmMiup
 C1cTZFoKvudX5zFc4KNWmY+QQbKFe4NV4UgSHTi7hEC839yqbBjG5qkE+
 yjQ/O43eu3nYXIbYgwcypilDPhgbA6/kMmbdBlWm4hBb6m5gmOwptHXYr
 vziGIz4PbVifwXzfAHkN4TfbcdAuZoxJAqh91pb7IEdUdHH2yozNHGVvx A==;
X-CSE-ConnectionGUID: WQa+GSdbS+Cd/zQ/LXu5lw==
X-CSE-MsgGUID: jUiDHUzfTeWd8ZH+H/PoaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76056711"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76056711"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:57:40 -0700
X-CSE-ConnectionGUID: xkp7LeuzRkGWstA8SKIGyw==
X-CSE-MsgGUID: TvTsKJYLQnaGfjKJZTd4Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="226085738"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:57:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 01:57:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 01:57:39 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 01:57:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqA96yBpid+miI49efMVLbwMlSZLa/q6dklT1WVAgj2b82j6L7CP8QDjT8yS2no1h8s5KMqN133571JJiFDX+df6hXacNU//P96mETPPF7m+zcyCs2yxV3R2v/Gz6KRnvV36FVxCvbKA55ACi7/VICxDvhvK/axBTJIkD/iCk/twhg9yKHN+Gn69a48lJt9r7pc3KwuxqMyqaILiSC+5Q7KjeZ4D94JrGZclPaj+8+XBp3/EhNVfqAFPEFqlw2QSObKY/j2yaAPchZBRVT1nXd4T/XosbMFiHydjLGh9+XyMBY0HnWp7CRm79hFLxlGyrdRLOC4hkchNVUD5hNKLhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ou/2ML/JZCSzY22omUrW87wCVNR+0BmRWVq/yvu4q2c=;
 b=elW2TFiF619X8qL0H/sp5v2uZB8K+ULBCTbhY2T7unxqvVelaaXsvdZfKdCpmmJpgtauBaCcNz3YX7HmXDe8j9e7VdCr7BIacgJOKzcK06Ys37gH8Q+lPpQqf60RmHk6+LnTuilg7OA89DgYu1L7GZcW9UFKy3bdDdJ5MgXnvtwBgwm0zO1BWOs+vNXJfynK4L8urc3f9yCysbEUOwmNhVS6rQf6kq8iI8ACjlct+9MB+2JIh+Hb3aOt6enaCJ6UFCQ6BEEhe74Et/GMOussri94FO4sHqZZzWLb8Ai3ykctdqCOsqm2gZLmGlP4HoTXaZgvKJTP+pKshSkKe91LnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by SA1PR11MB9874.namprd11.prod.outlook.com (2603:10b6:806:4d7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 08:57:31 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 08:57:31 +0000
Message-ID: <420ab86f-4ab7-43fa-a636-4c52d4721cc1@intel.com>
Date: Thu, 2 Apr 2026 14:27:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Skip runtime PM active check
 on headless systems
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260331181606.22367-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260331181606.22367-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::17) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|SA1PR11MB9874:EE_
X-MS-Office365-Filtering-Correlation-Id: 01b2739f-ac39-48bf-5e97-08de9095df70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Jm3tTrYoSy83QI+Y14sZWkbIhegq447qp2xASeJbJATVIztLKsDefCWii5fZcSpdGRf480YAoy/ubD8sWjmIYslL2NcbtKZIFsh6pG1XLoH/fxHeUo+YlSrDwct1swOPRefhgooy2ND5/X7eX0rrE5bO+WqVSkZerZ7hbijXn3VxIpRqDes1csAkIpmnP/uuV20NhsN+WogqdK8aTNlVYqUQNppoincK+a3Y01uL0D9QnJ9tf0FmbpmGVy4kZ2ZSpjl1SBXbUwyV3Z1E1+s6s8TpDQWrTuToxi8iktKWA8neXZs23BWTFtOUQFkGlGvLt90VWabJ9T2SLyalXfhMCnu0HTZ+jlstK7Q1+lWSLqa6hiIGJU3GZ4Itrtz6bbDNDmP5JLVFZKliWDKlGXEmfUmi+oX/jd8oK8EcuAcisBHb346PdAYlC026SG9yhyNTN+z/XcytmPthch9YA2r2TKJWVUa7E5ABBjCixCpmrYzfNlPV+fmGN/IRn0aJpkEJA7Q6uE4rykQ9IHHLEO0jTIi77PPySGWTtQQvjWS3bvvO6IJePAoQWoWT68lluJaDT/UDNU+qiicP7bZjM8IR3KHzAhVGA6ksY0aM1HOkZ2TtUr8VbGDb+Atixst1bPnTmraPVs7m0kCBJ51f5VHyxP91SfUtCvs3zZrvbLf7cchEaLcJ5mIxQsGqT9GvLbmCqt+O5lph5LPCndyBtGT4vI2g9FniZnu4+51c3Rjmsj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk5Hb1FrVW1GcVNpVEFyYktGVFpmSWhkR3d2NitOVktrL0kvd1Q0QXpVOFl1?=
 =?utf-8?B?R0Z0ZFA0Y1ZQVFZKc3RKcmt5ZXBHYlcxNmlVUDF4ZDU2bzRjeDFhM0l5V3hu?=
 =?utf-8?B?ODdTQnl2NUZPVmwvblFLaDBlMXVWMzBDcUZzUy9EQ0dkSUx2N3dZSHRkT3VI?=
 =?utf-8?B?bGY4SkdQSmtWUWNGbUJSOVVscUtwQmpTUkZQanljcURtQyt1MmtRNkpMZTFQ?=
 =?utf-8?B?T25zRDBMWnQ2MHNueSs4UWdINjNSVkpkbFJwdFJ6ZWh3dW1ST3h3QjVMK3Uz?=
 =?utf-8?B?SktZRHN0YVJSdUxPWlEwWURsZVMzOUQwT1JUT1E5clpCbkJSTTN4ZS8zYjZw?=
 =?utf-8?B?K21pakMydDgrdnlSRXpYMFNiajJPK1VkczBUMytodkh2THNIZ2JvZGExZkVO?=
 =?utf-8?B?RHhtbmFWNy9XUHY0azRrYkZQaDRHNWNBRnd3T3o0ZEpPZ3NiNlNmUENmblM0?=
 =?utf-8?B?RjVvcjNiY290MGhpSnM3aXlIdzlsVk84REo3NEJvdFAyaHU2VWF5UHRveExK?=
 =?utf-8?B?bWN5V0R3eVl0WlY2dGRhT2pOcnJJalE1OGltNDY5Q2p5WjJqaTV2QWd6YVZY?=
 =?utf-8?B?bGRhZGlXb2xFWWRSOVlEb3prc3RJOTlxanh1OGR4OFFDcHptTzVBOUc5ekNC?=
 =?utf-8?B?R1pKSXdnZ1pRWlFUWXI4am5ZWUp3UmRMNm5FMVBySEdQOEIrNnJDVTc4TGwx?=
 =?utf-8?B?WVFTK0c0RTBGak00bldPanR1SlJOeGpMUXhJNTEyYWZqUXlQVnFqVzJwcU0x?=
 =?utf-8?B?VTVsTWVUT3ZVR29kdnFLdEs5U1lYSlBESmxwRGh3Nk5KVGt5a1Rib01Kc096?=
 =?utf-8?B?WG42alBuQldzbUw2WVpCMkREM3g3RThwa0FyZ2tDbzgyZ1BkQnB2MmtwMU1s?=
 =?utf-8?B?dUdyUk1qRlVBUW1xMzdWc1FYM1hKVVR3dUZ4d1ZiQVNsZlZNTEV5RnJLOVU3?=
 =?utf-8?B?Qmc0TU54ekhybW9nejBNM3dCd1p6dzlwdzdjNXJ6YTFMNEk2SjlabHg5aXNt?=
 =?utf-8?B?b1hiODdKUUVSYVFRczFBVEI4c1lTWnc2Y2ZJY0V2Zk0wU01VRi8zeHdPN2lk?=
 =?utf-8?B?V3V2c1FlVGpnc3RaWXVWTllRMG1sUzBseE9jUXFvUGxCZk1UcDFBRUJvQ0lm?=
 =?utf-8?B?Z0hjaWVsb3FwbTZWRnhYamFmbkRNS05oTVZMQ0RqTCtaRDZWbmcxdTVQMTdo?=
 =?utf-8?B?dW02LzlsRmV6RnA2M2NlMDJDQUdDRHhyYjV2Mmh5cVRVbkdkR1dKL1dBQmVI?=
 =?utf-8?B?elcwZ1VTODdEbVdGNnp1UXNTbW1abnNSWkk3ZFlqTUs5bm45RW9NWUI0aXNl?=
 =?utf-8?B?WWpQbWk3VGZPbVc1OWxxM0VPM01uaUwvcGdFLy9icDlleDluYytvT0dsV04x?=
 =?utf-8?B?RE1kdUc4dFJWd1JJYWR4SGhTUThtaTAzTi9lOVRwV3haVlFIUkhSVzY0V1NO?=
 =?utf-8?B?cllzYjRzQUR3ZjNNMnpzRHI3MFdIcXA3TklTd3creHVRY3ZIVlVQUnlVRTNu?=
 =?utf-8?B?MTQvWTk3ZlcrbHBrRENmOC9RUjNXSGpsTGJzWXJLN2QzK0dxaU9kUmlIdExJ?=
 =?utf-8?B?MWlTL2g1dWxZODYrdk5PQ2VSVkd1dWVlQ0FmK05LQzNZNC9hL3FHQTZUcTVZ?=
 =?utf-8?B?TFJ6bURuYkVpMFFSbjBxRlc3RTJXb1ZtZXVpTHArYjZvMDNVby9GQ016UC9P?=
 =?utf-8?B?RFVoU2d3c3FWV28zZ3ptMnRzTE5QMEl5SjdFRnJ0OGZTR09qWDE1bU5qMmhm?=
 =?utf-8?B?SzJiQjYvOFBGVmtIOG4wL0VsTGM4WHk0d1M1bTNIbC9xQTFSaGhPWjl6ME8y?=
 =?utf-8?B?emVybG0rVy9oeEVmR2wyZUN3MndFU1NwczEwRDk4b1JHWXJQVGM0TGhOMkN0?=
 =?utf-8?B?Y0FPQUhPekRiRm94YjlmUWNPU0NVWlErdDlUVjRtT242TWo1aVFWekdRT1lh?=
 =?utf-8?B?S1VtblV6VTQ2bCtKb0duVkJTNUxYWDhwaENRblM3eWhWYlI1TEUvcUVPajhH?=
 =?utf-8?B?TWtpbkxXUm9BYVdFcFI5UDdPQUMzcFM2T0NZeWgwWjNsblUwS2pwWXZvajN6?=
 =?utf-8?B?MDVXVkt0NjUzUlIwWkV6a1NyTDRLZERjRGczWFoyVktEZUNtRExkeUZocHZn?=
 =?utf-8?B?ODA4NEUyUnczNE8yVUZNa3VCNEZaQlQvWlFCVDZDREZYZlNINE93TlBTUUhu?=
 =?utf-8?B?V3ZpZXhITWd2UDVMZUY1NWJkUEVHU0JScUoybnJoZGdRZ0RkTVR0TlhRWVJI?=
 =?utf-8?B?K1MxQmNodE1qa29TcDhJV3NwL2hwKzVQVzVZdHhyZnBibnJHdWRra2RmZTFQ?=
 =?utf-8?B?QTh0R3l1bVV0VjI4SnplVlRUcjBVblQ3cmp6RTdZWFpZdzJJekF0NlZxa2ZJ?=
 =?utf-8?Q?OEc3tP6/uyLlOFTugRruU3AyMEap2oQqgA3xt?=
X-Exchange-RoutingPolicyChecked: U/3Yh2UC7t7VMSBjSH2coE6L07IY5ka11b+ds6pneH7drRYKXRk+fp88wAv96thCK1NGuYl4yR5xoeT84Px7cR0ZFDvjAY3a8nwZxbsN2cz9dRgTbRR8FLLpadMOtjJ/PMFbOyZ7/gbMGvn8CCBF+ZuMCKR06wRdeC/BiG+vWdsVtHBMg+XfVD6GOBHu0XuL7FaV77zBmAebNOz2aN46/KCdt0zLWV7YrjO3Y8QGLKyvpwk8RkTdz1G6fE92DbUEXzAJOscn3DBld4YGnHIcaGwT0qs9OE+GQf54WDi6GxDW67fz9ysxjG6LiQF2noJeijEULe0y1bqZsCFByvBuXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b2739f-ac39-48bf-5e97-08de9095df70
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:57:31.0456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQvTnimWIVBH5D+sYPAdjGVc7Bv0YdzZnhunLaWoTX5VF8m0iWqfWINZ9ES3errl3Mk8mSRnqAx1/Fa+RsHMZxpCtW5br1NpZEb+hFpwHHuIiyBcNU3jHkL81St0e2xG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9874
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


On 31-03-2026 23:46, Mohammed Thasleem wrote:
> Skip runtime PM active check on disconnected displays in DPMS_ON.
> On headless systems, DPMS_ON operations don't enable CRTCs or acquire
> RPM wakerefs, leaving the device suspended.
> Skip the active state wait when no outputs are connected.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 39e94f36b..39d00bb6e 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -385,6 +385,17 @@ static void setup_dc_dpms(data_t *data)
>   	}
>   }
>   
> +static bool has_connected_outputs(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +
> +	for_each_connected_output(display, output)
> +		return true;
> +
> +	return false;
> +}
> +
>   static void dpms_off(data_t *data)
>   {
>   	for (int i = 0; i < data->display.n_outputs; i++) {
> @@ -406,7 +417,13 @@ static void dpms_on(data_t *data)
>   					   DRM_MODE_DPMS_ON);
>   	}
>   
> -	if (!data->runtime_suspend_disabled)
> +	/*
> +	 * DPMS_ON on disconnected connectors does not enable any pipe
> +	 * or acquire a runtime PM wakeref, so the device will never
> +	 * transition to active state. Skip the wait when no outputs
> +	 * are physically connected.
> +	 */
> +	if (!data->runtime_suspend_disabled && has_connected_outputs(data))
>   		igt_assert(igt_wait_for_pm_status
>   			   (IGT_RUNTIME_PM_STATUS_ACTIVE));
>   }

LGTM,
Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>

