Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72384C369D1
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 06:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E4210E894;
	Fri, 25 Apr 2025 06:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOIExzQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE6010E894
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 06:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745564066; x=1777100066;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ig4nKh5dzjWux4BoA64hPhpBpuwtuAsQInVelQNjLqc=;
 b=SOIExzQjPg/fw3hODg8QkhsK1N1u1P5JfFF8GfTaLOo7kmu7GVKw/PV4
 rb1t+P+9KQ/K8emEi9Vte3xRiific20HTGP80WN6l7LePLT9oIHRbCRXF
 c6zLgR4AjfhRzwz6bTzHjaNIQ2riQdOBLrnKHwkkJjq7YWJeXTR83dgoK
 f55Y0M+G1q8FCDXlCWUP41I8Ffe4NDE6kLupBBo5ZfMc2rrOZz+1qLiyC
 uHLF4sdFiWHctEoB1ckwAilpvDMw/CEFRV64GUTeOlaYhvj3pI8V7XZEf
 99WL/yhIbAvhSMWIo05nYNsB1RN5mzkJ8ToheIjrc+VwNJH2noGqZbUWt g==;
X-CSE-ConnectionGUID: vKml3uabRN20y16smw2ing==
X-CSE-MsgGUID: eJsEmUTPRESaB6r3sNZ9Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58582160"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="58582160"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 23:54:26 -0700
X-CSE-ConnectionGUID: BITASil4TvSxh/bdsfG6mw==
X-CSE-MsgGUID: ujvgAK65QjOyOxJ8ll3FmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="133806489"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 23:54:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 23:54:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 23:54:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 23:54:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlKRgltk87QXN+tFlseAO96q0YM1mTPjs8QL2KwiJs/+cW8Z+qSQjLPStoI/frIWePglhg9qgs0/KN25FTQ9PVkFpbsJLugEXZHPk5bWzfVnEPUM0rD5RHT6cJ0bPGZbRiZfP1q354ECVUKDXodT4H+ShKaaNaBhdPyVa3PP1q9GnDN6j9dixOwFyZMUiFmxMUqcoYQo54XjW0u12S+LsKecsvnFdATkJ80FytgNUS3BlyVwmkDPfefPrWfQMbIUobQ4Ob7eDjlYu5plV8LoRxyfpGM2kQ9YZH42+L0pRVgRpkdatajcW6iGHAtatjlwfIBw5nSJZZlQSGc/papvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVsOs8KIhNpRelaNvibCb7IlDvKKhNMil/uUTP6TtJM=;
 b=Gu7ynlgYmOrfqcqRILy6z4WZhULKZ9vvnzbloPcS3DBqfPH9bO8SnXh47Z5yHcizn1rTzlnTF19NggEIBXJxZpMhLuAr2MmY5HiH6CrjiSpX2NatqwU41KS4MrTyi9usXDBvZBhdER+mm6qrpfQVtI8wZLYzzfPQBJJDkA0zP/vTFGTKy+gZ1WwmglOpjrfg0BIDju0mZh5xmfosumPcrHwsWyc8Y9BcBg6lF4WdbTYTa1+hUOr2WwHqrHHGqBwuuJ6XLctJBAwPK5Ys9BFxPpc3bOnbqnrwdaKy+nGoPFFKlj6Owmtwb1mHQPxulOfdw8gjDvl6ztn3KIXo5uptdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 06:54:23 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 06:54:23 +0000
Date: Fri, 25 Apr 2025 08:54:15 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/2] uapi/xe: Sync latest uAPI KMD headers
Message-ID: <aAsxl9eMObP8K3yo@fdugast-desk>
References: <20250424204406.656794-1-matthew.brost@intel.com>
 <20250424204406.656794-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250424204406.656794-2-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1P190CA0035.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::48) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 7654ba5e-4884-48e3-868a-08dd83c60305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s3pkBN7m6cPH1CyqHr6c7oDX/4NGKOgqlsHGEpnj9Amw9FUP2gMTs8o/3y6C?=
 =?us-ascii?Q?81yoQBViSxL45mqC5fJ3l2MoBRFmfbf+4xuObe5Z5846Y2qIiBI8NqW29nxa?=
 =?us-ascii?Q?1VwKLKgMAVCVJ+9Wh/K7yF4RekIFJUE9/scmkJbuJhGw/F2OIyzcrC1UG6+f?=
 =?us-ascii?Q?HIAwsuh0ktCzeWpvbLlcTg+lHs4WERPXgCg44dFc+wktPdgLYLxjL+rsZES5?=
 =?us-ascii?Q?/hGqTpmmLROyQHgsUwd9JvUOm6aV9hvz9nZHvACK+uWvWX/AJpxk4UuGumI2?=
 =?us-ascii?Q?sqCZpDdw4XIMIgGUXhFb9iT240Gt1JTgVCS6Zeod18jWvSWZKpokp1lgxRxD?=
 =?us-ascii?Q?cTybjVhEYnk8AbS4ayV/slEy21LLz//jWpDW4rXfvo/8Lsz5BU7+VuPG0/JU?=
 =?us-ascii?Q?NH/gYjJAKVqlo5pxUuDn66xGQDzOcWgqPA4brQWa2e0Li+bntLLgPn90kHva?=
 =?us-ascii?Q?jTD/kusdtYz4tyxwvT0tQS+YJWkVT+0Qw+rbPylD/aPDTbqCJT2PHOjl0O2z?=
 =?us-ascii?Q?cbuMrTdpWPItxJA3RZzbBj2DhepqNfOZqKKyolhWDC2SrOvN9QSkoFYJwpdd?=
 =?us-ascii?Q?Q9Z/lmiOrkXOnh5c5T2dJmaK7S2rN65o26OGXSITci1SX/rnFS299J/N2kx+?=
 =?us-ascii?Q?/Kc2YIB/jnSePLEyiLcxzv7aOKlifCsCX8+z+1i4tsdh8XS2dOXbq3cWUmhH?=
 =?us-ascii?Q?eehqtcWlqwEhaCirbojavd70G9jglr4mXAuJe6l7hfBf/FnlsxjD7LvRbO/P?=
 =?us-ascii?Q?u0YqUXlPhI0znZt0ftqbSAKbhZ6iARduuOqSkAGpH65fMvURei7kWe0LVDPJ?=
 =?us-ascii?Q?FwbCoC9ct1V4UBnIZ44GJpUR9qbNv8+CPZScfCIscQTMbcSipn9mUJExNxR+?=
 =?us-ascii?Q?tw8Znt/OggT85dFbkkamixVYb9pCQgltv4BIrMwp7h+TzzO2rsIYYMi+NIdz?=
 =?us-ascii?Q?A+dFggR/89mHeThAm7NXdAs7hZJgw0yWNOTRsYX2dPMrGVWD6hjoxziSsiaK?=
 =?us-ascii?Q?ewgrygNOML/GrfvN8sZ6+o9jK1O43rJc9jcdOX2idbn1lt1hpTAE4QmY8edU?=
 =?us-ascii?Q?Q8vXoNnDZMV4w7L3B1b/0zUuSQPhri+ujWczu7EMKI/4dDBhr9XmMaV0giAT?=
 =?us-ascii?Q?oXLTFR0PPH7i3AWg2hHwru85jV1iecYM6s7E3IJr3mwkbRO8uzSN23ins/TO?=
 =?us-ascii?Q?6eufLteJdbeTnA186SLAWMpyjvgp4L1WSgEpiFST4B1TcRaFY7Qf0/2p8QM5?=
 =?us-ascii?Q?+fSAn7K31vDtz6l3U+G+q1Ib1/BDHnQWv/uhTDE71yDEBrs9AsMyU01ygxz6?=
 =?us-ascii?Q?dyoPJlPDGEQWl4GwdNforj/vIKgOzaMdIaxK3RDH9xF+zFsiOAgObhpj4s4Y?=
 =?us-ascii?Q?ae9DMtu840OCVLbqNQtymX5PTOHdp6D+D6eP+s0aAG7A2WHzLors8Z6e3hC+?=
 =?us-ascii?Q?vumpUCFZRJg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4aiazKE+YA5wdu2A4gAfRoEk+eCWMCzExiTY6z2dfCpfxl8YWWOUlq3uS+TK?=
 =?us-ascii?Q?J8Aok/iRCFTG13Fj/1lUNA/M7l1+oU/tTr7RY+SJcF84W75MnLZGi2kDcs9p?=
 =?us-ascii?Q?ui4rGHPLIsI5cf+/Nrg2NqSCKHe8a2TE/2YKHBf/krvhCrskrFKo29PT8l5I?=
 =?us-ascii?Q?hm44g1Jz0LswfKk1w67zguPbN6LR3271jvg4+vux9RrD5amnqnc5U+hjirK3?=
 =?us-ascii?Q?scEQpmjmVGnQ+HScArTiOvGOMAwhVKCAXhMrGuNFKwZWMAGTVgTir2lp817+?=
 =?us-ascii?Q?gnJjQ5UXmk6vICImUHXZukRm2JdNXY6+gfr/3PqWkffuuNh7PfEM+dqMM4ut?=
 =?us-ascii?Q?59ZDuche0egn8PMMeHsDf0mWSX5oXw19PT7RDD2yFGbVDSH9J5UCZTGWpsu7?=
 =?us-ascii?Q?jiusC8DBPBxd/Xv0GpPN/StGmIaFY0baTfQnKYsmH2TiXNLQvZp/MgaTze9K?=
 =?us-ascii?Q?YSRAkgvTD1d9SQj9+FHWISkeau/AloUO7enJTYpgN0jnhxEE0tUJPyATV1/w?=
 =?us-ascii?Q?6j0lWzlj/mbEY0s4xYaC29fiQ+SJBF4VF8gAjrHnqvTLHtk3FH2x0rQpG0eY?=
 =?us-ascii?Q?k2HyBsnmwMzi4L2nLr33pASqhbcrQC9kVYtDvpw+epRHNBd3o56p49KBLDmf?=
 =?us-ascii?Q?9gP/4t3qWLDlnYtEA7zU6waGLlnyzkoXz96HgJapxE6eYSRkbfLu9ypJCFFu?=
 =?us-ascii?Q?OBaAFcVLqkyqi5GRhXAv0Ya0ZkLHuhQI9VK1F8r+GuxqMiyY4GzYrP3PP+aS?=
 =?us-ascii?Q?F7TMohsdnBNMO3F3DX9nwgDbDm3bL7fm4xrIXuF8nBMYxSsWHo7uW6fZb2nP?=
 =?us-ascii?Q?PYWaKYyjQiZQUdxInup+vHiDeSdtizFTQLSYhsior1LlNOaV5ahxReiifItW?=
 =?us-ascii?Q?Im88ejjSo2oCQZG3cYdlwA5OgKHCZQHxPgAYV4oM4kYsIVt+n9lLs1o6wOgp?=
 =?us-ascii?Q?S7WD8E4Xd6nPg+j6zRDYJKYMnirDj8wnhk/gjmOhezf4yN3Wl7zyqLluuBo/?=
 =?us-ascii?Q?1PUBYl7AMFLmSuZGFJ//su0MUcZ7qwAExSJx7PKzsizRLZuIrlCYi3JacaTJ?=
 =?us-ascii?Q?awf8BhKMh1Rc5QvedANOfuroItMSEymK0BBVsba09oGfz9c9GALNXh8PMuH4?=
 =?us-ascii?Q?OEZuCVxc9UHSv3B9BKpKnHwTcptQ0WnPk0e3IdlHwCJ5bb3jSR7KsZXqCpkm?=
 =?us-ascii?Q?LwT5k6npnHbJ9kLMXTor7N4JTC2Adaq/Cz6te2ysdpsTLW2iQcaHUFxvlXBz?=
 =?us-ascii?Q?S3hq48IgvyYeRNP0r5KH2RlUYfImSGslN2IwSCOY2+0a4gxvwru6VkKrgfrJ?=
 =?us-ascii?Q?IUAIY+EapHKzGHTXg+jm70GMnmfDIxbgdiJjEfzu/hVrOdIhNQvl5whuOcGU?=
 =?us-ascii?Q?Id8DM5pwMeFV1wQFpmzXi0Kt19V0IZ+D5tQGk9inY+PgaQugyI5xRoW4qnkC?=
 =?us-ascii?Q?1x+yybIT9rUXhW91V3aE+IqZsvIqSRUdtrneAh9a0q9TeC3BH2bGd0zm15n6?=
 =?us-ascii?Q?rWWOROQ21eLhz1+mdjgNEtnCzsneoJH0c0gul0URTUXxWmkYNYB/xVQIUM+S?=
 =?us-ascii?Q?qNf+641sdGLp6IWcNapvhreIqLCTIFTpGIWdrai8RgsO1FmjkSuHdrZvLf8k?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7654ba5e-4884-48e3-868a-08dd83c60305
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 06:54:23.5594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5kBc1wcY+qE9B/5xRtrbaC+ZfK3YdN41g31zJ7hyWok8a+ZjkfvO/Fxs1tQQQ4geSW9+nH3IapEHlGGQzlMdThp1AlNFZHFRz42N40VUEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6422
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

On Thu, Apr 24, 2025 at 01:44:05PM -0700, Matthew Brost wrote:
> Pull in latest uAPI KMD headers to enable testing of new features.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 49 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 154f947ef0..c90fab1b00 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -393,6 +393,10 @@ struct drm_xe_query_mem_regions {
>   *
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>   *      has usable VRAM
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if the device
> + *      has low latency hint support
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
> + *      device has CPU address mirroring support
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -409,6 +413,8 @@ struct drm_xe_query_config {
>  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>  #define DRM_XE_QUERY_CONFIG_FLAGS			1
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -911,7 +917,11 @@ struct drm_xe_gem_mmap_offset {
>   * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
>   *
>   * The @flags can be:
> - *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> + *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE - Map the whole virtual address
> + *    space of the VM to scratch page. A vm_bind would overwrite the scratch
> + *    page mapping. This flag is mutually exclusive with the
> + *    %DRM_XE_VM_CREATE_FLAG_FAULT_MODE flag, with an exception of on x2 and
> + *    xe3 platform.
>   *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
>   *    exec submissions to its exec_queues that don't have an upper time
>   *    limit on the job execution time. But exec submissions to these
> @@ -987,6 +997,12 @@ struct drm_xe_vm_destroy {
>   *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted via PXP,
>   *    reject the binding if the encryption key is no longer valid. This
>   *    flag has no effect on BOs that are not marked as using PXP.
> + *  - %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR - When the CPU address mirror flag is
> + *    set, no mappings are created rather the range is reserved for CPU address
> + *    mirroring which will be populated on GPU page faults or prefetches. Only
> + *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
> + *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
> + *    handle MBZ, and the BO offset MBZ.
>   */
>  struct drm_xe_vm_bind_op {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -1039,7 +1055,9 @@ struct drm_xe_vm_bind_op {
>  	 * on the @pat_index. For such mappings there is no actual memory being
>  	 * mapped (the address in the PTE is invalid), so the various PAT memory
>  	 * attributes likely do not apply.  Simply leaving as zero is one
> -	 * option (still a valid pat_index).
> +	 * option (still a valid pat_index). Same applies to
> +	 * DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR bindings as for such mapping
> +	 * there is no actual memory being mapped.
>  	 */
>  	__u16 pat_index;
>  
> @@ -1055,6 +1073,14 @@ struct drm_xe_vm_bind_op {
>  
>  		/** @userptr: user pointer to bind on */
>  		__u64 userptr;
> +
> +		/**
> +		 * @cpu_addr_mirror_offset: Offset from GPU @addr to create
> +		 * CPU address mirror mappings. MBZ with current level of
> +		 * support (e.g. 1 to 1 mapping between GPU and CPU mappings
> +		 * only supported).
> +		 */
> +		__s64 cpu_addr_mirror_offset;
>  	};
>  
>  	/**
> @@ -1078,6 +1104,7 @@ struct drm_xe_vm_bind_op {
>  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>  #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
> +#define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> @@ -1205,6 +1232,21 @@ struct drm_xe_vm_bind {
>   *     };
>   *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>   *
> + *     Allow users to provide a hint to kernel for cases demanding low latency
> + *     profile. Please note it will have impact on power consumption. User can
> + *     indicate low latency hint with flag while creating exec queue as
> + *     mentioned below,
> + *
> + *     struct drm_xe_exec_queue_create exec_queue_create = {
> + *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
> + *          .extensions = 0,
> + *          .vm_id = vm,
> + *          .num_bb_per_exec = 1,
> + *          .num_eng_per_bb = 1,
> + *          .instances = to_user_pointer(&instance),
> + *     };
> + *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> + *
>   */
>  struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
> @@ -1223,7 +1265,8 @@ struct drm_xe_exec_queue_create {
>  	/** @vm_id: VM to use for this exec queue */
>  	__u32 vm_id;
>  
> -	/** @flags: MBZ */
> +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> +	/** @flags: flags to use for this exec queue */
>  	__u32 flags;
>  
>  	/** @exec_queue_id: Returned exec queue ID */
> -- 
> 2.34.1
> 
