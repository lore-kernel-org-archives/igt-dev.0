Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD08C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 16:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABA510E2E4;
	Wed, 22 May 2024 16:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDQJx/9s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FE510E2E4
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394299; x=1747930299;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6w0JYRkd1zxtP4C35mIQob5UkiLbiVPpCH7YmuPs7sE=;
 b=RDQJx/9segqS0IcdnV3ZOhyv4fy9LAX+azG4/g6Wg2uzz5H+Ov5YA71W
 X03xas6Q4lgkKoPl0Sg5kVsjgPM4fs8ncZM8SBTbr2fLFzikImMSEI9G1
 slWjpA6bLgLjfJxaQ//SIUIlMqwfVVBzkxn+QL4u+qQQ3eOq92sXbSSCF
 rZ5LQqHs8A+V0wGYLPYhxnXrWbLt8LDmpann5+QzIxUiVSwjPSWFSf2XD
 +RvmcTnJGVE1s79Hk4ocJ5ndNN4Hmo4yCvlYkU9pw0FStRsPWcwWKxLcG
 wvj+5BRAuaiX1JVVG5zYNzFGY+mkRWNlcDnJyiw2f5YVZVU57lN0Mxge5 w==;
X-CSE-ConnectionGUID: XGfdM62mQn+VLH5WR1R1WQ==
X-CSE-MsgGUID: leBYb0RkQMeiWaGn/U8G+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="24063432"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="24063432"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:11:38 -0700
X-CSE-ConnectionGUID: sbL5S8ocQCW62PHw8AgWsA==
X-CSE-MsgGUID: ryNEljdFQ0yhY19pu/ZpmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33334804"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:11:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:11:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:11:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:11:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:11:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RChq+wIpGoOPPW3BAMbDxxHKC6JuDOL3Y4jgLaa4fNalarWRdW+JaD+kRUeQRtqh0t74cJPoVqa7g46X7bbYllE4AzRlbhpUFpzxv8e7RZWc3CO+58rTGhbBJo2PSn2QwRvJfjKm+trba2PMExLSePKnK94Li5zqJ7VDaEku9CsNPmyG2pCtshTfcNiHqJJjbdkYyJA1ja2IESH20wh2cbwyy9Dtycde7OKgnVbA5Xhg3XGOGx5vbd7blsHXJX8YRwK9mSQuYNoxHJ6QQOGJHCzjJHNTiXTBU86dK4GqhBvCDNPAZbHQ/Km+ov4YwqlVTNHEMCaoXKH3qbjjTLxc4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iz9AcRws2pdo/VfGtIUntHqfTGx0GeKanDWtFWsHuEw=;
 b=k/2MIjGmtfJx031pgs923ub+/6nWICz0IRn0j0Duglwrb2oJi4vvLQnkzOt8vvAYDFaOEfdF98czjcpNLqkswC01OnlXMy3nidop0fcDxeLNf5++GD177MtoPFhldQnpBMQQiRJ0YkDahpnE8unLdZ3bl0eqI1Jjem/30kS4b4FQDmQEFxkyeAHPlhp7AMXXBu/zSY7pLlNpRcmBJBjqvKGza5AA2dRVI0+Z/LFqomiwwMaOwm9qKw3/tmyIsb9iSpU/FFINI61miityMj8E5WegpG1Pc4r9Nmr3MsW2v47+Kk8v9XiWvh0ob6oiqyNzz78PZvh+z4VrDotY9abbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8474.namprd11.prod.outlook.com (2603:10b6:806:3ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 16:11:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:11:28 +0000
Date: Wed, 22 May 2024 12:11:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 05/10] lib: sync i915_pciids.h with kernel commit
 aa3d586e1624
Message-ID: <Zk4ZK6LkgF2FCmLN@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
 <797d91530e671719fc5aa311ff9f5920ee0df67d.1716373923.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <797d91530e671719fc5aa311ff9f5920ee0df67d.1716373923.git.jani.nikula@intel.com>
X-ClientProxiedBy: BY5PR16CA0018.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: e6baf616-41fc-42c9-08ed-08dc7a79d5e0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DBfL1wfLpkj54fv4CSeRtJddT/TdyyJ955J6Xht0TSNWo2pC2GXVbZDAcEhD?=
 =?us-ascii?Q?yFNQ6T08dAbGGnu++xNz0FmaHnGZhBzY4guxCz8VavVvlNS76Att0rYrB+43?=
 =?us-ascii?Q?AdYWBohiPtnINqgsetSmuYqKu9PMEKz6BHytG7BWKZ3j0/dY4pg1RC1+OPiX?=
 =?us-ascii?Q?3P/WJ8UDpD0fVNFEpwbRoHjhMxcnVfGs0OJWzhR9rvpT7Q0H+bwn/OYSC2h6?=
 =?us-ascii?Q?2YIYKbZkDe32VZ5vUFkONr86loSLfiNlnKRJi79a/mhNh959HCMsqLeAytVG?=
 =?us-ascii?Q?IJuNE1sB5bdEOA1ekqs7CwHENszA5O5X5dmuZwpLt7A4u8nHWUCN/0RSoSM3?=
 =?us-ascii?Q?lgv/3ARfNO6gcXmRghyU1Rehlg+eseN7TFqNzVmba+ZUJfhjDef3HGK2j94k?=
 =?us-ascii?Q?R/sIVtfnurztQV7Wc4m77WdOySjAFBapseCbm9Bk9KU356mZjo983AXVY6eX?=
 =?us-ascii?Q?5WxtYG2TAOpRsdOTCUzOgWsVpH5y7br0MOIKpLFMYW8Z65iG07KOgZOyzdSu?=
 =?us-ascii?Q?bJrW0LqQkUrJyBdHwL8w0WZxVY2NSLA5YIv9TsG6WmMSwWDFGqzuZ5VMrcWI?=
 =?us-ascii?Q?7qJztnQP7fzLLsXT5u7yNfceYIawLGHIDLZs4Jud6Bgvk+L/wxUpTpEVkwU/?=
 =?us-ascii?Q?MldECxMIikH/cNJAVxM8KrEDsC6977DihDwY8ueWGrwPf4i6O8Jtr3xEd/8l?=
 =?us-ascii?Q?cOF+aCfOKSbOuLnuHB3JyF9zbmq10MkWwXNtIAgZ7VD0SPK0s9fABeTM9Whp?=
 =?us-ascii?Q?vk3Y+QJdQ2Nm580akDs8cVaiD5DFz9LddCX0wbAn7VNmAxrwTjiP18VYaU+4?=
 =?us-ascii?Q?dfamXWps7OeGr3A2mlzhH5SKTQtfhh9pfPGdUpoptidZZXpArs3StlOqiPNF?=
 =?us-ascii?Q?ikW4H6iKprXzCJNi1eoPY2Cazai+nWn3sWt1kIDvqx+2/Si/C341DInfoHmw?=
 =?us-ascii?Q?/0BPXm2+2xA/Wgr0sjRxTs8+fbN2CEy+l6uqGp+S7iVb9d/LzIYWgmw2t1AD?=
 =?us-ascii?Q?znwaJSSmqpeg9WekM8XEee/g69abwhBASD/5qHvb4hRSptjxePbFhAcDHgtz?=
 =?us-ascii?Q?JpeTvzqULv1iA7Py97j2EAE4fjftQ43B2OwoxN/vl0UwyfQZSSh6rsLltRVZ?=
 =?us-ascii?Q?4YdusretfoBGLSR5iLi2iT3HZu2zXRbhWnP/+vKN1cwhFw+LgjDUhfqz/vRt?=
 =?us-ascii?Q?1WhSHrBjWoAeGkjJyg2Up7uDS9f238nM2hZtIGFtHxTPdpaDhSYNz4nuOVc+?=
 =?us-ascii?Q?Tu7QdkGPBY86195wEoGGrer+4hVAXUiebpKQi2Uv9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2y+gy9udv4I0WQJEZ9hmnwbG0203Fus6V/BYfdcxpDfqZkjfCOOZaNH7rRZB?=
 =?us-ascii?Q?3bj5zpPDFm6aM2PVFit1tN2SGfxwhIG00wpfn1+i/rG2EwqR8ZpHlUqcT3Gc?=
 =?us-ascii?Q?q2s8HYUeNe9eUW6K3KexG03uMq6Y6tyXLFwvBjmH7BNbroDJFCbCC+LMAC2G?=
 =?us-ascii?Q?zLAtUVPBDT+/tGrEo124WChllD/px1KuOH45dk22JZ2phnjM8fTsoKcfB2Yd?=
 =?us-ascii?Q?sKdb4PGYhSAzBlZdP5LkXZJVuI/UDkCO1hSqfgqSue+3YaDSQYPee8lcLgv2?=
 =?us-ascii?Q?2yvtKBRbmiHhtHky2jnQ0556QnE7qmTsbei4gvT7AHLpH1ac1izrWfLlwZJv?=
 =?us-ascii?Q?6g9BtzplCrFYjR/r76GewQvVWRJJKhOZ5nKEMF8QQ4FPdaUuCzG+ouTxkQGO?=
 =?us-ascii?Q?k2DAcsQcXtB9qeVfJLNA4o0ZYC/3enqmac9rrbG3wmQlMnYc/WBIUry2Ak6K?=
 =?us-ascii?Q?NZuC2XjaJNXCAzl9ULvcljAgvOa6YdrLh1ZNmHIv4LCMhRXUQhQyJ4rkvZnW?=
 =?us-ascii?Q?wXhmIsr1+DcgZHTvLMCcMc8+rsHBBMJBs/V5XbL91SHTVAiQwsV7i4MOYH1I?=
 =?us-ascii?Q?EVE/6BvWI4Wy2rl+PFZUHvT6Wor4dmj+Iah1x6Iy08qo2ZTyM5/bAhxODhFv?=
 =?us-ascii?Q?NYD2iviE/7k6hVzgeP6j2wqq+d4q9ewQ2blRT71qLXsV+I3j9ZbIBnnjxTV/?=
 =?us-ascii?Q?0h2QhfeTU4Mc21NEekigQB+HO6z2AZdGCCuXO4fAyQUcysb5KfUVTgGMvAqw?=
 =?us-ascii?Q?CfulWQR/H/mjIVIiwES8Xb9NUNIYqms4py9/lmT92m1k9GG+l+wyRN0uMbxi?=
 =?us-ascii?Q?fdWSi9v1hbrOKewF3ZS0hwWE7N1Ipp5vWhmh9lb/xHL+ROvIcGeAOSUGvCXO?=
 =?us-ascii?Q?Mf/KUhM9k3Z4N7Yg365QG2AVuPP3aoT126HlzvlPfetQ2vb0Q6K+hh5YNm1Z?=
 =?us-ascii?Q?C5hfljTGemxr6m7Tj8PKBG3b8d1i6lbC6Rix05xMjraWAW0IfIU+a1JtEM8f?=
 =?us-ascii?Q?K4p3KRpNNdSdLNNxpt9MCIpCnFz202PH7brHYyjon4wH9VLIR5/OXcQYN9k7?=
 =?us-ascii?Q?fV+hl3kI9G+gOBTGV5u0qi13uvxTD4E4pIgO5s+uSd0HnZRDl6eMJTVoB+Ic?=
 =?us-ascii?Q?rnEM1RvgaQp9w0ZfJYE8Sa4DO7wmIlZqGhNPTVB0jbbyshUqdA5aPF6FuFPl?=
 =?us-ascii?Q?C85mXE5qdKmP2KThjcBls6biF2Swy97s3gIZMMI6+r6lhP8/f9LFInVxXs0q?=
 =?us-ascii?Q?OCS+5fGsefTqhzRwktO9O+kzkNgL9awBFMfBJbr573AL4EgWjB+mTOCkW241?=
 =?us-ascii?Q?xvVYUUeybJ3V8DIPBX3l3DHu8CaKloleaih0cdPnY96DNHy0/3ZhvPEk1na8?=
 =?us-ascii?Q?a98pNNf5cRXPtUHbZ6nqYYpLTbDieAgZ15RjQl4sZMZJBAXFVAs21X5q6iAO?=
 =?us-ascii?Q?djLrEJ7zAskXU7WcTTRH5GheLt5dRrZtTUSpM9XbG9pqkygeVSDmZeWN/JJr?=
 =?us-ascii?Q?vPCmI10ZZoslJ2ZLycW+PJLYkPeewkmisLyvfAbFX51h+mR6B9fY2jHtJ6af?=
 =?us-ascii?Q?osV68t1HS1kr+LMxzFB5X0Eshbjx9ikZGdJvj6ibmRGJ3BkMEDbSpwriqgfz?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6baf616-41fc-42c9-08ed-08dc7a79d5e0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:11:28.1394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEcdMvVTh+FKDkEqXB95CBNmx23ppaf7k34hhhZkctfXJBAGJUUEeHZw07KdTy029rqRfJ8a6rct8YEQyBH9+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8474
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

On Wed, May 22, 2024 at 01:35:18PM +0300, Jani Nikula wrote:
> Synchronize i915_pciids.h with kernel commit:
> 
> aa3d586e1624 ("drm/i915/pciids: don't include WHL/CML PCI IDs in CFL")

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/i915_pciids.h | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 16778d92346b..0c5a20d59801 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -488,6 +488,12 @@
>  	INTEL_VGA_DEVICE(0x9BCA, info), \
>  	INTEL_VGA_DEVICE(0x9BCC, info)
>  
> +#define INTEL_CML_IDS(info) \
> +	INTEL_CML_GT1_IDS(info), \
> +	INTEL_CML_GT2_IDS(info), \
> +	INTEL_CML_U_GT1_IDS(info), \
> +	INTEL_CML_U_GT2_IDS(info)
> +
>  #define INTEL_KBL_IDS(info) \
>  	INTEL_KBL_GT1_IDS(info), \
>  	INTEL_KBL_GT2_IDS(info), \
> @@ -527,6 +533,15 @@
>  	INTEL_VGA_DEVICE(0x3EA7, info), /* ULT GT3 */ \
>  	INTEL_VGA_DEVICE(0x3EA8, info)  /* ULT GT3 */
>  
> +#define INTEL_CFL_IDS(info)	   \
> +	INTEL_CFL_S_GT1_IDS(info), \
> +	INTEL_CFL_S_GT2_IDS(info), \
> +	INTEL_CFL_H_GT1_IDS(info), \
> +	INTEL_CFL_H_GT2_IDS(info), \
> +	INTEL_CFL_U_GT2_IDS(info), \
> +	INTEL_CFL_U_GT3_IDS(info), \
> +	INTEL_AML_CFL_GT2_IDS(info)
> +
>  /* WHL/CFL U GT1 */
>  #define INTEL_WHL_U_GT1_IDS(info) \
>  	INTEL_VGA_DEVICE(0x3EA1, info), \
> @@ -541,21 +556,10 @@
>  #define INTEL_WHL_U_GT3_IDS(info) \
>  	INTEL_VGA_DEVICE(0x3EA2, info)
>  
> -#define INTEL_CFL_IDS(info)	   \
> -	INTEL_CFL_S_GT1_IDS(info), \
> -	INTEL_CFL_S_GT2_IDS(info), \
> -	INTEL_CFL_H_GT1_IDS(info), \
> -	INTEL_CFL_H_GT2_IDS(info), \
> -	INTEL_CFL_U_GT2_IDS(info), \
> -	INTEL_CFL_U_GT3_IDS(info), \
> +#define INTEL_WHL_IDS(info) \
>  	INTEL_WHL_U_GT1_IDS(info), \
>  	INTEL_WHL_U_GT2_IDS(info), \
> -	INTEL_WHL_U_GT3_IDS(info), \
> -	INTEL_AML_CFL_GT2_IDS(info), \
> -	INTEL_CML_GT1_IDS(info), \
> -	INTEL_CML_GT2_IDS(info), \
> -	INTEL_CML_U_GT1_IDS(info), \
> -	INTEL_CML_U_GT2_IDS(info)
> +	INTEL_WHL_U_GT3_IDS(info)
>  
>  /* CNL */
>  #define INTEL_CNL_PORT_F_IDS(info) \
> -- 
> 2.39.2
> 
