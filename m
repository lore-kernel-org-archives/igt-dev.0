Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CBAC3DA60
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 18:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D7510E317;
	Wed, 17 Jul 2024 18:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FeIJkL2Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F2A10E317
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 18:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721241431; x=1752777431;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VgEImI/Guq9RrOzhVqqLa0w1EpTx/5HOZBqGDGxW0YQ=;
 b=FeIJkL2Y8FO/sO/icsUQyEPMvwuN+puqLaPSDCDZeOfkMDSM1M0g/a79
 53Ut5Zt246e86dpGFn5Mzd3QBsrbaL/DuIJz2E1nYEEj2K/pZt3z+E14G
 GPMyN+/mNofBLHPzmv2Y4yao47WV93kDFsjdO0TP+dkfJaWPHNRhMRbe7
 x+L88sMaCh/vo3lL4yUKbwqDLk3EbyGnwaspUqRXdnaVCixg2PJaGdRqr
 4BD8O6WAcjoLUPRURo/Ec49pm8pp3EoUIUm88xkwrPkmr7i842zgaMXK4
 rN2rMRH8+xw3i6hUzuJUCZH8PlBCzMFA6o5fLr06mF3/yIwMQf98Nr4jN A==;
X-CSE-ConnectionGUID: bi/eC04pRTGD2UyaWftyXw==
X-CSE-MsgGUID: qGzA1SWxRiqfVClHw9jU4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18901527"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18901527"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 11:37:10 -0700
X-CSE-ConnectionGUID: knFEvMhTS1GTl43pVzfpWA==
X-CSE-MsgGUID: IHVGB351QhuBgfLtn7atxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50358070"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 11:37:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 11:37:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 11:37:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 11:37:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 11:37:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHHe05Pv2INt/tHqkF6NY79dCx64yLnBJ0IkzNF7SVqfXg7b6JwdWr3HWpwXR2WMnT/KGITG3Gi8oYGpAKqo+/qnAWn5DAKVT8xeL+7vX8337Xo6N8t9FYC6ATaC/RzBtoJh2T4cqbPOqOZPgelk7ukdalevcKpyVYb59oZstP+rUpWjuOeD/sJDEiu+Ku2cwqlJb+MGrQBL3sIGPH0dfMytuk9vqYJ55xJ+fVFBK9jKvHcRjdPW6pAXXG+ipkpQZocGvnqjCSFMThxEKUFgDyivNaucrMmUfxgY10pvq9XedkMzRDdzaSElztDlbytyoLNfcrCM7WABOmpYaBAaJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndQJX0dS71Vr33f6w3Fz+n1OE6zaRe6haZMJIDubtSA=;
 b=fRd4jld3JpeqbTNGadxEJvnbXXfNHt6T1gaN9UB/8SkRCRzkx2sJmJXck6dSTaQtd9ktoZ3wpSWnvjyDfqMVJPHHht57i3+3yq1YaAuNwsMLzMvCophYhhxcALfRQBLCren2dro9RRV4bE/C5zSZnH9GNHehZwZ9vefvieYQP7414zKzefhJuq/hFHR5Mp6q2q4PwBJHORqSfjMBJY3pE3ZEg6G9Eetx9tz2KEHUyas4qnMaBjLGK0fU8uI18m+6yJEtDCp2hsrBXgotqD4FpBDbhfu5muxIKYc7mEZK1zRUsmk6ChyMp3SgwSep4XRljFufvCcChdjbHPn3CzIV9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Wed, 17 Jul
 2024 18:37:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 18:37:06 +0000
Date: Wed, 17 Jul 2024 18:36:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t,v2] tests/intel/xe_exec_mix_modes: Add new tests
 for parallel execution
Message-ID: <ZpgPH+MuYRNSPEOt@DUT025-TGLU.fm.intel.com>
References: <20240717163520.1145834-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240717163520.1145834-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dfc1e07-a3ce-480d-e828-08dca68f75a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?owCVVXtAcyhxX3E40qbsiCSp4jBWAkE+16o/yJ/BZjEo0UHct6x0QVZgcW?=
 =?iso-8859-1?Q?v4TYZpCTcBJuC6ghpzyWuJk0F7soLxLzYnuZEuckjBidHFQCCkOKDYg4BG?=
 =?iso-8859-1?Q?Alb9VFeR2e1me1/f3BJ/yvszlvsuqeQ15wr3c2OB2RTmpOeTtjzhieLN51?=
 =?iso-8859-1?Q?fnH4LkqQw6caQJwZNbK4+FTr+ul97IulPjzP5/N48s66JY6YCeblnXz5eq?=
 =?iso-8859-1?Q?4mTHGMTxANmbYWyScAJoBxKaoOGIzqkWeDawk/JnL+oJh8djxjBnXv9X2D?=
 =?iso-8859-1?Q?9WSQpKijfuCbLkPQIB9/fGbMmPUzsWR9WKnz1KaP96HKh1w+gvaP8tUiZi?=
 =?iso-8859-1?Q?/nN1oV96PVHo+5i5hKMtOCsThQbV1Au5CoU1a74sPHnInFPhwCBQQF6R1O?=
 =?iso-8859-1?Q?XqgTO7Kpm0RJe0oS3eU1CxY6xMnuJWboKs8AQuYFJ/tmhk4Y72CrBdolar?=
 =?iso-8859-1?Q?7ck4TNw6idPYlmY7dUMIldW0KvNttJd9NWk0SZyqDnId3dXMTCMvGWiumr?=
 =?iso-8859-1?Q?VJDnU1bgpDwdL3rZ1BV++GGazjI87OaGadtNQ0tqHxAo2nt/JR+OQGpgYt?=
 =?iso-8859-1?Q?svOlUEH3lFv1yYC6NKe7Z38esd/S+PmeKjq8eoRH0q9bDdwLpkM4NHTTI8?=
 =?iso-8859-1?Q?6d1MqixErouq/FGsej2Da0Oz+CN6JR6Dhvu75ZajZea+x1IZLZCTvBmx+u?=
 =?iso-8859-1?Q?eBqwUsQCdGb9P2PaMdQXcw+AsFn2AxH6vaJKdR5q4KwBtLaBUTo+VBA4m8?=
 =?iso-8859-1?Q?frqCe9OaADr45PlyXwXHs0inJXZEfimmgoRSVwsQnQa2fCdPLY1ewyH6M0?=
 =?iso-8859-1?Q?8GwcCdOKAqjdmf1dzwQLFA47CLw2supwUI74xn3pFvDfd3YkOeBAeoGXYD?=
 =?iso-8859-1?Q?8h5KCVSUjhxRbSTyAOL3PkY7EPXcy32E8VMvZ+sG+iMqEmY1zz8VoRb0z7?=
 =?iso-8859-1?Q?03GVgJdf4MKVUVHPJ7GV4NIqZXSwBLHhI97GebRctYk3PkiUXUUs4FXvCi?=
 =?iso-8859-1?Q?u8E7n5eP2oK+exdCnVNuExZ/SYy7yGOpnUtsTi2sbFgWH2An1J8qxsP/ph?=
 =?iso-8859-1?Q?PhD0RIMQgVz8mTN3++0Vd3YTwxoVcvirHs2qauRwtWd4LonlLRKH/x6lZK?=
 =?iso-8859-1?Q?RYYwJxKqdUoLVVUivfjyE3JDCcs+y9KDUA+0uersw16YYeXmrYoznmzlT0?=
 =?iso-8859-1?Q?XSPUS8zmlVM16muENAbOErzqPCU6jFG0Bv0lP6/+UZvJl7lOEtmBjgFZJS?=
 =?iso-8859-1?Q?PGQI09VVCyhRwN/9EgzkCGrXO0lr7HBXrmy17EsorkCVzNNxdsV8UozwQw?=
 =?iso-8859-1?Q?dMMT0BteDcuXdRi0lLkCYKtufKjPsJniC7erbj37dv/0+hhz2ynNHQj7LM?=
 =?iso-8859-1?Q?A3Uxce1njIK+16W6yvxmXP9w1Wlf+3Wg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MEjSIcvlQLEDr/D3oigrrAEb6LMy3CwHMZFf/4SpuBFEMFw7np7HG+5bz+?=
 =?iso-8859-1?Q?r3MnASu/gWCZemgac1dRHC4DSG0zKzlOLhXfKpp9xklX4rsko+694vvrlw?=
 =?iso-8859-1?Q?ylEMv59EPQne2WCP2USEZH5xBiyWKmkWCT5wr3mQU/mHlcoClJdQhIXGN1?=
 =?iso-8859-1?Q?ro9tLB9bOB+FllFyS1Sy9xI2RSL/qVkF388AkRt5ueMFo1636GgXACa3l6?=
 =?iso-8859-1?Q?MwnJOfGABWdUHsMHQfIBnkU0pHnx/azB95+lNlW5YgaY3ZcoBVQVUKydTA?=
 =?iso-8859-1?Q?lBl0HB5ud2sk/YUJIhtN25Bd/wOzwDvtwUD0CuJ9+Zly9+4xTFFJRevWCV?=
 =?iso-8859-1?Q?SWvAq6LO5sNNgL0K8pcfxlraoEAy2v3Y6HUTxnjzC/6mQLn/BAIhcbw9g1?=
 =?iso-8859-1?Q?t4KwvgfjMvVLbOe5pYWEpH7/jfZOTLcyNPiWFhtH1h/Fh+R+38I9Qg3Et7?=
 =?iso-8859-1?Q?7Cm2i1hgACjnj2z286wWhUfg9MuE70dD9YL71dT/Vjx8D2UFsPB7ZiIzrM?=
 =?iso-8859-1?Q?NR6Cstr9FjxmVSI5lC3NTJe7+q7jWINo0jX6qsuUH6dtecpR4QdRg0sfu8?=
 =?iso-8859-1?Q?6uCIabYxQAKmDJt8CouUdVtyQBp/Wd6jYYXk1WraWO8wN+3UKK6ccS7tAd?=
 =?iso-8859-1?Q?YVknb9jF8xFv0eS8MGO6nqCdXsexy+aQvpzJ+6FxFRo7UTiMq1FqSIGRLA?=
 =?iso-8859-1?Q?/BWhCrIPKEwExglmh3bBgS/NG6iK95s2LJfyPH8T97hiuLqZEIWuG7NkGD?=
 =?iso-8859-1?Q?AMpVDwVSndsflPtxqB2oyHHrdny45E6+KyDUkLwqkQRRTGp+SmMaMrbWq9?=
 =?iso-8859-1?Q?ZzgFRxV5Q53VMOXQFdh5M/RmILspzVpRiMSMtGLDaFfPrr+6uqmZK3cETJ?=
 =?iso-8859-1?Q?KTjRKKOh8MlI84FoMuqBYpmET++73AQqakBfKckjbKHiIpWe0NBpzTdNNn?=
 =?iso-8859-1?Q?rjhvJvcyNWXeMUez0DKhxpkNV+g3SEtFNCam7cL/BZvgOQxaht8DdeAtak?=
 =?iso-8859-1?Q?duqZU+PTJgupq/hndshHeUpjkilaBSq/sLB6t/HkJtYG7Crw3LHLlQr0NF?=
 =?iso-8859-1?Q?WZBY34k1yLi/UlKZOIGqgZAYe9YYaydtt2hMlVV+32fK/fXDNDrFJfaTUT?=
 =?iso-8859-1?Q?srmAlVpnOx1NVdYrhCohLvMDev6yxtc6K4yGPMssl/jlFSZwcq6SQwETav?=
 =?iso-8859-1?Q?aefFLA6DBrPjEQWdnJopEUvogn45BVpnMv5Ua3UEj6KsJML0kT+gZeiUrZ?=
 =?iso-8859-1?Q?iL6CS6uIj6I0Og1FcXmdRVlu+16WjoOXaGPNFSxzvj1we7tjfrzKwpFxBF?=
 =?iso-8859-1?Q?xpMBV7vN3xkN3SwglDD7iZnR/B+kzct4NXkf+3t6bnS5YG+gou1pnmEH4t?=
 =?iso-8859-1?Q?bVNF7vX5/04H0RtcbeQcjqaEK5rII7dwbkn5iLPiefupi9lmhPCmGJ1JLc?=
 =?iso-8859-1?Q?bVM5OHqDzEGJinIlpU8OxhJMKdeaoaH0J/wFWx2WALVMrdrTiWWd3e40rF?=
 =?iso-8859-1?Q?eRMEDLzhFoixMAGPHQeYZHQOaNWlilf0LbUZiUDfbcWHaDziA2bJhFzK3W?=
 =?iso-8859-1?Q?xYUYvIIMIjXuXptLvHGLyXDnb79lWX8ni0ax8ijWn1bfLhaTqZ1p5N6IXO?=
 =?iso-8859-1?Q?F6DiJ9ZnSSqOnXIDG0tV+UNtSRcwoUWOt/ofCzNt+cEfUJdEAE+fMLdg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dfc1e07-a3ce-480d-e828-08dca68f75a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 18:37:06.5303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsQVTFxTRBZ5aOEXQR3f+6ppuZmSKHR5dEjXWqmgbCaw2OwpCfHmZwTD8e5jpz/1SGA1NLwJhQucmfKckAigcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7350
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

On Wed, Jul 17, 2024 at 06:35:19PM +0200, Francois Dugast wrote:
> Test parallel execution of LR and dma fence jobs on the same device.
> 
> Add the following tests:
> * "exec-simple-batch-store-lr"
> * "exec-simple-batch-store-dma-fence"
> * "exec-spinner-interrupted-lr"
> * "exec-spinner-interrupted-dma-fence"
> 
> v2: Remove useless exec queue priority, multiple job submissions
>     even when running without preemption, nits (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_exec_mix_modes.c | 268 ++++++++++++++++++++++++++++++++
>  tests/meson.build               |   1 +
>  2 files changed, 269 insertions(+)
>  create mode 100644 tests/intel/xe_exec_mix_modes.c
> 
> diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
> new file mode 100644
> index 000000000..f7bb96255
> --- /dev/null
> +++ b/tests/intel/xe_exec_mix_modes.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: Test the parallel submission of jobs in LR and dma fence modes
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: CMD submission
> + * Functionality: fault mode
> + * GPU requirements: GPU needs support for DRM_XE_VM_CREATE_FLAG_FAULT_MODE
> + */
> +
> +#include <fcntl.h>
> +
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "lib/intel_reg.h"
> +#include "xe_drm.h"
> +
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include "xe/xe_spin.h"
> +#include <string.h>
> +
> +#define FLAG_EXEC_MODE_LR	(0x1 << 0)
> +#define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
> +
> +#define NUM_INTERRUPTING_JOBS	5
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +#define ONE_SEC			MS_TO_NS(1000)
> +#define VM_DATA			0
> +#define SPIN_DATA		1
> +#define EXEC_DATA		2
> +#define DATA_COUNT		3
> +
> +struct data {
> +	struct xe_spin spin;
> +	uint32_t batch[16];
> +	uint64_t vm_sync;
> +	uint32_t data;
> +	uint64_t exec_sync;
> +	uint64_t addr;
> +};
> +
> +static void store_dword_batch(struct data *data, uint64_t addr, int value)
> +{
> +	int b;
> +	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
> +	uint64_t batch_addr = addr + batch_offset;
> +	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
> +	uint64_t sdi_addr = addr + sdi_offset;
> +
> +	b = 0;
> +	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +	data->batch[b++] = sdi_addr;
> +	data->batch[b++] = sdi_addr >> 32;
> +	data->batch[b++] = value;
> +	data->batch[b++] = MI_BATCH_BUFFER_END;
> +	igt_assert(b <= ARRAY_SIZE(data->batch));
> +
> +	data->addr = batch_addr;
> +}
> +
> +enum engine_execution_mode {
> +	EXEC_MODE_LR,
> +	EXEC_MODE_DMA_FENCE,
> +};
> +
> +enum job_type {
> +	SIMPLE_BATCH_STORE,
> +	SPINNER_INTERRUPTED,
> +};
> +
> +static void
> +run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> +	enum engine_execution_mode engine_execution_mode,
> +	enum job_type job_type, bool allow_recursion)
> +{
> +	struct drm_xe_sync sync[1] = {
> +		{ .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +	struct data *data;
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +	size_t bo_size;
> +	int value = 0x123456;
> +	uint64_t addr = 0x100000;
> +	uint32_t bo = 0;
> +	unsigned int vm_flags = 0;
> +	struct xe_spin_opts spin_opts = { .preempt = true };
> +	const uint64_t duration_ns = NSEC_PER_SEC / 2; /* 500ms */
> +	struct timespec tv;
> +	enum engine_execution_mode interrupting_engine_execution_mode;
> +
> +	if (engine_execution_mode == EXEC_MODE_LR) {
> +		sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
> +		sync[0].timeline_value = USER_FENCE_VALUE;
> +		vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE;
> +	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> +		sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> +		sync[0].handle = syncobj_create(fd, 0);
> +	}
> +
> +	vm = xe_vm_create(fd, vm_flags, 0);
> +	bo_size = sizeof(*data) * DATA_COUNT;
> +	bo_size = xe_bb_size(fd, bo_size);
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, hwe->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	data = xe_bo_map(fd, bo, bo_size);
> +	if (engine_execution_mode == EXEC_MODE_LR)
> +		sync[0].addr = to_user_pointer(&data[VM_DATA].vm_sync);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync[0], 1);
> +
> +	store_dword_batch(data, addr, value);
> +	if (engine_execution_mode == EXEC_MODE_LR) {
> +		xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> +		sync[0].addr = addr + (char *)&data[EXEC_DATA].exec_sync - (char *)data;
> +	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> +		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +		syncobj_reset(fd, &sync[0].handle, 1);
> +		sync[0].flags &= DRM_XE_SYNC_FLAG_SIGNAL;
> +	}
> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
> +	exec.exec_queue_id = exec_queue;
> +
> +	if (job_type == SPINNER_INTERRUPTED) {
> +		spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
> +		spin_opts.ctx_ticks = duration_to_ctx_ticks(fd, 0, duration_ns);
> +		xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
> +		if (engine_execution_mode == EXEC_MODE_LR)
> +			sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;
> +		exec.address = spin_opts.addr;
> +	} else if (job_type == SIMPLE_BATCH_STORE) {
> +		exec.address = data->addr;
> +	}
> +	xe_exec(fd, &exec);
> +
> +	if (job_type == SPINNER_INTERRUPTED) {
> +		if (engine_execution_mode == EXEC_MODE_LR)
> +			interrupting_engine_execution_mode = EXEC_MODE_DMA_FENCE;
> +		else if (engine_execution_mode == EXEC_MODE_DMA_FENCE)
> +			interrupting_engine_execution_mode = EXEC_MODE_LR;
> +		xe_spin_wait_started(&data[SPIN_DATA].spin);
> +	} else if (job_type == SIMPLE_BATCH_STORE) {
> +		interrupting_engine_execution_mode = engine_execution_mode;
> +	}
> +
> +	if (allow_recursion) {
> +		igt_gettime(&tv);
> +		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
> +		{
> +			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE, false);
> +			/**
> +			 * Executing a SIMPLE_BATCH_STORE job takes significantly less time than
> +			 * duration_ns.
> +			 * When a spinner is running in LR mode, the interrupting job preempts it
> +			 * in KMD and should complete fast, shortly after starting the spinner.
> +			 * When a spinner is running in dma fence mode, the interrupting job waits
> +			 * in KMD and should complete shortly after the spinner has ended.
> +			 * The checks below are to verify preempting/waiting happens as expected
> +			 * depending on the execution mode.
> +			 */
> +			if (engine_execution_mode == EXEC_MODE_LR)
> +				igt_assert(igt_nsec_elapsed(&tv) < 0.5 * duration_ns);
> +			else if (engine_execution_mode == EXEC_MODE_DMA_FENCE &&
> +				 job_type == SPINNER_INTERRUPTED)
> +				igt_assert(igt_nsec_elapsed(&tv) > duration_ns);
> +		}
> +	}
> +
> +	if (engine_execution_mode == EXEC_MODE_LR) {
> +		if (job_type == SPINNER_INTERRUPTED)
> +			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> +		else if (job_type == SIMPLE_BATCH_STORE)
> +			xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
> +	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> +		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +		syncobj_destroy(fd, sync[0].handle);
> +	}
> +
> +	if (job_type == SIMPLE_BATCH_STORE)
> +		igt_assert_eq(data->data, value);
> +
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/**
> + * SUBTEST: exec-simple-batch-store-lr
> + * Description: Execute a simple batch store job in long running mode
> + *
> + * SUBTEST: exec-simple-batch-store-dma-fence
> + * Description: Execute a simple batch store job in dma fence mode
> + *
> + * SUBTEST: exec-spinner-interrupted-lr
> + * Description: Spin in long running mode then get interrupted by a simple
> + *              batch store job in dma fence mode
> + *
> + * SUBTEST: exec-spinner-interrupted-dma-fence
> + * Description: Spin in dma fence mode then get interrupted by a simple
> + *              batch store job in long running mode
> + */
> +static void
> +test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
> +	  unsigned int flags)
> +{
> +	enum engine_execution_mode engine_execution_mode;
> +	enum job_type job_type;
> +
> +	if (flags & FLAG_EXEC_MODE_LR)
> +		engine_execution_mode = EXEC_MODE_LR;
> +	else
> +		engine_execution_mode = EXEC_MODE_DMA_FENCE;
> +
> +	if (flags & FLAG_JOB_TYPE_SIMPLE)
> +		job_type = SIMPLE_BATCH_STORE;
> +	else
> +		job_type = SPINNER_INTERRUPTED;
> +
> +	run_job(fd, hwe, engine_execution_mode, job_type, true);
> +}
> +
> +igt_main
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	const struct section {
> +		const char *name;
> +		unsigned int flags;
> +	} sections[] = {
> +		{ "simple-batch-store-lr", FLAG_JOB_TYPE_SIMPLE | FLAG_EXEC_MODE_LR },
> +		{ "simple-batch-store-dma-fence", FLAG_JOB_TYPE_SIMPLE },
> +		{ "spinner-interrupted-lr", FLAG_EXEC_MODE_LR },
> +		{ "spinner-interrupted-dma-fence", 0 },
> +		{ NULL },
> +	};
> +	int fd;
> +
> +	igt_fixture {
> +		bool supports_faults;
> +		int ret = 0;
> +
> +		fd = drm_open_driver(DRIVER_XE);
> +		ret = xe_supports_faults(fd);
> +		supports_faults = !ret;
> +		igt_require(supports_faults);
> +	}
> +
> +	for (const struct section *s = sections; s->name; s++) {
> +		igt_subtest_f("exec-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> +					test_exec(fd, hwe, s->flags);
> +	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 357db2723..e649466be 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -286,6 +286,7 @@ intel_xe_progs = [
>  	'xe_exec_basic',
>  	'xe_exec_compute_mode',
>  	'xe_exec_fault_mode',
> +	'xe_exec_mix_modes',
>  	'xe_exec_queue_property',
>  	'xe_exec_reset',
>  	'xe_exec_sip',
> -- 
> 2.43.0
> 
