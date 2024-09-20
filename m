Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5E4CF9C5D
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 17:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA4210E2F7;
	Fri, 20 Sep 2024 17:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPhkuH1T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF30110E2F7
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 17:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726853760; x=1758389760;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9e8faTOrFISlTAK9KPHxn7NNrldoRVmYdWzQBw5fFck=;
 b=TPhkuH1T/+2s2bz3xIQYFljuV3efvDHX4X6Dq0vQNieZS+u4MpFG+vOR
 +im2b2FNnQabuNv95/WJrN0+3glI0l40I/wV3XqTjOAw7fVcG2h9YYIO0
 6RnqIFm+4ypY0YNju8h1xCR6rxskh9XoHzNTzZcSsqFUZjhw385aa6OTx
 cU2hZ7N/vIa/ZEO8Rnt/GmmxZCgBbyPhBUwo4/au9v+JM2t47Ht9DHjVh
 9S5ZwHAh9D5TOYIXtEO5dHdGlRcE419is68g6FVJ8vvc8VoBctRru4om5
 zr99YVbwawLq9lF39CjIZAImo3oxAspN/XP11gYC2BFxF1bv5MP7BsG9J Q==;
X-CSE-ConnectionGUID: Q3uYuqRxSdqKQOSiGU2jRQ==
X-CSE-MsgGUID: Y+LhNUXuTQ+o+Rm3egxG9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="29599014"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="29599014"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 10:36:00 -0700
X-CSE-ConnectionGUID: hbuW4DxgT2mkQPOqxWgu8A==
X-CSE-MsgGUID: /4PRsxrMQGaiGO2qoTe85Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="107822113"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 10:35:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 10:35:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 10:35:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 10:35:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 10:35:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkeXa17xGk6uJIMgJXZPhgoadbWDGDF7PF+iyEG6uWWl1Evxc8/asXb9OSdweHV4kjHefhG/v8y8Npyz1EP+jkAiP3ghe8DkmrzaMnd0u+6iVdB2F9Liqy4LZaWtqO70PeIm78et/MyOkJ9BdHFP3mswY7KotNtwewQVbk8VhQ2/HpvmDBjYHurr7uJl5k306ur8bCdjp2JAZpVYdCVPKusfFG1J8wFDKVANuBrsWiW/YaJLJl9FRUDsNO1Ujbze9URvDvtJDi0d5CCJbbMPfN71weOfh+Td07To95noZYzZn6oZK0HucLlG6d6R7I4hV8MzOzaSFo2z01lBk5vC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFtnlRm1hj8bKB5RqVX+Rg8Q1bN9DIWDrNcnZ7S+Hhk=;
 b=Ol7+k/YQJLUfT3vGr4zn3zi0FQ5o1Db8/Onn/mFe4LcVAMaYuyyyw6PaFnpX+rAsoKnq+nFhLOwul9flBWDBNynG+ysnQq/JWcBw9/8MA/h7Nodm+vzgt3QEVStmawz4Lw/b+qzSPoGdiMF29nJG7ynT9TmXfHw9GR07d2u5cQ9WTt4iXoWN2wSBeiUs56oaZNxIfrbu+sPdd5v0Yvj3D9p3irarBnd5fCyEUaxgWYufw/SGg7a9e/4Hc4AyL/5WhSm2uldvCZGfoZmLw4KSdite3dQTxO7J6NpSuO3jmzQM9ukUA+b1rYrN2xIArp7TbYp4LntgTP+zUx2zC7YgvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DS0PR11MB7409.namprd11.prod.outlook.com (2603:10b6:8:153::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Fri, 20 Sep
 2024 17:35:52 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 17:35:52 +0000
Date: Fri, 20 Sep 2024 10:35:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 5/6] tools/intel_reg: Add wrapper for reg access init
Message-ID: <20240920173549.GQ5774@mdroper-desk1.amr.corp.intel.com>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
 <20240918163629.1186314-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240918163629.1186314-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DS0PR11MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: 5184403b-9810-4ad9-8dd2-08dcd99aac43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GrwCuY1snoAUgx3k8f6/uN37Xk5YMlxKmaTldLP++g/TYMUw3KkWsiGt/jmZ?=
 =?us-ascii?Q?mrQ3rtKgnYmJUwTGwRt130+L4kaSQ9LnDHYzVuY44V1PSAVtqp85ilrR+85J?=
 =?us-ascii?Q?G4EEyKHqr/mFApcfCt+DI6lOKKCNZot+2aUj69mThzn4AHu1NU3b/2xnwP9b?=
 =?us-ascii?Q?d6gC/9nGu4NymBnvjko/+wivnk10cmFDtNZWa3VT5HFqS+kaYtOGGYLKfhJX?=
 =?us-ascii?Q?6ApC7mnB/vBF17CpM0MLugNMZJ9G66jKrRvecMY5VDADPVDwOPCjrNGk4zDe?=
 =?us-ascii?Q?d/q6gDqOgrGq/JMHbbv0GoEI0iFcueELlJ3F/7dUm7dGeopU7K+GbAnNs3c3?=
 =?us-ascii?Q?xlKt9r4AAlt+5vinS+yrYQYyRMYc5iGeuzq3XYpfWbg3umiBxXK7tFje6L+c?=
 =?us-ascii?Q?9GiPOUe9ZaS9H8DPA3KxRrrphR79xRyM4Fr8BTJBSS+pefsjYST6niOFtqEJ?=
 =?us-ascii?Q?IVUOcXfH6MT9TXaJ8hPx2sfuYtJkkU12SYkiOaSPc+JEu9eHZcB8l2Zr7Jga?=
 =?us-ascii?Q?Z1i6R0D1bW0A5q7pPMLNSo8Z7oMn1QyR0RXAG/ntJDXQUabC0JyVTbiCua3c?=
 =?us-ascii?Q?jWQhViEy0JvIwTZJ7u5FWe5Zh9MuFil/tl97aOwMo43O+gJEYFAuVsvwxrJ3?=
 =?us-ascii?Q?IzvLRewgo3UO6U6hrGlcxh9BFupLotQPHcvgCr63KDPX3AHR0mPUQeiZAOiU?=
 =?us-ascii?Q?6ZUjSGZ2709E/jgNFKzHvBDn41g23kNyBu1vXcAjT9CoRafD/AzvSJ7Q1QGp?=
 =?us-ascii?Q?MdvgSOpvdbHsobcVLmfl/fy6TZ04TCYivoUKBqBw30XeRuvq/14qZuUshJ+8?=
 =?us-ascii?Q?ROKSGHAT72PzlhjdM1fhwQslUi1bWWCeu8f8WwC9Ak/gXKTr66djx+iWC5Mu?=
 =?us-ascii?Q?ZSNx2afeP/Dq384gPOc8hBw6Zvpvw9NOxOtUfWKcpkgKJl2gKalcR+Ftkj4Y?=
 =?us-ascii?Q?OSoTKnSSo04uE4KpwxMaoE4bE4dbe9eYRTVGXk/5SpKJBk4gS6z3FMcniDnc?=
 =?us-ascii?Q?uRq0QY7toYgIZ8CMTCKuzcSiwzxeIY3dU+nY90ILL8p23NmsL8iHKasK5ylC?=
 =?us-ascii?Q?LjkekPbClw0UCSdDt7i5bsiX+61/b7Iwz8kg+sJ74Sspf02jCSTh9F0u8Z7j?=
 =?us-ascii?Q?v1jBKCxXpi7lROFpTDOml3iXd5kO8szOEpNmkxOYYe76LMFKjl8TROmb8f+O?=
 =?us-ascii?Q?xfSB9DD+Spjmvpgg1B8cIkLo7eTLCBtE+2qXD+FBVN/mlXH++RHbrPmR3uBo?=
 =?us-ascii?Q?kHnfKf+gwLBGvqTYCVFY7rJJdEqFG9MMj1WlE/Fb9w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wtdQaEM/qF23hf+9Opu5ZkxGd6To8UtWzmOZf18OiIwdXpu381Hkt6S6bHoR?=
 =?us-ascii?Q?XZgI4Q4qSvazotcs5ozsGV1zTMaxccjdHk1sQnEQ5qRdZhfazd2vQBF9pgob?=
 =?us-ascii?Q?VkJrwPcEZV8N9J+RolHK0oARmYdwgsqdGsjUoqLpeUV96nz5GJGPSJNHDiR3?=
 =?us-ascii?Q?JRO6Caext8EGkA0ZtugTjydeikUxTc/9Ghg7rEFVxLXk+fm+WaHvFiwvf4hl?=
 =?us-ascii?Q?uJhzCNv+HYvtuNxbWQem8J0SeEVumNTdZyv2Hbvn3jBKEkC/hRP3BqnnIq14?=
 =?us-ascii?Q?Hv28JFXUSWk+ZqfO3Fvt1tke78JccnytyGEpyuAKiIY3ULdHjbJEWT/wgrK/?=
 =?us-ascii?Q?qfpQcMiKWRd9F+Vatc4Op8eemxFiGmlvE0wZ/M69FDIuubVxE1bh0j7EWF/X?=
 =?us-ascii?Q?gJPiWwNDjSsTu427hcCDU85xN1gm9AOM9R8CnAP41AZiEOjBx6m+5+BGqKd4?=
 =?us-ascii?Q?w197mn0c83bQKRx5oGwYZPoDXg4LjS+LX+gHYASi1Z2d792Q87XU+E4yKpEZ?=
 =?us-ascii?Q?/tm6B1s49hZSi3hx6U2nAwdLA9kUgFIH2hw6KTxIyM/zO8eslsRnszeowaE3?=
 =?us-ascii?Q?WYn6aTb/9tE1qBnYiPNKETXugG4uwi9RSQ67haLGEhnsu3jLGVrAju8pagcg?=
 =?us-ascii?Q?8K665pXcJR0NFC1RZDJ3suVg1LFrfkk/jjES7Yvc+pYNkUn13VANh7Pdjqqs?=
 =?us-ascii?Q?fM4sO8bLpR/8svZ2vMlyL6b01V65rcpaAsUUEQrvFWseC5W0PAb7sGeu/myU?=
 =?us-ascii?Q?w54eZHUHiFZApUJ7NkokzNGtzCY6AI0RAMxlnE3iiESWwGdaiCN43QyNK0lG?=
 =?us-ascii?Q?Hlxj9SXGwaW+rgJDFs0Cfm1vmQsPmFBW6F01iOdFM5ndScpkz+TCQVmT63aR?=
 =?us-ascii?Q?LgKNIEE3LKEehvhw68t2sO5AvK7SlXAb1St412K/brA6wZmBQ3CAS4iTuhqR?=
 =?us-ascii?Q?jxbiL2lk0IZAdzSRwSbuSHi96ah2Nop58jobzikKXdf+P0iG/vlL3KNDKbtU?=
 =?us-ascii?Q?U9ZCHYYvm2xGWPD1X0nHLdwa+4DtsUzw/nnYoYsON059tFZPEmd5AFS/rJCq?=
 =?us-ascii?Q?51nhDpuBWxCz1XUs0VyNbY2VHxayyQ5ePamH5AWhsHx1BLHQOUP9XpiRF94e?=
 =?us-ascii?Q?2uyixoDismdHpKwwwvvftYI/Z2Dqh2gycGnUiJxFrrUGlggFQjN+L4oFq++U?=
 =?us-ascii?Q?ZGQTqX5v5SCahUHwnDhWLITtoO/3300KeT9FniGQnJtSjLSI9eGyFX8Ejneu?=
 =?us-ascii?Q?0o1GrLNJf3Ic6Tg2iFCWnKe+libSRVyWABExxDGR9OD+4RWQrrn72abNSv0U?=
 =?us-ascii?Q?VIQQvRAwjarJo1qgaDeCHXTm9XmjfU/oYk6GJskbaER0qniznPcrXPh/ybHy?=
 =?us-ascii?Q?EGn6MW2gA/1hd9eTCl5I0Pl0+PY/1w0V+h0lb+l1a+Yor846qPfeDhXSFD8t?=
 =?us-ascii?Q?vNS0Bv88Z9YyQjVnfbKK41irA00NqIBowlPK1T8QgAifN+0jckrzq+cIfJBw?=
 =?us-ascii?Q?xa+hWixJugBhVF+NiX72iLiprh4oKrAlFK5vf0cGmKJZkjFoYKPOpT/YexBq?=
 =?us-ascii?Q?Q/D4CHXpTuwIREgzRXc68TQRAzyIrp4DD8oJ/87WmemBFX8s2XpmLDH1CWVa?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5184403b-9810-4ad9-8dd2-08dcd99aac43
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 17:35:51.9601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lV9pXs3DPdpIAimWMwyVjF3DWej0kb8ohBFB6xOzIv8ZRJbvlBa2kkS+AmMNFVQP3jrj5/FBw4rUjdn1UrY8qWATzRNSjFSvwvfJ7mie7sM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7409
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

On Wed, Sep 18, 2024 at 09:36:28AM -0700, Lucas De Marchi wrote:
> Extract helper function so it can be extended to xe.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tools/intel_reg.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> index c5800cf05..906ae9b84 100644
> --- a/tools/intel_reg.c
> +++ b/tools/intel_reg.c
> @@ -800,6 +800,11 @@ static int parse_reg(struct config *config, struct reg *reg, const char *s)
>  	return ret;
>  }
>  
> +static int register_access_init(struct config *config)
> +{
> +	return intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
> +}
> +
>  /* XXX: add support for register ranges, maybe REGISTER..REGISTER */
>  static int intel_reg_read(struct config *config, int argc, char *argv[])
>  {
> @@ -812,8 +817,8 @@ static int intel_reg_read(struct config *config, int argc, char *argv[])
>  
>  	if (config->mmiofile)
>  		intel_mmio_use_dump_file(&config->mmio_data, config->mmiofile);
> -	else
> -		intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
> +	else if (register_access_init(config) < 0)
> +		return EXIT_FAILURE;

The new EXIT_FAILURE returns are still impossible until the next patch,
right?  It doesn't look like intel_register_access_init() can ever fail.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  
>  	for (i = 1; i < argc; i++) {
>  		struct reg reg;
> @@ -843,7 +848,9 @@ static int intel_reg_write(struct config *config, int argc, char *argv[])
>  		return EXIT_FAILURE;
>  	}
>  
> -	intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
> +
> +	if (register_access_init(config) < 0)
> +		return EXIT_FAILURE;
>  
>  	for (i = 1; i < argc; i += 2) {
>  		struct reg reg;
> @@ -880,8 +887,8 @@ static int intel_reg_dump(struct config *config, int argc, char *argv[])
>  
>  	if (config->mmiofile)
>  		intel_mmio_use_dump_file(&config->mmio_data, config->mmiofile);
> -	else
> -		intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
> +	else if (register_access_init(config) < 0)
> +		return EXIT_FAILURE;
>  
>  	for (i = 0; i < config->regcount; i++) {
>  		reg = &config->regs[i];
> -- 
> 2.46.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
