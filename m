Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28988C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 12:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA31910E07D;
	Thu, 18 Jul 2024 12:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+hbd0ZL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297F4891B4
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 12:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721305221; x=1752841221;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=88UMz6/813EopPTFWhpTHJ1z24zkwXCovAOdEUH4gtM=;
 b=V+hbd0ZLI8s+WfeP+kKOBSj0YQPAAZHDKHgEhU3cO52J7H47MfQhB+08
 FSZQzowHjoETP+/X/RZqJ42K4YzkXzRZYgAQonbBJIq7bIjmksUUVOsCu
 xiHJe0KxOzGmK88vdB4tDWaptFOHKm/PN3B93qhnEEITuwvCGXKiLj1yU
 1gAS+L5k7q9Bb+lpzJuNS/qPO2cxBNSiY0d4QdnQgjkNx2aCldazTG93D
 pY9je8P5eT2SxADkzSfiRFAj+/CyNMAyvuaBFQl22lDX6rY1VPtCArQDI
 wMb8ZwDzevPZf/HsgGGsr428VYuHA8htAacFHIPAos0mjwsaBvd7pamYE Q==;
X-CSE-ConnectionGUID: YWMPdBmtQlOH3jr1Adn5uA==
X-CSE-MsgGUID: dj+up5zgSmOrs7JIEx0YHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="36301856"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="36301856"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 05:19:03 -0700
X-CSE-ConnectionGUID: ju2nkdWAQluNrfis7DD+bw==
X-CSE-MsgGUID: r0HBOcz2SvCIBGoS3+n2cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="50692088"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 05:19:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 05:19:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 05:19:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 05:19:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocJXP6f+iuODt+1QRCwUO7yn8Fz2LHU7BZUKoy4mnXC3rQst5IpQ1og7nW33j+XbzHr6jXqT4fc6wlRfQgaMsOtFP3gsAwwz1Ar9fKG8NhRTv/+1/06HN5rqsThvGbC6y8ebd27kpS8yWmQCRDgo7aqEJnxOP19/YKEzb63PxgU701ki0semNGOVvXeOI4BXgZhW+abhc+2mKzS9ODMCDbOgTx0NHpA2Fbdp11UV8XgxxZGZQDy36nQIeN8ZwCt86Uk5gtVzX8qdWi3R3Lsk7KHqVUCH5ESiSgbTLh9uqOLso5Y+lf+YpkQoO4+XqC9qmi/8TxNvqF4usj9e/pI/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2RS+B00poz+8qBPaz4zussS/RbO1WlqwEehgmbCMH0=;
 b=G7WpzhcCVDHXmqp4t25SOc24zuN+Hm68azp6ozVr20R3Ar6uoAKuk956wTbYwkXxUDDrvRkYzwhzHDAcCfYcWcgRqRHup90XNsQoOv5IJj/Wljkap2T4yLpJYGBm7VjSAvK14+gBmhS+3mcRd9rrx/tC8tZpp94/gWr1QjhuVNYmUFiWcY5DtXmc81N4Vqc0GJwmOZvgu+cy1uHU4tDEOFSqHeaYbwOmA3bfHlrYh4FPOKKn8Cy8M/tij1bUgHGa2tby2fQC57WrgFmXQ9Hy0766IWuyRF+EidHFrXPopokVNbC1jXsL7bjY9Ahmg4T77qyIeaiiAQHKrB8pahFQVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 18 Jul
 2024 12:18:58 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 12:18:58 +0000
Message-ID: <9c2641dc-b749-4a82-acf9-dff2769ff636@intel.com>
Date: Thu, 18 Jul 2024 17:48:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 1/5] tests/kms_plane_scaling: Update the single
 plane scaling function arguments
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20240718111146.665240-1-ramanaidu.naladala@intel.com>
 <20240718111146.665240-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240718111146.665240-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a08aec-3d2c-46df-37b0-08dca723ccff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXowOXA2aWtIUld5S05Oc0lNemlVTFZZZlR2cUtEb0hvYzN4cHBFdFF5S0tI?=
 =?utf-8?B?cU9aSENjc1Z0M29oeFBQYTNGRDZCWnYxNGEvMnRYbGpFOWE3YnpEVWV3bWI3?=
 =?utf-8?B?Y2Z6ODlzbHFmWWFIZk5GNmVweWZJOWxnT2ZYK2hoYzZWSmZUYTJ3ZmJTZWFi?=
 =?utf-8?B?OUlWYy9pdkMwUjZSVnY1UFJ3YnREcUlEYzZwbWg1cWlIR01zZjFPY2dxZysy?=
 =?utf-8?B?ZTlwajdOck9zcnlpRmQ4U1hqV1NJQUdPTDl4YjlsaThhVXo3VStKR3N4Rmlm?=
 =?utf-8?B?NWlIVlRLUGRxZkZtYmNvUm5ZbXZBVSsxT05oOEVyWGN6UCtBd3pOZWJ3WGNr?=
 =?utf-8?B?bTh1eU9ZU0ZIYnVWSG0xK09YV09BZjNXQk9kUTBjZndmaU9qOFFHMUZxQ1Rv?=
 =?utf-8?B?T3hlRTBHV3k3alVmSWUxVXkvS0hyQzZCSmt4WHQrZlRJMnVmRXVRM01YQXRI?=
 =?utf-8?B?WDZBNTVSUmZ2SThHcHZWM2pFUXRuNkIydCtOVWpmdHdGSlN1WUNxUkkzU1Qy?=
 =?utf-8?B?UWUrKzVKZFdsZjlRN21rRWlqUS95OEhEWllYZUxxV3orTytwMnFTUmpJR1Jr?=
 =?utf-8?B?K09qQWVTZ1ROSExFa1JyMWdiSldmQXVESHBRTXpGQUE0VjhsOHR3cFFsMkh1?=
 =?utf-8?B?RHZUR2hBWFV5eDNjK0J0MGtsK1crVyt1QU85dHA0OENqejZGL2JoUWF1aUxP?=
 =?utf-8?B?V21uVHhnNDR0cSt0VURTQ1c5ektUQlRMMWtSdWlyeEptOFZXaXBJcFI3VThO?=
 =?utf-8?B?d2JhSFhXNEsyZktMRzVnYXg0a0dwTmVNbzdrcDdzVmxoMnJ4TUJYeXpmYlBs?=
 =?utf-8?B?dklzUzd0aFZzeW80eHY5K2NoVDFhZjVZYWxYRGZzQkpYM2NWMXN5Sk9ubGVX?=
 =?utf-8?B?K3p1dms4QTJYYkZTS3g4OTdGNGRUR0dpUzEvYlRINms5VEtWM3FoeDRudFlh?=
 =?utf-8?B?SzI0RlZKYlkvVVJzdndXWStvRm5tZVNDektmbjlqZkNpd0drQTRlZnRrRmZC?=
 =?utf-8?B?ZHF6MUZXNllBdGhXOVlUNjl5RlpNRTBKZXcvbjhIeC9ycWpxb0VYTVNDNHRV?=
 =?utf-8?B?LzBxcit2dE1PTzdCS1lXZ0hoalR1YWZtbHBhaTBqTkNXQ1ZoVXpuOGRHSmpv?=
 =?utf-8?B?amlqZkFrYUVqSHFaZnZIQm9OV3Q3eDUvWVlFY3MzbHNhdkJOVEo4YTMzVjB0?=
 =?utf-8?B?TVhldTcrbjNUeUxONk5GMDRVZ3NUaEQ4TEdPRFIwZ0QzQTQ5WEsvRjVaTjNx?=
 =?utf-8?B?QUxsYWM2dW9hK1VZZll5eFd2dEw1RlpGU2orYVBiMWdvbnArZWIwZWN0K2hZ?=
 =?utf-8?B?ZG5TdWIwWTRTL2s1OFBvQWFsQXh5ckFXVEprdFlFMzdWaWM1bG1NbU1BMElt?=
 =?utf-8?B?MWtzZ1RMUTNZTHhNSUlRMkdIQzNDcTFCcmJ4WUFIdTRmUzVFa0JhUWhsOFUx?=
 =?utf-8?B?WitHYVh0cHNkRUZtUTc1Y0xRVllGWTcyWDdPVUhuc3dKMXBnSnVuVGdyMUUw?=
 =?utf-8?B?NDlaeGdPRXllVmlWdnpFMGpGN1RGOW84NFc5OXpaeTM4M093TnovSzNxV2Mx?=
 =?utf-8?B?djlwTk15QnczT1ZER2FDeTV5dE5RK056L3pibkw3eWJhVDg1RklzM2hFRlRE?=
 =?utf-8?B?TG9PRFhtY1g3dU82VGl6SzE1N3pKYmJDdFVKbDFsWGh4Y2UwZ1dWWDBHeXdi?=
 =?utf-8?B?Q2w1cDRtblRhR3V6WDk5SENmdnJZQVV6MEFFdWNrUU56aUs4U2x2cFVWRExq?=
 =?utf-8?B?d0V3OS8xYTFWM2NjNEZRSFVZV3J6ek9Xekg3SXVhSmt6UkZ5MGdyNHk0S3F5?=
 =?utf-8?B?R1ZTVmZ3VWdhT21aMmFGQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUpnYTN6WFdPU2xCc2VwK1hKeWhpejlmZ3ZZUHRDOVBJWWlCRjZyS3B0K3dq?=
 =?utf-8?B?dy9PM2Nxc29CWlRJS05sN3VGMk1nS2haMzBzb3NDSUZUSDluVUF5bHpiQXFZ?=
 =?utf-8?B?KzBkaTVSWVVzZUpiOENiTThPcGI0RzJGNkp6dVJkZEN6ZTJxRmlnYmRlL1Jz?=
 =?utf-8?B?T1dlYjV4ZHZPclE4WWNtMXl0ZUdRSmk4SUFlQ2lNRnpjY3JGNFExUkF1MmZH?=
 =?utf-8?B?Y01lTlZyd2FsczNyRG9VRGt2UEgzd0ZHNmk3MGl6NS9lZUY0TDRNQldiUzVo?=
 =?utf-8?B?bWZxR1FDVkdFOVRTMHdaWUlxZ2p2b2hpeTdXRkxza1V3K0RkVzlqNXRvQ21J?=
 =?utf-8?B?N3doMXhxUWp1M25aT0JLbmVqWWhhVXlkejVIMG8zR01sV1NQMUpyQXpRcTFo?=
 =?utf-8?B?WnNUT241ZmxJYmZ0OWc5aXRSNTgrSXZvb2VOSjhzZ1FCWTZ1OTd4Z21pYVp6?=
 =?utf-8?B?ZHpDT1o4NTN6RVliYWJ2ZzFtWU1TZDBFV2NpazJ4RUptdlpHMjYrWlZhYUg2?=
 =?utf-8?B?U1BTbERXS2hLTGdKRWhXZ0NLckN0RWtjdGVOa1FhK004eUhaYTBlYXpDZXJv?=
 =?utf-8?B?aGoyZEFQZFVaTWhrR3JyVjRCZlFUNDJldUE3Q2Y1S1d4cUxORzU2QUlmSVhG?=
 =?utf-8?B?eUJ6SGozRlRvSkpiaGxqWUh2V0h4c0FVcE1sQ2lXTU9hYVVIN1RPTThEMm80?=
 =?utf-8?B?RU5IbFduK0dsNXA3eVB0OVRFejJFdXQ4WG5TWTNCemQrS05GemZVNmhiNnlT?=
 =?utf-8?B?cDhvakg4d2t4dmVVa05jWlh1ZjRETU5JQ2F6MXh0MUVtaTBraFFVMWxjMmt3?=
 =?utf-8?B?R2Vaa2M0N09xbXhtclUreEpZMjk0dGQvd1R1MjBYWnhyOFB4UTMrVmZMcVhK?=
 =?utf-8?B?ZllvUnpvN0llQkk5d0J6K01QS3h5QXYyVDJRbDBRV2N4RXFJYno2czdKTmM2?=
 =?utf-8?B?dllESVFSRDUwYmVEZjV3d3V4TEdlMVBIbmxvTUV2TjJBaWRZQkoyNlVJWFlR?=
 =?utf-8?B?SUk3b1dZajU3dEppVG9jRG1rTkVoOGU1aG9lZjBBU2ZSRmtMZDB6Yzd1dkdt?=
 =?utf-8?B?S3ZCMXdqV3NFUTdSN0w2aXJxaVZrSUQzRjAzSzd3MVd0akUyUDd2cjNBcjFl?=
 =?utf-8?B?TXJDTVY1KzBDazBiYk1ROHZOaU9xUnAyelpPZHZBSWRVdnFNU1UzUDI4WlB6?=
 =?utf-8?B?Q1h3eHhUdThQWEt6cTN5eXZKSjc2ZDIyVDRNV2VPcEdZWXpRMzc2Vmw4RHpp?=
 =?utf-8?B?WWFrcVZrazVVdlhVWk5kb3d3SjZJMHhWbkdxM0NqWDlHV0QzMTZLdWh6Ylor?=
 =?utf-8?B?RHcrQmozZXlDMVI1bmxGSmgxSERMMkpPZzhBQWQvNGZ5RTl5a2ZjTldmTWw1?=
 =?utf-8?B?Vm1waWNiZjhQYzhoVTh5WTdLNDhaWHJlSWhpQ2c1L0RtTXIyeDVPSFc3U2R2?=
 =?utf-8?B?d2Y3REt2RWUybWpaNWNTRUFydk9lZEhYOTBzOXZsRnBwdlV6NksvOG5JaGVo?=
 =?utf-8?B?OUVEb0l5QzNTczNvMzR3RnVXeUcvaTJSRjdkRUJnSTRJcTE3SGJTc20vb2x3?=
 =?utf-8?B?V04xRTdmSjU5N3JyTVc5bFNMc3RPUXdobUY1MDFtdnlmb2MwTXVyMkh3b0RH?=
 =?utf-8?B?eU1oeE5DOFhRQ29lYkRRT09rUFd3Wi9jVXpkMUNzZk04aHE5NDVlTzBSWXVk?=
 =?utf-8?B?THMwaFdMNTRHMjd1S0pwL0drWjA3RUwwMHlPOGo1Wkk2bkVaMThIWVRmZkNi?=
 =?utf-8?B?V2hyY0tKRllMNDhoemhUeWJLYk9sOXJxODVaTmcyMjNqSU1UZkxzY1NuSUxr?=
 =?utf-8?B?VC9QVHBNY1pQT1NPTFlGdkhqQ2dlSTMwM0RXN0hGdzBQRkVUVGJXWVRmcDhQ?=
 =?utf-8?B?QnBLWFg2V3dneExDMlg4d2tMRzhueVpJaG1ycjEwQmRacTVlZ3dUdWFUUDl0?=
 =?utf-8?B?MEl3SjBiTEdEajk4U1VNMExBK00vWlRFRXhxNUZOeFd0ZGlCSFZpcTI3YUo1?=
 =?utf-8?B?YndWNFNNcHYzaUFoVVNSZytLeHlrZXBQcWFCUU1NVTJVNStXRk5HaEFXR2Vn?=
 =?utf-8?B?d1lzQmtqQ3EzVzVNQWlGUm1mS1BmZXIydkw4VWNSQlBDK0F1dE95RVFMWnJs?=
 =?utf-8?B?RkxkUzduYkpheDFCQ1BMc3dGNXNIbWRXQ1h1UHVIcjVUdEdCSzhaclNDaCtF?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a08aec-3d2c-46df-37b0-08dca723ccff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 12:18:58.5593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5waBfSdXHFR0qy7p3QHLtS8/HnJKulmdPUZYaqHr+NVETEZtOThQj3wXjb02ozPpXdqndIZymm9f3OzLVq1Y1GtmE8f8nMx4akwp40YpA74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
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


On 7/18/2024 4:41 PM, Naladala Ramanaidu wrote:
> Update the helper test_scaler_with_modifier_pipe,
> test_scaler_with_rotation_pipe and test_scaler_with_pixel_format_pipe
> to use a scaling_factor and is_clip_clamp flag instead of explicit
> width and height parameters. This change simplifies the function interfaces
> and allows for testing scenarios, where we need to recalculate the width
> and height based on the display mode. Adjusted all function calls to match
> new argument order.
>
> v2: Update the function arguments (Ankit)
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 85 +++++++++++++++++++++++----------------
>   1 file changed, 51 insertions(+), 34 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 3f63d3cf4..bd38513ab 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -569,7 +569,8 @@ static void cleanup_crtc(data_t *data)
>   static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   					 uint32_t pixel_format,
>   					 uint64_t modifier,
> -					 int width, int height,
> +					 double sf_plane,
> +					 bool is_clip_clamp,
>   					 bool is_upscale,
>   					 enum pipe pipe,
>   					 igt_output_t *output,
> @@ -579,8 +580,16 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	drmModeModeInfo *mode;
>   	int commit_ret;
>   	int w, h;
> +	int width, height;
>   
>   	mode = igt_output_get_mode(output);
> +	if (is_clip_clamp == true) {
> +		width = mode->hdisplay + 100;
> +		height = mode->vdisplay + 100;
> +	} else {
> +		width = get_width(mode, sf_plane);
> +		height = get_height(mode, sf_plane);
> +	}
>   
>   	if (is_upscale) {
>   		w = width;
> @@ -603,7 +612,9 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	igt_fb_set_position(&d->fb[0], plane, 0, 0);
>   	igt_fb_set_size(&d->fb[0], plane, w, h);
>   	igt_plane_set_position(plane, 0, 0);
> -
> +	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
> +		      "Mode fail with  %dx%d\n", w, h);

This change does not belong to this patch.

Regards,

Ankit


>   	if (is_upscale)
>   		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>   	else
> @@ -693,7 +704,8 @@ static const uint64_t modifiers[] = {
>   };
>   
>   static void test_scaler_with_modifier_pipe(data_t *d,
> -					   int width, int height,
> +					   double sf_plane,
> +					   bool is_clip_clamp,
>   					   bool is_upscale,
>   					   enum pipe pipe,
>   					   igt_output_t *output)
> @@ -716,7 +728,8 @@ static void test_scaler_with_modifier_pipe(data_t *d,
>   			if (igt_plane_has_format_mod(plane, format, modifier))
>   				check_scaling_pipe_plane_rot(d, plane,
>   							     format, modifier,
> -							     width, height,
> +							     sf_plane,
> +							     is_clip_clamp,
>   							     is_upscale,
>   							     pipe, output,
>   							     IGT_ROTATION_0);
> @@ -725,7 +738,8 @@ static void test_scaler_with_modifier_pipe(data_t *d,
>   }
>   
>   static void test_scaler_with_rotation_pipe(data_t *d,
> -					   int width, int height,
> +					   double sf_plane,
> +					   bool is_clip_clamp,
>   					   bool is_upscale,
>   					   enum pipe pipe,
>   					   igt_output_t *output)
> @@ -749,7 +763,8 @@ static void test_scaler_with_rotation_pipe(data_t *d,
>   			if (igt_plane_has_rotation(plane, rot))
>   				check_scaling_pipe_plane_rot(d, plane,
>   							     format, modifier,
> -							     width, height,
> +							     sf_plane,
> +							     is_clip_clamp,
>   							     is_upscale,
>   							     pipe, output,
>   							     rot);
> @@ -757,8 +772,11 @@ static void test_scaler_with_rotation_pipe(data_t *d,
>   	}
>   }
>   
> -static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height, bool is_upscale,
> -					       enum pipe pipe, igt_output_t *output)
> +static void test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
> +					       bool is_clip_clamp,
> +					       bool is_upscale,
> +					       enum pipe pipe,
> +					       igt_output_t *output)
>   {
>   	igt_display_t *display = &d->display;
>   	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
> @@ -787,9 +805,11 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
>   			    can_scale(d, format))
>   			    check_scaling_pipe_plane_rot(d, plane,
>   							 format, modifier,
> -							 width, height,
> +							 sf_plane,
> +							 is_clip_clamp,
>   							 is_upscale,
> -							 pipe, output, IGT_ROTATION_0);
> +							 pipe, output,
> +							 IGT_ROTATION_0);
>   		}
>   
>   		igt_vec_fini(&tested_formats);
> @@ -1307,13 +1327,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -							drmModeModeInfo *mode = igt_output_get_mode(output);
>   
>   							test_scaler_with_pixel_format_pipe(&data,
> -								get_width(mode, scaler_with_pixel_format_tests[index].sf),
> -								get_height(mode, scaler_with_pixel_format_tests[index].sf),
> -								scaler_with_pixel_format_tests[index].is_upscale,
> -								pipe, output);
> +									scaler_with_pixel_format_tests[index].sf,
> +									false,
> +									scaler_with_pixel_format_tests[index].is_upscale,
> +									pipe, output);
>   						}
>   						break;
>   					}
> @@ -1332,13 +1351,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -							drmModeModeInfo *mode = igt_output_get_mode(output);
>   
>   							test_scaler_with_rotation_pipe(&data,
> -								get_width(mode, scaler_with_rotation_tests[index].sf),
> -								get_height(mode, scaler_with_rotation_tests[index].sf),
> -								scaler_with_rotation_tests[index].is_upscale,
> -								pipe, output);
> +									scaler_with_rotation_tests[index].sf,
> +									false,
> +									scaler_with_rotation_tests[index].is_upscale,
> +									pipe, output);
>   						}
>   						break;
>   					}
> @@ -1357,13 +1375,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -							drmModeModeInfo *mode = igt_output_get_mode(output);
>   
>   							test_scaler_with_modifier_pipe(&data,
> -								get_width(mode, scaler_with_modifiers_tests[index].sf),
> -								get_height(mode, scaler_with_modifiers_tests[index].sf),
> -								scaler_with_modifiers_tests[index].is_upscale,
> -								pipe, output);
> +									scaler_with_modifiers_tests[index].sf,
> +									false,
> +									scaler_with_modifiers_tests[index].is_upscale,
> +									pipe, output);
>   						}
>   						break;
>   					}
> @@ -1381,10 +1398,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -						drmModeModeInfo *mode = igt_output_get_mode(output);
>   
> -						test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
> -							mode->vdisplay + 100, false, pipe, output);
> +						test_scaler_with_pixel_format_pipe(&data, 0.0, true,
> +										   false, pipe,
> +										   output);
>   					}
>   					break;
>   				}
> @@ -1401,10 +1418,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -						drmModeModeInfo *mode = igt_output_get_mode(output);
>   
> -						test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
> -							mode->vdisplay + 100, false, pipe, output);
> +						test_scaler_with_rotation_pipe(&data, 0.0, true,
> +										false, pipe,
> +										output);
>   					}
>   					break;
>   				}
> @@ -1421,9 +1438,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -						drmModeModeInfo *mode = igt_output_get_mode(output);
> -						test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
> -							mode->vdisplay + 100, false, pipe, output);
> +						test_scaler_with_modifier_pipe(&data, 0.0, true,
> +										false, pipe,
> +										output);
>   					}
>   					break;
>   				}
