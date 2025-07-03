Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1DFC77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 14:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CF710E869;
	Thu,  3 Jul 2025 14:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5dhhTuf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E3D10E869
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 14:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751554690; x=1783090690;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=TqnxV4HdxmdD+oyEIb0JB5BFRtWWIdgTUzYlUWa2Ab8=;
 b=N5dhhTufo2Q4IXUg9fCqy1oeOCR5VTyNnqw5k1LBzgGyHCY7ZIzIhqfD
 hy5YMF7NXqpZbx+yUV93fwaXqlpKxFLKOkEoju+3jBwQquGKi9bZAg37W
 GBroHmy6MMR0Ux/sBl5Z84RWHdFPsjE2itOQ7SMRR/J0amSlCZR5AjRdp
 XUyFa17IwCEMIc4iG/8q7Xx3aaUvarNk4wH+uSdoZqrHRW2Gm04BzUyqo
 9giyPtdLHmffp6pQbaQjPuymnMFTyIKA/vDwV2NMky0Yv3DgThMHCAV1g
 jlTCQ591yvzPTqq6qbHauEsSI8nPrjnDe+Y6gEO/yWiOIBmkddnPDEyXZ Q==;
X-CSE-ConnectionGUID: tbZ+/dF3R3utV8vUSVju9A==
X-CSE-MsgGUID: foLhp19bSYOQVvW02hpIiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="71452416"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="71452416"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:58:10 -0700
X-CSE-ConnectionGUID: xI1Q90+yQWi56NX+jnqZ5Q==
X-CSE-MsgGUID: uuGAMOvXQU+RZKsZJ1fLkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="160088163"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:58:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 07:58:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 07:58:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 07:58:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6hv+5+yT/Uhtg2dfnAQgyLvyPYJwuxWaBh010oCFdw2KUd6ZaENJEUo3YGgPJhwIkl7kW6g+MgeqDWx8cXCGwsy9cI2uKYRmNoym2wI9LL/LfwdqMglOePEClgndbzNvUBOiTtKNFtMc4lr9ntFZndxa6tlNLxOnFWOegxyuA2jrAyapN699LdmVtq/ZwxwdhvRc1NbUrzg2pFDyCIiyLky3DhVc6EIuTA9L/8abVRfMaIXP0qilZdMQkh4eVNyPRXiO83vAU9cb8PxuamGXgI5vlnc4Ms42Qz72joVizwz1z1l6VPaiMIVFyuZzyZ/sfh+aqSbbTHNtxviA0PQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaNSUmXZzobFH3FY73aEqXrSWDMrfQSfael1DjyEuu0=;
 b=cGATQs+1CWsrMm9bz3cV8j9qXbu/HVTrupCBf9JhHi0514E3YAxvrTtE7quMzqNz82lsgjkp7g3MWgfvVSNuTRgrzUpA3tW3oP98ZnugVpxuVCNrPfF/Q9RmIj2cASmbp8/5ahF5l1oqCtjhX5AM4Ke3xwfX+WJgOQO/8NQXslMWlFQ7lGrdOaM+68XqXBso6Og1Zi475jvydfhr2I6lzA8z/tSF49ypjgZkAW46JAJ8Oglt1qYPMc/KUetgFWCuRZNaOde3fAIbKIZkvXooBopPaAV+RK+wnIG4FTgaL1BXLSeiIz/VJOleObze4CZpB+/nKvFPjuTfQe/bBkGq9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA4PR11MB9322.namprd11.prod.outlook.com (2603:10b6:208:562::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.36; Thu, 3 Jul
 2025 14:57:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.030; Thu, 3 Jul 2025
 14:57:23 +0000
Date: Thu, 3 Jul 2025 07:57:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= success for
 Future-proof GT ID handling for Xe (rev2)
Message-ID: <20250703145720.GJ1204996@mdroper-desk1.amr.corp.intel.com>
References: <20250702193254.2613121-9-matthew.d.roper@intel.com>
 <175152377049.130398.4929616264360846493@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175152377049.130398.4929616264360846493@1538d3639d33>
X-ClientProxiedBy: SJ0PR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA4PR11MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: 52f1471a-976a-4523-f6b1-08ddba41eac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?URNIrdjZuxt+DikNnYz5nHCbfNmaEQ8mcpzQ+KP86XjBYfRzMdGJNMMwa01v?=
 =?us-ascii?Q?9m8JzeOEgtiYzGBZ6r0CeMfH/5zPATYzTkeHsx+63J1At3rqI2zE9b2kpIIG?=
 =?us-ascii?Q?ZN+MUapgHsoIzv0iudjv9O5fiiz1FAp/y+m+/RV7Cp/E+FS+rewYEkYg9cjH?=
 =?us-ascii?Q?naG8odmdIkQYLNW9CF0K1f8GoD72+VC1BV584MfiiAkMwBE/V81nwysocox9?=
 =?us-ascii?Q?W7OwyynqJKoaFV32id0Gw9XK7lymiUmy50oJRft3QPb0u9tELgd2OZBnZPeD?=
 =?us-ascii?Q?Ok9z+gjJSXHaGofgmYWG0jmTitkm/TKMUU36wteeq1aOVHurpJx/K+7ejpHP?=
 =?us-ascii?Q?qYg6153MtyQZqi8vZrQNuolI6NkKXYmzd+9sUqmIVM6Alr+WOS75UHFWo5sc?=
 =?us-ascii?Q?nP2HY6RUHqtPcJvlDfizGWjTuzD1DDeb72/ZxSZB8Vd6CrbZyuEfeQqCVQVr?=
 =?us-ascii?Q?J/dPpaZp8SM9G8IAkTV6Ml+I8Sg8MfkrZr2IJtJz9ucnIBrzbyW+yaMOqGy5?=
 =?us-ascii?Q?kXjtS1O4dmiPUNbScqAUOLezXi+qzr9JccNRc45M2Hz63StvzufBaz2hNdfh?=
 =?us-ascii?Q?n8zX6MUpyeODNb7sM6mN+Lmk2zy+rt5oFv5DWO7a7tjpstdMG+FizxD+94ss?=
 =?us-ascii?Q?q/87qveqqJ9wR7bUOXuY4m9bJYSNNSMWMdFBAMvl286fhRVVy7m3Z/4asOrJ?=
 =?us-ascii?Q?+baGp+lUXGWw0bG/G+Xf1cUBNWlUwo+wgrBIRxHOqOdZDaf9rf/golAA9Fes?=
 =?us-ascii?Q?VwBt91jq52OWO+Ph1KO97w+e7IJDxgH0lxtoedgnW7JIyzo4IAZ6dQmti74J?=
 =?us-ascii?Q?PfV6EgHyohpFt5Vs2fK7FqZ31sfZLPY0sWevsRH88n7ISLYAA9gIc+pa5fda?=
 =?us-ascii?Q?zOcw6+1HHf1VhhJFix/vUCmOiQz74ZkyMa5shsIqQwhrYenrgrxsBRMkLAks?=
 =?us-ascii?Q?dvJqUDH0Q5wWqLu+BfRjIKC/kyNeRAnw/49C54bASvP/JcLDHMHHos4A6BML?=
 =?us-ascii?Q?h1ExewNOyUFFsyznEQ/ERPLq68fPTiL935lbBibjkGLUoQv/Nf18nU+cmY4v?=
 =?us-ascii?Q?azJkBGMWxdr+hwRF5mVpxZxQQGYRWKvLENZlRWSgkFkM2bhRlZ08ew54eOoU?=
 =?us-ascii?Q?z22tfl7tmllCmC/VjBCbzcw45gUOid7RhJ/pmwAmABH13gIpViIGbgWWBgX3?=
 =?us-ascii?Q?HHIZpJOiVp1vZa5UX1dmdElkNBSsoyq712EXVN9nGix85OgZAhr5W2oOCS2s?=
 =?us-ascii?Q?gIbZsOWQ3q+/eQ9qaxDwJsY2o3M+0TGd9S0q6Wm1CrAEgnxf/BQygKwL2luI?=
 =?us-ascii?Q?RlmU5NA09LeYdqpQs+n8N5W/d+pxsoW0ADWdRc3CnNMX+D/Mgl1Kwsn3Q8yr?=
 =?us-ascii?Q?NW1Ebsc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CGBbS7eEeWbFMh2NzjcNfRjiyD5jz8MRPEs0Npf0Mhojt/VGPNs2YBCT2Mjv?=
 =?us-ascii?Q?b8tAru3V4rwZei17ViMdtXWkxVLq/BS03YEJEkGBFgHyA/wu350AUoNRSSvm?=
 =?us-ascii?Q?XeoKqZA71YS+ixBSeUVt9EwB5wcJyC2AfRMsrLb/vPhFcPjPYwdmAz9DW934?=
 =?us-ascii?Q?zSxxoAHyNZ4bTJ412asPpxCBI2iCOlt3nTv8rAgXDgMpsjrsxz2V4TsWpGap?=
 =?us-ascii?Q?4DmvjvNH1PUjKUkoN4sJ18OJcU9YXHvMBG5IbSsDWIijorFfysOshahDKyOL?=
 =?us-ascii?Q?zApSlj8LAtbD3xtGlDZRCP0IwzUWIAhrc4eNUoghpnVVwCpd0wTzbVpc5zud?=
 =?us-ascii?Q?Bn9VtoY+rRRpeoWkuhndidC0hL/9JmerQtbzBJAz6R3Om1cXyFL8QGb9OKH9?=
 =?us-ascii?Q?aqHjxTiBw+qn0yzzr/yRKnC9JJCLoNEB4HkzDJoQHcfj62cPJU0AUL2uLBVI?=
 =?us-ascii?Q?6GoCXeWxbEDLMMWcdE7KW3+6n7oR5rTYfXX3G6E5d1CtnAHzFLDFMJGe8sS7?=
 =?us-ascii?Q?zGSaZMSrKCTzXWyGezuhUO2wPKD+ltBPIEQ9M24HFb+IPJi0meeMIh3xow6E?=
 =?us-ascii?Q?L5SVq6EIp2X78rv+8kib1C8ytloJBOhPqs/PWSeuqUrXQTrBGFJeYujFgIad?=
 =?us-ascii?Q?Oc/GLAfP7zwV1fZvrZPpW2Ujtg5EMgR6bjMXeJC8HBDvu+KWMuCC7T643xmg?=
 =?us-ascii?Q?7Ajbtc1tYfqmmU5/42A3DzTDvxRN6HyQmKISB6QBAwtUIVHLsvAky5Qg6n1u?=
 =?us-ascii?Q?l4fbaejnZ8Ddibi5SHajTYb7SnKLtFjISn31jBoifqhGYoDGKghQXFa1vlkO?=
 =?us-ascii?Q?kiuXT0/mNLzoRuk3BubZmFJOz3NpfwQMvGIWsWxTug1+Nyle6fLoBKsgM0jD?=
 =?us-ascii?Q?ncrMOOlOuyBZWrJcQ/XZxZfxJXW53mQ4fjHDeEcIWphLuEoKonb5MzlF1i4H?=
 =?us-ascii?Q?nBfvZYqSatIoPgF4lSZ8HhhmW3QheVl7Lbjj8OJIWAnoNQtQbLk6SuVhIqZo?=
 =?us-ascii?Q?5EcCUUtKBD1HKHL+LXkuPxOwooFeeX9InzhRSWsK2ZPoq2GfEJD4qKLvPplx?=
 =?us-ascii?Q?O2SqhEBlWwVS5pM6xSxS0TzzIi8oBWwel6tZJanoFyb2c3/kzJ8H2kzqKrcq?=
 =?us-ascii?Q?AkBGNMhW9XuzjXxSdjyQh3/8Yi4fpnlVnHK5/QN85TM1bsOdybMJjkSSpgZk?=
 =?us-ascii?Q?me2BPUMya10L7axuPUcb/OYCvyHp0SK9wjwpS+596pYX27OhSrQO3fqqJw8O?=
 =?us-ascii?Q?nmP1pm0zroa7AVlaZyd//4RGanAOlRNp1MvhcQMX9FTSsJ1iawHV3l/PyRTA?=
 =?us-ascii?Q?AJ+VIIBmV4ZbaxffLRfgSvyo9GvCA5v6vxHHTVQ77Bg8rUk0MSKFTR5LuGC+?=
 =?us-ascii?Q?Vo8Z8DleE3rzOslqZKKjtBReWJW4UcAtMtWlsoDjB6XCZXuD7C4XZLxMwywf?=
 =?us-ascii?Q?AmMrxeoX8MwC/rxsDba6EnNWtRDFdswxN2q+1D3zKBjTj1n45mgrq0zgFQbR?=
 =?us-ascii?Q?q+bOd6w+qEwNP3jAcpKwQbSnCPGnVPkrp5f9QszOGx2MIx8yHpquF6uA0fYc?=
 =?us-ascii?Q?FhDYgoJWGLAap6devGAHh0JgAXaIvNmy6EF1NySMgAhLCvdblWbDt0Xczroy?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f1471a-976a-4523-f6b1-08ddba41eac4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 14:57:23.3640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYKeYkewRnt1mO+CcPWNRcLn/lCgbZH/d3P1eAgD98LKj0oGbb163+xHCodYzsK9ZfrU9Ef70XL02UGhFupKUz06ybz8Oj5DyLyaxb8dTaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9322
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

On Thu, Jul 03, 2025 at 06:22:50AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Future-proof GT ID handling for Xe (rev2)
> URL   : https://patchwork.freedesktop.org/series/150975/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8434_full -> IGTPW_13391_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to master.  Thanks Zbigniew for the reviews.


Matt


> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13391_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-tglu-1:       NOTRUN -> [SKIP][1] ([i915#11078])
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@device_reset@cold-reset-bound.html
> 
>   * igt@gem_ccs@block-multicopy-inplace:
>     - shard-tglu-1:       NOTRUN -> [SKIP][2] ([i915#3555] / [i915#9323])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@gem_ccs@block-multicopy-inplace.html
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-tglu:         NOTRUN -> [SKIP][3] ([i915#3555] / [i915#9323])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-7/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>     - shard-tglu:         NOTRUN -> [SKIP][4] ([i915#9323])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-dg2-9:        NOTRUN -> [SKIP][5] ([i915#7697])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#7697])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-tglu-1:       NOTRUN -> [SKIP][7] ([i915#8562])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@gem_create@create-ext-set-pat.html
>     - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#8562])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-13/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hostile:
>     - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#8555])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html
>     - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#8555])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-queued:
>     - shard-snb:          NOTRUN -> [SKIP][11] ([i915#1099]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#280])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-4/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_eio@kms:
>     - shard-dg2:          [PASS][13] -> [FAIL][14] ([i915#5784])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-6/igt@gem_eio@kms.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-2/igt@gem_eio@kms.html
>     - shard-dg1:          NOTRUN -> [FAIL][15] ([i915#5784])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-17/igt@gem_eio@kms.html
> 
>   * igt@gem_exec_balancer@bonded-sync:
>     - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#4771])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.html
> 
>   * igt@gem_exec_balancer@bonded-true-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#4812])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-4/igt@gem_exec_balancer@bonded-true-hang.html
> 
>   * igt@gem_exec_balancer@noheartbeat:
>     - shard-dg2-9:        NOTRUN -> [SKIP][18] ([i915#8555])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gem_exec_balancer@noheartbeat.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#14544] / [i915#4525])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_balancer@parallel-keep-in-fence:
>     - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#4525])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-in-fence.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#4525])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_capture@capture:
>     - shard-mtlp:         NOTRUN -> [FAIL][22] ([i915#11965]) +1 other test fail
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-5/igt@gem_exec_capture@capture.html
> 
>   * igt@gem_exec_capture@capture-invisible@lmem0:
>     - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#6334]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html
> 
>   * igt@gem_exec_capture@capture@vecs0-lmem0:
>     - shard-dg2:          NOTRUN -> [FAIL][24] ([i915#11965]) +4 other tests fail
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-5/igt@gem_exec_capture@capture@vecs0-lmem0.html
> 
>   * igt@gem_exec_flush@basic-uc-pro-default:
>     - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#3539] / [i915#4852]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-12/igt@gem_exec_flush@basic-uc-pro-default.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][26] ([i915#3539] / [i915#4852]) +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gem_exec_flush@basic-uc-pro-default.html
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>     - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#3281])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-softpin:
>     - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#3281]) +5 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@gem_exec_reloc@basic-softpin.html
> 
>   * igt@gem_exec_reloc@basic-wc-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#3281]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@gem_exec_reloc@basic-wc-gtt.html
> 
>   * igt@gem_exec_reloc@basic-write-read-noreloc:
>     - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#3281]) +2 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-17/igt@gem_exec_reloc@basic-write-read-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-write-wc:
>     - shard-dg2-9:        NOTRUN -> [SKIP][31] ([i915#3281]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gem_exec_reloc@basic-write-wc.html
> 
>   * igt@gem_exec_schedule@preempt-queue-chain:
>     - shard-dg2-9:        NOTRUN -> [SKIP][32] ([i915#4537] / [i915#4812])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gem_exec_schedule@preempt-queue-chain.html
> 
>   * igt@gem_exec_suspend@basic-s0:
>     - shard-dg2:          [PASS][33] -> [INCOMPLETE][34] ([i915#11441] / [i915#13304]) +1 other test incomplete
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-11/igt@gem_exec_suspend@basic-s0.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-3/igt@gem_exec_suspend@basic-s0.html
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - shard-snb:          [PASS][35] -> [ABORT][36] ([i915#12817]) +1 other test abort
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-snb7/igt@gem_exec_suspend@basic-s3@smem.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-snb1/igt@gem_exec_suspend@basic-s3@smem.html
>     - shard-tglu:         [PASS][37] -> [ABORT][38] ([i915#12817]) +1 other test abort
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-tglu-8/igt@gem_exec_suspend@basic-s3@smem.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-7/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices:
>     - shard-rkl:          [PASS][39] -> [ABORT][40] ([i915#7975] / [i915#8213]) +1 other test abort
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-2/igt@gem_exec_suspend@basic-s4-devices.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-threaded-none:
>     - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4860])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-7/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences:
>     - shard-dg2-9:        NOTRUN -> [SKIP][42] ([i915#4860])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-tglu-1:       NOTRUN -> [SKIP][43] ([i915#4613] / [i915#7582])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random:
>     - shard-tglu-1:       NOTRUN -> [SKIP][44] ([i915#4613]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#4613]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-6/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - shard-glk:          NOTRUN -> [SKIP][46] ([i915#4613]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-glk8/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_madvise@dontneed-before-pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3282]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-17/igt@gem_madvise@dontneed-before-pwrite.html
> 
>   * igt@gem_media_vme:
>     - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#284])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-13/igt@gem_media_vme.html
> 
>   * igt@gem_mmap@bad-size:
>     - shard-dg2-9:        NOTRUN -> [SKIP][49] ([i915#4083]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gem_mmap@bad-size.html
> 
>   * igt@gem_mmap_gtt@basic-small-copy:
>     - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4077])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-12/igt@gem_mmap_gtt@basic-small-copy.html
>     - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4077])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-3/igt@gem_mmap_gtt@basic-small-copy.html
> 
>   * igt@gem_mmap_gtt@isolation:
>     - shard-dg2-9:        NOTRUN -> [SKIP][52] ([i915#4077]) +6 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gem_mmap_gtt@isolation.html
> 
>   * igt@gem_mmap_gtt@zero-extend:
>     - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4077]) +9 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-11/igt@gem_mmap_gtt@zero-extend.html
> 
>   * igt@gem_mmap_wc@bad-object:
>     - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4083]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-4/igt@gem_mmap_wc@bad-object.html
> 
>   * igt@gem_mmap_wc@close:
>     - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4083])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-18/igt@gem_mmap_wc@close.html
> 
>   * igt@gem_mmap_wc@read:
>     - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4083])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-1/igt@gem_mmap_wc@read.html
> 
>   * igt@gem_pread@snoop:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3282]) +3 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-6/igt@gem_pread@snoop.html
> 
>   * igt@gem_pxp@create-regular-context-2:
>     - shard-rkl:          NOTRUN -> [TIMEOUT][58] ([i915#12917] / [i915#12964])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@gem_pxp@create-regular-context-2.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-rkl:          [PASS][59] -> [TIMEOUT][60] ([i915#12917] / [i915#12964])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@gem_pxp@display-protected-crc.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@gem_pxp@display-protected-crc.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][61] ([i915#4270])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>     - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4270])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-19/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4270])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_readwrite@read-bad-handle:
>     - shard-dg2-9:        NOTRUN -> [SKIP][64] ([i915#3282]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gem_readwrite@read-bad-handle.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#5190] / [i915#8428]) +3 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-8/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
>     - shard-dg2-9:        NOTRUN -> [SKIP][66] ([i915#5190] / [i915#8428]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html
> 
>   * igt@gem_set_tiling_vs_gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4079])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-6/igt@gem_set_tiling_vs_gtt.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#3282]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_unfence_active_buffers:
>     - shard-dg2-9:        NOTRUN -> [SKIP][69] ([i915#4879])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gem_unfence_active_buffers.html
> 
>   * igt@gem_userptr_blits@access-control:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3297])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-6/igt@gem_userptr_blits@access-control.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#3297])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-6/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3297] / [i915#3323])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][73] ([i915#3297] / [i915#3323])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate:
>     - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3297] / [i915#4880])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate.html
> 
>   * igt@gem_userptr_blits@unsync-unmap:
>     - shard-dg2-9:        NOTRUN -> [SKIP][75] ([i915#3297])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gem_userptr_blits@unsync-unmap.html
> 
>   * igt@gen7_exec_parse@basic-allocation:
>     - shard-dg2-9:        NOTRUN -> [SKIP][76]
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gen7_exec_parse@basic-allocation.html
> 
>   * igt@gen9_exec_parse@batch-invalid-length:
>     - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#2527]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@gen9_exec_parse@batch-invalid-length.html
> 
>   * igt@gen9_exec_parse@bb-large:
>     - shard-dg2-9:        NOTRUN -> [SKIP][78] ([i915#2856]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@gen9_exec_parse@bb-large.html
> 
>   * igt@gen9_exec_parse@bb-start-far:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#2856]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-5/igt@gen9_exec_parse@bb-start-far.html
>     - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#2856]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-5/igt@gen9_exec_parse@bb-start-far.html
> 
>   * igt@gen9_exec_parse@secure-batches:
>     - shard-tglu-1:       NOTRUN -> [SKIP][81] ([i915#2527] / [i915#2856]) +2 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@gen9_exec_parse@secure-batches.html
> 
>   * igt@gen9_exec_parse@shadow-peek:
>     - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#2527])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-14/igt@gen9_exec_parse@shadow-peek.html
> 
>   * igt@gen9_exec_parse@unaligned-jump:
>     - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#14544] / [i915#2527])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html
> 
>   * igt@i915_drm_fdinfo@busy@vecs1:
>     - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#14073]) +23 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-3/igt@i915_drm_fdinfo@busy@vecs1.html
> 
>   * igt@i915_drm_fdinfo@virtual-busy-all:
>     - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#14118])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@i915_drm_fdinfo@virtual-busy-all.html
> 
>   * igt@i915_module_load@reload-no-display:
>     - shard-tglu-1:       NOTRUN -> [DMESG-WARN][86] ([i915#13029] / [i915#14545])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@i915_module_load@reload-no-display.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-dg2-9:        NOTRUN -> [DMESG-WARN][87] ([i915#14545])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api:
>     - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#8399])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-2/igt@i915_pm_freq_api@freq-basic-api.html
> 
>   * igt@i915_pm_freq_api@freq-reset:
>     - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#8399])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@i915_pm_freq_api@freq-reset.html
> 
>   * igt@i915_pm_freq_api@freq-suspend:
>     - shard-tglu-1:       NOTRUN -> [SKIP][90] ([i915#8399]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#14498])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#11681] / [i915#6621])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-12/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_pm_rps@thresholds-idle-park:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#11681])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-6/igt@i915_pm_rps@thresholds-idle-park.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#6245])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-10/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][95] ([i915#4817] / [i915#7443])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-2/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][96] ([i915#4817])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-glk5/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#4212])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
>     - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4212])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
>     - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#4212])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-18/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][100] ([i915#12761]) +1 other test incomplete
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][101] ([i915#12761]) +1 other test incomplete
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-glk8/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_async_flips@invalid-async-flip-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#12967])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-7/igt@kms_async_flips@invalid-async-flip-atomic.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-dg2-9:        NOTRUN -> [FAIL][103] ([i915#5956]) +1 other test fail
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#1769] / [i915#3555])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-rkl:          [PASS][105] -> [FAIL][106] ([i915#11808])
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [FAIL][107] ([i915#11808])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
>     - shard-rkl:          [PASS][108] -> [SKIP][109] ([i915#14544]) +35 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#5286]) +4 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#5286]) +3 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#4538] / [i915#5286])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-tglu-1:       NOTRUN -> [SKIP][113] ([i915#5286]) +1 other test skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-mtlp:         [PASS][114] -> [FAIL][115] ([i915#5138])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#3638])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-17/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg2:          NOTRUN -> [SKIP][117] +10 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#4538] / [i915#5190]) +5 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#5190]) +2 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-dg2-9:        NOTRUN -> [SKIP][120] ([i915#4538] / [i915#5190]) +3 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][121] +4 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#4538]) +1 other test skip
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-13/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-9:        NOTRUN -> [SKIP][123] ([i915#5190])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#6095]) +135 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#6095]) +4 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-edp-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#10307] / [i915#6095]) +167 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#12313])
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#6095]) +29 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-9:        NOTRUN -> [SKIP][130] ([i915#10307] / [i915#6095]) +23 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][131] ([i915#12313])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>     - shard-dg2-9:        NOTRUN -> [SKIP][132] ([i915#10307] / [i915#10434] / [i915#6095])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][133] ([i915#12796]) +1 other test incomplete
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#6095]) +20 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-2:
>     - shard-dg2-9:        NOTRUN -> [SKIP][135] ([i915#6095]) +4 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#12313])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#6095]) +39 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#6095]) +35 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#14098] / [i915#6095]) +34 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [SKIP][140] +122 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-glk5/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#3742])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-8/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#3742])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-17/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-2:
>     - shard-dg2-9:        NOTRUN -> [SKIP][143] ([i915#13781]) +4 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-mtlp:         NOTRUN -> [SKIP][144] +2 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-5/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#11151] / [i915#7828]) +3 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_edid@dp-edid-read:
>     - shard-dg2-9:        NOTRUN -> [SKIP][146] ([i915#11151] / [i915#7828]) +3 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_chamelium_edid@dp-edid-read.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#11151] / [i915#7828]) +5 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-7/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-multiple:
>     - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#11151] / [i915#7828]) +5 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_color@deep-color:
>     - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#3555] / [i915#9979])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_color@deep-color.html
> 
>   * igt@kms_color@degamma:
>     - shard-rkl:          [PASS][151] -> [SKIP][152] ([i915#12655] / [i915#14544])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_color@degamma.html
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_color@degamma.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-2/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#3299]) +1 other test skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-1.html
>     - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#3116] / [i915#3299])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#3116] / [i915#3299])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html
>     - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3299])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-13/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2-9:        NOTRUN -> [SKIP][158] ([i915#7118] / [i915#9424])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-dg2-9:        NOTRUN -> [SKIP][159] ([i915#9424])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#13049])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-max-size:
>     - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#3555]) +1 other test skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-random-128x42:
>     - shard-rkl:          [PASS][163] -> [FAIL][164] ([i915#13566])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-3/igt@kms_cursor_crc@cursor-random-128x42.html
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-2/igt@kms_cursor_crc@cursor-random-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][165] ([i915#13566]) +4 other tests fail
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
>     - shard-tglu:         [PASS][166] -> [FAIL][167] ([i915#13566]) +5 other tests fail
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#13049]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-dg2-9:        NOTRUN -> [SKIP][169] ([i915#3555])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#3555]) +1 other test skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-9:        NOTRUN -> [SKIP][171] ([i915#13049])
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#13049])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-b-hdmi-a-1:
>     - shard-rkl:          [PASS][173] -> [DMESG-WARN][174] ([i915#12964]) +34 other tests dmesg-warn
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-b-hdmi-a-1.html
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#9809])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-dg2-9:        NOTRUN -> [SKIP][176] ([i915#13046] / [i915#5354]) +1 other test skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#4103] / [i915#4213])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#4103]) +1 other test skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#13046] / [i915#5354]) +5 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#9067])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-11/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#4103])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-tglu-1:       NOTRUN -> [SKIP][182] ([i915#9723])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#9833])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>     - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#9723])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#1257])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-3/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#13749])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html
>     - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#13749])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-4/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#13748])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#13748]) +1 other test skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-wc:
>     - shard-dg2-9:        NOTRUN -> [SKIP][190] ([i915#8812])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_draw_crc@draw-method-mmap-wc.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#3555] / [i915#3840])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-8/igt@kms_dsc@dsc-basic.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][192] ([i915#3555] / [i915#3840])
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3840])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#3840] / [i915#9053])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>     - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#3840] / [i915#9053])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-9:        NOTRUN -> [SKIP][196] ([i915#3469])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#1839])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-2/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-tglu-1:       NOTRUN -> [SKIP][198] ([i915#1839])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#9337])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-9/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race:
>     - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#9934]) +2 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-12/igt@kms_flip@2x-dpms-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-dg2-9:        NOTRUN -> [SKIP][201] ([i915#9934]) +5 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-dg2-9:        NOTRUN -> [SKIP][202] ([i915#8381])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#3637] / [i915#9934])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-tglu-1:       NOTRUN -> [SKIP][204] ([i915#3637] / [i915#9934]) +4 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>     - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#9934])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-glk:          [PASS][206] -> [SKIP][207]
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-glk8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#9934]) +4 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-11/igt@kms_flip@2x-wf_vblank-ts-check.html
>     - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#3637] / [i915#9934]) +4 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-3/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible:
>     - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#14544] / [i915#3637])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
>     - shard-dg2:          [PASS][211] -> [FAIL][212] ([i915#13027]) +1 other test fail
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-rkl:          [PASS][213] -> [SKIP][214] ([i915#14544] / [i915#3637]) +5 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_flip@flip-vs-suspend.html
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#2672] / [i915#3555])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>     - shard-tglu-1:       NOTRUN -> [SKIP][216] ([i915#2587] / [i915#2672]) +2 other tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#2672] / [i915#3555])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#2672]) +3 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>     - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#2587] / [i915#2672] / [i915#3555])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#2587] / [i915#2672])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>     - shard-rkl:          [PASS][222] -> [SKIP][223] ([i915#14544] / [i915#3555]) +1 other test skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][224] ([i915#2672] / [i915#3555] / [i915#5190])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-dg2-9:        NOTRUN -> [SKIP][225] ([i915#2672]) +1 other test skip
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
>     - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#2672] / [i915#3555])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#2587] / [i915#2672])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#2672] / [i915#3555]) +2 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-dg2-9:        NOTRUN -> [SKIP][229] ([i915#2672] / [i915#3555])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#2672]) +3 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>     - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
>     - shard-dg2:          [PASS][232] -> [FAIL][233] ([i915#6880])
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#1825]) +9 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
>     - shard-tglu-1:       NOTRUN -> [SKIP][235] +52 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
>     - shard-dg1:          NOTRUN -> [SKIP][236] +7 other tests skip
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
>     - shard-snb:          [PASS][237] -> [SKIP][238] +1 other test skip
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-9:        NOTRUN -> [SKIP][239] ([i915#5354]) +9 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:
>     - shard-rkl:          [PASS][240] -> [SKIP][241] ([i915#14544] / [i915#1849] / [i915#5354]) +5 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-tglu-1:       NOTRUN -> [SKIP][242] ([i915#5439])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#3458]) +3 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#3023]) +2 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#8708]) +13 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#5354]) +20 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#10433] / [i915#3458])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#8708]) +7 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#14544] / [i915#1849] / [i915#5354]) +9 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#3458]) +13 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>     - shard-dg2-9:        NOTRUN -> [SKIP][251] ([i915#8708]) +8 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-snb:          NOTRUN -> [SKIP][252] +83 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][253] +64 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#1825]) +3 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
>     - shard-dg2-9:        NOTRUN -> [SKIP][255] ([i915#3458]) +6 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-9:        NOTRUN -> [SKIP][256] ([i915#3555] / [i915#8228])
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#3555] / [i915#8228]) +1 other test skip
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][258] ([i915#3555] / [i915#8228]) +2 other tests skip
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_invalid_mode@uint-max-clock:
>     - shard-rkl:          [PASS][259] -> [SKIP][260] ([i915#14544] / [i915#3555] / [i915#8826]) +1 other test skip
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_invalid_mode@uint-max-clock.html
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_invalid_mode@uint-max-clock.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-dg2:          [PASS][261] -> [SKIP][262] ([i915#12388])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#10656])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-dg2-9:        NOTRUN -> [SKIP][264] ([i915#12339])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#13522])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-14/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
>     - shard-rkl:          [PASS][266] -> [SKIP][267] ([i915#11190] / [i915#14544])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-rkl:          [PASS][268] -> [SKIP][269] ([i915#14544] / [i915#8825]) +1 other test skip
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-3/igt@kms_plane@pixel-format-source-clamping.html
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_plane_alpha_blend@alpha-basic:
>     - shard-glk:          NOTRUN -> [FAIL][270] ([i915#12178])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic.html
> 
>   * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [FAIL][271] ([i915#7862]) +1 other test fail
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#13958])
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-17/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-tglu-1:       NOTRUN -> [SKIP][273] ([i915#13958])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-4:
>     - shard-tglu-1:       NOTRUN -> [SKIP][274] ([i915#14259])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_plane_multiple@tiling-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
>     - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#12247]) +4 other tests skip
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
>     - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#12247]) +5 other tests skip
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
>     - shard-dg1:          [PASS][277] -> [DMESG-WARN][278] ([i915#4423])
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg1-14/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#12247] / [i915#9423])
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
>     - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#12247]) +3 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][281] ([i915#12247]) +9 other tests skip
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5:
>     - shard-rkl:          [PASS][282] -> [SKIP][283] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
>     - shard-rkl:          [PASS][284] -> [SKIP][285] ([i915#12247] / [i915#14544]) +3 other tests skip
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20:
>     - shard-rkl:          [PASS][286] -> [SKIP][287] ([i915#14544] / [i915#6953] / [i915#8152])
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20.html
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:
>     - shard-rkl:          [PASS][288] -> [SKIP][289] ([i915#12247] / [i915#14544] / [i915#8152]) +3 other tests skip
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
>     - shard-rkl:          [PASS][290] -> [SKIP][291] ([i915#12247] / [i915#14544] / [i915#3555] / [i915#6953] / [i915#8152]) +1 other test skip
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-tglu-1:       NOTRUN -> [SKIP][292] ([i915#9812])
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#12343])
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-7/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#5354])
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-16/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-9:        NOTRUN -> [SKIP][295] ([i915#9685])
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-tglu-1:       NOTRUN -> [SKIP][296] ([i915#9685])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#14544] / [i915#9685])
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#9340])
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-2/igt@kms_pm_lpsp@kms-lpsp.html
>     - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#14544] / [i915#9340])
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html
>     - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#9340])
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html
>     - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#3828])
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-7/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg2-9:        NOTRUN -> [SKIP][302] ([i915#9519])
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-rkl:          [PASS][303] -> [SKIP][304] ([i915#14544] / [i915#9519])
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-dg2:          [PASS][305] -> [SKIP][306] ([i915#9519])
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html
>     - shard-rkl:          [PASS][307] -> [SKIP][308] ([i915#9519]) +1 other test skip
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-tglu-1:       NOTRUN -> [SKIP][309] ([i915#6524])
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_prime@d3hot.html
> 
>   * igt@kms_properties@crtc-properties-legacy:
>     - shard-rkl:          [PASS][310] -> [SKIP][311] ([i915#11521] / [i915#14544])
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_properties@crtc-properties-legacy.html
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>     - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#11520]) +5 other tests skip
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>     - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#11520]) +3 other tests skip
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-snb:          NOTRUN -> [SKIP][314] ([i915#11520]) +1 other test skip
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-snb1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
>     - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#11520]) +1 other test skip
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-12/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
>     - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#12316])
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>     - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#11520]) +5 other tests skip
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#11520]) +4 other tests skip
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>     - shard-glk:          NOTRUN -> [SKIP][319] ([i915#11520]) +5 other tests skip
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-glk5/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
>     - shard-dg2-9:        NOTRUN -> [SKIP][320] ([i915#11520]) +1 other test skip
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
>     - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#1072] / [i915#14544] / [i915#9732])
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html
> 
>   * igt@kms_psr@fbc-pr-primary-mmap-gtt:
>     - shard-dg2-9:        NOTRUN -> [SKIP][322] ([i915#1072] / [i915#9732]) +9 other tests skip
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_psr@fbc-pr-primary-mmap-gtt.html
> 
>   * igt@kms_psr@fbc-psr2-no-drrs:
>     - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#1072] / [i915#9732]) +4 other tests skip
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-19/igt@kms_psr@fbc-psr2-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#1072] / [i915#9732]) +5 other tests skip
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-blt.html
> 
>   * igt@kms_psr@pr-cursor-render:
>     - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#9688])
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-4/igt@kms_psr@pr-cursor-render.html
> 
>   * igt@kms_psr@pr-sprite-mmap-cpu:
>     - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#9732]) +15 other tests skip
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-7/igt@kms_psr@pr-sprite-mmap-cpu.html
> 
>   * igt@kms_psr@psr-cursor-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#1072] / [i915#9732]) +12 other tests skip
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-6/igt@kms_psr@psr-cursor-mmap-cpu.html
> 
>   * igt@kms_psr@psr2-sprite-mmap-gtt:
>     - shard-tglu-1:       NOTRUN -> [SKIP][328] ([i915#9732]) +10 other tests skip
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#12755])
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-tglu-1:       NOTRUN -> [SKIP][330] ([i915#5289])
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#12755] / [i915#5190])
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#5289]) +1 other test skip
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#3555]) +1 other test skip
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_selftest@drm_framebuffer:
>     - shard-tglu-1:       NOTRUN -> [ABORT][334] ([i915#13179]) +1 other test abort
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html
> 
>   * igt@kms_sequence@get-idle@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][335] ([i915#12964]) +3 other tests dmesg-warn
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_sequence@get-idle@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_setmode@basic:
>     - shard-rkl:          [PASS][336] -> [FAIL][337] ([i915#5465])
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_setmode@basic.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_setmode@basic.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][338] ([i915#5465]) +1 other test fail
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-mtlp:         [PASS][339] -> [FAIL][340] ([i915#5465]) +2 other tests fail
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-mtlp-4/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-6/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#3555]) +4 other tests skip
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-7/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#8623])
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-2/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-glk:          NOTRUN -> [FAIL][343] ([i915#10959])
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#8623])
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm:
>     - shard-rkl:          [PASS][345] -> [DMESG-WARN][346] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-rpm.html
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-rpm.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2:          [PASS][347] -> [ABORT][348] ([i915#8213])
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-3:
>     - shard-dg2:          NOTRUN -> [ABORT][349] ([i915#8213])
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-3.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-dg2-9:        NOTRUN -> [SKIP][350] ([i915#9906]) +1 other test skip
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#14544]) +2 other tests skip
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-9:        NOTRUN -> [SKIP][352] ([i915#2437])
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#2437] / [i915#9412])
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-tglu-1:       NOTRUN -> [SKIP][354] ([i915#2437])
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@perf@blocking@0-rcs0:
>     - shard-rkl:          [PASS][355] -> [FAIL][356] ([i915#10538]) +1 other test fail
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-2/igt@perf@blocking@0-rcs0.html
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@perf@blocking@0-rcs0.html
> 
>   * igt@perf@gen12-group-concurrent-oa-buffer-read:
>     - shard-mtlp:         [PASS][357] -> [FAIL][358] ([i915#10538])
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-mtlp-8/igt@perf@gen12-group-concurrent-oa-buffer-read.html
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-2/igt@perf@gen12-group-concurrent-oa-buffer-read.html
> 
>   * igt@perf@global-sseu-config-invalid:
>     - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#7387])
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-6/igt@perf@global-sseu-config-invalid.html
> 
>   * igt@perf@non-zero-reason@0-rcs0:
>     - shard-dg2:          NOTRUN -> [FAIL][360] ([i915#9100]) +1 other test fail
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          NOTRUN -> [FAIL][361] ([i915#4349]) +4 other tests fail
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-glk:          NOTRUN -> [FAIL][362] ([i915#14433])
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-glk5/igt@perf_pmu@module-unload.html
>     - shard-dg2:          NOTRUN -> [FAIL][363] ([i915#14433])
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-6/igt@perf_pmu@module-unload.html
>     - shard-dg1:          NOTRUN -> [FAIL][364] ([i915#14433])
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-12/igt@perf_pmu@module-unload.html
>     - shard-snb:          NOTRUN -> [FAIL][365] ([i915#14433])
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-snb6/igt@perf_pmu@module-unload.html
>     - shard-tglu:         NOTRUN -> [FAIL][366] ([i915#14433])
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-2/igt@perf_pmu@module-unload.html
>     - shard-mtlp:         NOTRUN -> [FAIL][367] ([i915#14433])
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-4/igt@perf_pmu@module-unload.html
> 
>   * igt@perf_pmu@most-busy-idle-check-all:
>     - shard-rkl:          [PASS][368] -> [DMESG-FAIL][369] ([i915#12964]) +1 other test dmesg-fail
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@perf_pmu@most-busy-idle-check-all.html
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@perf_pmu@most-busy-idle-check-all.html
> 
>   * igt@prime_vgem@basic-write:
>     - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#3291] / [i915#3708])
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-5/igt@prime_vgem@basic-write.html
>     - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#3291] / [i915#3708])
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@prime_vgem@basic-write.html
>     - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#3708])
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-18/igt@prime_vgem@basic-write.html
>     - shard-mtlp:         NOTRUN -> [SKIP][373] ([i915#10216] / [i915#3708])
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-8/igt@prime_vgem@basic-write.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#3708])
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-5/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@prime_vgem@fence-write-hang:
>     - shard-dg2-9:        NOTRUN -> [SKIP][375] ([i915#3708])
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@prime_vgem@fence-write-hang.html
>     - shard-rkl:          NOTRUN -> [SKIP][376] ([i915#3708])
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@prime_vgem@fence-write-hang.html
> 
>   * igt@runner@aborted:
>     - shard-mtlp:         NOTRUN -> ([FAIL][377], [FAIL][378]) ([i915#14489])
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-3/igt@runner@aborted.html
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-mtlp-3/igt@runner@aborted.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each:
>     - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#9917])
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@sriov_basic@enable-vfs-bind-unbind-each.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-9:        NOTRUN -> [SKIP][380] ([i915#9917])
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-9/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
>     - shard-tglu-1:       NOTRUN -> [FAIL][381] ([i915#12910]) +8 other tests fail
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@fbdev@unaligned-write:
>     - shard-rkl:          [SKIP][382] ([i915#14544] / [i915#2582]) -> [PASS][383]
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@fbdev@unaligned-write.html
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@fbdev@unaligned-write.html
> 
>   * igt@gem_mmap_gtt@close-race:
>     - shard-rkl:          [DMESG-WARN][384] ([i915#12964]) -> [PASS][385] +35 other tests pass
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@gem_mmap_gtt@close-race.html
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-3/igt@gem_mmap_gtt@close-race.html
> 
>   * igt@gem_pxp@create-regular-buffer:
>     - shard-rkl:          [TIMEOUT][386] ([i915#12917] / [i915#12964]) -> [PASS][387]
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@gem_pxp@create-regular-buffer.html
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@gem_pxp@create-regular-buffer.html
> 
>   * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>     - shard-rkl:          [TIMEOUT][388] ([i915#12964]) -> [PASS][389]
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [ABORT][390] ([i915#5566]) -> [PASS][391]
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-glk5/igt@gen9_exec_parse@allowed-all.html
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-glk5/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_pm_rc6_residency@rc6-accuracy:
>     - shard-rkl:          [FAIL][392] ([i915#12942]) -> [PASS][393] +1 other test pass
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - shard-dg2:          [DMESG-FAIL][394] ([i915#12061]) -> [PASS][395] +1 other test pass
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-5/igt@i915_selftest@live@workarounds.html
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-2/igt@i915_selftest@live@workarounds.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-rkl:          [INCOMPLETE][396] ([i915#4817]) -> [PASS][397]
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-3/igt@i915_suspend@forcewake.html
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-2/igt@i915_suspend@forcewake.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-tglu:         [FAIL][398] ([i915#11808]) -> [PASS][399] +3 other tests pass
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-dg1:          [DMESG-WARN][400] ([i915#4423]) -> [PASS][401] +2 other tests pass
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg1-15/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_color@ctm-0-75:
>     - shard-rkl:          [SKIP][402] ([i915#12655] / [i915#14544]) -> [PASS][403] +1 other test pass
>    [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_color@ctm-0-75.html
>    [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_color@ctm-0-75.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x256:
>     - shard-rkl:          [SKIP][404] ([i915#14544]) -> [PASS][405] +35 other tests pass
>    [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html
>    [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x256.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21:
>     - shard-rkl:          [FAIL][406] ([i915#13566]) -> [PASS][407]
>    [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html
>    [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
>     - shard-tglu:         [FAIL][408] ([i915#13566]) -> [PASS][409] +3 other tests pass
>    [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
>    [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-snb:          [ABORT][410] ([i915#12817]) -> [PASS][411] +2 other tests pass
>    [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-snb1/igt@kms_cursor_crc@cursor-suspend.html
>    [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-snb6/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2:          [SKIP][412] ([i915#1257]) -> [PASS][413]
>    [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-3/igt@kms_dp_aux_dev.html
>    [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-rkl:          [SKIP][414] ([i915#14544] / [i915#14561]) -> [PASS][415]
>    [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html
>    [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-2/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@display-1x:
>     - shard-rkl:          [SKIP][416] ([i915#14544] / [i915#9738]) -> [PASS][417]
>    [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_feature_discovery@display-1x.html
>    [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_feature_discovery@display-1x.html
> 
>   * igt@kms_flip@blocking-wf_vblank@a-hdmi-a2:
>     - shard-rkl:          [FAIL][418] ([i915#13734]) -> [PASS][419] +1 other test pass
>    [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html
>    [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-snb:          [FAIL][420] ([i915#13734]) -> [PASS][421] +1 other test pass
>    [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>     - shard-tglu:         [FAIL][422] ([i915#13734]) -> [PASS][423] +1 other test pass
>    [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-tglu-9/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-panning:
>     - shard-rkl:          [SKIP][424] ([i915#14544] / [i915#3637]) -> [PASS][425] +4 other tests pass
>    [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_flip@flip-vs-panning.html
>    [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_flip@flip-vs-panning.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-rkl:          [SKIP][426] ([i915#14544] / [i915#3555]) -> [PASS][427]
>    [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
>     - shard-rkl:          [SKIP][428] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][429] +8 other tests pass
>    [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
>    [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
>     - shard-dg2:          [FAIL][430] ([i915#6880]) -> [PASS][431] +1 other test pass
>    [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
>    [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
>     - shard-glk:          [SKIP][432] -> [PASS][433]
>    [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html
>    [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-tglu:         [ABORT][434] ([i915#12817]) -> [PASS][435]
>    [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-dg2:          [SKIP][436] ([i915#3555] / [i915#8228]) -> [PASS][437] +1 other test pass
>    [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-4/igt@kms_hdr@static-swap.html
>    [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-11/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_invalid_mode@bad-hsync-end:
>     - shard-rkl:          [SKIP][438] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][439] +1 other test pass
>    [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html
>    [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_invalid_mode@bad-hsync-end.html
> 
>   * igt@kms_invalid_mode@overflow-vrefresh:
>     - shard-rkl:          [SKIP][440] ([i915#14544] / [i915#8826]) -> [PASS][441]
>    [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_invalid_mode@overflow-vrefresh.html
>    [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_invalid_mode@overflow-vrefresh.html
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc:
>     - shard-rkl:          [SKIP][442] ([i915#11190] / [i915#14544]) -> [PASS][443] +1 other test pass
>    [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_pipe_crc_basic@hang-read-crc.html
>    [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_pipe_crc_basic@hang-read-crc.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-rkl:          [INCOMPLETE][444] ([i915#14412]) -> [PASS][445] +1 other test pass
>    [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
>     - shard-rkl:          [SKIP][446] ([i915#14544] / [i915#7294]) -> [PASS][447]
>    [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
>    [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b:
>     - shard-rkl:          [DMESG-WARN][448] ([i915#12917] / [i915#12964]) -> [PASS][449] +2 other tests pass
>    [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b.html
>    [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-b.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
>     - shard-rkl:          [SKIP][450] ([i915#14544] / [i915#8152]) -> [PASS][451] +1 other test pass
>    [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
>    [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
>     - shard-rkl:          [SKIP][452] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][453]
>    [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
>    [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-rkl:          [SKIP][454] ([i915#12247] / [i915#14544]) -> [PASS][455] +3 other tests pass
>    [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
>    [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:
>     - shard-rkl:          [SKIP][456] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][457] +5 other tests pass
>    [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html
>    [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html
> 
>   * igt@kms_pm_rpm@pm-caching:
>     - shard-rkl:          [SKIP][458] ([i915#12916]) -> [PASS][459]
>    [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@kms_pm_rpm@pm-caching.html
>    [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_pm_rpm@pm-caching.html
> 
>   * igt@kms_setmode@basic:
>     - shard-snb:          [FAIL][460] ([i915#5465]) -> [PASS][461] +2 other tests pass
>    [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-snb7/igt@kms_setmode@basic.html
>    [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-snb1/igt@kms_setmode@basic.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-dg2:          [SKIP][462] ([i915#3555] / [i915#9906]) -> [PASS][463]
>    [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-2/igt@kms_vrr@negative-basic.html
>    [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-11/igt@kms_vrr@negative-basic.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - shard-rkl:          [SKIP][464] ([i915#14544] / [i915#3708]) -> [PASS][465]
>    [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html
>    [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@prime_vgem@basic-fence-flip.html
> 
>   
> #### Warnings ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-rkl:          [SKIP][466] ([i915#14544] / [i915#8411]) -> [SKIP][467] ([i915#8411]) +1 other test skip
>    [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html
>    [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-rkl:          [SKIP][468] ([i915#8411]) -> [SKIP][469] ([i915#14544] / [i915#8411])
>    [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-3/igt@api_intel_bb@blit-reloc-purge-cache.html
>    [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          [SKIP][470] ([i915#6230]) -> [SKIP][471] ([i915#14544] / [i915#6230])
>    [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@api_intel_bb@crc32.html
>    [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@api_intel_bb@crc32.html
> 
>   * igt@gem_ccs@block-multicopy-compressed:
>     - shard-rkl:          [SKIP][472] ([i915#9323]) -> [SKIP][473] ([i915#14544] / [i915#9323])
>    [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html
>    [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html
> 
>   * igt@gem_close_race@multigpu-basic-process:
>     - shard-rkl:          [SKIP][474] ([i915#7697]) -> [SKIP][475] ([i915#14544] / [i915#7697])
>    [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@gem_close_race@multigpu-basic-process.html
>    [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-rkl:          [SKIP][476] ([i915#14544] / [i915#8562]) -> [SKIP][477] ([i915#8562])
>    [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@gem_create@create-ext-set-pat.html
>    [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-rkl:          [SKIP][478] ([i915#14544] / [i915#280]) -> [SKIP][479] ([i915#280])
>    [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html
>    [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_exec_reloc@basic-range-active:
>     - shard-rkl:          [SKIP][480] ([i915#14544] / [i915#3281]) -> [SKIP][481] ([i915#3281])
>    [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@gem_exec_reloc@basic-range-active.html
>    [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@gem_exec_reloc@basic-range-active.html
> 
>   * igt@gem_exec_reloc@basic-write-read:
>     - shard-rkl:          [SKIP][482] ([i915#3281]) -> [SKIP][483] ([i915#14544] / [i915#3281]) +6 other tests skip
>    [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html
>    [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>     - shard-rkl:          [SKIP][484] ([i915#4613]) -> [SKIP][485] ([i915#14544] / [i915#4613]) +2 other tests skip
>    [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
>    [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>   * igt@gem_lmem_swapping@verify-ccs:
>     - shard-rkl:          [SKIP][486] ([i915#14544] / [i915#4613]) -> [SKIP][487] ([i915#4613]) +2 other tests skip
>    [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html
>    [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@gem_lmem_swapping@verify-ccs.html
> 
>   * igt@gem_media_vme:
>     - shard-rkl:          [SKIP][488] ([i915#14544] / [i915#284]) -> [SKIP][489] ([i915#284])
>    [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@gem_media_vme.html
>    [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@gem_media_vme.html
> 
>   * igt@gem_partial_pwrite_pread@reads-uncached:
>     - shard-rkl:          [SKIP][490] ([i915#14544] / [i915#3282]) -> [SKIP][491] ([i915#3282]) +2 other tests skip
>    [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html
>    [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@gem_partial_pwrite_pread@reads-uncached.html
> 
>   * igt@gem_pwrite_snooped:
>     - shard-rkl:          [SKIP][492] ([i915#3282]) -> [SKIP][493] ([i915#14544] / [i915#3282]) +1 other test skip
>    [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@gem_pwrite_snooped.html
>    [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@gem_pwrite_snooped.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-rkl:          [TIMEOUT][494] ([i915#12917] / [i915#12964]) -> [SKIP][495] ([i915#14544] / [i915#4270])
>    [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@gem_pxp@protected-raw-src-copy-not-readible.html
>    [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-3:
>     - shard-rkl:          [TIMEOUT][496] ([i915#12917] / [i915#12964]) -> [SKIP][497] ([i915#4270])
>    [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@gem_pxp@reject-modify-context-protection-off-3.html
>    [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-3.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-rkl:          [SKIP][498] ([i915#14544] / [i915#3297]) -> [SKIP][499] ([i915#3297]) +1 other test skip
>    [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html
>    [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-rkl:          [SKIP][500] ([i915#3297]) -> [SKIP][501] ([i915#14544] / [i915#3297]) +2 other tests skip
>    [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@gem_userptr_blits@unsync-overlap.html
>    [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gen9_exec_parse@bb-oversize:
>     - shard-rkl:          [SKIP][502] ([i915#2527]) -> [SKIP][503] ([i915#14544] / [i915#2527]) +1 other test skip
>    [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html
>    [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html
> 
>   * igt@gen9_exec_parse@bb-start-out:
>     - shard-rkl:          [SKIP][504] ([i915#14544] / [i915#2527]) -> [SKIP][505] ([i915#2527])
>    [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html
>    [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@gen9_exec_parse@bb-start-out.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-rkl:          [SKIP][506] ([i915#6412]) -> [SKIP][507] ([i915#14544] / [i915#6412])
>    [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@i915_module_load@resize-bar.html
>    [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-rkl:          [SKIP][508] ([i915#14544] / [i915#6245]) -> [SKIP][509] ([i915#6245])
>    [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@i915_query@hwconfig_table.html
>    [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-rkl:          [SKIP][510] ([i915#5723]) -> [SKIP][511] ([i915#14544] / [i915#5723])
>    [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html
>    [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-rkl:          [SKIP][512] ([i915#7707]) -> [SKIP][513] ([i915#14544] / [i915#7707])
>    [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@intel_hwmon@hwmon-write.html
>    [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-rkl:          [SKIP][514] ([i915#1769] / [i915#3555]) -> [SKIP][515] ([i915#14544])
>    [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>     - shard-rkl:          [SKIP][516] ([i915#5286]) -> [SKIP][517] ([i915#14544]) +4 other tests skip
>    [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>    [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-rkl:          [SKIP][518] ([i915#14544]) -> [SKIP][519] ([i915#5286]) +1 other test skip
>    [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>    [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-rkl:          [SKIP][520] ([i915#3638]) -> [SKIP][521] ([i915#14544]) +5 other tests skip
>    [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html
>    [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
>     - shard-rkl:          [SKIP][522] ([i915#14544]) -> [DMESG-WARN][523] ([i915#12964])
>    [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
>    [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-rkl:          [SKIP][524] ([i915#14544]) -> [SKIP][525] ([i915#3638])
>    [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
>    [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>     - shard-rkl:          [SKIP][526] -> [SKIP][527] ([i915#14544]) +11 other tests skip
>    [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
>    [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_busy@extended-modeset-hang-oldfb:
>     - shard-rkl:          [DMESG-WARN][528] ([i915#12964]) -> [SKIP][529] ([i915#14544]) +1 other test skip
>    [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_busy@extended-modeset-hang-oldfb.html
>    [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_busy@extended-modeset-hang-oldfb.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          [SKIP][530] ([i915#14098] / [i915#6095]) -> [SKIP][531] ([i915#6095]) +1 other test skip
>    [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-b-hdmi-a-2.html
>    [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-rkl:          [SKIP][532] ([i915#12805]) -> [SKIP][533] ([i915#14544])
>    [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>    [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>     - shard-rkl:          [SKIP][534] ([i915#14544]) -> [SKIP][535] ([i915#14098] / [i915#6095]) +5 other tests skip
>    [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
>    [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>     - shard-rkl:          [SKIP][536] ([i915#14098] / [i915#6095]) -> [SKIP][537] ([i915#14544]) +10 other tests skip
>    [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
>    [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          [SKIP][538] ([i915#6095]) -> [SKIP][539] ([i915#14098] / [i915#6095]) +3 other tests skip
>    [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
>    [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-rkl:          [SKIP][540] ([i915#3742]) -> [SKIP][541] ([i915#14544] / [i915#3742])
>    [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@kms_cdclk@mode-transition.html
>    [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-rkl:          [SKIP][542] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][543] ([i915#11151] / [i915#7828]) +5 other tests skip
>    [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio.html
>    [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-2/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm:
>     - shard-rkl:          [SKIP][544] ([i915#11151] / [i915#7828]) -> [SKIP][545] ([i915#11151] / [i915#14544] / [i915#7828]) +4 other tests skip
>    [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
>    [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2:          [FAIL][546] ([i915#7173]) -> [SKIP][547] ([i915#7118] / [i915#9424])
>    [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-11/igt@kms_content_protection@atomic-dpms.html
>    [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-5/igt@kms_content_protection@atomic-dpms.html
>     - shard-snb:          [INCOMPLETE][548] ([i915#8816]) -> [SKIP][549]
>    [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-snb1/igt@kms_content_protection@atomic-dpms.html
>    [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-snb2/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-rkl:          [SKIP][550] ([i915#14544]) -> [SKIP][551] ([i915#3116])
>    [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html
>    [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-rkl:          [SKIP][552] ([i915#7118] / [i915#9424]) -> [SKIP][553] ([i915#14544])
>    [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@kms_content_protection@legacy.html
>    [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          [SKIP][554] ([i915#7118] / [i915#9424]) -> [SKIP][555] ([i915#7118] / [i915#7162] / [i915#9424])
>    [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-1/igt@kms_content_protection@type1.html
>    [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-10/igt@kms_content_protection@type1.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2:          [FAIL][556] ([i915#1339] / [i915#7173]) -> [SKIP][557] ([i915#7118] / [i915#9424])
>    [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-11/igt@kms_content_protection@uevent.html
>    [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-7/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-rkl:          [SKIP][558] ([i915#3555]) -> [SKIP][559] ([i915#14544]) +2 other tests skip
>    [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html
>    [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-rkl:          [SKIP][560] ([i915#14544]) -> [SKIP][561] ([i915#3555]) +1 other test skip
>    [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html
>    [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42:
>     - shard-rkl:          [SKIP][562] ([i915#14544]) -> [FAIL][563] ([i915#13566]) +1 other test fail
>    [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html
>    [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85:
>     - shard-rkl:          [FAIL][564] ([i915#13566]) -> [SKIP][565] ([i915#14544])
>    [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
>    [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-rkl:          [SKIP][566] ([i915#13049]) -> [SKIP][567] ([i915#14544]) +3 other tests skip
>    [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>    [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-rkl:          [SKIP][568] ([i915#11190] / [i915#14544]) -> [SKIP][569] ([i915#4103]) +1 other test skip
>    [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>    [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-rkl:          [SKIP][570] ([i915#14544]) -> [SKIP][571] ([i915#4103])
>    [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>    [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-rkl:          [SKIP][572] ([i915#14544]) -> [SKIP][573] +16 other tests skip
>    [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>    [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-rkl:          [SKIP][574] ([i915#14544]) -> [FAIL][575] ([i915#2346])
>    [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-rkl:          [SKIP][576] ([i915#9067]) -> [SKIP][577] ([i915#14544])
>    [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
>    [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-rkl:          [SKIP][578] ([i915#9723]) -> [SKIP][579] ([i915#14544])
>    [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>    [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-rkl:          [SKIP][580] ([i915#14544]) -> [SKIP][581] ([i915#13748])
>    [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
>    [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-rkl:          [SKIP][582] ([i915#3555] / [i915#3840]) -> [SKIP][583] ([i915#14544])
>    [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats.html
>    [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-rkl:          [SKIP][584] ([i915#3840] / [i915#9053]) -> [SKIP][585] ([i915#14544])
>    [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>    [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-rkl:          [SKIP][586] ([i915#14544] / [i915#1839]) -> [SKIP][587] ([i915#1839])
>    [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_feature_discovery@display-2x.html
>    [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-rkl:          [SKIP][588] ([i915#14544] / [i915#9934]) -> [SKIP][589] ([i915#9934]) +1 other test skip
>    [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check.html
>    [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-rkl:          [SKIP][590] ([i915#9934]) -> [SKIP][591] ([i915#14544] / [i915#9934]) +3 other tests skip
>    [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>    [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-rkl:          [SKIP][592] ([i915#2672] / [i915#3555]) -> [SKIP][593] ([i915#14544] / [i915#3555]) +2 other tests skip
>    [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
>    [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-rkl:          [SKIP][594] ([i915#14544] / [i915#3555]) -> [SKIP][595] ([i915#2672] / [i915#3555]) +2 other tests skip
>    [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
>    [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>     - shard-rkl:          [SKIP][596] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][597] ([i915#1825]) +23 other tests skip
>    [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
>    [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
>     - shard-rkl:          [SKIP][598] ([i915#1825]) -> [SKIP][599] ([i915#14544] / [i915#1849] / [i915#5354]) +27 other tests skip
>    [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
>    [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
>     - shard-dg2:          [SKIP][600] ([i915#3458]) -> [SKIP][601] ([i915#10433] / [i915#3458]) +1 other test skip
>    [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
>    [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
>     - shard-rkl:          [SKIP][602] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][603]
>    [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
>    [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>     - shard-rkl:          [SKIP][604] ([i915#3023]) -> [SKIP][605] ([i915#14544] / [i915#1849] / [i915#5354]) +13 other tests skip
>    [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
>    [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-rkl:          [SKIP][606] ([i915#9766]) -> [SKIP][607] ([i915#14544] / [i915#1849] / [i915#5354])
>    [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>    [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
>     - shard-dg2:          [SKIP][608] ([i915#10433] / [i915#3458]) -> [SKIP][609] ([i915#3458])
>    [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
>    [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
>     - shard-dg1:          [SKIP][610] ([i915#4423]) -> [SKIP][611]
>    [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
>    [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
>     - shard-rkl:          [SKIP][612] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][613] ([i915#3023]) +13 other tests skip
>    [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
>    [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-rkl:          [SKIP][614] ([i915#12388]) -> [SKIP][615] ([i915#12388] / [i915#14544])
>    [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-rkl:          [SKIP][616] ([i915#13522] / [i915#14544]) -> [SKIP][617] ([i915#13522])
>    [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>    [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-rkl:          [SKIP][618] ([i915#14544] / [i915#8152]) -> [SKIP][619]
>    [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-rkl:          [SKIP][620] ([i915#12247]) -> [SKIP][621] ([i915#12247] / [i915#14544] / [i915#8152]) +4 other tests skip
>    [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>    [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
>     - shard-rkl:          [SKIP][622] ([i915#12247] / [i915#14544]) -> [SKIP][623] ([i915#12247])
>    [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html
>    [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
>     - shard-rkl:          [SKIP][624] ([i915#12247] / [i915#14544] / [i915#8152]) -> [SKIP][625] ([i915#12247]) +1 other test skip
>    [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html
>    [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-rkl:          [SKIP][626] ([i915#12247] / [i915#3555]) -> [SKIP][627] ([i915#12247] / [i915#14544] / [i915#3555] / [i915#8152])
>    [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>    [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
>     - shard-rkl:          [SKIP][628] ([i915#12247]) -> [SKIP][629] ([i915#12247] / [i915#14544]) +2 other tests skip
>    [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html
>    [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-rkl:          [SKIP][630] ([i915#14544] / [i915#5354]) -> [SKIP][631] ([i915#5354])
>    [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html
>    [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-rkl:          [SKIP][632] ([i915#14544] / [i915#9685]) -> [SKIP][633] ([i915#9685])
>    [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-rkl:          [FAIL][634] ([i915#9295]) -> [SKIP][635] ([i915#3361])
>    [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html
>    [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-rkl:          [SKIP][636] ([i915#14544] / [i915#9519]) -> [SKIP][637] ([i915#9519])
>    [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-rkl:          [SKIP][638] ([i915#11520] / [i915#14544]) -> [SKIP][639] ([i915#11520]) +5 other tests skip
>    [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
>    [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
>     - shard-rkl:          [SKIP][640] ([i915#11520]) -> [SKIP][641] ([i915#11520] / [i915#14544]) +7 other tests skip
>    [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
>    [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-rkl:          [SKIP][642] ([i915#14544] / [i915#9683]) -> [SKIP][643] ([i915#9683])
>    [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>     - shard-rkl:          [SKIP][644] ([i915#1072] / [i915#9732]) -> [SKIP][645] ([i915#1072] / [i915#14544] / [i915#9732]) +17 other tests skip
>    [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
>    [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@pr-primary-mmap-cpu:
>     - shard-rkl:          [SKIP][646] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][647] ([i915#1072] / [i915#9732]) +14 other tests skip
>    [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_psr@pr-primary-mmap-cpu.html
>    [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_psr@pr-primary-mmap-cpu.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-rkl:          [SKIP][648] ([i915#5289]) -> [SKIP][649] ([i915#14544]) +1 other test skip
>    [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-rkl:          [SKIP][650] ([i915#14544]) -> [SKIP][651] ([i915#5289]) +1 other test skip
>    [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-rkl:          [SKIP][652] ([i915#14544]) -> [SKIP][653] ([i915#9906])
>    [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_vrr@max-min.html
>    [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@kms_vrr@max-min.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-rkl:          [SKIP][654] ([i915#9906]) -> [SKIP][655] ([i915#14544])
>    [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-virtual.html
>    [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-rkl:          [SKIP][656] ([i915#2437]) -> [SKIP][657] ([i915#14544] / [i915#2437])
>    [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-3/igt@kms_writeback@writeback-fb-id.html
>    [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-rkl:          [SKIP][658] ([i915#14544] / [i915#2437] / [i915#9412]) -> [SKIP][659] ([i915#2437] / [i915#9412])
>    [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>    [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@perf@per-context-mode-unprivileged:
>     - shard-rkl:          [SKIP][660] ([i915#2435]) -> [SKIP][661] ([i915#14544] / [i915#2435])
>    [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-2/igt@perf@per-context-mode-unprivileged.html
>    [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-rkl:          [SKIP][662] ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][663] ([i915#3291] / [i915#3708])
>    [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@prime_vgem@basic-read.html
>    [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-7/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-rkl:          [SKIP][664] ([i915#14544] / [i915#3708]) -> [SKIP][665] ([i915#3708])
>    [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-6/igt@prime_vgem@coherency-gtt.html
>    [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-8/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-rkl:          [SKIP][666] ([i915#9917]) -> [SKIP][667] ([i915#14544] / [i915#9917])
>    [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8434/shard-rkl-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
>   [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
>   [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
>   [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
>   [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>   [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
>   [i915#11441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#11808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808
>   [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
>   [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
>   [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>   [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
>   [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
>   [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
>   [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
>   [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>   [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
>   [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
>   [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
>   [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
>   [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
>   [i915#12817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
>   [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
>   [i915#12916]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916
>   [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
>   [i915#12942]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12942
>   [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
>   [i915#12967]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12967
>   [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
>   [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
>   [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
>   [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>   [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
>   [i915#13304]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13304
>   [i915#1339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339
>   [i915#13522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522
>   [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>   [i915#13734]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734
>   [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
>   [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
>   [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
>   [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
>   [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
>   [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
>   [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
>   [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
>   [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
>   [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
>   [i915#14489]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14489
>   [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
>   [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
>   [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
>   [i915#14561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14561
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>   [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
>   [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
>   [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
>   [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
>   [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
>   [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
>   [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
>   [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
>   [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
>   [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
>   [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>   [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>   [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>   [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
>   [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162
>   [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
>   [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
>   [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
>   [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
>   [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
>   [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
>   [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
>   [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
>   [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
>   [i915#8816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8816
>   [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
>   [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
>   [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
>   [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
>   [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
>   [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
>   [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>   [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9738]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
>   [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
>   [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8434 -> IGTPW_13391
> 
>   CI-20190529: 20190529
>   CI_DRM_16788: 94631e6b7f655b1922e3227970cd6180200694af @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13391: 1d93a1416eba3906979781202d25280ca2d7ef9f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8434: 5185b9527673518a418d575c3f58b5554e27f111 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13391/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
