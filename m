Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE65CA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 08:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E08510E113;
	Tue, 29 Sep 2026 08:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBgcKyx5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB80410E113
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 08:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790671768; x=1822207768;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hvOZpJh9w/u1623z0rtg6ibYZRo2B9GwjeFbumWM9cU=;
 b=eBgcKyx5iaPU0MHeA9QZkR6hPkY/dcESSI6wt5f21FohHPChxVYBmgZD
 HepGvtFUwVim3R0roSLdEby54JHTgFK4/fHHLluuO+CZjqrEfCbodz+Vo
 vSv2ixyKwrlDd1sVmH2Q68xinQCKXQ3kMBxdOprogKCuGELT5CY8UERWi
 JCLNDnAdIcUpwV4Ep26kND45dkqLN1eEMsNmPwNyDsv54gCXulZRkFJh/
 +n2/97N3Us+49UQZwOKgBdEJJ3qHczjQeThN3+kXxYHq2WqkZ42q4aUwg
 WXzvqTkYY2DFHrcFZAiophVxyn4FdrPJhQEsnCd09+vMgyKIRqaonShIu Q==;
X-CSE-ConnectionGUID: k+irJlbCRfepcCAj1OoyFA==
X-CSE-MsgGUID: 9cqdgIeQSkOA3KcJ87qPUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90604470"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90604470"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 01:49:27 -0700
X-CSE-ConnectionGUID: OXmvVIj6QqyPyJShd0pqfg==
X-CSE-MsgGUID: Xz8+B8hESVyJxYIiZnV+0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="303264757"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 01:49:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 01:49:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 01:49:25 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 01:49:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nH5NqgQsXeHt+LHYV7uojcOufsrzNdcx5uzBbos0mVa5XHAuSyq3w7z3sn11sBvirT+6RE+DDrcqTwX0+6L9wlh+vIC8NiFpP6zgNR2DxhKCk/+bEakXba08cKntHDtIKBZsDvwz5ZPYGivTjXBz5VhdwcF/A9lq/lS3EhJLtqAnGsT3w8gvN5opXJEIPei5og19HVtjjGt5DKLZcsmh93uplyLTWzoXLiiUVlNKbO/r3e98fa14RvVnE3LZNWSAYxE/baY/uwS177iTsZxOu0wbQa7nVuunAVeJNAIjqF2vZV8kvEmvcfKl6qQwzTImWfZdGWZARY8TXigslr5aCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTt2QH2lbLahmUwtTqro9+OacVVuKMFP9apNDuHEsTc=;
 b=SRuLbtO4Ui5EThBb7HDtJy6d4HQ81BwIv91eBKtu/UY2bhEpOo2akorxpvGbZZjfaRPx3CLb7wya139/NhsshaeKhhjb5wt246ag/za1LO7fojERzl5tCvKcoveYfaimFrb3wWr5QF6Zu5PRFlXDq3Fx9c/qZPftlfdO5BmwtFJ4YGeporGoPitsWIeEfxw5LZVCYRMeCmsPUKzx+r/xUEJCO/CKYjWZnzaiGKHhMQmMtA5AbkyGi/8wbPOa4FCbLUUSBmqZGD4Dav/ls5H/lm4lDUyOzm4WOA/nsJ5Ci4nJDrltw5urYcuDTX88kPBfgnbK41NKU3hEuvyE/iIdYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SJ0PR11MB6765.namprd11.prod.outlook.com (2603:10b6:a03:47b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 08:49:22 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 08:49:20 +0000
Date: Tue, 29 Sep 2026 08:49:11 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 7/8] tools/gputop: integrate i915 and xe PMU engine
 monitoring
Message-ID: <be7mrp73b7wd3c4zj6tyawxsbbnjqmjbwqrvqjhz7jthqr66m6@mp2dap6vrqsd>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <0b56b441614d8e5e0f24f1c79cdd49efa9a2931a.1790331690.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <0b56b441614d8e5e0f24f1c79cdd49efa9a2931a.1790331690.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZP191CA0034.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::11) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SJ0PR11MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a17e084-7cdd-4c21-a8cb-08df1e068da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7kdzn6MWByBCNbk0ZRml9quBIS/6Ee5qOsjjzMHgg63DBv7r1CqqDRPNuCaYNPEM02W1DTqDfr2jC2MeGLY1NqXlL/mOnvTkuOFYE30FUSON5qpdPfzZVT+jfvuBKlcXpLwqHPTVWcc7Z+eIcBEsgKqpjeefleE4/wiqoszWLvYL74Ve4gwRqB29Wuy4dBWucfDblmOWO3qO1s9ShA7kxKJYiDeVDxkrI2HwZyVgttdNXFqc7kxpuvTvkDCCFu7Sp3D9eTprdtGue3XImv2MxGlaTR1LgCtvuPhis1/hf0rA1NwqGSRNA2DFbaRgd0HXoc6jchS05PZ4JRSy3FTCHeF87mgEeMdQtdefJZWZqhA/zbXrUcSyED69R0xe+30Xthi0lksX4RrBsugkkWfab8968k1YRx+aSI/V/310KVJG0eopfZ3MM68mAGA45hICV/zTz/bmH9xP45W31NbX/t7M+MGUXK6z8S1CqlOEKzIKyYjyyczZpvAbIldPg/XflEluHxFk5W6v+EvgD8iupUs27qqPCiR2xZnU1801gW3tTKvCCpbYjNC02BG4I5OlH9rALKGKaUUD2EajdV2uk53aFs1iknBO87uflCeLLvy2gchlg+zi0YVzGH7JGrkaMQ9zcRCTIA7YHhFUM4JuIG4xXWkEc6VgmYI6CkQzSu0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDhTUUVOcFFMSUc1K1dVZEtGcGZRNEtPSHRxTjc3V1crblI4cnprdEpqdkp3?=
 =?utf-8?B?S3E2UHRmM1Vjbks3TnBuMVBPcGNjSzZsbmwyMWRQMUxqdXh2dGFlSS8yMjhM?=
 =?utf-8?B?ZXdWaFNyUGh4V2h3NzdRMEJESnFxcmI5NWt1MU1wVUtqWXREd3Z6d283eUFL?=
 =?utf-8?B?YnRObWlGNlMyQVhRdHoyc1QrZi9ZWWNCajRYQzM4dVhPQ0txNGRQTkxXUmxh?=
 =?utf-8?B?ZEZNL0lBSXdrM0RKOHduUGdHMnVNUUEvc0tXREZQOEcybmR1NUdZVGFLTDA3?=
 =?utf-8?B?Tnk1S2dXRVlxOVRFZ0tZQW9VT252ZXVPNSsrcnZQdFZETGplcHR5WlltbTdX?=
 =?utf-8?B?V0VYVXl4WjFNSy9xZ1dlTEJRc25McTdWTFQ1VzlNUTYrVjFCK1lkUWRNNXdS?=
 =?utf-8?B?bHEwNDFpYTRhNExEcFY2c3g3UHFhVEhBZk9wRE5aQ1JzMTIrR3JFMGVOREpF?=
 =?utf-8?B?RlV5WHpoVmRoRUIramxjUGY4UmlHRzg0bVpvdlJVV0dPbWx2TjZObUtRTDNV?=
 =?utf-8?B?Tm1sazdQU0pGbTJoOEFGUnZyWmFhUlhvSmRFNjJvMHRuRW14RExmUEs2anVZ?=
 =?utf-8?B?NVRwVU9ybDJ4VEhqakNucFF2dlJlNnV4RGhBbE93TEdUWDVzUGRDRFNvR2hw?=
 =?utf-8?B?ZXBQK3hlVndSRVl5enM3QmtiNFhNbW5GdFl2UVRENU9QZ0FPTnd2Rjl1OVp4?=
 =?utf-8?B?bjRzdTZ3a3JSZjhTMlpmSUVFblBIUUFmYmVobWk2bTB4WUZ5bExlWld3eUQ0?=
 =?utf-8?B?NllDelhwQTFPVlA5NWh4V3IrNGFJa2Znc0VXem8yZmh6S244UVQ1U0dLUGNX?=
 =?utf-8?B?aTZRT0hSVXVqeS9yQUpoVWtFM3FESy96Rkc5dUJyVDQzQlY4MElnWkU0dnBY?=
 =?utf-8?B?Y3dTSlFhd0xXZTh1dHFNaGJHYXdsTWN6akhqajNGN3B4aFNjdUhzdmQ4Sjlz?=
 =?utf-8?B?d0VBUzFKZElEaWw2U1lidU1yRmxYVDN1YUFiaVd4dGh2QUhoNHpTOEtsTHU3?=
 =?utf-8?B?ZGh6TmlDZE1La1lxbTMxVW9BUy9XWTErTUszL3F3bXA3d1Jmb1hJTXJ2bXcz?=
 =?utf-8?B?eHFSWS9iem54WktSQVMra1N3dG1URkVMV3IwbmpTdDdXNDZzNnVtczM0dVFM?=
 =?utf-8?B?N0J6L2xTZk5zd1huTU9QQjFjK01rOHhrSks1Y0lLNVh4TWVScytXVzN3aWNz?=
 =?utf-8?B?OFlCOFNiVmlmNFJ3WTU0ZWFyTW93QkJCQWx5cWIxa1lXMGF3dGk4OHdJS2J3?=
 =?utf-8?B?T1BDWW5GRFYrQWROdEhVZWt2emE0RXN5d3UyWEVrY3B6SksxRW0xT0I5Nkxm?=
 =?utf-8?B?bkN0T0pLN0o3RERxMElpNVJkOFI1by9najNucVgvTFg1MnJ3dW13bXJTUkFt?=
 =?utf-8?B?Q1UrMUd0dnl6bEJIemdpcGdnTGhKYmphZCtNY1llYWVnSHBjL1BYM1VHSGlj?=
 =?utf-8?B?a2ZrZUlnMHZRb0ZjZ0RaVzlEa1lONzIwMy8ydVErc2g3ZkkrK1psSEFnWGRX?=
 =?utf-8?B?MndVRm9wWDNVMWZ6RllPUTJOdXdxNm5YZDNCeXVTQldEaDVHQVd1TmhjSE1D?=
 =?utf-8?B?ZVpjcVpDRVhrekxzeCtrY0xvdlVEZUZJakNJNnhSZ3lhMVp4VU4xUTIwN3Rk?=
 =?utf-8?B?N21ORVBNc3dNNFIvZDZ6eWFaeFZONzNrUXVVa3R5ZXFLVkU0dkUxaDBMM0Vq?=
 =?utf-8?B?OXB5cEdIdlBMM215UVo4ZkRwL1F4VkZMN1dsSkVWbUx2QnR1aFR6R2Y1aVNG?=
 =?utf-8?B?WVY4K3dlNDFKdXptcmRSQk1CNEJVRGVxQXVhb2NWMUVBRGRJN3JEQ3pjTGwy?=
 =?utf-8?B?SlY1Tzh5RWZmZmNGRFU2ZnZ6aUdsNHZ6U1ZNV1M0TG13SmZyNGlTUWk0MnRG?=
 =?utf-8?B?SXd0Rm1PR216RkhmbjN0U09IN0EvTTJNcmdEWnM4a0k3MWVoN1ZUZW5qeDdl?=
 =?utf-8?B?dHExb29ZRjg1R0s0cm4rTkJjZ2pzMDBtZXFKM2xhQ2ttU1VYcitLRDBtbDlV?=
 =?utf-8?B?V2hyTnUvSSt1MGtRZHpSZnlTamFSS09Vc0kvRzJ1OUc4WFREU29hK0hDMkI2?=
 =?utf-8?B?TldVYVdJamptU3l1andtYXgrOFhUMzhMOVNidytNV2dMZ0o5Mi92VjgrdzhJ?=
 =?utf-8?B?SkpQT2FaYW1NNStQbk9UOFJnbStUQzRycWZoSHlSNTByMjhXcEhyTXdsd0w4?=
 =?utf-8?B?ZHhLZG8vMWpPOU55V1RWNjE4anowNGlOREdsRTlOSUplMzY1QTdzbTNyWEY4?=
 =?utf-8?B?dzVpUWp6bmVheDQwUGJKTUo5dXRlV1pzSVVCWlpvMmhZWXMwdEFCVlBwREVo?=
 =?utf-8?B?ak5YSjlxcFBFQlJ4UFY2S1JNQ0JaZUpNZFRLQ256dmR1UnorVk1XTTJBaDBO?=
 =?utf-8?Q?0Q/Mz4XqIVh9ybOw=3D?=
X-Exchange-RoutingPolicyChecked: X6lTrN7UNbqNGJhd+R+PNJR9s07eOYi+gFZb/wsSrMFTFuHEdMR+yroH5MkuiWJtnKpLH++5OtVHx+bI9j7230xZIqoRxqb8PIAq9/Nk/mSc/SuzlB8iMaZoTBPGkkXUUrZXdq+mQn73HmQePsWS2yJ0dY3cTVkx4XsnSB20lt8AVIQxkryuT9jgyISFm7XX4lyhHcE+HgVxf4qMXQWOI6NTVpkOUB+WiPgn7ug259Kzq7jFeAqkvpEg7cMM2Qg4rJKjvgbL9btm4GrTzDh/sYkcUb7JlsJsm6h31593oRg1ESENe62QDME7l1ZBshu2WKY65MeEjDBL9V/EKjXGtA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a17e084-7cdd-4c21-a8cb-08df1e068da5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 08:49:20.6348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WL9nr6Ke5VxT8rRnQ/5Ik99H0hXIh/3p8tpy9pE3VYMVKFo7Uw8I9oXL62OpEa+zLhJHH7jNeOAxgvAlbG8hqnJWN+y3uNmE7Nkpf6iKRW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6765
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

Hi Sebastian,

[...]

> +static void pmu_devices_init(struct gputop_driver *drv,
> +			     const struct device_operations *ops,
> +			     const char *filter, size_t instance_size)
> +{
> +	struct igt_device_card *cards;
> +	int n;
> +
> +	n = igt_device_card_match_all(filter, &cards);
> +	if (n <= 0)
> +		return;
> +
> +	drv->instances = calloc(n, instance_size);
> +	if (!drv->instances) {
> +		free(cards);
> +		return;
> +	}
> +
> +	drv->len = n;
> +
> +	for (int i = 0; i < n; i++) {
I'll be pedantic here: iterators in this patch could be
unsigned :)

> +		struct igt_device_card *card = malloc(sizeof(*card));
> +
> +		if (!card)
> +			continue;
I think silently skipping on malloc here could obscure the
system state. You matched some cards above, but only initialize
a subset of them on a temporary ENOMEM due to, probably, memory
pressure.

Either retry this operation or print a message to stdout to let
users know that init is not fully complete for all visible
cards.

> +
> +		*card = cards[i];
> +		ops->gputop_init(drv->instances, i, card);
> +
> +		if (!ops->init_engines(drv->instances, i)) {
> +			fprintf(stderr, "gputop: failed to populate engines for device %d\n", i);
> +			continue;
> +		}
> +
> +		if (ops->pmu_init(drv->instances, i) < 0)
> +			fprintf(stderr, "gputop: failed to init PMU for device %d\n", i);
> +	}
> +
> +	drv->device_present = true;
> +	free(cards);
> +}
> +

[...]

-- 
Best Regards,
Krzysztof
