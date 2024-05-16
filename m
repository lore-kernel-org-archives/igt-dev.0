Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93E2C25B77
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 16:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A61110E1F6;
	Thu, 16 May 2024 16:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZH49qmq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984BC10E1F6
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 16:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715878379; x=1747414379;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GZNgfRt8yvKKdhjCX4BZZJSzxF6Wh7WDVVNCASS61rg=;
 b=gZH49qmqFKx4oJ1uSInZuWO+Ut4MYRRMmOemXG0YqcCI8hRQ4csqjYFO
 4XIqSJWmOsIJQYtkeY3YF3L12iKfbgNM2XiAaiYzsDrRDa6rzh2OKMZjR
 X19x39tNyT6kfTEZrStTsE8sSg3LbPEBRNWZ+bBWfjGs4npYMchx4tT3S
 ytAY49VtMjmIdh0dSvR1dWLM2100xvpmB/hq6cm/9wf7Yq/tSU/ck1LsH
 YjlzZfR2HuinbLv5B1pMapw1lk8N0osZvvobg0jgRiT77fOfi8waCT6nM
 N1JiWOsgBhxRmUoxIu83SfvhT9GiOwyL8+dUJmK3l5RDIrocLyLo+v24K Q==;
X-CSE-ConnectionGUID: jOj4Bhj4RP+w6QKpWG/1uw==
X-CSE-MsgGUID: JXsU6obpTPqMmB9AgTIJ7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23411152"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="23411152"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 09:52:59 -0700
X-CSE-ConnectionGUID: SdyENE6qQqi2HGLk2DlLGg==
X-CSE-MsgGUID: DojbtWFvTzWq/tAN3Fqu5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="62325868"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 09:52:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 09:52:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 09:52:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 09:52:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 09:52:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UECNwt80wX+8QYxIitXw0Dkpt25LEvdSFSMdzmQjY8dNjtekX2Pto+Cy+QOnoy5MGsCxw9pkcj3uC8mb8MEmelGsTsbLm3Fbjy+Ei33WCihxp0q30fWJK0krRTManKYTKeKy9hDg88q9SVIZ0pyNxF0Ifd6mOFG/frlIIR4N5XLgoYfoBG7ALpOleV5NUUJxQI/OOWb9gmqd/90zMQfEtdge5HysBFL6ZHn6w9LMX2i+S/2uXC4LpzAJqb2h+C21XD2v2ijp0V6LPfpze3qQgz50/ch7wpBDXzs8v8ZP9q2Uz2WJdK98WCvvP7uJYeH70j/ym1ZaGD3eY4PqizXLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUHmNPAJEqSnmCPlyuaMLItakRyWU6PEjcsyRQCG9IQ=;
 b=CtK1RknQ9OEzWQ4RWr4bk7IFqRasqh7WKqVNXj8JTCprfXf81POJx3itZleEUpEe2xpVS2G/UAbAdM2lbEnnDI6xYWCe49WURg4xhFEaWm+NrfihKakY70z+ZUVefQoxzn86qolBVqTVbtlcjagIvKC9TFQsUNMljzNtcLhknt6cU83JOMVrkVTYjp7e53uYwk3hJMlQ4MlBD9kOTQ09bv0XsaBbGdXyBPYjKdAp59obqehSmLcpLCERI0/7fSxjIjApC68kRCKBdi51r5juakJyZh8nr1Pyy6Rg4dlTPeYcOJoJydcRPZq5Lew03RO0cr1yrTvi/lTCzdjmu1HIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 16:52:56 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a%3]) with mapi id 15.20.7587.025; Thu, 16 May 2024
 16:52:56 +0000
Date: Thu, 16 May 2024 18:52:52 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_pm: Convert mmap tests to use
 existing d3 helpers
Message-ID: <ZkY55C4hX-PI5aGN@fdugast-desk>
References: <20240513185518.772398-1-rodrigo.vivi@intel.com>
 <20240513185518.772398-5-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240513185518.772398-5-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB9PR06CA0005.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::10) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA0PR11MB4623:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ab8412-da28-4f84-5c64-08dc75c8a26d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l/cY93Nr/YqMXeNbi7SkvmE+NFMWiQY1WJP+L5xtDHpzxjMPr6h6dDp3d11B?=
 =?us-ascii?Q?JVZwi4uUHGof1LdUMDBMQUXrG4cEGQsUnrw/Bhev/A0C5FRgmgw0mSwTUXg3?=
 =?us-ascii?Q?YbHZP/zoYJy+5CTWGlUqAclCMaFJU/ePOBcpZ0f8NCNPrvorP7WmTiH+O+H3?=
 =?us-ascii?Q?RVUMD8lrXJZwmDTRai38Ue4VcfNNvl3pEOW5tg2DnIa8Xuow1YgeRDRok68c?=
 =?us-ascii?Q?xBvTidb6cnSiY/joHXinFnZlpJCR2Zrz/xgwIhOKveQz9x7eE+hQZIEw69L6?=
 =?us-ascii?Q?cD0AzP5dInppIyfZ6jawv7thTiud4Eaypj2K3TVPdWpTfgCi6dz99QqWKZRQ?=
 =?us-ascii?Q?uwODQM0H8tlnqcCxD88oRzvVVkCcu4bP+pjURzBvnp8RRzbzDz5XZTaNzGFl?=
 =?us-ascii?Q?cTqQny/pXf0NB5Khu0Wo0n5j1Yrb8uNTMxBRu79o9KcJgU3Xssk3VWOVg1TV?=
 =?us-ascii?Q?Rr/MFGu/PaD+MlO6lNuV/oZuGiEA8mWY6Qe/Owu3s8hmGJXu0vQrCZV2qAh3?=
 =?us-ascii?Q?kN3XA7dUTtZe1OBqUnEI43pBto4ZLog47UjhIIrbe4ZQ0rTuK5sbRRSZ3iUJ?=
 =?us-ascii?Q?H5LkO/2SVSU80qjWU8B3E911L4k4oZXDcSid7vAuebWjLISLKD/MQDI6uj6b?=
 =?us-ascii?Q?wZ2EKcoBGz5KjZHC9xqUQsdOR5h7nEanv5m6IRueFqIU7D6mRqm5sigYdEud?=
 =?us-ascii?Q?hXI735uz6GIgUGnNTyFtrlCnvyIaBGyXhXG8jiQCer2sP2/xYn3Xr0FqDn6S?=
 =?us-ascii?Q?LyHwykov+VU3nAfLhFafbBGeJpQJOahUL0rest9WWVok0/CNNOwD4VusH+wN?=
 =?us-ascii?Q?wZdnD4mmlOrWu9sXM9TAw/PWtl0y2ce57zZlaQ7tr51ybaPq7g1fV7I0TKCt?=
 =?us-ascii?Q?k7Z9PwZEfht2d1NiO/k6S9WPSoAFiIrlgaYSRYZzhwmndbXWMLp/9M30daH9?=
 =?us-ascii?Q?QVp3dx1nrPvUV8GZyl8KrdOFgE5ttMn63LAvbynONCjgbNHBlJu1FqPqPwYp?=
 =?us-ascii?Q?n0iu50k+ZfNwWVBdvNdILudzj/oezBkT2iS6vs0F45HCveDbFep5KRqhbVqP?=
 =?us-ascii?Q?29Dd1vfUcq6Qc66WtPr2bVJI7dR7Rnts9z/hhZOfEfeVzY5IC+iEgyQ/frIj?=
 =?us-ascii?Q?u3MhUKmuFXp53uax1KNjRRK39BLgGi+YdUjmC3R3cm8kL71V6G26ifr+SlOB?=
 =?us-ascii?Q?A1zyne79Qym0FvCMkoA0rx5qOrfNYjzTeLM44/silPLOJWPk/ez63Pnr4cph?=
 =?us-ascii?Q?UV8Phq4z0q8tqHHfFCvRIQ4ujUIUGJ7syqT17sr0dA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jUtUSqG142QQOgkHSgRe5IxQR4PSkpebnv6x6e59mvtIuxyF5cqhYUMNWX3h?=
 =?us-ascii?Q?GbLHjvZc1RaDaiKWFM4/DSFqXtS1yAvddlbqHXx9danLuJjxk9tmfMtasvyQ?=
 =?us-ascii?Q?2IOPCXXS5PBsSg9R0aRPVqJcEDNp44mdl713g5V+E9HIJHtrWbHRsn341CnE?=
 =?us-ascii?Q?ojekJK9F6bMgX2bCYB5os0uPZlB91x+quagFHMzMR/wimrS7SES3Wkzr1T5l?=
 =?us-ascii?Q?MCRkVucIp50CxDh/A5dKDFiuzBqlZ4fvlbLwsKyiySytcsgc88aTkPTFkecX?=
 =?us-ascii?Q?wkmqflaDYwtVoxSFo6fpj3QeGAMtRqHythev4NCzILIVWKUiWAjDhOymI4pn?=
 =?us-ascii?Q?mAKmKLvDZ9/k+G6kBJNQp+SN3ah6oaTsdoLzP86HKa8pS75iPaRjjqPdwz+w?=
 =?us-ascii?Q?b8zzLipJ5jgqeOi6ugdLDFskrOXGUYPtRwcnIeYVDcsnOSTXJaNBzbuEs9OV?=
 =?us-ascii?Q?B3bM/gdtXrRruvpk9xHMaXv+hds9qfhJIET7UaYPBKfFrB4SClWKD91csAgF?=
 =?us-ascii?Q?hMa3d+4VGXSVgXOTWoqh+AC0Wv+tL4qL0X9+rL41BLzTL/SF4vYA3fm5E1dj?=
 =?us-ascii?Q?TyzMMW36OJs9q0b3ydlLTH/VIDKLBc0O8wFEHzBaF9ZHNo4AOoZKvXLt9625?=
 =?us-ascii?Q?sTPydwcjjTYdA6JuqWleVZZu0Ftw44VcaqvnNarQoMiyEG0IE7vPBY1TZAYY?=
 =?us-ascii?Q?fHGoJWaP+Zz/PEGRCl15ZeOs7+SHEhp89qKvjJGD5JcsHXfkkpk06MDSsVtX?=
 =?us-ascii?Q?FpRv8pwN/JvNxPoi6wWHrW5RGEsdyaeICf9jh4fJz02JIbONx8wAkgL1q8Uy?=
 =?us-ascii?Q?muEEKwObnHqdfUSqElwJeAuw4KMTscORNEmoyqmgYjAL8ZtCN+vjZTLe+qOF?=
 =?us-ascii?Q?gTOr5qnZHKL7wkV+aY2mrHA9NU7riAgYTwy9Dca/IgYennnBYybUFaheBSvu?=
 =?us-ascii?Q?yjVpHqExEgMFf06YwQ06cD55jeVqKwtUHfplHp49C3S1cOoCWUisIJWyS/xZ?=
 =?us-ascii?Q?ZRLcnOcQqWi76dwswjuou6S0vKiizFJDNHA+JLHqG/iUZ5ezLMTfvHidAa3S?=
 =?us-ascii?Q?DgK96UqKtClg2veKuHZeTlTtQf7vbvRG/UsjN7UF4B9mwSuH06YlgtqG9pZ0?=
 =?us-ascii?Q?P1xxu9Epdv5RwqBlv3tJBZ6hPBFQQgM28/nm+7KYds/KEg6UWKP9ntv+3myz?=
 =?us-ascii?Q?+Frv2izA4LVh3jlbBoiaxncRPlnNC0r7r6JIirhCsXaD3JjburNKLK4ZqDx0?=
 =?us-ascii?Q?clDL2IYWbeJ1/9+mI3YVgn4L2KxRCOmvTyLiXCgJP+x8L5Q47seWuSmmFFRT?=
 =?us-ascii?Q?yAbYAnXVypXh4NJwH9LM1srgjOD+VX/ZM03vJCJ8r+8aWSzZLiKd22cAp0Sd?=
 =?us-ascii?Q?HXZHYPbINcG3AVAJiIg1bYHNO8MuAN47gjpa+18/2bxG8QFQkwffB6WdJUjM?=
 =?us-ascii?Q?sqVLss3n3EguCKF2mN2T+Co9JMZwS/97NiBIvhM4CiJ45caMtW2hboqFAPMy?=
 =?us-ascii?Q?YQOTqHkvE9FEfbel5W7dCBWQbJtxqd0BlnSHNgVguo34yExUEd0hA30oATnC?=
 =?us-ascii?Q?0T22F3PI7gD5BPLc+7Ragdrxg1+59UmEzGBzurp1ZD6as9NsKRXeCSiteC5d?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ab8412-da28-4f84-5c64-08dc75c8a26d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 16:52:55.9881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KITPE69IegcaUKa3LWlA9Y0qKGtcF9/VWknhYWZmUPRS6fq9OUuJvFscistMwTsr/M1zxsOy4Augj0YEaLgZYdaxosn0ABUimtgUJvLDRjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
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

Hi Rodrigo,

I have not checked the patch in detail yet but it seems it needs to be
rebased. Also we should probably trigger CI?

Francois

On Mon, May 13, 2024 at 02:55:18PM -0400, Rodrigo Vivi wrote:
> Standardize d3 setup and ensure that it tests with D3cold and
> D3hot.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tests/intel/xe_pm.c | 80 ++++++++++++++++++++++++---------------------
>  1 file changed, 42 insertions(+), 38 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 81226a910..4aeddaea8 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -519,19 +519,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>  }
>  
>  /**
> - * SUBTEST: d3-mmap-%s
> + * SUBTEST: %s-mmap-%s
>   * Description:
>   *	Validate mmap memory mapping with d3 state, for %arg[1] region,
>   *	if supported by device.
> + *
>   * arg[1]:
>   *
> + * @d3hot:	d3hot
> + * @d3cold:	d3cold
> + *
> + * arg[2]:
> + *
>   * @vram:	vram region
>   * @system:	system region
>   *
>   * Functionality: pm-d3
>   */
>  static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
> -		      enum mem_op first_op)
> +		      enum mem_op first_op, enum igt_acpi_d_state d_state)
>  {
>  	size_t bo_size = 8192;
>  	uint32_t *map = NULL;
> @@ -540,7 +546,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>  
>  	igt_require_f(placement, "Device doesn't support such memory region\n");
>  
> -	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	igt_assert(in_d3(device, d_state));
>  	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
> @@ -566,7 +572,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>  	close(fw_handle);
>  	sleep(1);
>  
> -	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	igt_assert(in_d3(device, d_state));
>  	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++) {
> @@ -581,7 +587,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>  		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
>  			   active_time);
>  
> -	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	igt_assert(in_d3(device, d_state));
>  	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++) {
> @@ -591,7 +597,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>  			igt_assert(map[i] == MAGIC_2);
>  	}
>  
> -	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	igt_assert(in_d3(device, d_state));
>  
>  	/* Runtime resume and check the pattern */
>  	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> @@ -772,6 +778,36 @@ igt_main
>  					  NO_SUSPEND, d->state, 0);
>  			cleanup_d3(device);
>  		}
> +
> +		igt_describe_f("Validate mmap memory mappings with system region,"
> +			       "when device along with parent bridge in %s", d->name);
> +		igt_subtest_f("%s-mmap-system", d->name) {
> +			igt_assert(setup_d3(device, d->state));
> +			test_mmap(device, system_memory(device.fd_xe), 0,
> +				  READ, d->state);
> +			test_mmap(device, system_memory(device.fd_xe), 0,
> +				  WRITE, d->state);
> +			cleanup_d3(device);
> +		}
> +
> +		igt_describe_f("Validate mmap memory mappings with vram region,"
> +			     "when device along with parent bridge in %s", d->name);
> +		igt_subtest_f("%s-mmap-vram", d->name) {
> +			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
> +
> +			/* Give some auto suspend delay to validate rpm active during page fault */
> +			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
> +			igt_assert(setup_d3(device, d->state));
> +			test_mmap(device, vram_memory(device.fd_xe, 0),
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +				  READ, d->state);
> +			test_mmap(device, vram_memory(device.fd_xe, 0),
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +				  WRITE, d->state);
> +			cleanup_d3(device);
> +
> +			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
> +		}
>  	}
>  
>  	igt_subtest_group {
> @@ -787,38 +823,6 @@ igt_main
>  			test_vram_d3cold_threshold(device, sysfs_fd);
>  		}
>  
> -		igt_describe("Validate mmap memory mappings with system region,"
> -			     "when device along with parent bridge in d3");
> -		igt_subtest("d3-mmap-system") {
> -			dpms_on_off(device, DRM_MODE_DPMS_OFF);
> -			test_mmap(device, system_memory(device.fd_xe), 0, READ);
> -			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
> -			dpms_on_off(device, DRM_MODE_DPMS_ON);
> -		}
> -
> -		igt_describe("Validate mmap memory mappings with vram region,"
> -			     "when device along with parent bridge in d3");
> -		igt_subtest("d3-mmap-vram") {
> -			int delay_ms;
> -
> -			if (device.pci_root != device.pci_xe) {
> -				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
> -				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
> -			}
> -
> -			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
> -
> -			/* Give some auto suspend delay to validate rpm active during page fault */
> -			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
> -			dpms_on_off(device, DRM_MODE_DPMS_OFF);
> -			test_mmap(device, vram_memory(device.fd_xe, 0),
> -				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
> -			test_mmap(device, vram_memory(device.fd_xe, 0),
> -				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
> -			dpms_on_off(device, DRM_MODE_DPMS_ON);
> -			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
> -		}
> -
>  		igt_subtest("mocs_suspend_resume")
>  			test_mocs_suspend_resume(device, 1, 0);
>  	}
> -- 
> 2.44.0
> 
