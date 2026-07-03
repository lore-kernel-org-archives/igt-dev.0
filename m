Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CB0C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4226B10F927;
	Fri,  3 Jul 2026 21:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="El1Hoehb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC8410F926
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 20:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112347; x=1814648347;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YnEg42HBAtJy9ZJ3ZD9Em/27m5g6rh8dsutf2G+/kyU=;
 b=El1HoehbVsAs5yPQ3hNMXMDfCznyuM/zPslnnh8kswUsgjaaze8MBXGd
 3e/gsXab4kdaSjEgeBuEIugfkpF/rwQD4WKJPE6hxle+7dR41nKYB4TAa
 kdsbE5sQHdQQUVJt6ZXsUkI+zr2Gmho0+5Z8XYzsAGDbhOoKrY0FjhQ6+
 ea9lgvMD/Jv//DYIONSOEkMrVUHjRJnYbcXWxXSNmo6pm9MVa2Rv7m9bJ
 w/VvGG6QyHQUDDHokrgUHsEs9I9Mrbt+vfMxX9makhDUSUNBnmeu0WTZl
 VfXEKgBr1QEfoviV4U1KPhuIj/tpsRTZLBLggqALq0K+t7IwVBBNzGHD1 Q==;
X-CSE-ConnectionGUID: RxMETjJWRWmqp1Jswcv+vw==
X-CSE-MsgGUID: lhTtJCtVQeOdzni88gdclA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83988749"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83988749"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:59:04 -0700
X-CSE-ConnectionGUID: TBkiVhZ9TCyVXlWjs7QtKA==
X-CSE-MsgGUID: 3X0xS2MLT1+rkuUsvFmp4Q==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 13:59:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:59:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 13:59:03 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 13:59:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUgA1u02++jOFp6O/MxyX46V56+ijxUaMe3thqb55nJj9b8dr+9HqyhzL8wrO7qc/+FSD6bQCVZB6S2KWqYn64T5oncwwqPTCe92Thh0NaWZIAmj2Oh3nYVjcNacQVfdKa9gsQqFeHvuK16cBmR3PbzMAQo7OHlN5cqAwkpF01MLxk/VK0BqvTN2YZd1zt7jjKPGNAbaQFm5GzDYor0vs0mP3QiHqdKwDvJa3WoAsjlwL+WLQBthdxirLLiYqc+yz9epRqpoqVRcc1L3+xtyNjGlmX6NVp+TTaRkmM1K5fSJQQ9VZ4E81vvCav0laYvIQ2H8e+TPEheEWD5QAmEfdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFqKxRrbRdj3lR6KwQdO9DrODMKtcjbv1jzCB/pCg94=;
 b=Jjm2CV0ScpdcvIE5ObSOrjYbxTzCHtw3dbL6SD1Z6hK4ZtoHvzZQgI9q9leaBfiCevhYVkJ8qCMHFjeEW03UHQygavqFhKC1WO8w/ggiT2fservivl4OWmHrHRpAufOrbnNQQ2F17skl8pml/prGyf6UNAwM0VgKGK0sS/AIkKlCvd/pNlH1oG6HEx1MhzmShr9QL3iTs5XdIwS+8T1idNkHgBd5cGj48T/+nMflFD85UVd9CmcYrsQ4ivcjKDfxeavRPnN/nVgf8WwMJ2Cg3zo1OgoS5a1hpvNEU0yST4bjmdZ6eBDX+UBF2gSP5pcLw8aPMTU5ytDaygnot1jBdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 20:59:01 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 20:59:01 +0000
Date: Fri, 3 Jul 2026 22:58:55 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 10/31] lib/i915/intel_decode: introduce static
 sub-library for tools
Message-ID: <gl7blj3gucxabqmodhtg74ubua4hmqnzppj36zhqksp3np5be4@lknxlix7yt52>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <4bee48342f508ec461801a10f25f850e8a908473.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4bee48342f508ec461801a10f25f850e8a908473.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::9) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH8PR11MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: e39c9c47-902a-42fe-f5bf-08ded945e86f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|23010399003|376014|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: TBbjpafYN8Q8WNoVZa76xsX3//Jn7dSF9k/h60MCpdGU1OALG2Gj8fhSQJICvmtgXoKUHORZHyM5DUXbleIDLjAlRxTa5RLgAgiyhGzYkSEr3ienW5D4gWdH6jVOYyYaF7wvL0BQCLFHljL6F3dIZ+BYRdcV7UNcwmndN+z4GGzZR21Dra7WhiPXN7JU4628Th8IufNsimiFEzxm8JV0SS/s0PmVPyyS11kMC04iqqAxfpGbZe+cQmC0ZjK7x8Sk9bw/57ZTH7KQMfl8JA6Fh/p/VNR6U5QmrT1SBJBwCcO95KL8Bu0lEzlL0tUfPsXQr+brgmqp2ED32lovUK0IO/g/oGVN7oR1i12+/OTx1NOi0sNhLMQKUZmEiR7Ic7H1xklv7w6aEvt2VRH7oqcWB1obEZNWOWTelGxrsxmhfvHqKKQxwZ5nGovltoKjHg0nPqdgBf4KnjgJm+wpMK9jUh/aAwf777lIJQWzF/eGK5YBCzTcoaV3PqhVyHUIJ76zHh/BesUaJJcRk+afW/wr4tl7ntzNe/fongjKI1Yl9mCAocW9l85Hbxp8C6w31ukLBHwbHpN5+B0O2ev6KsHsBjQFWf8KIIUwZsuzIih8GsQikDgddVvzng48yZEIhMK1UNwt7jri/3ThpsrBWBQcNKsduaRXPSCCIymGLZr+eHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3pYQlBFTnZ0OGR5RVF3ZXFyMmo1UEg3MklqZGVsT1ZodHRmUDNZcXBORDZY?=
 =?utf-8?B?K21Wa1pHSkwycDl2aDZsR3Z2Y3FWRkMrLzJuK0Myb1d2aG41Zk5QTXR4bUg2?=
 =?utf-8?B?N1ovenFwcnhCTU1rdUNjamJMM0FmUys0aG56S2N2UnZKTDVkZ3FFRHJGR2hw?=
 =?utf-8?B?QXcrcmtpVDBoL3JsbkllQUtubVltSmJyaGQvZmVMWndNTElOeklMTE5LaWFO?=
 =?utf-8?B?eFZ3YmRnNzNmcFZtQzRZK2NoTUFmWmFkc1pwYXZpd29KRk94dDFrbmdycnNp?=
 =?utf-8?B?U0pvcFJJb0NDRjB2NkRacFI1WTVyY2Z2UzJmMnI5Wkg0aVpJNUg5eUpZTDNy?=
 =?utf-8?B?a1o0YVVCWnVhUzNSQ3pBK3RsTWhMQ0YxOWtXWTFnVGhkT2QvdVVyVFgzM1JK?=
 =?utf-8?B?T1cvZkxjeVowS2RWd2hCVHlNZnJrK0ZGUFRpcUdoMHYxa2FHU3JxWTRjcHVG?=
 =?utf-8?B?TkRHVk5jODlwaUdJWlh1enZEem9tY0ptd052VFNkVFFNQWFCWTVURGs1RTJC?=
 =?utf-8?B?WDIvRmVmbG54clNLVTk0OXl4K3EzZFpoS1NJN1dxbHovc3k5SERHcmlQSGxE?=
 =?utf-8?B?UmFDTjU4MEJHci9oZFo1emFiZEN3Qlo4TmhNZmdMSzlXOGdzMnRrNUpmTDRG?=
 =?utf-8?B?Q1lJNXdPRWRQeHFmaGZ0VlE2M3lKV0FsbGxBcW96TmY5SEdLdGswK1JQSmdO?=
 =?utf-8?B?Wk1ZUTBwVWpKdG9UbXJpVlUvNzBaUU1IaFJyMVNFRGdreURwbXhMVzA3UGha?=
 =?utf-8?B?d3RvdjZteVQ1aDYyUVptN0VjL1pVeUVXY1FnS0hxcGFja1lZbHEzZW9qSndp?=
 =?utf-8?B?TGljSTFVcDZMYk9LSmdEckFxWGxvWGtuYWRmeFg5ajRhQi9GTG9NQ3ZGeUhu?=
 =?utf-8?B?ZVFiTS9nUklkRUhhOG9UeWk2aXM2dUdYS1hHQjR2QUcrSjNsZlY0bmVhTkRN?=
 =?utf-8?B?NTdQMy9RbnA0OVdBQ3JPOHZ3eWFHS1ovbENkUGlTZlUzZG9qSkhFaE1tT3FV?=
 =?utf-8?B?RFBaMnhSNm9rSlBST09ka1FXY2NoM2hCRjZ0Vmo4dkZrSjZIVmN4TUxPeFFZ?=
 =?utf-8?B?dUpGa1ZvL0lKVTlzaHdmOXhVUHIyZTR6WngzRks1V05BcjNwN0pMWHBMcFh4?=
 =?utf-8?B?WFgzVUlpS3NwZmluVHlkUW4rSjRXRkpmdG02aStHL1ZhTXBldld5d2F5S1M4?=
 =?utf-8?B?cjRvb2RHMDJObU55MG9hRDhtZnVoVkkvWm5CaGFIa1NFbW9aRWVqRklVZU0w?=
 =?utf-8?B?ZUlCNTBBalBHRTQyRTVydFlvelU3NmFhMFNoMUV2R3FOMFNHb3phYkU1ODlh?=
 =?utf-8?B?aU84d3Btbmplb2c0SG1jdmNtZlFJVi9SSzd5b09Od3VhNHM3VS9FV0V4VTg3?=
 =?utf-8?B?am5vTE01ZjVFekVEZ2VaYXBNVmZIOVp4NkxrT0F1S0l3SFkzaFVFQkw2aHo1?=
 =?utf-8?B?TllvbGxkWjl2MktCVklHQXA3UlBWNkp6OStWYStPcjlKY0l5VlFkbjNrd3pZ?=
 =?utf-8?B?T0htbmpaVHFMMlRuZjloUFF4YU4xYjE0TUdGR0ZRTDZIc0ZzcldRSUVwSWg3?=
 =?utf-8?B?M1MzcG45djRHTzE5QkFwSXFLQkdlZ1hvUkdQekNpajlRcytUZ0JFdHV3V2ty?=
 =?utf-8?B?RlFBcnJTUzEyUnlPb2dxOFdjdWtMbnpEaEVZRVV4Q0FDTW5SUjlDS01KL3Rw?=
 =?utf-8?B?U0NFaFY5UWtGbHZqYlIrU3BGbmhuMUNkRVJqRks4cjl4VUdGWnl2MVBkTXpM?=
 =?utf-8?B?YlplT3hPTW1NMEFKb1FZTm5RcEZqT2JkcWdqaU1UVllxQ29LK1hZS1ZDYXNP?=
 =?utf-8?B?b3Ruc3NKUXhqV3J1WUdQTnhsOGRDSXN3d25xVG9WTk40S0wwc0YxYVo4bVkv?=
 =?utf-8?B?UVIrbkhYWkhPWlNuRXBrK2JwSThjSXJka3dkUDNDclZnU24wMElJRXl2ZGIr?=
 =?utf-8?B?RndmdnozNWx0R0lZT1dFM2hWZ3pYdlhXWlo3TVB4S2V6VUhlRXMzTCtiQjEr?=
 =?utf-8?B?Q1o3ZFFFVk1SK1MzYk5nRkFpZnhpc3NqSzR6TTRwNWdLalNST3ZxT1B5Z3ZQ?=
 =?utf-8?B?REliSFFpdlFMQWFpbm1zK0pXKzFGN3VKWTdCT1l4S1EwUnJ1eW9NQ0ovWFZ4?=
 =?utf-8?B?dEZ5Y3dwdTdXL0dZazVjVFNrWktRMklRSG85bGVmWllVY3ZLak1adW5ITTFh?=
 =?utf-8?B?WTE4VXRLRXVMaDdxdGRpY2h5eFJxeWxXVnNNbVJpQVBsZ1FjS3NwU1hJOVZr?=
 =?utf-8?B?cmJGN0RYZmhUQ2ZjYkUyY2M4V3gwMGZJai8xN0NyTi9lQkFBaDVCM0s0ZlVr?=
 =?utf-8?B?ZThmZ3Z1TGxTeklKM2trd0NZSjY1cDFYQ1VqTllJRkxsK2tXVk5CMTEzYzJ0?=
 =?utf-8?Q?YD+A++yTL2j+wmAFPc/St9R0VkDRUPyxYbdj2UrJwpleC?=
X-MS-Exchange-AntiSpam-MessageData-1: tVG4wzzaVipwEyDxs5egbfUsZkPnSemisJI=
X-Exchange-RoutingPolicyChecked: SEcuPOYoCBG5VaQlOrH2woPh7KBXvEAMPst/598usRlAyIJ97dHPRNEV3oq/Vvdc4Dobu4CUTEkfZlHW1jFGhBProZVDhZvRgdzvM1EbDAn62C74Sl6GqKvvt39vVYcPkDnQG3zq9Xg9CB7OJhIss5vF9ON7fYMAIVjU3ByH1CO0lvUrrcTUdH85zCss5u4oiSrFzttCy7nbe6JnOii7YnW3kuTix11dm72rNXuW2euDORS0qX9pZoPAJ/yD2DJRttjsX+2f6luJYZl4skfp7PmdZEutD+FYJ7fzmztCpgiMcv2CzOUoxdifnDiC3W3+Y+FDf2rRyLmX9xjYz4PAfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e39c9c47-902a-42fe-f5bf-08ded945e86f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 20:59:00.9887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWHktMogCL+AmAoHnvSiOJPVp7Bsi50ZTruciHpxjIRhlzTOtAAcwFlQdnjZEnkaOVYUTc5tA3pkZttEITPqB1qboywct6R+sUKSrzoPwIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8107
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

On 2026-07-03 at 16:28:44 GMT, Sebastian Brzezinka wrote:
> Add lib_i915_decode built from i915/intel_decode.c and instdone.c.
> This lets tools like intel_error_decode link only the decode logic
> without pulling in the full libigt.so.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/meson.build | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 93db217f8..ba4ece3a2 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -423,6 +423,18 @@ lib_igt_halffloat = declare_dependency(link_with : lib_igt_halffloat_build,
>  				       dependencies : [math],
>  				       include_directories : inc)
>  
> +lib_i915_decode_build = static_library('i915_decode',
> +	['i915/intel_decode.c',
> +	 'instdone.c',
> +	],
> +	dependencies : [lib_igt_chipset],
> +	include_directories : inc)
> +
> +lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
> +				     dependencies : [lib_igt_chipset,
> +				                     lib_igt_tools_stub],
> +				     include_directories : inc)
> +
>  i915_perf_files = [
>    'igt_list.c',
>    'i915/perf.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
