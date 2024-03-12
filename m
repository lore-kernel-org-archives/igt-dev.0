Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E052EC54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 21:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD5210ED58;
	Tue, 12 Mar 2024 21:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mgcb6W79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E1B10EDB7
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 21:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710280742; x=1741816742;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=UQDx046V9Ufq7fI1DuJsBcPGBC5RMec9KT27fzhse9c=;
 b=mgcb6W799pn8wruBk1lSvpGsLbsNayg3WN1b/vpARRra0560JOU9f8z6
 RsDDHJYAqKTN9xzUgNAd6p5IO3YsyoD3jVMGAlelMZlZz1dLS6Vv5bc+b
 1utin34Tog2KxxdjuqIwxXzFX3Ff3aLRzeQnhAq/d54Kk0afqzQViek/Y
 UzwIMo3BepUBRFkB6J2gySs+ELf1nslb0d6/8YN5thsZmDg9t5XcfGGLt
 tguqTKMEtahEQDBzcODwrlMBYRHSEg22+V1Au9EF5bYkLp8OStiK3UnLf
 E3wux4t4guI6d+APgBCMPzkBbAwLEC+i8tqDVeMSVa2i9Fj/O4U8gvPM9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16468858"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16468858"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 14:59:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16414879"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 14:58:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 14:58:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 14:58:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 14:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEfsFoBTk7JJ1a5q2s/alp+mAL3wyKfOwD2iwzNwe6pldLwqTOZJNCElOeJQOguJKp2gypLIV0a1Z2Al4nvLcVQVnGmKVDRhIVqRGAe2kkvo+xWAAslHZw5PdGUT8mabpr62fgpkCj/oIt2jJZ1/aXadsAjIr4S1j+VF/v3Wbqu3ndvaYzgenEgRccpLX/aRZ5xfjYUq/vZ9aha4wQcJ/pHKpdEnVrvCodvLZvxEbfAq3638XTujhYeRieHwq/5OGwVU2HDFtxqq9V1vahnYoRKhranuwSkZQbq4qZ3Qn8busxKx8oLFMUJo7UxjWREs49xP35RA10nNZKjLY50y7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjDqtOmvEVnR7XOwIcOGn91qwHsS2jp91bCPaiA3KP8=;
 b=UHUaLXxH+xlvYbEiCJSSHOERTHWIYIEaQwA9fE/8PENZzEyezAZpZTsle9UHVTA8cTiWA+ku5HGv6ajWBl6Ze0Pn4rgqcbW/Zen3Lgfji6z8EiQ3ABPOyLt87yjfMx3Watd8YBKKORC1+NZIRXTsD48lb+p08NLp7tnrmMyEfjthfibZA/tICJNpae48Bl3+HE1Ot5+YFFnNqfPQG+xgQPd0A3xXZ6QVqVxFubCL8o8HlOPk/FdbQgZ3A0Ig3ZQNZOhjr5bK6wyPYTWhe9cLvyjHA2vbwOoHrV9xb2A7qHKPHGiw1iwA8JAlTw9WHqmHweYCSDMsm+/SyHuoWOEFEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.15; Tue, 12 Mar
 2024 21:58:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 21:58:56 +0000
Date: Tue, 12 Mar 2024 14:58:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLnhlQkFU?= =?utf-8?Q?=3A?= success for Add GT
 IP version query support (rev3)
Message-ID: <20240312215854.GB2837363@mdroper-desk1.amr.corp.intel.com>
References: <20240312205431.2869411-1-matthew.d.roper@intel.com>
 <171027865218.714563.2894656012873454864@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171027865218.714563.2894656012873454864@8e613ede5ea5>
X-ClientProxiedBy: SJ0PR05CA0189.namprd05.prod.outlook.com
 (2603:10b6:a03:330::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: de9a9e71-e6a2-48eb-c1e1-08dc42df9d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XKBXcBJmiyZEAvIoC3O9vNu9ZEcGApLmBwM6dor+wa31NW0syk8HzMlvQXhagKiJU1X3IZHjFgNh8RiikLR02NDdffxAGHqiCd9OcQRe1VvsRqAQwweJ6idXyXO4R6RFyhPMl8FA3zQqQ4nT31AGwac8wAihLqTuxzPDzJG3YarcllCNxIvskzjiw6vJX5ajC+s/Y2Own/ioVxwaKPnVhd8FQuvdnnVvBQCV8hXoybOJUZQeXVq31xwx2caQWOtP9GhH0k+syh3wnZSp+GDlZkxfKWeIPeimfRKuDWzntPdTSgNCua9vijLr/GKax130TLk5lR/TFkxnO/pCjgmWqTVCUyT5FMygxJtNuNpcqVovcsZzv73bJ0u3ICGNvfyhdbOMnMMdxakPxhlaE2ieuzYLOFfw6TLcWSYVNnhwWYZhLCDTebDVFFa/VTW9l7dzO+z5jT2BD5yBRdlQsJE6M5ssGwpydtFRgzdrcahdPs+wi0ryPMg1Kjnxc4MCPwEgo/9lQKQaPMW+Z7ev2aWGaQblG+JlQK8HW74NoimqyLXale2YR9ILrh8TVmDpdzZZK8KNNC6FlakCzkP8stYBn5adQ3M+zSELvqhaHYFc9WETp+QOkCHHSuJdywBXR4ih
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?skSZMB1VKZ+r9vjElSvXa+abaLR71Ntg4Von0C4Sb9RasW1guqcntrMkZMWJ?=
 =?us-ascii?Q?RZZqyCcJJtYRxTqPmRIvaSYFe4/Gz5UOYysubhHdN8EXq5NtM1U3RQy1vDzM?=
 =?us-ascii?Q?L+jGJnC+sa50WsEkpLW2SqiaxB9oJcYyjUHraNL4SP74S4tIWRJsDIoEiSPC?=
 =?us-ascii?Q?pXr2245Or7badzCOFpSR4CEk8J2TKpz/CSilFZVMmBKMhyXyiKSp+AgyVEad?=
 =?us-ascii?Q?WZ6Kd4UWqy0oRqgA/lhqPBbH7f3C0wxPpYct80+oADSnf3hcjmMy9prYz6B1?=
 =?us-ascii?Q?ENX8ZzthSXm3ONot4NnKMmSrFQ0fmibF9dT8pOc6tk8YtVPcTMqw11IM+pTg?=
 =?us-ascii?Q?kOlYbobQ2QF0YIWYrNlj/Z4A/ItPoEWpA3zIMHTrcl6gz/K7el+CUDJfZOG8?=
 =?us-ascii?Q?hLs1ssIC20bYDqGpXyxGHl5Cf3UKwjnPUk9Iz5aEIwQWaj64L9kpJt0bF81G?=
 =?us-ascii?Q?IpeTwj/8ffsWWpF6ZNDebpvBaBYuDDqT2vaimQSOvKQ+rHaZctTo0yC1RPbv?=
 =?us-ascii?Q?mfN7wPVFMF9V0oDSBKFRrJnVQ6d8WTj/37tX4BHqTNYoBpt0Oc4LrODOje1Z?=
 =?us-ascii?Q?5/RsjGjTAffxb1awpQJWd9Po0xyj79vrgJTJ01GAImBlcaLZBJ4wb02LKji7?=
 =?us-ascii?Q?NrV6CMgERK6tHbFh35pEOS8zqm7mAxcgPLRYZHJIw5ZPGCDtWMXWxsC9FF4S?=
 =?us-ascii?Q?IJ6NxDn3Cu19BlxdpqubDgPVTKjHAIe/Nn2N5zerwtLae8vnbFYkKesNtsTn?=
 =?us-ascii?Q?LBGeNEV/5fQF3tiTUOb2BeLyJQZcpY5fcq8ylzWZPu3Aid9SOiAXWSCwkdtn?=
 =?us-ascii?Q?LfbbQ+W0Ky0WnJQjvhuNmZwXlbdULUPyahf7n1uujH6oYro//AJo792wQsb7?=
 =?us-ascii?Q?6dxi1mACUK/Ged3tLGqME/iOran32t7EdOrq+sIEfYUQvP3j+sYA0KEnMEEE?=
 =?us-ascii?Q?XMpk6gc/FDwlc4p1Ld3XaYPRxv5G8qUhhqlWpiNRFC+XmKWuwRhSp5wApu5c?=
 =?us-ascii?Q?BD95jgOMdQW2hgyIvz/936fQogp0AeJCKse43MqGyTdhfbWoW2DniJWTx3Va?=
 =?us-ascii?Q?1n4sHEMUqCCWCjVeB+qndbJcekQtsQ+S1Cch1lF1W6RAZ0OhPGQ/74ZGU84P?=
 =?us-ascii?Q?YLp/eiGaLhFXEJ2l1MwxR4XAxrR1UksepDJ5tvgkUZgKnB7cK21S/R+b2Z+j?=
 =?us-ascii?Q?2p6VVNBYzGPLd+CZdHGjJSP/qWes0jqN6SgeErcKo7Np0xKNVEYO5vtXmgQ7?=
 =?us-ascii?Q?W2KXehk4RhdNBQ7/fg1cUIRTD59bp0a1I4pIh6hlvtN5sfuiySm1L8J7A0Ti?=
 =?us-ascii?Q?o05kLU4s9YZfNG5kEOnU3t+x1wkvSdj8VOPtgNLOcu+ujHXLF5UO6s3fmTXO?=
 =?us-ascii?Q?eWKs0Z+BoC7/fKLUh9qM7KXJA1Jo9M0CUDTTqXm8kiCS+4JYz6WFxfcUQkSR?=
 =?us-ascii?Q?asqlR24pTLxit9dKtjUgLqIMbDVJTn4gFdyG3gz+OxM6k5UsGQAROjvQHI+E?=
 =?us-ascii?Q?Qx15QxoISCvQ2/7Nuf+0c0gBAEH07AR1SOCPkhpyA6i2nzYKN6EpXAMEPyZO?=
 =?us-ascii?Q?ASpNmnvxllKGEiZ7SR2WSxD5+VexqoIis4VZfbRwOvXfsa2jGdzHb6IGXPna?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de9a9e71-e6a2-48eb-c1e1-08dc42df9d73
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 21:58:56.7847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sV709H5oqYnPkvDKipXQpKLYGwPpkPPBwMylJaLHsV77NvgIxJ6U4TbnbyMcrJNNUTI8Sh+ZbCrq9aqyCAwacymXhmba8j+3XNEIJczgRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7459
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

On Tue, Mar 12, 2024 at 09:24:12PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add GT IP version query support (rev3)
> URL   : https://patchwork.freedesktop.org/series/127456/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7756_BAT -> XEIGTPW_10818_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to master.  Thanks Gustavo for the reviews.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_10818_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-adlp-7:         NOTRUN -> [SKIP][1] ([Intel XE#455])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10818/bat-adlp-7/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         NOTRUN -> [FAIL][2] ([Intel XE#616])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10818/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#417])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10818/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@xe_evict@evict-small-cm:
>     - bat-adlp-7:         NOTRUN -> [SKIP][4] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10818/bat-adlp-7/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-simple:
>     - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#688]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10818/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
>     - bat-adlp-7:         NOTRUN -> [SKIP][6] ([Intel XE#288]) +22 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10818/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
> 
>   * igt@xe_mmap@vram:
>     - bat-adlp-7:         NOTRUN -> [SKIP][7] ([Intel XE#1008])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10818/bat-adlp-7/igt@xe_mmap@vram.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - bat-adlp-7:         NOTRUN -> [SKIP][8] ([Intel XE#977])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10818/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - bat-adlp-7:         NOTRUN -> [SKIP][9] ([Intel XE#979]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10818/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_module_load@load:
>     - bat-adlp-7:         [INCOMPLETE][10] ([Intel XE#1319]) -> [PASS][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7756/bat-adlp-7/igt@xe_module_load@load.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10818/bat-adlp-7/igt@xe_module_load@load.html
> 
>   
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1319
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7756 -> IGTPW_10818
>   * Linux: xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad -> xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d
> 
>   IGTPW_10818: 10818
>   IGT_7756: 7756
>   xe-929-61fa386186cb302cf26e29aef76d5b1a6ffe57ad: 61fa386186cb302cf26e29aef76d5b1a6ffe57ad
>   xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d: 1dfbf3ced62236dd318c701e3f21f5a33c226d0d
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10818/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
