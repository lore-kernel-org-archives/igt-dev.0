Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1706ECCD185
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 23:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC22010E904;
	Wed, 15 Oct 2025 23:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1qZYkH1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBED10E904
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 23:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760570123; x=1792106123;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=huQWzApwyT8g83caZIVmT84nkKxTEdKK3SYU6f+AWfw=;
 b=Q1qZYkH1lSQhzMU8qK1RZuPqDHRYqbgFkKGqpqpSIYWsAmvZXWa0Yqw+
 EFiayIGGZZNcETXLqzQgqcdUwlBJ4pOGtSFZORnVPS2SQFalrhMaWj8LK
 2JiO9Vkf5/0t5iAXT4cNDQIyP5+06G/uNWpHUQHbO6M2jrNLtTxWJKZmb
 tc1q7IhvTomAytKHHgXUnpcUjo0vnraHvej+I6AlnmzmndJL6NA3pl4Pk
 U6nPraNPnryG/r+ERWQT0PsY8+7sEZtPpTRXuLyDBI0ajZsCvZnGuwlYv
 iGVlGBr4npjdx+t8f/MFSrfbGZzD2l0zw07EA4fhe6GIgmFO+Nce+Kydc g==;
X-CSE-ConnectionGUID: +pQMMhzVTZWNG8Da7UjfVw==
X-CSE-MsgGUID: Msg6LZCDS9mXt8TIHGSDmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="80196732"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="80196732"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:15:23 -0700
X-CSE-ConnectionGUID: NwSVMr6wSI6FWeYHel7JHw==
X-CSE-MsgGUID: MfylN24KSeayUKm0Fhsa2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="181509457"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:15:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:15:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 16:15:22 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:15:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rH55aePXwx4yeic9IVtHeOHJFa3isBQquzxPNT8x3+UUGDRVl1yBHkulcMk5UQGKZ0/SzkNl+TPIONXZ1DcgnerVtedY6rUa74pXGKftN468s0R3D1cmrm6t4NfyTUHEgIsHVWogEOLXQzZAEqm9oRttlFlWBkeNi+iF2JmWIwa60KHtRKzI025CTlmdgQ9onpgkk8R9pCdGhBKU7oSXhbBBz3C16PbW6KoVKN/2psXu666tlyWhgVj6oW4VUhHcUCWCs7te/wfutOJIv37dc+SEr3Uh2qp2Ps2+BijCY4mJSqc0VPn3d3ySOZ+JGy71tkg+nPsy+U2PkxF2xtlYzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vaga10XFe4Ud85WfvwpSaDTsxnCu1BltffsCw1EHYKI=;
 b=wclVVuFKarUYD1ifhJoe7DNeBdcLlyIzdJSC+PAYmhGAiL78hKIsGZlSlTERMgZuS6d471uneCNAlOw11rCr/oa52/qTWQ2w1OFKr9TyFieOYOE21j1mlhopJsa6NNUg0tGo7pLkqwkGttrg7hbyMOx5wvRVP8QC1PQOd1DsRTydCOhMN2NnjNd3P7I7AlQU/BeK8xHUYuq9GRthismjMyAFdcpRgX15Q8JezdeytnWy8x22DgVeHTA95CBRcPXHcW2oOv1cxuJhpKaROWD3GnWWkJTAjqbgnm6/r34wpzi1vWugG3WQ1v9Br5oxGsvvj6a3mEEMP7XUljbrDdPhVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 23:15:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 23:15:18 +0000
Date: Wed, 15 Oct 2025 16:15:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v7 0/2] lib/intel_device_info: get the xe .graphics_rel
 from GMD_ID
Message-ID: <20251015231515.GE5409@mdroper-desk1.amr.corp.intel.com>
References: <20251015060144.6410-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015060144.6410-1-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ea7067-acc2-4583-915a-08de0c40b485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xH+LWgFTkqxXpkpUqyoghhtg4v4YgqP50ZyHgTviXxBh2x5LX4hlNPLAzYIN?=
 =?us-ascii?Q?kup8C27IX9ZA1znDkpkNMnZr0WNQLBu28fwIOO5sD6hvVrvQz/Sp1RciGLBl?=
 =?us-ascii?Q?wlWrqUeky7uRBw95QT05h+TeuGugZFX2yRoyXI/uOUJ1BsJ6Boq6OcthdNDJ?=
 =?us-ascii?Q?oeiHX8m3PSypdzR6I6IFwAMXVUMd0pDHoJPNGnzQKLPSjc5KlCnjqVyuDKdy?=
 =?us-ascii?Q?sHxFvzvbTk+BcqzWCCEcpMrRA2jZD80lqolHvJr/FWDGiggKUbmd3IB6eKJy?=
 =?us-ascii?Q?wXOTS8Qsw41li7QUD3Oa1nKgkTdkYFXGX+ZUPd9o3ukRI0aqS41erxzztZ6W?=
 =?us-ascii?Q?EBmWH/FLE6c3aNnLj9gVKn3kAbL0OphcyWcRIDsr5oBzRXPmjWAuKioGjbWq?=
 =?us-ascii?Q?+RpSZasU+e+daWB4kn4Kpvc85L1j9DcmTOpG6dfHnbt8wh9dtlQdVXhAIuYR?=
 =?us-ascii?Q?nRx0+i144uJZ1/g2FiHzeN3Cj2YJJkGNHkXQAuEtoocBCGq2qxxKsyz0i4DC?=
 =?us-ascii?Q?V/ZYNi6ghuXT+C4M9yOH7XDuH0zWVk5VKLkasZ9AAsODMPvk2u6oYQxxfiaE?=
 =?us-ascii?Q?Ot/YcN5ClMHCJSLg0Uez3UCX94O19L8XzUv1lIYz9T9w8yXNYbC1PNiu/4nz?=
 =?us-ascii?Q?HIyf2Ajqx7TdyHSSferEUOEH8PySlazsMNp/pE7cWAqQX6cjBYo2BNj6pZy9?=
 =?us-ascii?Q?OVOuJO5vU2cK5eXdgQh6ptn7knAiH7PBiCP1xmQIHPhwA0VOcVWUXdRIdqD7?=
 =?us-ascii?Q?Tigomc0zy7mcGQ5kwfVDY0jg131so8l9Ku82nQlDpPpgw/AlWMantrGkfOzh?=
 =?us-ascii?Q?cCSArWn7BGjXzRhEB1F1du/JA+7eghDTbFismuwjWvifR3W9h/Gs0wJtPrkA?=
 =?us-ascii?Q?h7VOC6kfFckkorKpOFtTHsYtjMeHZECAeeGeMmmEdl6epIemtq6RYV2YWohl?=
 =?us-ascii?Q?B6YU52kzrKymKH3kUS1FsyDPzG/3jSoJ1rcRhKanUMWIVu71D2iRvpQqV7rM?=
 =?us-ascii?Q?e9ouKjvokgOlB+eFwfBg5MMWYp4jDv6RblWCIwuqUk5auZP/qBiULCqIvK5i?=
 =?us-ascii?Q?ftFbQuO5fjuBxvdVeQ1DfVLAYAdzqGSOvHPzm9VvkXEw1TaKOmiX4825vT79?=
 =?us-ascii?Q?YIznHV7uRnsctbXVs3LtwuEPFXcKDuCVTtretNIpW7RxmWb6UHkI/h1az29p?=
 =?us-ascii?Q?Dpuk78YWVCv5cy/4YuYdmwI7TpyzcCujt8nRk1HO4Pi4+xT4b1dQThwkOPzC?=
 =?us-ascii?Q?kc4o4xtjbcNIsga7K/mRnd4ge/Ga5dLVDpIUhtt7M/3t+5a22AiH4pfUmpBV?=
 =?us-ascii?Q?1rZqL6zebtkpo1++NcGfizJB79ZLkvf8AMwUsT0eGbsDdZ66Kl2WNXmPoWLx?=
 =?us-ascii?Q?af3j+ooqFRdZXF29nOdVJRixy6NTroEOq1HyW/JPPmBkmV4LbUln1U9Dc04t?=
 =?us-ascii?Q?atY+A2Wa6/e8L3QfSDa+KRYeHP9TARVblTmOAP4vGDzOM8iiItRrAQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qtIdi2mp93xqHnE85ByaRn1boB/5GF3u4D1/QVt/o3si44MhygA/c0mmaVvt?=
 =?us-ascii?Q?FUNcjkhzRtmryvW20Dh4rZMGei9RGyq4uufP4Riep3S153V7XAmWoeS5Llkb?=
 =?us-ascii?Q?aOEqkxlurT3OBzjH8DI+VsmUlWR4JnxcdAhfIjezd5FXi7AIBtsvVQFITsVk?=
 =?us-ascii?Q?O2+D9+JtoTYBWZLGoRGGfrNklntPYMboYwycOtIVLSyq/uYR/wV66qBy9qmX?=
 =?us-ascii?Q?f+fc3me8FI6qZMcYreaU19aDxk0Q1CC8v1PhNZhNY5dxzQ1bRkYpFQ/OpsBO?=
 =?us-ascii?Q?VBznkilMQ5VhfTvUjR79ylYWkvERRGFMhfwe90/ZMXsfJ4lF60kE36yctcZT?=
 =?us-ascii?Q?UPHJrvawVv9rkS3sjLfY0HcGziRzrEJQoizdT6JYjjmiWZfZVwU8tDmV8IGW?=
 =?us-ascii?Q?ml0bvyY2jTp8TkZOJKES9sw4NP6Pyo4pKGxW9FQQKPT0Sqn8aADZb/65qa3K?=
 =?us-ascii?Q?gJmIytBLakFVdGngSdhQHKUZNUvLXmYaypEYHLGj1ZI4WEMKc5S7XOtwpetO?=
 =?us-ascii?Q?TEZSCnj+BUO6o/G8jY373Rld1xh9vwN2iw8pkRoiuVvZKbZrNINV6hQOEB0P?=
 =?us-ascii?Q?9Q+piWRn88Mxpz5busLFCHjfQBYra1qTdpUgWEYJJqGdFZbhNoWjOFTxZjg+?=
 =?us-ascii?Q?OzkJIlEsosD4btf8Rb8gMQpY6F9k/6CcRyDvQGYyUutwJXDDSctmn3EINXOK?=
 =?us-ascii?Q?zw/2c04YbGrZf5cIghi6T9C4kU8YgzjV7/gbyL6Y9eA1qgtMLdXwMLiznzF6?=
 =?us-ascii?Q?bZffsvMvt65PwaVew3TCJTD0P02nD/nS7D89ZGFAl7V7NQ+gTHsV/9D1A/oG?=
 =?us-ascii?Q?hg81z9jmypMQVjTTwOoNJPhu8wjlibAtUwzvzKijwCNkJni1UUdepfw7pgeV?=
 =?us-ascii?Q?UZ5ejTXgAQWHSFWWRUcSgnHTi2OkGTdPSmv51H8QOIMSfvWSlImH8hx0lWTX?=
 =?us-ascii?Q?llpIeSTDJN9xRw9S171Kp+dkgp7eBJVC/NzDrEChJIM63vVVT/je+io/OMdv?=
 =?us-ascii?Q?7v2ioE1SUEFoZQW0eOTvVWixbkfU+Rrjn/4dhjG+e+HmFlVQxrmvwNj3SfRM?=
 =?us-ascii?Q?94aLTLtvJ3Lssmt3oyWvs3BNy5Xz32NElsrvXG4fapMKcxw3hFli4yajLCfh?=
 =?us-ascii?Q?4TQGYB3RH4lj+ExascsJVE474NuuPoTfPeINKe5143+WV3lVUwz/tFlcghLG?=
 =?us-ascii?Q?Nm3YzT/pECMFLMGesRiXHSTcYCiDsr+1AwqZK+ktcUA1PB1JKruI9uOzH/7G?=
 =?us-ascii?Q?5mDw/VoRtQvn83M/j+iQRiC1b4b9p5DDxYltM4UoPC8h4q5UohS6XGsokg9R?=
 =?us-ascii?Q?2K49n5sStX4bTyZvbMRBUTRF2bxS2O6ICgodK2nHFu5SIOxhzM0j3vT4OHrN?=
 =?us-ascii?Q?4aBFBB1xrDralULGLfqOUb/YZXU8qWQ061nm+LXa7b1nDcTvKElAUTELAN5O?=
 =?us-ascii?Q?Hb9iPwTSOJD7dKPXCmUhxx/FyTCUL+DvPHL7ryJI6RXZ3JKun9EqDWEadAn4?=
 =?us-ascii?Q?IbmbwNb0PiiePO38dNMebRy+f+TWXdGUBN1/8+7oNTT8k5ZQYZrK5niqdHZ2?=
 =?us-ascii?Q?9X8gxF8xCDQ8L6vEZiWmUTGnvnb+GP46UVArPkhT69zOWvSHCAc+BY9yxI9V?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ea7067-acc2-4583-915a-08de0c40b485
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 23:15:18.1246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGQ/YKuN7L9UPUohtpLiq067pFceTZHhnlnsU1kZGArFUXHcG3HlVvjk0Qyy0DWP/jh3hT0+ZI1Z5Hi2Sani5m7ZlP0LqxoFDnerM57/8f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
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

On Wed, Oct 15, 2025 at 06:01:42AM +0000, Xin Wang wrote:
> This series enables IGT to retrieve the accurate IP minor version
> (graphics_rel) at runtime for xe platforms with GMD_ID support,
> instead of relying on hardcoded values in the PCI device table.
> 
> Background:
> -----------
> Current IGT uses static PCI device tables with hardcoded graphics_rel
> values. For Xe2 platforms, Different device instances may have
> different graphics_rel (minor version) values
> 
> The kernel's GMD_ID ioctl provides accurate runtime IP version
> information (ip_ver_major.ip_ver_minor) which should be used for
> platform-specific workarounds and feature detection.
> 
> Solution:
> ---------
> This series adds support to query xe device info at runtime:
> 
> Patch 1/2: Get runtime xe device graphics version from GMD_ID
> - Populate graphics versions in xe_device from GMD_ID ioctl
> - Cache device info by devid in global map for efficient lookup

I still feel that doing things fundamentally based on devid really isn't
something we want to be doing going forward.  Outside of specific cases
(error decode, driver-less tools that use libpciaccess, etc.), the use
of device ID rather than DRM fd has always been a minor design flaw that
we've just carried forward because it's easy.  Going forward, the
hardware/architecture goal is that we should never assume that there's
any kind of relationship between PCI device ID and graphics/media IP
versions.  While it almost always turns out in practice that specific
device IDs do eventually map to specific versions, that's not a mapping
that software is supposed to be relying on anymore.  Even if we're not
hardcoding versions we should avoid assuming that two devices with the
same PCI ID have the same IP versions (even though that usually ends up
being true).

My hope was that we'd follow a process like this:
 [1] refactor existing code to clearly separate the tools that need to
     stay devid-based from the rest of the tests+tools that should
     transition to fd-based
 [2] update the interface of intel_gen / intel_graphics_ver to take an
     fd instead of a devid
 [3] update intel_gen / intel_graphics_ver to call the query ioctl and
     obtain the true version numbers if running on a driver that
     supports it (Xe) and hardware that supports it (GMD_ID); otherwise
     fall back to the same device_info lookup we use today if we're on
     i915 and/or the query doesn't give us any values because we're on
     pre-MTL hardware.
 [4] try to cache ioctl results to reduce the number of ioctls issued
     when a test re-checks the version multiple times on the same fd

I'm not sure how well I explained that in my previous emails, so I wrote
a few patches that cover what I was thinking for [1] and [2] of the
steps above:

    https://github.com/mattrope/intel-gpu-tools/commits/forupstream/version_query/

(I haven't tested that yet, so there might be bugs or spots I
overlooked, but it should at least give an idea of what I had in mind)

The overall diff is large, but most of it is pretty straightforward (and
a lot of it could be probably be re-generated in a mostly automatic
manner using tools like coccinelle.  Overall I think it's probably a net
simplification because it does eliminate a bunch of indirection through
local devid variables that happens all over the codebase.


Matt

> - Provide xe_device_get_info() API for other components
> 
> Patch 2/2: Query runtime xe device graphics versions
> - Use runtime xe device info for Gen20+ platforms
> - Use weak symbol linkage to avoid breaking static library builds
> - Remove hardcoded graphics_rel from static table for xe platforms
> 
> Benefits:
> ---------
> - Accurate IP version for platform-specific workarounds
> - Proper feature detection for hardware variants
> - Unified device info API between i915 and xe drivers
> - No changes needed to existing test code
> 
> V2:
> - set the graphics version info in xe_device_get() don't copy 
>   the whole struct of the intel_device_info 
> - update the graphics_rel when the info is already in the cache
> V3:
> - Optimize the coding style
> V4:
> - add braces around the else statement body
> 
> Xin Wang (2):
>   lib/xe/xe_query: Get runtime xe device graphics version from GMD_ID
>   lib/intel_device_info: Query runtime xe device graphics versions
> 
>  lib/intel_device_info.c | 25 ++++++++++++++++++++++---
>  lib/xe/xe_query.c       | 33 ++++++++++++++++++++++++++++++++-
>  lib/xe/xe_query.h       |  4 ++++
>  3 files changed, 58 insertions(+), 4 deletions(-)
> 
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
