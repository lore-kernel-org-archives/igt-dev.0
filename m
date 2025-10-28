Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADDECCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 13:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B8410E3F3;
	Tue, 28 Oct 2025 13:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5H/gmp0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FB710E3F3
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 13:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761659627; x=1793195627;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7m52grlb9dRS0pOLTGB+aZCrEVg8qy8fUEOaAsuDuHs=;
 b=E5H/gmp0/hPfEPaUkb2Tur/GvPLQNP/E6BMx5i2G0nf+JXz2D3cmazRY
 I6KKQT8HqJ1Qhkh1qVZjUhuPLydqz4SVIXUuHl2sw3YJKh2U1sD+ngMQ+
 YgcaWIVAorb4OSJWCEmmLdDGropMrxdrYY2kCKRWWfGHcCLhko54GO8L6
 TyJVi8yMuPHixdb3RBaoko5sYXpAJsDpiQh7222iqC68If8LQ9LOvhNAc
 8e5sZxO+Jah4DWnVAx0Wdgf7CDXJpevz1f8JZXue1PHlJTppVXytZakis
 qvfTGa/pIFGOpKAZZD6Eban1933jdI/n0RN62m8VjVo3U71efJ8oAXv9c A==;
X-CSE-ConnectionGUID: 3uMSs+yJT5WSsFve2IxswA==
X-CSE-MsgGUID: /fKp71WUQmapvp4tTPE4eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63461843"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63461843"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 06:53:46 -0700
X-CSE-ConnectionGUID: aqMklzPOR5Oleq0zxxTnFQ==
X-CSE-MsgGUID: 6NhPeHXlQyy9GppyDg9WnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184530314"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 06:53:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 06:53:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 06:53:45 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 06:53:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOQbDQZbPn8g4CzmU2MVjWnvY7m+525lJQJMPs27EUKTffdhAw71XUFUKyL+szxKO62JKAltt+658FbVsRbi0LwnP2mfsqhwOXmwj80KLVVvf9Md8ubd6UONWtGI+W3PkiOF1/44KzmPmENbec245Bid0NPgU/Lz/2IyM38tPmnxCwRH7jKySblj+uYlSw4g4mnEiftcFK084vDMo5msh9qr7oVqMPiIq3F5x+1ulVc8mW6UUCgAJN6TEn97IrGQqneSjLbN8Q4AGcg3HMYEVSNGInFUGbZ/WI4ot2F8+wp18Z7IobWJEGXItkKq2KWoefbO/Mm+7X0/RC0ntJ5itg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U79Mrh131s4rK+aecdirYZha9yI213oCI+9h2VAbGVw=;
 b=mADuEFRzKtigRsKbw7SZE45J8ixRJ8F405tTLVSOHlhMmVqCyygm5uJ2Yxxs4e/DD/Qe3Fr6z8iJn3h6lykRxZ/JM0tuqVBD1IzB/r9uXy5WssSURCBwSoVBMcEEW2COx1mrre2XivoixzSP1305pcxj9SQ+zWYq/PpQY5jqNRNyvS0Jiu88iOrSTqIDQcBA3nIov88uOI+zYdLiGUI39miMiCLIEa38CG5TMz02z1JNc6aYPSDUHZmNaY91agPrBBTpim77Od9lve+1dotpDgDRemlDO9RmwvgnoWARpTL4CoYAdT+wKpErnUzV4m8SR1NHOM5wPi7u0duVl74i/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8092.namprd11.prod.outlook.com (2603:10b6:8:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 13:53:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 13:53:41 +0000
Date: Tue, 28 Oct 2025 08:53:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] lib/pciids: Add NVL-S and split out BMG-G21
Message-ID: <4uubshfhdvnc2nxat3mwjoc5x3ayubtitzk534ks2ysb4mlrkd@gfzff2dbt43g>
References: <20251028104234.14745-1-kamil.konieczny@linux.intel.com>
 <20251028104234.14745-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251028104234.14745-2-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: BY5PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: c235ec47-40da-4f3a-554b-08de16296734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ApJqdKh9tDrD0OO0uj3EjpTEs4z1mc7BeyYnD/CP29qkVglaTKgvuIV5Qqsr?=
 =?us-ascii?Q?DKnwSC85uasS1abqKSjnDQ6ckYHniR6En1+PzwpX/BHx1EYCTDNdm3C+NjGp?=
 =?us-ascii?Q?2Xm5D6a7Wmj+Sda+qSx/QVjAYCDPAN2GlUGTv8DSGE6lWGfG+Tg96dOQK7zO?=
 =?us-ascii?Q?jeVUw8uBVDT1xLmzu8wU+Op8M6TyGyVn2xjVyAyG4RNei37czGMGBwGT90vD?=
 =?us-ascii?Q?v4zBgUzC9pqSINNeidJO0OBBBjxe0NWTLmY0mcI8QrsbwJmvwxn2UEfUP1Gh?=
 =?us-ascii?Q?eDEn0ZW+UqoPzHLlwmxidtJjvER8bctI3mfI7gYxU/BNcixuJVS+x7LfvCPl?=
 =?us-ascii?Q?QNB38nOqX/TY5WOQ2rqTgBniWfLM8yhpJoCL9iejcxjE78tVUHNbAzEJl2gd?=
 =?us-ascii?Q?L2wXT86GdPof+RFFHj2q0/kFJmI1H6ARn9XyqjSFRMqEMfPaB15b9sGteUcH?=
 =?us-ascii?Q?ga3UB6qzRmy/tkYddcxbafJbYPc7Yk5QDJ8DlA/SwNJGr2bbczsP8IfsecFN?=
 =?us-ascii?Q?+Dpn0jmYQyIPJ8LpNlsmNpqvVVAnJMlIPz5wzMzzkjcql/CwgdkikNT/+fkU?=
 =?us-ascii?Q?fc/B3rFQwynUakOe4g35VwhgCaaHrI0W5cQbniBhsmbSTVysqImmQPlPxzGY?=
 =?us-ascii?Q?xMWttlf097J3217pGlszu4xkUN3gm1ZVX0b/RtyCFJGiHzGJsf2D0QGy/nAI?=
 =?us-ascii?Q?BH/YdKMsYxzq31ONtKuAl01oygxqq7NgDJXnvhwfOTm7H4jHtZqugc9kfrtY?=
 =?us-ascii?Q?XX/7j29AYPO3/kOI1gbLcnkRZOZe1GDuX5jDsh4Hr58de8fiy4G0L9IRbzea?=
 =?us-ascii?Q?C7NAMYNeSd46CHh4e1FNMdtSJofhfsdEgVhwfBJJn4M3zbx4K2mep7rn/nq/?=
 =?us-ascii?Q?msc/Tx8GWq98zeVTiWX8HchCqN5sORPApnv0wn/nvppsUTdUWVXR1+5BaCGV?=
 =?us-ascii?Q?Hyfu4jH5kIwGH0qP5xYY/RE/ot79jLsSqPzqkq82IxQOp8pLDIVhBe5iKYAc?=
 =?us-ascii?Q?ZGXcLDV2kAuzj34bM/ZA63hN1ZtmUeW6ABsBa03bWuT+PYZa7/z3D5wboFB0?=
 =?us-ascii?Q?RiegtpK2dig1dgGMDnSv8Mfwf35Ggi0RHnrQRxodt3MIVqHVMrsTwGt0Xd1g?=
 =?us-ascii?Q?JOTc+t668VBuOFPy2ek5F9UBUbE7QUMywtlRYcwIOUXp0EdewCSYvmZoF6hs?=
 =?us-ascii?Q?QnwMcuO030DYqSeyp+GsCWlUN8ZXvn/HqSRGxEzJYWnRpgEE44hJZAd2f07M?=
 =?us-ascii?Q?AMVx82Dc8grLf1MV14fHo6iDU/1WGlyr/e2kE3n1QXxCo+AmH9sm837/BbcE?=
 =?us-ascii?Q?e5iBH7OdQNfjwe0T+SSdaqus56UjaTpsyLdRsFp2AnfvnO7j9EAjhLw9EhgC?=
 =?us-ascii?Q?DpU6pMMB13bTKwj6GKGmpVmK8Ht+8AEqVNU0Q86o/GkcJNL6a64TBxrmjJmW?=
 =?us-ascii?Q?WSBY3gdOQVcteuXJitgGcNfg1MavmFlHd0j3ACWkWzd8odFtU6EuzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DVrADqG3wRK5Z3O0jvaiZWfEi3DP6x9d7hI1CIenh6nhIUagnuPZGECbv11K?=
 =?us-ascii?Q?NRgRcmE/wdpr8zPJeHXlXkjPbVW2fgzwdy8x1u+cUqfxjE9Xh91Pcu/c3aMS?=
 =?us-ascii?Q?E8TtLdOGqNvxOEQdvJMDvoC3NBPq8NlPYhHTooZENgBieNXlT5tivabZABFy?=
 =?us-ascii?Q?Pf3+xL4UTMiBkoL1mc84YWQY08UdGfKj0CMg68qaObZgvflnHsr/incf9hKk?=
 =?us-ascii?Q?SPtHAIfb0N/xSjTJEZiTNqkRMUsKr+uMvAMKt2OahRq20+9bi9FoCkAsnAC7?=
 =?us-ascii?Q?RCPsIniOwZM/RbQiXEPh7YNE2+tTqXsOIw7E6tfxxZO6xGQi14nVBrV/pXea?=
 =?us-ascii?Q?DkRVq4HTYM+RIzH/Xy3xFOr/hugSyrKUTYbufjHFtItzCMF+lcbnY/lLh5Bw?=
 =?us-ascii?Q?FTOoirXVhq2TPl/bANKwiM9pbKdoxd7DqXWvckBXaKpmxjgsv0mnsLwotlfW?=
 =?us-ascii?Q?/R7VkBrmR6IfU9saCm2BApothr6NhCX/plYi2jUDR+EUFTqSRVjryxkUSdmE?=
 =?us-ascii?Q?ayKrnntN984neqPt0xgNG1vqapxCk54UFon9e5Jr+pWWB7H38sQZm/3zW3ic?=
 =?us-ascii?Q?LibH1k3S6+xAST8CoE+aI19Eq/qXVrOHbgf2PoPVqrapE5hSpGVnA21PqxNh?=
 =?us-ascii?Q?6agj9Uv26QlScz/7U+SNJaah1Qk57OAx4M2fW93InYiDX6xHM7b+EOmiqmeQ?=
 =?us-ascii?Q?BeZN0cAunRWVd1sHK9XNYgXNzaObwWYQzLYVxK0+lDFIqOoA5Me3e1uGmNWM?=
 =?us-ascii?Q?OVNMECf67L+4WKsKkIbdlSYOSf7FLAAvjOyHJBW7LLdQJ+v7Z9fxUhqcKDZY?=
 =?us-ascii?Q?RIvliHazuzhgtWqS9OY0sjI/5loUHlt23TcdaNzjWdInfhbPWfOFAZrR9s40?=
 =?us-ascii?Q?s66ki7XpDsGTCk8x3DlV+Wlcgl6egWQuweVupPBMeMYHuHPFbu27elbdhZn1?=
 =?us-ascii?Q?MvnMqhC6ZqUzxMvAc4y+L/SZTpDq3z2yXjMMH0Zxbzc+VADjzd+ONkX65bXw?=
 =?us-ascii?Q?FCqjHMfonJA1YfSMAQYatt9+oPmHlji65kWuGYQEsaV0ymZAXRGdKioyvNUA?=
 =?us-ascii?Q?QgpakZU1URCG/29iTEtZkkj7A6S+F33+4DAk013fKWbIoROYGsmW5dN/hHNs?=
 =?us-ascii?Q?ZPFMKbHbdfpncN6o8AhT5+m+0oP2NNL1anc3Rh+/dbqxWw9N8kSucXt35qE+?=
 =?us-ascii?Q?ef/fCV4otxB+YroIWGmNC89oLOQ761Yxj6oq2VJwZqpHGAbIUb24ck4UoNuN?=
 =?us-ascii?Q?J/DJF64dr18/o7i0DwGyPmw6M/hw6JUsBCyMCLQetYIdzZdnPmDLyXjrrIB+?=
 =?us-ascii?Q?UCttaPDNo0jS3nVP4zXAyT1AfoRqBSzergOv/Kya5otH63crjIqjhjZ7yHM5?=
 =?us-ascii?Q?tWgeRq2ziGnzdOLXafR//vBEjgwLZkIZnmEM2S16Hmm1wr0T8AHr7kX23Xoe?=
 =?us-ascii?Q?xQr4lpLYiY74u0m2fqi76tJd65mydwsK9N00UGRXIBzXuwf+k0CtmYJnevLT?=
 =?us-ascii?Q?TOc6rbsdbZlKxMqAB3QtQIVFyaOI0eaG3HQTuvCwgCP4vTyVZeSxcckE6U/6?=
 =?us-ascii?Q?SPb30pWU19/SRbkZkZ45O0f+e15XzsTPONg6XS7D4Y5ZJUfYK7U4ExRvw0gt?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c235ec47-40da-4f3a-554b-08de16296734
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 13:53:41.5879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 951MoRXey0mOaYxA6ZySbau0mbbb9rImyzTqt6aA/WpJZGRcfe5Q1z8hmtntaGQSDA5Hg/uNA6iKwfN0WxFb59YesFqe2s+02b5Fk+trGrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8092
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

On Tue, Oct 28, 2025 at 11:42:34AM +0100, Kamil Konieczny wrote:
>Sync with drm-next kernel commit c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
>Link: https://lore.kernel.org/r/20251016-xe3p-v3-11-3dd173a3097a@intel.com
>
>This adds NovaLake-S PCI ids, and with it there are two more PCI
>ids commits, one for splitting BMG-G21 out of BMG for workarounds
>and the other adds a kernel macro.
>
>78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
>Link: https://lore.kernel.org/r/20251013200944.2499947-40-matthew.d.roper@intel.com
>
>edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
>Link: https://lore.kernel.org/r/20250808-intel-pci-device-v1-1-ce3545d86502@intel.com

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I don't like the commit message, but I don't care enough about it right
now neither.

I think it would be much better if going forward we'd adopt a template
and maybe even automate it. Something like this:


	Subject: lib/pciids: sync with kernel commit {kernel_head}

	Synchronize PCI IDs with kernel up to {kernel_head}, which
	includes the following changes:

	{kernel_log}

Which could basically be generated by a (to be added) script:

	tools/sync-intel-pciids [--head <commit>] [--base <commit>][--no-commit] <kernel-checkout>

What it does:
	a) inspect the last commit in igt that touched the header and
	   find the kernel_base. --base can override that.
	b) git -C /path/to/kernel/checkout show $KERNEL_HEAD:include/drm/intel/pciids.h
		> lib/pciids.h 

	   which basically copies the heade from whatever state of the
	   kernel checkout we want - some times we may want it from a
	   kernel release, some times from a particular branch, as long
	   as it keeps moving forward.

	   --head can force a specific commit from kernel, otherwise it
	   uses a default (drm/drm-next may be a good default).

	c) Commit the results with the template above.


This would avoid having commits to fix things up like because it went
astray. was done in commit
3896691534ef ("lib/pciids: lib/pciids: Add Wildcat Lake"). Same script
can be easily adapted to help updating the include/uapi
headers.

This should get us back to having the updates like we had in the past:

	2042426168cf lib: sync i915_pciids.h with kernel commit cfa7772880f8
	440669b77f16 lib: sync i915_pciids.h with kernel commit d2c4b1db1c4f
	9702d87169f7 lib: sync i915_pciids.h with kernel commit 7858cc0b55e3
	ea767a50aa93 lib: sync i915_pciids.h with kernel commit bfbda4722767
	940399b2f807 lib: sync i915_pciids.h with kernel commit aa3d586e1624
	1dda137aea8b lib: sync i915_pciids.h with kernel commit 5c8c22adc802
	167ffe4acb08 lib: sync i915_pciids.h with kernel commit 7b43a37348b7
	2763d0874328 lib: sync i915_pciids.h with kernel commit 41c0f8a36f15
	00dcfce5cb2b lib: sync i915_pciids.h with kernel commit 432ed92bfb55

Thoughts?

Lucas De Marchi


>
>v2: squashed into one commit (Lucas)
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Cc: Jani Nikula <jani.nikula@intel.com>
>Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>---
> lib/pciids.h | 21 +++++++++++++++++++--
> 1 file changed, 19 insertions(+), 2 deletions(-)
>
>diff --git a/lib/pciids.h b/lib/pciids.h
>index 76f8d26f9..9f095a99d 100644
>--- a/lib/pciids.h
>+++ b/lib/pciids.h
>@@ -26,6 +26,11 @@
> #define __PCIIDS_H__
>
> #ifdef __KERNEL__
>+#define INTEL_PCI_DEVICE(_id, _info) { \
>+	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
>+	.driver_data = (kernel_ulong_t)(_info), \
>+}
>+
> #define INTEL_VGA_DEVICE(_id, _info) { \
> 	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
> 	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
>@@ -844,7 +849,7 @@
> 	MACRO__(0x64B0, ## __VA_ARGS__)
>
> /* BMG */
>-#define INTEL_BMG_IDS(MACRO__, ...) \
>+#define INTEL_BMG_G21_IDS(MACRO__, ...) \
> 	MACRO__(0xE202, ## __VA_ARGS__), \
> 	MACRO__(0xE209, ## __VA_ARGS__), \
> 	MACRO__(0xE20B, ## __VA_ARGS__), \
>@@ -853,7 +858,10 @@
> 	MACRO__(0xE210, ## __VA_ARGS__), \
> 	MACRO__(0xE211, ## __VA_ARGS__), \
> 	MACRO__(0xE212, ## __VA_ARGS__), \
>-	MACRO__(0xE216, ## __VA_ARGS__), \
>+	MACRO__(0xE216, ## __VA_ARGS__)
>+
>+#define INTEL_BMG_IDS(MACRO__, ...) \
>+	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
> 	MACRO__(0xE220, ## __VA_ARGS__), \
> 	MACRO__(0xE221, ## __VA_ARGS__), \
> 	MACRO__(0xE222, ## __VA_ARGS__), \
>@@ -876,4 +884,13 @@
> 	MACRO__(0xFD80, ## __VA_ARGS__), \
> 	MACRO__(0xFD81, ## __VA_ARGS__)
>
>+/* NVL-S */
>+#define INTEL_NVLS_IDS(MACRO__, ...) \
>+	MACRO__(0xD740, ## __VA_ARGS__), \
>+	MACRO__(0xD741, ## __VA_ARGS__), \
>+	MACRO__(0xD742, ## __VA_ARGS__), \
>+	MACRO__(0xD743, ## __VA_ARGS__), \
>+	MACRO__(0xD744, ## __VA_ARGS__), \
>+	MACRO__(0xD745, ## __VA_ARGS__)
>+
> #endif /* __PCIIDS_H__ */
>-- 
>2.51.1
>
