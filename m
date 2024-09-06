Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780C0E6FE38
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 17:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83ECB10EABE;
	Fri,  6 Sep 2024 17:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPAtcBGY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814D910EABC
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725645546; x=1757181546;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bPaOo1F+eNO1QSHn6xH1hxi4HW9R35c1KxOVERU+t2g=;
 b=OPAtcBGYs9KKXdUrvsTkgyyOVZQKoMIB9aRHWux404n+GuIkGT8JBRKu
 ONVhUQoD8uGEoRepbunK81axftrmnmnCYlaXPkdHPU+/C30l6gc4GXnEz
 +FyKXfAnNCYGNZGKH+1IiWkNXniKM57Nv5BSDC9TlMkaEtObUn1p7bzgW
 DhyW+nUxgENDDL+cBqVBe9tIC3KjLi2WJRubluMIVu45Dly36u8lSoypV
 6hyUOH86cd6DjIX6CPOwyYI0ibTrOH2SV/I0Zkxa8cS5NlSuxKuC9bkhe
 JKj7HKs/HLhBxSmqWwEz7L32xd+PL6QnnUAXX+S1GIww9TNwBZN046/Ok A==;
X-CSE-ConnectionGUID: n71cssFcQXmGuCuDGofSgQ==
X-CSE-MsgGUID: BFWIlA48RNOcV+g9Phoiqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24567099"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="24567099"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 10:59:04 -0700
X-CSE-ConnectionGUID: RNs0pdWYRE2Dd1UKRwWdnA==
X-CSE-MsgGUID: DyBwntuETZiExJpuXSNsQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="66016143"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 10:59:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 10:59:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 10:59:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 10:59:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 10:59:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yb3pb6Vf2xMjikAosvW0azCiSImIhieV3vxL/WWyuTjR5Byhys4l2jL25RMRcSMXPFDmWBEAKvGF6kw2AMlQ2X65AP4/+psq6OJg7dBPWCLpMloXYn6LHSguznEba8OGM3oUc1ml/UQPIImLnYaaPjj3qVSwKKiKW6XBZu6xewFJEwR3agg9+9ZtoddsLpLxQe0CMeqHXyglAhaMpxMIRfRGeM90THuhw8h7K6SBzXTj88YwCWDDwuVsawYB2fJDnffpkmi0SDiO2dtFTtzTmorYpctyxRnYiLbNnbeAUL758yYVxjXlxmxD0mrDfnxdBWu+FuKJJQeWw22zijBLHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzAkJb4wEtKkEhqFLkKDT5lzpEqgkM1dDg74OVslBkA=;
 b=EOWbAN1IyR+AehHcEm6ZoSHl4HLZXXFeisg9QgnngPyPNOwCwUT7Yw0LV9DLychLpfa/58dDkRVSbpgtB0StpDC0uCQ/tYA4oEBl7xa6ve9AK2RgZp5VvQUmsC8NIGeZa3j/gvcef1lSKYPJ52RDmnIcm1f8Smci4Hpm9f+yMzSTrqaMtJ5CVj1nB5SNdcuEhGiIX8Y203NoOhvHgMPIl78YyGpPi5nF2Vnd/VJLlP0mo3gSi0tEyE9tizj/Ki+yN06/ZiaN/3GWTlYqqZUNhgpLocH8yZdVsfRJCwwDHoaIHkBI3b9yNTmtfuqvG5m5bnrAQYxNvmzMcBXuBTr3ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7344.namprd11.prod.outlook.com (2603:10b6:208:423::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 17:58:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 17:58:59 +0000
Date: Fri, 6 Sep 2024 17:56:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_drm_fdinfo: Wire up
 parallel/virtual submission
Message-ID: <ZttCa6mrfuBa109s@DUT025-TGLU.fm.intel.com>
References: <20240904225746.2857448-1-lucas.demarchi@intel.com>
 <20240904225746.2857448-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240904225746.2857448-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: f13f171d-1ad5-4aea-c7f9-08dcce9d958a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nSfeDJ8ED46cRSm4ImZqQCYrwW5xEe59HKeHJW0bFw1vpskHpXJOuDPfTVD/?=
 =?us-ascii?Q?U40OA8RHh86lltQg2cxeX1uzhw+LZ+xe3naLjHr02DtPujUOl/5mSaH5XzU1?=
 =?us-ascii?Q?cbzWeSmlwmlKHa6cuBQAMq+os0KR1cDK1/Upw21pIlg5e24HTdu++qeoGznk?=
 =?us-ascii?Q?aG2CmqIXEEP5Y2boONalpilMysQ+YM+QL7zggOsHFRGtNP8xII0iMwnQBjZ1?=
 =?us-ascii?Q?O9uGdkytLWmhtRODIjkZmy9fGbH7LsFZo+L8i+HZ/zgwXkWo7hqgyAkPF76+?=
 =?us-ascii?Q?vocRH79mI2B/QoCWdS6iTNKqUwCma32PSEaCBYRYxlDi/UYgcRogg7dpxY3+?=
 =?us-ascii?Q?G8IRi3h5f2nFD/Wu0uWyN/lGGpfe89pbG5Gk/zZqZg481iODM/WaXlTas3iS?=
 =?us-ascii?Q?/HE/sSrXB96Cri864/5XTmCkAUIEDeObb4epr+r5cEafInTtZNgKAGTdNynY?=
 =?us-ascii?Q?MS7MvktHGxTekcZxOZrCQmh9l513YN1n3ZtJ80yeEOKweKtCnZTYLakxzOON?=
 =?us-ascii?Q?WwnkHjXF+gnu0+PXPUgSZj/xIQWJObfrUeHb1oiPigSmuiLQTmlV2SGDCqsF?=
 =?us-ascii?Q?ACIub5gOwwvDLgf9j90WH+Efmchyi/MWDATdAciBHNBkGIQ3zGeg7HAE+dFy?=
 =?us-ascii?Q?/NzucqJu/8CJZHGbyIrbCY83c0sfgPytRJy5HkqwLIW52sMebXe50krZfjF7?=
 =?us-ascii?Q?MxcRd2YCsjtI+ahnmqTNikC235zqcMeKLzSSwy6kGadYp0aKObsNzU8NTHVW?=
 =?us-ascii?Q?GDsbwjp2JZkaZQV45RwbqL+BAEIBMd8eefn3oZ6Rh3KjkVhZoCOsgpPNhAyF?=
 =?us-ascii?Q?abLloH0TRdLop/mJ0RCn0qaO/LnYqyiHlm/LNrJBoib8cuWITDWgg+Kl2aaG?=
 =?us-ascii?Q?AnHmIRNP9A9QnzTc7ENNvPmDmjuZR8jJZRLz1RSg8la/4YEq759eVw/BrFx8?=
 =?us-ascii?Q?12HGDbCfBJXbcxid4hQHCLbG0EU4n3heyi4TtbLxMkz3jhoQJ+Iqg53p2sl9?=
 =?us-ascii?Q?CbzJe9vIEkBtpgAqrWiO1veJOQwxzqkSi5ufmw6ZGdkJzpeI9T/0tQTyMYNk?=
 =?us-ascii?Q?aP66+YDnDR3KEo8GAF/wnWS9jtFXsWdb4KqkvZYJp9T0zmsP4YsE91VHtWZa?=
 =?us-ascii?Q?Xoda7KmTD1Ez4qD9OhrWf8FNqfFCg76eN0Lr/JBld4XavodWSTtqeiBX+2q+?=
 =?us-ascii?Q?Ic9N7/Au99p+WIPoUN1jZqDKqqCElj0jTuQJzEtYE8DMF8slGG56RK3FzuyB?=
 =?us-ascii?Q?xvh8STC/M61liUALHpdYHckkmWb0QEHmvMYaDAyq5UO5upCOQGR/Se25Z81M?=
 =?us-ascii?Q?02Emt0P1pjGq6PUWx0nOIyY4X0eQapj6NWprtkwDX/sadQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dgQwYBPbUY9IlOffnPGhLm6dQcPAmyFvEe3AHcqlEGkTx+jrpfSaZuEw5ebz?=
 =?us-ascii?Q?lqmk/Q3ak5bP1V/OnsU2VQg5HIATah6IRb/fabUQXWLAAbV6/xUmfzJQdJzZ?=
 =?us-ascii?Q?8x3lswZYu3wjMdEEDqoLUS7HolhV/T4ERefXD5OE5ZZTE5E3GBakMw1QSGqU?=
 =?us-ascii?Q?Mh46lUk3MK3p82Fg03k/eXfAZKFgaygc6rGM8DvjeJ79vHNBzE8ghfIgJ483?=
 =?us-ascii?Q?hiyeVqhmIc9nHE/4vG5Hv3Fs1ueYdUGUN/xwBRp5UbREgUCGs2DwoOqDumh1?=
 =?us-ascii?Q?mtR4FUZVa9tJ1ru+vHeQeMpbxYpxhChO1Ln4wU+LdM8nmDp9rhA0Ys1EEu13?=
 =?us-ascii?Q?niiMnNSobA1qsAD5tk2oGnXCrpoxw/WPodqdRxqjOlZwWHz/cZKCdTCiXLjc?=
 =?us-ascii?Q?5hj5SaY0Nhd98iEgjjik8jYG17O2ZKMZfWxJzglf1yQhd9oGXu42gwZIv0v0?=
 =?us-ascii?Q?OgQZenW+PVBlHiPVOTNM3OE6ZPnMo3PtptE96/vn5jWxgkag357/AWVIVPqY?=
 =?us-ascii?Q?R8luNguB5DeNy5D1q8aZ5mWPQ9uEgQ95aIr3h5q4ZJbT52bd8iIxw5l82ZU1?=
 =?us-ascii?Q?2hd7fAAg+VJ4YePfDQEO1oW46CRz5V0qO7TvmauLMgasf6ANBnpVauXR9AMn?=
 =?us-ascii?Q?R7gB1V9dEEHF8jfgPPKZ34zS2E/Lex88j35B3qAbkJBoHhpw1NZCbfC8Q4iD?=
 =?us-ascii?Q?wci8wtTt9btEXavsKhHTfNh7EmXwuHhHEFVD3V/QBS6Um4EmLEisOkC6EGWm?=
 =?us-ascii?Q?ojwvEyvLN4Bf0MgudG87/PUmi42gNRg/7hvUUi52X0shg+7qY01KzZjakVdT?=
 =?us-ascii?Q?cjpjB9qt5zdqgjZ7PWZvYjHVUjgnFdv+1W5Co7sSsR83diiCK+ILYgcnKZYz?=
 =?us-ascii?Q?C5lC/PHj13Woni4R0qhrbC8QTNaZBGAxCBEYe73jqlZDxMxJOcz2W6j1zwLF?=
 =?us-ascii?Q?Fm5yaOTxtcSbfpP0ODt1nsk+/S41eIF9Tk3JUe/3gvj9ktD1w3cjraHolaed?=
 =?us-ascii?Q?oAHnZIQn4bFEyEY0h4sRZQE9sYGhRhWGTbc7DAkVHXAGulu5XhjglQ3FDyoM?=
 =?us-ascii?Q?+OuPDAS0FsVmrVV9ykgX+yVqh8cT3jCo2c/AeRyKDSYHZqlVFWifSi8sRl9M?=
 =?us-ascii?Q?akpKCGKsZx2OPczjWonMqEdV50v9RmPES111QVIzNdTCp69kpocoeYQt/+T5?=
 =?us-ascii?Q?CgkZ9Uh1d+XI484McoZSQnqB2H1ochDEH0QcQVya0RxbH7hgDalrgQnRQuBP?=
 =?us-ascii?Q?7VZYmgPgTog9sgCUU9CY1r9lQAhD0mH8hjTyYkFhZoizUtrHyK8ZFUONfx1m?=
 =?us-ascii?Q?AFTizsX7bL6+v2H1M2rJqpBlNS1WaeoK9WwCYIAj0pPp6+jaoiM82OPWeWa7?=
 =?us-ascii?Q?cQtesiqRfbeZE9S4F21sqMATjCZMv1EH+N0kkOkC+lP9S7HP2RxH19kklGcj?=
 =?us-ascii?Q?I9Yw1M342mqqwQ6teQfJo8LyxDjTVFBoMMkAy/XaIdzoUoTARgvYa3V6wP/Z?=
 =?us-ascii?Q?Vz4Ob9MZRsCo7YqNnP4ufKfoqkF8MLu6slvGn235rIxRBehx7bvzuwYyxFY5?=
 =?us-ascii?Q?eQ///xGwRO6RzbQPK7t4sImGkpzVXK9zdaB2cDdN8g9Up5y7nA73/tlzOATG?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f13f171d-1ad5-4aea-c7f9-08dcce9d958a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 17:58:59.5181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlHFJxpCMj4pEipyE5HRVIKaOuYR0HoZGhXQpJDlpDJXfLv06oDYxiazffQ4hqfeJSXLzqrPNCbNyY4PeVCnSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7344
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

On Wed, Sep 04, 2024 at 03:57:45PM -0700, Lucas De Marchi wrote:
> Add the boiler plate code for parallel and virtual submission in the
> spin_ctx_* and check_results(). This is based on previous code by Umesh
> that got simplified before applying.
> 
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_drm_fdinfo.c | 61 ++++++++++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 21 deletions(-)
> 
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index d1ed0fcaa..8acb95040 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -365,7 +365,7 @@ static void basic_engine_utilization(int xe)
>  
>  struct spin_ctx {
>  	uint32_t vm;
> -	uint64_t addr;
> +	uint64_t addr[XE_MAX_ENGINE_INSTANCE];
>  	struct drm_xe_sync sync[2];
>  	struct drm_xe_exec exec;
>  	uint32_t exec_queue;
> @@ -375,18 +375,29 @@ struct spin_ctx {
>  	struct xe_spin_opts spin_opts;
>  	bool ended;
>  	uint16_t class;
> +	uint16_t width;
> +	uint16_t num_placements;
>  };
>  
>  static struct spin_ctx *
> -spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm)
> +spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
> +	      uint16_t width, uint16_t num_placements)
>  {
>  	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
>  
> +	igt_assert(width && num_placements &&
> +		   (width == 1 || num_placements == 1));
> +	igt_assert_lt(width, XE_MAX_ENGINE_INSTANCE);
> +
>  	ctx->class = hwe->engine_class;
> +	ctx->width = width;
> +	ctx->num_placements = num_placements;
>  	ctx->vm = vm;
> -	ctx->addr = 0x100000 + 0x100000 * hwe->engine_class;
>  
> -	ctx->exec.num_batch_buffer = 1;
> +	for (unsigned int i = 0; i < width; i++)
> +		ctx->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;
> +
> +	ctx->exec.num_batch_buffer = width;
>  	ctx->exec.num_syncs = 2;
>  	ctx->exec.syncs = to_user_pointer(ctx->sync);
>  
> @@ -405,10 +416,10 @@ spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm)
>  			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
>  
> -	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, 1, 1,
> +	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
>  					     hwe, 0, &ctx->exec_queue), 0);
>  
> -	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr, ctx->bo_size,
> +	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
>  			 ctx->sync, 1);
>  
>  	return ctx;
> @@ -420,7 +431,7 @@ spin_sync_start(int fd, struct spin_ctx *ctx)
>  	if (!ctx)
>  		return;
>  
> -	ctx->spin_opts.addr = ctx->addr;
> +	ctx->spin_opts.addr = ctx->addr[0];
>  	ctx->spin_opts.write_timestamp = true;
>  	ctx->spin_opts.preempt = true;
>  	xe_spin_init(ctx->spin, &ctx->spin_opts);
> @@ -429,7 +440,12 @@ spin_sync_start(int fd, struct spin_ctx *ctx)
>  	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>  
>  	ctx->exec.exec_queue_id = ctx->exec_queue;
> -	ctx->exec.address = ctx->addr;
> +
> +	if (ctx->width > 1)
> +		ctx->exec.address = to_user_pointer(ctx->addr);
> +	else
> +		ctx->exec.address = ctx->addr[0];
> +
>  	xe_exec(fd, &ctx->exec);
>  
>  	xe_spin_wait_started(ctx->spin);
> @@ -450,7 +466,7 @@ spin_sync_end(int fd, struct spin_ctx *ctx)
>  	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>  
>  	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> -	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr, ctx->bo_size, ctx->sync, 1);
> +	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
>  	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>  
>  	ctx->ended = true;
> @@ -476,7 +492,7 @@ spin_ctx_destroy(int fd, struct spin_ctx *ctx)
>  
>  static void
>  check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
> -	      int class, enum expected_load expected_load)
> +	      int class, int width, enum expected_load expected_load)
>  {
>  	double percent;
>  	u64 den, num;
> @@ -490,6 +506,9 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>  	den = s2[class].total_cycles - s1[class].total_cycles;
>  	percent = (num * 100.0) / (den + 1);
>  
> +	/* for parallel submission scale the busyness with width */
> +	percent /= width;

This doesn't look right. Wouldn't a width submission be busier?

Maybe I'm confusing myself but everything else LGTM.

Matt

> +
>  	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>  
>  	switch (expected_load) {
> @@ -522,7 +541,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  	if (flags & TEST_BUSY) {
> -		ctx = spin_ctx_init(fd, hwe, vm);
> +		ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
>  		spin_sync_start(fd, ctx);
>  	}
>  
> @@ -540,14 +559,14 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>  
>  	expected_load = flags & TEST_BUSY ?
>  	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
> -	check_results(pceu1[0], pceu2[0], hwe->engine_class, expected_load);
> +	check_results(pceu1[0], pceu2[0], hwe->engine_class, 1, expected_load);
>  
>  	if (flags & TEST_ISOLATION) {
>  		/*
>  		 * Load from one client shouldn't spill on another,
>  		 * so check for idle
>  		 */
> -		check_results(pceu1[1], pceu2[1], hwe->engine_class, EXPECTED_LOAD_IDLE);
> +		check_results(pceu1[1], pceu2[1], hwe->engine_class, 1, EXPECTED_LOAD_IDLE);
>  		close(new_fd);
>  	}
>  
> @@ -565,7 +584,7 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
>  	uint32_t vm;
>  
>  	vm = xe_vm_create(fd, 0, 0);
> -	ctx = spin_ctx_init(fd, hwe, vm);
> +	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
>  	spin_sync_start(fd, ctx);
>  
>  	read_engine_cycles(fd, pceu1);
> @@ -579,7 +598,7 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
>  
>  	xe_vm_destroy(fd, vm);
>  
> -	check_results(pceu1, pceu2, hwe->engine_class, EXPECTED_LOAD_FULL);
> +	check_results(pceu1, pceu2, hwe->engine_class, 1, EXPECTED_LOAD_FULL);
>  }
>  
>  static void
> @@ -593,7 +612,7 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  
> -	ctx = spin_ctx_init(fd, hwe, vm);
> +	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
>  	spin_sync_start(fd, ctx);
>  
>  	read_engine_cycles(fd, pceu1);
> @@ -605,7 +624,7 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
>  		enum expected_load expected_load = hwe->engine_class != class ?
>  			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
>  
> -		check_results(pceu1, pceu2, class, expected_load);
> +		check_results(pceu1, pceu2, class, 1, expected_load);
>  	}
>  
>  	spin_sync_end(fd, ctx);
> @@ -632,7 +651,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
>  		if (_class == hwe->engine_class || ctx[_class])
>  			continue;
>  
> -		ctx[_class] = spin_ctx_init(fd, _hwe, vm);
> +		ctx[_class] = spin_ctx_init(fd, _hwe, vm, 1, 1);
>  		spin_sync_start(fd, ctx[_class]);
>  	}
>  
> @@ -649,7 +668,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
>  		if (!ctx[class])
>  			continue;
>  
> -		check_results(pceu1, pceu2, class, expected_load);
> +		check_results(pceu1, pceu2, class, 1, expected_load);
>  		spin_sync_end(fd, ctx[class]);
>  		spin_ctx_destroy(fd, ctx[class]);
>  	}
> @@ -675,7 +694,7 @@ utilization_all_full_load(int fd)
>  		if (ctx[class])
>  			continue;
>  
> -		ctx[class] = spin_ctx_init(fd, hwe, vm);
> +		ctx[class] = spin_ctx_init(fd, hwe, vm, 1, 1);
>  		spin_sync_start(fd, ctx[class]);
>  	}
>  
> @@ -689,7 +708,7 @@ utilization_all_full_load(int fd)
>  		if (!ctx[class])
>  			continue;
>  
> -		check_results(pceu1, pceu2, class, EXPECTED_LOAD_FULL);
> +		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
>  		spin_sync_end(fd, ctx[class]);
>  		spin_ctx_destroy(fd, ctx[class]);
>  	}
> -- 
> 2.43.0
> 
