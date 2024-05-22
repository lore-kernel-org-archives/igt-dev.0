Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58ABC25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 10:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4591510E7A2;
	Wed, 22 May 2024 10:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STNawnAU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFD910E7A2
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373855; x=1747909855;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vyTyltaQBlLvsjvfNjTwLB4fvX4g35l5PSsOrzeUNvs=;
 b=STNawnAUDN9hGbufG47CRZbMQ/1E6Djjsyk2CiZmVyHEFcQ8xDAfqJl6
 rHJdcRe9MFXRi2ApJhuJDaZRMjWavTtSqcVmbcgNaOxLpZCF1e29TAtJt
 8KfAqNYguVfKiNsFVOJ0L9qYW1LG/sI+elt9TmvhpzDPkHLUGxTEcZqTi
 nKqF80TwlGk1p4fZp8ccMNW5tBULdiwi9Zt75QRT9OL7WGPmzS32rkIHD
 +k2eOzf3GDzWv7Q0BdX/KoATUAqcT2LjWIlZ00dyFMlJtaRB8dKgaeZRk
 31jCHUM7ExoOHYJwqvaBOeSFr08fmrJULX8Vkl7+7XuVT9gQ74F+2R7RD Q==;
X-CSE-ConnectionGUID: g7Byq9ycQMGS+fP1ffki+Q==
X-CSE-MsgGUID: yg4bGAdaQ8SGGwimKoCYWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12554771"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="12554771"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:30:54 -0700
X-CSE-ConnectionGUID: 3um6pwa2RBuRCJwi7Hsxig==
X-CSE-MsgGUID: Uv2vfoqxTgKmldGUN+1lsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="64477075"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 03:30:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 03:30:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 03:30:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 03:30:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miZeXSa1BRnFHqlx0QvMF5uaoK0dzwg8G0r3/OY9n79Wbs2K5Rxc7VEjQ+seky7v8t5GfjdV21AuNk8xdFGKAmfewZUpjTT3OuRxr2QuRaPoEoKDJ3mFu6+4kMz6trJVzyFg2JNAwQU3rN00fS5M3JCdnVcpTCX48iBK4hawGp4Knko96cQ8nvSIcS3WZK506vlFrHHCJUivwnjSQx5XwliqUbPsvMBMFUj0jwrpBk83j/rHVjVmupvpSgrHfYHVxGwFZgq+OeBMlVifTwV5P8m+aZo3CS86qIJYTV8xfiEWmYmk32GmpLCLd/Ovww3BroAbKTegS5F0NG+OgfGUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fnlrU5rnHHbizoPMOeHVferuv5HkMrlA/2Vb2N/FdY=;
 b=OvKIhzwSnQBJOBDif8pEkY7ogJmVQifdRYUVVhx7RXS3HSeB5MgyN7p/RYFAScQ8n6X8cQb69SzX+ZvXxqYDbqzccDViQGOXiOZSAOGTpvqRBRXiQ//yhXhNp5i1GQ0maNc4UrWLDm6oWr59EF//O2CKkxba43i9aw4xIhgx4sxRBW2xH8LMZi7GLVfwbxWlh60/uqDBUXpO27FkNc58fP98aRsraJuIYH8MFCgvvUGunEHQQaKCi9BAhbzsO09Xj3tnXqq8PcBOJxKnes3bsWGjEw08kdmklvxUNWQ05EcC+Ne8U8YahJSLX4w/BZQCnfWRC3TAvURa3psJH9jTqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY5PR11MB6416.namprd11.prod.outlook.com (2603:10b6:930:34::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 10:30:50 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Wed, 22 May 2024
 10:30:50 +0000
Date: Wed, 22 May 2024 10:30:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_tlb: Check TLB invalidation
Message-ID: <Zk3JPRsIvaeJ65Dg@DUT025-TGLU.fm.intel.com>
References: <20240522094740.32684-1-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240522094740.32684-1-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: BYAPR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:a03:100::29) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY5PR11MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d8ba8a-b7a5-4809-0039-08dc7a4a4050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?D+8sRHyaDYKlkCpsqpdKYP316CIc1jO6ogRxCeT1//bt/HYQwy8/7XXtF9?=
 =?iso-8859-1?Q?P9EI5Bt17xE+lnAePZhshJJXsajDNrlP1wkjkJ2l7E5UHiiWPO1saUq7qK?=
 =?iso-8859-1?Q?61T36kCwIDkDWi94TTDJvJSiF/HOXPQJtWM2G5yFoeB/ftO78AgHBGRXQs?=
 =?iso-8859-1?Q?tAKDRcCLoQUNUx7hmSSf9hXE4Rq/ijZwQAQ40YX1XAA1vHcm+oEv9tlzFo?=
 =?iso-8859-1?Q?6HzU6XpfCs8jyXjqVKSy7jJMESTaVSd7vxpuhQo02v96ZLTIO+sJH2V2th?=
 =?iso-8859-1?Q?qmKE/MQKoZYaaWLWZLs3vLxHOKx2ImLzBOV7rW8dPFfT4QVC4UPP/IUx5g?=
 =?iso-8859-1?Q?7nJFnadYHdGxxgMrQVgyv5cKptrJWWClaw5r9R7clL+i13t5ykSYkaGpfb?=
 =?iso-8859-1?Q?F8MfSSs1jkvPmLBk2u9KnLyKS/j77HBr/INmsgVkw68SAUC6fFenLmOBKn?=
 =?iso-8859-1?Q?nuIMtmxayYy5d53K6sPIH+YjRIk343svTwxgALPGgxdHd4eoWpMEQqFZtZ?=
 =?iso-8859-1?Q?A9xZuqWDWCNPWpfwVVmCdH3gd12LtS8jQ70/GoR7hD9JlG9BN589HaJ7TS?=
 =?iso-8859-1?Q?6+wzwmkb5DWAwNaurVWFGf+9rxqGbKnYnDU4/oD9vMYC/lCdvrTm0odB5a?=
 =?iso-8859-1?Q?rIcArWlqofJzEzxAK6xiX3u2QW9ipSL/IebDLB0boS9yew+C5H5fZpQRz+?=
 =?iso-8859-1?Q?GcJSJnGDv8Yr1mVf8/gqeLsmcKfuUl29/vApu3R6sBakLexN6r8w8Gt3E4?=
 =?iso-8859-1?Q?3mnjeeDFBjutQ3pwA7SXgmI+V2/A/aeD8rOOV2K+OpC83O6iDw9fwiJ+uw?=
 =?iso-8859-1?Q?8AoQ76h+BcfzEqdcfe1gfrZYOQ455H0+2oRJnjfY6msrBGWPnc0gysGlA6?=
 =?iso-8859-1?Q?269jiZ2omZijS6E1XJwuGSqEibNlalP3pocnYwD/QkJYP0LuvBI/0biAJ9?=
 =?iso-8859-1?Q?gKXJlYe1c4pNW8Kv8GzJabUzUWvmsP0ZbfNtQULl4Qka6wmlBg33rDrxPr?=
 =?iso-8859-1?Q?iRKUDfx9rvsmC3eVk8SbFb94/j001BU0X/XgzBO5afomie/AVggH9H0Rxj?=
 =?iso-8859-1?Q?BkWE1GO66P/pEXvz171XoPHlNPtS0RvWHN0F2tXo2Pyu0sECYn8A498cN+?=
 =?iso-8859-1?Q?VWtA0LWQ6/GCoYW+rGgguYUOqIAgUvp8KA7Lom29FgjysrnO9n1X+DMWKN?=
 =?iso-8859-1?Q?O9l6ODLFSFVASWeMqLldWLZ14OjRaaZFfLtM7ZImoD6eeO9UEMciDer30e?=
 =?iso-8859-1?Q?PbgBMyeZcyAE9YDH5A0LiL5NI+tDOb9mVwdSu8nEh0Graqybt7vnukF+Ei?=
 =?iso-8859-1?Q?yDQuHw7/Q7ElKiL0azFWhXwpyg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TlCI8uQIaGCoy/bTptmi5GYYtp13ncOpYtknLpndiaBcT7Lp9pYwip+RKy?=
 =?iso-8859-1?Q?1sWDpyW9cS+RvVCgpeJAvrGVNOmi3yj0VWO6zudQ3WPs1Bklarvnvrhy3y?=
 =?iso-8859-1?Q?QV0UR/nQKrR3Ggld9Wv7kZEWC5qTi8dj3SAvElL1OXwQFu8Ykr60iK8G00?=
 =?iso-8859-1?Q?h4w7vStO9qnc5GIyB1ri1f2ytrkah24B/BztUI2TsAHMgvytgtqXGz2e1G?=
 =?iso-8859-1?Q?oa5fTDab/VipTsuJez15+0lLeeKrFAFwTPTsf44tJU0tgdUgPoA+PbQhNw?=
 =?iso-8859-1?Q?Rp39OiCe80ojQLG9mxcNaiyR8WPi8v/6mIxcBMElgqLROCPP9ijBng2E5S?=
 =?iso-8859-1?Q?lzF0AhG76iZmTZaInYvTwm/c0AI1DefB/v1hN3FGnwJeABXqFERbRzEsQ7?=
 =?iso-8859-1?Q?Id5HFJ6T+e6n6YkrgL2P/XP1yL7JLpDIVFK/bhuM0/v1HLhmyS/HJWods8?=
 =?iso-8859-1?Q?VtfIjrBsiENVaHUUwRSnx+Io1VS/nyY5GEUbHsdX64Qt51f2DVtF4XFiZc?=
 =?iso-8859-1?Q?yBI4PEz5g1KFGr9HIpwtllXNI9B3PJViZ+9Ub/9eWA5hAaR6uPbueNow8D?=
 =?iso-8859-1?Q?ULfwQjnGORi/ZQmSe4PfupymZkeBJGxAES4TOcGlB3C6p/pz6AUyg2tYr2?=
 =?iso-8859-1?Q?eaV8pDKc9jcUkkX2IzQG3sL0gmmyghUlWED98g3pn2HtN22V4ReceT9O5X?=
 =?iso-8859-1?Q?ATMAIJEA2WfOqUMhrdljdJZSWEdya+R50ubxTefIufswSTGBT2N6VQcWZ6?=
 =?iso-8859-1?Q?spfK5BqKD9krC8n4szGo3C/3S0/u+JOnRMOTi93FhfBO0l60DJjCMd4k5u?=
 =?iso-8859-1?Q?XtzjwqV4y3H60CTdQ26fNET4Zrp9/bxdfAJt/iCA+LA11Be9QVP1+Vxx0p?=
 =?iso-8859-1?Q?uZuHeVR+OGqwvSSkoF0fsreaVORn+m2vOlPQHZmo3bm5iEURr6dZjcsX1D?=
 =?iso-8859-1?Q?q3VPzpWwtFv++cG8V4qKbZZQpImtKPVgkVMpbmMD2CEh6NhFAgCZBX+HvC?=
 =?iso-8859-1?Q?zVvlC2nfvHdelTFaQo4pyNRRFwQPnqm1QOvez/S1VJxiG1monbbzaLmz9X?=
 =?iso-8859-1?Q?If0wGx5pgVZxXI2MXmafG5nYky5JV2CrQUm/Vah9qafNFRdh9quD5rC2bw?=
 =?iso-8859-1?Q?Bj33eG2t/DLmVosQ3l4gxirWCVV17qfRSK9JvIAJzAyTQfFYdbnD+L0+0d?=
 =?iso-8859-1?Q?VaLsRIqJHYJvTUhEWvBouk7CYDUgHWXf/UttMsbt90JDqM4Pzemu0k+q1j?=
 =?iso-8859-1?Q?+aFG8iwfQzsxg5/jY2mEOHr5DLZrnrJCb4i4Th5dlS23o01VEzmf1nGEmA?=
 =?iso-8859-1?Q?hXyoW+lrybJwqQv6PKkVMi+eomkRFB3ZtmUoYLCN/IVAvxr3oHTDFyrvOR?=
 =?iso-8859-1?Q?hYL1urpaPgNxtzxqzsmotZip3lMatTe+gdg5u9t5/51+nYQphiX6PPZocc?=
 =?iso-8859-1?Q?ZyJfPf9Z+Zj6hiimj2AbjC6TOnc4IiAeFwWGOko9RQr8NBLy57XdtkhTN2?=
 =?iso-8859-1?Q?l8iBr7u5ghZYfCGY+3FXjGnr5OB2mYC6THcSK3gRkZuJKxigzrFcN6BN2Z?=
 =?iso-8859-1?Q?hSYLT2CKdF/e8KEOFXMp7ltpvUNnAug3NN90JiRQvaccJhSlmslVvoXBuJ?=
 =?iso-8859-1?Q?EABVLuMtDxT6T+NYxgO50bDcE7RiBQeQYosC3Lw1gHNqF/wHLf+S9nvg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d8ba8a-b7a5-4809-0039-08dc7a4a4050
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 10:30:50.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVGyC60SFVyyC3fw61ufe6HmCLFFdoQZhmFpUKeCjGEBZ7dKFNTjkuzislgf9yBbhu3eSx5zOPomZcj1gr/z7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6416
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

On Wed, May 22, 2024 at 03:17:40PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Test validates TLB invalidation by binding different buffer objects
> with the same vma and submitting workload simultaneously, Ideally
> expecting gpu to handle pages by invalidating and  avoding page faults.
> 

I don't think this test is creating new coverage beyond existing tests. There
are many tests that unbind and rebind something to the same address (e.g.
xe_exec_basic --r rebind), granted this is the same BO though. A userptr
invalidation, however, triggers an internal (KMD-triggered) rebind, and we also
have many tests which do this as well (e.g. xe_exec_basic --r invalidate). In
this case, the rebound data is different.

With that, I do not think the test warrants merging as it does not provide any
additional value.

Matt

> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_tlb.c | 178 +++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build    |   1 +
>  2 files changed, 179 insertions(+)
>  create mode 100644 tests/intel/xe_tlb.c
> 
> diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
> new file mode 100644
> index 000000000..8e6dba5a3
> --- /dev/null
> +++ b/tests/intel/xe_tlb.c
> @@ -0,0 +1,178 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright © 2024 Intel Corporation
> +*
> +* Authors:
> +*    Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> +*/
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include "xe_drm.h"
> +
> +/**
> + * TEST: Check Translation Lookaside Buffer Invalidation.
> + * Category: Software building block
> + * Mega feature: General Core features
> + * Sub-category: CMD submission
> + * Functionality: TLB invalidate
> + * Test category: functionality test
> + */
> +
> +struct data {
> +	uint32_t batch[16];
> +	uint32_t data;
> +	uint64_t addr;
> +};
> +
> +static void store_dword_batch(struct data *data, uint64_t addr, int value)
> +{
> +	int b;
> +	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
> +	uint64_t batch_addr = addr + batch_offset;
> +	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
> +	uint64_t sdi_addr = addr + sdi_offset;
> +
> +	b = 0;
> +	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +	data->batch[b++] = sdi_addr;
> +	data->batch[b++] = sdi_addr >> 32;
> +	data->batch[b++] = value;
> +	data->batch[b++] = MI_BATCH_BUFFER_END;
> +	igt_assert(b <= ARRAY_SIZE(data->batch));
> +
> +	data->addr = batch_addr;
> +}
> +
> +const char *xe_trace_enable_path =
> +				"/sys/kernel/debug/tracing/events/xe/enable";
> +const char *trace_path = "/sys/kernel/tracing/trace";
> +
> +static bool sysfs_write(const char *file, const char *value)
> +{
> +	FILE *fp = fopen(file, "w");
> +
> +	igt_assert_f(fp, "error in opening file %s\n", file);
> +	igt_assert_f(fwrite(value, 1, strlen(value), fp) == strlen(value),
> +			"failed to update sysfs tracing node %s\n", file);
> +	fclose(fp);
> +	return 0;
> +}
> +
> +static void start_tracing(void)
> +{
> +	sysfs_write(xe_trace_enable_path, "1");
> +}
> +
> +static void validate_debugfs_trace(int fd)
> +{
> +	igt_assert(igt_debugfs_search(fd, trace_path, "tlb_invalidation_fence_create"));
> +}
> +
> +static void stop_tracing(void)
> +{
> +	sysfs_write(xe_trace_enable_path, "0");
> +}
> +
> +/**
> + * SUBTEST: basic-tlb
> + * Description: Check Translation Lookaside Buffer Invalidation.
> + */
> +static void tlb_invalidation(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, }
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +	struct data *data1;
> +	struct data *data2;
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +	uint32_t bind_engine;
> +	uint32_t syncobj;
> +	size_t bo_size;
> +	int value1 = 0x123456;
> +	int value2 = 0x123465;
> +	uint64_t addr = 0x100000;
> +	uint32_t bo1, bo2;
> +
> +	syncobj = syncobj_create(fd, 0);
> +	sync[0].handle = syncobj_create(fd, 0);
> +	sync[1].handle = syncobj;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo_size = sizeof(*data1);
> +	bo_size = xe_bb_size(fd, bo_size);
> +
> +	bo1 = xe_bo_create(fd, vm, bo_size,
> +				   vram_if_possible(fd, eci->gt_id),
> +				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	bo2 = xe_bo_create(fd, vm, bo_size,
> +				   vram_if_possible(fd, eci->gt_id),
> +				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	start_tracing();
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
> +	xe_vm_bind_async(fd, vm, bind_engine, bo1, 0, addr, bo_size, sync, 1);
> +	data1 = xe_bo_map(fd, bo1, bo_size);
> +
> +	store_dword_batch(data1, addr, value1);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = data1->addr;
> +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_exec(fd, &exec);
> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +
> +	xe_vm_bind_async(fd, vm, bind_engine, bo2, 0, addr, bo_size, sync, 1);
> +	data2 = xe_bo_map(fd, bo2, bo_size);
> +
> +	store_dword_batch(data2, addr, value2);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = data2->addr;
> +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_exec(fd, &exec);
> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +
> +	igt_assert_eq(data1->data, value1);
> +	igt_assert_eq(data2->data, value2);
> +	validate_debugfs_trace(fd);
> +
> +	syncobj_destroy(fd, sync[0].handle);
> +	syncobj_destroy(fd, syncobj);
> +	munmap(data1, bo_size);
> +	munmap(data2, bo_size);
> +	gem_close(fd, bo1);
> +	gem_close(fd, bo2);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +igt_main
> +{
> +	int fd;
> +	struct drm_xe_engine *engine;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +	}
> +
> +	igt_subtest("basic-tlb") {
> +		engine = xe_engine(fd, 0);
> +		tlb_invalidation(fd, &engine->instance);
> +	}
> +
> +	igt_fixture {
> +		stop_tracing();
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 758ae090c..e4fee5ca0 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -316,6 +316,7 @@ intel_xe_progs = [
>  	'xe_spin_batch',
>  	'xe_sysfs_defaults',
>  	'xe_sysfs_scheduler',
> +	'xe_tlb',
>  ]
>  
>  msm_progs = [
> -- 
> 2.39.1
> 
