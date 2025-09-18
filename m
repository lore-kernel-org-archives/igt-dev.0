Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0F9CAC597
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 19:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FC610E8EF;
	Thu, 18 Sep 2025 19:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPkrNRf9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4053010E8EE
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 19:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758223070; x=1789759070;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6kqOJqSSlWDZxRVmA4zxoX19SqeuP2ovS4XFBdjLlAs=;
 b=QPkrNRf9xLepx7hNjYnT54Ymz2xrF9G1tx98mNCTw8HQAN+hyuXgKZV4
 ff+ZxNJ5mUjA74BUtO00ZoZW+LUiyzC76gBsWDawQUsCUJpFO4eA78UmW
 OivXwx5ZdWcoeVbelTiDZGOeCVenYBzJfMvA/Ct+MN1JGo7XgrI2arxyd
 3v0mtCtMOc/6b4fOCi4mjBO4nS+QKY4heaUKK8u+5O0UVR1Fv9ApmYEk1
 UCLtu/3XwT+w6pAkfIk3x2+6oJwoN6ImMEwzFtypmJQ4hzvPNzfjAkWqN
 PfGtMDm421cqjEL6Z5ZBejJM+vyLF7LYp9dhmcvLgzHFhlnQhAiW0zMzu Q==;
X-CSE-ConnectionGUID: AVwEZGmGSXGR9IJGXIHPXg==
X-CSE-MsgGUID: UYyaoH+kQduhiahrRlWGNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71677798"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="71677798"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 12:17:50 -0700
X-CSE-ConnectionGUID: MfcXWAG8QJeSAVlyM870pA==
X-CSE-MsgGUID: 8aJawRjrR5K218lLJ7DY9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="175697569"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 12:17:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 12:17:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 12:17:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 12:17:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2e9Unw1pm430Y6mMyhC78Y/AsBg36EwiRGH6N8J6pmtFgBBhO+6Rg2CEaxBl+G9grExhFqTBlK/hlM/rkEpnDfDHX9QdedHncQ3tXxaKWYSN3WLycK1shZRHiR5UHiqCbxGTdOjkrgjjAANsQpe5H9suGK+z1rRdCG7klavFXR1TjBwA95P9IAY4XoU1iizDklJswPXoLqb95RkNqUVkcF3p2xVzEoziCoQ1i5LKy2iZ6ZhgSqPjWCTVEUwG4AgglNZmPMZSzJdMrOkCm369LwE77+ePXI7kIexLtOKjZe5/kniD9JodJdooB3QZ7F0cGIu9VYnTM22XOuOz9rCCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okD1lepmRp3wQh/9qEdCLoKNyeHMxvOgZTdIP8fnUxQ=;
 b=V81XKYdyT9yZzJrKru5nBEZf8eKGu3aVMJBTvpDhzais9q69+06rb7IbD2Cv8UEgUOSynS08hnNxSZSHh2WhwNjJ4X0gyq5o2KLV9wCD82VNcTK49J3jAGPHPF5K7k6d4jtWSOk2RUsxUlXSgD0KyU9BxyHG4RwWRNv7fKLLzc6N/Cf9ltkUc0iuzU77Y1mHE14EiZWVyMOdjJvuzwoARE52QUBTrSCZ7E5H4+RwoBvdyU13nsKqQlFw3OVooRiUusWWjD5N5E4EluRm15ASZcmd9iJMNJe/JKOYU7rclEfHJgvmsdKn0AmRP59LpbBFcVZBaw9MwERnc7iT9wR8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7747.namprd11.prod.outlook.com (2603:10b6:930:91::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 19:17:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 19:17:44 +0000
Date: Thu, 18 Sep 2025 15:17:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_configfs: Check ctx_restore_post_bb
Message-ID: <aMxa1aehmuAqberU@intel.com>
References: <20250906055220.803070-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250906055220.803070-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0195.namprd05.prod.outlook.com
 (2603:10b6:a03:330::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 26fe48d3-0c15-472b-6cbc-08ddf6e80ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tkScEv1Y1TGBIx3FgnjVDtegFm1VDCVcg9sT+pBhXYfGPemfW9dTBvdbsK1l?=
 =?us-ascii?Q?NsSdJPJw2rf5D1Wrz07d/CIVHc8GrMkZcp5ppUP4bXL80KzCwQqOmY0fytV+?=
 =?us-ascii?Q?a4BYPTEh9/mfHuQqmLV/ojKweI0Gvq+UjmMRqUYpEryO4NqgLqn2s18zIkgE?=
 =?us-ascii?Q?Qhmkzt04+ZuDsKUWYsrUb1ZvIT5xPiaHrdRGCGYr+YCJvHigEN4s786kwfv4?=
 =?us-ascii?Q?97y+wp+8uqV92cx6/gd1NGhhF9htMzbjDaTPwrTm0RL43Mhde63YIKcZMESX?=
 =?us-ascii?Q?iMDCLnSRemTESw1NDH+T3ADkXjqIjcpMGaAUUEMpvjbRvQao76+nsZBb3CnW?=
 =?us-ascii?Q?bHP0SEUXk/+7V+RXcG3iWRqfVsnoVSOnaTdXLkYSqfLnC2w6f+R5n6jo5TYU?=
 =?us-ascii?Q?fUSkqQ0C2EqkvRbQjimlv6k5WQ6yvtDUE8C58Xb6ORlGa6tIR+gl9azxcl6F?=
 =?us-ascii?Q?KoS67aRWlSt47GWpMoUWo/3X15++IqLPa132rQMSEtQxIQYvXs/p6D/YakcH?=
 =?us-ascii?Q?eTSPZFpumkp8kNQE2ZqzT/SM7Cupr137MQzTmmJ4C89Yk8X4M25WhL+I60H2?=
 =?us-ascii?Q?T+SPotCJ4gmWuJKM00qBfLwOCNbhoVJZSJxB+M1A8LtmFoJNSiOGfkymtRiW?=
 =?us-ascii?Q?OGCADKMK2MZPDbswGMweSb88Q88LAqpzA/7CNaw3DHuqu9IoCZoAX37JtbTm?=
 =?us-ascii?Q?iRkHyy0ESuEqGBYB4aZHXG6CQYkurVMX7vFlBQNKQ93VUbjVjYId6nY+q+iN?=
 =?us-ascii?Q?kqKissTlT5dl9+mCbZ0TYneXpk7dfITMd3mCwbhoPVDNnT5WyQtpT7fZNtK/?=
 =?us-ascii?Q?cYoUDlpvLResPTxTzBixkxpmmHVAvZD1xVdXaWPPCpjfznCKwAeJhgT7/D1X?=
 =?us-ascii?Q?EZqEqK3BAa++7HtOh5gpi1Rw2Vho2MmPdUpjm2yKV3/f0TFsH+WG5zTdgR0o?=
 =?us-ascii?Q?gf9yLMUtuRzOr1S1RYuytY4+MTycR0AyVjTVuA2uDikvHuF6Duliv53OGjbh?=
 =?us-ascii?Q?46eyk40oAsu3M3FrjjujPHTRVjea96zf6BUeLvpI/DQIIRPVTi/DEt9GgM7t?=
 =?us-ascii?Q?g0FLGpeJJNqt2Fred7tfrjaxZ+J266NwiYil8kYsrvaiAX1J3gYFD7srNo3B?=
 =?us-ascii?Q?pwq4pS33xytR4KB4lsQabB3YcmI4Xy8sVnFnk+ixN+bPqYi0LfW99g1B2LRk?=
 =?us-ascii?Q?m7EUJ8ARk40YK8yr/ndWDu45lwSKmayjJ7pVMRJJPv9k3vYbYSDjFLJIh86m?=
 =?us-ascii?Q?Vn5NYv2Qz1tdKycctN4FDJ6aWL68L71iDkaA35OsBhZ2NQKJAZf2p3/6t/At?=
 =?us-ascii?Q?gL0JR9eqEFHqnTmASsXUDO3ZMP0RjzmBEecEbb3ij28xI88RQwxVeIPAwr/4?=
 =?us-ascii?Q?NhNyj4OT0K/5v//8IQ+ijcSWYUTP4bYvNSKfJscYtZpi5yoV0s7m3ARutBVf?=
 =?us-ascii?Q?aTEjr3ULSL4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bLL+WtIFdAahLX1NwiotaFKNoZ5UsId6CLzdb3uMn87d6PxB6EW0FYVZ7mdF?=
 =?us-ascii?Q?MqML5UuPvP4O6iqopO4eiWrPwthtrYIHAYQqiZc/44eEj4+fPQUs4bA6z0ZR?=
 =?us-ascii?Q?E7jN9VL/9/HKwhYpyOmoB1tYGwZKOJaAbjhHz6pr+Q6Gx4MnPPSilSwjaAR8?=
 =?us-ascii?Q?YczionSDTI835UkZr93KYlxAPWXWbPJG2clnBsTvqXW61usqDy5ilqhbIVUy?=
 =?us-ascii?Q?pdrizGUwQFWvLy7jVfSU6BrthwY2ASVB9Xr1Bo4LK2PpsOEfQ9pwh0FR/P89?=
 =?us-ascii?Q?Su8f1l+ukiSAGlePGYVoFRL0jURmKCSBhcheN9QXOuOUmzTTqYPwJ/Ak4Og3?=
 =?us-ascii?Q?OLZSn2Jvhs3ZlLJFUXXpeEw+vxPtFmJt1VBB4/HDrZaBlwLSJYwVytO1u1/x?=
 =?us-ascii?Q?t/kNGZEwObtqI8oFdiJslSFewaK/kQQ5XU6o4TAGuTtMrTbyabGK8IKwu+D0?=
 =?us-ascii?Q?MKA7EBdgVhlW/a6JUn4GfmFFjNIufQJxFuTrlUrSMDurlL+pRZu+4eJWYPgE?=
 =?us-ascii?Q?kP3MON0Ll6JfNRsHfOPTVDcFC6+sdKmtVTa03EVU0odOLtoX4Y88jJuZaxqR?=
 =?us-ascii?Q?UXt56LerlWlVw9mYssR2IjyzgYz1WWmI8foNckheSGoKYPHJ0S2oEo7R3lga?=
 =?us-ascii?Q?yCqbWLq3qDcWSxPO5FnKqCHn3ZKopjz1uJdt3MOMQ/h29C/FDykFioe2GRF0?=
 =?us-ascii?Q?8Z1/RznL6hXRdKTKVtJoL00netUM/RT+tM8cAEZfY2FSvzezR945VkLDxRsO?=
 =?us-ascii?Q?ouwTKbUrtLXabKw6ct7erz7yuc5ujvXr1ZiFnM63Ush3OOh4i8zGEBM8uYMU?=
 =?us-ascii?Q?50Dh8tXh8RZkaDlY8ETOAu3uE6Sdmak4UXgdpoVTh9meFj189kaUzJ6eqMEB?=
 =?us-ascii?Q?WLVpboakjjUrWOy0UInH7BrlfT5fe9AECWsKPdtTqCON7tW+RekjSffoMk3i?=
 =?us-ascii?Q?t1UfvKWUb31fAV4wlJrbuvySZcAA9SjWvA3I8vs9WYhxajHQcdgJOKVPhYmC?=
 =?us-ascii?Q?1obhiF42SMhQ9ezUWfKGcqGVehNjYRsUpdWp37vj2MwgE8+U9m1OGRdrzZKp?=
 =?us-ascii?Q?yp8bnvd8Fvm8tCRZ2WUO3xHIkmASCEG3CvH0v2Lvm9yA/wlE2mXrF8JNzH0G?=
 =?us-ascii?Q?WLGhIdNzTeIjZQs1a5Y8+4ijO1sUO3vJxvpRR2nZSk5yl15ZwRQ9jbj84rwE?=
 =?us-ascii?Q?88xYh9yHbdg+A4X2faPMq8K5PT5ibhAvAK+NxqSkuSkugT+VmsyV5zISAcJr?=
 =?us-ascii?Q?sxITsNzCakY/PGrxdUbYNFdFk7H2l6down5Og7PNbIwbwjFWcDmkqQ+fldtS?=
 =?us-ascii?Q?K/SnLkPKBGP0urneiWdSGWzvLXCbyJGE+lmRMaBUls1N4t2sect8d9IhXMGo?=
 =?us-ascii?Q?kRmzWd2kPpRWCKXRUF8r9NOnAK6WweXTzoleowqat9TW/jCzgxNaqv6fk/hP?=
 =?us-ascii?Q?wqesDy5jeIn6V1i9ytInYL7FHzwLn7+UcwDsIE4NjYu7J+BplaMha6Y7OKep?=
 =?us-ascii?Q?jcl6Odkjr/+PNqLDAyZqOK22R/JGWtcySRmeZ+6axnKNkJ4ApLEGu+ClHakB?=
 =?us-ascii?Q?fF3dP6uWEIFqWpa08zRHgcC9vz0SF7UAVajxpVNsxt6Nr1oAO+45YF2POhBy?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fe48d3-0c15-472b-6cbc-08ddf6e80ba6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 19:17:44.7564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2c3rEnFrIXd0QeXhjjyvffDLS4OA5e51WE2QYlu1O3hu8d96S5ZXb1ji6Z1qDGYo0dtJs2jVncIZMGL7t97qrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7747
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

On Fri, Sep 05, 2025 at 10:52:21PM -0700, Lucas De Marchi wrote:
> Add sanity checks for the values possibly written to
> ctx_restore_post_bb, according to pending patch series:
> https://lore.kernel.org/intel-xe/20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com/
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_configfs.c | 113 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 113 insertions(+)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 086f99ba5..d778065f3 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -122,6 +122,111 @@ static void test_engines_allowed(int configfs_device_fd)
>  	}
>  }
>  
> +/**
> + * SUBTEST: ctx-restore-post-bb-invalid
> + * Description: Validate ctx_restore_post_bb attribute for invalid values
> + */
> +static void test_ctx_restore_post_bb_invalid(int configfs_device_fd)
> +{
> +	static const struct value {
> +		const char *test;
> +		const char *in;
> +		const char *out;

you don't need the out here right?
or do you have plans to move the declaration out of the function?

> +	} values[] = {
> +		{ .test = "invalid-engine",
> +		  .in = "foobar cmd 11000001 4F100 DEADBEEF",
> +		},
> +		{ .test = "invalid-type",
> +		  .in = "rcs 11000001 4F100 DEADBEEF",
> +		},
> +		{ .test = "invalid-number",
> +		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
> +		},
> +		{ .test = "invalid-number",
> +		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
> +		},
> +		{ .test = "invalid-reg-addr-only",
> +		  .in = "rcs reg 4F100",
> +		},
> +	};
> +
> +	/*
> +	 * These only test if command parsing is correct,
> +	 * so just make sure there's no device bound
> +	 */
> +	igt_kmod_unbind("xe", bus_addr);
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
> +		const struct value *v = &values[i];
> +
> +		igt_info("%s\n", v->test);
> +		igt_debug("Test '%s' to ctx_restore_post_bb\n", v->in);
> +		igt_assert(!igt_sysfs_set(configfs_device_fd,
> +					  "ctx_restore_post_bb", v->in));

worth binding the driver and reading the mmio register with intel_reg
and comparing with set value?

> +	}
> +}
> +
> +/**
> + * SUBTEST: ctx-restore-post-bb
> + * Description: Validate ctx_restore_post_bb attribute
> + */
> +static void test_ctx_restore_post_bb(int configfs_device_fd)
> +{
> +	static const struct value {
> +		const char *test;
> +		const char *in;
> +		const char *out;
> +	} values[] = {
> +		{ .test = "cmd-single",
> +		  .in = "rcs cmd 11000001 4F100 DEADBEEF",
> +		  .out = "rcs: 11000001 0004f100 deadbeef\n",
> +		},
> +		{ .test = "cmd-single-multi-values",
> +		  .in = "rcs cmd 11000003 4F100 DEADBEEF 4F104 DEADBEEF",
> +		  .out = "rcs: 11000003 0004f100 deadbeef 0004f104 deadbeef\n",
> +		},
> +		{ .test = "cmd-multi",
> +		  .in = "rcs cmd 11000001 4F100 DEADBEEF\n"
> +			"rcs cmd 11000001 4F104 FFFFFFFF",
> +		  .out = "rcs: 11000001 0004f100 deadbeef 11000001 0004f104 ffffffff\n",
> +		},
> +		{ .test = "reg-single",
> +		  .in = "rcs reg 4F100 DEADBEEF",
> +		  .out = "rcs: 11000001 0004f100 deadbeef\n",
> +		},
> +		{ .test = "reg-multi",
> +		  .in = "rcs reg 4F100 DEADBEEF\n"
> +			"rcs reg 4F104 FFFFFFFF",
> +		  .out = "rcs: 11000001 0004f100 deadbeef 11000001 0004f104 ffffffff\n",
> +		},
> +	};
> +	char buf[4096] = { };
> +
> +	/*
> +	 * These only test if command parsing is correct,
> +	 * so just make sure there's no device bound
> +	 */
> +	igt_kmod_unbind("xe", bus_addr);
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
> +		const struct value *v = &values[i];
> +
> +		igt_info("%s\n", v->test);
> +		igt_debug("Test '%s' to ctx_restore_post_bb\n", v->in);
> +		igt_assert(igt_sysfs_set(configfs_device_fd,
> +					 "ctx_restore_post_bb", v->in));
> +
> +		if (v->out) {
> +			igt_assert(igt_sysfs_read(configfs_device_fd, "ctx_restore_post_bb", buf,
> +						  sizeof(buf) - 1));
> +			if (strcmp(v->out, buf)) {
> +				igt_debug("Expecting '%s' but found '%s'", v->out, buf);
> +				igt_fail(IGT_EXIT_FAILURE);
> +			}
> +		}
> +	}
> +}
> +
>  static void set_bus_addr(int fd)
>  {
>  	struct pci_device *pci_dev;
> @@ -173,6 +278,14 @@ igt_main
>  	igt_subtest("engines-allowed")
>  		test_engines_allowed(configfs_device_fd);
>  
> +	igt_describe("Validate ctx_restore_post_bb with invalid options");
> +	igt_subtest("ctx-restore-post-bb-invalid")
> +		test_ctx_restore_post_bb_invalid(configfs_device_fd);
> +
> +	igt_describe("Validate ctx_restore_post_bb");
> +	igt_subtest("ctx-restore-post-bb")
> +		test_ctx_restore_post_bb(configfs_device_fd);
> +
>  	igt_fixture {
>  		close(configfs_device_fd);
>  		close(configfs_fd);
> -- 
> 2.50.1
> 
