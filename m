Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04649CD98C7
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C5910E356;
	Mon, 15 Jun 2026 10:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hh1w4EK9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F1610E356
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781519975; x=1813055975;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6sYeTWUTXkRCSRIUfPjNHKN7sNRj4KjuO/y6CRDsSi4=;
 b=Hh1w4EK9pBK3qNDzeZFeThyXbkI1KbRzp9rA4Bkhuuv4Yg+8YvXwcAnP
 K9kkkaObbG/q1uPrPFE1cdAUi5F29/UIs/HpHC1OgADAZG/eQo+d9KZID
 wyedia98tuRYZFlj/1Ux66F+GsoAHqXVV254CvKQhYRp87ec/AT4Yl4Nf
 3d6wNJJ/c0DH5Vh9n5tjmLoAhfzDvDN2yO487RbDd79g2v945gvF5cdFi
 N70WE/hvyk+arQlVsSBv1Rc9aab19LGsolRwbk09f3cxqNEuDgQSzmx7v
 PyBggyQgOguXRIGncbrxlEJAI1A21BSKGCdG1QFBjXqy98fklBsvMw87Y w==;
X-CSE-ConnectionGUID: 0/nBZy2bRuaya7evojluEQ==
X-CSE-MsgGUID: CLaqRzRRSkCfE5P8GH5UxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="92575566"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="92575566"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:39:35 -0700
X-CSE-ConnectionGUID: rKp1zOQqTPuZfl6miqm2Uw==
X-CSE-MsgGUID: 66UeFzXwQLCel43qcQs2og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="249331828"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:39:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 03:39:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 03:39:34 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 03:39:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+xprVomHkdzpw3IwU7vP3oIlOGFJeb4hBV00nW1f3a6uezNAtAo+AAOzcz8IqR+LYTpPiIAGM1pg0LV82UXxWWXsCydlhDHfaMXMHnw4sGy7dySUdgwlICmAHoXdhBogI7QqV6qw6AIWqKqPIE8uOlVi7gmsbRG4X6ZVo2B0GEOXTTCydpJAdTwPnuhfR4wYzZ6SZzYehmRVEYdqEXseWVt9IkKT8KEXuWEB3BsI3zzju7r7iUq0VA6LgjkQlB/Xr+fmETi0vcRhlHtyV0dq/BwnCOHTiBykIsziuthfARRLsuqWpeNIsEX8EeouTGZz7rVHPhE5I5nKnZVPQrRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPmtnnblO+UOweIDrbayyHXTUj/nEskknkyazNVEwsg=;
 b=hAPxcEl1K7uGckSrgezzCWGN/0YbuY/u+voh+kunAIXSYvvZGvNLo79uV4Xolg6ZEU8VydyjTIuYDCdoDeE+L3q4fgEaPmj94z620zIz6J4U9gX9h4kAD4kx1dPH1b8m/LtOZi88AYd5QxohhBboRD6BuR6fpKeGPEKDntaiuUl0+RDmZ8UvNUQSIgLv7ots9YcXg2ExejT8XpLPa4/5EGNJkoLYEZyux6aeswS6T1piN9pwotKYC6BFfBnaHVs6K0cchjLqnlOFsSBKDwvjSYwrqqWjF/MFk9ASxjDGfBiNjOPNEfs0c4FzlQa9qCAqH3goLbQSJR0E8Yadqd4Eig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS7PR11MB8827.namprd11.prod.outlook.com (2603:10b6:8:254::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Mon, 15 Jun
 2026 10:39:31 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0092.011; Mon, 15 Jun 2026
 10:39:31 +0000
Date: Mon, 15 Jun 2026 12:39:27 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/xe_debugfs: Add debugfs entry read/write
 validation in root-dir
Message-ID: <20260615103927.sdp7dhfswcjsshnt@intel.com>
References: <20260615043050.603026-1-sobin.thomas@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260615043050.603026-1-sobin.thomas@intel.com>
X-ClientProxiedBy: DB8PR06CA0066.eurprd06.prod.outlook.com
 (2603:10a6:10:120::40) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS7PR11MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: bf732587-5af5-4083-c5f7-08decaca621c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|56012099006|3023799007|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WgPhRM3GBq6VXGQihYl2ZhScICFdzhL4h0ucfkxIUOOFfzFHhcgMfw6o03EqvAiG+KeQYRyGBcHK4WwSHYw/UJynNhgG6hr3JnQlZs8hPjJZvhfOCP0SBw72uQUNt/DexNLXdiZa7Srh+C7TM4kMOth3coLeipPQHZA5of1sMCncuAO1c2/6ZJLvENoc3eiiE+ziFwTgeacetWTn7HQ7kU19P/OT4q6RQXSvaBCOPbSEv80heqf722RNPHipprcJ99rMsrtoUkSHkfKhlsk7p3r5O6w1RkzSesDAmktMSpz2uM7w1DzKW6HukVxoTvjiMBbOOmAqnW3emJEgXe/9+w8vmsELhHYuvxLVOtwAitktSVcmt8uFxpzAnw1YYL/LgYymtVmKAWNHXshq17NONc1ku/ZSh0ZxQwy/UDO0mJPbfKZDf4jRSugefGAC+qVnbdDLcFYFoPwCs+d26YAy001DFPOiUC+TjNGRkCWYMZIPZQRLvBx2Iwy0C8bUMH6kGi//P5lQouASjPrFPidJ0W6KAFOsQ9oOIL3WjIF/v8a9X7oKgbinSGBMDd6fS/ZOvjTrKNJXrDySMmLU0XUu4h9a85/fEvTy9KDX/7nfQaXQtF+vw99P/BtzyX6HKTP0K89HcKjdi/JE9fllfWH2paKYqL72n4G02QyH1qD3q7pTYlHi8bB90DdRdtK+STsv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(3023799007)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDFmWmh4eWY1cks1ajgzRHF0cm42b1QzVTQ2YXRpSmpKWmF6cTh6UVBJMCs4?=
 =?utf-8?B?UGNxb3diaFREMVVVYkFnWjdicDF3RVFITHN4V1B5K0x0QkNJblN1OWlvSTcy?=
 =?utf-8?B?TWdUWHFKWU5LOXlxWlF0ek1sWkJHVU5jWEE2T3FPNUF6d2thVGRDMFdOTUVB?=
 =?utf-8?B?a0RmVnByL1AwZytOeHdIdjN6M1pmYzE3eWJFYU5heWJsOHp1d2ZWekMrVkgw?=
 =?utf-8?B?azBXakVmTVFjQk1UTjh6czFLdDhmc1YxcStEUXF2UmtHRkR5Q016dkpTSTJC?=
 =?utf-8?B?YVRpWWZEcEllcmNuSFk5M1BodGwwWGI4NEc2NlBMWk1iWGViRnNsUlpHaHFP?=
 =?utf-8?B?L2IyeXhZUFhDeDk0NWFObWRpL2xPZm1JamdVWG96ZCtkYWZVTVlyMmFkY3lD?=
 =?utf-8?B?aGVtQ2J5aVJIRDRUNEpFZXF0SzVYVkdUT3N4T004R0YvTmQ5L096c3FEVWh3?=
 =?utf-8?B?M1l5M1dxMWY5RXdEK1U2d0FKanJJeUJVMW9kWE1lVGRtc3JveFhqOEZXcEZT?=
 =?utf-8?B?WGE5TFdyR3k5dHdlaVlRWnlUdXBNMDJLbFFPVloxemIwMTE1Q1FmL21sbk5v?=
 =?utf-8?B?Nmc0TSt3WkNvUjJHNHdwUTRtWVdCNTVvOHhjeHRZZzRLdzJuRkNUa2MvNUdS?=
 =?utf-8?B?dVczQ3ZJYWdIQkV6eDRSSDBERkQ4MDlOT3dEKy9WMGRTZDl5UFcrK0wrTUgw?=
 =?utf-8?B?VlVyWEs4V3JTKzcrVVFEdFhHbHU1Q2hJUUlkSUpPMXJYVm56dmUwUDJxa1Yw?=
 =?utf-8?B?MlMva2t0VjQ0bWc3Y1lIVXRDTkxGWlo5Qmt0S1p2bkFEOHhUTi8wV3ZlQ1hs?=
 =?utf-8?B?UElSc0VaVkRWaHlwN2dkSDRLS3ZGa1JxNHF3SjVPcjZRYXF1WFBiWnZ4cVBK?=
 =?utf-8?B?cVkzZ0FaSWlyQnBSSmJRT1BBbEVUZmlzRDlYVVprVWRvOStCbUlXZjVXNDRw?=
 =?utf-8?B?ZEczUlo3VkZGblNNV2trMGNrbGtSRXk5a3JXSk1acDZOcWVERTA2MUo3UDZk?=
 =?utf-8?B?WnljOGtaeFg1MGQwU0w1T1J6M2Yxekc1MzdDdW1XSGFGc0xPODAxcWFCTFZT?=
 =?utf-8?B?Y0V0T0wzM0ZOSjNLYk1xK3VTN0JBU0l4VTY0bGY0VThKUjZCRE5SSEJnTWN2?=
 =?utf-8?B?eXVneDU1dmRaSUU5UGN5QW5pdmdDNU5tRGY1QlJoYmZnNGYvS1VWcWFsd0Fo?=
 =?utf-8?B?bndzRTlJcE16ZjRCeGlQSktlRVA2QWQ4UTQvblZnQkI4TW5oK2VacGdPa29F?=
 =?utf-8?B?QXl2cVdOM0wvZGZsSDF3ZTZZVk1WVk84bE11d0JHbDd0MXh5OHNKc0V6dVlR?=
 =?utf-8?B?ZU12d0JLbnh0MFFCTzd5bjZsYmhVOVZnVkhwS2tHUXAySTVMUVZNamh0MXR2?=
 =?utf-8?B?YkpBTlgxU3FMbGJDakxiemE2VE9uTElhQ1Q5Y0JTKy9HS3RLM3FkRDRkUUJx?=
 =?utf-8?B?Y1FrT2I3ZS9aV1ZBa29ZKy8vSWJqQURHKy9yVmpPZlQybGkvWXR3akRHQkMw?=
 =?utf-8?B?cTdWNEdXZmMxcWdOc0p3SnRFTy9Yd3JTL3JKQzlCYXVzcDhVcms1TVNMVVVn?=
 =?utf-8?B?NjdMUkFPUFFseFlkRm55Rnpxa2h6MGJjK0N5d0VFcGhDem9sdFdLaHN5QkJB?=
 =?utf-8?B?NnkvcVdYY2hrc3pVZmZRdVhSMnNVZGhEdmFOQVYwOWpKTzVKRzNzbDR2Qm9X?=
 =?utf-8?B?SVE5WUNtL0pObHNqZHJwVmJmMVdPQzRkZXdoS1FYczVVa1pOdTIxNnh3WTFX?=
 =?utf-8?B?M3g2QXplUmdkelNpZTZlMTFUMUFBVEdsRm9xZW5pR3RZUGYrN2QvZzlhSzgw?=
 =?utf-8?B?aTBTenlDWE1lam5JT1ZudUozTyt5RUo3UDZtMXhkMGc0Z016WmlvaGpOeFFw?=
 =?utf-8?B?TWcrTUFCS05lMlV2RXJPaXRrQW41OE5ueS9YVlcvbUdoM2RZbVJuUHdJVisv?=
 =?utf-8?B?Y3p6eEh3ZCtqSCtPUkpUVTcxcnp5WG5vZWdPNDlZSzBsbmMzNGpJSU1MZFdu?=
 =?utf-8?B?bTRNd1lURzhCU0g5YVQ3aVlzeWVMZ0tTeWhLOGF3VU5LckJYbWprWUE2NlJp?=
 =?utf-8?B?cDlMM2plZDZ5TjVMTnNndVVyRkJoTVgzZ3ZpdzBpNVVpN2dVd3lsQXdKTkY2?=
 =?utf-8?B?dzB3akozVk00SUs1UWp0TVR1TFF6aDZqVTJTZnM1elJJUEdwT0hCd01KK2Nt?=
 =?utf-8?B?YWJzL1BQSlVha215MzVqNmRZUVEwVWdmM09TK1hBU1hCSTBMUldqVVlQRmlZ?=
 =?utf-8?B?YnFEU3V3b1pFUHlTQUZmbFE3VjR5K3EyNjZxYWlsNjlJbHZNMlZoRmgwRDls?=
 =?utf-8?B?RkIwOXZEUVhXUUF6bjllZFRJdS9ENjRIZXNCRExMV2k4dS9pY0toNmsyRi9G?=
 =?utf-8?Q?LLjYTBn14V7x181o=3D?=
X-Exchange-RoutingPolicyChecked: L5iNKRrMm1F52w5UNKZY6zLVJzi7i6PtLlb0Uf9HSIwiVz6KexB1l/LApDllFooTIIHViH8EUEOHJl5+k3kbZzBlrpnZhnHIpJ0yGx5lEVr2X74XKi7n1GEeB3stXQQFqRbA+fbkPTGT39MdONLBgVTTcEfRo982vk9clAI2rHZNu2FpqgVN5XaCqPWzyuiOzmQGvppTrA/q6FliDEfIdY+eHTzGJG4yGfaBZ/vkkHr+q7pg1/DDtd2d6Yvb40NfsiFh7QQgXa/DiwKZDxT4oQVsBrBkRhJvcELfKQzfL5IN99DuE3b8jOuUNUeNts+aZ+qKWaldZvCt9P9EkKARcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf732587-5af5-4083-c5f7-08decaca621c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 10:39:31.2874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DpRtEbXHOPykOhKSR+P31DL1xPPQXAymmwmQdmJxxh2aTw4szlDPG5aRo844cwsCpDvxE6BuyicH6MSjJY8T/VyEwrH9MRr4SIsjRD37bbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8827
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

Sobin Thomas <sobin.thomas@intel.com> wrote on pon [2026-cze-15 04:30:50 +0000]:
> Extend the root-dir subtest to validate additional optional Xe debugfs
> entries. Optional entries are those that may not be present on all
> platforms or configurations — their absence is not treated as a failure.
> 
> - dgfx_pkg_residencies: Validate counter reads (non-empty)
> - dgfx_pcie_link_residencies: Validate PCIE LINK string content
> - sriov_info: Validate entry is non-empty
> - workarounds: Validate entry is non-empty
> - atomic_svm_timeslice_ms: Validate integer read/write
> - poor_man_system_atomic_support: Validate boolean read/write
> - disable_late_binding: Validate boolean read/write
> 
> v2: Fixed the optional file check and added fail count.
>     Replaced igt_debug with igt_info in few places  (kamil)
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 198 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 184 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 587e3e785..d92e07092 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -39,11 +39,24 @@ IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
>  	__m && ((__i) = __builtin_ctz(__m), 1);	\
>  	__m &= __m - 1)
>  
> +/* Validation types for debugfs read tests */
> +enum debugfs_validate_type {
> +	VALIDATE_NONE,		/* Just check file exists */
> +	VALIDATE_NON_EMPTY,	/* Just check buffer is not empty */
> +	VALIDATE_CONTAINS_STR,	/* Check buffer contains expected string */
> +	VALIDATE_INT_GE_ZERO,	/* Parse as integer, verify >= 0 */
> +	VALIDATE_BOOL,		/* Check bool value (0 or 1) */
> +};
> +
>  struct check_entry {
>  	const char *name_fmt;
>  	int mode;
> -	bool (*condition)(struct xe_device *xe_dev);
> +	bool optional;
> +	bool (*condition)(struct xe_device *xe_dev, void *params);

I don't see any reason to add parameters to the condition at this point, because we don't use
them anywhere in a useful way

> +	void *cond_params;
>  	unsigned int (*iter_mask)(struct xe_device *xe_dev);
> +	enum debugfs_validate_type validate;
> +	const char *expected_str;
>  };
>  
>  static unsigned int gt_iter_mask(struct xe_device *xe_dev)
> @@ -56,7 +69,7 @@ static unsigned int tile_iter_mask(struct xe_device *xe_dev)
>  	return xe_dev->tile_mask;
>  }
>  
> -static bool has_vram(struct xe_device *xe_dev)
> +static bool has_vram_region(struct xe_device *xe_dev, void *params)
>  {
>  	return xe_dev->has_vram;
>  }
> @@ -131,6 +144,108 @@ static bool find_not_tested_files(int dir_fd, struct igt_list_head *hit_entries)
>  	return found_not_tested;
>  }
>  
> +/* Validate that debugfs buffer is non-empty or contains expected string */
> +static bool validate_string(int dirfd, const char *file_name, const char *expected_str)
> +{
> +	char buf[4096];
> +	int ret = 0;
> +
> +	ret = igt_sysfs_read(dirfd, file_name, buf, sizeof(buf) - 1);
> +	if (ret < 0)
> +		return false;
> +	buf[ret] = '\0';
> +
> +	/* Check for empty buffer */
> +	if (strlen(buf) == 0) {
> +		igt_warn("Empty output from %s\n", file_name);
> +		return false;
> +	}
> +
> +	/* If expecting specific string, verify it's present */
> +	if (expected_str && !strstr(buf, expected_str)) {
> +		igt_warn("Expected '%s' not found in %s\n", expected_str, file_name);
> +		return false;
> +	}
> +
> +	if (expected_str)
> +		igt_debug("Successfully read %s: found '%s'\n", file_name, expected_str);
> +	else
> +		igt_debug("Successfully read %s: %zd bytes\n%s\n", file_name, strlen(buf), buf);
> +

I understand you were supposed to change igt_debug to igt_info

Thanks,
Piotr
> +	return true;
> +}
> +
> +static const char *mode_to_str(int mode)
> +{
> +	switch (mode & O_ACCMODE) {
> +	case O_RDONLY: return "RO";
> +	case O_WRONLY: return "WO";
> +	case O_RDWR:   return "RW";
> +	default:       return "UNKNOWN";
> +	}
> +}
> +
> +static bool validate_bool_file(int dirfd, const char *file_name, int mode)
> +{
> +	int orig_val = 0, read_val = 0, test_val = 0;
> +
> +	if (igt_sysfs_scanf(dirfd, file_name, "%d", &orig_val) != 1 ||
> +	    (orig_val != 0 && orig_val != 1))
> +		return false;
> +
> +	if (mode == O_RDWR) {
> +		test_val = (orig_val == 0) ? 1 : 0;
> +
> +		if (igt_sysfs_printf(dirfd, file_name, "%d", test_val) < 0)
> +			return false;
> +
> +		if (igt_sysfs_scanf(dirfd, file_name, "%d", &read_val) != 1 || read_val != test_val)
> +			return false;
> +
> +		/* Restore original value */
> +		if (igt_sysfs_printf(dirfd, file_name, "%d", orig_val) < 0) {
> +			igt_warn("Failed to restore original value for %s\n", file_name);
> +			return false;
> +		}
> +	}
> +
> +	igt_info("Successfully validated %s bool %s\n", mode_to_str(mode), file_name);
> +	return true;
> +}
> +
> +static bool validate_int_file(int dirfd, const char *file_name, int mode)
> +{
> +	long orig_val = 0, new_val = 0, read_val = 0;
> +
> +	if (igt_sysfs_scanf(dirfd, file_name, "%ld", &orig_val) != 1)
> +		return false;
> +
> +	if (orig_val < 0)
> +		return false;
> +
> +	if (mode == O_RDWR) {
> +		new_val = orig_val + 1;
> +		if (igt_sysfs_printf(dirfd, file_name, "%ld", new_val) < 0)
> +			return false;
> +		if (igt_sysfs_scanf(dirfd, file_name, "%ld", &read_val) != 1)
> +			return false;
> +		if (read_val != new_val)
> +			return false;
> +		/* Restore original value */
> +		if (igt_sysfs_printf(dirfd, file_name, "%ld", orig_val) < 0) {
> +			igt_warn("Failed to restore original value for %s\n", file_name);
> +			return false;
> +		}
> +
> +		igt_info("Successfully validated %s int %s: %ld -> %ld -> %ld\n",
> +			 mode_to_str(mode), file_name, orig_val, new_val, orig_val);
> +	} else {
> +		igt_info("Successfully validated %s int %s: %ld\n",
> +			 mode_to_str(mode), file_name, orig_val);
> +	}
> +	return true;
> +}
> +
>  static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
>  {
>  	int fd = openat(dirfd, file_name, mode);
> @@ -139,10 +254,39 @@ static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
>  		close(fd);
>  		return true;
>  	}
> -
>  	return false;
>  }
>  
> +static bool validate_debugfs_file(int dirfd, const char *file_name, int mode,
> +				  enum debugfs_validate_type validate, const char *expected_str)
> +{
> +	bool result = true;
> +
> +	if (validate == VALIDATE_NONE)
> +		return true;
> +
> +	switch (validate) {
> +	case VALIDATE_NON_EMPTY:
> +		result = validate_string(dirfd, file_name, NULL);
> +		break;
> +	case VALIDATE_CONTAINS_STR:
> +		result = validate_string(dirfd, file_name, expected_str);
> +		break;
> +	case VALIDATE_INT_GE_ZERO:
> +		result = validate_int_file(dirfd, file_name, mode);
> +		break;
> +	case VALIDATE_BOOL:
> +		result = validate_bool_file(dirfd, file_name, mode);
> +		break;
> +	default:
> +		igt_warn("Unknown validate type %d for %s\n", validate, file_name);
> +		result = false;
> +		break;
> +	}
> +
> +	return result;
> +}
> +
>  /*
>   * Return: negative error code on failure, or number of missing files
>   */
> @@ -151,6 +295,7 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
>  {
>  	struct igt_list_head hit_entries;
>  	int missing_count = 0;
> +	int fail_count = 0;
>  	int err = 0;
>  
>  	IGT_INIT_LIST_HEAD(&hit_entries);
> @@ -160,7 +305,7 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
>  		unsigned int mask;
>  		unsigned int j;
>  
> -		if (check->condition && !check->condition(xe_dev))
> +		if (check->condition && !check->condition(xe_dev, check->cond_params))
>  			continue;
>  
>  		if (!check->iter_mask)
> @@ -210,9 +355,20 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
>  			}
>  
>  			if (!file_in_dir_exists(dir_fd, entry->name, check->mode)) {
> -				igt_warn("Missing debugfs file: %s\n", entry->name);
> -				missing_count++;
> +				if (check->optional) {
> +					igt_info("Optional entry %s not found (skipped)\n",
> +						 entry->name);
> +				} else {
> +					igt_info("Missing debugfs file: %s\n",
> +						 entry->name);
> +					missing_count++;
> +				}
> +			} else {
> +				if (!validate_debugfs_file(dir_fd, entry->name, check->mode,
> +							   check->validate, check->expected_str))
> +					fail_count++;
>  			}
> +
>  		}
>  	}
>  
> @@ -229,7 +385,10 @@ out:
>  		}
>  	}
>  
> -	return (err < 0) ? err : missing_count;
> +	if (fail_count || missing_count)
> +		igt_warn("Fails: %d missing debugfs file(s): %d\n", fail_count, missing_count);
> +
> +	return (err < 0) ? err : (missing_count + fail_count);
>  }
>  
>  /**
> @@ -239,14 +398,25 @@ out:
>  static void test_root_dir(struct xe_device *xe_dev)
>  {
>  	const struct check_entry expected_files[] = {
> -		{ "clients", O_RDONLY },
> +		{ "clients", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> +		{ "disable_late_binding", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
>  		{ "forcewake_all", O_WRONLY },
>  		{ "gem_names", O_RDONLY },
> -		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
> -		{ "gtt_mm", O_RDONLY },
> -		{ "info", O_RDONLY },
> -		{ "name", O_RDONLY },
> -		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
> +		{ "gt%u", O_RDONLY, .iter_mask = gt_iter_mask },
> +		{ "gtt_mm", O_RDONLY, },
> +		{ "info", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> +		{ "name", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
> +		{ "poor_man_system_atomic_support", O_RDWR, .optional = true,
> +		  .validate = VALIDATE_BOOL },
> +		{ "dgfx_pkg_residencies", O_RDONLY, .optional = true,
> +		  .validate = VALIDATE_NON_EMPTY },
> +		{ "dgfx_pcie_link_residencies", O_RDONLY, .optional = true,
> +		  .validate = VALIDATE_CONTAINS_STR, .expected_str = "PCIE LINK" },
> +		{ "sriov_info", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
> +		{ "workarounds", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
> +		{ "atomic_svm_timeslice_ms", O_RDWR, .optional = true,
> +		  .validate = VALIDATE_INT_GE_ZERO },
> +		{ "tile%u", O_RDONLY, .iter_mask = tile_iter_mask },
>  	};
>  	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
>  	int missing_count;
> @@ -276,7 +446,7 @@ static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
>  	const struct check_entry expected_files[] = {
>  		{ "ggtt", O_RDONLY },
>  		{ "sa_info", O_RDONLY },
> -		{ "vram_mm", O_RDONLY, has_vram },
> +		{ "vram_mm", O_RDONLY, .condition = has_vram_region, .cond_params = (void *)&tile },
>  	};
>  	int debugfs_fd = igt_debugfs_tile_dir(xe_dev->fd, tile);
>  	int missing_count;
> -- 
> 2.52.0
> 

-- 
