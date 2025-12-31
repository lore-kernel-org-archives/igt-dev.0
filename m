Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96ACEE645E
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 17:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B90F10E058;
	Wed, 31 Dec 2025 17:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mk0t+gCm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A8A10E058
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767201187; x=1798737187;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=un//pPHxxmVLETG3oKfNprv7YF/zXzQ3UC4e9Vh/TFA=;
 b=mk0t+gCm8QzWcM0LFlU9PziWFLJtWHB0SQbINBeFICidE8xZU0AtqixL
 tsXeE4mKEyL8b5cYqZ/5eO1qVlnKRNekLqVtK99sq6cvPsiNkY5HRRZIA
 eEYjZl9Hu/oBrsJcsmT0m052qH3MAo2AKLoO/p5JVBScjLo0J7wZHEV/b
 jR2qluT+HNmvCOPiL1artVuXIztuktisEi0SMSQwgW12K0t8MAitQswTk
 /Uwob37Q/vqvN/Fuxpuk/sMHLLEdJLzufQOZ+41uUf7pvFteQFKKNClrO
 bo8uknW1eSATglU/EIECwbHwkbz6w2XbxFkmOUX7HGTz5AMB32qCPP9Gi g==;
X-CSE-ConnectionGUID: vezsXhqsSLi1KXlsnxTkUA==
X-CSE-MsgGUID: h7K2jlRDTa2RqbQNF3qLRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68516387"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; d="scan'208";a="68516387"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 09:13:07 -0800
X-CSE-ConnectionGUID: NHZa9tHwTESR9SWsSYpoZw==
X-CSE-MsgGUID: zF7GdKIeTO6KwrHlgHkMPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; d="scan'208";a="202430457"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 09:13:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 09:13:06 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 09:13:06 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 09:13:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tP+V8v9mS8ghlX9ENPEybSY2ciS24f7JoKxI0MKNh6+dX2GsZMd8C0rCBURWFKRibYbtBQpvMnCP8igYCXf5Yo17hoEYnbcIYEY9QlMut9gQMLzHtAapjo3S8b37HBw4Z2v4xyYkaY6vsZeabZ9M9JJEytn6z+Qc3Xtehv/rqj9oCUZMJSWa8S+2ZpcROTH6weJjIhisUwILcHaS+UUInBvMey9cmyKt28jbv5QfazwtufZGtdJngZAp4k1DUxRr7PR4oO2e1X0gPWh/NYiaqwkgeWvFgrgJ43ncvvrZEIP1Xp2k9PvusCk6bqmGfLCvuXIQ9MPNa4rJD9G5hAUs5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBVfCezGUjk8wc3fgr6BEfGfGcBRd5mufEEuYunIG98=;
 b=uSvCDL5n8qKN9j89leW69iumjNWJoj0/SexlgPgr1hhxYdvZpvWM6gslQ1OQnY5uF363oHfXScQ/A9RMgzfmcwtRE4gT9NZq7CckmPlXXns7FhRQ1dHnsqgt4fSXM+l1mHiT/D8gxkHCJkMpEFUNUJCByJMw9WyNqjjIVkqMCYSG8huHKNWnE6zMj5+mAyMxVkEZY2sxoW0oUXcpgW7azHfXpXV5TT8vvn3fw4xn8IP3Cy1etd1b+uN+cMXYVv2+WVL/qq9Gx7Rd7LWB03dSEjbdDxdkp9SMVck0P3rmzZ+zoOV9x4ro8kT73izbJIipdBDA0EgAz9DIi9WDM58xvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 17:13:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9456.013; Wed, 31 Dec 2025
 17:13:03 +0000
Date: Wed, 31 Dec 2025 09:13:00 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <alex.zuo@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>,
 <kamil.konieczny@intel.com>, <ravi.kumar.vodapalli@intel.com>,
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v9 5/5] intel-ci: add xe_pat pat-sanity
Message-ID: <20251231171300.GB4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251231055525.51524-1-x.wang@intel.com>
 <20251231055525.51524-6-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251231055525.51524-6-x.wang@intel.com>
X-ClientProxiedBy: BYAPR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::46) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: 0258ce17-467e-4b43-6b28-08de488fdb41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?26I6ctOEtAEqhlcCpOheOjGrMfzP+d346Lj2jR3PLfVM7VtX5U3rXnTMgmQm?=
 =?us-ascii?Q?NgWntu48tUElj2/zLi3zxwXI4LtjpKwjNkOGpD+tT0gD/cSXnbabxX8QBlbY?=
 =?us-ascii?Q?jeQvufcBnXQaXcuiwnh7pfpvEG5jj+SU2eAnk0zkBB75jInhVvRw0TqpHBu/?=
 =?us-ascii?Q?j7NzqVFsMsT4BnMSCMOVZ41sl8NhkRmz5XqqQ7F5OvRaJ7PbpfiXE6JxsPeu?=
 =?us-ascii?Q?BNsYk6/K5WW6vMpZJtcql1P2o/4GVZJCfGSCScu5mXgNqNH+UYuY8tEXKTTh?=
 =?us-ascii?Q?9PxlVozPuLsMwkcfru/hVkJHk6oyAz4Wzv7EQoGU/ZIn6tZZGMuqG2wxxoBi?=
 =?us-ascii?Q?YcuIB8PQTZt5FQlw3N+A5WZ7bARQ9QQQ1ETX8J3Oe8dARv/vn588BqpdaueR?=
 =?us-ascii?Q?boeazCHE0WdB7pY+8powCK5hAAXXX5+BjBFIvVJx+5oRcjW4tiAz+V4Xqn++?=
 =?us-ascii?Q?fsEiB4z3w8VxUwyniERuXi27a4TasnE4jTNnLqjGSeeoLG6tYOiULIF/Ch0d?=
 =?us-ascii?Q?hFrZ3wgW+uei3GbYsf5mtT6xYjFyNAaxJ8fDyd+dqeCcXfM3i3VE1WzNP6Pk?=
 =?us-ascii?Q?A1nI1QaKLyM7476o4TPN5LxmeTwx1swhCwG7WQG+CaFTLddqk6oB98mpZiRK?=
 =?us-ascii?Q?RKJtkbFdR1gusGO5dKLPJ2KgWTeZFH7fsPd+XrGtRAIs0abawkoUq6fQbfAJ?=
 =?us-ascii?Q?IZqOfhYwLxnd7KqXfcbp0TPLVzpruHdGcEclUwwPVKJ4Ro9w45TgNzoilMmV?=
 =?us-ascii?Q?5teGXpSbjutqTR/R6bhWTP7K1Rv9V95EhH+Ml54m73fXk6CrGRnXvXeWg/M4?=
 =?us-ascii?Q?aa9F6FLrmZg2NAcdMW2ujs8REvcGjdJRmvGlkLuSJfI15FNq5IbWXQNxnFl8?=
 =?us-ascii?Q?pp1kteBOcfzjdLmGb/6s3ViKiNvGbrhEaJF21RRSa3U6mykLVil4gsTfmwdo?=
 =?us-ascii?Q?8SgBC1eCRvIVqycjD58/XGzZ250/6ZfY3GlRJQX69a1UTmra5c3ca/joLyV3?=
 =?us-ascii?Q?i7tUM3gnnHsxRyuR5AXcCOSUIdBkg1lHLMnU2vYSXP7Q6MyAzE+pvTdP2Cyq?=
 =?us-ascii?Q?R+POJ6C7+WGeZyTPmDZEgfM2aoAKbAzd30RA6ySC5xBLLUBV+CNdFCUVbKOL?=
 =?us-ascii?Q?Lc5nq4Q+pTxhUfh9W9ZvhgKEsiTarVanSVXSfESjbU0GdDcTVDmgjMz7zFQb?=
 =?us-ascii?Q?CFN/sriKbrWVv873nfkvhz7pSGZGM+s0aKUM4GAMoGjeDs7VibTzgirmoHst?=
 =?us-ascii?Q?IK/pawGKtMvnyS00hTkA1gB2dXKkWqxoyZtpAW2FAyPEx2hf8hrD+6XvhQm7?=
 =?us-ascii?Q?ZSet+wxMaS4xfF2lb6i2BXRvoUvT9YFOINZwqMBTprLTQvCHcXK42za4bPLD?=
 =?us-ascii?Q?Vl1yRcnYTQLZE/Q1TOn2NvClwKsW7xqyKGRs9c7CpQxRoWkQQUbrpT7O+P7E?=
 =?us-ascii?Q?6hqK2vUYK8zPlJxMbg8xEp9eN5grPQ5G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WSWB3mAaw9TTfFiTgR5yUntOsNfJCzGN4pcEvoX+bJr5+wlQ35Nf+1TiidKM?=
 =?us-ascii?Q?vjOz0OQS8AV7V/oxoEE6ispzAFbA5UrHbZRPALBq6tsLHhkxvmY+wAjuGTBG?=
 =?us-ascii?Q?R7HaSI6pQmXz4ziw+7lEuV7q3lHKsIH6h/1SHPkW2txg+OhCtsTSlalpkCXU?=
 =?us-ascii?Q?bFXmebzdbl8gKvOW6LSTXQGyxVNS4IgEKEL2xCCdC+x8BdfOlmFEC24ijjtS?=
 =?us-ascii?Q?723IjhUNK4VuXvV0nDw+RbTwSq4N9fMNuV+vFTY0+8pekgYrjpYZWwVqA25E?=
 =?us-ascii?Q?2vhdu2bovh5uJvMxILxdJ1Mq8H5vV7q2lPqWavMtHNgQb0UkiZKA2u3sMUJy?=
 =?us-ascii?Q?6eszPFXgLU5pgAUTqEXYpbEVKSP0bwIieVLedwUVW8uZhm4N4lf05z5UnL7N?=
 =?us-ascii?Q?xuot9T8N/GYHJa7qtnS4tyEfwHo+uRFK0UrrfIgArfH9uSvlRPL8DD4+MVy/?=
 =?us-ascii?Q?yDL42XZmWjKOjXC+hiKptOwxEGaQL4BRfhqkk6zohsFYGnRkasMh9O52nmIh?=
 =?us-ascii?Q?vXqW3e8ntkxcY5gpnyJQB8CatjT9eE4umia/6h3pT9FT9NemvQKPfvk7iAIS?=
 =?us-ascii?Q?z4uzd/ldZQu0dNh6o/eLRuPsNjUO8GuuHCupcS8dDB+0la3ORR4eD4y34hnW?=
 =?us-ascii?Q?q7Pe+u5JhijlZstEY/iSBmRM1rPu4d8ugxTVzWbV2ppPel3rnt0cKjNPn2d2?=
 =?us-ascii?Q?le0mqBheaRBmxKmLkl+EsWL+59TcMmRKWHg/6fGFb6/NyDzn/fvYxDJZ536X?=
 =?us-ascii?Q?yg0AGQD1aPFtzcuWbEobfS/CD3NHvb89yWBWut9qZitVr9GiREEKNA/C3cAu?=
 =?us-ascii?Q?OhgFvDaFk9eMOpBMin7zJYM0KQIbogezddtKcEe6O/xz5nn47cacrJDBuPHO?=
 =?us-ascii?Q?TvqkcKRN1LJ4tCAh7sFeHk8D030A/Y40hiOPB+ZtU2jD8AleEMHYx1npNidR?=
 =?us-ascii?Q?mX4P+emhzi5nVZolFR1NgFf1ou097Y5INw0OZPchR1Y46yV0hXfw22ZjWbxf?=
 =?us-ascii?Q?N/w61L/S0Psubp3xsrU3pl1ouIuPdjJgknetFz2++i3ALM805rZ6g1kU30O8?=
 =?us-ascii?Q?vrLz+dyM9NSNdCASREPh+fF/mt9d7BU1mjrkfJKbdC7GCNBk5GXjJ/61ILgm?=
 =?us-ascii?Q?BGYeLxAQkECto6VOFFsQgppOCL8CS/es5pdmpfevcCHJcMMpycOTC/zCBdca?=
 =?us-ascii?Q?thI6nkaQPUyC8qbG6gtcMc1OysV3XQEb3YBOFg8HK385lTq/p2+Zou747Kl6?=
 =?us-ascii?Q?XvV7vt2YXCyjN9MZhUP9qj0zT+/yMcGy8Cvm/5GL/JyLZG0z6S8RTYSA78og?=
 =?us-ascii?Q?l8/w5aCnDs1cgjIuHn5//2fDycYKS0IX/G4q3Z+D5fFhhUe4LYNCR7R8DEC2?=
 =?us-ascii?Q?xhlmNqEhEEUu2zbd8ykPoJ9JgDsPqvgRnGq6fgBoEPfDobF2D0HhUnEZg7Uy?=
 =?us-ascii?Q?T8+hVklRDQs+INiD6lPWOe76KkrYE+4Qsw6klsuyIyEhMC7oplc4u9772NQ6?=
 =?us-ascii?Q?SOFt9VIIRx/DeYKw3+rZ2S0dMQBrKPQr73cUQRihhDGYNyJg7iTenQASkv+2?=
 =?us-ascii?Q?VlXmZ1xrh4mZzbauBpVQMpa3vBZa9ZbEBqjCULjOv/JO6cEZ01vOUZ958OsB?=
 =?us-ascii?Q?q+zegxWrwc/F6q4Yh1Ur6V+f0iAZ0ywZxZ87+lK9GZwPjD+nPkstslmyWi76?=
 =?us-ascii?Q?TNmrZJwpVbOJuBPtQDMKqq0Q7t+gKQIFnaleRlsdTi/4/6zG4G+FplPc7gxe?=
 =?us-ascii?Q?/CplXmXIUK7iua6WrIzlz0JVvcPYlZo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0258ce17-467e-4b43-6b28-08de488fdb41
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:13:03.0679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Fol4otvS5DEHTftUGIi1A2Yk2o7+9g0qeIJfdW864dLaZ2esrKXbpO+jJQBi1P7rMZP9PaKOUHUD8sDAaB7+PCRKNwum8JnpJ47l1zFJwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

On Wed, Dec 31, 2025 at 05:55:25AM +0000, Xin Wang wrote:
> Add the new igt@xe_pat@pat-sanity subtest to the Xe fast-feedback
> testlist so PAT configuration sanity checks are exercised in CI.
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  tests/intel-ci/xe.fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> index 15fce6a42..acff025fa 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> @@ -202,6 +202,7 @@ igt@xe_vm@munmap-style-unbind-userptr-end
>  igt@xe_vm@munmap-style-unbind-userptr-front
>  igt@xe_vm@munmap-style-unbind-userptr-inval-end
>  igt@xe_vm@munmap-style-unbind-userptr-inval-front
> +igt@xe_pat@pat-sanity
>  igt@xe_pat@userptr-coh-none
>  igt@xe_pat@prime-self-import-coh
>  igt@xe_pat@prime-external-import-coh
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
