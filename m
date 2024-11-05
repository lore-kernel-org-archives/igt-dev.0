Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3333CD40D08
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 23:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E600F10E04B;
	Tue,  5 Nov 2024 23:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeoyV8ol";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB07510E04B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 23:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730850952; x=1762386952;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zJB0DGgBwMSGBM87nU/o1qDdU0X1YThUEjMtn9b1N5o=;
 b=jeoyV8olgXeAdj45j6r8XZkOPmKcQs1dkJ2Jx8M0RYVrQ+hrEFsoAhtP
 5mK9spshad3UDLgfldGWLlbhDX/Pv5PJkTmycVBSFuxg/h7gbqYgmFYJu
 rob1iX+Nn96G4ZJQewlsE6HimejpxnQtPkAWVL9Gbtr+eU0PTxtW4+6Sf
 WimwIDMLHSy8UHsquVWr5HNqtEPoRb2Ic3bQxJxqcu6uXLLLE692glIPM
 cY7ThcfpNBWmFr1oy393l5SurtOYHw2vmv2FvdU7hg44NIAyj+iicp03o
 sIWtMPxcPEF/pBYt6Iubm8L7V+9N1memyoA/g5OPIxN3hAFfDfFyuR6/Y g==;
X-CSE-ConnectionGUID: 6UHp6L7eSpOl+vwTMcOAfQ==
X-CSE-MsgGUID: 7gQD6tlqQMK0u4msUJ9f4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48090408"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48090408"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 15:55:52 -0800
X-CSE-ConnectionGUID: B81YwJcxTT22he2QFHn7dQ==
X-CSE-MsgGUID: i2h8qbVZQc2giFkUE16A4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="89029862"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 15:55:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 15:55:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 15:55:50 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 15:55:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m29PnhtUGejHVprRdHsbWVNVvmbMCx+YaNqQV3u/l7imEfV1gPy6gJ+kU464guBFKFGEfSUFD2VQ0QXNutTb8ixYXuMzRT9JZ3JzwPsBTjhhi1QNh87Bq81DadVAxxkcUcry4uh6AEsU4DC7VWyKClSsy4PLU3PyAmbxhtAQE/py2l3ROl+LrTSMRJaPsWhPxNrFs+t7C+F/4Qe/CJiuruhbC7I0jeDkQ4+gySgm497TeAKPFoNWOQ+yAC8HxMWlLU/PK5s8DfYuETHiP5+RdsTamKIACiqDz9+M5tk8UQLAZwbJCrElU/kPpZPRPr8in4uhr8StQNknl2TcEg2b4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKw3MSs36ObiV8LgZ+hBOixpajORXpD/9kkq8u6CNVE=;
 b=BXmWUDt6JN+He/1n68nE9GR7z/h673CbfDhqMol3XUbDZWk+ID9NtZfczLy96Lc1k/lD9eWqWc8ohzUCx4/VKQ4twNePGixj8q974vaxGX4DpEIrKInAO3GlUVqJYdy9rE7u+FEDlQvXdZgJeXwJL2Avv+8aIIVcSkaQcWD+GyJQn6YPmBfPd1CBqN1/pAlIjkvk8tHxUcKdOjhpqkQ182iAPcwpKVFbI9WZ51kM+E1TYRPMeaiKMiHxAR4DYJxdTq7VHWPBiq1XCZaJKpG81PWcU9RJqSjKY5DUKYdJQjv9hVeIgKA9tsqZUUaA9UXKW3YhKaS9fFuz+yo0Hg3IgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 23:55:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 23:55:47 +0000
Date: Tue, 5 Nov 2024 15:55:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t 1/4] tests/intel/xe_exec_fault_mode: separate sync data
 and batch buffer
Message-ID: <20241105235544.GN4891@mdroper-desk1.amr.corp.intel.com>
References: <20241030230350.1681757-1-fei.yang@intel.com>
 <20241030230350.1681757-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241030230350.1681757-2-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 33030bef-2031-4d6d-83e8-08dcfdf55e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0Xw0VCWLrZdxz+oYte0TCCewPPboabpg/U5Dp/8rh7z6EbQcsGEwElTrJ011?=
 =?us-ascii?Q?keGsTcyOExZsOiVQiv+5+JPjnoWaZTZKUJfXKZYAIdEL1ZpXJkuUpw9PP1EH?=
 =?us-ascii?Q?moa0nYEZRTJAv0i5xfq6QSgXb+BQJM7nOHGgSu+7f1kZ8SCq5x5gAuN4XGzf?=
 =?us-ascii?Q?EdUobRmbpfPne421OV2d1HBU+gw+x2xYfFbDK5Nlo2sZXM2IhrzYAjlTowAx?=
 =?us-ascii?Q?aoXhzIo+buLd12G/KcB5O5Qpm9Prv2tY+8AUeVO0BFlChVtgzj3G0zpOoxXi?=
 =?us-ascii?Q?FtYiagz52e8lnCJNmfUcXxBTreblqK68ZLHRo8f/yqSbjdM7VJ3WRxKhcTwD?=
 =?us-ascii?Q?vrp7QX1kvH3kxGCJ7P0zFI0MrAgIaFEwq+TD4KTx/4BqXJu9T2QjsFNNgbjq?=
 =?us-ascii?Q?F1E/1DhzA8ezK30uuOt3qIZWElopc/xL0XB3Px4MbvY+fDAcxDKCuPx4Dt+N?=
 =?us-ascii?Q?evdSQ7aMmXpAge3tZkKGunXc0PdMuFk2ZBlKfDFuFyUrMbuJkIB7B7u+7N+T?=
 =?us-ascii?Q?hxTrkYq9STk2UEC2WuYjY5EKS+4po3xp9AXJjcboEXF4Kyjp+FUWqW4jaJdK?=
 =?us-ascii?Q?wr0t2HonRLY5AfEKzHTodrsRgLjaOBgt6lUg8DfX3YurKRE/jsmsfcq5h8zI?=
 =?us-ascii?Q?s0+oXztLv1+bjk+GHaXxcjIRqc2eXVirLpWPdlyGcogj5IGBr4zYH20INkKZ?=
 =?us-ascii?Q?ppmru+cFllLzYDvNVMN8ZvjvDgUK1BdYojnjl9qI/tdXcuv/FOMZq7xMot/S?=
 =?us-ascii?Q?LRREQcQuAev7b7gbWQMruEz7Wgr8JacFd7zXi3boLCd6IREsl7hqoAWEjjFk?=
 =?us-ascii?Q?crIlvXB26OpeYUbwT5nmCJ85CdywnavjNauoJTCHuEfHOrQhbieoLLKIShct?=
 =?us-ascii?Q?j9ELg1ZlzN/95qE0qlWX0XRWkemXWZPUKES9hlCU+H1iUdg92rBgUhIDS4ks?=
 =?us-ascii?Q?OIFnWibUW8WTfak1Wzvu6G6e2m0SD/d4WgToTLouBazVLbU2Vuz0SRsZ8RTu?=
 =?us-ascii?Q?GV8Q3ZBO39938OtQgnkZT3w8M0f7XJaWUac2WcnMCDpGv+v/IdyQCSMCGliO?=
 =?us-ascii?Q?Zy09V5d0LeRumIJmPnwqMb50BBKFHLMpPMYmE1ScYL+UKpKL76zbJLLYJkJL?=
 =?us-ascii?Q?P9qfix2fiMXqxC9GV7AQ0H1ds0dZb3h+xpzwBF5Mpb5oKV/Qivwrp1YhgFEs?=
 =?us-ascii?Q?ZN4WZdA5b2wOKxXTMo6ef6UGtS+7fKdnZJjTSmjmkZ5LMNBjat8f9uq3gKxO?=
 =?us-ascii?Q?BmJhCgFPCTYrU/2vFYtR6mUGpLuIJQtyeD1GV/NN1WeNwyZQ9hljq8NhqwRQ?=
 =?us-ascii?Q?AiT8Z9wKSvMW9DRVzBNQtazo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/WF/EZYxI02wprPfJdOnwS0xGeztXjbesUHt4GMmTn83W9t28RHOWEUtVjeF?=
 =?us-ascii?Q?C7Fks3FDE6Jub3idQzE+gsW9Mdo1Wxu13DC8AGVPgmVK1jLpLcX+YJmLeCdQ?=
 =?us-ascii?Q?EPuZdawViclQft9LUOHGfjWP/VJusLLcj3purtuYjuYGSJ11XewdPTDP5axr?=
 =?us-ascii?Q?M1QVyrXw5BFSjPS1t69Z2bsFdiRXUSkFL9d8fIf/4sb6TvRQIy/l+D3kd+q9?=
 =?us-ascii?Q?HsTK+sAJGIrkJxnN9lu7XrwjZhDgWdoNH8eNuYCpL1l7PjTBD6jCkYa8g4OO?=
 =?us-ascii?Q?Ihlp2sK2eiP00NUfWu7nU+KFoTmSzLlREetNBR5vKEMS95jgi7MaliVrbOw2?=
 =?us-ascii?Q?nE1LCw/JuF6Ln1lFqcOVemmSkMmn1hDdUzE+fzpj+bAsP0hsNpLGr/kShnRT?=
 =?us-ascii?Q?8kQUamCD8wiBTl/eusz90In3dIxb1WioGuRMqNVDJJFYq/WZmIDeEACuZ3vJ?=
 =?us-ascii?Q?m0RbjkaGB3PZqbrDE6k+YV+gZf+enaCL9WvlrE1d4giFzgixZNRpRdCjUWNt?=
 =?us-ascii?Q?c4ew9ZTpT/P1XC3EqqGv+XoWvxINR9BQOKO/IcHfCMUyVtEAgWBpO4KM/Ffq?=
 =?us-ascii?Q?Wa4SnXib9ZLHgyXg9WJCtS4qfSyJOm4kxzvc7dCrYns80fgDBS8th70w28G2?=
 =?us-ascii?Q?lumrGQjj6Pz8a+4KwWkz0mVphDlSn1qroKK11Yn3OdTS2ny2X6gau1PsNjdO?=
 =?us-ascii?Q?VoqAzPMbUELgX3Y5gQVSZnUGDHgAyEFfaCc7ybrb0xF1d6+4z0DBYajOZ+TY?=
 =?us-ascii?Q?sHPj+URtXJP90MLPyQcSh5FcnQ6Zs2wtWT0ZRKA/KI7K4PwhVjQUL/11bo/3?=
 =?us-ascii?Q?xHJCGylQZPa9/Eobkm8SGNpfWApLceJuvC7S7Xa39++MoxNWOZBn/EO8bGu+?=
 =?us-ascii?Q?pU0DFeCiz2Qvu3PGjcH2Pyb53AMaJZ0m2kFPUEugqljfiC74qCjWa4kuTB3s?=
 =?us-ascii?Q?erqGroZppdU91DVD2gKxeAbQe7MNB1OsXDL98wAJ1UocKveq+Pe7wFp0cjHo?=
 =?us-ascii?Q?PDZvAeyHbJIwpHE8UsgCkCV6rKGE5WTWOMYz8IY9mhcULfmMOaU+Ms9hlo+n?=
 =?us-ascii?Q?+bnElbinwNMA7v9RPOE6j6G1R5eJVAuqenEJ0CWQG5ExpxnRaJ5foiiHFxKQ?=
 =?us-ascii?Q?zs0i5+9gfWKSk0gLIDeKyUbZ+mpBuyRYvbCIMsLiTIWzSgHdlvuFlb7CU4fZ?=
 =?us-ascii?Q?SkQgtU/4JvrYiQINNOLdTlsEb1BkZFt6LBCayY9gWIwQAGgNb3ErjOZVhgEL?=
 =?us-ascii?Q?pf5qm0ZbVLL/awSdW9vCMYvUJyTYtb//lXKj2KgUT4IBqz8vNBwYwLddCoPK?=
 =?us-ascii?Q?7/avzNi+xdz1XFB+iEAwVM7a9VINVH9ovGPFyGZv7BtnmJnfVegLgfr951ec?=
 =?us-ascii?Q?hWaK7gSaJcD0s1+jd+YCitXkYd0mOiCa2egao/FueDLr/uNsOgmJ9scOJjAv?=
 =?us-ascii?Q?KgOlB5ttC2qsaB/ssV6i+3znVlVGr2hQb2R/DL78tPOUipJ8Ka2F2pqnd5YK?=
 =?us-ascii?Q?G6d+clPqKMQCDX0JCiNz9aQFerGFqX225UaV9c5EDAuMaqxBzsEvbV9en0mB?=
 =?us-ascii?Q?Y+8dnWWGG5S0wezFk99/Y/avOe8wZzEZf43tteLAXGeEsKDSzcJ9Rpv5ev6R?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33030bef-2031-4d6d-83e8-08dcfdf55e47
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 23:55:47.3189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4Xjph9G0tQvcFkV/7mhZ3rbgcrx52MN2oHFNadprzY7w+ygBidRFRVa38pTs/iSVnjI+t85Qxd6q6XbXMaBVHRqpadKHl1dOJrQZr2BVng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6864
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

On Wed, Oct 30, 2024 at 04:03:47PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> In INVALIDATE cases the test purposely remap the data buffer to a
> different physical location in the midle of execution to exercise the
> page fault handling flow. After the remapping we lose access to the old
> physical location, and that would cause a problem for verifying stored
> data and comparing ufence value at the end of the execution. To fix this
> the data used for synchronization purpose needs to be separated from the
> batch buffer for instructions, and during the execution we remap the
> batch buffer only.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 70 ++++++++++++++++++++++----------
>  1 file changed, 48 insertions(+), 22 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index d416c773b..995517087 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -116,6 +116,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  {
>  	uint32_t vm;
>  	uint64_t addr = 0x1a0000;
> +	uint64_t syncaddr = 0x101a0000;
>  #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  	struct drm_xe_sync sync[1] = {
>  		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> @@ -128,15 +129,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> -	size_t bo_size;
> +	size_t bo_size, sync_size;
>  	uint32_t bo = 0;
>  	struct {
>  		uint32_t batch[16];
>  		uint64_t pad;
> +	} *data;
> +	struct {
>  		uint64_t vm_sync;

I don't think we need to move the vm_sync since that one is just used
for binding.  The first time we use it, we've already finished waiting
on it successfully before the invalidate+race flag combination does the
read, mmap, write operations that could potentially make it lose racing
updates to the 'data' structure.

>  		uint64_t exec_sync;
>  		uint32_t data;

I think we want to keep the 'data' field in the original data structure.
Based on the minimal comments in the test code, it seems like the goal
of this flag combination is to ensure that the batch buffer's write to
this field doesn't cause a GPU fault due to a racing mmap.  If we move
the target of the batchbuffer write to a separate area that isn't
subject to the mmap, then we've lost the coverage this subtest was
trying to provide.

Due to the way we read, remap, write it's possible that we can
potentially lose the 0xc0ffee value written if the timing is just right,
which will fail the assertion at the end of the test to make sure every
0xc0ffee was written.  But I think that assertion is simply unwanted for
the invalidate+race flag combination.  We should probably skip that
final assertion for this specific flag combination since we don't always
expect every single 0xc0ffee write to still be visible at the end of the
test.

As far as I can see, just moving just the exec_sync to the new area
should be sufficient to ensure that we don't wind up waiting forever on
a sync object that was actually already signalled (but that we "missed"
due to an older copy of the data structure being copied into the
re-mmap'd area).


Matt


> -	} *data;
> +	} *syncdata;
>  	int i, j, b;
>  	int map_fd = -1;
>  
> @@ -151,6 +154,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = xe_bb_size(fd, bo_size);
> +	sync_size = sizeof(*syncdata) * n_execs;
> +	sync_size = xe_bb_size(fd, sync_size);
>  
>  	if (flags & USERPTR) {
>  #define	MAP_ADDRESS	0x00007fadeadbe000
> @@ -178,6 +183,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  	memset(data, 0, bo_size);
>  
> +#define SYNCDATA_ADDRESS	0x00007fbdeadbe000
> +	syncdata = mmap((void *)SYNCDATA_ADDRESS, sync_size, PROT_READ | PROT_WRITE,
> +			MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> +	igt_assert(syncdata != MAP_FAILED);
> +	memset(syncdata, 0, sync_size);
> +
>  	for (i = 0; i < n_exec_queues; i++) {
>  		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>  		if (flags & BIND_EXEC_QUEUE)
> @@ -187,7 +198,14 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			bind_exec_queues[i] = 0;
>  	};
>  
> -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	sync[0].addr = to_user_pointer(&syncdata[0].vm_sync);
> +	xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> +				 to_user_pointer(syncdata), syncaddr,
> +				 sync_size, sync, 1);
> +	xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE,
> +			bind_exec_queues[0], NSEC_PER_SEC);
> +	syncdata[0].vm_sync = 0;
> +
>  	if (flags & IMMEDIATE) {
>  		if (bo)
>  			xe_vm_bind_async_flags(fd, vm, bind_exec_queues[0], bo, 0,
> @@ -208,24 +226,24 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  						 bo_size, sync, 1);
>  	}
>  
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +	xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE,
>  		       bind_exec_queues[0], NSEC_PER_SEC);
> -	data[0].vm_sync = 0;
> +	syncdata[0].vm_sync = 0;
>  
>  	if (flags & PREFETCH) {
>  		/* Should move to system memory */
>  		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
>  				     bo_size, sync, 1, 0);
> -		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +		xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE,
>  			       bind_exec_queues[0], NSEC_PER_SEC);
> -		data[0].vm_sync = 0;
> +		syncdata[0].vm_sync = 0;
>  	}
>  
>  	for (i = 0; i < n_execs; i++) {
>  		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>  		uint64_t batch_addr = addr + batch_offset;
> -		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> -		uint64_t sdi_addr = addr + sdi_offset;
> +		uint64_t sdi_offset = (char *)&syncdata[i].data - (char *)syncdata;
> +		uint64_t sdi_addr = syncaddr + sdi_offset;
>  		int e = i % n_exec_queues;
>  
>  		b = 0;
> @@ -239,19 +257,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		data[i].batch[b++] = MI_BATCH_BUFFER_END;
>  		igt_assert(b <= ARRAY_SIZE(data[i].batch));
>  
> -		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> +		sync[0].addr = syncaddr + (char *)&syncdata[i].exec_sync - (char *)syncdata;
>  
>  		exec.exec_queue_id = exec_queues[e];
>  		exec.address = batch_addr;
>  		xe_exec(fd, &exec);
>  
>  		if (flags & REBIND && i + 1 != n_execs) {
> -			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> +			xe_wait_ufence(fd, &syncdata[i].exec_sync, USER_FENCE_VALUE,
>  				       exec_queues[e], NSEC_PER_SEC);
>  			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
>  					   addr, bo_size, NULL, 0);
>  
> -			sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +			sync[0].addr = to_user_pointer(&syncdata[0].vm_sync);
>  			addr += bo_size;
>  			if (bo)
>  				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo,
> @@ -262,9 +280,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  							 to_user_pointer(data),
>  							 addr, bo_size, sync,
>  							 1);
> -			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +			xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE,
>  				       bind_exec_queues[e], NSEC_PER_SEC);
> -			data[0].vm_sync = 0;
> +			syncdata[0].vm_sync = 0;
>  		}
>  
>  		if (flags & INVALIDATE && i + 1 != n_execs) {
> @@ -275,10 +293,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				 * physical memory on next mmap call triggering
>  				 * an invalidate.
>  				 */
> -				xe_wait_ufence(fd, &data[i].exec_sync,
> +				xe_wait_ufence(fd, &syncdata[i].exec_sync,
>  					       USER_FENCE_VALUE, exec_queues[e],
>  					       NSEC_PER_SEC);
> -				igt_assert_eq(data[i].data, 0xc0ffee);
> +				igt_assert_eq(syncdata[i].data, 0xc0ffee);
>  			} else if (i * 2 != n_execs) {
>  				/*
>  				 * We issue 1 mmap which races against running
> @@ -319,17 +337,22 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			int64_t timeout = NSEC_PER_SEC;
>  
>  			if (flags & INVALID_VA && !(flags & ENABLE_SCRATCH))
> -				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> +				igt_assert_eq(__xe_wait_ufence(fd, &syncdata[i].exec_sync, USER_FENCE_VALUE,
>  							       exec_queues[i % n_exec_queues], &timeout), -EIO);
>  			else
> -				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> +				igt_assert_eq(__xe_wait_ufence(fd, &syncdata[i].exec_sync, USER_FENCE_VALUE,
>  							       exec_queues[i % n_exec_queues], &timeout), 0);
>  		}
>  	}
> -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	sync[0].addr = to_user_pointer(&syncdata[0].vm_sync);
>  	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
>  			   sync, 1);
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +	xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE,
> +		       bind_exec_queues[0], NSEC_PER_SEC);
> +	syncdata[0].vm_sync = 0;
> +	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, syncaddr, sync_size,
> +			   sync, 1);
> +	xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE,
>  		       bind_exec_queues[0], NSEC_PER_SEC);
>  
>  	if (flags & INVALID_FAULT) {
> @@ -337,13 +360,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			int ret;
>  			int64_t timeout = NSEC_PER_SEC;
>  
> -			ret = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> +			ret = __xe_wait_ufence(fd, &syncdata[i].exec_sync, USER_FENCE_VALUE,
>  					       exec_queues[i % n_exec_queues], &timeout);
>  			igt_assert(ret == -EIO || ret == 0);
>  		}
>  	} else if (!(flags & INVALID_VA)) {
>  		for (i = j; i < n_execs; i++)
> -			igt_assert_eq(data[i].data, 0xc0ffee);
> +			igt_assert_eq(syncdata[i].data, 0xc0ffee);
>  
>  	}
>  
> @@ -353,12 +376,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
>  	}
>  
> +	munmap(syncdata, sync_size);
> +
>  	if (bo) {
>  		munmap(data, bo_size);
>  		gem_close(fd, bo);
>  	} else if (!(flags & INVALIDATE)) {
>  		free(data);
>  	}
> +
>  	xe_vm_destroy(fd, vm);
>  	if (map_fd != -1)
>  		close(map_fd);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
