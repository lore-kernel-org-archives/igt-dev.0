Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFB3C0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 20:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0B510E0CD;
	Thu, 30 Jan 2025 20:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7LvR85p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBF010E0CD
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 20:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738270585; x=1769806585;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fraqYAuQWn/AICwRkgBWSELxSt+Cuqqq5ZNRGedxh3o=;
 b=g7LvR85pg5N4lHhp/M2b1WgKEBAXXb17iCKqixsh8tJIn3bWkynopXNW
 HlW9MWjBDgm82pIg//Kaoy0L1Q19uUvzJwzyC5PdcAsmmLkbqKJ03iFjy
 cxB6GDpSwy2iORV7eo6ewn3wa1L+z0RZjPZ5roOOeoBIuiKOc/SECH5Nh
 LPW8vJ4PXqrSYxLo01qL+HOENHvNzhNVEc3o1W07qZsmYInnSmC2K5e9i
 dcDS/d7VCxr5WDz1w2a2+m4bTmuc7Ur8iP0Xf8vfwxKaXH44jR9SBhpo9
 1f7ylhpIGuMiy6JHpsR5qz8PVRzIwC6eMQjbJ6PQpiNekR4C6eeWhl6wz Q==;
X-CSE-ConnectionGUID: UxIWFE4vT1yW++M4Pkc07Q==
X-CSE-MsgGUID: tMsXOomvTnGydAS7MfjuvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49826650"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="49826650"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 12:56:03 -0800
X-CSE-ConnectionGUID: vcBTccILQlub3S237c/03Q==
X-CSE-MsgGUID: 65TlEPyWQl6cdDOfGAPuPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114583905"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 12:56:00 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 12:55:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 12:55:59 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 12:55:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=it16rfe7OTa8F41D0f9/cB77W33WfxMJmdDy63pKG5+aKrFjOArqPjlJcv0gwo5A57ZxL3c0vCJXUEnuNNjizucCHB7VZ+n9iseVPPUxqmTsaTnTLw46DzGgCXrMffHfCvQ4M+MEQNC5fu6FoRvOw/y27bdayfKQL6xDJidLrA+iU6j7Mix/bJqC6Lro//DChgtIzLN7V5gYhOlKsT9tEuG/k2a+LePXt/mpzI89plCPOrO+w/c5YrqBY46cRff/TPn8WFcqPSJLI+G+DaQEDwGoOkY8lFok2MrN9Ir3c+atp6hmDxsPoG29stgma5wsPYoFzPpg3wfyoAnzl1N1dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhoi4GgSU4k9SdHb15je8xKv9Mse1lvoSNjUvb3n3Zs=;
 b=QGKoPSvs0xmQSnb4Y0WOekrL11eu5M0CgzAG0Wmls/PBgz/LDKQoreKmcvD6SgQWsSylf5swNudFsSsJDVn0jAEBS5XkRCt5Lep6BH9VANBJp/NT9BykaJg1tjjyfPv16fdt3QSviKG51lAMF9urmdG3C3AGcC/4DKYOUGWX4/rE9PNwqMdHDZwfbqKDPnh1oOrLT1CeVHjwid+o/jdtxKxF+htm44n7A32o7nY0/SoSVpqbpAmNM/D6DbV1xa0iIKe+E/dRFBdqbLjVxdz3Z9ywGk6uKsdhLuVxrX9BYZbAe/we7k63eQw4CKEEhuWo7MMOI9Xyg6Qap23HJNW1Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB6455.namprd11.prod.outlook.com (2603:10b6:8:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 20:55:57 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 20:55:57 +0000
Date: Thu, 30 Jan 2025 14:55:52 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <vinay.belgaumkar@intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH i-g-t v1] Add single engine busyness stats in GPUTOP
Message-ID: <xes5eksc73cxdsckuwhr3sya7hjrn2m3hummcm4wn66vitsi4x@bas4sqmvr5n3>
References: <20250130183909.725791-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250130183909.725791-1-soham.purkait@intel.com>
X-ClientProxiedBy: MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::35) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: 076b47ee-7318-4528-85df-08dd41707ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U/fPnSgIAig77IXkHzZFjgcYVH5kQy9z3eXfPtff7Eey7eM7NqfHEEUos/M/?=
 =?us-ascii?Q?RrGjEOuJVZuTYprlkEUB5o0hs5ohiUrTldNfGvF3b3rgxAJPXTtKd7sumY4q?=
 =?us-ascii?Q?NjRbIqcYxJZwFBNgwhGIQTp+o+kBc8JmR9QtTefBPeRIP1eGLr3J1UUkxcwF?=
 =?us-ascii?Q?3B13W4Y94sN18SEUL3dhFFP0zo4NaU9jaFbtKinQ2+7f+pg5b6mLcuyESsRE?=
 =?us-ascii?Q?HwAje0mNJbR8JgcCcXYuKtO23XG4tiPRdJIFRa9q652/rDH53h4j7xQ4i68/?=
 =?us-ascii?Q?MtYZXR1i65A1922gjA3T/o53qm0xVi67RakItI05p563YLp/GN6e0OvOatax?=
 =?us-ascii?Q?TjXVpD+gYbyv6eH6EYTFEIbyd5lMC64Z1rZcNw+BJJqY9NlJcqZFSxv3FHIu?=
 =?us-ascii?Q?MGXXWfE5eEckP+M+4hZAjgicUw65YV6a0UrMokjwXliclL5yzTIt9oycccdB?=
 =?us-ascii?Q?o4H4nIsB6dL6d70WRam34BNT7hZqX8RPMlK6feHEObaiox1XBW6/FZFH2xtW?=
 =?us-ascii?Q?Fa8DCbJ/K4600RVZ6XEXj8gxg+Dg2d0Kmw/lhJGxBhzgaTlcNYZ1bFRPcUTg?=
 =?us-ascii?Q?Tmp49zEVhiRpq/o3ahA5vFWi4RVDByUvKOFjbNlcp4uHm9OzD7P72S1ruDme?=
 =?us-ascii?Q?60JYGzu+nyil9dWRTYQc8Jj26sYc28N5JdPVY+Gn9ikrzHNW4PjQ40DxX9LZ?=
 =?us-ascii?Q?o8T0pubMRz4jCK89bJjVNYzAOrFISOa26cIMQk7uwvTu4HPY8IqxDAQHTWkm?=
 =?us-ascii?Q?GDJpvUuYfowhKsWvw4OpUAw5zG5HE4BOfdJ7FXLOg3Ap7nr3qakscljdpbe7?=
 =?us-ascii?Q?XMgrKMUz2u1HBYh3qCW4I6j9ZSoVALmTT8yvTcHUUJNBeB1C1ZtVWT+swJM0?=
 =?us-ascii?Q?pRIZmJH87emA6f2Abh11Z7F3gmPJdinMiFmQp4/SpzsEpy+03jmvDbUBTLSZ?=
 =?us-ascii?Q?aJ4a0DLJEPvHrp5ZfOUfuneZjWEe/+in46ZY4ztj1eSoMi2fSQ79hjpbTf3k?=
 =?us-ascii?Q?ij8Xg36LC+NAHkZqPe0pDHXb+HNC7w6mHUskAhMewarBDpGRyiUApVNhs+9g?=
 =?us-ascii?Q?Y5SDa3w01mgFalG4t7S7p86jZFldElE3e+OZ3hObh3ATRarE7f9JSf3m9mpo?=
 =?us-ascii?Q?YXhiPQZMuwq6VX1lo5L4M2gTR81bmb3AGJ6bSt4xtE53mOs2JtzyuIbbIDGB?=
 =?us-ascii?Q?BTfCLJM0fQI+kXLv0KLEQarg/wmmeZUw7vqevoq63NS/t4hOkx1AxQdDUfDd?=
 =?us-ascii?Q?a2+B6TPrA9Pj/aVtnQ2Zro+D9wNrnhIaErrpffaakq4AB39kikYgu2LYHa8f?=
 =?us-ascii?Q?2YMaP0hCG+Z6UFuZFVVi9Vsi7AxXnIp4F171XV+2EmJr+8lN8L27ZHc3PFKF?=
 =?us-ascii?Q?Z3qO8XI7DXYMHkCtgSTgbDuvYVh6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MIzlkr1B542m+ooOWp8/a9P8rz68qy7YTq0hZDMfUGlE+RclOZxFRk+BX+PV?=
 =?us-ascii?Q?gYFnJtOZSKHKpR82y55WpRKNLdGU/9pkiHb19+3nvohNlpdCFiri+4Yc+Ot0?=
 =?us-ascii?Q?HiJqKg4y5pO3PiCpIv41+i36yZGoQj9I1gAOAhdgAYl5lp3L0meQ0pUAkGRY?=
 =?us-ascii?Q?fh9WY1qMqU3vk88zYz1AGvRJIQ93u+Fy6PZQU63/jM45beDmSIGMDSONA+15?=
 =?us-ascii?Q?VaL5DZ0Ti8VD3uKmWxz12jrtGqgrOYo6DX6yp5YZq+alKdQTU/HEutEduq8G?=
 =?us-ascii?Q?BRLdLQ01XhBAgTVSXDiVdoaouUC+rnk/Z9gqGjz3RLsrHb/mGaFjsI3GPx3g?=
 =?us-ascii?Q?h+QoItk+P6Wl8ce+Szs5JkHOEdCAQGJRetstKdUJfd3VN511xa5nmIp3RSpQ?=
 =?us-ascii?Q?PVPNDaLcGZ17mLP03ymF8U5ybW9pzilIPbgCnR/QgEwCoeap0VO3SmcSJBl1?=
 =?us-ascii?Q?7xrkI0ydPN/GslH56g5+kfgMLINEsaG/U37P5paqHCf1CdQa7/gwa7VeKJjK?=
 =?us-ascii?Q?o2A/IMSsoL93XrRnTcKv7kF2+wI5zFCO2SIOtbFoDnAzlCvnidxfPgATtiNP?=
 =?us-ascii?Q?NOA0isgORiVJSTqXGDX7eKCRQoOIRm+SBP+iMYuSFnG36UPRohSgv71o2IoF?=
 =?us-ascii?Q?a2KkxdSr3p7jixpUZu4EUPsky8yZXJVBncOe2n/4kK3rjX/k7Bp5NkGdm2/T?=
 =?us-ascii?Q?VO96q5Mbxb39CBjlM3TD+uVMQZ1eooUYWaCpQkKb5iu7KgjtZv8UgjGX0NeI?=
 =?us-ascii?Q?xB0+B+bHSE/eh8yzu2Ccj6uCVyNpMp0b/GeuYsZVDqRGc1iYThRvNr6pyOKY?=
 =?us-ascii?Q?HzDnWH3VqQbUPr7FdXP+eDyD/3aPdevHPQWDvCiJW02cI/t3XFseZLqxAPX1?=
 =?us-ascii?Q?2CavAZKb1+QIDLnR5WvbvnkZ9gzKxd8fFg/8lAaJKOnozeRtMaeTHsQK+u0W?=
 =?us-ascii?Q?8UteWNgDIN+/SqawNmKyYndVCH6nPtDvLS9GglKVAUVBmVwbR7GkweMGnMFW?=
 =?us-ascii?Q?hQD5auYQD91F2DOxadA2lqaXRNJz03Z7cMMwpcdpvkamTj4zQ9+DCtN25Mw9?=
 =?us-ascii?Q?8ES4wzW5eQhsLWNMlDzrTIiDNY4ndJRPyr9GNpGowSdSli61KzkS1Pg/HP5g?=
 =?us-ascii?Q?99THZlemU8hKcnPYeDtQP/WrDNBvTCuAe9SUFKWeYhWm06p7P4i9j0szGa28?=
 =?us-ascii?Q?B0f8q8a2m+3Gb5FuVmVfItVc6kgGRIXGrqK4P4iOpgUljuJuvrJgGvyenfqi?=
 =?us-ascii?Q?MVTj45z+r49JVXjU6kzjZmSmD2tHVrYfkZ7FSJkDOCjnfF/hUc0w3ZoQy5x/?=
 =?us-ascii?Q?yIhp71aK1GfOOxo0B+Q8aos9Yt8TecnL52Zbk+pnVq6uy31DSZ6ojhuUpxjc?=
 =?us-ascii?Q?PomRlJD8T8gIxogskhKf6ymBx7ZjZIVAfN+9eCSYZ/OoMYwacruilCiRHJ2x?=
 =?us-ascii?Q?bJ1Eclc9jNKmxmmvKBVz4OxVLAANVpbP0OCwdgpXE1oEorYVHCCScZK3wlSs?=
 =?us-ascii?Q?wZ1foGAKoxxcGkdTiQ/krGgN2ROv9YdQ8M7h2Q348/pOfVRwvmJMWkzZqRZc?=
 =?us-ascii?Q?e59XPvNtmCdVyXFGlmrfMUEvH9Y/9A/94jporv1JIPcI6ZVRrdAk6qKxfI6F?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 076b47ee-7318-4528-85df-08dd41707ec3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 20:55:57.6620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkdmxjzXfpDyQy9zUuQkFdzsgUY0aalyqI6vKJ2osuH5VCDr0jOtftRE3zPtldmDM3d7f28ADMu7SXWba4JYsPDIPE296IyZ/CIU4gaqleA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6455
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

On Fri, Jan 31, 2025 at 12:09:09AM +0530, Soham Purkait wrote:
>@@ -422,6 +850,61 @@ int main(int argc, char **argv)
> 	n = args.n_iter;
> 	period_us = args.delay_usec;
>
>+	igt_devices_scan();
>+
>+	//Yet to implement the device filter
>+
>+	ret = igt_device_find_first_xe_discrete_card(&card);

here and everywhere in this patch:

either make it generic so gputop continue being a vendor-agnostic tool,
or it's not worth doing. The way it's done here it would even stop
working on older intel platforms that are using i915.

Lucas De Marchi
