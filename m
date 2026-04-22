Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1909CFA1FD6
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 16:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE47010EA73;
	Wed, 22 Apr 2026 16:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JrwFpDBZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FE010EA73
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 16:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776875619; x=1808411619;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6gC9H+rMF3odNgGBE2VYatAli7jvKcnprOwlxV4VeZI=;
 b=JrwFpDBZaRw2RmYhDMp3ZjtNxEiQA+7jjqPfMuBzl21G/1mggxnes0sO
 qeTWPoF/azYoaAkQar/k/pliPL3qO22XKQMLR4dVSma/G1rZUWHp465mP
 nrchezGol02iYq7tjRlP+xosIUOzsLFMS69jVu21W604LDbnhiGUqoFw6
 1jFE5auQ9rX+iCUOvoLB8aTFx6Nq8QwrKgHLQ7mTY9znjGAS2sNt4cs4r
 sC4yMnReUwL72mfdHoy/q3MyqW7erNKJ49QOWYrTYAWn3OVQfi07dxJqB
 GAwpnc8PcZ1/LUC0n1p+pzMOVRatu2FxUBatFK8Dmxc20lRfUTRB36F16 g==;
X-CSE-ConnectionGUID: hBLuIAKYRkSUX7ljlTMliQ==
X-CSE-MsgGUID: Ftpsc7WNQTOkrFHuH6Yv2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77815303"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="77815303"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:33:38 -0700
X-CSE-ConnectionGUID: MDN1dLrGSPmxg2kISscISg==
X-CSE-MsgGUID: Ex2sT9fBRrGC0g8cWZ/wbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="255876660"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:33:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 09:33:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 09:33:37 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 09:33:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Waxkf24p0U32VlXNv057z2Sh/r1I91sDGMEal1QdqA8QoZI6uWjCVf8zTAWf1/L1gEWtCFtk9Q+LxA4u2yeB8FGx+BYn4hSBezT6zSDONytwwZAQJyG6ozeQjwmXCQLzLtHk3nV/S+QxEjJ9Nn9l7Fuvl5dABiWH5XJ8Ku8PP5j73OYINIWkqgNehYjuPoVSbAyugBXd7RKc4gBw8GXEhhWzJDAUkR4kG9hp7lU2usZkZTX/o+bKyKrLHxNkKeNIJJuZ4VDnidMP8879kAuLCSLhflz566+JbnOHWcdc9mrmRUyqke/ZKsmN0iQUSQOJXY33V5HXfOtrQKtTr/K/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUovI5dr4mVEJwkM8xR+TZxn+Wq1D1N5qyvGvML3mgg=;
 b=gUeST2pkcX+ZMbTb4MagF33WYAE0XO2sX+xeynDohJI2QAfI9tBPb0hgum1R7LevyN7MLPlahpnuC4hHIUSqyhQt3smEACYHKZ+LGaWdlosymVi2/QuC9ZcW4kl2rIQFyUpD2BNEN5TbInNHmFB3J1RmI0DfblNP1+WYVIwr4cAX/ODHhzPAofEgiGuuTddXSJzOAS95d4Z7UE1qGgEIhQEZ72eqnQuFFl4NSMjHBL0U3YBERLm13n5ltT6wUhLEIEAcv2HwoFS4wfZ4fGTbAi8rA2zqD1L0VytVr9ZsKYkfmQWfADCSNd7Wsh2c8zXseFJ0VU8sNK0uwCziPOOsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by IA1PR11MB6076.namprd11.prod.outlook.com (2603:10b6:208:3d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 16:33:33 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%3]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 16:33:33 +0000
Message-ID: <091d8cce-d45a-43d9-8c19-00100389223d@intel.com>
Date: Wed, 22 Apr 2026 22:03:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] tests/intel/xe_exec_system_allocator: Expect UC PAT
 madvise rejection
To: Jia Yao <jia.yao@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Xin Wang <x.wang@intel.com>
References: <20260422065412.406536-1-jia.yao@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260422065412.406536-1-jia.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0227.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::8) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|IA1PR11MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cfe96f5-581c-4fc6-ac0d-08dea08ce50b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: I0xJzlHxhB6jUzWyMwHyK2xNYDK/Ci5eh3sKWmgozfgOFcXKHN0VOAzKMQltpI1rq0228GGbJ02F3GkRxoRimI+8FD/XdAYirqRXXDRgrY2wPYSm+B9/NEQZk2vUDq8ab10w/emIAdFrniXFRZu74oQhCsjqenVgOAsH8/3bQOjG3jLrXfeeYuzNIm9iwD+lya4pVcMouTBKTE2b/mybUR9lA0PVyvY1atCfU3GlQ8rE1Y+TNhn3uVy7VEcHkQ0+cSkq1NS4Cx9CIhGXLb5pPDzjUGpgpdKlF8xDTWd/8I3cLiZsbluGd0wxrhU8zuSsRXi1cctQGs4eCG44oz8lQ42f4mrkLQkW2h/lYxSsYoGECoTFwv63BY0bTvre0FkziOTXEGXdLBklmNrDmmyjf6yZnkCkm6Mq/lSBCgW0RYmpYESKLbc9PEFJwmGftN+QMSikmSSYK6u+/c5iOGmeGnBTII53e4Hlz0r68ODx6suaJ6xIxWjRc0X9fUZGJzRKXNKg5z9aDw2P9Hu08hFJaCmcQX9LnPtnisr6xrAikWLolsyg5Ipr6JvkNIXWwdH1oQzGSB+1oj4BirVjv+0Ow+IJQ0H44pP48RB4+TrYbP3XP5Zz8mkjD+dZvgqTon/6Q1h7g32NM0/zWJZaoxhz+bRIb98TOUVyAABWvls+BlDwAOnwL6kf+bOr+s3eDDrxTzV6J1t+KKZPJACnxgB7b7vqc3OluG2Ja9uTFRAf8iw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGkxU2VKS1pTbXdsV1ZvbFhTN1VYYUN4WVZRMjlOY2I5eUIwalFiOUl3QkdV?=
 =?utf-8?B?NkRSYjZacklKRnRLK2tiOGxvVjNnd3BEdFYvckp6K2hUMHZSaVNHYm51VU5w?=
 =?utf-8?B?Tmw1ZFlZTTVocGUzUEFjbHovTU1SNDB5eVFwWUVmbDZDUUN1ektsak8wN0Zj?=
 =?utf-8?B?MTNKNTl1YS9kbXFyTFFIMHdqQUp3NC9zNHRpc1VseHFCTUlxZDZaU0JjMTJX?=
 =?utf-8?B?V0F6OGdnb0lwb3dmREJ0VTA1STVWamcwY2Z6VWkzOU1OYTBCR3QrNkNSeXZj?=
 =?utf-8?B?MTZ5L2FwSUxubHAvYWJrNW9QZG9DaWxtbW9DZkRHaytTcmdRMFptcW5oelRo?=
 =?utf-8?B?Tlo2RkZ6bWZTcmxjNTROZCthVGZNWjVWYlo2dTR2Y3FJT29GaTJtdkllVmEr?=
 =?utf-8?B?OFNrcS9qZjhVcUJzdWpldjBQTjNmYVNCZU02UzgxeHBxbTgwMjd3SFUzc3NR?=
 =?utf-8?B?Q3V0SGxScU1VSDEzNXd4ejhncXRMcElMZXRTTERxcENGK3N2UVVLeTcxM3h0?=
 =?utf-8?B?R0ZkOGVHMjVaeW9jREsrRjVDYmZvT1UyYWxIR2lsaE1GbExvR3poN2pZUWxh?=
 =?utf-8?B?VjVMaGszNVc4ZmFBZTBPejBjZTdpWUFlMGVFbkxIS1ptZXdJTDM0WXZHNGRz?=
 =?utf-8?B?OG9MQ2RYTmIzRFE0UmpuMDdNWFF4T0laNFY4T2ZDSllYeCtEWDYxZjMyUFJP?=
 =?utf-8?B?djlKdFNUbkFIMmRFbUduVkxRekxYRVFRSmwwRHkvcjFuNTFjK2V4YnFLcEsr?=
 =?utf-8?B?bmFuOGNjUFh0b1E2NGdJaUgzczI3QnM4Q29FZ2NxTG45SEF2a3EyZHowZnpj?=
 =?utf-8?B?dHluYlRZVU5rT2gxdGtWaU9QeTlwR1VKSVdFem1nWjRoME14RXp6dmV0dzJk?=
 =?utf-8?B?dVRWa1I4bFRZNmlLdXZlTnpyR2JsaEwzU2ZvYUhtSHY2REowWXlteXhJMXV0?=
 =?utf-8?B?ellaelRGWmhaTnZxRE4xZE1SR2NRenBtZVZ0Q0VFazVmK1lwaitCQ1Vra0JC?=
 =?utf-8?B?MHRsU0FwTnZPeXFPWDFUbldqajVKaTF6T2RLMEZ1dGhxZDd1ZDk5NWo3dE5Q?=
 =?utf-8?B?MzdKeGp5OGdLdVB6K1AzQS9CZWpBMGRtTGlNdm9TV2N6R1pCY0thazk4L1N3?=
 =?utf-8?B?L1ZOa2wxblMyYUNsbFMvcE1hWUdRSU9WMjJzZ2xheTVwSlMvenpKSlZ4cE11?=
 =?utf-8?B?TDFNdHQ0WCtNTXdOU3pobCsrd3lPaUttcnJPVlF0VTBlWkdrSEFyandlN3Rw?=
 =?utf-8?B?K0FQVElGVXh4WDJmODI5RUlQY3NPL3NRWk1INmFHV3Y2Kzc2NDZrd1MrT0h4?=
 =?utf-8?B?NTBPZjJjekE2Z25BQWxZVEJNdCtXQ0ROSlZuWk8wVHV3NXAyZ3dneXpQakZF?=
 =?utf-8?B?OE5XUS9qRk5tSFZmQnRBZjJkWlNubytDUGRNWnBWNXJiam9KWTJwSzZaTmxZ?=
 =?utf-8?B?b3NXVlVoREp6bnVSWWRBUFRRRDVzbnpvUGRvekVIQ0Z0alhkRkthcDd4SzBS?=
 =?utf-8?B?Risvc20zbWl2U2FOeUtkUXFleWZjYWJ1OG1zcUtUems3YXhQKzQxMUJvbjM3?=
 =?utf-8?B?VkIvQzYvTmdKZFE2RVY1eXZtQVhVSWwrUDl4RnNhYVRGeGE2ZUlNd0ZuVGRm?=
 =?utf-8?B?UDJLaEZvUXg0ajltb2o3bTBUMlZCVTRuQkJENkxnUkZWRDVoY3VXR29LZVU1?=
 =?utf-8?B?Nnl5MkkyNGp6bVJ6Y1cvODVkTlhqZCtEME1McjVmVi9vZmlBbTNuQUhyTi9O?=
 =?utf-8?B?TG9CVnhaMVFpcmlLa3J3eEhveldnVHVwR1lGWmYzYkMrUmF4QWh3cnpiZDBw?=
 =?utf-8?B?NThUdHpiSEVLdmJJUFp3UVN6OUZJa3JWRUo0SitKek9SZEQyTjdXOW93NjZE?=
 =?utf-8?B?ZFV6Y0tVVTlhQzFZYkc0S0NTV20yOFhGU2hneWViRU9rc3BMbmVnbk90NGNt?=
 =?utf-8?B?cE56TDc3VWxPdGpyNUFNMnZZOVV3R21Md0traCtveE1DUjZiYU41ZmhhS1Vp?=
 =?utf-8?B?WThla3lEVU54Njd4Ym5xc0lWQkY3d1FHbHVNTEl0RjIveXNaWG9ROHhjbTl2?=
 =?utf-8?B?QlpCbVJ0UGxkdWFYSjBrTWJ1aW95ZlNKZ0wrTS9QcU5IeUZsMDBRL0Z1N2Zk?=
 =?utf-8?B?anhCbURRNUplYTRZZ1VtUFZkQUlKL1JEUmFiVit4aFhyYkNyVFZycXZYTkVC?=
 =?utf-8?B?TXprK29mY0FHRjc4dGZCZWhWWm9rZ1k2VEtScHJDQ3Rmb2c2N3JrVFVaU0t5?=
 =?utf-8?B?UWR5MHA3SXd5VnBVbDFVd2xIVXFPSjU4VngzclF5MzVVQ1JKMFh6YllwOUN4?=
 =?utf-8?B?SGFrYVI2Z3VPK0ZVU29WNTEveEdqTW1BdTZtK2h1MmppSy8vMGY5RmhpaVph?=
 =?utf-8?Q?Hz298uxuOxkAT0OU=3D?=
X-Exchange-RoutingPolicyChecked: AlFQ2HefkP5JNoYRd/Q5ODDyt0R6Drk+0fSp832rkjBpLxWvT0vFWQJjUs0Xpl+47ZdaMxt4dt90dAOD9x/yQIvRmZh3nv/88huvXeYPGpK6X8A6Jcdg2/diIoGwE8QcxthPDseHeh2HW/jFHQJIyd19w9zTJCY/Pftx15b2Va3Z8OBsTKU0jVB0C6hOz/E2D2qWiAEPruOFYxZnb2i8K3SRgArramJrUut31o3kFYOehhcmm0yU7F11I3/8Wl19CZJ6a+weNpyv2USwRvez6cNg5B2XwjRzH9STi1c0DGWtjTa+3AccDWr/XjgwWLFK2Ry9MeUqKYjkoeMedKgbdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfe96f5-581c-4fc6-ac0d-08dea08ce50b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 16:33:33.4028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpGCpxdZJ2yj6HaA7V4JjXm19/d+BucGDwAn7QN8sSdwuWFDx3b4oSndPtzvEkfPnKgnpQwWanCy7+3RHvO1zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
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


On 4/22/2026 12:24 PM, Jia Yao wrote:
> UC PAT index with CPU cached memory (system allocator) is now rejected
> by kernel to prevent security issues where GPU could bypass CPU cache
> and read stale sensitive data from DRAM.
>
> Modify UC PAT index tests to verify kernel correctly rejects the madvise
> call with -EINVAL, instead of attempting to execute batch buffers.
>
> v2(Xin Wang)
> - Put madvise rejection in a function
>
> v3:
> - Add multi-vma check in the function
>
> v4(Xin Wang)
> - Implement reject function inside test_exec
>
> v5(Xin Wang)
> - Some optimize
>
> v6:
> - wt is also judeged as coh_none inside kernel, need rejection too
>
> v7:
> - limited the change to iGPU only
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 57 +++++++++++++++++++++-----
>   1 file changed, 46 insertions(+), 11 deletions(-)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index ee199dd15..5580099f7 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1216,7 +1216,7 @@ xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr, uint64_t range)
>   		      DRM_XE_MIGRATE_ALL_PAGES, 0);
>   }
>   
> -static void
> +static bool
>   xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   			    size_t bo_size,
>   			    struct drm_xe_engine_class_instance *eci,
> @@ -1312,33 +1312,64 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   	if (flags & MADVISE_PAT_INDEX) {
>   		uint32_t num_ranges;
>   		struct drm_xe_mem_range_attr *mem_attrs;
> +		uint8_t pat_idx = pat_value(fd);
> +		bool is_uc_pat = (pat_value == intel_get_pat_idx_wt ||
> +				  pat_value == intel_get_pat_idx_uc ||
> +				  pat_value == intel_get_pat_idx_uc_comp);
> +		int err;
>   
>   		if (bo_size)
>   			bo_size = ALIGN(bo_size, SZ_4K);
>   
> +		if (is_uc_pat && !xe_has_vram(fd)) {
> +			/* UC PAT should be rejected by kernel for CPU cached memory (iGPU only) */
> +			if (flags & MADVISE_MULTI_VMA) {
> +				err = __xe_vm_madvise(fd, vm, to_user_pointer(data) + bo_size,
> +						      bo_size / 2, 0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +						      pat_idx, 0, 0);
> +				igt_assert_eq(err, -EINVAL);
> +
> +				err = __xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size,
> +						      0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +						      pat_idx, 0, 0);
> +				igt_assert_eq(err, -EINVAL);
> +
> +				err = __xe_vm_madvise(fd, vm, to_user_pointer(data) + bo_size / 2,
> +						      bo_size / 4, 0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +						      pat_idx, 0, 0);
> +				igt_assert_eq(err, -EINVAL);
> +			} else {
> +				err = __xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size,
> +						      0, DRM_XE_MEM_RANGE_ATTR_PAT, pat_idx, 0, 0);
> +				igt_assert_eq(err, -EINVAL);
> +			}
> +			return true;  /* Skip exec for UC PAT tests on iGPU */
> +		}
> +
>   		if (flags & MADVISE_MULTI_VMA) {
>   			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size,
> -					       bo_size / 2, pat_value(fd));
> +					       bo_size / 2, pat_idx);
>   			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size,
> -					       pat_value(fd));
> +					       pat_idx);
>   			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size / 2,
> -					       bo_size / 4, pat_value(fd));
> +					       bo_size / 4, pat_idx);
>   		} else {
>   			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size,
> -					       pat_value(fd));
> +					       pat_idx);
>   		}
>   
>   		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
>   		if (!mem_attrs) {
>   			igt_debug("Failed to get memory attributes\n");
> -			return;
> +			return false;
>   		}
>   
>   		for (uint32_t i = 0; i < num_ranges; i++)
> -			igt_assert_eq_u32(mem_attrs[i].pat_index.val, pat_value(fd));
> +			igt_assert_eq_u32(mem_attrs[i].pat_index.val, pat_idx);
>   
>   		free(mem_attrs);
>   	}
> +	return false;
>   }
>   
>   static void
> @@ -1560,8 +1591,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	addr = to_user_pointer(data);
>   
>   	if (flags & MADVISE_OP)
> -		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
> -					    pat_value);
> +		if (xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
> +						pat_value))
> +			goto cleanup;
>   
>   	if (flags & BO_UNMAP) {
>   		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> @@ -1971,8 +2003,11 @@ cleanup:
>   		gem_close(fd, bo);
>   	}
>   
> -	munmap(bind_ufence, SZ_4K);
> -	gem_close(fd, bind_sync);
> +	if (bind_ufence)
> +		munmap(bind_ufence, SZ_4K);
> +
> +	if (bind_sync)
> +		gem_close(fd, bind_sync);
>   
>   	if (flags & BUSY)
>   		igt_assert_eq(unbind_system_allocator(), -EBUSY);

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

