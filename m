Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBD9C0219E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 03:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D316C10E639;
	Tue, 11 Feb 2025 03:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6aFLzgP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B7810E639
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 03:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739246302; x=1770782302;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PeTTXQG/qNh8GgoPlyCwgtQu/laB5XlmhBmPB7DFxJ4=;
 b=B6aFLzgPox9xCG2BSQBLGKwt9VPByhAVnPLUkQmgc+omSHu4CokR+SF/
 7Wcck1E1Duqx1HxJfvxq4mP3IMM2sash0VsXH98vtftDRyKxhJZgrgWz9
 CCPah2JYRznywnNrmvMNwNZD9wsAsXKAvdr1D/mKgkF8eM0mHMowL7+Vo
 dIodtG59Gf8pHyZZBsshFSTCpU2rVszSWrOB7001Lc49oREjmz2MQzFXY
 uYo3O5iWTqPtX1fc2LLcI9w+6ba+NqpFQC0JPy1Nm4UOrhLAUXyvj15ca
 yjzJKwsXKY+t6NKo++OqC2YVQkqO56hxKWCMbtEqXalF4Wd66F4n+kWeY g==;
X-CSE-ConnectionGUID: yp+RVAWTQLy7A4gSRJfEDQ==
X-CSE-MsgGUID: DAR/AMdYQlyhRUzvQpGkzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39050778"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; d="scan'208";a="39050778"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 19:58:14 -0800
X-CSE-ConnectionGUID: qyl5XJGpR3yQ98uo/EKRww==
X-CSE-MsgGUID: MQK+O3T1R967OOvFohwszQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112245437"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 19:58:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 19:58:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 19:58:12 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 19:58:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojrwD6VAas0UcCQ3YnbEgxZgEY0tcJmCp6ScgQRKQKU+tmEzd9P3CPz4hqxH0dQvXsFpuitwn+kz+MhvC0xYDWqzmaja/FkGnDUz7NmwgpVWq/j+U97+O8GD3BhuO82uMoRdf99lc/qrZRVsCf/VPMqbGe7mA/JNrn89u4j9H93NSLpnX3h/Wua+9kOgCiPR4scdSpgcdpKj/lOpEvoxDwBGlR8jGuhhyL/tPkcCCc3yjXCFGEpJTLETb1hFze2gKL/WNFbjJd+TxiGYgJeHDT41ATyPqziKEo9FXXz3Lv5osYEPzGotM0pFGl+Ohakr1GwdS/5w8p6fJi98p6Nh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfSY2Plew7zmQAGu1+4CElDfxf2A4Jc+qs21XrS48dM=;
 b=PllviDalZiksvZTunda2eBJXi+K5iHDKzhbnOm169YLoyIKJXqBWoPohTJOKs3Keb1an6NC74YDLRJPYhl/NEj0WYGJ5p/20zZsrpudv40qQyD+lhGPAdu41iOfM5qiP+Ag75eqi09GOTlg9xed/dZK5VPPAfKepcnq8KDPhPtqnQjabaWZTC8TshC+SII0OEB9vmXTNTgPd++7u0ARM4DhXnpwgl/pCpTXHzaBkUDK57S8P5L+BRCgdVWJgTjsUF46mQCHpkT3K2Cd41undZtWlTITLeD00T+dA0qZ7aPcip1xfkYYfFlVlSLf++tyYP+PbBdMBBlvwQWBeF/1P4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB6329.namprd11.prod.outlook.com (2603:10b6:510:1ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 03:57:37 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 03:57:37 +0000
Message-ID: <3494168b-d8cf-4847-b000-6dd21bc0c68f@intel.com>
Date: Tue, 11 Feb 2025 09:27:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/6] tests/intel/kms_mst_helper: add helper for
 MST-related functions
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250210185606.1327892-1-kunal1.joshi@intel.com>
 <20250210185606.1327892-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250210185606.1327892-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d27cc90-f54b-4569-2ac1-08dd4a503922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGJ2YUtzUFV4ZjhNU1k1UUpzTnFXQ3lnNEdWS0g4NnRiTEgramp1UU05cGxv?=
 =?utf-8?B?dWNpajZyV2NSK24rdmdmdTdSckJSQ01ZUVhUMTJJQmhDMEtPMWdiRXJCcnJM?=
 =?utf-8?B?TGVSVGFBRjNndkp0bVFJNitwa3VGSUxsTG1XRnN3RmxrVlVOdHdXU0ZXcm0r?=
 =?utf-8?B?QTZnQTZ2MGJIVmJnOXNjSlFLMjY5NzJtSVNmVDlNV21pTE1qVmE4ZlNpZXhp?=
 =?utf-8?B?Vzk1WmE0WVNmNGU0U1FBeVgzNGFqZ08rMGNYbFZPM0NmS3NjVTJLS2lPSDRG?=
 =?utf-8?B?RmNpNkt0UG00NmpBQ2lZeWhURXF6dWhlcjgvQWVtaGUyZVdnQUZmd2JNeVhs?=
 =?utf-8?B?M3BtUlNFNmkrWFVNUUdtY1NDK2lWR0F6eURPL21XT2Flb2xvV3JnODRKWWpl?=
 =?utf-8?B?YnBFczQ0QWdxRlBaZ1JzSWxMOXY5dldrbSs4NTVZZ3JOWmJOc09qY0RCMzA1?=
 =?utf-8?B?UnpQSFFEb010SmZTOEdkY0pRVWUrZXBURm9CNXd6MDB3WlQydENaUmgyQjZS?=
 =?utf-8?B?U2ZveXhDaGtXODYvcXlOR0FkVk5IQzN2QUhOYU93QlJ4VCtRZVBEVEkyUmtz?=
 =?utf-8?B?RktBeVp6TnYvNHdWdStUQ2RBeTNRNlRjcmxVd25XbFV1VDZkRlRISkE4TEFL?=
 =?utf-8?B?ck0zSDBKQW41Vng1YzUvS1AwVzR0Zy9MMEkyYWlMRVRNeEVyNGNNR1UzUDkr?=
 =?utf-8?B?aURIYndKeDdHdWlEcnJrbW95WFJZSTh1M0NqN1NsVkVCYkJTR2NtNk9udzdH?=
 =?utf-8?B?b1UxTXpYcEpsbFFjeStMUndvNjdmRUZjSmZabElxZE1lUzFPM1lFWlp1Kzlp?=
 =?utf-8?B?dVhDQ0NLa2UxSjZjV3cwMmhhOGlFaGFaakpaVTduZUVLcm5SMUtjTERFVjV0?=
 =?utf-8?B?R2lzWG0yZE90dGc1YlVwZmVDSVdrOWx0MDh5ZHpkaEtiRXl6OCtHM0hOc21K?=
 =?utf-8?B?ODVOd1JoK1UwOTg4eWEzeEplYzFGemZGMTJKNDRpNWVvazVZYkpyWjNLcWFk?=
 =?utf-8?B?ZVNCNmhxU0c4UXhSWkhKVUFXVHpLaXpUaHhMRGxNb2E1U2RNWnpsWXVUWTRW?=
 =?utf-8?B?S0hOUEJwL3ZKR21SRlltNmZuQnlxQmpsQitZbGpOZXR5ZWxOQjBHeGNYbXVN?=
 =?utf-8?B?Z0VNNHJxcUlrLzNQdTZpRXN6enV6TjhPR0wyS1FCdHhkOWN1ZlAwV2xTWEZ5?=
 =?utf-8?B?L2Z6cG9SZC9VaThGdWxUaE1kYmhkUWZSYjBaRnNlckduQUNuSFBQWHJHaWVk?=
 =?utf-8?B?cnVkWFJ6VHNOM3ZJZXJ6UUFsL2lZT3FNSjl4VGVzM3hmOENOZWMrZTVScEdo?=
 =?utf-8?B?LzEzWCtqU2RTL040RFpsUzFHeGM3d2lYM1JhdVdnQWhXd0IxYndVMHFIOFJT?=
 =?utf-8?B?M3dDaGtlc1F3VkRiY09TQitPajkxZWVEMkxQTVFnbmM4YUpiZ0RVL2hjMGgy?=
 =?utf-8?B?dHBGSnQxbW50cUVnRHR0K0RMRUo2M3VBbDduZ3VUYTJQUU82OGt0aFFhZlh1?=
 =?utf-8?B?NktXTkVmeEFwL05ZV0ZHa01nM0RKVys1Ym9xTVdDSXZYT0VIRFFQZTN3d0xO?=
 =?utf-8?B?WkVORFBmZml2K0s5VVpKSDBLQnIwaGd1Z0lBNHVrcnpPblAvc2Y5M2o4TW1Q?=
 =?utf-8?B?NjJpREQ4ei9lRyttQU5zNkQrakQwUzdCNitvKzA5cTNvQ2k1bW1YZ3lncVNy?=
 =?utf-8?B?SFNSMHRHckZ6Q1NTTlBUeWJhRHY3bVU0dy9UZVZ1ZDJYRzczWk4zWWpuMU1n?=
 =?utf-8?B?ekZXckxkWUN5VXFNVHVERVJ2MWNvOTNyUUpyVzBOVjQwUDRLM0lWWHZDTUxN?=
 =?utf-8?B?aVc4UE14UE9zM1pzdk9zb0VNSjRHSXkvejk0RXQzT0lGTXFSN3Y3Q3lIamZC?=
 =?utf-8?Q?kneyauRKJs1Ol?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dy9QNnp0cnJPaXFBWDlUWDhmQ00yR3VudDN6Qjk4bEtsdHhzQXJqWVVORU1Z?=
 =?utf-8?B?NzZVV1pUR3lobm5qQTVlSHZ4WC9DSWNSODR5RE50Z0xKVmJpa1hvL3pqV0Ry?=
 =?utf-8?B?VitlVkp1RUZWYVliWkxRKzZIazI3aWdWL09xbTgwd2JpVjEwdkUxaXp6WlVZ?=
 =?utf-8?B?TUNVT1VyS3V5VkxUYjNSVHcrdnhOSnRMbVI5UWU3ZFMra3M3dnE0T2dNRGU5?=
 =?utf-8?B?QW1kY3BtdnhsRW9HR1E0UXRkcHlocGNEdE5nY1BvVkxZS2s4NGlZTU1vbGUz?=
 =?utf-8?B?WXd6dXRaYjA4UTRCTllUZTZGSDlZRUJrWjM1aUUrL1NZZ0FzQ1FpSTEveVBM?=
 =?utf-8?B?MlRJcDA4Z2tob0JnaDAzMWVBZ2oyTTdONXBieGNrdVQrbStMSnZWb0RpN2t4?=
 =?utf-8?B?Z1RmaVdqSXU0T3dhaFR6Q2N3UU9MMmM5VVlBbGJSNEZCeFlYS3pxNDliSVBW?=
 =?utf-8?B?SnhRa2F2Y29rYk1vKzFzY1VpVVlEcEpMZmo0Y1dxVmxrc0N2ZnZlLzZMc0JP?=
 =?utf-8?B?WUZPbXB6NWRmTU9BamZSeVA5UEwvVE1uN084OXZ2bVR5WkF1N01zOTdDZDR0?=
 =?utf-8?B?VHVwMTVVOUZSU2ZWbmFHeTF2aUJZc2xEOGFQVk16SEpxMWVXa2RIY09nQmpm?=
 =?utf-8?B?ZEdrYjlMb3djVzZrMEM0bm45RXB6bk0rL294aC83c1NEZXlpMHFIMlg1NTRQ?=
 =?utf-8?B?dkYxY2pXdG1Ia1p6UVRtTGtrcXltR3B1SHhKcHBDcnlTa3pUTStwVEVJODZD?=
 =?utf-8?B?cmZvWjJFNVdZLytWVjJ0NUpLd3VVbTljbXlGK1NpNnFtakFYUXhCN2R3aDdX?=
 =?utf-8?B?MWIxNTJCb2I1VFFCMDF4MzNNTXliMnB4L1BGS3ZqZmdnQTExZk9xUHE5bTRj?=
 =?utf-8?B?Rk9VSzZlVUtML3VBdHg2MmNIQTdLSkVsU2NFcE4rYllQcjFRalk1ang2ZzU5?=
 =?utf-8?B?SEVwZjZtVlJ2NkJZQjJBdTJ4UlZwU1NLZWVJRTQyQjFBTTJXa0JFZm1ZckhH?=
 =?utf-8?B?WFZueTlqNzJzSEVsbXo5ekRiTkJsUkIvV3N6dGxwYkJ3STQwc1R3V0N0NDlZ?=
 =?utf-8?B?V0VoNUtUK3lySnZvTXJyZHJJdEVTN3BMbUdadVJ3MHJ6RWpCQ0E3L3dLU3N0?=
 =?utf-8?B?TTVBaUdzUTlmc2tYSzdQSDhKSVR1b05LVUlTRlQrOCtQdnJudlRQOGxCV0Fj?=
 =?utf-8?B?cVhmNzFSMzJzS1VmV05icmhOSVRCcWUzb2VCY0hJb29LaDdyVDE5dkpuTmpR?=
 =?utf-8?B?bzZlb2VOTjdqZ2JKSlhPSVFPQzFkZW52QlZ0NFUvcHBEamxCbW9HVDBHU05h?=
 =?utf-8?B?dDk2NGYxb2dQWTZJb3BvU05tRGtJWUJkMUVmQ0M4d1FPNW0xNTQxRG5DY05y?=
 =?utf-8?B?QjdhU1JFRTU3Y2ZUSWhZNmJvL3BGR0RMdVh2U29ISDlGeVEvZE05aG0xM0Uw?=
 =?utf-8?B?eWpXR1FodSsvUTI4ZWVYaXRXQzRndnQ4OUNwd2UwNlZZYVR5bldCTzNZMHJk?=
 =?utf-8?B?RVhnaDFiQWhFZUEyMlVVKy8wT08vdjNHT1hkd1Y4K0d0ckZUazJ6V3F3aW0r?=
 =?utf-8?B?VGQyTVNMTmlrRnk1cnhERlJ3RTNxTHVMMUEzcXllbHh1RkV6VC9BcTRDL29Q?=
 =?utf-8?B?MXRValpWTWRrTWZIQ3dRWUNaK3B2aGhnTE1qR3FSU0dSN3Z2dTlJSzJhRyt3?=
 =?utf-8?B?d3RoNHFNb2RlT3FyTEdDU09kWmF3U0dJY0pwNTdadTd0MnFSeGt2bEpCb1d6?=
 =?utf-8?B?eUpaTUJhOXRlbFd2VGR3STE5Z1FTVDVXZENwUEYzZVdvWWhINlU0WVBWT25a?=
 =?utf-8?B?WHFHVlZsU1Jjci93TytOS0RXUVhqdHNDQzBvQXZYRHYxL3RraG8vaGdlYUNm?=
 =?utf-8?B?dk1uQW5kYWRINE8vbXlwZkhZZjY4aDJubUJiY0laTXpOWnZpeUJyNWpTLyty?=
 =?utf-8?B?MXRmZHp1OGZWRTFwcnpjdjg1UW1UUjBDQ256MUZCVHRDaHczbTRld0RPZVVR?=
 =?utf-8?B?ZnRaMTZ3QWZMZmVISzRWaTJRUURiZEJaWUNHcU5Yd0FEa3pHcm43YVF4cTVG?=
 =?utf-8?B?V0Z6U0g1Nk53U0lZaDBpSTNaS3FCd0V6ZERwbVVsdUdiS1FnUFkzMTBySFdL?=
 =?utf-8?B?OVErY3NFZXlCdWFsNGRlMWlZUGlHWEdSaVVubGRibUVDc2xlU3JUTUtWalJj?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d27cc90-f54b-4569-2ac1-08dd4a503922
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 03:57:37.6815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tvDF6gVhDzWXuduR3sCniPiUTys6m19zeYb0Tmvfkr90uRyyp11fzygoFZU6vGKcjsZ4TMRvoew611TzntmhNFu5VsRewqB5NStscE6o5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6329
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


On 2/11/2025 12:26 AM, Kunal Joshi wrote:
> Add helper to centralize commonly used MST-related logic.
> igt_find_all_mst_output_in_topology() enumerates MST outputs
> that share the same root connector id.
>
> v2: fix docs (Ankit)
>      change return type to int (Ankit)
>      split patch (Ankit)
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_mst_helper.c | 49 ++++++++++++++++++++++++++++++++++++
>   tests/intel/kms_mst_helper.h | 15 +++++++++++
>   2 files changed, 64 insertions(+)
>   create mode 100644 tests/intel/kms_mst_helper.c
>   create mode 100644 tests/intel/kms_mst_helper.h
>
> diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
> new file mode 100644
> index 000000000..fb5aaab77
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.c
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation

s/2023/2025


> + */
> +
> +#include "kms_mst_helper.h"
> +
> +/*
> + * @drm_fd: DRM file descriptor
> + * @display: pointer to #igt_display_t structure
> + * @output: target output
> + * @mst_outputs: filled with mst output of same toplogy as @output
> + * @num_mst_outputs: filled with count of mst outputs found in topology
> + *
> + * Iterates over all connected outputs and adds each DP MST
> + * output that shares the same MST connector ID as @output
> + * into @mst_outputs.
> + *
> + * Returns: 0 on success, -1 on failure

Just return the ERROR code.


> + */
> +int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> +					 igt_output_t *output,
> +					 igt_output_t *mst_outputs[],
> +					 int *num_mst_outputs)
> +{
> +	int output_root_id, root_id;
> +	igt_output_t *connector_output;
> +
> +	if (!igt_check_output_is_dp_mst(output))
> +		return -1;

return -EINVAL


> +
> +	output_root_id = igt_get_dp_mst_connector_id(output);
> +	if (output_root_id == -EINVAL)
> +		return -1;

return -EINVAL


> +
> +	/*
> +	 * If output is MST, check all other connected output which shares
> +	 * same path and fill mst_outputs and num_mst_outputs
> +	 */
> +	for_each_connected_output(display, connector_output) {
> +		if (!igt_check_output_is_dp_mst(connector_output))
> +			continue;
> +
> +		root_id = igt_get_dp_mst_connector_id(connector_output);
> +		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> +			mst_outputs[(*num_mst_outputs)++] = connector_output;
> +	}
> +	return 0;
> +}
> diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
> new file mode 100644
> index 000000000..637ca696e
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation

s/2023/2025


Regards,

Ankit

> + */
> +
> +#ifndef KMS_MST_HELPER_H
> +#define KMS_MST_HELPER_H
> +
> +#include "igt.h"
> +
> +int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> +					 igt_output_t *output,
> +					 igt_output_t *mst_outputs[],
> +					 int *num_mst_outputs);
> +#endif
