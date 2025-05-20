Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AB0C3ABDD
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 15:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C493D10E563;
	Tue, 20 May 2025 15:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MrQ4Xovw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3F610E563
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 15:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747754343; x=1779290343;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iZfINcDP3nK65nTufvV2SeeJsJfoX5mGawLt4LKm9RU=;
 b=MrQ4Xovw5PZIa0/pF2O1IWIVoHLtGBHty9Q3LJRJnTxLCjyskY1H9sK5
 N+Z2gxdrIPQQz40ARltSczCU1ygbeO+ruiBUCpOdtcZJWR0+KuADIr25o
 8u+5fxhgRRcthyfMma3H0O1diec2BLu6kowXQIWXlEjiwVP9byqn6pHCI
 c4iPUX94L9UQhEUFq4QepKZFu8/2rY2JsR3B4If//FMZ9mxJhrtiBU+Ir
 R+SP549cDxlg4QMBje72aMOS78Da8HzLJOXpHBUCgi0gOq2KzgoW4W5oM
 j8nEe9oLNRz1AWeBSivnRtID0BOJjtrK2gHMbrd64COIVDJhtH5dYxl9C A==;
X-CSE-ConnectionGUID: R2S9X04KTI+lqzfp1KPoOQ==
X-CSE-MsgGUID: 5U9gFmTpQESEES9LUdvNaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="61087997"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="61087997"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 08:19:03 -0700
X-CSE-ConnectionGUID: +tNSLp6mSCSx7KNehiS6rA==
X-CSE-MsgGUID: MYt+UwQrSDWAYQlkmCWqsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139570981"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 08:19:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 08:19:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 08:19:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 08:19:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L631gVrB02pryd4xGAsQ9i6sJUb9zNvL1bQevwqZ0x98WpFdJwbMB1hrVH+siDhJkjZSIaIQZs9KJw4bCKukrrKqbdKEA7gF1RsSyujGOj2VNk5MdhKswPk81OU/efridX5uyJf55lTFqOOHZQ7i6sC0OMybzlCuc5OgFDvjmVjcKZHr5t6BBY4EolZ+Eg2fK5pU4bfj6l+TumovheQlArgxq9e8LlhUXoPFpovoMBP0xfPgWRLbm9Ay2fFjJzK7BJtgr4wNueO3C5r3by4tNVq2tbrsMU5HGRGjGXynBrEx2NgsljQfPj4exGlAR7hJ9thaCCcq8gMKMlfHVkhamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyI9KpZ9bbhpNrrRqDDXm50dVBcMOMUnwXBTag+7V1o=;
 b=Khx8qMD5B/Y01qlomoFriKGcZC7PnqjBEXQ71UhmtpCqGGfVblCUUBLd127aqky98U6Ty7PcYAGBm32F7tJQ3QB/haMmSx9SNMnAS7idhNpeb+uMRDx5sHJnQjU5dCV3pv0rZ6lBT5MMxsgL4cLGWIbdcXWPGb+Rbo1oIFydVmyQ/ZXulBq15KYfTGWgjS9X8+a591DBQMgovbm24OUJLl4EkWYYM/CJzfo3r7ifGdMnYOF9jXu8LsUttKxf/S0WaGVHCRzvevQJ+qNccz1gp4ICeuVpDN7wIWoD3XMHwyFoQfIvmB0is8uGwrlKlssxlbaqovWwVMpEVAioJA+QMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB5924.namprd11.prod.outlook.com (2603:10b6:806:23b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 15:18:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 15:18:59 +0000
Date: Tue, 20 May 2025 11:18:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <kamil.konieczny@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v4 0/5] Add test to validate survivability mode
Message-ID: <aCydX97Zzea0mO9n@intel.com>
References: <20250520064910.663022-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520064910.663022-1-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c017a2a-b4d6-4425-3ed1-08dd97b1a4f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+1dsQ6nlOrx6XAa2ma1zFy23/FX40qDfCglf2Lyz2LCixTVig1HDLogpMe?=
 =?iso-8859-1?Q?UisL7RkJs5NssdyzgdvboZwlrCSmasdWrpzDHyj/461+QXFLAnCQnjdlLa?=
 =?iso-8859-1?Q?BTKyDvjxRudc0kOsVGRAKlrzWymHY3j09tojC5DlNZeFYdJQdNj3GAexpU?=
 =?iso-8859-1?Q?Slwapm/ekbXKUBfI0zbULj5a49NY/XVT4Xcba+ZoUHcfylatVzsq4S+7af?=
 =?iso-8859-1?Q?MLzXUyuAjses36Fy32rpwhLHi+dzuB1TjmWNfwKus4nYzM0ednW5QHs7Q+?=
 =?iso-8859-1?Q?qCgP8/xcd7YE15piAC8AC4yZKRlxAGIt/IfbXyZ9/k2loueg7+7rZlfD5m?=
 =?iso-8859-1?Q?OhPA1TShwKe3ukFttwGFvui26U+/hG83jg1WCnRfiZOo77Fzx2PMXRKCX1?=
 =?iso-8859-1?Q?tnbovWZuudeu22ioFQf+XbKj9eBCSyhU/gY0RfSakWpMMyd7AWvwajWnQO?=
 =?iso-8859-1?Q?dk/SaAyhLHJkMjjFGOnEL4MvJSUMMiaMa0lO5aQ6LFiVtWw/bDQip9yPl1?=
 =?iso-8859-1?Q?vJL+7lyc8o4V88oXp9RO5tYs3qJMrRflkaOG2XflPfUdkE4OKyso0xJtGu?=
 =?iso-8859-1?Q?nxqZRGMvXOWf07O8FvSKmOf+vQx3E5pTaDXOB7Z3ar2Gqfps6rZk7JkGAQ?=
 =?iso-8859-1?Q?MV2SD+6+yCy01YccZ2ZMVTTQEVU2xX4Usltk6fET8Fmj+npTjJUVaH6CXL?=
 =?iso-8859-1?Q?+lTtQxh6FU4KHjtgkP5Rt6huZxY7bNWQi3fkBbHaa662vvmVXBBGx8OwZ9?=
 =?iso-8859-1?Q?iSkTEtCsnT3UjTq3QuZGbK93wenDdPswDf1nYFfyl/ZYVvZEP/BORJPaqV?=
 =?iso-8859-1?Q?rNtTeWX3A6jKXX+AVZHpc1tYFBJkYfqZwBx6uyqTOaEtEOOy4uKsNPmtLq?=
 =?iso-8859-1?Q?8z+35qBnVWSrW3LhfCcL+sPo4T7jDLkV4rBZijpyus2sa/zPUXj2xgfHYM?=
 =?iso-8859-1?Q?jMlsIyCJYAIWOjCiiN3W8bj2o3B4ofC7sSX+eLEaZsWHm3jaDKL2c3JI/F?=
 =?iso-8859-1?Q?oR/PpfWKFXZ8kJNU8CgxL4MDebJAHBJs//s//5LrsjSfF0++obZk9uBGmj?=
 =?iso-8859-1?Q?JWQ66c3m+P0Sza2bDnL/RDEJBxKL3K14VYl4PbMOCUZKHygAXZ6wVTIh7V?=
 =?iso-8859-1?Q?etxH4Hy2xgNv1TPKoNOAZi1Uxers9Q46n23NWBcXlQJQN2tCSdTXbFaJAv?=
 =?iso-8859-1?Q?w93UAzOOuUxPxmn3lgj8k/fCL6FzH/94UJxrQHVSAFEfYGlro3PyB3bswQ?=
 =?iso-8859-1?Q?Zg4CTKW4OquFYBOD/rjZdgEK112WHT+GAb9u+J8yt391ymj8n8ZBf91W1m?=
 =?iso-8859-1?Q?cfhzENGk2srFLKuG63KMiSIljOR9cYWO+qbXx3j5M80CRPvRKUc1SbqYrC?=
 =?iso-8859-1?Q?WEhdOgY4IDvBFldXLzVShnyKui5LeTMZg3v2r+KcBiFzX34mEDtagL1sfB?=
 =?iso-8859-1?Q?/UMjzWi0P4su+rrQOEJLW87N9o3yaxcFjszGQLufePfJvrtK6yWYcD9lRy?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wwT8P92eKKkgCztIqmyGT6eloHkGtTsOBrbKT9bW9wgvWKnYzt7HFkXDj2?=
 =?iso-8859-1?Q?r4wqoHhXqezfXEIslhM+of7HrvdrHvQn7sADKiaHh6O4pT87nrEhIT5+nQ?=
 =?iso-8859-1?Q?QQp7/N3Rtx1D4NGXimarSLRIlD5V+VKdVvUDnHPkMVUsxsa93EAKmLpte2?=
 =?iso-8859-1?Q?vJGczijAmnqZuaF1pgzZnAP030Ev1Wn2NNuMVFecGFeyDGuSIEHkoNnuxs?=
 =?iso-8859-1?Q?VE3tHF9ATQ+EnMZk+IuWay5l+EDPflOAcZd7w5DJZ/Rge4VuEbcjJI8hPS?=
 =?iso-8859-1?Q?YUW/rogxA/PcBkrbaLRicfUKsraKJ0BFGN+4JTh5A9X6Knjl9tg+LfCMca?=
 =?iso-8859-1?Q?oU0wBlwRNw3J9s0BX8SknNRuNuw4+HtoCvI9kBRWNbsJp34+M7DTs5aLON?=
 =?iso-8859-1?Q?1PPIwH9lOx9YywmO7sEJDuIN4YNzYnT2KTUnWwvm5qp1W3m1hK257/uenY?=
 =?iso-8859-1?Q?J2nbLwjvsN7acE13BshO4Szfsd6CJ4exHTByzqZqcRJudjoDhYIbOP4Or7?=
 =?iso-8859-1?Q?5IBbWSO4s/TANYTk0H2S/Nz+Ht6Bw25ttT+UpggI9GOOSOT9pjPqWbJXe8?=
 =?iso-8859-1?Q?+YOrkh+c8C4aXFTvdTp5FW63GAsNkQQcPHUBnCA2s0LTdX9D1YfTHYDlns?=
 =?iso-8859-1?Q?9OMFPM3oQMRbl46Gqk3ZP9nhGrdfRgC56Pg84u+EstMwfW5//S5B2F6p1O?=
 =?iso-8859-1?Q?3djFqD/JwYGAbT2jYnb418aRzsmWlk1TXq+S/LJ6vJw7rlTEnwCVFEPK5x?=
 =?iso-8859-1?Q?polhBfmV9mjs+8nAGo2kAdL1pXbcmOLLBvSXhxVrPH9Wv8GsLbJSO10XTm?=
 =?iso-8859-1?Q?bN9ufao0srK0jzzfLF0UrEkJb9fZeMZu/k31Un8spsOEoaOhiJ1BBXHE3h?=
 =?iso-8859-1?Q?hDrqAa4aMLjjUUaQu5K7wMsADof3XsjSUe/FfEqC8WkeLnp5CnzS/TWbdM?=
 =?iso-8859-1?Q?vJ7FPbtkMzUxgksarumH/+dyYOxVzoKLL0Z1dkriODecR++3RSatPFeXaT?=
 =?iso-8859-1?Q?eLXo42jR5tmSW3lzxxAecZFDo947FlxGHkndD2P/FaNeqwekcSv2OaKoDr?=
 =?iso-8859-1?Q?zNBUN8PKcDsS/GeKNqqIZ5h6EjU+AxZVOu+BF8MfjZuVsZkNxr24nHTc5e?=
 =?iso-8859-1?Q?XmG0vywTH6/AZ3s5wY/9LRl1NCeTiqrTTu0GfuB3afO3hp6N7+4G5+W9rI?=
 =?iso-8859-1?Q?7rk9KRrYd3cDY7iS0z4N2ecbn9et+5SXCTJAr2yMWW9p9S5wvKoQRlfJfK?=
 =?iso-8859-1?Q?5fNrDohsXzblZFZ3TeKMM9nUKRxxBxmx+Sz5Lmd04PGRyxXvWuKYaFE41H?=
 =?iso-8859-1?Q?KqxJhiP9Z6tc4pKouhsDFIKmp5wIAKDbG4FBXf1/ym91pc0ZSU3fRuTG6m?=
 =?iso-8859-1?Q?Jui/Du/oP9IMcyliBVAdUlzyEdZqTKi3KMIYGqI3JUJZZdm5hGFvRrv4Zd?=
 =?iso-8859-1?Q?qSmt7BxM98e/jUrZkonTm2eIRtnD+JHVli+7BX3Ot51qQVom7w1e6Zpiwo?=
 =?iso-8859-1?Q?+pmXQWpocrw8zWp4jH/4gslqP3QrymQakSTQuEI1V2s/LsT+AEjhqek7Ue?=
 =?iso-8859-1?Q?42+IS/TNB3xLbf0TVsPfLWOXFJuJ++VsQzVsR6OQjVkF9PQmNX+pdu8QyB?=
 =?iso-8859-1?Q?IXRNeuUzndJyuTH0giH/4oQOsf162U2BFE7g5/+98ES7ctBeRhg3mF0Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c017a2a-b4d6-4425-3ed1-08dd97b1a4f8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 15:18:59.3117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1l/26PbZFq+lPvaStdROgnHeMGuUjPJYBtInnwz6GC9OXCJ3jXxFrSCPWWDXZdcMjib4sgofbMNiHhPrSZztQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5924
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

On Tue, May 20, 2025 at 12:19:05PM +0530, Riana Tauro wrote:
> Add helper functions for configfs and add test to validate
> survivability mode using configfs attribute. This tests unbinds the card,
> sets survivability mode and rebinds the card. 
> 
> The card enters survivability mode if supported.
> 
> Rev3: Fix review comments
> Rev4: rename dir_fd to configfs_device_fd

pushed, thanks!

> 
> José Expósito (2):
>   lib/igt_aux: Move is_mountpoint() to igt_aux
>   lib/igt_configfs: Add helper to mount configfs
> 
> Riana Tauro (3):
>   lib/igt_fs: Rename igt_io to igt_fs to add additional helpers
>   lib/igt_fs: Add helper functions to create and remove directories
>   tests/intel/xe_configfs: Add test to validate survivability mode
> 
>  .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   2 +-
>  lib/igt.h                                     |   1 +
>  lib/igt_aux.c                                 |  31 ++++++
>  lib/igt_aux.h                                 |   2 +
>  lib/igt_configfs.c                            |  86 +++++++++++++++
>  lib/igt_configfs.h                            |  15 +++
>  lib/igt_debugfs.c                             |  29 +----
>  lib/{igt_io.c => igt_fs.c}                    |  61 +++++++++--
>  lib/{igt_io.h => igt_fs.h}                    |   8 +-
>  lib/igt_sysfs.c                               |   2 +-
>  lib/meson.build                               |   3 +-
>  tests/intel/xe_configfs.c                     | 100 ++++++++++++++++++
>  tests/meson.build                             |   1 +
>  tests/msm/msm_mapping.c                       |   2 +-
>  tests/msm/msm_recovery.c                      |   2 +-
>  15 files changed, 303 insertions(+), 42 deletions(-)
>  create mode 100644 lib/igt_configfs.c
>  create mode 100644 lib/igt_configfs.h
>  rename lib/{igt_io.c => igt_fs.c} (68%)
>  rename lib/{igt_io.h => igt_fs.h} (87%)
>  create mode 100644 tests/intel/xe_configfs.c
> 
> -- 
> 2.47.1
> 
