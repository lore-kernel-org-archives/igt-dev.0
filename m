Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FABFF8873
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 12:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C5310E431;
	Thu, 30 Apr 2026 12:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8AqmuQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEE510E431
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 12:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777552787; x=1809088787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YHyGOSvZzulIaP48WO2WZfwk1PVMPuMunyWam/wqiEQ=;
 b=T8AqmuQwunspLThTJwE/A1pUASGNHv1rGqi2QbZgJwbjv1o1LBkQ8NQc
 QHtFTKP1FhpzADZINX39sXo5r6bOG8wiQNFUIzC7fG2CmCmBEsQWmxNcR
 Hq7GUbEpxdz6BS9D6WpW9Fx4aB/MLulwucMmsMTqG0PrhdxaijEYVF8KF
 ZdLJjBtMf8rOVwzEHZbURZdRpRmG62hQ+6PPUns+GlxUmIj52PW+00VdQ
 fO0n2Rf6T2Q8aG2mRkenZ1HtW7WhEFFqwi2SHE9KtI2xNmj0I562hWSua
 RTPINkNuU74L4yPBdEX2Eju3epcHknB2VsUPdvK8aLRFKOcINus2MFBkV A==;
X-CSE-ConnectionGUID: mHVFsuroRtyyAqaP6Arxkg==
X-CSE-MsgGUID: w5aG+gZMSByAeAwSDkGy6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="96066579"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="96066579"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 05:39:46 -0700
X-CSE-ConnectionGUID: e/leItAjQWOhmhmKDALmMQ==
X-CSE-MsgGUID: QURwxnonRAyir3Tj8maD7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="239558987"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 05:39:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 05:39:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 05:39:45 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 05:39:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1bQdiOgmpQIGzAYfeWgdw80JGDmfuTC8YauH/WfIo5R8dZcii6FvziN7/ccZp1xNNN3NoxMrw7O9T/y81GNO17RseR5FAVrhDWjHYfIqwLyKoNe2Fb7BSmCbCPAIAxTFNLn9I5UzLsYD6T/UeZT/392yrzeP79rm1r6wjmM5gF0T41MDDm5NrmpTHYpZVehnqivfVviUkDJ4olXscwzmk7lXZOX7npT3mnMLbG3/fle7W6xzjYDiapI/4EVuUxHqSktE+cnN6XnLPWDIg+S5Ux87DE6vFBtIcQ7AVenS7ej1+ATwlyqHxW2MTrxf4Gh7ZEtebQKc1Kh3HnzZF0YzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgsFFhHWjdHlzjSHExebvyLfhdWsVB6eQJ12NmYjfP8=;
 b=Jz4hHChlYQblY0hbKVupn0GCpnUU4i0LMDrFwmFReilfpLkdVWhiNcwyCmN/ZPHddjMPpiydd+U2UX4K3Lkm/Jl9Qgf1hgLYoLwLSf8vNrPqIS1d0n7hKQABcR+yMW98OvUAkXubr5E9m/x0932CKgJsmwFReoL1ifWO+oaRQ+a1Kk6MJlWyEK7CSCzjEWV3+C4q/TeuCsYl/hHsv1GEjV4xa/vnRtiL3ZIkF+ZzIqcwlGRkg4+ieqp8KPfbjDMCnoBugNBlSmqMPYWTuhu6So5M6Zt1puQ6Bu76WVLaw1BRS67kJ/nGx+ASh3UVPGFqDyMOQy6z6jzHGRwM8cz97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA1PR11MB6805.namprd11.prod.outlook.com (2603:10b6:806:24c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 12:39:40 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 12:39:40 +0000
Message-ID: <4794fbde-e17a-45fb-8750-ef15fe946e22@intel.com>
Date: Thu, 30 Apr 2026 14:39:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_sriov_flr: Add vf-driver option
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260418102621.467394-1-marcin.bernatowicz@linux.intel.com>
 <20260418102621.467394-2-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260418102621.467394-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI5PEPF00000924.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::830) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA1PR11MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 646c5698-2bab-498f-6d9c-08dea6b58bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: X1gticDpDLz8EJHmhAKoDEgAcXWG9AoFqrfb6fKPBEk/QiPmpmAwkq2WvDkcko3fjz9uUa0Rh2Qgdi82DqfsbcCiH/kYIF9UuPiF3liU8abceEeePSDBA8aAwLRsYnos4834utKPZHvl6d+fIik0Et/JJY9Kshz7lFkZKSy65pZX/dwlqKt+QqDq2vUdcoewrLUkpb9PZDsJfWwj5ePnVWr97uESJ84Xsc/OQhi5ZlLFZB3YAyVMSY6epjNVHNJdAkB/r+x+yvWBoJO4tkuuSc6C+HyuQ+QfAyRyYA5Hz1Upo2Qi0nWlO380Qx2jWBvugxIOshWmpdyys2svboxwXmKqDLHRxq1HNILPdOgO5OMCeF/dCyGA5XfzNQthUC1E0ngfBptCDCdgyD6OLhlq2YVc+XymZTbM4Enyf+5jpZh+WngizrncVkakg/brNhvqOy4JZ6T6tS3rf8OIk1anrdBM2cf3N9kFEN8vS83NKORgI1iG47wEqrQIWX/0lrksTpofNct22PdIN/FfE90hfJUmyKOaruDrtUIayrFW/dR7iGl/y2ktAX8NIZCZtNMwp/ytrz+osRCXG0uZkkHhsus8JBnq6Usi0/0xGsAmLTo+5UlbQuXCLL/twipah3LoHYwWQAhhPTCpaW4k3FExLRvIOlDU8C/K6I0aL2lxPhELQ1urN7rIC4SWXwrpzPeodZWA4/bPlRf/E53FKrLlnfLjV3z3VxmjShPJ3GKZBIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGUvSkV0M2VIUEt0Y0U3d2NyeCtNR2c2WDN2bng2dFFlRVprb0NtbWRKZUJu?=
 =?utf-8?B?cy9SL0E1NEZ2bEtGV1R6Wk13Y0loMnFPSVVqZUxWSXVoR3JXdjRIT2dCWEF5?=
 =?utf-8?B?azBSaE9STEJXcTBQczlFTkRVbmlvVVo3TSs0bWs1TW5WNXNuNi8wQTV2N1d6?=
 =?utf-8?B?cStWNTRaR0ZsNDZPRXZ5dTVwYkZHR1NFQXZqeU45VUFHRzJmMmxuSklEbEw0?=
 =?utf-8?B?NnRhaExEOXcxSVQwMkVrVGVmcGZwM0xnVCtoT2dYNFFLNHIxWWNZNERHYUZ3?=
 =?utf-8?B?T0tKNDZBSVVYTHg4UEYyTk9CSmdtM0JDSzA2UzFNMnZUR3RjWU5uWEJ4Wmkz?=
 =?utf-8?B?dk5EVFAxMWs3aEprczN3VXM3Nm5qM2F2QktjSXZQMUUrMkJ5MTNobUY0SmlL?=
 =?utf-8?B?QmllRW1LcVRybzJFclRIZE9nS3diNHhyZmZrUWFLS1orc3Q2ZTl5aERWWFBI?=
 =?utf-8?B?ZysxeXYwK2FGMzFEejZSaWdxZVFqZFltYUpjTkdaUG1hRXYzcndqVjRENnJY?=
 =?utf-8?B?cURyYWNMU2pxVmIyZTYvQWN0K0ZoUmtQbWVkTHBxZU14ZHJKTktkUDc3VVNk?=
 =?utf-8?B?QjJQeHB0MTFaT2o5a0N4REdLK1dEdFUzZHVndzJvQjVPbnVyZ3BsZXo0OXNW?=
 =?utf-8?B?SWtnbW0zUmlCVk8xdDl3bUFoWG5YNGlVSzhxdHVKU05XTkpSR29mYXd3Z2Vy?=
 =?utf-8?B?T0hhN1QvRGFFQ1hRVnNWWHJFWFlkYWw1N1ZHbmpzUGxsU1JGVE5wR1VmNy84?=
 =?utf-8?B?NlY4VXhqQTRRS0NxeGx4K1hSS1gxMXNDSlBMN1BFQXRJbUpUN08rMmdnckIw?=
 =?utf-8?B?dFBGU1I3UWxyUGNVMjlQR3FJM1hwMlZEN0pNbSs0YVNMeHpjVDVLUUZDQWI2?=
 =?utf-8?B?RjV2WTFSRkd0KzY1ck1HRm9wTUk3ZXFaVmhKYTdHWW5GYnJWWnhwZG9SeUg0?=
 =?utf-8?B?MVBGM0hZLzVIUUZEU1p1a0dQVVNpcXFDOTVDSXNtVzBUMFZ2cWluc0R4TXN4?=
 =?utf-8?B?WFRIb1lQaWtlZStTSFA2MVgweUJQMlpqOFdEU0xFWDBveUJYNHI5Q1hSRnZa?=
 =?utf-8?B?M2U5RGJZWEc2R2RsMXN0c3ZQK2YyZnZpTjFuTlk5NWE2eWRDb1hRd0RBSjlh?=
 =?utf-8?B?SUhSU3BCOW5ZREd2UkpUM0ZwUmsxVkhkY3pyZ1ZXVEV3UkExTHIwZEJ3QmJV?=
 =?utf-8?B?RjhqbWFwTk91TWRKRWpNeWt2MUg0N1BVL0tkSHh2R2NzVERaeGhUb2JzbUs1?=
 =?utf-8?B?N1Vqd3d4Sk0yWjI3cjkxT1Y5MmlOKzhPMXYxZU5XNWZ2Y0I5NEw4L0ViYytZ?=
 =?utf-8?B?NjVpYm5WeHNxSCtUcWl4RmdnaFJqRFg4M2lVTThsbGtRNHJJV1FRblkxV2J1?=
 =?utf-8?B?amJHT2N4ZTRnRG5EVExudjVkb0pMM0h6YVdUKzk3Mm5KVTdnSkNyeXZmUjFt?=
 =?utf-8?B?T01IdTdUVXdpTDUxeXE4Q2ZCTUtTM2lITXFvb2tYUHdHUnM2ZWQ0aGppYTVp?=
 =?utf-8?B?OUJkSkxjNFYvT2ZwRnZYV0xubE4rMFR5NERiYS9XblhuakJvSStEaExtd0JM?=
 =?utf-8?B?MWFaRXZrOHhvaXN0M3RxV21qUmIxeWVqZ2dHY21jRFd5c2I2Qk5NdUMzY3FC?=
 =?utf-8?B?ZFF2bXh3d01oaW1hdW1Qb0o4eTRaNkY3Y0h4UDRmeFNWOSs0K0RpSHREbzlN?=
 =?utf-8?B?WFFReTl5bXltcVNnTUo5MlE1WGE1N0hSYnpoVWkwVHdrN0hEak80ZnBpTkli?=
 =?utf-8?B?N2ladGRiWHpRb3RieU10aktKSE5zR3Vpc1RyeUdFT2N1QmdReHhqckFHL0Ry?=
 =?utf-8?B?WlVYTUwrS0VFV00rR3JyVDhJeXBhZ0Z1VHdvUEdFcjBjMUYwZ0EzdkJwQ1BN?=
 =?utf-8?B?SWwzeGhtN0lUa1RweEROWFl4VlpMMnYyRGx4V1VaS2pMUi9mcHBpakYvV3dp?=
 =?utf-8?B?anByRFp5US9yU1diRUN6aGd1ZDhPTXd3WVEvWmh5c2NRUlhYZHBxSkZ3cWly?=
 =?utf-8?B?ZXhOYWRUaXIrck1WR0RNdWN2cmFZUUMzSGhBZlFQM2xLMkZUbWlKTGZNU05a?=
 =?utf-8?B?Zm5iL01pUE9nRGRwTWhFckpidUhzWW9IdGtqUllQeitrQ1RTbitza0tFN1Jx?=
 =?utf-8?B?UnJzQzNXSlBJeERUbjJEWmhzdmhaYzB6RHBHNGM3MVlLVnhQUE9VdHErSEdi?=
 =?utf-8?B?M1ZFdEtWZ1k1UUVnY2dqMFVTZ2FaRXhGSjJIOWNCT3hmRFB5amlvcXlKWHJn?=
 =?utf-8?B?MjNUQmZBbUZyWmFtOUUwNVpMRjhuamdRSk1leGlXWG1rUjQrdE5IbkdKUldh?=
 =?utf-8?B?aTQ4U3kyWjlDVWY2UzEzR1RFUTZ3cUNpZk5pOUtNM0k4SkI4bFJ3QT09?=
X-Exchange-RoutingPolicyChecked: NwJHjK+k1rUqnsQgiBUhdtCPtzg1//s8MexYrH5XUy9ghzwc5AF89ax6dA7mAvcHiyBqYj4p/sgowzQbGR7Vcu/Wl/FBaxN4fcihHc6igaLm3zdbd3yKkpGlNoNcstoi5jaWTDDQXPDxy5JUj+kpGCEsqLvmi2cwGRNHVlxefm9DEk/3Vkpebp43Qo/+oQ/pgf/BfRQxAPKn9Xug7SNV4U+mSuZIH23so9HosPHyC9UB0zG+lUM9sfnTPzS/QOt4T7UR67xpYOtsUofDw3FtRf0g8dLaIN5ZNGgxHZGprDEMWy1fNyfpZIt2MQeFLCls0gCMUG6FtH93h4rUH5bLbQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 646c5698-2bab-498f-6d9c-08dea6b58bd9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 12:39:40.1422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWKgZBbMuZZO6dvyjF7Nj3OUERodc2D+e7ARjCcTfBBQ3HBlNcYsiLlLZFos/t45tDlZS0mzTRvc6ttPdvlGqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6805
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


On 4/18/2026 12:26, Marcin Bernatowicz wrote:
> Replace the boolean no-xe-vfio-pci switch with an explicit vf-driver
> mode selection: xe-vfio-pci, xe, and none.
> This allows to cover FLR behavior with different VF driver bindings.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 236 +++++++++++++++++++++++++++++--------
>   1 file changed, 186 insertions(+), 50 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index be949fe01..370cb8e1b 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -65,11 +65,21 @@ IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
>   static const char STOP_REASON_ABORT[] = "ABORT";
>   static const char STOP_REASON_FAIL[]  = "FAIL";
>   static const char STOP_REASON_SKIP[]  = "SKIP";
> +static const char XE_VFIO_PCI_MODULE[] = "xe_vfio_pci";
> +static const char XE_VFIO_PCI_DRIVER[] = "xe-vfio-pci";
> +static const char XE_DRIVER[] = "xe";
> +static const char VF_DRIVER_MODE_NONE[] = "none";
>   
>   #define DRIVER_OVERRIDE_TIMEOUT_MS 200
>   
> +enum vf_driver_mode {
> +	VF_DRIVER_XE_VFIO_PCI,
> +	VF_DRIVER_XE,
> +	VF_DRIVER_NONE,
> +};
> +
>   static int g_wait_flr_ms = 200;
> -static bool g_use_xe_vfio_pci = true;
> +static enum vf_driver_mode g_vf_driver = VF_DRIVER_XE_VFIO_PCI;
>   static bool g_extended_scope;
>   
>   static struct g_mmio {
> @@ -139,6 +149,7 @@ struct subcheck_data {
>   	int pf_fd;
>   	int num_vfs;
>   	uint8_t tile;
> +	enum vf_driver_mode vf_driver;
>   	char *stop_reason;
>   };
>   
> @@ -264,6 +275,61 @@ static bool is_subcheck_skipped(struct subcheck *subcheck)
>   	       !strncmp(STOP_REASON_SKIP, subcheck->data->stop_reason, strlen(STOP_REASON_SKIP));
>   }
>   
> +static const char *vf_driver_mode_to_str(enum vf_driver_mode mode)
> +{
> +	switch (mode) {
> +	case VF_DRIVER_XE_VFIO_PCI:
> +		return XE_VFIO_PCI_DRIVER;
> +	case VF_DRIVER_XE:
> +		return XE_DRIVER;
> +	case VF_DRIVER_NONE:
> +		return VF_DRIVER_MODE_NONE;
> +	}
> +
> +	igt_assert(false);
> +	return NULL;
> +}
> +
> +static const char *vf_driver_mode_to_bound_driver(enum vf_driver_mode mode)
> +{
> +	switch (mode) {
> +	case VF_DRIVER_XE_VFIO_PCI:
> +		return XE_VFIO_PCI_DRIVER;
> +	case VF_DRIVER_XE:
> +		return XE_DRIVER;
> +	case VF_DRIVER_NONE:
> +		return NULL;
> +	}
> +
> +	igt_assert(false);
> +	return NULL;
> +}
> +
> +static bool parse_vf_driver_mode(const char *optarg, enum vf_driver_mode *mode)
> +{
> +	igt_assert(mode);
> +
> +	if (!optarg)
> +		return false;
> +
> +	if (!strcasecmp(optarg, XE_VFIO_PCI_DRIVER)) {
> +		*mode = VF_DRIVER_XE_VFIO_PCI;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(optarg, XE_DRIVER)) {
> +		*mode = VF_DRIVER_XE;
> +		return true;
> +	}
> +
> +	if (!strcasecmp(optarg, VF_DRIVER_MODE_NONE)) {
> +		*mode = VF_DRIVER_NONE;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>   static void subchecks_report_results(struct subcheck *checks, int num_checks)
>   {
>   	int fails = 0, skips = 0;
> @@ -332,6 +398,68 @@ static void vf_unbind_driver_override(int pf_fd, unsigned int vf_id)
>   	free(slot);
>   }
>   
> +struct vf_driver_binding {
> +	enum vf_driver_mode mode;
> +	bool xe_vfio_loaded;
> +	bool *vf_bound;
> +};
> +
> +static bool setup_vf_driver(int pf_fd, int num_vfs, enum vf_driver_mode vf_driver,
> +			    struct vf_driver_binding *binding,
> +			    struct subcheck *checks, int num_checks)
> +{
> +	igt_assert(binding);
> +
> +	*binding = (struct vf_driver_binding) {
> +		.mode = vf_driver,
> +	};
> +
> +	switch (vf_driver) {
> +	case VF_DRIVER_XE_VFIO_PCI:
> +		binding->xe_vfio_loaded = igt_kmod_load(XE_VFIO_PCI_MODULE, NULL) >= 0;
> +		if (!binding->xe_vfio_loaded) {
> +			igt_warn("%s module is not available, continuing without VF driver binding\n",
> +				 XE_VFIO_PCI_MODULE);
> +			return true;
> +		}
> +
> +		binding->vf_bound = calloc(num_vfs + 1, sizeof(*binding->vf_bound));
> +		igt_assert(binding->vf_bound);
> +
> +		igt_sriov_enable_driver_autoprobe(pf_fd);
> +		for (int vf_id = 1; vf_id <= num_vfs; ++vf_id) {
> +			binding->vf_bound[vf_id] =
> +				vf_bind_driver_override(pf_fd, vf_id, XE_VFIO_PCI_DRIVER);
> +		}
> +		return true;
> +	case VF_DRIVER_XE:
> +		igt_sriov_enable_driver_autoprobe(pf_fd);
> +		for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
> +			igt_sriov_bind_vf_drm_driver(pf_fd, vf_id);
> +		return true;
> +	case VF_DRIVER_NONE:
> +		return true;
> +	}
> +
> +	igt_assert(false);
> +	return false;
> +}
> +
> +static void cleanup_vf_driver(int pf_fd, int num_vfs,
> +			      const struct vf_driver_binding *binding)
> +{
> +	if (!binding)
> +		return;
> +
> +	if (binding->xe_vfio_loaded) {
> +		for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
> +			if (binding->vf_bound && binding->vf_bound[vf_id])
> +				vf_unbind_driver_override(pf_fd, vf_id);
> +	}

What if xe is loaded?

> +
> +	free(binding->vf_bound);
> +}
> +
>   /**
>    * flr_exec_strategy - Function pointer for FLR execution strategy
>    * @pf_fd: File descriptor for the Physical Function (PF).
> @@ -376,13 +504,13 @@ typedef int (*flr_exec_strategy)(int pf_fd, int num_vfs,
>    *
>    * A timeout is used to wait for FLR operations to complete.
>    */
> -static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
> -		       int num_checks, flr_exec_strategy exec_strategy)
> +static void verify_flr(int pf_fd, int num_vfs, enum vf_driver_mode vf_driver,
> +		       struct subcheck *checks, int num_checks,
> +		       flr_exec_strategy exec_strategy)
>   {
>   	const int wait_flr_ms = g_wait_flr_ms;
>   	int i, vf_id, flr_vf_id = -1;
> -	bool xe_vfio_loaded;
> -	bool *vf_bound = NULL;
> +	struct vf_driver_binding binding = { .mode = vf_driver };

It'll be set in setup_vf_driver().

>   
>   	igt_sriov_disable_driver_autoprobe(pf_fd);
>   	igt_sriov_enable_vfs(pf_fd, num_vfs);
> @@ -393,17 +521,8 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>   	if (igt_warn_on(igt_pci_system_reinit()))
>   		goto disable_vfs;
>   
> -	xe_vfio_loaded = false;
> -	if (g_use_xe_vfio_pci)
> -		xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
> -	if (xe_vfio_loaded) {
> -		vf_bound = calloc(num_vfs + 1, sizeof(*vf_bound));
> -		igt_assert(vf_bound);
> -
> -		igt_sriov_enable_driver_autoprobe(pf_fd);
> -		for (vf_id = 1; vf_id <= num_vfs; vf_id++)
> -			vf_bound[vf_id] = vf_bind_driver_override(pf_fd, vf_id, "xe-vfio-pci");
> -	}
> +	if (!setup_vf_driver(pf_fd, num_vfs, vf_driver, &binding, checks, num_checks))
> +		goto cleanup;
>   
>   	init_mmio(pf_fd, num_vfs);
>   
> @@ -426,14 +545,7 @@ cleanup:
>   		checks[i].cleanup(checks[i].data);
>   
>   	cleanup_mmio();
> -
> -	if (xe_vfio_loaded) {
> -		for (vf_id = 1; vf_id <= num_vfs; vf_id++)
> -			if (vf_bound && vf_bound[vf_id])
> -				vf_unbind_driver_override(pf_fd, vf_id);
> -	}
> -
> -	free(vf_bound);
> +	cleanup_vf_driver(pf_fd, num_vfs, &binding);
>   
>   disable_vfs:
>   	igt_sriov_disable_vfs(pf_fd);
> @@ -1025,27 +1137,44 @@ static void regs_subcheck_cleanup(struct subcheck_data *data)
>   
>   static void reset_only_subcheck_init(struct subcheck_data *data)
>   {

Shouldn't it be noop? And similarly to other subtests, the "reset-only" 
subtest should also load the xe-vfio-pci if needed?

> -	if (!g_use_xe_vfio_pci) {
> -		set_skip_reason(data, "xe-vfio-pci binding is disabled\n");
> -		return;
> -	}
> -
> -	if (!igt_kmod_is_loaded("xe_vfio_pci"))
> -		set_skip_reason(data, "xe_vfio_pci is not loaded\n");
> +	if (data->vf_driver == VF_DRIVER_XE_VFIO_PCI &&
> +	    !igt_kmod_is_loaded(XE_VFIO_PCI_MODULE))
> +		set_skip_reason(data, "%s is not loaded\n", XE_VFIO_PCI_MODULE);
>   }
>   
>   static void reset_only_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>   {

This would be also not needed?

>   	char *slot = igt_sriov_get_vf_pci_slot_alloc(data->pf_fd, vf_id);
> -	char bound[64];
> +	char bound[64] = "none";
> +	const char *expected_driver = vf_driver_mode_to_bound_driver(data->vf_driver);
>   	int bound_ret;
>   
> +	if (data->stop_reason)
> +		return;
> +
>   	igt_assert(slot);
>   
>   	bound_ret = igt_pci_get_bound_driver_name(slot, bound, sizeof(bound));
> -	if (bound_ret <= 0 || strcmp(bound, "xe-vfio-pci") != 0)
> -		set_skip_reason(data, "VF%u not bound to xe-vfio-pci\n", vf_id);
> +	if (bound_ret < 0) {
> +		set_abort_reason(data, "Failed to query VF%u driver binding (%d)\n",
> +				 vf_id, bound_ret);
> +		goto out;
> +	}
>   
> +	if (!expected_driver) {
> +		if (bound_ret > 0)
> +			set_abort_reason(data,
> +					 "VF%u unexpectedly bound to %s in %s mode\n",
> +					 vf_id, bound, vf_driver_mode_to_str(data->vf_driver));
> +		goto out;
> +	}
> +
> +	if (bound_ret <= 0 || strcmp(bound, expected_driver) != 0)
> +		set_skip_reason(data, "VF%u not bound to %s in %s mode\n",
> +				vf_id, expected_driver,
> +				vf_driver_mode_to_str(data->vf_driver));
> +
> +out:
>   	free(slot);
>   }
>   
> @@ -1057,12 +1186,14 @@ static void noop_subcheck_cleanup(struct subcheck_data *data)
>   {
>   }
>   
> -static void reset_only_test(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
> +static void reset_only_test(int pf_fd, int num_vfs, enum vf_driver_mode vf_driver,
> +			    flr_exec_strategy exec_strategy)
>   {
>   	struct subcheck_data base = {
>   		.pf_fd = pf_fd,
>   		.num_vfs = num_vfs,
>   		.tile = 0,
> +		.vf_driver = vf_driver,
>   		.stop_reason = NULL,
>   	};
>   	struct subcheck check = {
> @@ -1074,10 +1205,11 @@ static void reset_only_test(int pf_fd, int num_vfs, flr_exec_strategy exec_strat
>   		.cleanup = noop_subcheck_cleanup,
>   	};
>   
> -	verify_flr(pf_fd, num_vfs, &check, 1, exec_strategy);
> +	verify_flr(pf_fd, num_vfs, vf_driver, &check, 1, exec_strategy);
>   }
>   
> -static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
> +static void clear_tests(int pf_fd, int num_vfs, enum vf_driver_mode vf_driver,
> +			flr_exec_strategy exec_strategy)
>   {
>   	const uint8_t num_tiles = xe_tiles_count(pf_fd);
>   	struct subcheck_data base;
> @@ -1094,7 +1226,8 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>   		igt_assert_lt(i, num_tiles);
>   		base = (struct subcheck_data){ .pf_fd = pf_fd,
>   					       .num_vfs = num_vfs,
> -					       .tile = t };
> +					       .tile = t,
> +					       .vf_driver = vf_driver };
>   
>   		gdata[i] = (struct ggtt_data){
>   			.base = base,
> @@ -1152,7 +1285,7 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>   	igt_assert_eq(i, num_tiles);
>   	igt_assert_eq(i * subcheck_count, num_checks);
>   
> -	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
> +	verify_flr(pf_fd, num_vfs, vf_driver, checks, num_checks, exec_strategy);
>   }
>   
>   static int opt_handler(int opt, int opt_index, void *data)
> @@ -1164,9 +1297,10 @@ static int opt_handler(int opt, int opt_index, void *data)
>   	case 'e':
>   		g_extended_scope = true;
>   		break;
> -	case 'v':
> -		g_use_xe_vfio_pci = false;
> -		igt_info("xe-vfio-pci binding: disabled\n");
> +	case 'd':
> +		if (!parse_vf_driver_mode(optarg, &g_vf_driver))
> +			return IGT_OPT_HANDLER_ERROR;
> +		igt_info("VF driver mode: %s\n", vf_driver_mode_to_str(g_vf_driver));
>   		break;
>   	case 'w':
>   		errno = 0;
> @@ -1185,17 +1319,17 @@ static int opt_handler(int opt, int opt_index, void *data)
>   
>   static const struct option long_options[] = {
>   	{ .name = "extended", .has_arg = false, .val = 'e', },
> -	{ .name = "no-xe-vfio-pci", .has_arg = false, .val = 'v', },
> +	{ .name = "vf-driver", .has_arg = true, .val = 'd', },
>   	{ .name = "wait-flr-ms", .has_arg = true, .val = 'w', },
>   	{},
>   };
>   
>   static const char help_str[] =
>   	"  --extended\t\tRun extended scope\n"
> -	"  --no-xe-vfio-pci\tDo not load/bind xe-vfio-pci for VFs\n"
> +	"  --vf-driver=DRIVER\tVF driver mode: xe-vfio-pci, xe, or none (default: xe-vfio-pci)\n"
>   	"  --wait-flr-ms=MS\tSleep MS milliseconds after VF reset sysfs write (default: 200)\n";
>   
> -int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
> +int igt_main_args("ed:w:", long_options, help_str, opt_handler, NULL)
>   {
>   	int pf_fd;
>   	bool autoprobe;
> @@ -1214,13 +1348,14 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
>   				break;
>   
>   			igt_dynamic_f("numvfs-%u", vf_num)
> -				reset_only_test(pf_fd, vf_num, execute_sequential_flr);
> +				reset_only_test(pf_fd, vf_num, g_vf_driver,
> +						execute_sequential_flr);
>   		}
>   	}
>   
>   	igt_describe("Verify LMEM, GGTT, and SCRATCH_REGS are properly cleared after VF1 FLR");
>   	igt_subtest("flr-vf1-clear") {
> -		clear_tests(pf_fd, 1, execute_sequential_flr);
> +		clear_tests(pf_fd, 1, g_vf_driver, execute_sequential_flr);
>   	}
>   
>   	igt_describe("Perform sequential FLR on each VF, verifying that LMEM, GGTT, and SCRATCH_REGS are cleared only on the reset VF.");
> @@ -1229,7 +1364,8 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
>   
>   		igt_require(total_vfs > 1);
>   
> -		clear_tests(pf_fd, total_vfs > 3 ? 3 : total_vfs, execute_sequential_flr);
> +		clear_tests(pf_fd, total_vfs > 3 ? 3 : total_vfs,
> +			    g_vf_driver, execute_sequential_flr);
>   	}
>   
>   	igt_describe("Perform FLR on all VFs in parallel, ensuring correct behavior during simultaneous resets.");
> @@ -1238,12 +1374,12 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
>   
>   		igt_require(total_vfs > 1);
>   
> -		clear_tests(pf_fd, total_vfs, execute_parallel_flr);
> +		clear_tests(pf_fd, total_vfs, g_vf_driver, execute_parallel_flr);
>   	}
>   
>   	igt_describe("Initiate FLR twice in parallel on same VF.");
>   	igt_subtest("flr-twice") {
> -		clear_tests(pf_fd, 1, execute_parallel_flr_twice);
> +		clear_tests(pf_fd, 1, g_vf_driver, execute_parallel_flr_twice);
>   	}
>   
>   	igt_fixture() {
