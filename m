Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ADCC02194
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 16:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B389410E113;
	Thu,  6 Feb 2025 16:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixcvplFd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2205B10E113
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 16:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738859153; x=1770395153;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B1WaUL0aO/XCSj/UBIdo4+Pfq0gNNgBrZ3/YpRdMGyw=;
 b=ixcvplFddvIHf9Bwt0BQh1M39m//veDf2BjKgnzNRZdraKgGRGE+rYfH
 w6R2iNJEX6XpPdQ3/uLwUFTPlPpCrbZHAcBUiynfmyIS13NQaa0EXQc8v
 TcKZLjNRKlQvPDUlckchZkoO7rdEZ9gjSN7F1o5pzZNdVPuYavdD0sFZw
 /lzq5J1WUFhsOsOPV+OZiibhGvjjurMs+gK/5qN2ht1OD8r0I2QdCE6wj
 /2UGo5VPXi+bIGMdjVDQTQ+O9ZP98531IpDol89O6Tca+diwdY51bQKyr
 cp3LAfcrLp3jzCMtXi3yvyvw67OQ38nz8JBN4Xmx66uHXNXjIztn6q3bE g==;
X-CSE-ConnectionGUID: 7D0QoHgNTLqsodXk4laV7Q==
X-CSE-MsgGUID: 5pk9q6D/QFW9b+V2xMEpQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49718434"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="49718434"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 08:25:24 -0800
X-CSE-ConnectionGUID: 1rjKt+3/SjCEuWRkgpyA7w==
X-CSE-MsgGUID: nl4WTjDWTPClXr26Rg5WWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111849681"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 08:25:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 08:25:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 08:25:23 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 08:25:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4PcmBl1mK0xue9zl6NIYA517GtrXJJPjTc3HOZuZvO/wMM63EtgSkugULTXWIPpsknISykpYDTpYM/Y5ymgPnpFr3saQWmsc/vZypP5dkBvnIaE3Xxxu4yMnpm+nbVOBNbeDaLcQsY6cUnrRMRJrgQm4kpvIr/apZSLal32BD/e/sRrfCfTav9v4vVSS82Te3/a1kLIekmJX+27+XDROQOA6tJ90soh8Y0aQnLYsoBGct35gBv5lHZR4TWTs4v2sbOdyV8OPCEbBYO/diS84LVV45zsYbDZV1FPuBl2RRPEFjTFFW9hCAV8hz0J2zXsaHBABxubyMTVBTIox3k+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhpIhAzOu7YtpDEv/sZPg1BsfWo2+jgiPKxdCccnzV0=;
 b=dEF2n7jJm4RSUr5v6nYMqTps8uRLs+DQjHfrOoMc+yTc2GLMoYxV4s/FbKTGodqci1XG6AWWie/5GS6H4rOweE3QnKxMQuDwLmBhx80LNsgH3FKhZqUjeTAN8wHonEdyBRVCmWtA1Dnd754yVqqaiQk9cw9rkMlhPpZXweD+fzst/WZlGAKRjSgtT/c4hUo13hA1ZGieGRCsOhURLWXpWw8V3xscJ6ZMdTp9ZP4BC2atfrw2YQkR1ozAkoTJrK0PqiV7gK5NrR5bxTo8CTM3ocC3YLdmB9qzvnWKaqPAZSHoy9IxGUaF+gKeLMDkwPlYu/aH/+EAC1fB10stjcyzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by DM3PR11MB8682.namprd11.prod.outlook.com (2603:10b6:8:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 16:24:38 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 16:24:37 +0000
Date: Thu, 6 Feb 2025 11:24:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <sai.gowtham.ch@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] tools/intel_error_decode: Enable support for xe
 driver in the tool
Message-ID: <Z6TiQoEs2RM-WrYP@intel.com>
References: <20250131202940.1124460-1-sai.gowtham.ch@intel.com>
 <20250131202940.1124460-3-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250131202940.1124460-3-sai.gowtham.ch@intel.com>
X-ClientProxiedBy: MW4PR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:303:6a::9) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|DM3PR11MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: df2f8152-34af-4f2d-b31c-08dd46cabfff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vh/R+VJZszUIWBv32JpgQ3gFfVfEK9cb3XQFZeaYQaLhhnRI6xR3QUFpLUnK?=
 =?us-ascii?Q?RqFFvwgRWmfFSqfFjT4vf9UoljwU6OCnPz/GE3vf7X3WBUga2ah1leG09I4R?=
 =?us-ascii?Q?ZH3Ll2JK9fIRp5n2EEUp633IpUH+gs9oRxeIOYfhOk1Q/aVuaUEJGsdWgN4o?=
 =?us-ascii?Q?THqEqg+9qRFPelklmS9GptIiIifgj5hL3lcddr3LwwWpYdk4qhPX9pkkWFjD?=
 =?us-ascii?Q?d3g4Kc5yEyuhmMnTocbap4z7jmUdKrtVPGatFQUFw8HoO/vuP4ULwVlhzAP9?=
 =?us-ascii?Q?9RcdxcOTelm6L0qv6nVZ/Hu+h3o+xLZl6X/SAfAULWuTZ9Qy6sA5mEJJXrMN?=
 =?us-ascii?Q?mEi7/Pc3thnLs6hLqxfBc7RtJWXezXvD1xT6pcAY1Oe8ZLlROATptIkykaaM?=
 =?us-ascii?Q?/5oPg+ka2PxNlI3jHtIKEJMf6I+gfugy7Hv8VjIV7P+/bDO9mzzfMYLzgckF?=
 =?us-ascii?Q?/L+46Ma50pDdxeFeAheIKZP7seBrqcHMaVI36KLpkEX4hkkxcbJYIh+Cldxg?=
 =?us-ascii?Q?AxRTX5j8M3vcRowiUoDDrYhphEw2SAqPfD7cEDcUHdTolJjq8y558IDsi/Al?=
 =?us-ascii?Q?clgQTApKT7faTZVJDaaEkLzZZVB7HrrNit30LqJCfYby1g7iVNuqNd7DXhkH?=
 =?us-ascii?Q?1W6YKFgQjK6BiredtixL8L6YFENLTxjHZH+/n4RGKBU/eHaFfgyDoaNjK1Qm?=
 =?us-ascii?Q?FCKXBpHNDV7ZJIuhNRmDYFwOhywDn/nyTv3ApjFwOZgg7X7iiw7rckPsXDNn?=
 =?us-ascii?Q?5rBBXR2DuUKGN8VRq0yyUKDHiWVvPdfrWtJkySjEFE6LTYbOZWzWQEDOVuON?=
 =?us-ascii?Q?imMiXhm3cgh0pmRZf01T4R31A5E30TI/kTTHFTbbH6VniAFEz95fr8uo1VyA?=
 =?us-ascii?Q?/TyQ+EbCfktOsL/KECy3fTXuKPqS0hihJdjmzyBxoY+0XOFYCF9xsfscirV8?=
 =?us-ascii?Q?ubUCfZFF9AcL7vct0K+GgwKUeSmBTkhTrMudxsPx5LG56OFT8ostzHbNzVEj?=
 =?us-ascii?Q?xtn7/NT7lwuicrYIv0n6aFBL4jQeaUn7+V07OekJJbpFhXFjKoKIas0xqoaw?=
 =?us-ascii?Q?E9IpojLVEi0Qzl2mGxHi4/eumLSWiGWP3WrHPsStbjvDEkFUdjKU5yOr7alb?=
 =?us-ascii?Q?bcv9zjFwST2zT0FafuxhPfdc8/309k3oj4h1eOZz5NOgOE5bkuKiBWCSWcoD?=
 =?us-ascii?Q?FtxdhGFX4WIal9m8WFfYIQIc9QqCovnfRBGJA7BzkQPV932QkEMkolbkXMNC?=
 =?us-ascii?Q?0V59O2iVjvQDSzubj0zmykedfhb/8XYDFmFnvgOfcXnmtLVJGYgpvxu3ucTT?=
 =?us-ascii?Q?k6UJAIxp4/fCM0Dw1uUPE2Z+yR4mevaXJ4mvAcLhVDYhpzZniiKs6Gm3f0H0?=
 =?us-ascii?Q?YBJNaDadeUvluQ2IlKJpy6g1g+u5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DYZHQBteFPYcdGlD2lrW+4EjlTozfYW9UBzA9L+SvtXF1jb+/W604WG5a02D?=
 =?us-ascii?Q?BeYJOGT5bsGhA4I8A1Y/oo3V9u2a8WATCYPZ+kmqWrPrzvAAIHVgW+nTW2Ld?=
 =?us-ascii?Q?Ywb9qlRHLlHrB3Nyv25RTY6yc77MJHoyOgFRFXSCaJInwOYp/KFoSGi4FgeU?=
 =?us-ascii?Q?I12GwkwuY2FXgagjRWo743ywH3/1Y5k0B/17TM6xedSKs5TA3rJ6fzEIZ0Xo?=
 =?us-ascii?Q?TOQ6JUFZhfTQkK8m0lTcpR51N++f+WGKIPeNIDy2EpRl7i2fNeUK1eZK1ndn?=
 =?us-ascii?Q?vWmifBI1O8x+WNlBEvbej41BYE1UE2XAabvFBsnREtbpTlNEcIY0typBGpO4?=
 =?us-ascii?Q?R2gI978glowK1BW70Kq+2gbVnOQaOZLOfYYdkd9p/ZWwFcX6Jivyi9Lg72ES?=
 =?us-ascii?Q?lOdsXKy8oNS6THZhZppH2m9id2EXksXHYRVYHO/rC4G+JXTprDdiqZnwV+xl?=
 =?us-ascii?Q?Yxv1cfx/j2qiJ5GzQ8edN4SR9eAtxtIoz0XKfZ0F/nq8bCObV8Kxyk2djdk/?=
 =?us-ascii?Q?Ga/BKaRZK6ZJi0nrBM/YeM8HjdaVGQ3WWqoriIG1SRSncd0ZSDzdjvxcibEN?=
 =?us-ascii?Q?/6DATIOVX743bqc7XwK72VEOJqZxak+XRTJGYuYj8OcQMCfhclwH0VmHNM3i?=
 =?us-ascii?Q?wCyCnei6ZRLNU1GQL9XVvIeM8tqEru1wG28GB8Mfl2sVS+T9rIlIeO3DoOtb?=
 =?us-ascii?Q?FCAYgkbS4piGki6vERblGJyFec6PgPyH7TIZBtiuT7FwcrNudhD21YWCQuL6?=
 =?us-ascii?Q?aH1HHfWuWXREOqcp5H+xtBaC5RNxd8ew1JgxKBSl6HaeD0B7k/ruJrLSlNTP?=
 =?us-ascii?Q?01y1Q+O42BAj5jqdp+d2ygJ6RWXq/yhH76an/TQFxtrBM6isD+ip92HplkSm?=
 =?us-ascii?Q?WEZC9FdTPGdHUEX/9lkRM4jN2am9qbXfSlvDPxb9hvvFprcAB7eK7GpR5960?=
 =?us-ascii?Q?4XwL+YChIPiGhri5uhR/mVt1s0dOkbal5GzCOS09X3ZTEVv509JfVf0fsgLs?=
 =?us-ascii?Q?OElCocSGQK/6/nqv5a2Ibfa3IFUKUHq4GPIp+BXynmMml/33aihXqjZMqU45?=
 =?us-ascii?Q?RKOe6zqpqJBGOGt7CwasnI92Rf6lvRVcOM4CF4l5qlywubYntD8U+yXUiiE4?=
 =?us-ascii?Q?TQM3PAJbAidSPP6RahpxDfljrncgXVZ8yoEydy3TZi6BahuFtKmWeUqrjlxW?=
 =?us-ascii?Q?95HFfMphIniJZNNCh32EiVRpzP8FWZpwVT3gbDUGrfTz5fVUhXaa4t5UK/fH?=
 =?us-ascii?Q?oLWWe6qhkuH3yIP3IuqrJDWpY0fL0g6VrwgRzVWnkpZwCvzeCwP4BMuFQZCm?=
 =?us-ascii?Q?TWATreNDajhK+15HLdS3inIS7ajevx/CMS2DeJcK1I6Wx44YzhiumWssf9CG?=
 =?us-ascii?Q?SvN6ZjvXHCyku4VnWcNSUh1lKNp5ZH5duTVuP4Owf25UhHOzM06qI0F5OYau?=
 =?us-ascii?Q?xVQuGU4ypHoqB2a+zRF+lzztCRcrNuMdj21BK/XNtjst0pNuK+C264bBWJ/e?=
 =?us-ascii?Q?RONth2O+Brw9G3MW6HG1ruMP9t3jgcFmo977nyJWwGFeCPL0sRKxchblJ10K?=
 =?us-ascii?Q?6JHvGgB18FzMmDTwm8Iv80bEfjke+7EmgcxwMdHOd+NhVxtdx2w5jciDGjg9?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df2f8152-34af-4f2d-b31c-08dd46cabfff
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:24:37.7535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hqu7YOuO1cGunpva6RyrwYoa1wugrtIF9eF4zXsi4guCINJ4KC0U2sTzot+w5NQ5qcjyo9lrEbDbljeersmu9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8682
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

On Fri, Jan 31, 2025 at 08:29:40PM +0000, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Enables error decode support for xe dumps. which uses intel_error_decode_xe
> lib.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tools/intel_error_decode.c | 156 +++++++++++++++++++++++++------------
>  1 file changed, 107 insertions(+), 49 deletions(-)
> 
> diff --git a/tools/intel_error_decode.c b/tools/intel_error_decode.c
> index 451608826..a722621e2 100644
> --- a/tools/intel_error_decode.c
> +++ b/tools/intel_error_decode.c
> @@ -57,7 +57,11 @@
>  #include "instdone.h"
>  #include "intel_reg.h"
>  #include "drmtest.h"
> +#include "drm-uapi/xe_drm.h"
>  #include "i915/intel_decode.h"

From this one we can see that the right place for the lib is under:
igt/lib/xe/

> +#include "xe/intel_error_decode_xe_lib.h"

also, what about
devcoredump_decode.h ?

> +
> +#define XE_KMD_ERROR_DUMP_IDENTIFIER "**** Xe Device Coredump ****"

what about having this in the lib?

>  
>  static uint32_t
>  print_head(unsigned int reg)
> @@ -793,14 +797,86 @@ static void setup_pager(void)
>  	}
>  }
>  
> +static FILE *
> +try_open_file(const char *format, ...)
> +{
> +	int ret;
> +	char *filename;
> +	FILE *file;
> +	va_list args;
> +
> +	va_start(args, format);
> +	ret = vasprintf(&filename, format, args);
> +	va_end(args);
> +
> +	igt_assert(ret > 0);
> +	file = fopen(filename, "r");
> +	free(filename);
> +
> +	return file;
> +}
> +
> +static FILE *
> +open_i915_core_dump(const char *path)
> +{
> +	FILE *file = NULL;
> +	struct stat st;
> +
> +	if (stat(path, &st))
> +		return NULL;
> +
> +	if (S_ISDIR(st.st_mode)) {
> +		file = try_open_file("%s/i915_error_state", path);
> +		if (!file) {
> +			int minor;
> +			for (minor = 0; minor < 64; minor++) {
> +				file = try_open_file("%s/%d/i915_error_state", path, minor);
> +				if (file)
> +					break;
> +			}
> +		}
> +	} else {
> +		file = fopen(path, "r");
> +	}
> +
> +	return file;
> +}
> +
> +static FILE *
> +open_xe_core_dump(const char *path)
> +{
> +	FILE *file = NULL;
> +
> +	if (path) {
> +		struct stat st;
> +
> +		if (stat(path, &st))
> +			return NULL;
> +
> +		if (S_ISDIR(st.st_mode)) {
> +			file = try_open_file("%s/data", path);
> +		} else {
> +			file = fopen(path, "r");
> +		}
> +	} else {
> +		for (int minor = 0; minor < 64; minor++) {
> +			file = try_open_file("/sys/class/drm/card%i/device/devcoredump/data", minor);
> +			if (file)
> +				break;
> +		}
> +	}
> +
> +	return file;
> +}
> +
>  int
>  main(int argc, char *argv[])
>  {
>  	FILE *file;
>  	const char *path;
>  	char *filename = NULL;
> -	struct stat st;
> -	int error;
> +	char *line = NULL;
> +	size_t line_size;
>  
>  	if (argc > 2) {
>  		fprintf(stderr,
> @@ -823,69 +899,51 @@ main(int argc, char *argv[])
>  
>  	if (argc == 1) {
>  		if (isatty(0)) {
> -			path = "/sys/class/drm/card0/error";
> -			error = stat(path, &st);
> -			if (error != 0) {
> -				path = "/debug/dri";
> -				error = stat(path, &st);
> +			file = open_i915_core_dump("/sys/class/drm/card0/error");
> +			if (!file) {
> +				file  = open_i915_core_dump("/debug/dri");
>  			}
> -			if (error != 0) {
> -				path = "/sys/kernel/debug/dri";
> -				error = stat(path, &st);
> +			if (!file) {
> +				file = open_i915_core_dump("/sys/kernel/debug/dri");

This i915 vs xe detection looks complex.
We should keep these i915 possibilities inside the i915 function
and here have a simple is i915 call i915 function, elif xe call xe function else error below...

>  			}
> -			if (error != 0) {
> +			if (!file) {
> +				file = open_xe_core_dump(NULL);
> +			}
> +			if (file == NULL) {
>  				errx(1,
> -				     "Couldn't find i915 debugfs directory.\n\n"
> +				     "Couldn't find i915 or xe debugfs directory.\n\n"
>  				     "Is debugfs mounted? You might try mounting it with a command such as:\n\n"
>  				     "\tsudo mount -t debugfs debugfs /sys/kernel/debug\n");
>  			}
>  		} else {
> -			read_data_file(stdin);
> -			exit(0);
> +			file = stdin;
>  		}
>  	} else {
>  		path = argv[1];
> -		error = stat(path, &st);
> -		if (error != 0) {
> -			fprintf(stderr, "Error opening %s: %s\n",
> -					path, strerror(errno));
> -			exit(1);
> -		}
> -	}
> +		if (strcmp(path, "-") == 0) {
> +				file = stdin;
> +		} else {
> +			FILE *i915, *xe;
>  
> -	if (S_ISDIR(st.st_mode)) {
> -		int ret;
> +			i915 = open_i915_core_dump(path);
> +			xe = open_xe_core_dump(path);
>  
> -		ret = asprintf(&filename, "%s/i915_error_state", path);
> -		assert(ret > 0);
> -		file = fopen(filename, "r");
> -		if (!file) {
> -			int minor;
> -			for (minor = 0; minor < 64; minor++) {
> -				free(filename);
> -				ret = asprintf(&filename, "%s/%d/i915_error_state", path, minor);
> -				assert(ret > 0);
> -
> -				file = fopen(filename, "r");
> -				if (file)
> -					break;
> +			if (i915 == NULL && xe == NULL) {
> +				fprintf(stderr, "Error opening %s: %s\n", path, strerror(errno));
> +				exit(1);
>  			}
> -		}
> -		if (!file) {
> -			fprintf(stderr, "Failed to find i915_error_state beneath %s\n",
> -					path);
> -			exit (1);
> -		}
> -	} else {
> -		file = fopen(path, "r");
> -		if (!file) {
> -			fprintf(stderr, "Failed to open %s: %s\n",
> -					path, strerror(errno));
> -			exit (1);
> +
> +			file = i915 ? i915 : xe;
>  		}
>  	}
>  
> -	read_data_file(file);
> +	getline(&line, &line_size, file);
> +	rewind(file);
> +	if (strncmp(line, XE_KMD_ERROR_DUMP_IDENTIFIER, strlen(XE_KMD_ERROR_DUMP_IDENTIFIER)) == 0)
> +		read_xe_data_file(file);

xe_read_data_file() is a better name for this function

> +	else
> +		read_data_file(file);

and probably good to rename this to

i915_read_data_file()

in other words, add i915_ prefix to all current functions exported in lib/i915/intel_decode.h
and even rename the file to i915_error_decode.h and in a separate patch...

> +	free(line);
>  	fclose(file);
>  
>  	if (filename != path)
> -- 
> 2.34.1
> 
