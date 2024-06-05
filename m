Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF05C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 18:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849D510E305;
	Wed,  5 Jun 2024 18:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2Bjj1TL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC5310E305
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 18:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717611649; x=1749147649;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=keh/keQavYG6t1PSe6YabZ70SGeFbFPFf1tvIVzd9U0=;
 b=F2Bjj1TLgCYYxQXkBtb0/MhU2LhuRlBD+Frwh8diCJimlfxGLzfaNkXp
 YaFZksPbGA8EOcp7sU9ImILMQFDXygiUB5OPOFRnNB0xSa/bea6SDUQac
 GDu0A+5+AaadEYTrcYUgG6drDX+FIat1V5VVBhHSHCLK1qleJ8c3Zb+N2
 3RL62t43dmnooK2TCErIv8SNZKHq8KplDIJlpIWkt3wkIA9fVh3vkseh/
 irUDEDLDU6Cc2m1qUfj6uAJc73wAIMzh82/Za08H1o2KrtqX02ao9LhEh
 4ynp6I8USeq6TDNIWsEHH1PfSw2aHreJ1dDL+4T00qofOzZRZSuLukna/ g==;
X-CSE-ConnectionGUID: FMqBk+JwRHWHehDSwtolEQ==
X-CSE-MsgGUID: uxCJN/rGSrmUijOqP0r5kw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="39645871"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="39645871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:20:49 -0700
X-CSE-ConnectionGUID: oSfvglrVRxWm6r4TWq159g==
X-CSE-MsgGUID: hW9E8iXjQ/SVidQq5vg8fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42134127"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 11:20:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 11:20:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 11:20:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 11:20:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 11:20:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6quc/OlInSTw3uHxH1u2UwKkOxPCkZCuUFZEaH433zowQHyFJr/yalOmgDntDiNBZX4R2BcVKqGgcly0YxWxFlqNfFFNdFaIP/EQsWVaWqS338U9EAgK7i4zdB3DcAgr06BrBsflGZ8AsZutS6CJa/qw58VSI60ATmrR2wHMmSIOpu0yXIX4HA260Vrp540JrQcfPvIX+q1lPuOb+80ed5CfXxQ1uE/k6ERQ3eKs1B9ZKKTXEeJwbTUUu68ZFkYQ8rl4G6xST3SM4U7hmqNqoSxmeq/f4Dh663jyPWpmq+tT9ZhUl+if8w9jQHHO3eU4WCH0iFsMmrRTRBq8Y6fLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuqTpUHcq2EiXsXo0P0JrtIr+EfJCr2TJCW2qqcuQpo=;
 b=HnKdNOaKcaGMedUwOHBSK2RUmNrHmTD0iRwONWIVuLuJC9hEuwZyT0aM7cFTWa+sQslZknDTc9+ehJ0L54d7MZdh6nQVk5u85hi1sNO2nYn8pmFQE16LzXjsJivHg7hX/oJRpGq9i0+N2sY7KY+y36WQNRR3sSopLu0gemRxqG+8ewydEkYK6NqloTGt1h70OdGfwZnli0/0iNIZxIImvexLcc9ALNBLv/sU2gsZgzF4Pw3w4LbhRy9j6Scgjy4W9pr8a/1fPokYUwgj5n9QXXmw3mKQqj+4Zj/yWeTi6BLiWbYmGEJIfCssjdSqUnM0S+27IYZ9UZtiZhTCJWgrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA3PR11MB7553.namprd11.prod.outlook.com (2603:10b6:806:316::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 5 Jun
 2024 18:20:43 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 18:20:41 +0000
Date: Wed, 5 Jun 2024 18:19:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <john.c.harrison@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH i-g-t v4 1/2] lib/xe: Add sync and async
 xe_force_gt_reset options
Message-ID: <ZmCsRwV+stW70jTU@DUT025-TGLU.fm.intel.com>
References: <20240605175843.2789838-1-jonathan.cavitt@intel.com>
 <20240605175843.2789838-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240605175843.2789838-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BY5PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA3PR11MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0384cc-5b5f-470c-e4be-08dc858c353a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VSGj52ViqvARjlxGhodAfbPV2reNsk7LxarUqroCJI9YWtcPG7uMRnTQVqYb?=
 =?us-ascii?Q?ikXj8nEqE9ptXRYn43MfD0MLq8h4mIUdviPq2WVtLBnauCrV7VHZHXIP7+NR?=
 =?us-ascii?Q?nwjn1AJEgOIXbgH2sYXEa1O3eNLowyf1EtX+cBADzf4sIhwlR2ao45kNKcsh?=
 =?us-ascii?Q?m7M6VvUQvltbEIe8QVZAV6it3pRVgYZMdc5EljV5ZM5PPrq9909jrIumSRZZ?=
 =?us-ascii?Q?4kTFhuMmKTTJf4Hv6o5z1zCadZqWHfdpNwzvSt1wU63vveDYTSBl+Ie8MDO2?=
 =?us-ascii?Q?DqonYymsSgJMz1B/BQfG7VrNovuDDrnqKiYMztrnDXldh7ecuGetKmvtjV85?=
 =?us-ascii?Q?Df3Scfsi9jAQcFpUn1scsFEZwgY8OQ1fygjaNDNxLkSbaBOSOsLaD/F1gndO?=
 =?us-ascii?Q?7IoCyA4l9/oihAmf8IUp/KwAB62Xorm2zO4pFNizux4J8qRoTabNXozQXCyk?=
 =?us-ascii?Q?lD/Ti4a0L/o4/RcHrMXQkYQ87sDK1sIikf5jauSM6lumVIbrJ+qzEKtzcZ2x?=
 =?us-ascii?Q?pj18IlM88vKWaIxwpr6cTr0PMmo2kctfwomQRpU63XcY9jnSLVriu0vouwkh?=
 =?us-ascii?Q?QeiB1cI+K8b1N6v+lRwUFsTXgwZxdiwGTTMG2om5V61LSjhuQtuNgRK+/bSn?=
 =?us-ascii?Q?iiD8UU4sLenoo1uHJKbYzNNegC2a7DvCU6zEXMhYBzfu7fYvqMPoKcb6R6PX?=
 =?us-ascii?Q?rs8nM8gtHelzk4+OL2OQR6H8PTZBx1ElSNmLrLPI6AZzBEIIbHt1pvXYxoB7?=
 =?us-ascii?Q?XEDazareOUeOvaNej/1rGagPpDeS74LyvyRGXyg+QY2Fd+RkiJKXn69fxu2z?=
 =?us-ascii?Q?hIJbf0sKo2g9vtbYD1PM129mDiTEyw1fzyrQpYyXEiZtrJmCa415MHRutnyy?=
 =?us-ascii?Q?KFcL9FaSFUbMQnq2P24kGITjCqrfnkZw6OW0hmALjqsdOFAxzmzb2OCaxaHx?=
 =?us-ascii?Q?qfAdiZqOPrOxInZKNlWGwCDkhOiaart4AdVJQYtMoAkUlQ3vjcF/BJVJotVs?=
 =?us-ascii?Q?Hio4HQbTbxZZZvoBGWClNXyTUf3raZ7AeJ+qCQlPTi5FErbv5BVOnmt1z+Wp?=
 =?us-ascii?Q?Mn3QH9Folj229/xlN0pzFXF5PbdvPwj2BGuZ0Y4jRbqkCfhviub2sI3eJsiv?=
 =?us-ascii?Q?7sT1I4QZ8Idel4ODHnjY9WBbz6kq13ptm7waY24kegMkl9e4NMxbxKt8xde0?=
 =?us-ascii?Q?clQ1A0NOupU8MjVzwc42j1fpwjiqMls5es1OxE0vVjlA2LSn0+Dn6IgJJJgM?=
 =?us-ascii?Q?R9Jh5iG25+8uGE5WVJF0p3gNI1MxLi5KeVhCG/fajnIZ4DImmBZI3A/9yUEn?=
 =?us-ascii?Q?8Ubv2wzCDQI3Fupw+5sCC+mV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XyqiD+OzcbHNK13xK/BXoI92CB6UfGD3CHzgVLRFZqylmAfTK8QNzn1rKRiZ?=
 =?us-ascii?Q?Z5TP6qZBA8BPm/uXv4E5ejPk4Skh1ctMaibFfLqb+76RU5U4GUDGaczYuZEo?=
 =?us-ascii?Q?qOJDpa6S6/dct9F/oPAElaMurcQ5Kzntn8BZUO2B4mc+m+LgiQgPwN72ckOi?=
 =?us-ascii?Q?6LPd0b8VEA0HiCW0Gv0u2li2KVoHuIMtSR31VIv6fXfK1wiqHKgJQIeTkMIi?=
 =?us-ascii?Q?HxCrArSqE2qHLXTHyQdIyI0D8NZbI3IakoC3KFO3UqHTPaMVkQJ0bfDKiy5H?=
 =?us-ascii?Q?Qgmz7lCejmehkaeGlg5uktq5SXaO0sqFfguF+PdGifq29xn/I3CFqIzBAxZ7?=
 =?us-ascii?Q?jbJqYSVNrirxZGD8IMRSt2IYSVqvgkhwXUOFC/j0Jz9J8Ax3bPPZYjWVkm9M?=
 =?us-ascii?Q?Jy2ua52IyGyxf/z7CBGXJaJ7iTSZfrthmoAxJzcXwhtmwM0m2ntQCT8cgQVP?=
 =?us-ascii?Q?c3yH9QaHdFfUOuWUc/SGI7jCrsxCVrjfwbxV6REXboGdkF9GMtFwy8l9sqy0?=
 =?us-ascii?Q?IPdUt2dNGBsyYm/4Suq46cCfudhwubpncvk5SNiV3StdmQ60CddBaJEnaEgq?=
 =?us-ascii?Q?1iHwAZQvviQSX561Fwfen8Kd+jTXbJiDvGhexZMPeIrGl4+EgtNEV3LBrohF?=
 =?us-ascii?Q?l92gzwKNTbHsAQUFJyEqpLrIK5PXf0v0MlY0pSjUf8OrfRx3/NymsfhCexQR?=
 =?us-ascii?Q?Xy5bVH+B4DFB0PqIRF29c8RvXMJjLlQdxs/7vIMT2Za+qFxdKUZdZKfqkeP8?=
 =?us-ascii?Q?obihf/ivAEb4dWE5TZeVDEXPT5Amm8Vsc01VlC2BQ5Wn3DZA/lr6sbE4fRAP?=
 =?us-ascii?Q?VjvDs8FQN9FzrnvefgqxKbsaLk3JxqyJi3ZDhvngi6PymQkBdgjgWSDWTMPJ?=
 =?us-ascii?Q?53urRBWPqTpiUm8SCTnlb44hDSNmWiiTrjcjpjBPkscKdyRibjZ5+1j4vD/j?=
 =?us-ascii?Q?lLvQ/MkbYfP8W71PNk0PLiflfyP3Vc6ZatBjLhghO00oGJVHHNWBio0d5w++?=
 =?us-ascii?Q?gznRMSq4VbH7UAb4TQsAYUjLPnbbOVFBVHLUdAbS/g91I375qoNmVmd/YSX9?=
 =?us-ascii?Q?NIYcwarZdqOkpOfswDGap+mKjH/x5rh1gJoPkM27I5XF3s2yuWewvpn/CsiW?=
 =?us-ascii?Q?JlMF5A8mr0ZrjmSRH8Gs5XH91Or3X0f2Olni4pKMQvveNK+Z4/UYRkk+EQTu?=
 =?us-ascii?Q?/h8w6O2yRD7tO6t6bljjV7y3qFg4kNN7q0HPLUtV1oATUJw91sGX4yuUSSR8?=
 =?us-ascii?Q?pbuiaa7fvipFFHuB9ijtfPOYq2XoiOURSjYNqu3uo0PLPZUl6kYkAsCcNs8Y?=
 =?us-ascii?Q?C9gjUn3ya+hcc5Iao6+IQRA7Tsv5Vq86w8ItIndOaz2as4gzHxZovpEH6K2V?=
 =?us-ascii?Q?gtZDNbEwlgzAbJH1jDRtgB9x8E6gTOA+PiM9eSmXeeURzB3Gr9jWPuiACKk2?=
 =?us-ascii?Q?QoS710KNQ/3UN44gdeFU0knp/k4LY3bpFyHTOyPCOnrGuKLZ/KrtmrL4poTR?=
 =?us-ascii?Q?sDAJB/a4IaOD2Wiuw5tTFyWGbLKPHSGzvnEB/TlyAl+a0Vz0H6g3YokUqa1c?=
 =?us-ascii?Q?87yTNqpmj4AM3CDztpHsD5/c1Ub5/tx9fbVesZvHk3EMhdT4B0AgLU5aVVij?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0384cc-5b5f-470c-e4be-08dc858c353a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 18:20:41.5646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEAsNJw0MoVOfdSmjaa7FjvkZdDh+E7+Cjfp3SXkBCcuP7qZCw4LYLAj0N04U646a+5rIE/RFVc6dxtWEcBnVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7553
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

On Wed, Jun 05, 2024 at 10:58:42AM -0700, Jonathan Cavitt wrote:
> Add a new xe_force_gt_reset function, xe_force_gt_reset_sync, renaming
> the original xe_force_gt_reset to xe_force_gt_reset_async.  This allows
> the user to decide whether or not they want to initiate a synchronous or
> asynchronous gt reset.  The asynchronous reset function was otherwise
> unchanged, but the synchronous reset function operates by calling a new
> debugfs function.
> 
> For now, default to using the asynchronous version for all current use
> cases.
> 
> v2:
> - Add *async and *sync versions of xe_force_gt_reset (Matthew Brost)
> 
> v3:
> - Fix compile error
> 
> v4:
> - Use helper function for xe_force_gt_reset_[sync|async] functions to
>   reduce code duplication (Matthew Brost)
> - Add missing revision notes
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: John Harrison <john.c.harrison@intel.com>
> CC: Stuart Summers <stuart.summers@intel.com>
> ---
>  lib/xe/xe_gt.c              |  2 +-
>  lib/xe/xe_ioctl.c           | 16 +++++++++++++---
>  lib/xe/xe_ioctl.h           |  3 ++-
>  tests/intel/xe_exec_reset.c |  8 ++++----
>  tests/intel/xe_gt_freq.c    |  2 +-
>  tests/intel/xe_wedged.c     |  2 +-
>  6 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index 743d7a26ec..36e8fde363 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -69,7 +69,7 @@ void xe_force_gt_reset_all(int xe_fd)
>  	int gt;
>  
>  	xe_for_each_gt(xe_fd, gt)
> -		xe_force_gt_reset(xe_fd, gt);
> +		xe_force_gt_reset_async(xe_fd, gt);
>  }
>  
>  /**
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 934c877ebc..ae43ffd15e 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -529,7 +529,7 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  	return timeout;
>  }
>  
> -void xe_force_gt_reset(int fd, int gt)
> +static void xe_force_gt_reset(int fd, int gt, bool sync)
>  {
>  	char reset_string[128];
>  	struct stat st;
> @@ -537,7 +537,17 @@ void xe_force_gt_reset(int fd, int gt)
>  	igt_assert_eq(fstat(fd, &st), 0);
>  
>  	snprintf(reset_string, sizeof(reset_string),
> -		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset",
> -		 minor(st.st_rdev), gt);
> +		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset%s",
> +		 minor(st.st_rdev), gt, sync ? "_sync" : "");
>  	system(reset_string);
>  }
> +
> +void xe_force_gt_reset_async(int fd, int gt)
> +{
> +	xe_force_gt_reset(fd, gt, false);
> +}
> +
> +void xe_force_gt_reset_sync(int fd, int gt)
> +{
> +	xe_force_gt_reset(fd, gt, true);
> +}
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 4d08402e0b..b27c0053f0 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -91,6 +91,7 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		     uint32_t exec_queue, int64_t *timeout);
>  int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       uint32_t exec_queue, int64_t timeout);
> -void xe_force_gt_reset(int fd, int gt);
> +void xe_force_gt_reset_async(int fd, int gt);
> +void xe_force_gt_reset_sync(int fd, int gt);
>  
>  #endif /* XE_IOCTL_H */
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index e47c3730dd..05d63c0ba5 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -239,7 +239,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	}
>  
>  	if (flags & GT_RESET)
> -		xe_force_gt_reset(fd, gt);
> +		xe_force_gt_reset_async(fd, gt);
>  
>  	if (flags & CLOSE_FD) {
>  		if (flags & CLOSE_EXEC_QUEUES) {
> @@ -383,7 +383,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  
>  	if (flags & GT_RESET)
> -		xe_force_gt_reset(fd, eci->gt_id);
> +		xe_force_gt_reset_async(fd, eci->gt_id);
>  
>  	if (flags & CLOSE_FD) {
>  		if (flags & CLOSE_EXEC_QUEUES) {
> @@ -530,7 +530,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  
>  	if (flags & GT_RESET)
> -		xe_force_gt_reset(fd, eci->gt_id);
> +		xe_force_gt_reset_async(fd, eci->gt_id);
>  
>  	if (flags & CLOSE_FD) {
>  		if (flags & CLOSE_EXEC_QUEUES) {
> @@ -590,7 +590,7 @@ static void do_resets(struct gt_thread_data *t)
>  	while (!*(t->exit)) {
>  		usleep(250000);	/* 250 ms */
>  		(*t->num_reset)++;
> -		xe_force_gt_reset(t->fd, t->gt);
> +		xe_force_gt_reset_async(t->fd, t->gt);
>  	}
>  }
>  
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index ff99b46a08..d2e4d1a09c 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -324,7 +324,7 @@ static void test_reset(int fd, int gt_id, int cycles)
>  		igt_assert_f(get_freq(fd, gt_id, "cur") == rpn,
>  			     "Failed after %d good cycles\n", i);
>  
> -		xe_force_gt_reset(fd, gt_id);
> +		xe_force_gt_reset_async(fd, gt_id);
>  
>  		igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
>  			     "Failed after %d good cycles\n", i);
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index aa4a452bfc..a4fc53869e 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -31,7 +31,7 @@ static void force_wedged(int fd)
>  	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
>  	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
>  
> -	xe_force_gt_reset(fd, 0);
> +	xe_force_gt_reset_async(fd, 0);
>  	sleep(1);
>  }
>  
> -- 
> 2.25.1
> 
