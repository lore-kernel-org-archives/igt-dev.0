Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ACDFF8875
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 03:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F92210E08B;
	Thu, 30 Apr 2026 03:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ae4RFDpY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A050010E08B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 03:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777521416; x=1809057416;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H2kgGcdmfkIWgIwUhjF+osI9r/rQbvtk1FzsDpMq6LM=;
 b=ae4RFDpY4e7EoAsSkDnLequxe8RjZgqFDIEZQHRpdO11dJibsKBv0r2z
 ZWsiqqAursEVpaQhbLBgES+SGwpY/jY+dx8F755vKA0sK+0mk4OdAvS2K
 4gLHprNkKuP2oHAQDI7W0Wzppkeq0bDc8q0EtrrR6fxNUT7wNnOdS4A0q
 4gD+XLGDiopyoKSX/cKiJiRVOsy+EhY4EXq355el5HuKaSw67is8XTKu0
 JKhsQOGYkb2xMwYGeKgEiU1zmXZJDhOi+51ZAJ2EzPpkGJXuf0VuVNtSK
 zZjeyCL7SVD1boKvO5cIkDk8sFtdUw6oKfuwLsdlT+ln4ZFdO10lqPHrR Q==;
X-CSE-ConnectionGUID: hOZimhMNQo2AjUIQ/e57Lg==
X-CSE-MsgGUID: vGjzy0rKRpathDNNFPu9ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82326720"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="82326720"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:56:56 -0700
X-CSE-ConnectionGUID: aDbYtTEOTbWDxmYkofyR5g==
X-CSE-MsgGUID: zx2dIxPNT/CUF7HzlYRhYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="234346020"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:56:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:56:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 20:56:54 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:56:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXmeS5hledlgHDNtrCfAFxR9hpLt0FGKyS5QtCP0df5YNyXydrJ+XtqM71HiDvCiDTI3IcVCZlKGQc5typRPdEIYf5amuyrU6wjLa1rfJRiVEoL8VV8rFi5qEfmq+jz/D7yIjcoblQIGl+inp0BJDqDp2qycFe6loNjh7RTo2GwMc6PpA7lA6IspdzaiN3Fdas8xd0l1fomXNMed7590+rTwUXz1GrNUGBc4RE6ofx4+zAJ3UwWxQMoBw4P9zJI5pBDbfoyxcbBEX3JYd632QOzqCBsT70UIRIE+JKAizcRSSYa1VMTWvU7UM8auMfrWdw4VtMGHeSzzUz6Zkaq7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdicqRRWRkTWTZ5Ew/Ilf93LuLoa/MPbbQky+85URlQ=;
 b=nB+EZxR6fo2oNwqMpjaLD45tJWRXEaSDC+1huS17jdrTkUDzOT2N6Wu9D0x6DlBdYhAi//lBYzjz3EDElvAHziDJgD6833CDcMd4LrNtYMdEt5XSyr8TI+/tyA1d1fVS3kXz6j8Qh5fH4CFeI4C5vhYj+hW1dW68lCuTtC1LXdGL23SmOQrer8ZBUtBW/alI+eaHvER8kEaV+4cvw9umzQ6whGRMVsB9S0lKySpccWUTtMI6fD0P4Iy8y6BrQB+ofBObVdJZMX1VOYwqTm5DEyFzB4N3itqncpIbsGQlW2Ac+OiqWfeyNoTJsjNzz+Su0utZPhhUNj4enw3SfMM0Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 IA1PR11MB6075.namprd11.prod.outlook.com (2603:10b6:208:3d5::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.17; Thu, 30 Apr 2026 03:56:51 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 03:56:51 +0000
Message-ID: <0c58ac7e-b6f2-482b-b96d-e197c8c92a57@intel.com>
Date: Thu, 30 Apr 2026 09:26:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 07/11] tests/intel/kms_fbcon_fbt: update the
 outdated fbc skip reasons
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <jani.nikula@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
 <20260416092559.88735-8-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260416092559.88735-8-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|IA1PR11MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f71d9e5-129b-48b7-7dda-08dea66c827e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: ZxE8RiBUSVYJwzZLPQWB7AvOibu5REa4k9v7xzoI2TQdsHLDKIWsRZGy4xLZJPvFqGne+59nVepi5E/VRjPw5Ytwf8sfjXH2WdAafTyaN7b0mtJDsGnOu69mkaIQdCqdzzPt72smuASR8G0T9NF+pm5sL3JI8qMUs1GIDX5SF7hCaKIlOjP7q7Fq+F2Q9ZksFX4Y4b205gWOJxNZjikQO0OyMjrpNhbY1afTaixedkaxbLUFTkjnqyt84DPcGicxWl+S+E7EmNTiEbficeI1HUhTauob5mRBc/ZKMdp/LxAJYFc0it8cNjdelb2DnjnfGf9+YqPkjIg/OrxxgeE/nboe6I576Dw0aEYBzWJAjl5tIPkeBXtlrsYOBCu+SDEb3EDwpt/3fXR637qAInONYmUCJ2iieZze9x09uyA4tSGl2c52DXS8uzMhDgTU2YJt/UIE1FiwtuSyozICuQzn7m4t+7JNfr1RtB+BP+RGkcR3fW8DBbkULq0S5xIsjW9goWYENG6JMwgP2KE+QJD7S225HvJCt/5ACw/XvHuUNzhase6hPGxfqnrQlwAMJALLTg1RJxX78bQMQExrHplzZW3AeUuFIS8CUMUk3FiEWJbHAIc1Y6JawhclCQZgULuXAZG3Rx6RzLC9YaefgxGUIMEoZMmUkHONENEKpIXwRvvXWYZBj+WumUUohEG6CyyLpBGoFsIFlOR1Qr+TCZH3RWU5xIm5QOIrc/bb3c1g+eQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXRRb015dS9FZ29IMXVjbGphUEF1U2x4ZWxYZnRmeUxtRGQ2Zkc1Wk1HS1FG?=
 =?utf-8?B?cElaZHhBYVZjUjE5UlQyTTh2OCt0K2p1ZHR0VUYvVTVTTDZpeWp6Ui9JbGlK?=
 =?utf-8?B?M0R6RlJUcldqYUtzc2w2MDFMeTV6NEljeHlpalZiZjdGU0cxTmJDSUFnSDho?=
 =?utf-8?B?UmhGMTJtazBZVEdRSGdIT3NDdWpuRGQ2Qnc4aDNzWTlrQ2RvY3hPZjVJNVE0?=
 =?utf-8?B?cmN4K3VhbGl4QTAzRnBRbHNyU1RnaVIxTTgvZS94WEhhZURRZGEvSHR2T0RK?=
 =?utf-8?B?Znd6cGpRRXhHWE5selU2bFBPcDFQWm16TU5pd2pnT2lmeHhBR2VYRGlwQVZa?=
 =?utf-8?B?Rkl5TW91b21CTldWYllBMUZwWm9VQUp4UitYamU2NVcvY1F4aHAzOWxRU3Rn?=
 =?utf-8?B?NzdxRzhtU0RZSTAzVGFLb3lpeVpwYkt4YnRoaHlkRHcwWXl6eWhiNTJBc1RU?=
 =?utf-8?B?OHFTcThjTmEzdjU1Ukh0THQvdXVjMVhVOXZJaFFtUHBFZGxFZ0tMRldRSTBz?=
 =?utf-8?B?ZGxqbG9aV3ZHQ0gyOUFOQVFLNUM2Smw5U0U3MTgwR0R5VHZ4NVVjdlo0MFJa?=
 =?utf-8?B?bmJuNkdBZHFUMWo5U0UvV3NJMFZ2ek5OcUFXWGQzOUN2YkRLbitDd2F0OU1L?=
 =?utf-8?B?YmwzTThMR1RsdjR1Q1pYU1pHMW9FUnpnZVVOMGhiTzE3amJqL3E2Y251cDZz?=
 =?utf-8?B?enJib1NyZERDZmRGSlZoZVJmbEtKbEY3cVFUMDlEV2hVWTk5am9qRjFXbFB3?=
 =?utf-8?B?MnVpWjZHS1h5bVh6TWMzcGk4RGx6RnVnZ3AvNWNzWEg3Q2JaRzhQZmRpUkNX?=
 =?utf-8?B?YTdSZEYrTnJ6WmUrTCtzb2g1NTdvSzNvSUtUWXRYeW9CWlY4ZVJtRGhLQ2Vh?=
 =?utf-8?B?a25GL3ZhdHBNT05MNjE4eVRuN0I5RFpLakN4TVI2aCtGd25tYW8vMGwzVm5X?=
 =?utf-8?B?bHJhcDhVM3UyR0hsSVlIYXB6d05XeVMrYVRZdVdsUVNpdG9iY0ovTUFDdEtt?=
 =?utf-8?B?VVBOdEVCWHJleUpjRWFzWG5CemNsL3dnUHRvUWNnS0hNaSsyaDltdjJLOE9q?=
 =?utf-8?B?MlliQ09wWk5jMjg0WmNZclBpbnd3WE1NQjgwaDRNeWJGZEk4Tml3SVM3MGhK?=
 =?utf-8?B?QjFyNlBzSldTeUtNRTJQdnl4TkQrbVgrbTYzRkFMSWlyM01qYmlmRWdWMFVB?=
 =?utf-8?B?QXkyejNkUlduR2Jwb3h4TklWR2duOHh6TFYzWFk5UXBVdUpnK3RVMzRXUDUr?=
 =?utf-8?B?RFg0dWNJaGd3NGNvUWRYSWkxbUxPYjdDSGo2bHZoamxoaUNVVUNxU1dXclh3?=
 =?utf-8?B?TnFrVXFxS3ZWeFBZU08yYTRrZUIzSWY4ZHFOazkyTEdCZ3VYMm5abFRvTTB4?=
 =?utf-8?B?RThKOWprUHR1QllYSU5xd3J2NXNDQVc3Vm5NUWs2STJWSG50VzhDMVRXQy9m?=
 =?utf-8?B?ZHkrVlZWMlJyQytWalp2ek5kY0VZSGM0UGphbGk1dWhJamx4NXAxLy91L0ZD?=
 =?utf-8?B?REgrZmVmL1MvWnRiRHVmUVJoS3hGNTdVNzJHSWFHK25aeUJqeG5rVkJwT0F4?=
 =?utf-8?B?VldsbzdDcWtjcTlueGFzbUwvc0R2aUJRUXhVNkRvRTVqK0RIRHVWcmZuWHc1?=
 =?utf-8?B?Ry9nMkQ0SmNDTm9IeEZLUEJuUml6aEtOQ2JhdElvMFZ4UThxajUyZG55amZQ?=
 =?utf-8?B?MDFnUnpuUWVpdUFmaEl5QjZsTmxYQzdCL0wxczJGZTU2RDE3R1FZRjRoQ2pO?=
 =?utf-8?B?TVUzTmZHL2RPWnVpaUJzbGNlYTdrcUNjQ3l3WXgyL2xLVmJmeS9SYXNmOVYy?=
 =?utf-8?B?SWw0UFVEd1U0eStKMEVHZWdSWk15bm9HeFhnRndkcjZUdGdiT3lYRGVUTnAw?=
 =?utf-8?B?c1c2NTJ6U1FlVU5CVEk2VWhaTzF6ZmVnM1A4MGZMdVhCb1pyeEpnWHJpRDE1?=
 =?utf-8?B?NVliV1NnMkhPbnVRLy8vdzkwenVyV2xBQ1ZCOEZ4RFQya2lHc2YwK042NGhE?=
 =?utf-8?B?RHNiakdlenRIYmF1UVRrTTNISVRPR00xdnprdXhnb1ZXaUd1NXk0Zzhucmp5?=
 =?utf-8?B?bXJWYmZzbG5TU0FWQlRud3FjVEM1dkd5SjFZb0JUbGpxMFZ3YkpiSW5PZEFj?=
 =?utf-8?B?eEs3Ykx0OFYwSWdvWlJXVk4zZ051dHdIVlM4OHdOanA0eVlueUhSWlhVd1Br?=
 =?utf-8?B?YWpCcW8ySm1ac1ZrWGw4b0tLZmlGQklMcUxRcGNtR2xHY1I3M2dUV2xRbk54?=
 =?utf-8?B?STFTY2ZBQkZqOS9HZEhZZU5SOWxuRTJtdVBsWi9DVjYwS3lqQXB3enlNMmQx?=
 =?utf-8?B?MmtEYWhmNDE5RkVDU3hybjByc3V3UlNSeFJsUnRnQzFyYTE1R2lpeGZEa0px?=
 =?utf-8?Q?hsgwh5yT94szYC2f+cNpKFAAEmdAdcruFAKCE?=
X-Exchange-RoutingPolicyChecked: DkKTmN8mFovazndoGGkNz/FzGBlEOvtSJhcnBQR9CP9Yf1kH0UW+O34rhka/CcaGLtUnlcefJz+qQrVp0ltLfDDURa12E4rzB0m4syBLJ7S7zldvXMGr52Qo1laM1Z95jLOKz47v+FXIkQG/3CPpegYfkwqC8nlhhCN5qoy+OMs1pInYjgUexrSIYY6HMasDK8JsBHF2auIjenCT6YbREg/M5jnEM0axI95Uksg4Yj580uGjivIsKdClYSaGjljHXW2QLQVjpJhWWfgvKH/c9NpmqcibSUlH2gIb/hN5kzfjDi3nLETIovKxWDQLtPz+H1iLhGJbDicF3pfXpy6vvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f71d9e5-129b-48b7-7dda-08dea66c827e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 03:56:51.1384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFe5WpQppxQ6m2hpuDUgO3SQZgPa/Dy8vTnsm9MOcGjFeBLFIkR5MshfiOTX5xIKPCE0MLRIvu8aR36rAQi/vJDTlad1yKS8cxG/VlWoXVCwz31qdEfjJ5j4NTjx0IGB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6075
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

Hi Vinod,

On 16-04-2026 14:55, Vinod Govindapillai wrote:
> No fbc reasons have been updated in the driver. Use the same
> "no fbc reason" being set in the debugfs by the driver.
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   tests/intel/kms_fbcon_fbt.c | 22 ++++++++++------------
>   1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index b36582011..78c6cc4b2 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -297,18 +297,16 @@ static inline void psr_debugfs_enable(int device, int debugfs_fd)
>   static void fbc_skips_on_fbcon(int debugfs_fd)
>   {
>   	const char *reasons[] = {
> -		"incompatible mode",
> -		"mode too large for compression",
> -		"framebuffer not tiled or fenced",
> -		"pixel format is invalid",
> -		"rotation unsupported",
> -		"tiling unsupported",
> -		"framebuffer stride not supported",
> -		"per-pixel alpha blending is incompatible with FBC",
> -		"pixel rate is too big",
> -		"CFB requirements changed",
> -		"plane Y offset is misaligned",
> -		"plane height + offset is non-modulo of 4"
> +		"pixel format not supported",
> +		"tiling not supported",
> +		"rotation not supported",
> +		"stride not supported",
> +		"per-pixel alpha not supported",
> +		"plane size too big",
> +		"surface size too big",
> +		"plane start Y offset misaligned",
> +		"plane end Y offset misaligned",
> +		"pixel rate too high"

There are other no fbc reasons being set by the driver for ex:
VGPU active, plane not visible etc. Shouldn't we consider them as well 
here along with this?

Thanks,
Santhosh

>   	};
>   	bool skip = false;
>   	char buf[FBC_STATUS_BUF_LEN];

