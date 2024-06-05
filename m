Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403B1C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 16:27:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF3789083;
	Wed,  5 Jun 2024 16:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSkbU/FT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FA910E3E9
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 16:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717604840; x=1749140840;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TIqS4c0NT2EH/+xV/pYVh29l0XFRPER/2ZWASc478kA=;
 b=lSkbU/FTVmboii/ynOnpmJae7DaBgLxusqLZ4Ke98NjtYfYbfU/EBPkG
 Yr1uopsl7yjqeqXpeqFJkp4iCNlFovkqoC1My/bPMTBUah7IY1P5dKeqH
 GYvstPLtWeXG3AU+KytdLT5KOtVIEYMTqEsujkk1GO6WRwj7lwA1nNU/0
 kDky4FYpf2SaQh8eJEhATMNu/dgRlxPOLQ9OsT8reuqZngStx38svsvFb
 g/Rwv/TeH4vfP7rGUYO8Ax5QijUQ1vGryLMcjehOG7Ah9VR2b92MSiZOM
 NwZccNcglIK+Y4pN7gqp6HRpfAHb+1BHM1eNE9WJbQgiC6sHRRqnq/Yay A==;
X-CSE-ConnectionGUID: nnjfVaNVQBaCbTuXsByJAg==
X-CSE-MsgGUID: +HY2PwbiTxmlUdESQfj78w==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="17168339"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="17168339"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 09:27:19 -0700
X-CSE-ConnectionGUID: y6TfJskNQg2Ee8FhRkmZjQ==
X-CSE-MsgGUID: T6T3z3jYSTCPAG+FHGksRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="37639858"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 09:27:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 09:27:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 09:27:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 09:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwB9qdLU4hkjTyCuTXsIWNiYFHSrkiKfzRVq1YKSfrxiTWf7ej4UpjBi2l5TiqbUgtwqtlk8ThQ/j9O+tcOJ/eTzcAClTyHmsiYgJMAxWcwWLkcwWaSlV3y6z6Ba+APO34jFYtv1M+CHXRexK2Zr07uC0lt46HEUEVlhhEIoNhoyiLbaEV9fWvKakwrIZSgHYL6onh6AmkfS+3CcW1blxGUehID99UfqaVhzvWN84fPxNDjkKI5Y4MBDkI7QQ5tvnD/p0SLQKsbgBPoQL3to4GJjQYdhpTQxhGrQS0t1bWAh8KHSnC6G6nHhNL6Mul4CMvK2+tRWZE8dkLjCtibUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YePCN2P6QKwqbw3JkBWZ+545mNNpDlyXF0cIICjpJUY=;
 b=AigX2CvX3Z7ZL5fn5uFcyf+zalmBZQO2Bm19Q7AEjZ6oO+RT2TbQLSgCztYqRBSHAzf9Cl1OjZOAIynN5oV55bgYbOPdUdH4JQ4RqOWpRGyS6Y7HAUI8AZ+nVC7JHWg8KadgO4cn8iQjJsiTxmVXGB6bxsFB7IURdbuOcLIXyyElBA64lUtOCgclAmOd1Oe2qKcTUAS+eMkWOA2tugqulWW7sojXHiOZ6H4UeG2wVGkMnOUju0bDaeTJhNMc+kyhijz65uiobOEpt4nnEmDRSSfyMHSljW7OdtN3RGIkPZCTsP4Q6ADp+FhYyf3RGq1pMagMCVt71fEInfdCxT62uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Wed, 5 Jun
 2024 16:27:16 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 16:27:16 +0000
Date: Wed, 5 Jun 2024 16:26:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <john.c.harrison@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/xe: Add sync tag to xe_force_gt_reset
Message-ID: <ZmCRsTeOIddQFjS7@DUT025-TGLU.fm.intel.com>
References: <20240605151248.2736694-1-jonathan.cavitt@intel.com>
 <20240605151248.2736694-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240605151248.2736694-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BY5PR17CA0016.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::29) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: 447b84b5-5da6-4f97-1801-08dc857c5ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bfNPqlYeJ9JQqyJzoRdfytU+FZZGog9R0aD3zBfDXh06hA9ULNvv9xTuUu6n?=
 =?us-ascii?Q?+mKmP3kYPIGgPMHv0VAoK0lql/T71geIyswZ7LxA2vB8f2gvrJGJa+0kEoQC?=
 =?us-ascii?Q?KylR3EYADCXU4Xx6oCan6x0s0kwztFi6ZzCE4lA/eC4SyryPauFsI9IOhiTp?=
 =?us-ascii?Q?0sJssHlcc30t0NY9P0CySt5SUtrxMOwjSvYb9QH4SfJD/qW0Lz20yhqC1AGm?=
 =?us-ascii?Q?eEjI74vvDz9HSxETpXzT1C14Z21ln7llHki4PxPHxwqlbWwVFMaUEwddoQIO?=
 =?us-ascii?Q?4/grXHDkXNbdNiCftI1oh2Cye1dPFI+O2iptLrQLwHQEIHLzgXYhenpgsFAA?=
 =?us-ascii?Q?A0bkMc/hJ1dqsCIyuiBQA0Q0p1v7evkvI9w5w0l/I3ogp6zUiw/180S3MY4N?=
 =?us-ascii?Q?cEsXG0YGisteq+yTJ3xL0/2cQoF/8jIwyUHGWPsPk/1BNnkAy1zbCLrCxAIW?=
 =?us-ascii?Q?WW8L8cUMuUzKVKHk+Mvx3Uuu/mizWPv4ZUk28c29kIxeewLGRw/VraMZN9tB?=
 =?us-ascii?Q?wxvN6xNPsKLSGEmsx0QbFko5iXtYjfaF/UF921U8Zex7HMXvjfhgusFSZp87?=
 =?us-ascii?Q?CfK8gsiTW672EShRNqJFZd84ykuevNVsiGG76XFGtPktNDif3X7WuP1tj1C2?=
 =?us-ascii?Q?OeE3ZYBIWhDUDejG8qG6ynbFCFPmW7mtBTi8qcmg3wB+FNtag3foSszzvobU?=
 =?us-ascii?Q?XAenCV+axckx2wHIv0PMtS0UQZE7rGnkNydWci1PEeNRJzEV44Eo//LlXukC?=
 =?us-ascii?Q?ozsVK2Usd8SLFlLi+MFoVKewVwvTkMCicC0rB9oSIhccbmemO+VjFFgXxHzX?=
 =?us-ascii?Q?LP04+05fYiuzEABWPNK6a4NWt8x0KKTwxvERKmX4axUuSeRj+aU+IInFikhY?=
 =?us-ascii?Q?IMf6AMArPujKE94+2s+a0v/RLw9o98iLzekizjdmCmzWPDmyLoyrIzL2L1UB?=
 =?us-ascii?Q?BGA1q/48gx4BGVh7/9Yn7CuvoTK82jezOAwDh6E+8LvSbUa6C8jnIPuunwlM?=
 =?us-ascii?Q?I5duTgB0d/0mR0nyqRVqlQg1bjOqglhR70PPFySQjTwLNJF6UWi1eHLx+xTg?=
 =?us-ascii?Q?uoEi0gm9ae8rFpdU1btCMbEeCi3ZvBYMGVq8xrpG1vaR1+yRf5G2Wj+fVL6m?=
 =?us-ascii?Q?TO0mTPn5JG+Vs/d4sWugZhwuIHnyjOrrivhRNQeEDRgsguk4IPdNoYmxdzaZ?=
 =?us-ascii?Q?LCc1ngoniy1YKCDiohW33NhUl17h0MZSnx9hquYM9tgVjjc9GvBRLfy608+q?=
 =?us-ascii?Q?Ba/DtCJN8rgxSnHRh+RYE9JF1oETSad37HgMquXDxA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PuGK15HsPbr7hFrAHgGMaHQ8TSa75siQOaKMxcb0OQimtInGjO738V2sO9T+?=
 =?us-ascii?Q?iyPWR/5xc1HVGVAN5r57Hpr/3KWXMkhXKSl/LKY+bIAsgLxrNSXibr5cEhI/?=
 =?us-ascii?Q?oWcqe1ASanw+j/5/N4K7BdJBRubGpnjnjR8hudGIgFSfwrZu1fy4oOgvQPxM?=
 =?us-ascii?Q?caLmni18DLDlfz/bw6Sj2GYUyYx5/2gqP2lca/EYSYlAGAWyZQB8J52JMCl1?=
 =?us-ascii?Q?6l2lfz2ZSNgsa6YcSi7CY5ZSLUZuKrzl3+B91obSDmszqJtPALHMwDiuuirf?=
 =?us-ascii?Q?jqjgR1gOQaqNZAM60ZK1GNjTOyiU+9hNVATv4KpLWsHSwE+3vQ467UdQFmI7?=
 =?us-ascii?Q?TZvbDneVVS604kino5Z48oQ2dON/KNJwx8VJAkN963WbzU7tsOtlfSQqwoSY?=
 =?us-ascii?Q?CfjjABlmvrgplsvjBmbnDb16GAscevLPOZax9vLKlDyKn6F2QruD7ZsGcR7K?=
 =?us-ascii?Q?WVSu0tDpcMg1sgoTyYYqiH179/9s95ugBqbmxaxQXYd+z67HNqizOn0Fuk5t?=
 =?us-ascii?Q?rdBZnKVC8JcwzFxXAH8QvZC/iE7MRPt53OoQ9jFx3HFnbh90elkkAM5P6DTO?=
 =?us-ascii?Q?DZWbkuv7B5dFlJ7pz4otXGnSXr8Q7s4SbuBTxY7X7xUmKOnRvc0CfA/Sy5ph?=
 =?us-ascii?Q?oC7Xs5bXK/Y4flwG7SobUZP8lGJWY2UNx35K9/SeF8kWC4qydjVPoOL0SY/0?=
 =?us-ascii?Q?JR8OUPnFYftLFjUfiDFLW53xvMNMQFfunyGOcTKALrSyBok/lyGP2yva7Dkc?=
 =?us-ascii?Q?bMebZWjMB3FOFS/YAN8JPwKz3JDRg0VA3WcvaTAwKfwjZLmdr2AAcbus2E1E?=
 =?us-ascii?Q?UyuBihcnyKfMX3Iy44B/Dy1cvCNa9snrtgKkt88CB+FEPDr+Y2yJSSJiQZcw?=
 =?us-ascii?Q?v6ROxUcXeZkWhAk68+I/YRkvRiUKXkkMkpnQZjOiWlDM8LqfHzPpgm7daWeD?=
 =?us-ascii?Q?6P1+MkB3XwaXeiw6khikVmEMHs0lKO8p5rVCIg0jlFH+ZZFGaUNL4pQDPSKV?=
 =?us-ascii?Q?UeK6n+w0F+az8zmZsTqKUdAzvfWmVy6Ct0XL3lID6x8BxZ8BwLUJosvxp02H?=
 =?us-ascii?Q?UROLS0Y9gnKNRXWBsoRnuOODqNdANm8UfcYh+lPoXdfO8WJW50RMLBsoc0Br?=
 =?us-ascii?Q?yBz3UaXcHnBEkGtqxWLkXj9obVAiPC9gvYAhn6m3zVSNVCJvpGbkLVVtVKs7?=
 =?us-ascii?Q?LT/ChD3umw15Q2vYlR2pSWoNYuzYCEC7X2EY4ITJD8+nWxHvilWBwRS/3Ldz?=
 =?us-ascii?Q?W7qig+t5wBh8e+FX0x5YLyGfeo2/EJCBUQzelb14uvYQWNQAeGvHA3B0DBRF?=
 =?us-ascii?Q?CKLv0OBtOj1xZHzLOsu3BpZRV3b5yT0/acpfOlzefsAF20q/PCLwfyriv8na?=
 =?us-ascii?Q?FhUIRrIV0zYIo7ClJMGxaipHc684MlMYzQYWLXsdoQO+oYKn5Sxi56yDICFe?=
 =?us-ascii?Q?UVQyMgac9nRDwL73m3OyIlPLB9Nwi1XtNWv7CBsfgC4zyk6aZj/c70Sum1Jn?=
 =?us-ascii?Q?yRrMN8emqnRGt8IBQWAghHVEQZobQAylSMIXTBA80x06DEN0vlcE3fk2pwFc?=
 =?us-ascii?Q?yv+yC+Y1jX34MqShvpt90lUFDt9NxqKAfWyGYItzsCz5oAu99NC3KRReNWfv?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 447b84b5-5da6-4f97-1801-08dc857c5ce7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 16:27:16.2351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zSLgDe17Ms/6uUKls4UKFsyJ4PmMTJzmlRcMTqZVRH5B3HAj66NLvP7BlNBAeNemfndzonEJQ47Wl3cR3ARdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
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

On Wed, Jun 05, 2024 at 08:12:47AM -0700, Jonathan Cavitt wrote:
> Add a tag to xe_force_gt_reset that allows the user to decide whether or
> not they want the reset to be synchronous or not.  This is done by
> having the sys call target a new synchronous reset function when the tag
> is set to true.
> 
> For now, default the tag to false for all current use cases of
> xe_force_gt_reset.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: John Harrison <john.c.harrison@intel.com>
> CC: Stuart Summers <stuart.summers@intel.com>
> ---
>  lib/xe/xe_gt.c              | 2 +-
>  lib/xe/xe_ioctl.c           | 6 +++---
>  lib/xe/xe_ioctl.h           | 2 +-
>  tests/intel/xe_exec_reset.c | 8 ++++----
>  tests/intel/xe_gt_freq.c    | 2 +-
>  tests/intel/xe_wedged.c     | 2 +-
>  6 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index 743d7a26ec..36beb596b5 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -69,7 +69,7 @@ void xe_force_gt_reset_all(int xe_fd)
>  	int gt;
>  
>  	xe_for_each_gt(xe_fd, gt)
> -		xe_force_gt_reset(xe_fd, gt);
> +		xe_force_gt_reset(xe_fd, gt, false);

Kinda a nit but I think I'd rather see two functions:

xe_force_gt_reset_async()
xe_force_gt_reset_sync()

Which call the internal function xe_force_gt_reset with correct true /
false sync argument.

This just self documentations IGT the code better. i.e. It is not
obvious for look at 'xe_force_gt_reset(..., false)' is an async reset
while 'xe_force_gt_reset_async' it is.

Another option would be make the last argument a 'int flags' and define
RESET_ASYNC / RESET_SYNC flags. Again this better at self documenting
compared a true / false argument which doesn't immediately mean anything
(i.e. requires some to go look at 'xe_force_gt_reset' to figure out what
that argument means).

Matt

>  }
>  
>  /**
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 934c877ebc..a44b65e4ff 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -529,7 +529,7 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  	return timeout;
>  }
>  
> -void xe_force_gt_reset(int fd, int gt)
> +void xe_force_gt_reset(int fd, int gt, bool sync)
>  {
>  	char reset_string[128];
>  	struct stat st;
> @@ -537,7 +537,7 @@ void xe_force_gt_reset(int fd, int gt)
>  	igt_assert_eq(fstat(fd, &st), 0);
>  
>  	snprintf(reset_string, sizeof(reset_string),
> -		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset",
> -		 minor(st.st_rdev), gt);
> +		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset%s",
> +		 minor(st.st_rdev), gt, sync ? "_sync" : "");
>  	system(reset_string);
>  }
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 4d08402e0b..ff5b5d3ed0 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -91,6 +91,6 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		     uint32_t exec_queue, int64_t *timeout);
>  int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       uint32_t exec_queue, int64_t timeout);
> -void xe_force_gt_reset(int fd, int gt);
> +void xe_force_gt_reset(int fd, int gt, bool sync);
>  
>  #endif /* XE_IOCTL_H */
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index e47c3730dd..ed67284800 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -239,7 +239,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  	}
>  
>  	if (flags & GT_RESET)
> -		xe_force_gt_reset(fd, gt);
> +		xe_force_gt_reset(fd, gt, false);
>  
>  	if (flags & CLOSE_FD) {
>  		if (flags & CLOSE_EXEC_QUEUES) {
> @@ -383,7 +383,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  
>  	if (flags & GT_RESET)
> -		xe_force_gt_reset(fd, eci->gt_id);
> +		xe_force_gt_reset(fd, eci->gt_id, false);
>  
>  	if (flags & CLOSE_FD) {
>  		if (flags & CLOSE_EXEC_QUEUES) {
> @@ -530,7 +530,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	}
>  
>  	if (flags & GT_RESET)
> -		xe_force_gt_reset(fd, eci->gt_id);
> +		xe_force_gt_reset(fd, eci->gt_id, false);
>  
>  	if (flags & CLOSE_FD) {
>  		if (flags & CLOSE_EXEC_QUEUES) {
> @@ -590,7 +590,7 @@ static void do_resets(struct gt_thread_data *t)
>  	while (!*(t->exit)) {
>  		usleep(250000);	/* 250 ms */
>  		(*t->num_reset)++;
> -		xe_force_gt_reset(t->fd, t->gt);
> +		xe_force_gt_reset(t->fd, t->gt, false);
>  	}
>  }
>  
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index ff99b46a08..1cfc248947 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -324,7 +324,7 @@ static void test_reset(int fd, int gt_id, int cycles)
>  		igt_assert_f(get_freq(fd, gt_id, "cur") == rpn,
>  			     "Failed after %d good cycles\n", i);
>  
> -		xe_force_gt_reset(fd, gt_id);
> +		xe_force_gt_reset(fd, gt_id, false);
>  
>  		igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
>  			     "Failed after %d good cycles\n", i);
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index aa4a452bfc..4f772a0e10 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -31,7 +31,7 @@ static void force_wedged(int fd)
>  	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
>  	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
>  
> -	xe_force_gt_reset(fd, 0);
> +	xe_force_gt_reset(fd, 0, false);
>  	sleep(1);
>  }
>  
> -- 
> 2.25.1
> 
