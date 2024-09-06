Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374CCCE7AB3
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 18:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D223F10EABB;
	Fri,  6 Sep 2024 18:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKs6z8gI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C7A10EABB
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725645758; x=1757181758;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yZ7c/fMFgg/dPuj9/i0M+V3qS/PzLR6AVZQk3dpTWSE=;
 b=WKs6z8gItYPTFix7Kzn5PD5WMvr0Y/LSIUbdbmZbozzlSyJPvZ0Y+Tn1
 yNLM9ofR6dBKs68Z+K7IK0UrDs8L+27lOxBcq3puT3bc2LpsmFTIaROjg
 yO6oQYgIE/lWxzzSkh9vikLrC75YaOgWZuJOnuktU1amJP3ynvqTtjq2M
 PGECUaA5hFUNgbycHjUSkU6sWp92QXrq+fZcPBJYfnQ4JH9RZE+/LH/ST
 RvmnuJymHck0JFSa1NJ0zHVA3TmmmOVRoRYhbYkIgCqNDpJfYVjbkZnaa
 p/WpknAZk3Hb/6FLP2i3Y42lhGCMpyKtlt3UoJCiFZprLwtdWS8Z8BJ2h Q==;
X-CSE-ConnectionGUID: v189n2e+QwWbOG9QVUQG3Q==
X-CSE-MsgGUID: Ek55S6flRFenk7Zp90krKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28297809"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="28297809"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 11:02:38 -0700
X-CSE-ConnectionGUID: C3f5s9QlQqy9Nrup0kf/sw==
X-CSE-MsgGUID: SrsbZZnzSZ23/U++JhrDuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="70429582"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 11:02:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 11:02:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 11:02:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 11:02:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 11:02:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asb3s8KIyHGMEO2GRR1BsTFDHrtUFGVtGs9IXh1gl6b5tiRn2Z3U7xpPhwRQI66c8+vBELzWq4qUl7iIzMVWpgkhxIsmWjIVrYnbzxerufyTaBgpLyWxflzr4jtMbDsdc99BsqygSpoqjsVmqx8ljS1qq88wGrep5UnHUj5S80nKF93vtt761vktfkFYH0lbWyc1HSqsE8g/TeIeeq4G1b42ci9M1tOFhW1lE4v8+vmydEZukqRpuQL54y8Dc9t1wGXSeIbnEPGs1nYF61n+NL2n680Y6EENUEsn3KxR73fz00c4Ln5ycju9vHi/aQOkCsVCtUqbv4L7tXzNC+F6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DKVL8hw/99OnaOSMNeQXXnD+YqewMYK1TJ/prUMqK0=;
 b=rdXITRkid6D1R/OPZM0OQGRx3x4vjpwRhkfeJ3J3anqbogGy8dbhAK6DntcRuDSGNFmmvo6S3ndIG/Mb5h0VpRYBwuhLrhaiUZf3mTSvj5ux/lkABXj4eooioFx33JA8dBKCFFK1+vhPTliSk7c+Bx+umrVB8m62ALxtb9L495iGi8x1GWkM+3aNpxsaNuefse42XE0/+6yLzmUZDqQY+//DEazwAlc+FwXNaQh/2dLYPxwzC2qnaF2YocUq4mzglIoOBKjStVpncZ/7slnXeJZ97F443IGban6FNg9/KrKRF7LEe7/sx2CkNmCdDDuUdX3eQWsd09jv0nVhAi5YZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.27; Fri, 6 Sep 2024 18:02:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 18:02:20 +0000
Date: Fri, 6 Sep 2024 18:00:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_drm_fdinfo: Implement
 virtual/parallel exec queues
Message-ID: <ZttDNP6Pfn15ITyK@DUT025-TGLU.fm.intel.com>
References: <20240904225746.2857448-1-lucas.demarchi@intel.com>
 <20240904225746.2857448-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240904225746.2857448-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 592abdac-1f7a-41d6-357b-08dcce9e0caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ODV+sNHL6OMd9p1qWfjq/aGPYOpecl8aR+Gx03UjV765MucvIqrz2xbuaT+f?=
 =?us-ascii?Q?9xqSxf/RpVpFYOgLcY2U0O81yfOhBmX5XgmZZ80Ykittu6EqbMah5nRxxw8s?=
 =?us-ascii?Q?+fFm1bhVtGa2I/E+sFIedEIzYOdhBVVfzDUuoN7U1WijHb6smjgqnrCi0UDm?=
 =?us-ascii?Q?cLKPan6hrzxP2jTK0mY2kFh0UrEuidtVBgYUT+meezJrPg9uu71IpULgHJ1r?=
 =?us-ascii?Q?arA1A1RcMIOh+vqIFXC5bKzIkR845t7N/emtA6fj4uScZ3nhffza5dGWnimW?=
 =?us-ascii?Q?18Csus29UstF37w/KT5SrOwZnE76pRAOUv/f7UoLCSvso188SZO25YgLbo4s?=
 =?us-ascii?Q?gkj27jVp6ObUbSPnIfdrFxCwccvhIoUruMDR2HJ5klTYbDYbYh+SHrL4qdS+?=
 =?us-ascii?Q?ku/+s7MhP8MNk/FSBamqYXKkrmU7xxVGx3HngthrSpJID4SU4ktt9WsmmOpY?=
 =?us-ascii?Q?3FGq62ED1a1BnFDvbnviBUxExBbCiz9SNWi4suG8jQI7WXgZjQMxBhv2AYLQ?=
 =?us-ascii?Q?utjKlIjBZ43cmgUGo3hpwTrYlTfBHXjENjsM82zD7XuVA55ClnKKP99Kva/H?=
 =?us-ascii?Q?qchdvcQMxh24/UpqUvCh9ZXLU2qYmf/w35xy9SJ/nat/+qfW7wsCppVwEtmB?=
 =?us-ascii?Q?cfstYpIWB07mk+kXMoIxUmO9pDwRHN47YHx/bCnPa2Xtgn9GMKQjXaqcq/tt?=
 =?us-ascii?Q?gOtwZvWuJDWlGiYRR7znraHA4zrz44sBvWA/PI//q7FlXm9Z3OwNF9Md5cfL?=
 =?us-ascii?Q?UDvlOj50cEumuPtG6UHM2AOwJOg/pKyX0WWt9rqCitJIqoOGH1d1I9YQjoln?=
 =?us-ascii?Q?+wQqGBAjXklqwPGPxVXMrMlWUKS5buxN+Kl5VCQcll+hZ2NfoCVt7hzHdg7q?=
 =?us-ascii?Q?hbFp6Zv4oqo29//EelCfOPkd4lHsRNoi/VbTJRy1JuBeA7sJgksdRsqho1oL?=
 =?us-ascii?Q?GuDSxLpucasEZilOr8DqhDLz6h3c3fETN0Ya9t39/2PUdjB1DeG6/Ldzyvii?=
 =?us-ascii?Q?Ysifce9ZhCsYdLGOOdH4GUSMA2nSq5zQuNIMzD3zonYZt5d5KQqF+uyMWLfO?=
 =?us-ascii?Q?FhIjITvBi1rsK7Yei/1V/gqRHeGRuhLVJIXHjOyaz8qo8Xjx2255JQKoS7sI?=
 =?us-ascii?Q?PIESQn2qKvB9ocSLGgAF+NaOL+WX6HM5umHv7iAh9xdvqZmplaHa8u/NFtl+?=
 =?us-ascii?Q?NgMbxq5KHwCnK/CFTL8tpr06rwPF3UQeGY5QbE/cSHw8qic477IbYXuuJdy9?=
 =?us-ascii?Q?/aF2JJFC2PrshaBpCpjA0YCHj82N4iQQR9kAGZzqeVFsQZw8ILUwBzSL3YeV?=
 =?us-ascii?Q?mVmHOTFeoSaeirBR67nPwjyjC8n3Cin3Tf2VFaHx/pCUhg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JWlHFzQ0efDRa/XEpn6GtxMgmhLj26mJiTHEqMkV9eiAwlTXh/49EkPI6z1V?=
 =?us-ascii?Q?3PAOPH5/v5xImUrYsOO/mmh5NXeiWuiu0vjPpGENWzmzlKaDOhs9EA3NjgDm?=
 =?us-ascii?Q?o0gnDzkoxKeoBxyP70d7eXUFE1P54wm92Ay/YH9Huw7RT1O37ogP7Za7o/kD?=
 =?us-ascii?Q?wSuACCAQSJcOC3F134HIJ2x+FRRRPJa25J2UOEocSJZlhNvNrb+Tu1ZMpQhA?=
 =?us-ascii?Q?OdUFvmBrJeVvW4d8y7VL8TblfrJihHZ9c0zn32fNazqj04blQf1JUHOq4SD8?=
 =?us-ascii?Q?oMN02IwVr5vlSuNOiDjl9FltI6CWAG7GqhCkMeh8ffyB1NYfEokEgRYJ3L4U?=
 =?us-ascii?Q?xPkRpC1I+8x98NRONgXfQ7/xa7KPv6qCuQ0CkZW4s8KUbYlzM5T8CGMJgd6l?=
 =?us-ascii?Q?s4ZpNXsGWcM5ZYBUDYzCHToy4ba4dBxuFTRYOzvtpMmMwYTJpZRpDKBvi4gz?=
 =?us-ascii?Q?A1tWF9TLWM05UfnzcdcFVPO3M5IkPNCGCdRCfbChzhb8Ovf3pZFTWbHcI0Iz?=
 =?us-ascii?Q?uRH46xsWnY5qH8r5WHaQd3FF/q3UbNvMw8YgcVQ4Osm/RXTQEUBZg0OwqzcY?=
 =?us-ascii?Q?cLc9ahVi64JE4zayk4ZwslR0IH8Y1wvucz4N7f+UhDZLp3DGu3bYZMWolr/G?=
 =?us-ascii?Q?yy4tscpFA6zX91vqVF2FRwFWxjQjYSbzTZyAdRUJsXj2r4pkSDf5TIR455/s?=
 =?us-ascii?Q?5Eu0deDzNwqp2HSIsTezqPQ3CKLO4bLdBS5kdi3UjpHesgzA7Hdt3ERSmGaE?=
 =?us-ascii?Q?KN+Kuh3M8rMa5cDe0h4vHd1lCi4UDkeucjA1ZhsSo1fsW4zFPAAGv+A3rMII?=
 =?us-ascii?Q?NPVSmqorZod78rKtDKhBRGkyKp2fw5TXmLkGuejWaf3xXrTu5NLJ1BxKMUyS?=
 =?us-ascii?Q?B3GngNUSoIG+IaUTcv8qw9ybXKPz3dAXbKtr5jYXPxNQ3N/qfg9n83ScYtfb?=
 =?us-ascii?Q?noOR8o9xhLF0EE1CJnwJBSV1WwtULsQL1Geah5iRAyKP+TZrQzkmz0xHsdyC?=
 =?us-ascii?Q?eh6zOryohknI7xbmIfr6um8pQ4EBG6FOA92zPNBPSFA2meE4Z424GO4EtgB/?=
 =?us-ascii?Q?9DrmjcESxwr4LBkbuXef1MPm2NXvNnRHwpRnbZruHYSRib08/6vp9gBgmq9f?=
 =?us-ascii?Q?mYADgp7ptN1xt+3TBMsjbndFIrAhgcDxEYoP/TUganSOUr7F6DEqWMi2aHAL?=
 =?us-ascii?Q?pIcNweSIhl7/AIUTLfFSgbsrS7ZLFuM8RKxRaIZLE0Qjc2HYSUacNL8pXCx8?=
 =?us-ascii?Q?lieqCpQcV5xp9VJtEbnqksR1aYbpw/a+IJ1CFhP6bKyx0aGxjLZLgW77jNZd?=
 =?us-ascii?Q?ZKNzFNkXWKSKAX8/vgRjJMjP+6gLsxEXkjhYmc4Xi6oURNd9brsjB2sp+htX?=
 =?us-ascii?Q?HPvEmDhx7tFtGv9q7K5NCgeziKQ7dfB1wNKiSnMam8x22ItnLh8B47CFOoIT?=
 =?us-ascii?Q?W+6rEWFpXikVo2BP4NqAc+smChU1GjsjcN2Z7Yho7FpXeeVxROglV4HLFDhF?=
 =?us-ascii?Q?oygaXMOvwQXreBA3quyrHSrVa2fWTQldmYGb50fm3O6fvOmo47pb2J0MgHF8?=
 =?us-ascii?Q?gjX6I5smYPu0V8scwNZRONo+hRq6B106Zm4oCBolVo5q//t2xocH0pNY05dS?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 592abdac-1f7a-41d6-357b-08dcce9e0caf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 18:02:19.4477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtBr1aahk5M0nv8emr1BXKOCjgP5t4kHfd6wH5BCfDdPCguGOC6Ze9PFALc6uApj7o/h7WQQ/KZ6jqybLBQiCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
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

On Wed, Sep 04, 2024 at 03:57:46PM -0700, Lucas De Marchi wrote:
> Implement a similar function to utilization_single(), but also taking
> virtual/parallel into account. I chose some different variable names
> to make it more obvious what exactly it is testing and integrated
> with the xe_gt_fill_engines_by_class() function recently added.
> A possible refactor in the future is to make the other tests use
> this function and remove utilization_single().
> 
> Based on previous patch by Umesh.
> 
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

One outstanding question in previous patch, but this one LGTM.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel/xe_drm_fdinfo.c | 124 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 123 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 8acb95040..747b6155c 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -12,6 +12,8 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_spin.h"
> +#include "xe/xe_util.h"
> +
>  /**
>   * TEST: xe drm fdinfo
>   * Description: Read and verify drm client memory consumption and engine utilization using fdinfo
> @@ -67,6 +69,8 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>  #define TEST_BUSY		(1 << 0)
>  #define TEST_TRAILING_IDLE	(1 << 1)
>  #define TEST_ISOLATION		(1 << 2)
> +#define TEST_VIRTUAL		(1 << 3)
> +#define TEST_PARALLEL		(1 << 4)
>  
>  enum expected_load {
>  	EXPECTED_LOAD_IDLE,
> @@ -715,10 +719,102 @@ utilization_all_full_load(int fd)
>  
>  	xe_vm_destroy(fd, vm);
>  }
> +
> +/**
> + * SUBTEST: %s-utilization-single-idle
> + * Description: Check that each engine shows no load
> + *
> + * SUBTEST: %s-utilization-single-full-load
> + * Description: Check that each engine shows full load
> + *
> + * SUBTEST: %s-utilization-single-full-load-isolation
> + * Description: Check that each engine load does not spill over to other drm clients
> + *
> + * arg[1]:
> + *
> + * @virtual:			virtual
> + * @parallel:			parallel
> + */
> +static void
> +utilization_multi(int fd, int gt, int class, unsigned int flags)
> +{
> +	struct pceu_cycles pceu[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> +	struct pceu_cycles pceu_spill[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
> +	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
> +	struct spin_ctx *ctx = NULL;
> +	enum expected_load expected_load;
> +	int fd_spill, num_placements;
> +	uint32_t vm;
> +	bool virtual = flags & TEST_VIRTUAL;
> +	bool parallel = flags & TEST_PARALLEL;
> +	uint16_t width;
> +
> +	igt_assert(virtual ^ parallel);
> +
> +	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> +	if (num_placements < 2)
> +		return;
> +
> +	if (parallel) {
> +		width = num_placements;
> +		num_placements = 1;
> +	} else {
> +		width = 1;
> +	}
> +
> +	if (flags & TEST_ISOLATION)
> +		fd_spill = drm_reopen_driver(fd);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	if (flags & TEST_BUSY) {
> +		ctx = spin_ctx_init(fd, eci, vm, width, num_placements);
> +		spin_sync_start(fd, ctx);
> +	}
> +
> +	read_engine_cycles(fd, pceu[0]);
> +	if (flags & TEST_ISOLATION)
> +		read_engine_cycles(fd_spill, pceu_spill[0]);
> +
> +	usleep(batch_duration_usec);
> +	if (flags & TEST_TRAILING_IDLE)
> +		spin_sync_end(fd, ctx);
> +
> +	read_engine_cycles(fd, pceu[1]);
> +	if (flags & TEST_ISOLATION)
> +		read_engine_cycles(fd_spill, pceu_spill[1]);
> +
> +	expected_load = flags & TEST_BUSY ?
> +	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
> +	check_results(pceu[0], pceu[1], class, width, expected_load);
> +
> +	if (flags & TEST_ISOLATION) {
> +		/*
> +		 * Load from one client shouldn't spill on another,
> +		 * so check for idle
> +		 */
> +		check_results(pceu_spill[0], pceu_spill[1], class, width,
> +			      EXPECTED_LOAD_IDLE);
> +		close(fd_spill);
> +	}
> +
> +	spin_sync_end(fd, ctx);
> +	spin_ctx_destroy(fd, ctx);
> +
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  igt_main
>  {
> +	const struct section {
> +		const char *name;
> +		unsigned int flags;
> +	} sections[] = {
> +		{ .name = "virtual", .flags = TEST_VIRTUAL },
> +		{ .name = "parallel", .flags = TEST_PARALLEL },
> +		{ }
> +	};
>  	struct drm_xe_engine_class_instance *hwe;
> -	int xe;
> +	int xe, gt, class;
>  
>  	igt_fixture {
>  		struct drm_client_fdinfo info = { };
> @@ -775,6 +871,32 @@ igt_main
>  	igt_subtest("utilization-all-full-load")
>  		utilization_all_full_load(xe);
>  
> +
> +	for (const struct section *s = sections; s->name; s++) {
> +		igt_subtest_f("%s-utilization-single-idle", s->name)
> +			xe_for_each_gt(xe, gt)
> +				xe_for_each_engine_class(class)
> +					utilization_multi(xe, gt, class, s->flags);
> +
> +		igt_subtest_f("%s-utilization-single-full-load", s->name)
> +			xe_for_each_gt(xe, gt)
> +				xe_for_each_engine_class(class)
> +					utilization_multi(xe, gt, class,
> +							  s->flags |
> +							  TEST_BUSY |
> +							  TEST_TRAILING_IDLE);
> +
> +		igt_subtest_f("%s-utilization-single-full-load-isolation",
> +			      s->name)
> +			xe_for_each_gt(xe, gt)
> +				xe_for_each_engine_class(class)
> +					utilization_multi(xe, gt, class,
> +							  s->flags |
> +							  TEST_BUSY |
> +							  TEST_TRAILING_IDLE |
> +							  TEST_ISOLATION);
> +	}
> +
>  	igt_fixture {
>  		drm_close_driver(xe);
>  	}
> -- 
> 2.43.0
> 
