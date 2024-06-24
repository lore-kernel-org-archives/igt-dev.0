Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77700C2BD05
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 08:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2980689701;
	Mon, 24 Jun 2024 08:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2p1VPO8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E9410E3A7
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 08:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719216471; x=1750752471;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MPl4Gk/exq/yypDtbKNBzdokXcA0uzHTQihXho4XdUU=;
 b=l2p1VPO8vZ3Ixnj0rcHldZtHvRPBmE9RVwH1i799KbWtCFT9Vg5C+xZM
 C3CEiqxA6DbLyytC4mo/D1k4lnhA5e50e54YuYoximd+quQZSigFG9fEQ
 3+7A9Vb1DMMmnthIhIxCCBgWspby+sPX6Ls4IUXh0Zrlimb17nFnMppWy
 bU8sYVILRH2WZTT1VRPL0ejW2rYNp4TL7ydbF+f+xHxPFAp0OYpOARvPi
 KyiJpga7xpqjzcZz4pGDi5D3DqAEHCWuoqy9HKMv3rq9URXk0TGZTHyD4
 nkIE/TlPsqHtlyg8Hlqb0rlm+DpphD56roxrUmeTii0Wvy8/GghkashRs g==;
X-CSE-ConnectionGUID: hsD4YuGHSWaMVgATgworkw==
X-CSE-MsgGUID: sPS0PBRNShK7kx3T2ie9GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16404052"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16404052"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 01:07:51 -0700
X-CSE-ConnectionGUID: 2NwJaI5ZQ/iWVULVGRfhcg==
X-CSE-MsgGUID: T62ABKMVSiymWdOuRRfeVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43914396"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 01:07:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 01:07:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 01:07:50 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 01:07:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTzYSks4IqHiPvUL+UEVxkmaaS+0Rrvmqv1AUo2cJu17J2hIqG1W9NKWLK9bPLvubBK4olpwGzjMNvbHFqsxmCGUZBIzXI8Bem1+dHDFUiCwGs0kxcDb20YFobi4LHdQfqxiNY/xLuQtyHFJs21+qILBf5dEWwvA31dL63dk1ovU6EJVFs6c9jsa3KPz31rrmLNWUNH6HrpLV4VkrSDS/cdgQNcJZ0Q59IB/j0CayLHCi/ykpmsq+odQ2VT7mEYIRKdYj3oTe8Lhv+f0E8Skz+1tiOXZwl63rLPso44dFspedr5OMo9xrnTmZLRCZV/oHkQEplHU6L/43E3jZ9V2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQ8nUQa7tfA6jsR4Lk47SWRtM/FybYLRtmZ8cIU/BP8=;
 b=emPqgFX1vXktLr1udlTEqcqcYFzPLNWyto4t9itqA8gSUnFiFvtELZTKilMIu/js1qpoMEwG1Vg/gRApUfcGZ/aL+g5F8X0gaGGBX/K54LmX3J1ItvExi2AAZZNPwJcRWe63cCOP3x+2FQsCmbFyodglmUYZO+THa4i5ILFjLMI6YKEFexlxCmUMDUoHpdAqaYhYAaBJg9fJex0TurwYhOIOsnhloQDFaic4X6hAI8+LMIXfUUgc5qVvLgRGmGO+dEGz63t1bg9cwRovuUiZ8N1JS4/3vDLtQDkvLA8/I1LEBtt3wYoW+D6GITXMrrLIzVAELv/Kdvy2HxXx+TUljA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Mon, 24 Jun 2024 08:07:47 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 08:07:47 +0000
Message-ID: <8f194575-f296-4c8c-939f-7adf23c506ec@intel.com>
Date: Mon, 24 Jun 2024 13:37:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib/igt_debugfs: handle xe driver as well
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240624071805.1356668-1-kunal1.joshi@intel.com>
 <20240624071805.1356668-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240624071805.1356668-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0195.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::17) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|DM4PR11MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d4857e-72ab-4f28-08c0-08dc9424bc30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm44RitORHdzdTVXSHV0Wmh4MWtJN0t0YmlWb1dicHUybWIzek54U2JXNGwz?=
 =?utf-8?B?b2x5N3dmdmxvRkIrR1hzWjFqcW5ScG4yZEt4c0lKVE5KTjJOS2ZXT1l3K214?=
 =?utf-8?B?UDgrak84bGhDSHlhL3cvWVIzWjYxQU8yc2ZMeGd6TFdFd1YxNlY4Tnlhci82?=
 =?utf-8?B?US9ERVk3L1I3ZXE2cGVCcFpPTXUzS0hjcFA4V0RzN0tUemVkM25INlVqMENn?=
 =?utf-8?B?SWhHNUR4OVlITm9ydWZVY3RrK0dHMVAweUZZK0wyRUVFbHBQeGxHYXJjdEtv?=
 =?utf-8?B?RWl5MHlOVDhRdFhVVTBtTlkvb1V2dTBtcjh2UW9NRC9qMmxsSjNCM0M2bSt5?=
 =?utf-8?B?SkMyR2dPaGdRZTc0TTdLQXBJMEhQeXVlMTRBL3FYcWpLeTRhaFE5bXBFS3Y0?=
 =?utf-8?B?Nk9CVWlna09WdzROU3RkMGdpbklycGo1aHNpTEZtdi9saEQ0cGZySW9kNGxZ?=
 =?utf-8?B?cXVLeDRSL1ZOMHVUdGgxTzRGSlJFemp3SnUxTlFjenZzQXVqWWNSc1FXaU5Z?=
 =?utf-8?B?eDB4cmIyUlREalVHbUQxM3FxR3ZEOE5aRDZxdlVDN28reTdZUERNczJsb1ZD?=
 =?utf-8?B?ak55ekdwbEE4STBlOUpDVktWSzRUREMyNWNqcER5UERSeG9FNWFxWml1VXdN?=
 =?utf-8?B?MmpuZGZrNTBzd0F2SXhYOXhHa3kwN29uOFdBbTBJaElRR1JpS29YNEpwYUk5?=
 =?utf-8?B?WHNDV0RQbWZoSFJPL2FYL1gydkRwb3NEdWVONEUwWThMWHFTUzBybkNYUlF5?=
 =?utf-8?B?Wm51MU1QWFJ0aC9tVzRjcGp0azVlU1BTK25BSkZIK201Q01sZFR5SUZaOWF1?=
 =?utf-8?B?bDFzQUZyYldRSTh4cEx6UVJkS29pbVBHbkVJY1FCd1NxditsSjJDblpnOGY5?=
 =?utf-8?B?RktJVWc0ajl6NUI0bVZ5K0xRMEhjeHVZcUVhUXlQSEJoaVB0ZE9YZEFjR3J6?=
 =?utf-8?B?U09rSGlBUVNaMzZJNytYT0x6b0hVNDJNMkpRdld0WjNHcFR2WVJWanl3MmZU?=
 =?utf-8?B?eWhPL3lyd1hEd040cnhmQXVLYTNnc3BPZjV3cWxua0NLekdzd0p2SFR3Z09O?=
 =?utf-8?B?Yy9FTTZnV3hzUm1Dd2hMRXErcFcwc1dRVzEyZ04xbVVweGIxejJHLzZ3U2Ft?=
 =?utf-8?B?TmoyNkh6YVFGWWZwQ1I3UUNUbHdBMGhJUGJhUW1sQ3piMXlLNWRjN2Rjemtp?=
 =?utf-8?B?MXZNMTZVTGZLak1iKzFGVllES2RtVmFZdmx3UHUveUVqcVB0ZVE3T2hzVHhI?=
 =?utf-8?B?M1I5Q210QkJER3pzWG9HQlJld25Va21mQkpucW1CQnI2YWFPMUpVc0YzZ0cv?=
 =?utf-8?B?VzRTcGxvR3B6Sjlxc0hFb2pjOHl6Z280WTZrSVFmc0hZSEhqYzVHVS9PMGdT?=
 =?utf-8?B?QUZVMHRkbUZzaEtPMVFDbzJKQ0FyZUtrZi9Bc1RvNHo0aDlqNVhiaGRrd0dI?=
 =?utf-8?B?aCsyQ2Iyd0NtbG5GbVZVd0R3NERjeXJ3a3IzS0RscEh3cHBGeEVUNno2ZVJa?=
 =?utf-8?B?eWVCRjV2bk9VQkxWdy9WSVRWa1RxR09UeXJ1aDIvUkFUaCtDVVZzL2o5ejFL?=
 =?utf-8?B?aVczN2RUc1NYdnNjdmxIZ3plc2xqOE9kcUtUNDlMRnc3clVpOFBhcXYyWGcx?=
 =?utf-8?B?OWtTdFl0K3hJd2hnVlNoRUxRRVNIMU5CSkRaVVlIYmYvNGdvd2h3Qk4yVXFX?=
 =?utf-8?B?aUxEbVNHTDdqQjRDRG1Ta3JIQjIyNEl4UXNxUVJvd1BUTDd2ZDBnTXdUZktC?=
 =?utf-8?Q?xRiqkrelLc9hKxukS2ZJTudjWoPI75xdiQ//+b8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzhVL3hOT1dQMUhrYjY1Zkt6RmlXRFEvT0FFNWJxUSs3S3h5RjBUaGd0eVFu?=
 =?utf-8?B?K0crRWlQUlBaaE1EVDRaUEJEM3c1c0lCL283ZHBXeVN0dHNDVmxrYXpKbFp2?=
 =?utf-8?B?dStoVUdsdjczRVdyemMyQitrQkhidlFrb1IyRFpja05hSGhzc3VOdXZOajBM?=
 =?utf-8?B?SEZWTmFFTmxvQXB4eEVBR3FkbllwNWRVaUIrd3JZL1NwdWt0a3AyTmx4NERM?=
 =?utf-8?B?U1d4WU5vK25ZNFFMeWVyUEgreS9UZWpjUHNPRHVRMjIzdjZWRDM3Y1ZWNm5W?=
 =?utf-8?B?dGlJSnl6Y0R1V2VRSVROc2MwbHdSY2gxbzdKYkd6ajlIZ3p1NTc3RHBXdnBY?=
 =?utf-8?B?UjBPRXE1UlhlVWx3RmFjdUdUUVdrQllPSE5vemxxOTVvSmZLVWJXUzNQWlZP?=
 =?utf-8?B?Tzc4OUZxUWl0dVBOek1pN05PcW43Z3NEY0RGWDc4b2pUSEZsMHBTUUNYL0cr?=
 =?utf-8?B?ZkR3a2IrZDloTnFsS0Riazd0WGZYbmcvMHBjVnBycnVUbEVGeWZxSU1iVmd0?=
 =?utf-8?B?UHQyVWxLdExIamF4SExTQTlNWDJxNHAxbUtJVVFXSjd4WU85N3UrZUVPZHNy?=
 =?utf-8?B?ZzdhUmEvYjVKRXBkK0c4bzNwV3FjOFg4VUk0Zk1GY1BXVlRCby91TXhXMGJD?=
 =?utf-8?B?cU9pSFg3VnBCdzllNE1RZDhwQVowSFN5dmRneU51WERURVV6dHZqYXJBMDc1?=
 =?utf-8?B?KzB5UW5IZW40QmIvOG9mREo2Q2tCWFFZSjAzQjF4Skl1cUREUmY5am1CYWtq?=
 =?utf-8?B?b3NvemE3SGptSFlUOTRCT0FucVFJQ21WMndjSlNMQXB1MXQ5b0lkeGkwcENK?=
 =?utf-8?B?bUxlQ0dhVkJPTDAxRmZPTkE0MFpCMElWRDgyTzc4MEJ6RGYzU2ZpdUYrUzc5?=
 =?utf-8?B?cDd3UFRyb1pJeDZ6R0tiRytoSFh5L2d1RHVES2dORWtmUVhBSUJ2dCtselY2?=
 =?utf-8?B?M0VZT0dyOGdCK3p3eVQ5ajhCTFNYM1ZFSjZHOEh2K3hna1dtVXhNMXZvVzIx?=
 =?utf-8?B?WG53cUtXcURTL09vTndGbWh0b1UxWkdQS0MwZDYya2gyUldLQ3dzMVV6WWxp?=
 =?utf-8?B?RlRBRUZXNGd5OEQ0VElyN0xlMEZjMnRQRlF3MWZJU2Y0WStwWFkxQlo4TTN1?=
 =?utf-8?B?S3g5N3RmUHBuUjRGZmljNlo1QmxMa21hL013a2lMYlVLbEhXa2dob0NKQnBV?=
 =?utf-8?B?SnYzRnNmNEZNNlBQWWJMOWV2enl3NW4zWnJBYWg4YnNqREhucHJiVU1WVjlF?=
 =?utf-8?B?VEU3Vy9KYldkQzhsbjVycTZ6QnM1cjRmVHlWZjEzVDF4VUVkTklJZzA3OVdt?=
 =?utf-8?B?WnhhN2pPSEUxQWR0S0RaRU4xWFRmR0VaZ3NtRnBTd0s0MTlHcXNDbzMwdDJh?=
 =?utf-8?B?UUFQOER1aGhhd1hBaDBZZ1VXb3M2WmZtY21TT1NMTStPcG5jMU05RWxKZ2Qw?=
 =?utf-8?B?Rlo2ck0yaHZxbm5UazRUcG5WVDYxR1ZsTFVCNXJFcDhnek1ocjRkdDVPVHhB?=
 =?utf-8?B?R0Y2QVhScHhLd0ZzYUVQK3lmZmliN2gxaFdDQllSU29YbWZmd1pWR3FuL2JK?=
 =?utf-8?B?SjBudmduTmgzaDhOY0lXTFFBRlRLUndPbHErc2x6QTVCVHNXaGdDWU1hRUg4?=
 =?utf-8?B?NWRKOUZwUnpJd0M0MHFrZGUxRG1IeEVVeTVnUjlQUjFkWW03c0U0MHVLRldD?=
 =?utf-8?B?dlBROG9BZ0NRa0RnTXMzdmx5b0RiWjdYbkpKTUh3OTdlU1NaNXRTM041dUxJ?=
 =?utf-8?B?Ky9MZVJCUWRKNmZ1Zmx5NnNQbEh0b1ZYZVdXZ1ZVYlZRR1htQU15QVdiRTJ2?=
 =?utf-8?B?QXEyb2dQTHJZTlBvdUxSKzMwcVhkN1hUc3dNMWlOb1RzU2xLaE9HU3FpZFNS?=
 =?utf-8?B?YmNnUm9NUkdTWXpHS1ZFK1JDNm5kNGU3S09QR3luQ2JwVGxiUk92dm1UZVJL?=
 =?utf-8?B?NE1KK2F2dEVwNU1SUUUzZkJVckNPQU03ak16cGxzRnpuM0FtdmJaWThIc0Ey?=
 =?utf-8?B?SlJUb3lyRHlRNHhFVU10b0ovSXhIQTZUcHR2S1dDT1JOUXgzcXBPSDFhSHdx?=
 =?utf-8?B?QThJdktyK2ZGLzlPbzNoTmpHbysvN0ZDcWIrN3c3NE9QUG9GMkowbDVqWktq?=
 =?utf-8?B?ZURDKzkxbWRla05qMTl1SGtmMGxmWldtbUJER2thT1FxbzJ2VU0xZC90T1c0?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d4857e-72ab-4f28-08c0-08dc9424bc30
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 08:07:47.7940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YpF6QU4l8eZC1ASE0fOcHxXYA4R630X7EciccLWTwKQuGBQSEXvtTR754W876uYHxDscyYBZYPXBIYjGNkUuqEBoMn0bTX1o2m/IgOqvOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8179
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


On 24-06-2024 12:48 pm, Kunal Joshi wrote:
> add support for xe driver as well
> 
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   lib/igt_debugfs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index a7b54bae5..f4f749e30 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -502,7 +502,7 @@ bool igt_ignore_long_hpd(int drm_fd, bool enable)
>   
>   static void igt_hpd_storm_exit_handler(int sig)
>   {
> -	int fd = drm_open_driver(DRIVER_INTEL);
> +	int fd = drm_open_driver(DRIVER_INTEL | DRIVER_XE);
>   
>   	/* Here we assume that only one i915 device will be ever present */
>   	igt_hpd_storm_reset(fd);
