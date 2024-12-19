Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386FAE77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 03:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C850C10E870;
	Thu, 19 Dec 2024 03:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSbh5EjT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B928E10E870
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 03:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734580098; x=1766116098;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g8+NJQONmKZwLRN615GsCWOW73feDGpPNXa30QVY/Hw=;
 b=WSbh5EjTShVe+6+8U0YzRpYP5c9SUGnNnvxN5Sw4e9AEAyb/DDoZnn9m
 FXBuGCpayX3QAdvIFY2HDTHFiXdDojsceGdDqiFT9ZNcTcNks4JL7UFX9
 36R5LfJ01vXFWlTfZr6PK1W1K5oniSgB0wYRJSx3rPEKtTnK699450Fvt
 RAT3fIxQwn4p0wJDFSaM3rvT9GEJa/uY3gGU4F+3xEb0ZMrsIvsJqUVEn
 lmT8B6hFKHjtFkarculip4srnuB2uLhl2bHSrExoxMjinIDjlvzAhSJCC
 B1X2ZSCa1nUnS2BVHI1GXqCtzLpMCJFUEAy3j+eO0Et27mXXZnVtIM8ip Q==;
X-CSE-ConnectionGUID: IQiyBIGzSSO38cQaoLY2PA==
X-CSE-MsgGUID: nDAhtjpoQ8mMzYc0uxuOcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35207495"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="35207495"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 19:48:18 -0800
X-CSE-ConnectionGUID: TPmeVStHQsGnpf89Kx9Oag==
X-CSE-MsgGUID: 3zGpqzwKS/aHHrEbRgNJIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="97901302"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 19:48:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 19:48:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 19:48:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 19:48:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JG9P1kSbO5m1YbZEbaiktcaSsy4hou12Ckn4Iy+4BT/Gz0g3zWoSg4hYja526V4HW4euRrK78N1L5ZyCtFfpLPscPKee7Yauhgp92+yaQcrK3Hmq96YSW4zwSO9wx7W6i6xT9rcTDIZd2uy1bI2Wwczi5lQN8LOibH41F6sh4HQ8NokKeGVx3LUrL9pdQ6ZE3uGrqxERL8AXX7IOcuUX/giaZu+bnSrb3jOqXAlBzyBwRolNWSjUVCAcfm/WL66zORfedRyUXqLaA4gxZmUyAfqt7HOIyMd8uZ+iZr0LW6dCozAi0VdKTqRgp9/2B54P+LcnLZ/IfzIySg+tkMa3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RE6A9uFfEirxplwffY4PK8+TZ9UbBVjIlm5cthwBX7o=;
 b=AKjzNxu6MECa7I/8zNGJAlbA5XR54f4DvXugg+dfXm0cQzH3U9mO9Ruj7OD3gK66CL6EKrBid6X2FBRlCsz9IC/a7MY3g4EGtQMcx8ct5SKHgmLn45y7nkWvPMFI+BxiNSP+KWrb0kL2PWbs4wqEhZb1u2u+GlmE1ury7TYle1NVru+aMTaJN1hat6WTfHIO3WadhOVcI+w4fI2dDoorLpmf9TQB5pgn1oR9lSyLvGX0RDJXlFgzp5zdbn7sPsr2vBqla5VpApZjUlAy72j5mvy7kXx2nxa02XSlOLetBmgIe8ZEKVMiqSwp5AWGluAPn9dvDk+EWSuHKKDUqBUrYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6790.namprd11.prod.outlook.com (2603:10b6:a03:483::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 03:47:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 03:47:47 +0000
Date: Wed, 18 Dec 2024 19:48:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
Message-ID: <Z2OXj5eO+l2kgycr@lstrano-desk.jf.intel.com>
References: <20241217135659.673564-1-pravalika.gurram@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241217135659.673564-1-pravalika.gurram@intel.com>
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a6bb9f-d2da-4227-8077-08dd1fdfe6e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KjN8Zq86PEIGq8W/y36mFBE0nz0WeGFvrZp/HAr6s7S+TpL4yYcQ6jOKLmgJ?=
 =?us-ascii?Q?Nt4c30i/a/kAdk4MQVzdtKB9Mg95uan68a2pURB7FwnDpY8+DgKyK540TFnm?=
 =?us-ascii?Q?3RZGN5RJFufVXuWhBw1z+4e3iekIDRmcCwocIXfU64OxwwauVI8WHNlKJmYH?=
 =?us-ascii?Q?uW9YwTkp8GZ3ZF+5TSs3atxaFRj2mH7oRBe60DBTgt/uLT+XdVC6d2yBt+g2?=
 =?us-ascii?Q?rBtmHLCdo5B4x4PEIw0ENMWxiFC1VjL9a9AakGOnc9KewA9bHGsiS9eKY53J?=
 =?us-ascii?Q?n/7vu+5LLUnLrtNqOLnUPs8GX2qazbKRl92eht9Y6pzLjlwabMD/rO3+V3a8?=
 =?us-ascii?Q?F5VREQnnNFoxMW6H0bZTGy/lIMmfACEWeijuN+nWeuGTjP1V4quICKDjEPSl?=
 =?us-ascii?Q?D30Tx7n8c83P/qay623F8mvQbbZB6LChvFh78Q3h6gWqWs7cijp35RI/sXmq?=
 =?us-ascii?Q?nUSUchp9tbqMaW/OVfG2VlD4zuFKYF2LDoKvIrwWR8rP/hHpA+sUo1d+ffXQ?=
 =?us-ascii?Q?O/5DgcBpDE2/oTY9987YJI3DroN8y+ki4eHFp4ZvfYD23FobQhfL/Tgm9C5B?=
 =?us-ascii?Q?CH/M95/KVp6w8COtxcrbRVpmErXlUBO7IWfsjS8SS8ilmT2YmUzzaWjVsRhW?=
 =?us-ascii?Q?4T3tCNF0xff+OMms21XfgZkdrLqHv0LlBH0yvSxrSh7+WdV+p8X72VXzhaW6?=
 =?us-ascii?Q?/yHml4EnzBTsVcA4cYIEI+lIU5NbQ94RrpZqsvA3+v3yp9rKchEMZ7QR1J0x?=
 =?us-ascii?Q?L9qnjXLZRyvVnn0iVNUwjJuShNzzGY9Jxkkvi9Nig/KFrNPcgjo8PXfSWcEG?=
 =?us-ascii?Q?vy+UI6Zl+QG92UhClp/5V+CSjgBfaTfI1DAg2BVX/3vD483ekbDBnr5uQnR4?=
 =?us-ascii?Q?HxFvWVylySCy5hV8GOjVkNNkjey00inqxfgcpfxK04JdR4SOoCuTwdPDkqxI?=
 =?us-ascii?Q?tJFLcA1peCLCKZpG2TInA6rtIETdUbFetrxAsWEf+NXUkGXi1/fn6TTULkKA?=
 =?us-ascii?Q?0qpkRWW6Oadrpr9KGMAixvRMLwGirOlYSZ+XGh0tw61rVH5zrze53jo4xyup?=
 =?us-ascii?Q?r/Wu7Fco92vGC7HeTrFo2pGCGxo2Sz9uk7fX0Xt+vGAMNOUtO4NGhIR2XYEI?=
 =?us-ascii?Q?3pKfrxlwXR45pdYk/cKbyla1q9y173+3anVtRp8j3//PUtStLWj00v4JSzCV?=
 =?us-ascii?Q?oY5Z+lu2pJ/xUjFlQF9D1Mr3TayfyQ78JTRuy3RDb1CthcEO/kyPyxgjvTFR?=
 =?us-ascii?Q?6h4V7cW9xiiG/TcIlc1sMV+OUTNS8q5xT6grKQm+t6bXOXW7UYbi4ZPNgwtc?=
 =?us-ascii?Q?MM773NbLcWthaeug+Im/lPf6+qn4mlZ9gGYSNNM5XIM/mErQPcMSWWWg6lwe?=
 =?us-ascii?Q?yVWP7fY2dg0gpmFJ+bkdhajImZp4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7cQ67KfBYxfRqkwzscP0/0S2BdVFPUNUbUPnPYkRBCwAmFfV6X7JCf9cvqH4?=
 =?us-ascii?Q?y36Z5erBCa07/VmA1mpqpJFl+RwC2g6/IfVXzCy7vMYs3053iRzhagCSZdNr?=
 =?us-ascii?Q?4z1sKsZvkEYQQcGR4bchoWUbBeWaf1yuqKzFaeXSNvw64Jb71YPXKkqUZ6fQ?=
 =?us-ascii?Q?e1wPMG4UsKevO2ZFCv49xSVE+AJt6+WrExFWVA6HHyDXigva1eQWE+d0FPlQ?=
 =?us-ascii?Q?XNchQ63CiowyezIiBjvW0z6TVErBiIO28bngMR4+R6fmLGyBocGaL8Vwk4yY?=
 =?us-ascii?Q?gWcDwJT26fKADa5zT3wmcKJvCQZOVuEe/2vAS+nFdwZRn+mZhUQPayEzo0Mb?=
 =?us-ascii?Q?Q8S4ErN2THkvNgMIn4osy1edeC50hQpAE22ETqqvqOEbLakpiMLn7Rzrl9lG?=
 =?us-ascii?Q?r6+zzw7MHXuKGFyGgcTqW7mbNRogdALc4Wpk/2Ei0PQ3BkUStDiPt2QPZqbY?=
 =?us-ascii?Q?dRJ6ssVrkF7sucDJjAL7rNOr3yUtBe6P/g6QO8FaXZWY8IIgWZ66Y+90qoUm?=
 =?us-ascii?Q?D3Cqro0E3BknE/ssrJcdbI4xEfcCr7hhmqIq0f3qTnCDn99stbYOyq82adRH?=
 =?us-ascii?Q?msPT2OeVH7GIm4iTjFGCeboCI1QTDIIkxt/ZoPJVifulF2N+/jq1ovs7j9pC?=
 =?us-ascii?Q?ojDwm7CrUb+awfRYMW0ALnH9rpDLjtfd8lebluJ+xUurhOsYaDh/nqe84M2w?=
 =?us-ascii?Q?WMFYMFp1GOofMXYY+2oGG3t5cwBA7wWOJqmOTRM+/w3zcgBIbr7H19QUx1cR?=
 =?us-ascii?Q?sclcR7yoAuuj4uJ6XseSZNrSLsomqpgfipkVNY4L4mygjqhFXdj48qafgMKZ?=
 =?us-ascii?Q?xuBVcHSB56UgA0TDNSTn7l9hxC8iKYEYWgu99ZkVLoWIiJch7hWn0evRCu7e?=
 =?us-ascii?Q?pq+idX+EMhpTHEFGy5aQ84msk9quCPJA3yH34hWkSu7FZfUizl5bg+DcrptE?=
 =?us-ascii?Q?twyNMCkHHnCbyxhKjnYNYVNJpAalS7RKTz7VIQCblfmE9V8mZMjeZV7CtIvT?=
 =?us-ascii?Q?Xx3cEcmz7vL9q3ked/BrZc+ULVnT6BIskBn4uJsJJJJobQSwg8wSUlox37P/?=
 =?us-ascii?Q?pdtclbQuZ78AfT1lsI3qCKhYwTFu0eoordqb3FOB5TLGyjY1CbSzFmnIgBDQ?=
 =?us-ascii?Q?9yCEn3aINTskD1YaqBnJGQp/Gq/vnp5cxpQjdHxh9FbHscrN6C8XntHXzkme?=
 =?us-ascii?Q?5NmUBwrN+CLrU1AHWhS25QbpaC3BnA1+Y+GILDFrMXxKnq8tio6j+vdqug3t?=
 =?us-ascii?Q?fOCUiGfjx40vc1eZQk2Y1iZbJlq5tb6XkTQTZQu5pXi44za4BGxzL6NuZLd5?=
 =?us-ascii?Q?ijm+hf1DdNh/bU7F9k6CulfX4ipgWOYBifX1yhz8Qn4Kkl9G4OFthjZOJFmG?=
 =?us-ascii?Q?iiKYmyEywMZ437W7E/nLWbVy+2haNUJ67Bg/39dnSGClqUe/zIUy9MlKv0/g?=
 =?us-ascii?Q?yAjEQQ1oEbJ9VCqoXucacucw44Bepnid2gn56twUZP2EgHdAlqky+p08WUAu?=
 =?us-ascii?Q?b90Ohhza5hgseVoxMCPazpeNhQSZzcJ+yUchE+TUwTYw+d1qKrEg5gDqSGW3?=
 =?us-ascii?Q?17zW6q95jDny9Fl8m2au7UqHFaQn7AfQazSJKFyE9PUrGm2fV0GuBEvv/iqi?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a6bb9f-d2da-4227-8077-08dd1fdfe6e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 03:47:46.9833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9xWy83ZxOQ5pQuj26pnjki2ebDcyN9TiPHQGt/1y0aK3KiEU9WG9RfiTWVqmapkLszHH914a6pvjpRKUQzeQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6790
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

On Tue, Dec 17, 2024 at 07:26:59PM +0530, Pravalika Gurram wrote:
> Read and dump  below debugfs entries.
> ggtt
> register-save-restore
> workarounds
> default_lrc_rcs
> default_lrc_ccs
> default_lrc_bcs
> default_lrc_vcs
> default_lrc_vecs
> hwconfig"
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_debugfs.c | 46 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 700575031..bcbb5036a 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -162,6 +162,16 @@ test_gt(int fd, int gt_id)
>  		"pat",
>  		"mocs",
>  //		"force_reset"
> +		"ggtt",
> +		"register-save-restore",
> +		"workarounds",
> +		"default_lrc_rcs",
> +		"default_lrc_ccs",
> +		"default_lrc_bcs",
> +		"default_lrc_vcs",
> +		"default_lrc_vecs",
> +		"hwconfig"
> +
>  	};
>  	static const char * const expected_files_uc[] = {
>  		"huc_info",
> @@ -194,6 +204,42 @@ test_gt(int fd, int gt_id)
>  	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>  	igt_debugfs_dump(fd, name);
>  
> +	sprintf(name, "gt%d/ggtt", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/register-save-restore", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/workarounds", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/default_lrc_rcs", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/default_lrc_ccs", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/default_lrc_bcs", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/default_lrc_vecs", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/default_lrc_vcs", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/hwconfig", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
>  	sprintf(name, "gt%d/uc/guc_info", gt_id);
>  	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>  	igt_debugfs_dump(fd, name);
> -- 
> 2.34.1
> 
