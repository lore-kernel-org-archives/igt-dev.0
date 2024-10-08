Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A016BCEFC32
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 17:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFA210E1BA;
	Tue,  8 Oct 2024 17:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYXoCH4+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC45A10E1BA
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728407042; x=1759943042;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pEahAE9uZmNmnQGRlmjBPkxahUcH5iv8IxIeka2XmUg=;
 b=eYXoCH4+mg1wuT+tI0WWx91Y+eAZXjx0GYGmAd1WcHJR5QN7BEDIz2lE
 84ejq81J9C62f9WJ5ZnEck4Lv0pSZjwFugI//R6O6DVt67zKPahw7RGlE
 98ruL7m+0S611J2sTVnmNrpCthq2nUKE7JPF0mHqY452CmitAxW6TBlgv
 H81rKpMaYMBHDnz5X9a1n0lGxdYhX4ih42CRg9WtkKBdP/zt+bua7uW+E
 lOQbSRyujsySjO5JJB/HMxxtawXCNuBK1cFRV63xN4Dg4x/DghRP+MNI1
 dHt3SaVuQlIqzgssILYiqIH19pYzcCAL29xTV/rDUF0T8ivCO3dPBuUCU A==;
X-CSE-ConnectionGUID: IdUuq6f5T82WZHMg4S6mjg==
X-CSE-MsgGUID: /RgAFM43R5GG2pd1SJiFdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27575141"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27575141"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 10:04:02 -0700
X-CSE-ConnectionGUID: mQg0U9LtRzO9xnFzVeojKA==
X-CSE-MsgGUID: 9spcXWmrT8eGtPzrYHRvLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80339471"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 10:04:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 10:04:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 10:04:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 10:04:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoyfLDZXiKQJw3FPM6YFQp88iDyYmE2m8oQ1bKQJtYpqTJEJRs2D9/t4r3UpCKP+VAgkgSfHMIWXR4X/pR1Kxj6Sg7ewyE0pOZ9Q/1SK+QKHo14S0hAT683CveSBr0UA5jXj7x32dlpYUR3I1tW1awyj1gm4qYIr+jdx6s74V7fc1A7wyZyVz2IDLvZIcq2IhYzD+49BKJU15sXJKAn76JuH08zSwmbScVxEZ08diV0LXa7MC720gMBFwa86HTsDjdz+WX7lEIyD0nwXKWHAi1NcdnQ2re4laV79VraS7x2fe+YEzQxEumf7DN0S4PwQaP1e5OrwvH4fCJZp1abotg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ktp/9aLFj45sddFy+UBTO8aExSbDbdFIlLYrK36S4z4=;
 b=gULAIQyUZeHNETqgGZ4Pf4jWgmPYknFiLpcS36PWKhs2bHIirYFEZvFd4KcAn9yfAiY4TLXYVW2DsSLq+Ngp91qvYS1WFtvkr9BwzWXMOmhFGFT5J3TJ2ZmzoTm4J4jrKY3Jo8cJqYHQm+usaRjVoU1RqKMwfR7ii4PIQDQMMxbja2GxBFX0PZWcjaOgE2LxhozQCpBN1iblrxk91wZkU9SPFa3dlRueXDQBfc1v94e4YSvTzS5oJH5SMVmnb4opPen5YkoYFdZ9dnmBDc08jTb5nEgAkHsVpHTPAq/X+9GRhroTPnpvUZ4pz7Y492JUqAu2vX6VX7RQ7uO4vD4Sdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8787.namprd11.prod.outlook.com (2603:10b6:208:598::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 17:03:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Tue, 8 Oct 2024
 17:03:57 +0000
Date: Tue, 8 Oct 2024 17:03:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] tests/intel/xe_dma_buf_sync: Update dma-buf sync to
 use import read / write deps
Message-ID: <ZwVl8haUsS3kG9q8@DUT025-TGLU.fm.intel.com>
References: <20240912223110.1054974-1-matthew.brost@intel.com>
 <20240912223110.1054974-2-matthew.brost@intel.com>
 <4bc85abc-163b-40fb-bed0-f93875c4ba6a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4bc85abc-163b-40fb-bed0-f93875c4ba6a@intel.com>
X-ClientProxiedBy: BY1P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f5bc35-d9bf-40e9-5a91-08dce7bb3249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tVfIP5LAyY3B5yGgXF6HuKVsVfLSHAwVS7qf1DeShv26AKPLynCDD37p25wg?=
 =?us-ascii?Q?AWzG68DWGbg93CLY7PgAabsKbiFJic808S2lvysQH7qM9+hLzcKdxXDluMms?=
 =?us-ascii?Q?EG16x9QYNIfuatSCYdL1XcONTrnS6rNYZbAljizb5x7h542NX2flibnH9Xc8?=
 =?us-ascii?Q?SJWJMzaNVYoTqluQvG3X+z4yUoM/4ruL1XlIZ3OclgPIhhwYfehdaauAQPXu?=
 =?us-ascii?Q?ECJRaDAP7ms0P5DJDr9K8hhA5KVUOXhu7+UmnuM+RbJlT/U/joCtj0NAznR9?=
 =?us-ascii?Q?tz3ESTCuTqYaDDbsF0MiI4q/hKHT6NNhme8qLoJb04rR1oNqjcLEPX1DWxkb?=
 =?us-ascii?Q?m/CEpSOjkdYtR56iMxts7HUPcDjmXaXJO022PD1BWevh9Apl5OTZBwbzdDKa?=
 =?us-ascii?Q?m8fJNWfqhoB7RZk2r/MoO/FZlpKUhfgf57aEN/qTrAL7111RtRPbMzFkWpC8?=
 =?us-ascii?Q?xoTQqjkBNZst0QzIleTxS2OoScpQsCnAJq6H1bVVbcKdz7Z2d3QvK275RJtw?=
 =?us-ascii?Q?T09FyeCxqfYvJHCNW0s1T9YMdemArJDY27kt94OAloRoDBeLB9olDUn2vznz?=
 =?us-ascii?Q?DTrux2CSW1DvdqQA8pmsmNeymp6to6JUujN+Ixce2H509zJXxn/XygHfTBRq?=
 =?us-ascii?Q?C7fFFtH5CL+GhFRxmOk6tL/FL+s2uWn2riLxs7FJYYEuLHRFQt31o/4imH4p?=
 =?us-ascii?Q?nfm6yxwFEY+eAyNIoI4kWOWzzUQB1QJOB65dtqAVPCuo3qQ86YGNMBamzx6D?=
 =?us-ascii?Q?jZsiclxRnsjTKEgP40VAgbXDhX0u5TKOJE5ejrMv+ob5nxd/97V5k6MDChyK?=
 =?us-ascii?Q?ZBQekdxLdH2cMsotclE8yeXNIl+/ouG+xkzRsgk6Lu1dtf7n3YJo0RbnDS/8?=
 =?us-ascii?Q?3AZq65opAaBUG5SXggLpZ50G8DT543luupQ03CHk38qketi00+ltxd5Hf29n?=
 =?us-ascii?Q?ahbRlh9MrdYzk3lkaRkzv6J3RApTgI2D3Eq3M9qgb+nLNgQX6O2C4FbTS7iL?=
 =?us-ascii?Q?yV9sp2N6BbLg5ikpwl2/03Wfu4LXYchYOW/pSSy/aJBV3vQq3hvSjQloZ+Gu?=
 =?us-ascii?Q?NPUoLMsee6Ucr9U0Jie14I/8La+ehJlWYIAszErthhchvz1dliVsRYM5+7Bf?=
 =?us-ascii?Q?YxtfvXtDnd/8AnnGREzs2fuem3B41bTs6/nh1DU57wv28YSpiFsH7K3/W7mW?=
 =?us-ascii?Q?tTOEhb5PUg9ulXS2j/egMcVlFYlcy8ZURv6cV2HzkIq+Vg9ubA3+HQ+xeeQW?=
 =?us-ascii?Q?hKtOzxbfUkKWZedjFeC0+H7h3+05xcb6Tij/LnxiHQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CuPYqpW3+ZY725dCRHnFhwWXkxSskE+qyLt2GLkOoZrPob7MymZzVfBCQdV+?=
 =?us-ascii?Q?yc2LOMPcab+C52gdYtWDP9GOFDjNygZpQAoO4XNJB9GxicJtcVfML8xI1+kp?=
 =?us-ascii?Q?7wylAwe3YTSQe7bUgMHbeCc4snTcHNI5Z80DxWHwSUpsF8hCU0YVPpLmxATd?=
 =?us-ascii?Q?fAQUVq4ggLcI9i+MMuwoCYAOVAbQROivQ0OAG2jyLr66XoulVG/5QJ3X05Du?=
 =?us-ascii?Q?/UxJ3Sn/gA5LQA9aVmX+xaxY3GNptf/f8CPf3xjOJyHYAlbHVhnEDdbo6XZn?=
 =?us-ascii?Q?zTVxTAgnqT8cfAsEtvOYDwq3pGszKCy80lkJlgVsZH8hoaDkBLHvddW2Shgs?=
 =?us-ascii?Q?ijmoqtaJykd7RdGfpEb0sAsexs97xXAEQTy52tWhy069g9rhnDZp5R1pNzkR?=
 =?us-ascii?Q?N07s8DFFYnqqu+MatssMAB6DUYKVICj4MtOL0sKCmuQmHkthrQrpHpeE8GAy?=
 =?us-ascii?Q?EXkubc9bJDIi69OFckj6hJb2jZaNus6VTuq6oRY+2Cu9ncDmdExc7OkLajRw?=
 =?us-ascii?Q?RMBpAvHiEj4CVJMpuCphuyny39lDgppm5Mv0KfBT+r5N+42dyT6o8TbODjJq?=
 =?us-ascii?Q?yXMMGLcF/QIPhihEZWAKyH9qhqtaW5dOZTvPAq+igXXbmZr5oDvdcGmV9tTI?=
 =?us-ascii?Q?/Nx+suOUPIEtImcCui6Oqf/a20If6uBeeioLeK32LLQ1RPDIkfHlxAERz995?=
 =?us-ascii?Q?nBlrawmhwuR9L6Q9YHm5W7gO0KYGuj75IPKM6cpz9zKQTkIIcI/t6VDAdags?=
 =?us-ascii?Q?3voc1/yk5ztoXWsEKVKPXh0VY7GGPV6zDEqPv6SFFtzmg1JhXbDV/bU4FQLG?=
 =?us-ascii?Q?xn7SSYUFa4hZ7MON1qJqp7UFm20vm0aQQIl58m/II5yoe+NR/nklPj25Tiaj?=
 =?us-ascii?Q?jICEeEsVtltyvvvm3aT4T9qVL+x6TFfa8s4bdFWnZYtqoOajqdC5CiSBlR8z?=
 =?us-ascii?Q?lH9iP96sAv+mzpldA0vfknZhbEpyW7mII7HzLShrbuTBHzhL0Qo3AsFmFhFh?=
 =?us-ascii?Q?lQ9xGUMl5lv/owsMqHnVEzV0kATMphGVDrLkf1LO/g7gO4T7eizgT6ETyt2J?=
 =?us-ascii?Q?nNBIy69lSjLIc4I9Ky3pKz88YyiG++GThVIMwWwMcg4byBbh+9eyVIIU9R5m?=
 =?us-ascii?Q?hZ46xsq2WtMrFEMqoGM2ggk28l2RkSYCEKJ0KdKnDfADfoyL6HmKcIpXkn5+?=
 =?us-ascii?Q?mY1mM2O/MzYXfaPyliusEVlzZTv38x6v8zZo/mdANlabHMIZWSNod/XdIGGD?=
 =?us-ascii?Q?Ifm2g7fyRlYnjYqAnTKb6tfUdjXLtbZFZ9S8+CCWt9tIYDxmWyfnwSQKawrJ?=
 =?us-ascii?Q?/zB+PXbq/FRKQbz+eXBm9w9/hKFQl8k0rpTS3Tsc41+TSrd1ZORP66jBxqQR?=
 =?us-ascii?Q?pxVMLmQ21gQHNTbUHvMpvcckjIU7bWxfrBZdRImdL2FLZJon7fXJvN/XYu9f?=
 =?us-ascii?Q?+JzHm/Ed1Tg0PA9Z7g8+f6jDOBSomECpd3JQ2+uGEEnuoxXUNCuT1qRKAP7A?=
 =?us-ascii?Q?7VR3jFahFI06bvimjdsG+UVP3ZejTCB1ziL/vKBeZpbbRQddI8UmsDLAPRtk?=
 =?us-ascii?Q?qvZf9pmxYcg141qOk7vrXCTnCvDp8VysOJsvhbUsB0TrgxauzoD07q0Z+5rn?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f5bc35-d9bf-40e9-5a91-08dce7bb3249
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 17:03:56.9897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QWDtYD/5zxrTtXxWs6hUxgBCLBG5Itzla5D9W5c1c1olDCq9N4P0w8l6VK2MclJ3ju0GX9FLuCVAf4h/m4JBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8787
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

On Tue, Oct 08, 2024 at 12:41:35PM +0100, Matthew Auld wrote:
> On 12/09/2024 23:31, Matthew Brost wrote:
> > The KMD was incorrectly setting write dependencies on all external BOs
> > when the read / write dependencies should be set via import IOCTLs in
> > user space. Update xe_dma_buf_sync to reflect this behavior.
> > 
> > While we are here, test all read / write dependency combinations and
> > update test documentation.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> I assume the job timeout reported by CI is expected and is just because we
> are not testing with the fix from the KMD side?
> 

Correct. Tested this locally with required KMD changes and it passes.

Matt

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > ---
> >   tests/intel/xe_dma_buf_sync.c | 137 +++++++++++++++++++---------------
> >   1 file changed, 76 insertions(+), 61 deletions(-)
> > 
> > diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
> > index 7af80dd2f2..3e8d89e950 100644
> > --- a/tests/intel/xe_dma_buf_sync.c
> > +++ b/tests/intel/xe_dma_buf_sync.c
> > @@ -21,69 +21,48 @@
> >   #include "xe/xe_spin.h"
> >   #include <string.h>
> >   #include <linux/dma-buf.h>
> > +#include <lib/dmabuf_sync_file.h>
> >   #include <poll.h>
> >   #define MAX_N_BO	16
> >   #define N_FD		2
> > -#define READ_SYNC	(0x1 << 0)
> > -
> > -struct igt_dma_buf_sync_file {
> > -	__u32 flags;
> > -	__s32 fd;
> > -};
> > -
> > -#define IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE \
> > -	_IOWR(DMA_BUF_BASE, 2, struct igt_dma_buf_sync_file)
> > -
> > -static int dmabuf_export_sync_file(int dmabuf, uint32_t flags)
> > -{
> > -	struct igt_dma_buf_sync_file arg;
> > -
> > -	arg.flags = flags;
> > -	arg.fd = -1;
> > -	do_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE, &arg);
> > -
> > -	return arg.fd;
> > -}
> > -
> > -static bool dmabuf_busy(int dmabuf, uint32_t flags)
> > -{
> > -	struct pollfd pfd = { .fd = dmabuf };
> > -
> > -	/* If DMA_BUF_SYNC_WRITE is set, we don't want to set POLLIN or
> > -	 * else poll() may return a non-zero value if there are only read
> > -	 * fences because POLLIN is ready even if POLLOUT isn't.
> > -	 */
> > -	if (flags & DMA_BUF_SYNC_WRITE)
> > -		pfd.events |= POLLOUT;
> > -	else if (flags & DMA_BUF_SYNC_READ)
> > -		pfd.events |= POLLIN;
> > -
> > -	return poll(&pfd, 1, 0) == 0;
> > -}
> > -
> > -static bool sync_file_busy(int sync_file)
> > -{
> > -	struct pollfd pfd = { .fd = sync_file, .events = POLLIN };
> > -	return poll(&pfd, 1, 0) == 0;
> > -}
> > +#define WRITE_SYNC	(0x1 << 0)
> > +#define READ_SYNC	(0x1 << 1)
> > +#define READ_WRITE_SYNC	(0x1 << 2)
> > +#define WRITE_READ_SYNC	(0x1 << 3)
> >   /**
> > - * SUBTEST: export-dma-buf-once
> > - * Description: Test exporting a sync file from a dma-buf
> > + * SUBTEST: export-dma-buf-once-write-sync
> > + * Description: Test exporting a sync file from a dma-buf with write deps once
> >    * Functionality: export
> >    *
> >    * SUBTEST: export-dma-buf-once-read-sync
> > - * Description: Test export prime BO as sync file and verify business
> > + * Description: Test exporting a sync file from a dma-buf with read deps once
> > + * Functionality: export
> > + *
> > + * SUBTEST: export-dma-buf-once-read-write-sync
> > + * Description: Test exporting a sync file from a dma-buf with read followed by write deps once
> >    * Functionality: export
> >    *
> > - * SUBTEST: export-dma-buf-many
> > - * Description: Test exporting many sync files from a dma-buf
> > + * SUBTEST: export-dma-buf-once-write-read-sync
> > + * Description: Test exporting a sync file from a dma-buf with write followed by read deps once
> > + * Functionality: export
> > + *
> > + * SUBTEST: export-dma-buf-many-write-sync
> > + * Description: Test exporting a sync file from a dma-buf with write deps many times
> >    * Functionality: export
> >    *
> >    * SUBTEST: export-dma-buf-many-read-sync
> > - * Description: Test export many prime BO as sync file and verify business
> > + * Description: Test exporting a sync file from a dma-buf with read deps many times
> > + * Functionality: export
> > + *
> > + * SUBTEST: export-dma-buf-many-read-write-sync
> > + * Description: Test exporting a sync file from a dma-buf with read followed by write deps many times
> > + * Functionality: export
> > + *
> > + * SUBTEST: export-dma-buf-many-write-read-sync
> > + * Description: Test exporting a sync file from a dma-buf with write followed by read deps many times
> >    * Functionality: export
> >    */
> > @@ -145,7 +124,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
> >   		uint64_t sdi_addr = addr + sdi_offset;
> >   		uint64_t spin_offset = (char *)&data[i]->spin - (char *)data[i];
> >   		struct drm_xe_sync sync[2] = {
> > -			{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, },
> > +			{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> >   			{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> >   		};
> >   		struct drm_xe_exec exec = {
> > @@ -153,26 +132,41 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
> >   			.syncs = to_user_pointer(sync),
> >   		};
> >   		struct xe_spin_opts spin_opts = { .addr = addr + spin_offset, .preempt = true };
> > -		uint32_t syncobj;
> > +		uint32_t syncobj, syncobj_signal;
> >   		int b = 0;
> > -		int sync_fd;
> > +		int sync_fd, syncobj_fd;
> >   		/* Write spinner on FD[0] */
> >   		xe_spin_init(&data[i]->spin, &spin_opts);
> > +		syncobj_signal = syncobj_create(fd[0], 0);
> >   		exec.exec_queue_id = exec_queue[0];
> >   		exec.address = spin_opts.addr;
> > +		exec.num_syncs = 1;
> > +		sync[0].handle = syncobj_signal;
> >   		xe_exec(fd[0], &exec);
> > +
> > +		syncobj_fd = syncobj_handle_to_fd(fd[0], syncobj_signal,
> > +						  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE);
> > +
> > +		/* Set read / write deps */
> > +		if (flags & (READ_SYNC | READ_WRITE_SYNC))
> > +			dmabuf_import_sync_file(dma_buf_fd[i],
> > +						DMA_BUF_SYNC_READ, syncobj_fd);
> > +		else
> > +			dmabuf_import_sync_file(dma_buf_fd[i],
> > +						DMA_BUF_SYNC_WRITE, syncobj_fd);
> > +
> >   		/* Export prime BO as sync file and veify business */
> > -		if (flags & READ_SYNC)
> > +		if (flags & (READ_SYNC | WRITE_READ_SYNC))
> >   			sync_fd = dmabuf_export_sync_file(dma_buf_fd[i],
> >   							  DMA_BUF_SYNC_READ);
> >   		else
> >   			sync_fd = dmabuf_export_sync_file(dma_buf_fd[i],
> >   							  DMA_BUF_SYNC_WRITE);
> >   		xe_spin_wait_started(&data[i]->spin);
> > -		igt_assert(sync_file_busy(sync_fd));
> > -		igt_assert(dmabuf_busy(dma_buf_fd[i], DMA_BUF_SYNC_READ));
> > +		if (!(flags & READ_SYNC))
> > +			igt_assert(sync_file_busy(sync_fd));
> >   		/* Convert sync file to syncobj */
> >   		syncobj = syncobj_create(fd[1], 0);
> > @@ -185,6 +179,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
> >   		data[i]->batch[b++] = 0xc0ffee;
> >   		data[i]->batch[b++] = MI_BATCH_BUFFER_END;
> >   		igt_assert(b <= ARRAY_SIZE(data[i]->batch));
> > +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> >   		sync[0].handle = syncobj;
> >   		sync[1].handle = syncobj_create(fd[1], 0);
> >   		exec.exec_queue_id = exec_queue[1];
> > @@ -194,9 +189,15 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
> >   		/* Verify exec blocked on spinner / prime BO */
> >   		usleep(5000);
> > -		igt_assert(!syncobj_wait(fd[1], &sync[1].handle, 1, 1, 0,
> > -					 NULL));
> > -		igt_assert_eq(data[i]->data, 0x0);
> > +		if (flags & READ_SYNC) {
> > +			igt_assert(syncobj_wait(fd[1], &sync[1].handle, 1, INT64_MAX,
> > +						0, NULL));
> > +			igt_assert_eq(data[i]->data, 0xc0ffee);
> > +		} else {
> > +			igt_assert(!syncobj_wait(fd[1], &sync[1].handle, 1, 1, 0,
> > +						 NULL));
> > +			igt_assert_eq(data[i]->data, 0x0);
> > +		}
> >   		/* End spinner and verify exec complete */
> >   		xe_spin_end(&data[i]->spin);
> > @@ -205,9 +206,11 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
> >   		igt_assert_eq(data[i]->data, 0xc0ffee);
> >   		/* Clean up */
> > +		syncobj_destroy(fd[0], syncobj_signal);
> >   		syncobj_destroy(fd[1], sync[0].handle);
> >   		syncobj_destroy(fd[1], sync[1].handle);
> >   		close(sync_fd);
> > +		close(syncobj_fd);
> >   		addr += bo_size;
> >   	}
> > @@ -238,11 +241,11 @@ igt_main
> >   			}
> >   	}
> > -	igt_subtest("export-dma-buf-once")
> > -		test_export_dma_buf(hwe0, hwe1, 1, 0);
> > +	igt_subtest("export-dma-buf-once-write-sync")
> > +		test_export_dma_buf(hwe0, hwe1, 1, WRITE_SYNC);
> > -	igt_subtest("export-dma-buf-many")
> > -		test_export_dma_buf(hwe0, hwe1, 16, 0);
> > +	igt_subtest("export-dma-buf-many-write-sync")
> > +		test_export_dma_buf(hwe0, hwe1, 16, WRITE_SYNC);
> >   	igt_subtest("export-dma-buf-once-read-sync")
> >   		test_export_dma_buf(hwe0, hwe1, 1, READ_SYNC);
> > @@ -250,6 +253,18 @@ igt_main
> >   	igt_subtest("export-dma-buf-many-read-sync")
> >   		test_export_dma_buf(hwe0, hwe1, 16, READ_SYNC);
> > +	igt_subtest("export-dma-buf-once-read-write-sync")
> > +		test_export_dma_buf(hwe0, hwe1, 1, READ_WRITE_SYNC);
> > +
> > +	igt_subtest("export-dma-buf-many-read-write-sync")
> > +		test_export_dma_buf(hwe0, hwe1, 16, READ_WRITE_SYNC);
> > +
> > +	igt_subtest("export-dma-buf-once-write-read-sync")
> > +		test_export_dma_buf(hwe0, hwe1, 1, WRITE_READ_SYNC);
> > +
> > +	igt_subtest("export-dma-buf-many-write-read-sync")
> > +		test_export_dma_buf(hwe0, hwe1, 16, WRITE_READ_SYNC);
> > +
> >   	igt_fixture
> >   		drm_close_driver(fd);
> >   }
