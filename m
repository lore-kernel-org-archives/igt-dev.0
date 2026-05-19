Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55720CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 08:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0394C10EAFF;
	Tue, 19 May 2026 08:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHWA9fsZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0600E10EAFF
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 08:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779177836; x=1810713836;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HgLp83u4JYUk7zcPZ54bpNw1vJQ4NbRnYvFP8RU6nAs=;
 b=XHWA9fsZF3xdwGYoeApsM726M46YMnd9sd8+Odr/ospchzpUOa96GQ7P
 2eIsPJ3FsugZwYkI1rH5gF7f75MFpA97i813TZsWA/+CufphAyxsxOGGy
 wVGfz/jE+Vsk/+3e6yGvJ8cs0iGkQF5Ri0pZXqjmNsuQhBW7UNpmITM4B
 a457p/Jvwb+FkIjwc5R42Gyc88mSbI5AU4nOxN7sdA7nwLdHV+HTrAYj/
 SzyysI89qitvSuatORpJfbKj09JnrsQ4eu8bSIeaFgL9DBm6/XtefHa4E
 MyZluNvRs4XbCV6zH4QcPTSr4eJ/VxWOK0mETQfqLmVEpfIih/mOH6VCn Q==;
X-CSE-ConnectionGUID: rEJpVYcJSSu2amCk5IqIew==
X-CSE-MsgGUID: EYFQ47B/RxeM5ZMSScKfkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97614331"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="97614331"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 01:03:55 -0700
X-CSE-ConnectionGUID: ul2XsyLyQJmBR21An9SNSw==
X-CSE-MsgGUID: UEyfkxmcSruNFaTcldBJHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="235453491"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 01:03:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 01:03:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 01:03:55 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 01:03:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vs6Zkgzs7Wh9iGpTA9Gza88w+DJ3AHWH6pT+bSRuveeXA5HMPr+jqkED2JwT7+8ZSznUJKtefz9Awy8d7VJUKpR0hPf5Rq/Nnv1lAdM1xD+83ievjkbH45Pij0sIp1tB4T05Dlj9JXZ2VT2gCr5AGarQLPJ2LmCdFm7ZoaEcm3YGQ7uocWabngPklVnUYM9Pb7wrYkc0Wsc+UDO3pPRLBniO1wPINz2cFgTlddvP2jktpIU8VpMEAyxkudHAAenAm1y4UyblmO1pGpjJFUIZcba+i1TSt5oxZ/jRzGkx5xzfE9xju7MUzTyT8KsErUwx9OFHuxWW83yg288/737Sqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41u+YynuzZ9vs2Ym0IeyD68Qii9RmhZnAKRyFzq5qlw=;
 b=GFZNiYdsfwOjUhkILhWSKG6ngY8brX93VTmD8tVGflui5A4UH9a+nDQaTc8ohfxHA+j1XLZK0J1bQxyT1yQpOzC4bk3vhGJyWawrmjNn1m4t74iDE0K/UmUvtznzeqRRNK50wONqpVGSrC8539k+1NUR+0nNfqxrQAQOF8MSG9zhNCcOslU4yWuCmg0dWmEimZ8f+tH64xAAfGAWWrFclzTA1Fw9KgK2fr4AJZWFHxZ8xh4jEIivzXHLw50iR2cpEi1NPcvWDaAuL5/dsi4zhxKP92s8jw2UaW4E0U7LNIVQuqjbv4xhuGLg6XaPxKYulKTiGwRTqI7sOPZRYWd87g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Tue, 19 May
 2026 08:03:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 08:03:51 +0000
Message-ID: <b1fbe526-8898-4b54-8bf8-b6f72db818b0@intel.com>
Date: Tue, 19 May 2026 13:33:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_pm_residency: skip cpg-gt-toggle if GT not
 in C6
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20260504202840.2572025-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260504202840.2572025-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: a91d1fbf-bfbd-4581-1822-08deb57d29ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: yhrK8nzw/gR2asq1S4aVHvTmsZ4aphDV4dhcZ0QiH8pYp2ofofcHu3GR2dRAq4s8LrchMv9gwqO3CFquBh709TwE0UbL5Lk6z1D6Z/PYoC2Pzb78XigbgtvSrPo4ZFEaUmoCZNrdvzkJiGajPNwMzPBkh2aui+SniTCDkuUG//IiFEQgMF2wSyhNS/PWSu4RaJTYme/QFN7fGYSKPWBKf6XqYoeniQRIwwHqFgj47JvvCENXod9EsB5uUOIwD3auvTp/cjz5l82eIZ/4TdLjVn2WCLxByX4VLaaABpzRHbO1yq/ApaJjyO35/g3knDh889lEijhIbl4ys5cN0e5JoBfdnB8iyQzZup7H0KdRUwbPSo017lgKTI1LZg6lmlg+xS3qgkKDKd/fovfRN4zi8Xh4UgJDS19b3epsdGZWYejudhCC/dDRt0390vPBm0sgxzEcVZMqIf291/uJriEyfWNRfO6P6JQTh0J730oKKrgZhJUzaDXVs/4Ma+eNWWt2+vfzGlLC3Dq4kxNae3Cg353Jsue9dabxvVrP95pcIrxo/dcOZ1lh0VWrMDEmlqO+Cqo+Sog1Yh5jJCAssagagq/YE4rtKyiC5lfWl8uwJfoaoLSXIfatoSFutR/J03Nyg8hGYu4HtoJN7ObGWM0fod2Tm9p0YgoToT+7oX5JTwOLFF9CZNIteOlY7KWTNXwQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1IrZGFHcG1DK2ZSZDhnLzR1Tm1POEFLZTBreXZ6Q3RYbGxYUkFIdmVRdUhr?=
 =?utf-8?B?SnNKL3RydEhzOWxxc3AvUFJFT1pMby83aXdnYm5pT2ZSNzlXSnNGZWd3K0Fh?=
 =?utf-8?B?MC94TlFRbUtOL3BTMGgzenhHVUtsY21EaCtsYWpFTUg4ZTdJcTJIclZBZmRU?=
 =?utf-8?B?YVF2NkNUMHBJV01seTVHd0ZBVTZVYXhBaE0zelRXNFNZeW9sVmRSbGdCcG1z?=
 =?utf-8?B?U1NBWUE4aGZNdS9nZjJMWHdEWlNNd0JQL1hOdVlpelh4ZlhJVlM5cWlQVDE4?=
 =?utf-8?B?WXdyanBUOUYwYldpYUZtNkhYelZGTkh2czBxY0dqclpuZ0tKR2VuOEZKZGhF?=
 =?utf-8?B?RmJYZ3FZcWxWTjNuWEtMQUU4SmxEbWVyZDEvaUk4c0RNaEw2QVFhQjFKbWNx?=
 =?utf-8?B?NklGU0VrMXRNMi95WU5ZUldpTHNwRVlPTVlRZFFsb3JFaHF0KzRSNlNYdEhL?=
 =?utf-8?B?ZmdqT3JldzNrZ0lxRWt6Y1Y5VGsxdUU5Sk13NFlnL2hKSkU4Q1dqOEJVY2F4?=
 =?utf-8?B?c0JIb2RVeEtIckNnOG5paVlpOUt0MzcxSG8razlndkFNSVBCaXNzMk9WL0lo?=
 =?utf-8?B?aHVFVjRuUTVQUThiMVVJRm02alBRZnpFSHhYUlBGUnpnVzJZVTVMQlhxVXNQ?=
 =?utf-8?B?L1hUM2ZqZEhwVXNBSk9yRlVxOVpyNy83MzRZOUp0ZkNJVFluV3ExeHM1Q2Y5?=
 =?utf-8?B?TitYYTNoOUt1VEdkeWdibHdjL0xieEo4ZUJwMU44bGs0ZlJDdjhNVkZOMUh1?=
 =?utf-8?B?OUZqdjdZL3RmNjBzRXBOQ2dqSnV0S1E5SWtWSHk4RU5WTVZVQndJNGpZaGJy?=
 =?utf-8?B?c0E1UW9DT2c0cmpIUndKWUpvZis4aG1PMURZQjdZUUFjT2lqdGxXRWEvcm5U?=
 =?utf-8?B?UFUxRkp3TlVmcmdQNE43T3BxVVNtY3VkSWxTVThXblpleTNKWFV0bE91NFJV?=
 =?utf-8?B?dkVlR2JkMThRUDVtNnM1UWdRRXFGcVZEaXlUaFREWXdaZmdZM2tEYzdienQw?=
 =?utf-8?B?UVhuYkNCVTF1bDVxRWo2M0tCSERUWW4zVnhjRDlBWkMwN0lEZFlWYnhwbmxx?=
 =?utf-8?B?dWJLSXdDWkp1VitQNENLVHk0dXZlbWdQbmxwVzVMNkhGY3RkYmhQTGZEeFJZ?=
 =?utf-8?B?eUo2Q0VxKytnNWNMVkRHeEhBNzVrTkJrbUNEVG5TN015aWRtMjFjSWpIQzhi?=
 =?utf-8?B?eTF4M1pLc0FERzlpNUo0UGl4MThqZzZMRk1BZ3J2Q252cDBmZVpPQzNWZVd3?=
 =?utf-8?B?NDBuOXdJTlI4amNLenBZRWdRNjFTdStkTjhJdnU0bm1CcGpxUHFYVlNmS0Nn?=
 =?utf-8?B?UFEwQUxpWjBrZGFsWkFqQ0VDNFF2YURBTXl5d3pZMmw1OHFTWThZY3dqdVRi?=
 =?utf-8?B?ZXcvK1kyTUw0YUR6SVc1VmI2cXg1TFhOUVp4amNkS2k5UjVTU284algrOXB4?=
 =?utf-8?B?TlUxWTNMUnFGbHpaR2IrL1BOUlBMOFNPZWNFa0xsK0kzMHZmVTZFdlRhNEdK?=
 =?utf-8?B?MzJWSy9SbDhBKzd1Y0VmYmt3RHQxbXlrckdXQzNzVTkzM0VKYmVXM2NIR0NM?=
 =?utf-8?B?eUJPaWt5RnFnSG5uSnNzMDZyYTVzR0c5Tk4wSVBnTk5HR0J4V0FBemtGYnNE?=
 =?utf-8?B?RlhzaFlvYk1lM2U0aHpIMzFXdUh3U1N4ZnFZbGpReHgwaGN5ekRqYlRjdVcy?=
 =?utf-8?B?U3VxNU90Y09pTHdhTUFxczdtSEs2ZzNFL2xRUU1JVnYxYllMWFpjb1lkOEtp?=
 =?utf-8?B?S1crR3VWU2JVVHpKa3MxREI1ZXA2SEl3ZStmYnlNNjhPdDNMU29NNnJROWd2?=
 =?utf-8?B?TzM2WjM1UXRIRytHZ3VsaUd3QjFpWEo4M0gyVzV4TlJ6Y09OZjJ3c25yKzRH?=
 =?utf-8?B?N3N3Wi9QMTJBaXlDaUtPbjdrR0NxN0ZRM0dBVUw0cklJbHFtamQwUVcxV3Nq?=
 =?utf-8?B?NjlwaGpxaGxSeWNHWEZ3eVdXUy9MSjFZbDdCSVN2bGRRVllJVWhVNHN6NkRt?=
 =?utf-8?B?MGVpMU44MG1nOHFEcFFGVjVqZTBkU0pMRzlkeHNnWXpaT3EyTHp4K1hLZ1M0?=
 =?utf-8?B?dTlibnBTNVBBazV5WjkyZXVJUkxteXVZTjVzN1F2T2tKMzY2ZXNvdjZxL25z?=
 =?utf-8?B?VkhYMjI3dy9aMG5oR1RKa013c0ZqRVJGblN1dU9mbGdJUUc4dzFiL1BsQU1i?=
 =?utf-8?B?ZENHUG5MVHg1Wm1jaG5rS2FybmNIQzZFcjBKVUc1UndJQm8zNnVXeFZzeC9H?=
 =?utf-8?B?R0ZXcjJubHZBUG9Eb0IwU1FMZmZGVG42aHJSdU12NXdoM05ISXdFNFFYV2lU?=
 =?utf-8?B?UWdjR2l0SUFyeEkrbzllZmhQNXJOL0UraXFGZGNJQ3pOcFJERkVTZz09?=
X-Exchange-RoutingPolicyChecked: f/xjXi6rDbodgKTUgIHbPx/BRMmU3PnlH1QyCWj/5oujpVwg5gIAs9GOMtCUxLOGd9ghuiRU7wRVc0CbbEzs2SjQWrfXG5OUGxSZHOgVPe5uovvgOyDpP7MlLhZoRn2Jimw3luQYJHUcLdQp97WTvJOntrsdqewXMqfYFlRxRw6WYGlGP8tAfCEmSHTPnNK0UxJNRLB5tToa16pKzyqQ8kmaalqa4XGGPX15wB1QCtfR7qE1TDctqp087Vi9zK9M5x5T2oahCGqSH4KFzKl5PccCOpkxLe1NZqBV+JIY9l5HxM6yvED6jvFdQ47noujdlVMre6hhFtkziY1hnP2z2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: a91d1fbf-bfbd-4581-1822-08deb57d29ee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:03:51.5604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHRqacGeN9+yvFuF1furNv9lJyqFKJXmcNm0MDNGaP7rv4kTXWg+oGv8e8VAf8LXHNKrvTqSrsYxuV1vexVMeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8393
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


On 5/5/2026 1:58 AM, Sk Anirban wrote:
> The test assumes GTs are idle before forcewake is acquired and power-gate
The test requires GT to be idle?
> status is validated. If a prior subtest leaves a GT in C0 (GT stays active
> for any reason), the final power-gate checks can fail for the wrong reason.
> Add an skip so that inability to enter C6 is treated as a missing
> prerequisite.
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 1eeabd509..bfae1f844 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -392,8 +392,8 @@ static void cpg_gt_toggle(int fd)
>   	int gt;
>   
>   	xe_for_each_gt(fd, gt)
> -		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> -			     "GT %d should be in C6\n", gt);
> +		igt_skip_on_f(!igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
> +			      "GT %d is not in C6\n", gt);

Do we need wait on here? Can't you just check if gt is in c6?

Thanks
Riana

>   
>   	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>   	igt_assert_lte(0, fw_handle);
