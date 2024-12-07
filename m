Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B7AE77173
	for <igt-dev@archiver.kernel.org>; Sat,  7 Dec 2024 00:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184C510E1F4;
	Sat,  7 Dec 2024 00:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAr7BDeK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB5210E1F4
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Dec 2024 00:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733530219; x=1765066219;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=38i8Od91byyajgedxlzMsmeZT8X68Zt7NTrfgAZHuBM=;
 b=TAr7BDeK43FYtscQC1IQF7htpqTOvF4YMVEtLs1HFWQ86w8yDsb1q2aV
 eUA2iVnA3Ei3DVQYSk32slqH29dRHd3WAW2iPp6kbk15xzu7bn+5zr/4c
 vexHHZ+v6pXN4KvOI+hF4qBCY55nL3PLfjTqR/eZwWfbhpzGHbICmQC8s
 dVzeLyFrvs71dmDhfGGaOgYQ35FpanqXH+0hru0uPLAnNgeMRjo2/lbM9
 SYK7+QDIdamgJ/rtl/EuSoquksizjcLxsaCaYIxxYxEqvsUkiR+344FiW
 mPDqh0V6uwFhvqW4qm0R8MqimzbVCnz7ji1Fni11XLfmyv2slddtGn7XB A==;
X-CSE-ConnectionGUID: j9RauibQTiaLeoCkuh02Nw==
X-CSE-MsgGUID: PKllH/uTRoqSMITy/1Dwxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="34137554"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="34137554"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 16:10:12 -0800
X-CSE-ConnectionGUID: +K//hM1iSeCJQBI8OJ8NOw==
X-CSE-MsgGUID: 5t3GtIRyQ5uzehXi0+6wxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="94636367"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 16:10:09 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 16:10:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 16:10:08 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 16:10:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlqiUiwchhWOWo49BI/Fmo3The+LBgITU+4TcISGz9NHOX6cAXrEGPpz1Xiv860AXMq/SACghSSG6R+JVs6CcLi9wD8N2MAT1V7Atgv9Xg7cEM90zZ23oKZffKYrVpmGZcX503QcOnBhNYln4SaxgW+3qeFousK6Yvr6jsoH6rMp+d0pReiN30BObTWLRUO2oz5N++jGEsrbnt1EZdSdPObLEcR09RA99nq2XaMA8C5UaDXF9OjhzASgapePpBeXimC8LIdqvNj2R/0RPGJLDYkAzoV4Rmdr6ykwsk68duRXumtyZeXZp3U/fmQdPk11OE8ojMcJlHnyl/TucvUm/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F79RUwKFupuI1ywq/Sj9NA7dMPY6LDEeKnuHnMnDQQU=;
 b=vi0kCOitXYcgM//+dhBv+dN32LzvTngLSWGuK268X0cNjL2peColoEvh7EqVoK3GKr0rkkrGyRB9mVlit06Hm2uRcN+Oco9GOycLzUNaQaqv7rG/Y6wVd+Z5suGjzHORWAycUXZoSUfzHrrsrkILO3k3Iyo8cq0zj2TQXDf64q2jgYdAKFh30VNq1EjN7OxSnCV0hOZlIaRMftXqzFCPLrFDOS4hufR6Sq6v1DK3kwEroylmqD3fS24bGOkYA+u0atefB7r2VhcP/8vTBN0IP/fGSM2saX3KVzwFXf33IvjCKCOOsfu0WnvZFcTaDWys+U5960T5NovzEw27S8/zVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Sat, 7 Dec
 2024 00:10:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Sat, 7 Dec 2024
 00:10:05 +0000
Date: Fri, 6 Dec 2024 16:10:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Clint Taylor <clinton.a.taylor@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 6/8] XE3: tests/kms_cursor_legacy:
 flip_vs_cursor_busy_crc was requiring any driver but used intel x-tile
Message-ID: <20241207001003.GN3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
 <20241206212748.2101217-7-clinton.a.taylor@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241206212748.2101217-7-clinton.a.taylor@intel.com>
X-ClientProxiedBy: SJ0PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d5c424-80ac-4f31-a226-08dd1653808b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kH0/7SdVlOnbWCBWHGnNvw8X+daaXvfNiWD1WNLEmy1wbT8B3flV9n9XlrlZ?=
 =?us-ascii?Q?/npFX/PNW8q2LB1zG4ggeQ7UblHBe/K/Roqv3+tht7NbH/gq0nyX4FqhO8sm?=
 =?us-ascii?Q?ph5OU3t7G8ukXeP6W4eJKhBmgH9oqScQe+umZaCoUtyA9QBLDxj4X1Bi97KH?=
 =?us-ascii?Q?aQpS9VDvlyFZonZLZ2+rIQCLVEjfFvixB8gfkfogfB6uofTdn7hRON99mS55?=
 =?us-ascii?Q?/63JmLrww3tYz1UbuLW7hK8xMczBl5IurzwD0N8Rj19qKQa/kwdW7YleGhxR?=
 =?us-ascii?Q?Wo/kIDnPYNlPVHUw8fSpzsRS0LhX0KkrbH/hXk85xCVcKJk36sLlAFWmVAOz?=
 =?us-ascii?Q?i78nBfpVgsb68Mjw/zf56ReHUbdnpqjuis0lPElQ3IaN1ICC3YNpOfVJb6Y7?=
 =?us-ascii?Q?Mxzg2GXxg0y0xY7w9qqWY+TVk7k8IFDJVzKiX/Gna6YDyHbYZ8j/iEjFjQHq?=
 =?us-ascii?Q?qOAoVA55IR9wviDCjQbX0waHvUXtsn380Fk6zrM2dZEPSx4WB8MKVRZ0Zb1U?=
 =?us-ascii?Q?4qUSea04tOlGLghxSu1S0xxt6avhzRhOzdVlHZDLqSQGAHOjGe5IEeE5vrzw?=
 =?us-ascii?Q?YEQrLKhcDOakKnXri/BgSx2Ph9qDI/DLHrKRs4ufTKHfp0E0nSdfyPp3xMB+?=
 =?us-ascii?Q?irr42aWriUq/ThqhtAlzCMLX34lE388vmeXiyaO1fgQ34roZsrSyf0wI8s3s?=
 =?us-ascii?Q?WAe2ignhuzb05+Ka+MnG0TU7+XS8t6QuGHFcFriEwDIDdpTh9B3r+DBjBf+9?=
 =?us-ascii?Q?vjyOnApPfHfvdx4dzxwnJstFsFheUJmHL7zfV2ewCR1M2L+/OAcMItXRd958?=
 =?us-ascii?Q?60/Zssd9fLuGgdIaLjU5eEo5jNtvrfzJ5yTilPmM85JUYYnJOyNxwhH7j580?=
 =?us-ascii?Q?m1rx7luremmrnv51K8d5mi2UB/aF6FxmN/gd/o/SksCFk76suMohLZqdapP8?=
 =?us-ascii?Q?PWLBiirElyx/TffmRezlSwOjUooZwWNp/XkQDiINF+BdLmHTRZE3Bpp7OK9c?=
 =?us-ascii?Q?YFXOxi4EdJlXK1psj0PCWKvd7bCWNWyA6trZafMgoxj3aH9X4yvwz+piLrtW?=
 =?us-ascii?Q?zkgXGMOD8rSY+eo9uWZf1z9/kOfDu95/klsvvf5/PRYJMTWcFfkoKxB5knrc?=
 =?us-ascii?Q?9qRw7ejNRWPqv9RWQiONkEswlbJouiZG1Coau/mOH5wnC7OxNU4Qlx9xXFZP?=
 =?us-ascii?Q?P6ujRFy6mKMxE7yY2fvbPZV+4xvFcFTYBvCsn/Y/4LL37SKTnUevL7km8pOV?=
 =?us-ascii?Q?fQacku8ZzhKLznTzK335X5X6873Gn4mJFLoh3OV0yfuExI2XBSOaEDuH4Hnh?=
 =?us-ascii?Q?M8uDK52jPm0TvlNYzi3gvDGrh/i3bBLYIoXdBndZ0peraA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T/tmGLJvdtYT4X52ZW32wZHpSqMAIZa3oAPE2lYabjCUrVIrXX7X6y3CbZNu?=
 =?us-ascii?Q?4NJHryMVom5ENOQ2PHInQj0gsPT7roinBiOE4AcYborUmdDk6X4oIY2la/bH?=
 =?us-ascii?Q?Bz1XFwQ+cXFA2cFnxJgJXqvx29mPv34XFthh3zqVx2IHo2ilaNKDBrl2fuIC?=
 =?us-ascii?Q?y/CJACjRwH8Rf5HSEhr17/fOyV4Qxzys9qdyqNDoV5C5RnMME8e0cfllTYHK?=
 =?us-ascii?Q?rj2aHYzro9R+nEILO0e/Snwi2vi5Q3JMdTI9xHScdgVwV2IGAxc2Qgky+rK2?=
 =?us-ascii?Q?5IQz97MiSAMpE2LnTpmLfIPdPoQCTjMQSZpd4IVSmqRDmKNSwNXblFaKxojH?=
 =?us-ascii?Q?rAvfyNm1s2PcAg7LcUkm3bFxtjk+IQAuC/2u3m7YyRjuzPvnXY6Hb351NlAN?=
 =?us-ascii?Q?uyR1fS3zUMwFH3iPDA3YHkpW1Fkp36+NsBUan4k2hPIL492lSnSy5ZRnr+Md?=
 =?us-ascii?Q?lKvRhN6gEb+axRO+6bfZ1tiH3GZlGiMJMaDXXHguw1qBmgYeWRjgjkK/iav7?=
 =?us-ascii?Q?q6+OCgCwvoRqX7xcEg4ywoFt2nfjLAnkIC5R9DR8O5XN91P+epdqF3lsAlah?=
 =?us-ascii?Q?T6kKeaWijJuV7MRjBdKVKkxJj5/exgzuyo4O7HDdJZZllbf8gEW3DadX7eth?=
 =?us-ascii?Q?XHSP7VSC/qsmJzG5AyyaQDmtxdDa61g8BUHnaetqQyH9l2wDNVvaRFod95a3?=
 =?us-ascii?Q?aBrAlIDcH5aeZHvbDJFsbGz113Ns8k6Z5QYgkFBsuhnGVwxWuwLWGMOdICkg?=
 =?us-ascii?Q?8DzzcgSF1o7cNnv+YbFwmxxXKjs8g5pCb1ObLzdWdoq39veeYCrQ3IUkPthx?=
 =?us-ascii?Q?O1X9Gx8JflVq90NGT3JMSbvt51jvEZz9cY8jd/fHjazJQg0Vp6P6EgSh5Zb4?=
 =?us-ascii?Q?DGUlfaWJlQ898Oo4MmJis/95xaHyHWsxIOFTXhEFPcVGAmsrFpWY+xNB5J9v?=
 =?us-ascii?Q?voZxrdgd4N64TpCpkKgLs9jo/KKxOsMeBCwMbeCaisJD+u0Frp3UNyZ/4AQc?=
 =?us-ascii?Q?7IqwxxFGXPscvJITP6e3NI3VNl44N7o78Nf2sDeLTXpz4PayrZTCPbHOkoKC?=
 =?us-ascii?Q?AVBZXq3EYrRGmqiR12RWWGncLNHXdzqDjcWanForhP/F0kAzyXZJx6oIPXOC?=
 =?us-ascii?Q?LCYB42PZ2Y7X23wgCS3dNWHMbGSD+q0j5cdludYEwLojmAlAax+zeZ8GwPKg?=
 =?us-ascii?Q?WuO1Zsfx5jXs8bxZyfZD/yu19Uc+Tg3f8iqI5T1Ryb5L/PjQ6BjF0u+bs/7p?=
 =?us-ascii?Q?sgZl3Q6glohw9o+N4q5mixb4zK/eIRUuNXDmDAYVC8YF/NZgoo+dns+YeHsr?=
 =?us-ascii?Q?7l5Uq2mGDvh8vM/8EEGz5A6ZTas+wUV3vXtqx/IVvvuafaUVsvAUrLV0X5d3?=
 =?us-ascii?Q?mPoEiU3UYeJMlALF3EPZ1W/Mq6NtL2dr2g2dY3FxTB+LwmkHsmEqkc3BI2gY?=
 =?us-ascii?Q?VcLXtbyVLZkSYrqJkuj2Zj0zNjZSBS4RRMOp1wM6POnDqCcprHD3NQa618Ws?=
 =?us-ascii?Q?dqrL+IQxwgDmbfycFRdl3eSm3nSKi6bOOLZCmWTlVrgNh7AKB/Iucu3+HHKi?=
 =?us-ascii?Q?3sUP5kgGISvUv+EmiHfgs+4a7ragZqrbGEZ38WCdI4b4OHQwUhCdV9l9fYxC?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d5c424-80ac-4f31-a226-08dd1653808b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 00:10:05.2825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GA8QqVTRw6QzoC8/eFYGnvLOILPB5d9m9fmgMm7vs3ef9WbOgq23jSCLFvYdzqeCldCDqaa8X7/c3aCPIgQNVrdo0Z1R3scCbY5l3scNVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
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

On Fri, Dec 06, 2024 at 01:27:46PM -0800, Clint Taylor wrote:
> From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
> 
> switch flip_vs_cursor_busy_crc to use linear framebuffer instead of x-tile

You should probably elaborate on why here (i.e., not all platforms
support X-tiled framebuffers anymore).

> 
> Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>

Another case where the name format needs to be fixed.


Matt

> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> ---
>  tests/kms_cursor_legacy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 4e2cfde17..1f082df2d 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1679,7 +1679,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>  	set_fb_on_crtc(display, pipe, output, &fb_info[0]);
>  	plane_primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_create_color_pattern_fb(display->drm_fd, fb_info[0].width, fb_info[0].height,
> -				    DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED, .1, .1, .1, &fb_info[1]);
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, .1, .1, .1, &fb_info[1]);
>  
>  	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
>  			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
