Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBDB60A2638
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 19:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VqAE5RuA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649BF10E454;
	Wed, 11 Nov 2026 19:24:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B226910E32D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 19:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794424991; x=1825960991;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qLilHge/qmXYaTUmPPQ+q3k3dUv5J4ub/P4EH/9LBzE=;
 b=VqAE5RuA0Mnyf15qy8ZpzeMmv7FrSGP3v/UIsARlR+xBb0GV+d/DLgD7
 MpFN8HZOrmdEnDIGVA86e3Du9JP7G0Zou1MHE6yKRjLAO0fnrpD55Iptu
 Bzpgwd4VXXx6t/n2lxT35hLPAS/vClhkeaDujVtSPNcCUdJpXrO9Vsezn
 xUAx2IGow9n8seWbIvaCGCs2aIOG4+wn9Hd8llZZmNVfZv6GbyJQTcUl8
 S2cFQEr+LxxJSUeqq+ILV0BrnqTc5egiIXOU6yqNKCmpKDQ/l1+I3wv3p
 n2iWzVqbrk+2mFqcz+y+DbfVgTXnqYwFejxLX7djFFVzDKw00FfkPvcRo Q==;
X-CSE-ConnectionGUID: GGelCK4DQhGyzvuMMUe6Tw==
X-CSE-MsgGUID: kRGinIHAQ2Wzz7qgH3E2MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3197978"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3197978"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 11:23:11 -0800
X-CSE-ConnectionGUID: SXL3Y/NwQdaJS9QhAqEv4Q==
X-CSE-MsgGUID: Ox+pt0UuTrG94Cn1Vlg+ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8564841"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 11:23:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:23:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 11:23:09 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:23:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwaqJYvP4HpLd0c+Ub1l+OlC39noKYfXuwYa38Za8Zx15QRjTdb303bIjQXTZmPX306exfmzvvImmOznrsgGnAZZR4xPetYvpFgxLDIS9Lkb1Y6CEocbgM+ksdMJtRGwKvVeH97ZIzI8pZC2lMqUOIfpl5mHqQSQUIEGN/HWPtwEtPc/nks1udgD8RCBHojn3AnpSxHEqvwa3zIiWm9jMdGiVe32rSxBFoFznEheHjxT1aO9Dr0SEKAxF+XoqGwRkRjssflLkhWGn6yS7k3Z/nAbFd1X5jMwea3ftgiDAtQ67wnwCxCtoEQLXRn58g0ett99HFZPXMmk/uHJ1jqujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTYb+zR3OFux13iBsIWfS/Boz1CWhzofwPpB6mGDPDE=;
 b=AMJATQ+KWAvWZrmPadv/d1fq0DNvwBs5uSHlw5N6InItuOHHhAdHsUJ+5gObnRlk8x0pRMhfFp0dJFDqb4q4s1EclPC3E6SkyrqRVE4KplAmsFLEa1+HaE5rBIgSe3PI3MN2ZtOPvluKHkpVul9eKeaO6q3kCHBhwrlXuK7fnr/tqpuqVbuWRGXRFIxv47wG3NDqv0Ts/FepAW9Mw75lDM4m37q3ZIm1BjYobq5bCWPbtFIcOpgeG7rTw/QxwdTk9kFKcNyovgEzZkFIJxTR49/Jfj6aDQwaj5yOoubeUzDSyzmgo5+cbMPujAuYG6cC1zE+CDmNSzl+jg8bGfuzHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:23:07 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 19:23:07 +0000
Date: Wed, 11 Nov 2026 14:23:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <frank.scarbrough@intel.com>,
 <david.e.box@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] test/intel/xe_pmt: Add testing for BMG PMT
 features
Message-ID: <avTAlrBoCVKfrSds@intel.com>
References: <20261028200500.4005780-4-michael.j.ruhl@intel.com>
 <20261028200500.4005780-5-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261028200500.4005780-5-michael.j.ruhl@intel.com>
X-ClientProxiedBy: BY1P220CA0048.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::6) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH0PR11MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: 57080d9f-9f3a-44f1-625f-08df40293710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|261009223027099003|10067099003|261022113327099003|261022105027099003|261022075727099003|261022115727099003|11063799006|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XNTwD9Z3f8HXko0ltXRPns5ZDKcvRZWGbwaDPR3GFPYOh9AwaqnEVjkY/3frza1bwCUKatqlHOSF1P65ux39wRNU62qHoZ7toHZFc5aUAQvwkuY6IGIluDr4TO1DyC8pCTyTHWNBviw0HabM4Qj8J6U0Q0gTBLYDwGv7j/tFVyX1bHZtvnCKC6j+JwVgfYvpJEHeX+/tR0v3jXMHK/vtC1j8qQWqdCN3laP3xKQJXHbl5lIGz/iUg/yOoLhS0pWob085qu0bPeK0B9bTINloGmtFm6BIzXG3Sy96K9gGvkqYIWfqxpfRXgYQafKV89jcfYykRvaqcQmFypmRUX7t/qA9YmB8u7az3n+WpIBlPxDnith3Wr+miARH2y243JHK1k6Cl3f+rn0vlt+D9d9a0dKGeYqou8uaRMI/aZF2GK9D54qgm2kcRYcFMWQr55Nk9O4xtT0G8nvul7KPn8G2Y48Vjb94Y3rOd/hUmaudGHGQigLPBkbdV7D3M+0qLiX7T+uCM46ay3ySt+lk8zsDRHLoycZBWGYgDD2WEb5JENxy6A3X1ZyZ1LkEhIXCron838JjWY+W5b1IGtyXPwWmJ3dfhV8c4/qtRm+gWRXe4fnwj/uR/jC8LPt3MTng8z2gCO3fGAQeRCJ3fzar+FevFKYWMnkXJ1EddfKD+CbsnBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(261009223027099003)(10067099003)(261022113327099003)(261022105027099003)(261022075727099003)(261022115727099003)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9nx3g+fC2/yF4lN9zsyuriYyob/Ul2itMFQ6ZhWIqb7yoEet71thOY8fOZ?=
 =?iso-8859-1?Q?icf3f5CRi/YvZCAu6QnAb2RyBUBw+639NqdX6JoH1PJdmtDpx+lgN9KB4K?=
 =?iso-8859-1?Q?s2vzYLw7wUIAO5h7jSf2AqsRcR6rdL5gGgNeV3JpQln5EeAYDcLBdKrSiZ?=
 =?iso-8859-1?Q?KWmmU3UeL8ibg1eIPCfoADeV6Up7EtQjHHy/gzGuUFn5ehG1Fmltkf0hHG?=
 =?iso-8859-1?Q?gpWP5og3/1TGx1ZXGLMdC/FSEWLklIAgfTrutvAjbI4X7eM/Fgr+2puICT?=
 =?iso-8859-1?Q?jn2+1Yz7TZMginiBIgDEvTi9SNJZQIDBl42obTu6zyd/+CfbMlCiT+Z15D?=
 =?iso-8859-1?Q?/913n98PvVV6V8ebIlO2yq6Gv4hMfXOnqki1apyX0labzY1vzcBtGbEBpE?=
 =?iso-8859-1?Q?axy0i54W8vXNZKK2XLVvvQWCAKKckyMjsCFpoLnrWIWwNH4pribznFrjIH?=
 =?iso-8859-1?Q?dbAH6maXXtte6qCVwwswicIsUymJZO9FKT6gvqoX2kzj/e/WxJkTeTSCAF?=
 =?iso-8859-1?Q?CMJwUb8qnCPT8HPaYIzxtmPmGZeL46LTMhf0RnzQUez7a3HhQnge85SG0X?=
 =?iso-8859-1?Q?orJ0uA664iYtS1x/Iv4MC0SdPAkpSofsHwwg6HHu9lOlZDVoCShX77b75T?=
 =?iso-8859-1?Q?3B9iYR+nUYVCHzY5NtWjwBliY83KnefiX1y/ik3bXHmGYUBT2THvI0Om92?=
 =?iso-8859-1?Q?Uwbld77U4ErnloX520JzNntDTbaYuQ4oyuyWVFR7UhZ2sSeXJs9bgFzyrs?=
 =?iso-8859-1?Q?UUWkf3s/AEiMjED6BTIx1zNjbwofEZV/rql7eB0ZtVLzm2ZSwGzdSI85VT?=
 =?iso-8859-1?Q?eAeeX3+zD3CoOWD/kJOpuMCZpqbJRCGB/73l7kpa4CU+GnKwudXwpc0ORd?=
 =?iso-8859-1?Q?+tc8T8wyV+mjXZM/bUcXoWLliSGKA3scS1P2gJH55pGlU6J3qVv15Dtodv?=
 =?iso-8859-1?Q?6pKX6o8ZN9870u/4fZXqLeTEI0+9I+TnkM0wq3dYKkF312qx1qy5EV7d58?=
 =?iso-8859-1?Q?IMioqYs2dN2aEA7V3JSPnc+t3tqFgO6GZfPmEqzqjdZF6f0A5QRfj4GZWC?=
 =?iso-8859-1?Q?Y1aWB7viV05N0usK5CIyjMqi1YAXUI7EX0/Mi5wn8FY4Hx1zWex+IGZZ2n?=
 =?iso-8859-1?Q?BeA7jOpT+6y51s3fDcIBAtXJ93H3QFGHG729rQfcQl40+FNai8ljqdWRyC?=
 =?iso-8859-1?Q?PH++Mf/1vECTrmtrzr9zanCfXkmePftS5ni8se0VvXuncVOOiJ1WwyVpWZ?=
 =?iso-8859-1?Q?6TCtVxqGE0RyUuiDhMa3DFwK9LPNDS27AAph7hCt7r4Zpoumb1ow/UaX6o?=
 =?iso-8859-1?Q?SoXTT3CSxZrhz41IJctCIHKyddh2jAs6XG7X0rB7PDRHMZL8KLTpLw8Bg2?=
 =?iso-8859-1?Q?YGyOtoA7FbW9y2+AR54iqplrjbRgv5VpCfS5LGIPIAVxdi8L5+h/2VtacX?=
 =?iso-8859-1?Q?en0yHcyI2DeqEA3/rrGPQySOic0S85PvI1SqQngE8HcLPXHzgULUITHe5u?=
 =?iso-8859-1?Q?VyLErcK7zSaTcORERMB67zbdvR9ukFyyBofPW4snT868PrGQtwOsSAML2c?=
 =?iso-8859-1?Q?fj+vrWqijEcS9rS+tVX8od/ewIh7Lc7zAigOqBu0W/RSm3tycAjf8p3458?=
 =?iso-8859-1?Q?0k8FiVgKw4osRo7a/+v359nWauNhs215OubO9h9ETDWO4Jjnb540xvg7Eu?=
 =?iso-8859-1?Q?XgVaD0ooAAKqeq/Qi5tmYjqqV7IZkERUfjB8R2DtnDQe2mePBrVp8fX1t0?=
 =?iso-8859-1?Q?JcaC4Xp7Jo0zH9NeUtpa3/8s8dwyiNwpJnRqh5PxiSDGrtFIwxfmZg8GlX?=
 =?iso-8859-1?Q?lraNzHT55A=3D=3D?=
X-Exchange-RoutingPolicyChecked: WL4xB48wUy161ge3e6IA0eXBAjDnUq5dbk2cplyIoMosZLVtnmlweDcvdV3YT+lnMtxW1tAvkDBFX7hnjh3xN74jYDRIz4rujc2WqnABcprDGra59T6WpUz+6QC03Cnb8qyK+elYLQg+lfcFAggyz12l+chEx9Ma+g16frQFH8QgDEKJdyaX6xC6/8GcR96yVhQDnSIM/8bORnbRIZVvTV/JnUCXA079iXbOUZ8toJsYvWDo/Yapmtr4BmIVYV1DZavsiY0lxXAfAlpWUoOCnMVypsAb4ZsWZIEGTiYJmNaLVd6yoRdXQfWQgU0gT1zX2P1CJZmr7QBa/gfAix0zXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 57080d9f-9f3a-44f1-625f-08df40293710
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:23:07.4741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qa16NFyCD+d+0VhpzGtvAntS8Ail0BJU/PFLJIKC0oC11JkBvJlj4iyIXTJX9oZxEpbNYe+wyASAWMzVAnWXyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 01:05:01PM -0700, Michael J. Ruhl wrote:
> Battlemage (BMG) devices have the Platform Monitoring
> Technology (PMT) telemetry and crashlog features. If the
> device present is a BMG, test the PMT API.
> 
> NOTE: the testing order is not flexible and must be done in
> the currently specified order.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  tests/intel/xe_pmt.c | 562 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 562 insertions(+)
>  create mode 100644 tests/intel/xe_pmt.c
> 
> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
> new file mode 100644
> index 000000000..af5d470b5
> --- /dev/null
> +++ b/tests/intel/xe_pmt.c
> @@ -0,0 +1,562 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <unistd.h>
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <string.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +#include "linux_scaffold.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: Verify Platform Monitoring Technology (PMT) files operations
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: uapi
> + * Functionality: sysfs
> + * Description: Verify that the available PMT files (crashlog and telemetry)
> + *   are created, are accessable, and respond as per design.
> + *
> + * SUBTEST: pmt-bmg-all
> + * Description:
> + *   Exercise the BMG PMT feature
> + *
> + */
> +
> +IGT_TEST_DESCRIPTION("Verify Platform Monitoring Technology (PMT) files operations");
> +
> +/* base directory names */
> +#define VSEC_CRASHLOG_DIR "intel_vsec.crashlog."
> +#define VSEC_TELEMETRY_DIR "intel_vsec.telemetry."
> +#define CRASHLOG_DIR "crashlog"
> +#define TELEMETRY_DIR "telem"
> +
> +/* itemize the available instances for the specific device */
> +enum bmg_crashlog_instances {
> +	bmg_crashlog_punit = 0,
> +	bmg_crashlog_oobmsm,
> +	bmg_crashlog_max
> +};
> +
> +enum bmg_telemety_instances {
> +	bmg_telemetry_punit = 0,
> +	bmg_telemetry_oobmsm,
> +	bmg_telemetry_max
> +};
> +
> +static char dev_path[PATH_MAX];
> +static char work_path[PATH_MAX * 2];
> +
> +/*
> + * In most case there should be a single instance of the crashlog and telemetry
> + * directories. If DVSEC entries are not contiguous the structure will be different,
> + * and the code will need to reflect the structure.
> + */
> +static char crashlog_vsec_dir[32];
> +static char telemetry_vsec_dir[32];
> +
> +/* This needs to be specific for each supported device */
> +static char crashlog_dir[bmg_crashlog_max][32];
> +static char telemetry_dir[bmg_telemetry_max][32];
> +
> +/* telemetry file names */
> +static const char *telem = "telem";
> +
> +/* crashlog filenames and descriptors */
> +static const char *clear = "clear";
> +static const char *consumed = "consumed";
> +static const char *crashlog = "crashlog";
> +static const char *enable = "enable";
> +static const char *error = "error";
> +static const char *dev_guid = "guid";
> +static const char *rearm = "rearm";
> +static const char *trigger = "trigger";
> +
> +struct crashlog_v2_info {
> +	int clear_fd;
> +	int consumed_fd;
> +	int crashlog_fd;
> +	int enable_fd;
> +	int error_fd;
> +	int guid_fd;
> +	int rearm_fd;
> +	int trigger_fd;
> +	u_int32_t guid;
> +} bmg_info[bmg_crashlog_max];
> +
> +#define DEV_PATH_LEN 80
> +
> +/*
> + * device_sysfs_path:
> + * @fd: opened device file descriptor
> + * @path: buffer to store sysfs path to device directory
> + *
> + * Returns:
> + * On successfull path resolution sysfs path to device directory,
> + * NULL otherwise
> + */
> +static char *device_sysfs_path(int fd, char *path)
> +{
> +        char sysfs[DEV_PATH_LEN];
> +
> +        if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
> +                return NULL;
> +
> +        if (DEV_PATH_LEN <= (strlen(sysfs) + strlen("/device")))
> +                return NULL;
> +
> +        strcat(sysfs, "/device");
> +
> +        return realpath(sysfs, path);
> +}
> +
> +/*
> + * Verify the PMT directory structure
> + *
> + * BMG PMT directory structure:
> + *   device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
> + *   device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
> + *
> + * Note: different platforms could have a different pattern
> + */
> +static void test_pmt_directories(int dev_fd)
> +{
> +	struct dirent *ent;
> +	int index;
> +	DIR *dir;
> +
> +	igt_assert(device_sysfs_path(dev_fd, dev_path));
> +
> +	/* verify top level PMT directories */
> +	dir = opendir(dev_path);
> +	igt_assert_f(dir, "no directories found\n");
> +
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(VSEC_CRASHLOG_DIR, ent->d_name, sizeof(VSEC_CRASHLOG_DIR) - 1) == 0)
> +			strcpy(crashlog_vsec_dir, ent->d_name);
> +		if (strncmp(VSEC_TELEMETRY_DIR, ent->d_name, sizeof(VSEC_TELEMETRY_DIR) - 1) == 0)
> +			strcpy(telemetry_vsec_dir, ent->d_name);
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(strlen(crashlog_vsec_dir), "missing crashlog directory\n");
> +	igt_assert_f(strlen(telemetry_vsec_dir), "missing telemetry directory\n");
> +
> +	/* verify crashlog directory structure */
> +	sprintf(work_path, "%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt");
> +
> +	dir = opendir(work_path);
> +	igt_assert_f(dir, "no intel_pmt directories found\n");
> +
> +	index = 0;
> +	/* find the crashlog<x> directory instances */
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(CRASHLOG_DIR, ent->d_name, sizeof(CRASHLOG_DIR) - 1) == 0) {
> +			if (index < bmg_crashlog_max)
> +				strcpy(crashlog_dir[index], ent->d_name);
> +			index++;
> +		}
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(index == bmg_crashlog_max, "too many crashlog entries %d\n", index);
> +	for (int i = 0; i < ARRAY_SIZE(crashlog_dir); i++)
> +		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d] directory\n", i);
> +
> +	/* verify telemetry directory structure */
> +	sprintf(work_path, "%s/%s/%s", dev_path, telemetry_vsec_dir, "intel_pmt");
> +
> +	dir = opendir(work_path);
> +	igt_assert_f(dir, "no telemetry intel_pmt directories found\n");
> +
> +	index = 0;
> +	while ((ent = readdir(dir)) != NULL) {
> +		if (strncmp(TELEMETRY_DIR, ent->d_name, sizeof(TELEMETRY_DIR) - 1) == 0) {
> +			if (index < bmg_telemetry_max)
> +				strcpy(telemetry_dir[index], ent->d_name);
> +			index++;
> +		}
> +	}
> +
> +	closedir(dir);
> +
> +	igt_assert_f(index == bmg_telemetry_max, "too many telemetry entries %d\n", index);
> +	for (int i = 0; i < ARRAY_SIZE(telemetry_dir); i++)
> +		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d] directory\n", i);
> +
> +}
> +
> +static void find_pmt_file(const char *path, const char *file)
> +{
> +	struct dirent *ent;
> +	bool found;
> +	DIR *dir;
> +
> +	dir = opendir(path);
> +	igt_assert_f(dir, "no intel_pmt directories found\n");
> +
> +	found = false;
> +	while ((ent = readdir(dir)) != NULL)
> +		if (strcmp(file, ent->d_name) == 0)
> +			found = true;
> +	closedir(dir);
> +
> +	igt_assert_f(found, "missing %s from %s\n", file, path);
> +}
> +
> +static void open_pmt_file(const char *path, const char *file, int *fd, int flags)
> +{
> +	char file_path[PATH_MAX * 2 + 1];
> +
> +	sprintf(file_path, "%s/%s", path, file);
> +
> +	*fd = open(file_path, flags);
> +	igt_assert_f(*fd > -1, "failed to open %s\n", file_path);
> +}
> +
> +/*
> + * verify that the expected telemetry file(s) are in place
> + */
> +static void test_pmt_telemetry_files(int dev_fd)
> +{
> +	int i;
> +
> +	for (i = 0; i < bmg_telemetry_max; i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
> +			"intel_pmt", telemetry_dir[i]);
> +		find_pmt_file(work_path, telem);
> +	}
> +}
> +
> +/*
> + * verify that a read will be successful
> + */
> +static void test_pmt_telemetry_read_data(int dev_fd)
> +{
> +	char buf[64] = {};
> +	u_int32_t *val;
> +	u_int32_t guid;
> +	int telem_fd;
> +	int guid_fd;
> +	int ret;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < bmg_telemetry_max; i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
> +			"intel_pmt", telemetry_dir[i]);
> +		open_pmt_file(work_path, telem, &telem_fd, O_RDONLY);
> +		open_pmt_file(work_path, dev_guid, &guid_fd, O_RDONLY);
> +
> +		ret = pread(guid_fd, buf, sizeof(buf), 0);
> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
> +		guid = strtol(buf, NULL, 16);
> +		igt_assert_f(guid > 0, "failed to get guid for device %d\n", i);
> +
> +		len = read(telem_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read telemetry data\n", guid);
> +
> +		val = (u_int32_t *)buf;
> +		igt_assert_f(*val != 0xffffffff, "0x%x: invalid telemetry data value: : 0x%x\n",
> +			     guid, *val);
> +
> +		close(telem_fd);
> +		close(guid_fd);
> +	}
> +}
> +
> +/*
> + * verify that the expected crashlog files are in place
> + */
> +static void test_pmt_crashlog_files(int dev_fd)
> +{
> +	char buf[64] = {};
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt",
> +			crashlog_dir[i]);
> +
> +		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd, O_RDONLY);
> +		open_pmt_file(work_path, consumed, &bmg_info[i].consumed_fd, O_RDWR);
> +		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd, O_RDONLY);
> +		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd, O_RDWR);
> +		open_pmt_file(work_path, error, &bmg_info[i].error_fd, O_RDONLY);
> +		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd, O_RDONLY);
> +		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd, O_RDWR);
> +		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd, O_RDWR);
> +
> +		ret = pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
> +		bmg_info[i].guid = strtol(buf, NULL, 16);
> +		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device %d\n", i);
> +	}
> +}
> +
> +#define ENABLE_MSG "1\n"
> +#define DISABLE_MSG "0\n"
> +
> +static bool send_msg(int fd, const char *msg, const char *file) {
> +	size_t len = strlen(msg);
> +	int ret;
> +
> +	errno = 0;
> +	ret = pwrite(fd, msg, len, 0);
> +	if (ret != len)
> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
> +			 errno);
> +
> +	return ret == len;
> +}
> +
> +static bool verify_msg(int fd, const char *msg, const char *file) {
> +	size_t len = strlen(msg);
> +	char buf[32] = {};
> +	int ret;
> +
> +	errno = 0;
> +	ret = pread(fd, buf, sizeof(buf), 0);
> +	if (ret != len)
> +		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret, errno);
> +
> +	return ret == len && strcmp(buf, msg) == 0;
> +}
> +
> +/*
> + * Set enable enable/disable bit and verify usage
> + */
> +static void test_pmt_crashlog_enable(int dev_fd)
> +{
> +	u_int32_t guid;
> +	int fd;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		fd = bmg_info[i].enable_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* force enable so we are in a known state */
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send enable\n", guid);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify enable\n", guid);
> +
> +		/* disable */
> +		igt_assert_f(send_msg(fd, DISABLE_MSG, enable), "0x%x: send disable\n", guid);
> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, enable), "0x%x: verify disable\n", guid);
> +
> +		/* re-enable so we can do more testing */
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: re-enable\n", guid);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify re-enable\n", guid);
> +	}
> +
> +}
> +
> +/*
> + * The error bit is set when a crashlog fails in HW.  It is read only so only
> + * need to verify that it is "0".
> + */
> +static void test_pmt_crashlog_error(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		guid = bmg_info[i].guid;
> +		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG, error),
> +			     "0x%x: error clear\n", guid);
> +	}
> +}
> +
> +/*
> + * The rearm bit is set at cold boot.  It cannot be reset unless are real crashlog
> + * occurs (i.e. setting trigger will not change its value).  Verify that it is "1".
> + */
> +static void test_pmt_crashlog_rearm(int dev_fd)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		guid = bmg_info[i].guid;
> +		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm),
> +			     "0x%x: rearm set\n", guid);
> +	}
> +}
> +
> +//#define PMT_CRASHLOG_TRIGGER_ENABLE 1
> +#if PMT_CRASHLOG_TRIGGER_ENABLE

Sorry for the late reply. One idea that AI gave me and I liked:
Instead of the #if, make it a separate subtest, e.g. pmt-crashlog-trigger,
that does igt_skip_on_f(!getenv("IGT_PMT_DESTRUCTIVE"), ...)
(like meta_test.c), and add it to tests/intel-ci/xe.blocklist.txt.
Then it always builds, CI never runs it, and you run it by hand with

IGT_PMT_DESTRUCTIVE=1 --run-subtest pmt-crashlog-trigger.

with this change:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +/*
> + * Set the manual trigger bit and make sure the data is not 0xdeadbeef
> + */
> +static void test_pmt_crashlog_trigger(int dev_fd)
> +{
> +	char buf[64] = {};
> +	u_int32_t *val;
> +	int crashlog_fd;
> +	int trigger_fd;
> +	u_int32_t guid;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		crashlog_fd = bmg_info[i].crashlog_fd;
> +		trigger_fd = bmg_info[i].trigger_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: trigger clear\n",
> +			     guid);
> +		/* set the trigger bit (1 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: set trigger\n", guid);
> +
> +		/* sleep to let the HW do its thing */
> +		sleep(1);
> +
> +		/* make sure the bit is set */
> +		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: trigger not set\n",
> +			     guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
> +
> +		val = (u_int32_t *)buf;
> +
> +		igt_assert_f(*val != 0xdeadbeef, "0x%x: invalid trigger value: : 0x%x", guid, *val);
> +	}
> +}
> +
> +/*
> + * After a crashlog has been "consumed" (read), setting this bit can be done.
> + * Verify that it is set correctly.
> + */
> +static void test_pmt_crashlog_consumed(int dev_fd)
> +{
> +	uint32_t guid;
> +	int fd;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		fd = bmg_info[i].consumed_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* check, set, verify */
> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x: consumed clear\n", guid);
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x: set consumed\n", guid);
> +		/* sleep(1) to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x: verify consumed\n", guid);
> +	}
> +}
> +
> +/*
> + * Test the clear crashlog bit. After setting the crashlog data buffer should be
> + * set to 0xdeadbeef.
> + * BMG supports writing "1" to the clear file, but writing "0" (DISABLE_MSG) to trigger
> + * file is the "standard" usage, so test that usage.
> + * This bit cannot be cleared by software (i.e. reboot required).
> + */
> +static void test_pmt_crashlog_clear(int dev_fd)
> +{
> +	char buf[64] = {};
> +	u_int32_t guid;
> +	int crashlog_fd;
> +	int trigger_fd;
> +	int clear_fd;
> +	int *val;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +		clear_fd = bmg_info[i].clear_fd;
> +		crashlog_fd = bmg_info[i].crashlog_fd;
> +		trigger_fd = bmg_info[i].trigger_fd;
> +		guid = bmg_info[i].guid;
> +
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x: verify clear\n", guid);
> +
> +		/* set the clear bit (0 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: send enable\n", guid);
> +
> +		/* make sure the bit is set.  sleep() to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x: clear set\n", guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
> +
> +		val = (int *)buf;
> +		igt_assert_f(*val == 0xdeadbeef, "0x%x: invalid clear data value: : 0x%x", guid, *val);
> +	}
> +}
> +#endif
> +
> +/**
> + * SUBTEST: pmt-bmg-all
> + * Description:
> + *   Because of how the Crashlog Instances behave, these tests are ordered. Do not use them
> + *   individually unless you understand the underlying HW behavior.  Because of this behavior,
> + *   all of the test will be done in order in one step.
> + *   NOTE:
> + *     o Testing MUST be done after a cold reset
> + *     o Once crashlog is triggered the device behavior is undefined and requires a cold reset
> + *
> + *  Test category: functionality test
> + */
> +static void test_pmt_bmg(int fd)
> +{
> +	test_pmt_directories(fd);
> +
> +	test_pmt_telemetry_files(fd);
> +	test_pmt_telemetry_read_data(fd);
> +
> +	test_pmt_crashlog_files(fd);
> +	test_pmt_crashlog_error(fd);
> +	test_pmt_crashlog_enable(fd);
> +	test_pmt_crashlog_rearm(fd);
> +
> +#if PMT_CRASHLOG_TRIGGER_ENABLE
> +	test_pmt_crashlog_trigger(fd);
> +	test_pmt_crashlog_consumed(fd);
> +	test_pmt_crashlog_clear(fd);
> +#endif
> +}
> +
> +int igt_main()
> +{
> +	const struct {
> +		const char *name;
> +		void (*func)(int);
> +	} funcs[] = {
> +		{ "pmt-bmg-all", test_pmt_bmg },
> +		{ }
> +	}, *f;
> +	int dev_fd;
> +
> +	igt_fixture() {
> +		uint16_t dev_id;
> +
> +		dev_fd = drm_open_driver(DRIVER_XE);
> +		dev_id = intel_get_drm_devid(dev_fd);
> +		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT supported on BMG GPU\n");
> +	}
> +
> +	igt_describe("PMT access and API testing");
> +	for (f = funcs; f->name; f++) {
> +		igt_subtest_f("%s", f->name)
> +			f->func(dev_fd);
> +	}
> +
> +	igt_fixture()
> +		drm_close_driver(dev_fd);
> +}
> -- 
> 2.43.0
> 
