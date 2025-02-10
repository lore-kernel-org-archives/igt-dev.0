Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6053C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 16:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306E810E5BE;
	Mon, 10 Feb 2025 16:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cs40J8h8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C88010E5DE
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739206058; x=1770742058;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UWaTEAMUur64RfO9PpJ1J/02zbJugdZtl1chFFJSJhE=;
 b=Cs40J8h87uLs7zUrgPbLe2EVrBrszAeb3fJZOjke8B6OSdHZ4Y7igTND
 Q4BwGDue9ikkPiBy+B0RnSCr0485ewnXFDKICBk0qq6iQP1FIlXl+yl9f
 gc8UlGhiPMmkdrQeDiR3BFUcf5mPbG6JmF5eBleGBfaIbew0RJOD+Ibuk
 MoxjcZfNQQ6uRMrwqyXINmPSzi0lnGZOK8ieoVFL6ya89i0kH4EN9a6Fp
 ExhCQHJtH0+lyPlaFK/Dd+OJS7lDhXbJiQeiwGNpd+waEoDFKInFC15MJ
 eYduWX1Lfj9BIf5T+wK1O9KHu4qHpHazHaAk3h5ZCbX8sa3WqTOHvx1Bu Q==;
X-CSE-ConnectionGUID: o009q4WuQjapOBYCk9URdA==
X-CSE-MsgGUID: ESlAbeocSDCQCneDueUJ3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39483637"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39483637"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 08:47:38 -0800
X-CSE-ConnectionGUID: T/7lnJ2VTsuZGuEO4EsC8Q==
X-CSE-MsgGUID: 3FylvpxcTnCdIK9NE06LQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="143113764"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 08:47:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 08:47:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 08:47:37 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 08:47:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPNb8kkvUXtdKmqn4h5YzktJPOGTdy7Hlfrj9zobHlLRyqsA8tQuTnbVg8hiF03x60OKF5P/XK0CAyf0JHY1hN5bEUK/L6JB8ZMpITxSNnrnXcWzZh/0ql9kIJSmpuUwQACkKo02YJa9zD3s6IoTS1OXUXLWVnzEz9XsGP5sjG9IAVkHuvzAPH5EO6Sn0y8at21Ak19heyBrj4IfSiQAnPOkTpZEM1yuAXXaWzACCkZGtfJxc+0FRyVpJ/w1B47FhvzMnoPFFHYI/QyAXsSSPXCI7Gph0ZrcMIT+lMSjp9y2nSTIk9vy0+30V04PIP5m6eBJJRAt0QMzmFWm85mPAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51ERlvOGaAsk2eUr/x/JhBF7RPPbUJKD8swpXuXQHL4=;
 b=aQ7PqJ6a16zb+qiCAUSHaiYoJmMjvaOO7P87ty2PRCje8+JJVYRUJfYvKChJiyVRmh/UsbNNMoyD0j2BOpMOJGSnF2bzSWIK6QZSaH2JJBcbsJ0Zv4hodrLAfCpp4ov5Jd3vbt4c4tw5N91lwPXKA91QYReHOdNH+hd8dmpOGFLpfZ7UzItCV8UXlbKCKEwHkpNHxycZY8k2iLv9n6+aVaeKz4RH2lKaFldEO+bGeEG/5uFCPSCGHU1tC+a6tbmY5SdM44LmgSRRqa8/xHb7/jL/7NiEuNdJtOCJrVd6XBE6wdVf2a70GmeG+B9bFwJeH0Iuq7a8M4ITVHUOcQezKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by MN0PR11MB6033.namprd11.prod.outlook.com (2603:10b6:208:374::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 16:47:35 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 16:47:34 +0000
Date: Mon, 10 Feb 2025 11:47:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>, Petri Latvala
 <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
Message-ID: <Z6otorjM88ECUD-2@intel.com>
References: <20250207001432.48524-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250207001432.48524-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: MW4P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::24) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|MN0PR11MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c3dc5ec-f440-4ce5-3b7f-08dd49f29dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NCxLCEcQYnBwACqthFX2d4XT8mhSlzw01KmX5ss7y8s04eHtK2ozFvGN3htU?=
 =?us-ascii?Q?C6zMXaiDCz+bT++HgLIo38XWOC+RLfGyB9S3VKCl1Op3xc/6KLcepV6NKY94?=
 =?us-ascii?Q?XQAqf80nJRHKVZun3ptOTYBRGUqBsyHy28epW5MbNi7cVqmRcSqO1j3y09rG?=
 =?us-ascii?Q?vN6zSMzGuQAx4pMWmIYO/JW5oBKrrRxIM/DYR0J9C41sPtyxEzshFLrSSYm6?=
 =?us-ascii?Q?mTKxV/2hTn+hIdh38iaa4VczyhV3/Jah+00SMhLP3ZyUUdOYAbcpwa9FoC7c?=
 =?us-ascii?Q?CL7EP9lfknY8LqiTomgZDLaFSXXntqwzW7oZqnvTggtoOHJc/aqdnDsz6uKS?=
 =?us-ascii?Q?txtmChhP933s6agwk0aEx6oA0HX44ahxqFXcqMZ/8WhuS+cGFpXZZeGosqtY?=
 =?us-ascii?Q?QISRVIQ/0LysSbjCTFssIXJMRLkS0DKucB3KW+iWct8xK/c8WzNRKmR9guco?=
 =?us-ascii?Q?fKHwAAcek0h8JbHqqhfMV7bujJaKqM/6Dh/yPYe6oc7gGlgimy8yfMXLNMXI?=
 =?us-ascii?Q?9917PUc7Hcc4DHbiAfiqJgURnWOPaBPQIp995P2rVHyJEnmjfPJPcQ5JfqIm?=
 =?us-ascii?Q?NqpbR6S4a86PdDo9oAWoIvCo7TUslErtYNiTs345zjjq+MgeR3PXP4hA23Px?=
 =?us-ascii?Q?ko0UP+OIqyqWQyd2xHrRtrjYgWKS/0ynHX3ppBIRe5SNxfNO0o5JUVCG+Efl?=
 =?us-ascii?Q?HJFOMSzPOtnTHo7Jw6t4esLvCKsPZ7IfEU/TDr4ZKJZ38uiBTQ2hogHmxMcG?=
 =?us-ascii?Q?0LRDpScG6qKqQDS/Dt1vRFk/S2IGhdVkzhMpRK5YV2vDaH0bSkSfJ93oC5Wu?=
 =?us-ascii?Q?89asLIY0TiagZcBDlZIUKL6Htxh3p6FcwUZwmxA1pUi0x4SDh4yOapa2jWhK?=
 =?us-ascii?Q?RptGLjFKNorSkzR4jLLJnpRgr1vkoDG+oU+AW6wfAoowyzEcVbp+HJzgstqZ?=
 =?us-ascii?Q?EYoj7KL+WSFUWAMyNo+KU4DYbD/cSvEcayy4VmY69qBS5aNNUgIBQ3CD+uvv?=
 =?us-ascii?Q?zKwP9MnW4U+3STCDg3BKWGTzbKiCrgKz6FmNsT8fbTMRTusyekR4tRKfnHZp?=
 =?us-ascii?Q?w4y0ulymrL52CebHsxIyXUfxyUo5Y2aW8E16Xag/BZ8DW/0d23bWXrFPtp/a?=
 =?us-ascii?Q?y2r3TkVjXA7Ls9fmT0t9/INKU68Mx5rfpYpLVLPFO50JIKo3fmUty3yNEqGJ?=
 =?us-ascii?Q?6n+uzyNL1xvmDTAeR1cq8o4FjzySggy0kXIrms0OeA3jQgwZLdtmkfOPkpNr?=
 =?us-ascii?Q?HtZ0+gr++DfquNb55fNBUtYW0ithoY9cRYJwjFmjphM/pO/O8LUJzHBMW2xI?=
 =?us-ascii?Q?ke6/Pvm+Un1GFfVZ9kBLGIeuPjgiFENNkeOudEGUdonbpnNvK2duikaioIhM?=
 =?us-ascii?Q?+7Tmtni1DWuFhnGVpbiE4Ks+deT/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ap9Z2rRkaaUn8y1821PKEIn5Hfml9dURah8ifQ4RLAopy+4Zkzo1X1TTGXnz?=
 =?us-ascii?Q?CPb6TZborQz7Bik6pxroDpP2r8JE+84bsxDzJyY9plIGlZIc6aKMYWj0zc8m?=
 =?us-ascii?Q?tRb2HTWvspZBGS3jhWxi3LMdhBsLaEKg08ixB1+eyylBtDuPlp9cvfpz71H4?=
 =?us-ascii?Q?rqS5yGi6zXYikoBB2bf7tT79SAXWriv4JF8IZTEtUItV0ox3CMjkYbPDfyvM?=
 =?us-ascii?Q?G4ZZgybQR/bFcRxQsVkrHrWvfZN7k1m7/YTauaDjGdUQfXtqMCdfbXyaggjc?=
 =?us-ascii?Q?ayAftHkaZ1VP/w5YURAJ/XjKPNziVM1Qrx/+XrhgMCuAgq0FNOso5E7N/N3U?=
 =?us-ascii?Q?mIt2zRJZ2UsmIVp72Gqn9GDEpIT7PatSM8K2MjxpJ45WONM9wnKuJb3qJNjj?=
 =?us-ascii?Q?fZXog+LOcCllIszhBT3GUWBO4UEqyyJZz53c7Yg0urmUjPlji7tpnHydSTer?=
 =?us-ascii?Q?hpGO+u1qYGkpI49DNF2zfNlU2wigsNy+l2ChtmikwPqe2KRVuCy/dYGEN/aI?=
 =?us-ascii?Q?MHFYgnFNAW+ysZb6HInBjUw3YQiCSxLo3NC4iV2nSivqASmD73pqfV6Xdlpj?=
 =?us-ascii?Q?n7OqiNLAbGisj7ExRz5xyooXz1IvA+Joomczgzewv736+rwCjGAiIaAxsxCz?=
 =?us-ascii?Q?m2kMTYQ0t3pQdxyuIwYKQaaTIqTSdWZWnuMuaTFC1EiJqhE/QTFpO4T+L7ym?=
 =?us-ascii?Q?vPh63eLxsOW9BGeopHFOBNqbXlxpEtwwBXdldfBVYhkwHka24j3Z9iEaMrpe?=
 =?us-ascii?Q?EiFIMXICTkjDSh3KwzWQ4LayAAPTczYVvmTY6LLBLk0wrPtJWYANhapQ4+Oe?=
 =?us-ascii?Q?sXDju2i/Dh4X6IOkGz9a9GWDV4qZjbzyhpd/MuH6wM0mn5rN2nOuR1Axrqie?=
 =?us-ascii?Q?xG1rqkSwTy8Saezu1fAPeAV66AI5msKRx44kEQJxqC2BxxWz8VY5fk5/Purb?=
 =?us-ascii?Q?BpRvz6ljducKMOIf3XcKMP01Hr8elPCmZZRqlmqwtUaXG4nMQpNN0v5nFxvX?=
 =?us-ascii?Q?mYe/UX9H7ZiAwC7tfNu15OSX+MKK3A0wOCdVeZHj6yfSqvEJQbZTlzt79rPT?=
 =?us-ascii?Q?YKiRlb1oeFb3wjJ7ch4z2uTHyojQs1o1JFU22tVZFYm4UiaP7KSphrhapuiU?=
 =?us-ascii?Q?XTSORV0z+v+mQcEbhAeThVf1LC1SqvK6GjPjIvZLSPpAUWv2UyQLnTYpeMMi?=
 =?us-ascii?Q?tSFf26GgP35nIL/ZrEwfLlnl4Ojemcub7v+DGnkev+Q9XTdETwWM4qL/Ixbo?=
 =?us-ascii?Q?+xw5MwXAA0NHPF9gjUN+Oqtwr3rVw22WQowY/pFRodeQLuwLupUdWjt8M+xh?=
 =?us-ascii?Q?+58jN5eEYYX/4P8Ak/0rboCsE51YLXa+P4d+r1aeT/wDnUKX5R6o2WlMWbLl?=
 =?us-ascii?Q?ShnpdjXep0n7Fl5eEn0jo1R026Qu3I8P+IM2XP3xoMwhPv9wtfagLl6xHU1r?=
 =?us-ascii?Q?14BocnzYgM6RsHBnNJJw/6L9nmEdaYfpRZdN7BYrCoWMYFXu2wilRDgcbDRd?=
 =?us-ascii?Q?22Y4KTQJHz+LhZFNmB0Q30dtyGXypZSsLOu6ePl1pYuUoIz2t6nBHeGOfc+q?=
 =?us-ascii?Q?ZW9IlXG0PVokPrALNu0ue0OxJgr1ZETtxiJ3OKt90QibXZUU2NsbpQKOKGbT?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3dc5ec-f440-4ce5-3b7f-08dd49f29dde
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 16:47:33.9534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ct/0X5hqMpHALN2dGrTcRtx94WDsgtbYHJIPd7iCkVcR4j9FR7s4o8JDUtfMf9ces6wa996qEUeEeMbiSppoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6033
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

On Thu, Feb 06, 2025 at 04:14:32PM -0800, Matt Atwood wrote:
> There have been several changes to pciids upstream that need to be
> sync'd into igt. This synchronization is different from the normal
> process because kernel history differences in drm-xe-next, and
> drm-i915-next cause conflicts that create conflicts.

I did a s/drm-i915-next/drm-intel-next (i915)/ while applying the patch

But I forgot the -s on both b4 shazam and on git amend,
so the patch is without my signed off by...

Cc IGT maintainers here to see if there's some correction needed.

I'm sorry for the mistake,
Rodrigo.

> 
> Sync with the following kernel commits:
> f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
> ranges")
> e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
> fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
> 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")
> 
> v2: More verbose commit message
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  lib/pciids.h | 62 +++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 47 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 23f349f65..4736ea525 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -717,37 +717,66 @@
>  	MACRO__(0xA7AB, ## __VA_ARGS__)
>  
>  /* DG2 */
> -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> -	MACRO__(0x5690, ## __VA_ARGS__), \
> -	MACRO__(0x5691, ## __VA_ARGS__), \
> -	MACRO__(0x5692, ## __VA_ARGS__), \
> +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
>  	MACRO__(0x56A0, ## __VA_ARGS__), \
>  	MACRO__(0x56A1, ## __VA_ARGS__), \
> -	MACRO__(0x56A2, ## __VA_ARGS__), \
> +	MACRO__(0x56A2, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
>  	MACRO__(0x56BE, ## __VA_ARGS__), \
>  	MACRO__(0x56BF, ## __VA_ARGS__)
>  
> -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> -	MACRO__(0x5693, ## __VA_ARGS__), \
> -	MACRO__(0x5694, ## __VA_ARGS__), \
> -	MACRO__(0x5695, ## __VA_ARGS__), \
> +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
> +	MACRO__(0x5690, ## __VA_ARGS__), \
> +	MACRO__(0x5691, ## __VA_ARGS__), \
> +	MACRO__(0x5692, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
>  	MACRO__(0x56A5, ## __VA_ARGS__), \
>  	MACRO__(0x56A6, ## __VA_ARGS__), \
>  	MACRO__(0x56B0, ## __VA_ARGS__), \
> -	MACRO__(0x56B1, ## __VA_ARGS__), \
> +	MACRO__(0x56B1, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
>  	MACRO__(0x56BA, ## __VA_ARGS__), \
>  	MACRO__(0x56BB, ## __VA_ARGS__), \
>  	MACRO__(0x56BC, ## __VA_ARGS__), \
>  	MACRO__(0x56BD, ## __VA_ARGS__)
>  
> -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> -	MACRO__(0x5696, ## __VA_ARGS__), \
> -	MACRO__(0x5697, ## __VA_ARGS__), \
> +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
> +	MACRO__(0x5693, ## __VA_ARGS__), \
> +	MACRO__(0x5694, ## __VA_ARGS__), \
> +	MACRO__(0x5695, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
>  	MACRO__(0x56A3, ## __VA_ARGS__), \
>  	MACRO__(0x56A4, ## __VA_ARGS__), \
>  	MACRO__(0x56B2, ## __VA_ARGS__), \
>  	MACRO__(0x56B3, ## __VA_ARGS__)
>  
> +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
> +	MACRO__(0x5696, ## __VA_ARGS__), \
> +	MACRO__(0x5697, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
> +
> +#define INTEL_DG2_D_IDS(MACRO__, ...) \
> +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
> +
>  #define INTEL_DG2_IDS(MACRO__, ...) \
>  	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
>  	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
> @@ -782,9 +811,12 @@
>  	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
>  
>  /* MTL */
> -#define INTEL_MTL_IDS(MACRO__, ...) \
> +#define INTEL_MTL_U_IDS(MACRO__, ...) \
>  	MACRO__(0x7D40, ## __VA_ARGS__), \
> -	MACRO__(0x7D45, ## __VA_ARGS__), \
> +	MACRO__(0x7D45, ## __VA_ARGS__)
> +
> +#define INTEL_MTL_IDS(MACRO__, ...) \
> +	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
>  	MACRO__(0x7D55, ## __VA_ARGS__), \
>  	MACRO__(0x7D60, ## __VA_ARGS__), \
>  	MACRO__(0x7DD5, ## __VA_ARGS__)
> -- 
> 2.45.0
> 
